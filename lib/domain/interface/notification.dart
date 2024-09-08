import 'package:vender/domain/handlers/api_result.dart';
import 'package:vender/infrastructure/models/models.dart';

abstract class NotificationRepositoryFacade {

  Future<ApiResult<NotificationResponse>> getNotifications({
    int? page,
  });

  Future<ApiResult<NotificationResponse>> getAllNotifications();

  Future<ApiResult<dynamic>> readOne({
    int? id,
  });

  Future<ApiResult<NotificationResponse>> readAll();


  Future<ApiResult<CountNotificationModel>> getCount();
}
