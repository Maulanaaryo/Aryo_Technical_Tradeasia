part of 'detail_bloc.dart';

@immutable
sealed class DetailState {}

final class DetailInitial extends DetailState {}

final class DetailLoading extends DetailState {}

final class DetailLoaded extends DetailState {
  final DetailResponseModel model;

  DetailLoaded({required this.model});
}

final class DetailError extends DetailState {
  final String message;

  DetailError({required this.message});
}
