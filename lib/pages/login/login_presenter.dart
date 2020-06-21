import 'package:flutter/cupertino.dart';
import 'package:flutter_sqlite/data/rest-data.dart';
import 'package:flutter_sqlite/models/user.dart';

abstract class LoginPageContract{
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginPagePresenter {
  LoginPageContract _view;
  RestData api = new RestData();
  LoginPagePresenter(this._view);

//Simulator login
  doLogin(String usuario, String senha){
    api
    .login(usuario, senha)
    .then((user) => _view.onLoginSuccess(user))
    .catchError((onError) => _view.onLoginError(onError));
  }
}