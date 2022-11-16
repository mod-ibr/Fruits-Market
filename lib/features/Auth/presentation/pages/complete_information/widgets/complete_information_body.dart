import 'package:flutter/material.dart';
import 'package:fruits_market/core/widgets/custom_buttons.dart';
import 'package:fruits_market/core/widgets/space_widget.dart';
import 'package:fruits_market/features/Auth/presentation/pages/complete_information/widgets/complete_information_item.dart';
import 'package:fruits_market/features/main%20Page/presentation/mainPageView.dart';
import 'package:get/get.dart';
import 'package:fruits_market/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:dartz/dartz.dart';

class CompleteInformationBody extends StatelessWidget {
  const CompleteInformationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const VerticalSpace(10),
            const CompleteInfoItem(
              text: 'Enter your name',
            ),
            const VerticalSpace(2),
            const CompleteInfoItem(
              text: 'Enter your phone number',
            ),
            const VerticalSpace(2),
            const CompleteInfoItem(
              maxLines: 5,
              text: 'Enter your address',
            ),
            const VerticalSpace(5),
            CustomGeneralButton(
              text: 'Login',
              onTap: () async {
                final auth = await AuthRepoImpl().loginWithGoogle();
                //final auth = await AuthRepoImpl().loginWithFacebook();
                auth.fold((l) {}, (r) {
                  print("ERROR IN GOOGLESIGN IN");
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
