import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/snackbar_context_extension.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FcmManager {
  static void requestPermission() {
    FirebaseMessaging.instance.requestPermission();
  }

  static void initialize(WidgetRef ref) async {
    FirebaseMessaging.onMessage.listen((message) async {
      final title = message.notification?.title;
      if (title == null) {
        return;
      }
      ref.read(floatingButtonStateProvider.notifier).hideButton();
      final controller = App.navigatorKey.currentContext?.showSnackbar(
        title,
        extraButton: Tap(
          onTap: () {
            App.navigatorKey.currentContext!.go(message.data['deeplink']);
          },
          child: '열기'.text.white.bold.make().p(20),
        ),
      );
      await controller?.closed;
      await sleepAsync(4.seconds);
      ref.read(floatingButtonStateProvider.notifier).showButton();
    });

    ///
    ///
    /// Background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      App.navigatorKey.currentContext!.go(message.data['deeplink']);
    });

    ///
    ///
    /// Not running
    final firstMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (firstMessage != null && App.navigatorKey.currentContext!.mounted) {
      await sleepUntil(() => App.navigatorKey.currentContext != null);
      final context = App.navigatorKey.currentContext;
      if (context != null && context.mounted) {
        context.go(firstMessage.data['deeplink']);
      }
    }

    final token = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.instance.onTokenRefresh.listen((event) {});
    print(token);
  }
}
