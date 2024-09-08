import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../presentation/component/components.dart';
import '../../presentation/styles/style.dart';
import '../models/models.dart';
import 'img_service.dart';
import 'local_storage.dart';
import 'tr_keys.dart';

class AppHelpers {
  AppHelpers._();

  static String numberFormat({num? number, String? symbol, bool? isOrder}) {
    if (LocalStorage.getSelectedCurrency()?.position == "before") {
      return NumberFormat.currency(
        customPattern: '\u00a4#,###.#',
        symbol: (isOrder ?? false)
            ? symbol
            : LocalStorage.getSelectedCurrency()?.symbol,
        decimalDigits: 2,
      ).format(number ?? 0);
    } else {
      return NumberFormat.currency(
        customPattern: '#,###.#\u00a4',
        symbol: (isOrder ?? false)
            ? symbol
            : LocalStorage.getSelectedCurrency()?.symbol,
        decimalDigits: 2,
      ).format(number ?? 0);
    }
  }

  static String? getAppPhone() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'phone') {
        return setting.value;
      }
    }
    return '';
  }

  static String getAppName() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'title') {
        return setting.value ?? '';
      }
    }
    return '';
  }

  static bool getDriverCantEdit() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'driver_can_edit_credentials') {
        return setting.value == "0";
      }
    }
    return false;
  }

  static int getAppDeliveryTime() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'deliveryman_order_acceptance_time') {
        return int.parse(setting.value ?? '30');
      }
    }
    return int.parse('30');
  }

  static bool checkIsSvg(String? url) {
    if (url == null) {
      return false;
    }
    final length = url.length;
    return url.substring(length - 3, length) == 'svg';
  }

  static showNoConnectionSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: Text(
        'No internet connection',
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Style.white,
        ),
      ),
      action: SnackBarAction(
        label: 'Close',
        disabledTextColor: Colors.white,
        textColor: Colors.yellow,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showCheckTopSnackBar(BuildContext context, String text) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: text.isNotEmpty
            ? text
            : " Please check your credentials and try again",
      ),
    );
  }

  static showCheckTopSnackBarInfo(BuildContext context, String text) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: text,
      ),
    );
  }

  static String getTranslation(String trKey) {
    final Map<String, dynamic> translations = LocalStorage.getTranslations();
    return translations[trKey] ??
        (trKey.isNotEmpty
            ? trKey.replaceAll(".", " ").replaceAll("_", " ").replaceFirst(
                trKey.substring(0, 1), trKey.substring(0, 1).toUpperCase())
            : '');
  }

  static String getTranslationReverse(String trKey) {
    final Map<String, dynamic> translations = LocalStorage.getTranslations();
    for (int i = 0; i < translations.values.length; i++) {
      if (trKey == translations.values.elementAt(i)) {
        return translations.keys.elementAt(i);
      }
    }
    return trKey;
  }

  static void showCustomModalBottomSheet({
    required BuildContext context,
    required Widget modal,
    required bool isDarkMode,
    double radius = 16,
    bool isDrag = true,
    bool isExpanded = false,
    double paddingTop = 200,
    bool isDismissible = true,
  }) {
    showModalBottomSheet(
      isDismissible: isDismissible,
      enableDrag: isDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.r),
          topRight: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height - paddingTop.r,
      ),
      backgroundColor: Style.transparent,
      context: context,
      builder: (context) => BlurWrap(
        radius: BorderRadius.only(
          topRight: Radius.circular(12.r),
          topLeft: Radius.circular(12.r),
        ),
        child: Container(
          margin: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom,
          ),
          padding:
              EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
          decoration: BoxDecoration(
            color: Style.white.withOpacity(0.9),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12.r),
              topLeft: Radius.circular(12.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Style.black.withOpacity(0.25),
                blurRadius: 40,
                spreadRadius: 0,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                    color: Style.bottomSheetIconColor,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  margin: EdgeInsets.only(top: 8.h, bottom: 16.h),
                ),
                modal,
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void showCustomModalBottomSheetWithoutIosIcon({
    required BuildContext context,
    required Widget modal,
    required bool isDarkMode,
    double radius = 16,
    bool isDrag = true,
    double paddingTop = 200,
  }) {
    showModalBottomSheet(
      enableDrag: isDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.r),
          topRight: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height - paddingTop.r,
      ),
      backgroundColor: Style.transparent,
      context: context,
      builder: (context) => modal,
    );
  }

  static void showAlertDialog({
    required BuildContext context,
    required Widget child,
    double radius = 16,
  }) {
    Dialog alert = Dialog(
      backgroundColor: Style.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.r),
      ),
      insetPadding: EdgeInsets.all(16.r),
      child: child,
    );

    showDialog(
      context: context,
      useSafeArea: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static String errorHandler(e) {
    try {
      return (e.runtimeType == DioError)
          ? ((e as DioError).response?.data["message"] == "Bad request."
              ? (e.response?.data["params"] as Map).values.first[0]
              : e.response?.data["message"])
          : e.toString();
    } catch (s) {
      try {
        return (e.runtimeType == DioError)
            ? ((e as DioError).response?.data.toString().substring(
                    (e.response?.data.toString().indexOf("<title>") ?? 0) + 7,
                    e.response?.data.toString().indexOf("</title") ?? 0))
                .toString()
            : e.toString();
      } catch (r) {
        return (e.runtimeType == DioError)
            ? ((e as DioError).response?.data["error"]["message"]).toString()
            : e.toString();
      }
    }
  }

  static openDialogImagePicker({
    required BuildContext context,
    required ValueChanged<String> onSuccess,
  }) {
    return showDialog(
      context: context,
      builder: (_) {
        return Builder(
          builder: (colors) {
            return Dialog(
              backgroundColor: Style.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                margin: EdgeInsets.all(24.w),
                width: double.infinity,
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: Style.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.selectPhoto),
                      textAlign: TextAlign.center,
                      style: Style.interNormal(size: 18),
                    ),
                    const Divider(),
                    8.verticalSpace,
                    ButtonsBouncingEffect(
                      child: GestureDetector(
                        onTap: () => ImgService.getPhotoCamera(onSuccess),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.r, vertical: 8.r),
                          child: Row(
                            children: [
                              const Icon(FlutterRemix.camera_lens_line),
                              4.horizontalSpace,
                              Text(
                                AppHelpers.getTranslation(TrKeys.takePhoto),
                                textAlign: TextAlign.center,
                                style: Style.interNormal(size: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    8.verticalSpace,
                    ButtonsBouncingEffect(
                      child: GestureDetector(
                        onTap: () => ImgService.getPhotoGallery(onSuccess),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.r, vertical: 8.r),
                          child: Row(
                            children: [
                              const Icon(FlutterRemix.gallery_line),
                              4.horizontalSpace,
                              Text(
                                AppHelpers.getTranslation(
                                    TrKeys.chooseFromLibrary),
                                textAlign: TextAlign.center,
                                style: Style.interNormal(size: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    12.verticalSpace,
                    CustomButton(
                      background: Style.shimmerBase,
                      title: AppHelpers.getTranslation(TrKeys.skip),
                      onPressed: () {
                        onSuccess.call('');
                      },
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
