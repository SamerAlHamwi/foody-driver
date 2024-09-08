import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/di/dependency_manager.dart';
import '../notifier/profile_settings_notifier.dart';
import '../state/profile_settings_state.dart';

final profileSettingsProvider =
    StateNotifierProvider<ProfileSettingsNotifier, ProfileSettingsState>(
  (ref) => ProfileSettingsNotifier(userRepository),
);
