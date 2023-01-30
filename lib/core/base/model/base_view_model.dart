import 'package:flutter/material.dart';

abstract class BaseViewModel {
  late BuildContext myContext;

  void setContext(BuildContext context);

  void init();
}
