import 'package:dio/dio.dart';

class DioClient {
 static var client = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 20)
    )
  );
}
