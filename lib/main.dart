import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/presentation/auth/login/screen/login_screen.dart';
import 'package:ecommerce_app/presentation/home/dashboard/bloc/bloc/vehicle_bloc.dart';
import 'package:ecommerce_app/presentation/auth/login/bloc/bloc/login_bloc.dart';
import 'package:ecommerce_app/data/datasource/auth_local_datasource.dart'; // Import AuthLocalDataSource

void main() {
  // Inisialisasi AuthLocalDataSource
  final authLocalDataSource = AuthLocalDataSource();

  // Menjalankan aplikasi dan menyertakan VehicleBloc dengan AuthLocalDataSource sebagai parameter
  runApp(MyApp(authLocalDataSource: authLocalDataSource));
}

class MyApp extends StatelessWidget {
  final AuthLocalDataSource authLocalDataSource;

  const MyApp({super.key, required this.authLocalDataSource});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        // Menyediakan VehicleBloc dengan AuthLocalDataSource
        BlocProvider<VehicleBloc>(
          create: (context) => VehicleBloc(authLocalDataSource),
        ),
        // Tambahkan BlocProvider lainnya jika diperlukan
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
