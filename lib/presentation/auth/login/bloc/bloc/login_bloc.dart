import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/datasource/auth_remote_datasource.dart';
import 'package:ecommerce_app/data/model/request/login_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/model/responses/auth_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(_Initial()) {
    on<_Login>((event, emit) async {
      final response = await AuthRemoteDataSource().login(event.data!);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
