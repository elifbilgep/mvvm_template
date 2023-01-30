import 'package:flutter/material.dart';
import 'package:mvvm_template/view/auth/login/viewModel/login_view_model.dart';

import '../../../../core/base/view/base_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Scaffold.of(context).showBottomSheet((context) {
          return Container();
        });
      }),
    );
  }
}
