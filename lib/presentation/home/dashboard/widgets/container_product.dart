import 'package:ecommerce_app/common/components/font_weight.dart';
import 'package:ecommerce_app/data/model/responses/vehicle_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants/app_text_style.dart';
import '../../../../common/constants/colors.dart';
import '../../../../common/constants/variables.dart';

class ContainerVehicle extends StatelessWidget {
  final Vehicle data;

  const ContainerVehicle({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => VehicleDetailPage(
        //       vehicle: data,
        //     ),
        //   ),
        // );
      },
      child: Stack(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  // color: Colors.black.withOpacity(0.07),
                  color: PrimaryColor.pr10.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(2, 10),
                ),
              ],
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar kendaraan
                  // Container(
                  //   height: 120,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: ClipRRect(
                  //     borderRadius: const BorderRadius.only(
                  //         topLeft: Radius.circular(10),
                  //         topRight: Radius.circular(10)),
                  //     child: Image.network(
                  //       data.avatar.startsWith('http')
                  //           ? data.avatar
                  //           : '${Variables.baseUrl}/${data.avatar}',
                  //       fit: BoxFit.cover,
                  //       errorBuilder: (context, error, stackTrace) {
                  //         return const Icon(Icons.error);
                  //       },
                  //     ),
                  //   ),
                  // ),
                  // Indicator bar
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: PrimaryColor.pr10,
                    ),
                    child: null,
                  ),
                  Container(
                    width: 25,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: DangerColor.dng08,
                    ),
                    child: null,
                  ),
                  Container(
                    width: 12,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ScGreen.sc08,
                    ),
                    child: null,
                  ),
                  const SizedBox(height: 14),
                  // ID Kendaraan
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'ID: ${data.deviceId}', // Menampilkan ID kendaraan
                      style: AppTextStyle.body3.semiBold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Nomor Polisi
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Nopol: ${data.nopol}', // Menampilkan Nopol kendaraan
                      style: AppTextStyle.body4.regular,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Tombol untuk menambahkan kendaraan ke cart (opsional)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 50,
              height: 35,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: PrimaryColor.pr10,
              ),
              child: IconButton(
                onPressed: () {
                  // Menambahkan kendaraan ke dalam cart (jika diperlukan)
                  // context.read<CartBloc>().add(
                  //   CartEvent.add(CartModel(vehicle: data, quantity: 1)));
                },
                icon: const Icon(
                  Icons.add_sharp,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
