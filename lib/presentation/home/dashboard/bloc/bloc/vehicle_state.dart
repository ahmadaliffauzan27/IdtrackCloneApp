part of 'vehicle_bloc.dart';

@freezed
class VehicleState with _$VehicleState {
  const factory VehicleState.initial() = _Initial;
  const factory VehicleState.loading() = _Loading;
  const factory VehicleState.loaded(List<VehicleResponseModel> model) = _Loaded;
  const factory VehicleState.error(String message) = _Error;
}
