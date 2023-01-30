import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_template/core/base/model/base_view_model.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.myContext = context;

  @override
  void init() {}
}
