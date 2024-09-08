import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../application/providers.dart';
import '../../../infrastructure/services/services.dart';
import '../../component/components.dart';
import '../../styles/style.dart';

class BarCodeScreen extends StatelessWidget {
  const BarCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        children: [
          const RestaurantItem(
            shopName: "Evos",
            shopImage:
                "https://dostavkainfo.uz/wp-content/uploads/2020/03/evos.png",
            shopText: "Combo #1",
            shopUid: "0",
            shopId: "0",
          ),
          16.verticalSpace,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Style.shimmerBase),
            ),
            padding: EdgeInsets.all(12.r),
            child: Row(
              children: [
                const Icon(
                  FlutterRemix.error_warning_fill,
                  color: Style.blueColor,
                ),
                12.horizontalSpace,
                RichText(
                  text: TextSpan(
                    text: AppHelpers.getTranslation(TrKeys.youWillShow),
                    style: Style.interRegular(size: 14.sp, letterSpacing: -0.3),
                    children: [
                      TextSpan(
                        text: AppHelpers.getTranslation(TrKeys.qRCode),
                        style:
                            Style.interSemi(size: 14.sp, letterSpacing: -0.3),
                      ),
                      TextSpan(
                        text: AppHelpers.getTranslation(TrKeys.toTheRestaurant),
                        style: Style.interRegular(
                            size: 14.sp, letterSpacing: -0.3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          24.verticalSpace,
          Image.asset(AppAssets.pngQr),
          24.verticalSpace,
          Consumer(
            builder: (context, ref, child) {
              return CustomButton(
                title: AppHelpers.getTranslation(TrKeys.showOnMap),
                icon: const Icon(
                  FlutterRemix.map_pin_range_fill,
                  color: Style.black,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  final Uint8List markerMarketIcon =
                      await AppHelpers.getBytesFromAsset(
                          AppAssets.pngMarket, 100).whenComplete((){

                      });
                  ref.read(homeProvider.notifier).getRoutingAll(
                        // ignore: use_build_context_synchronously
                        context: context,
                        start: LatLng(
                          LocalStorage
                                  .getAddressSelected()
                                  ?.latitude ??
                              AppConstants.demoLatitude,
                          LocalStorage
                                  .getAddressSelected()
                                  ?.longitude ??
                              AppConstants.demoLongitude,
                        ),
                        end: const LatLng(
                          41.285127,
                          69.172530,
                        ),
                        market: Marker(
                          markerId: const MarkerId("Shop"),
                          position: const LatLng(
                            41.285127,
                            69.172530,
                          ),
                          icon: BitmapDescriptor.fromBytes(markerMarketIcon),
                        ),
                      );
                },
              );
            },
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
