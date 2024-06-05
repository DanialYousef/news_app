//سلمان حمود
import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        }));
  }

  static Future<Response> getData({
    required String url,
    required dynamic query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
//عقيل زهير زاهر
  static Future<Response?> postData({
    required String url,
    required Map<String , dynamic> data,
    dynamic query,
  }) async {
     try{
       return await dio.post(
           url,
           data: data,
       );
     }catch(e){
        print(e.toString());
       };
  }
}
