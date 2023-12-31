part of '../network_status.dart';

/// to listen network status anywhere with [NetworkListener]
class NetworkListener extends StatelessWidget {
  final Widget Function(BuildContext context, bool isConnected) builder;

  const NetworkListener({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    var provider = context.findNetworkProvider();
    if (provider != null) {
      return ValueListenableBuilder(
        valueListenable: provider.notifier,
        builder: (context, value, old) => builder(context, value),
      );
    } else {
      throw UnimplementedError("Network provider not found!");
    }
  }
}
