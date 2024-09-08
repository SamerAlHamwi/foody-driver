import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import 'app_constants.dart';

class LocalStorage {
  static SharedPreferences? _preferences;

  LocalStorage._();

 static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String? token) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyToken, token ?? '');
    }
  }

  static  String getToken() => _preferences?.getString(AppConstants.keyToken) ?? '';

  static _deleteToken() => _preferences?.remove(AppConstants.keyToken);

  static Future<void> setLanguageSelected(bool selected) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyLangSelected, selected);
    }
  }

  static bool getLanguageSelected() =>
      _preferences?.getBool(AppConstants.keyLangSelected) ?? false;

  static void deleteLangSelected() =>
      _preferences?.remove(AppConstants.keyLangSelected);

  static Future<void> setSettingsList(List<SettingsData> settings) async {
    if (_preferences != null) {
      final List<String> strings =
          settings.map((setting) => jsonEncode(setting.toJson())).toList();
      await _preferences!
          .setStringList(AppConstants.keyGlobalSettings, strings);
    }
  }

  static List<SettingsData> getSettingsList() {
    final List<String> settings =
        _preferences?.getStringList(AppConstants.keyGlobalSettings) ?? [];
    final List<SettingsData> settingsList = settings
        .map(
          (setting) => SettingsData.fromJson(jsonDecode(setting)),
        )
        .toList();
    return settingsList;
  }

  static Future<void> setTranslations(Map<String, dynamic>? translations) async {
    if (_preferences != null) {
      final String encoded = jsonEncode(translations);
      await _preferences!.setString(AppConstants.keyTranslations, encoded);
    }
  }

  static  Map<String, dynamic> getTranslations() {
    final String encoded =
        _preferences?.getString(AppConstants.keyTranslations) ?? '';
    if (encoded.isEmpty) {
      return {};
    }
    final Map<String, dynamic> decoded = jsonDecode(encoded);
    return decoded;
  }

  static Future<void> setAppThemeMode(bool isDarkMode) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyAppThemeMode, isDarkMode);
    }
  }

  static bool getAppThemeMode() =>
      _preferences?.getBool(AppConstants.keyAppThemeMode) ?? false;

  static Future<void> setLanguageData(LanguageData? langData) async {
    if (_preferences != null) {
      final String lang = jsonEncode(langData?.toJson());
      await _preferences!.setString(AppConstants.keyLanguageData, lang);
    }
  }

  static LanguageData? getLanguage() {
    final lang = _preferences?.getString(AppConstants.keyLanguageData);
    if (lang == null) {
      return null;
    }
    final map = jsonDecode(lang);
    if (map == null) {
      return null;
    }
    return LanguageData.fromJson(map);
  }

  static Future<void> setLangLtr(bool? backward) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyLangLtr, backward ?? false);
    }
  }

  static bool getLangLtr() => !(_preferences?.getBool(AppConstants.keyLangLtr) ?? false);

  static Future<void> setSelectedCurrency(CurrencyData? currency) async {
    if (_preferences != null) {
      final String currencyString = jsonEncode(currency?.toJson());
      await _preferences!
          .setString(AppConstants.keySelectedCurrency, currencyString);
    }
  }

  static CurrencyData? getSelectedCurrency() {
    final savedString =
        _preferences?.getString(AppConstants.keySelectedCurrency);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return CurrencyData.fromJson(map);
  }

  static Future<void> setAddressSelected(LatLng data) async {
    if (_preferences != null) {
      await _preferences!.setString(
          AppConstants.keyAddressSelected, jsonEncode(data.toJson()));
    }
  }

  static LatLng? getAddressSelected() {
    String dataString =
        _preferences?.getString(AppConstants.keyAddressSelected) ?? "";
    if (dataString.isNotEmpty) {
      LatLng data = LatLng.fromJson(jsonDecode(dataString)) ??
          const LatLng(AppConstants.demoLatitude, AppConstants.demoLongitude);
      return data;
    } else {
      return null;
    }
  }

  static Future<void> setUser(UserData? user) async {
    if (_preferences != null) {
      final String userString = user != null ? jsonEncode(user.toJson()) : '';
      await _preferences!.setString(AppConstants.keyUser, userString);
    }
  }

  static UserData? getUser() {
    final savedString = _preferences?.getString(AppConstants.keyUser);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return UserData.fromJson(map);
  }

  static void _deleteUser() => _preferences?.remove(AppConstants.keyUser);

  static Future<void> setDeliveryInfo(DeliveryResponse? info) async {
    if (_preferences != null) {
      final String infoString = ((info != null) ? jsonEncode(info.toJson()) : '');
      await _preferences!.setString(AppConstants.keyCarInfo, infoString);
    }
  }

  static DeliveryResponse? getDeliveryInfo() {
    final savedString = _preferences?.getString(AppConstants.keyCarInfo);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return DeliveryResponse.fromJson(map);
  }

  static void _deleteDeliveryInfo() => _preferences?.remove(AppConstants.keyCarInfo);

  static Future<void> setOnline(bool online) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyOnline, online);
    }
  }

  static bool getOnline() {
    final online = _preferences?.getBool(AppConstants.keyOnline);
    if (online == null) {
      return false;
    }
    return online;
  }

  static void _deleteOnline() => _preferences?.remove(AppConstants.keyOnline);

  static Future<void> setWallet(Wallet? wallet) async {
    if (_preferences != null) {
      final String walletString =
          wallet != null ? jsonEncode(wallet.toJson()) : '';
      await _preferences!.setString(AppConstants.keyWallet, walletString);
    }
  }

  static Wallet? getWallet() {
    final savedString = _preferences?.getString(AppConstants.keyWallet);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return Wallet.fromJson(map);
  }

  static void _deleteWallet() => _preferences?.remove(AppConstants.keyWallet);

  static void logout() {
    _deleteToken();
    _deleteUser();
    _deleteDeliveryInfo();
    _deleteWallet();
    _deleteOnline();
  }
}
