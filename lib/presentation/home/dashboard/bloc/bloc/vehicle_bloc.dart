import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/datasource/vehicle_remote_datasource.dart';
import 'package:ecommerce_app/data/model/responses/vehicle_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecommerce_app/data/datasource/auth_local_datasource.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';
part 'vehicle_bloc.freezed.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final VehicleRemoteDatasource vehicleRemoteDatasource;

  // Terima AuthLocalDataSource melalui konstruktor
  VehicleBloc(AuthLocalDataSource authLocalDataSource)
      : vehicleRemoteDatasource = VehicleRemoteDatasource(authLocalDataSource),
        super(_Initial()) {
    on<_GetVehicle>((event, emit) async {
      emit(_Loading());
      final response = await vehicleRemoteDatasource.getVehicles();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
