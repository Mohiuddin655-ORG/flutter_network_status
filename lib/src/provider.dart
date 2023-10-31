part of '../flutter_network_status.dart';

class NetworkProvider extends InheritedWidget {
  final NetworkNotifier notifier;

  NetworkProvider({
    super.key,
    required Widget child,
    ConnectivityResult result = ConnectivityResult.none,
  })  : notifier = NetworkNotifier(result.isConnected),
        super(child: _NetworkView(child: child));

  static NetworkProvider? of<ConnectivityResult>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NetworkProvider>();
  }

  @override
  bool updateShouldNotify(covariant NetworkProvider oldWidget) {
    return notifier.value != oldWidget.notifier.value;
  }

  void notify(ConnectivityResult data) => notifier.setValue(data.isConnected);
}
