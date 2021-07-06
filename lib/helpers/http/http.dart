import 'package:dio/dio.dart';

class Http {
  Dio _dio;
  CancelToken _cancelToken;
  Options _options;
  Http()
      : _dio = new Dio(),
        _cancelToken = CancelToken(),
        _options = Options();

  Future<dynamic> getRequest(String _url) async {
    Response _response =
        await _dio.get(_url, cancelToken: _cancelToken, options: _options);
    try {
      return _response.data;
    } catch (e) {
      print(e);
    }
  }
}
