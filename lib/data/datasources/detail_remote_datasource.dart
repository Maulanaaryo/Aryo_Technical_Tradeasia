import 'package:dartz/dartz.dart';
import 'package:flutter_tradeasia/data/models/detail_response_model.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';

class DetailRemoteDataSource {
  Future<Either<String, DetailResponseModel>> getDetail() async {
    final response = await http.get(
      Uri.parse(Variables.baseUrl),
    );

    if (response.statusCode == 200) {
      return Right(DetailResponseModel.fromJson(response.body));
    } else {
      return const Left('get detail failed');
    }
  }
}
