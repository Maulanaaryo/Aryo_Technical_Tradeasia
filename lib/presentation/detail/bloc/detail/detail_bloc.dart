import 'package:bloc/bloc.dart';
import 'package:flutter_tradeasia/data/datasources/detail_remote_datasource.dart';
import 'package:flutter_tradeasia/data/models/detail_response_model.dart';
import 'package:meta/meta.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<GetDetailEvent>((event, emit) async {
      emit(DetailLoading());
      final result = await DetailRemoteDataSource().getDetail();
      result.fold((error) => emit(DetailError(message: error)),
          (success) => emit(DetailLoaded(model: success)));
    });
  }
}
