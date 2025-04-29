import 'package:ecommerce_app/common/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/datasource/auth_local_datasource.dart';
import '../../../../data/model/request/login_request_model.dart';
import '../../../home/navbar/navbar_screen.dart';
import '../bloc/bloc/login_bloc.dart';

// ignore: must_be_immutable
class LoginEmailPasswordButton extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginEmailPasswordButton(
      {super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            success: (data) async {
              AuthLocalDataSource().saveAuthData(data);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavbarScreen(),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Login success'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error),
                  backgroundColor: Colors.red,
                ),
              );
            });
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return Button.filled(
              onPressed: () {
                final data = LoginRequestModel(
                  // username: email.text,
                  // password: password.text,
                  username: 'Alif@idtrack.co.id',
                  password: 'Idtrack123',
                );
                context.read<LoginBloc>().add(LoginEvent.login(data));
              },
              label: 'Masuk',
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
