import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vender/application/order/order_notifier.dart';
import 'package:vender/application/order/order_provider.dart';
import 'package:vender/presentation/component/loading.dart';

import '../../../infrastructure/services/services.dart';
import '../../component/components.dart';
import '../../styles/style.dart';

class OrdersPage extends ConsumerStatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends ConsumerState<OrdersPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late RefreshController activeController;
  late RefreshController availableController;
  late OrderNotifier event;

  final _tabs = [
    Tab(
      child: Text(
        AppHelpers.getTranslation(TrKeys.activeOrders),
      ),
    ),
    Tab(
      child: Text(
        AppHelpers.getTranslation(TrKeys.availableOrders),
      ),
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    activeController = RefreshController();
    availableController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(orderProvider.notifier)
        ..fetchActiveOrders(context)
        ..fetchAvailableOrders(context);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    event = ref.read(orderProvider.notifier);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    activeController.dispose();
    availableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderProvider);
    return Scaffold(
      backgroundColor: Style.greyColor,
      body: Column(
        children: [
          CustomAppBar(
            bottomPadding: 16.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.orders),
                  style: Style.interSemi(size: 18.sp),
                ),
                Row(
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.thereAreOrders),
                      style:
                          Style.interRegular(size: 12.sp, letterSpacing: -0.3),
                    ),
                    Text(
                      " ${state.totalActiveOrder} ",
                      style:
                          Style.interRegular(size: 12.sp, letterSpacing: -0.3),
                    ),
                    Text(
                      AppHelpers.getTranslation(TrKeys.orders).toLowerCase(),
                      style:
                          Style.interRegular(size: 12.sp, letterSpacing: -0.3),
                    ),
                  ],
                ),
              ],
            ),
          ),
          16.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  CustomTabBar(
                    tabController: _tabController,
                    tabs: _tabs,
                  ),
                  Expanded(
                    child: TabBarView(controller: _tabController, children: [
                      state.isActiveLoading
                          ? const Loading()
                          : SmartRefresher(
                              enablePullDown: true,
                              enablePullUp: true,
                              onRefresh: () {
                                event.fetchActiveOrdersPage(
                                    context, activeController,
                                    isRefresh: true);
                              },
                              onLoading: () {
                                event.fetchActiveOrdersPage(
                                  context,
                                  activeController,
                                );
                              },
                              controller: activeController,
                              child: state.activeOrders.isNotEmpty
                                  ? ListView.builder(
                                      padding: EdgeInsets.only(
                                          top: 30.h,
                                          bottom: MediaQuery.of(context)
                                                  .padding
                                                  .bottom +
                                              42.h),
                                      shrinkWrap: true,
                                      itemCount: state.activeOrders.length,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return OrdersItem(
                                          isActiveButton: true,
                                          isOrder: true,
                                          order: state.activeOrders[index],
                                        );
                                      })
                                  : _resultEmpty(),
                            ),
                      state.isAvailableLoading
                          ? const Loading()
                          : SmartRefresher(
                              enablePullDown: true,
                              enablePullUp: true,
                              onRefresh: () {
                                event.fetchAvailableOrdersPage(
                                    context, availableController,
                                    isRefresh: true);
                              },
                              onLoading: () {
                                event.fetchAvailableOrdersPage(
                                  context,
                                  availableController,
                                );
                              },
                              controller: availableController,
                              child: state.availableOrders.isNotEmpty
                                  ? ListView.builder(
                                      padding: EdgeInsets.only(
                                          top: 30.h,
                                          bottom: MediaQuery.paddingOf(context)
                                                  .bottom +
                                              42.h),
                                      shrinkWrap: true,
                                      itemCount: state.availableOrders.length,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return OrdersItem(
                                          isOrder: true,
                                          order: state.availableOrders[index],
                                        );
                                      })
                                  : _resultEmpty(),
                            ),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const PopButton(),
    );
  }
}

Widget _resultEmpty() {
  return Column(
    children: [
      16.verticalSpace,
      Lottie.asset("assets/lottie/empty-box.json"),
      Text(
        AppHelpers.getTranslation(TrKeys.nothingFound),
        style: Style.interSemi(size: 18.sp),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Text(
          AppHelpers.getTranslation(TrKeys.trySearchingAgain),
          style: Style.interRegular(size: 14.sp),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
