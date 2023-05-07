import 'package:bloc_api/bloc/user_bloc.dart';
import 'package:bloc_api/bloc/user_event.dart';
import 'package:bloc_api/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/user_information_model.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<UserBloc>().add(GetAllUserList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserError) {
            return Center(
              child: Text(
                state.message.toString(),
                style: TextStyle(fontSize: 44),
              ),
            );
          } else if (state is UserDataLoaded) {
            return ListView.builder(
                itemCount: state.usermodellist!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {

                  UserInformation information=state.usermodellist![index];
                  return ListTile(leading: Text(information.title.toString()),);
                });
          }else{
            return SizedBox();
          }
        },
      ),
    );
  }
}
