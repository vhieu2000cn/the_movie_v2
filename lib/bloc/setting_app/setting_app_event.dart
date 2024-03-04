import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class SettingAppEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const SettingAppEvent();
}

final class ChangeTitleAppbarEvent extends SettingAppEvent {
  final String title;
  const ChangeTitleAppbarEvent({ required this.title});
}

final class ChangeActionAppbarEvent extends SettingAppEvent {
  final List<Widget> action;
  const ChangeActionAppbarEvent({ required this.action});
}

final class ChangeModeViewEvent extends SettingAppEvent {
  final int indexAction;

  const ChangeModeViewEvent({required this.indexAction});
}

