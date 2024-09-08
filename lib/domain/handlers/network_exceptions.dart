import 'dart:io';
import 'package:dio/dio.dart';

class NetworkExceptions {
  static int getDioStatus(error) {
    if (error is Exception) {
      try {
        int? status;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              status = 500;
              break;
            case DioErrorType.connectTimeout:
              status = 501;
              break;
            case DioErrorType.other:
              status = 500;
              break;
            case DioErrorType.receiveTimeout:
              status = 501;
              break;
            case DioErrorType.response:
              switch (error.response!.statusCode) {
                case 400:
                  status = 400;
                  break;
                case 401:
                  status = 401;
                  break;
                case 403:
                  status = 403;
                  break;
                case 404:
                  status = 404;
                  break;
                case 409:
                  status = 409;
                  break;
                case 422:
                  status = 422;
                  break;
                case 408:
                  status = 408;
                  break;
                case 500:
                  status = 500;
                  break;
                case 503:
                  status = 503;
                  break;
                default:
                  status = 500;
              }
              break;
            case DioErrorType.sendTimeout:
              status = 501;
              break;
          }
        } else if (error is SocketException) {
          status = 501;
        } else {
          status = 501;
        }
        return status;
      } on FormatException catch (_) {
        return 500;
      } catch (_) {
        return 500;
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return 500;
      } else {
        return 500;
      }
    }
  }
}
