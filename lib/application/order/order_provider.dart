import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/di/dependency_manager.dart';
import 'order_notifier.dart';
import 'order_state.dart';

final orderProvider = StateNotifierProvider<OrderNotifier, OrderState>(
  (ref) => OrderNotifier(orderRepository),
);
