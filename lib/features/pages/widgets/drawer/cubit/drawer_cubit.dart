import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/domain/models/personal_info_model.dart';
import 'package:portfolio/domain/repositories/firebase_repository.dart';
import 'package:portfolio/features/pages/crypto_page/bloc/crypto_page_bloc.dart';

part 'drawer_state.dart';
part 'drawer_cubit.freezed.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit({required this.firebaseRepository})
      : super(DrawerState(model: null, status: Status.initial));

  StreamSubscription? streamSubscription;
  final FirebaseRepository firebaseRepository;

  Future<void> getPersonalInfo() async {
    emit(DrawerState(model: null, status: Status.loading));
    streamSubscription = firebaseRepository.getPersonalInfo().listen((results) {
      emit(DrawerState(model: results[0], status: Status.success));
    })
      ..onError((error) {
        print("ERROR $error");
        emit(DrawerState(model: null, status: Status.failure));
      });
  }
}
