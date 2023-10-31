part of '../flutter_network_status.dart';

class NetworkNotifier extends ValueNotifier<bool> {
  NetworkNotifier(super.value);

  void setValue(bool value) {
    this.value = value;
    notifyListeners();
  }

  bool getValue() => value;
}
