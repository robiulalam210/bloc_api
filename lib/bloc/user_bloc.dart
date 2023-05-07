import 'package:bloc_api/bloc/user_event.dart';
import 'package:bloc_api/bloc/user_state.dart';
import 'package:bloc_api/service/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user_information_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  List<UserInformation> usermodellist = [];

  UserBloc() : super(UserInit()) {
    ApiServices apiServices = ApiServices();

    on<GetAllUserList>((event, emit) async {
      try {
        emit(UserLoading());
        usermodellist = (await apiServices.getData())!;
        emit(UserDataLoaded(usermodellist));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
