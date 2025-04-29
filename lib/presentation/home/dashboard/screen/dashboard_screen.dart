import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Simulated API response
  final List<Map<String, dynamic>> apiResponse = [
    {"DeviceID": 4210, "Nopol": "B2152BZP"},
    {"DeviceID": 4211, "Nopol": "B9169BCE"},
    {"DeviceID": 4212, "Nopol": "B9347BCR"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 12, 12),
              child: Text(
                'Hello, Welcome Back! 👋',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Here are your vehicles:',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: apiResponse.length,
                itemBuilder: (context, index) {
                  final item = apiResponse[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blueAccent,
                        child: Icon(
                          Icons.directions_car,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        item['Nopol'],
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        'Device ID: ${item['DeviceID']}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey[600],
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 16.0,
                      ),
                      onTap: () {
                        // Handle tap action
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Tapped on ${item['Nopol']}'),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:ecommerce_app/common/components/font_weight.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../common/constants/app_text_style.dart';
// import '../../../../common/constants/colors.dart';
// import '../bloc/bloc/vehicle_bloc.dart';
// import '../widgets/container_product.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Memanggil event untuk mengambil data kendaraan saat layar dibuka
//     context.read<VehicleBloc>().add(const VehicleEvent.getVehicle());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             // Header atau bagian atas halaman
//             Stack(
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   color: PrimaryColor.pr10,
//                   height: 240,
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 35,
//                                   width: 2,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'Hello, Welcome Back!',
//                                       style: AppTextStyle.body4.medium
//                                           .copyWith(color: Colors.white),
//                                     ),
//                                     Text(
//                                       'Here are your vehicles:',
//                                       style: AppTextStyle.body4.regular
//                                           .copyWith(color: Colors.white),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const Spacer(),
//                             IconButton(
//                               onPressed: () {
//                                 // Handle notification icon press
//                               },
//                               icon: Image.asset(
//                                 'assets/images/icon_notification_home.png',
//                                 color: Colors.white,
//                                 height: 24.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 0,
//                   top: 0,
//                   child: Image.asset(
//                     'assets/images/ornamen.png',
//                     width: 180,
//                     height: 135,
//                   ),
//                 ),
//               ],
//             ),

//             // Daftar kendaraan (menggunakan VehicleBloc)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 50),
//                   Text(
//                     'Your Vehicles',
//                     style: AppTextStyle.body3.semiBold,
//                   ),
//                   const SizedBox(height: 24),
//                   BlocBuilder<VehicleBloc, VehicleState>(
//                     builder: (context, state) {
//                       return state.maybeWhen(
//                         orElse: () {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         },
//                         loaded: (model) {
//                           return Padding(
//                             padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
//                             child: GridView.builder(
//                               shrinkWrap: true,
//                               physics: const NeverScrollableScrollPhysics(),
//                               gridDelegate:
//                                   const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2,
//                                 crossAxisSpacing: 10.0,
//                                 mainAxisSpacing: 10.0,
//                                 childAspectRatio: 0.8,
//                               ),
//                               itemCount: model.length,
//                               itemBuilder: (context, index) => ContainerVehicle(
//                                 data: model,
//                               ),
//                             ),
//                           );
//                         },
//                         error: (message) {
//                           return Center(
//                             child: Text(
//                               message,
//                               style: TextStyle(color: Colors.red, fontSize: 16),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
