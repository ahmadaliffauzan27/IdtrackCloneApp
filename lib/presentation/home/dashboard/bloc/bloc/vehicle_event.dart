part of 'vehicle_bloc.dart';

@freezed
class VehicleEvent with _$VehicleEvent {
  const factory VehicleEvent.started() = _Started;
  const factory VehicleEvent.getVehicle() = _GetVehicle;
}
