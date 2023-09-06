import 'package:equatable/equatable.dart';

import '../model/user_information_model.dart';

abstract class UserState extends Equatable {}

class UserInit extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserDataLoaded extends UserState {
  List<UserInformation> usermodellist;

  UserDataLoaded(this.usermodellist);

  @override
  // TODO: implement props
  List<Object?> get props => [usermodellist];
}

class UserError extends UserState {
  String message;

  UserError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
