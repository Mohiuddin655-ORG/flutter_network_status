part of '../flutter_network_status.dart';

extension NetworkStatusExtension on ConnectivityResult {
  bool get isConnected =>
      this == ConnectivityResult.mobile ||
          this == ConnectivityResult.wifi ||
          this == ConnectivityResult.ethernet;
}

extension NetworkContextExtension on BuildContext {
  NetworkProvider? findNetworkProvider() {
    return dependOnInheritedWidgetOfExactType<NetworkProvider>();
  }

  NetworkProvider? notifyNetworkState(ConnectivityResult data) {
    var provider = dependOnInheritedWidgetOfExactType<NetworkProvider>();
    if (provider != null) {
      provider.notify(data);
    }
    return provider;
  }
}
