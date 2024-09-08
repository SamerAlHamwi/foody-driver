import 'package:dio/dio.dart';

import '../../infrastructure/services/services.dart';
import 'token_interceptor.dart';

class HttpService {
  Dio client({bool requireAuth = false, bool routing = false}) => Dio(
        BaseOptions(
          baseUrl: routing ? AppConstants.drawingBaseUrl : AppConstants.baseUrl,
          connectTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000,
          sendTimeout: 60 * 1000,
          headers: {
            'Accept':
                'application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8',
            'Content-type': 'application/json'
          },
        ),
      )
        ..interceptors.add(TokenInterceptor(requireAuth: requireAuth))
        ..interceptors.add(LogInterceptor(requestBody: true,responseBody: true));
}
