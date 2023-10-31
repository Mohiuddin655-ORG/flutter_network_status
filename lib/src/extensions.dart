part of '../network_status.dart';

/// to find network connection status
extension NetworkStatusExtension on ConnectivityResult {
  bool get isConnected =>
      this == ConnectivityResult.mobile ||
          this == ConnectivityResult.wifi ||
          this == ConnectivityResult.ethernet;
}

/// to find network provider and maintain some operations
extension NetworkContextExtension on BuildContext {

  /// to find network provider
  NetworkProvider? findNetworkProvider() {
    return dependOnInheritedWidgetOfExactType<NetworkProvider>();
  }

  /// to notify network state
  NetworkProvider? notifyNetworkState(ConnectivityResult data) {
    var provider = dependOnInheritedWidgetOfExactType<NetworkProvider>();
    if (provider != null) {
      provider.notify(data);
    }
    return provider;
  }
}
