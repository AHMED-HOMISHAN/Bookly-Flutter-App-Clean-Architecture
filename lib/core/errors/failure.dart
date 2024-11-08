import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure({
    required this.message,
  });
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
  factory ServerFailure.fromDioError(DioError e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout with api server');

      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send timeout with api server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Recive timeout with api server');

      case DioExceptionType.badCertificate:
        return ServerFailure(
            message: 'bad Certificate timeout with api server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            respone: e.response!.data, statusCode: e.response!.statusCode!);
      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request to server was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure(message: 'No Internet');

      case DioExceptionType.unknown:
        return ServerFailure(
            message: 'Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse({
    required int statusCode,
    required dynamic respone,
  }) {
    if (statusCode == 404) {
      return ServerFailure(
          message: "Your request wase not found, Please try later");
    } else if (statusCode >= 500) {
      return ServerFailure(
          message: "There is a problem with server, Please try later");
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(message: respone['error']['message']);
    } else {
      return ServerFailure(message: "There was an error, Please try later");
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message});
}
