part of '../network_status.dart';

/// to notify current network status
class NetworkNotifier extends ValueNotifier<bool> {
  NetworkNotifier(super.value);

  void setValue(bool value) {
    this.value = value;
    notifyListeners();
  }

  bool getValue() => value;
}
