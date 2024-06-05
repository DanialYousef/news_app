import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/network/remote/dio_helper.dart';
import 'package:my_app/shop_app_modules/shope_app/cubit/states.dart';

import '../../../network/remote/end_point.dart';

class ShopeAppLoginCubit extends Cubit<ShopeAppLoginStates> {
  ShopeAppLoginCubit() : super(ShopeAppInitialState());

  static ShopeAppLoginCubit get(context) => BlocProvider.of(context);

  void UserLogin({
    required String email,
    required String password,
  }) {
    emit(ShopeAppLoadingStates());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
       print(value);
       print(value!.data['message']);
       emit(ShopeAppSuccessState());
    }).catchError((error){
      print(error);
      emit(ShopeAppErorrState(error.toString()));
    });
  }
}
