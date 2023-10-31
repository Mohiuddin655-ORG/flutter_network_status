part of '../flutter_network_status.dart';

class _NetworkView extends StatefulWidget {
  final Widget child;

  const _NetworkView({
    required this.child,
  });

  @override
  State<_NetworkView> createState() => _NetworkViewState();
}

class _NetworkViewState extends State<_NetworkView> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _subs;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _subs = _connectivity.onConnectivityChanged.listen(_update);
  }

  @override
  void dispose() {
    _subs.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log("Couldn't check connectivity status", error: e);
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _update(result);
  }

  Future<void> _update(ConnectivityResult result) async {
    var provider = context.findNetworkProvider();
    if (provider != null) {
      provider.notify(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
