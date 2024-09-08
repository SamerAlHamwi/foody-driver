// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../pages/auth/become_driver/become_driver.dart' as _i4;
import '../pages/pages.dart' as _i1;
import '../pages/parcel/parcels_page.dart' as _i3;
import '../pages/parcels_history/parcel_history.dart' as _i2;
import '../pages/profile/delivery_zone/delivery_zone_page.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    NoConnectionRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.NoConnectionPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    IncomeRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.IncomePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    StoryRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StoryPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ProfilePage(),
      );
    },
    NotificationListRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.NotificationListPage(),
      );
    },
    OrderHistoryRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.OrderHistoryPage(),
      );
    },
    ParcelHistoryRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ParcelHistoryPage(),
      );
    },
    OrdersRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.OrdersPage(),
      );
    },
    ParcelsRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ParcelsPage(),
      );
    },
    BecomeDriverRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i4.BecomeDriverPage(),
      );
    },
    DeliveryZoneRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i5.DeliveryZonePage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          NoConnectionRoute.name,
          path: '/no-connection',
        ),
        _i6.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i6.RouteConfig(
          IncomeRoute.name,
          path: '/income',
        ),
        _i6.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i6.RouteConfig(
          StoryRoute.name,
          path: '/story',
        ),
        _i6.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i6.RouteConfig(
          NotificationListRoute.name,
          path: '/list-notification',
        ),
        _i6.RouteConfig(
          OrderHistoryRoute.name,
          path: '/order-history',
        ),
        _i6.RouteConfig(
          ParcelHistoryRoute.name,
          path: '/parcel-history',
        ),
        _i6.RouteConfig(
          OrdersRoute.name,
          path: '/orders',
        ),
        _i6.RouteConfig(
          ParcelsRoute.name,
          path: '/parcels',
        ),
        _i6.RouteConfig(
          BecomeDriverRoute.name,
          path: '/become-driver',
        ),
        _i6.RouteConfig(
          DeliveryZoneRoute.name,
          path: '/delivery-zone',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i1.NoConnectionPage]
class NoConnectionRoute extends _i6.PageRouteInfo<void> {
  const NoConnectionRoute()
      : super(
          NoConnectionRoute.name,
          path: '/no-connection',
        );

  static const String name = 'NoConnectionRoute';
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i1.IncomePage]
class IncomeRoute extends _i6.PageRouteInfo<void> {
  const IncomeRoute()
      : super(
          IncomeRoute.name,
          path: '/income',
        );

  static const String name = 'IncomeRoute';
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.StoryPage]
class StoryRoute extends _i6.PageRouteInfo<void> {
  const StoryRoute()
      : super(
          StoryRoute.name,
          path: '/story',
        );

  static const String name = 'StoryRoute';
}

/// generated route for
/// [_i1.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i1.NotificationListPage]
class NotificationListRoute extends _i6.PageRouteInfo<void> {
  const NotificationListRoute()
      : super(
          NotificationListRoute.name,
          path: '/list-notification',
        );

  static const String name = 'NotificationListRoute';
}

/// generated route for
/// [_i1.OrderHistoryPage]
class OrderHistoryRoute extends _i6.PageRouteInfo<void> {
  const OrderHistoryRoute()
      : super(
          OrderHistoryRoute.name,
          path: '/order-history',
        );

  static const String name = 'OrderHistoryRoute';
}

/// generated route for
/// [_i2.ParcelHistoryPage]
class ParcelHistoryRoute extends _i6.PageRouteInfo<void> {
  const ParcelHistoryRoute()
      : super(
          ParcelHistoryRoute.name,
          path: '/parcel-history',
        );

  static const String name = 'ParcelHistoryRoute';
}

/// generated route for
/// [_i1.OrdersPage]
class OrdersRoute extends _i6.PageRouteInfo<void> {
  const OrdersRoute()
      : super(
          OrdersRoute.name,
          path: '/orders',
        );

  static const String name = 'OrdersRoute';
}

/// generated route for
/// [_i3.ParcelsPage]
class ParcelsRoute extends _i6.PageRouteInfo<void> {
  const ParcelsRoute()
      : super(
          ParcelsRoute.name,
          path: '/parcels',
        );

  static const String name = 'ParcelsRoute';
}

/// generated route for
/// [_i4.BecomeDriverPage]
class BecomeDriverRoute extends _i6.PageRouteInfo<void> {
  const BecomeDriverRoute()
      : super(
          BecomeDriverRoute.name,
          path: '/become-driver',
        );

  static const String name = 'BecomeDriverRoute';
}

/// generated route for
/// [_i5.DeliveryZonePage]
class DeliveryZoneRoute extends _i6.PageRouteInfo<void> {
  const DeliveryZoneRoute()
      : super(
          DeliveryZoneRoute.name,
          path: '/delivery-zone',
        );

  static const String name = 'DeliveryZoneRoute';
}
