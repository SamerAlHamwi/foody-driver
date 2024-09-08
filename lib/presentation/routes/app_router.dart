import 'package:auto_route/auto_route.dart';
import 'package:vender/presentation/pages/auth/become_driver/become_driver.dart';
import 'package:vender/presentation/pages/parcel/parcels_page.dart';
import 'package:vender/presentation/pages/parcels_history/parcel_history.dart';

import '../pages/pages.dart';
import '../pages/profile/delivery_zone/delivery_zone_page.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    CupertinoRoute(path: '/', page: SplashPage),
    CupertinoRoute(path: '/no-connection', page: NoConnectionPage),
    CupertinoRoute(path: '/login', page: LoginPage),
    CupertinoRoute(path: '/income', page: IncomePage),
    CupertinoRoute(path: '/home', page: HomePage),
    CupertinoRoute(path: '/story', page: StoryPage),
    CupertinoRoute(path: '/profile', page: ProfilePage),
    CupertinoRoute(path: '/list-notification', page: NotificationListPage),
    CupertinoRoute(path: '/order-history', page: OrderHistoryPage),
    CupertinoRoute(path: '/parcel-history', page: ParcelHistoryPage),
    CupertinoRoute(path: '/orders', page: OrdersPage),
    CupertinoRoute(path: '/parcels', page: ParcelsPage),
    CupertinoRoute(path: '/become-driver', page: BecomeDriverPage),
    CupertinoRoute(path: '/delivery-zone', page: DeliveryZonePage),
  ],
)
class $AppRouter {}
