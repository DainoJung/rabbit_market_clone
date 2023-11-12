import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/provider/notification_provider.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItemWidget extends ConsumerStatefulWidget {
  final DaangnNotification notification;
  final VoidCallback onTap;

  const NotificationItemWidget(
      {super.key, required this.onTap, required this.notification});

  @override
  ConsumerState<NotificationItemWidget> createState() =>
      _NotificationItemWidgetState();
}

class _NotificationItemWidgetState
    extends ConsumerState<NotificationItemWidget> {
  static const leftPadding = 10.0;
  static const iconWidth = 25.0;

  @override
  Widget build(BuildContext context) {
    final isEditMode = ref.watch(notificationEditModeProvider);
    return Tap(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: widget.notification.isRead
            ? context.backgroundColor
            : context.appColors.unreadColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Width(leftPadding),
                Image.asset(
                  widget.notification.type.iconPath,
                  width: iconWidth,
                ),
                Expanded(
                  child: widget.notification.title.text.bold.size(12).make(),
                ),
                if (isEditMode)
                  IconButton(
                    onPressed: () {
                      final list = ref.read(notificationProvider)!;
                      list.remove(widget.notification);
                      ref.read(notificationProvider.notifier).state =
                          List.of(list);
                    },
                    icon: const Icon(Icons.delete),
                  ),
              ],
            ),
            height10,
            widget.notification.description.text
                .color(context.appColors.lessImportant)
                .size(14)
                .make()
                .pOnly(left: leftPadding + iconWidth),
            height10,
            timeago
                .format(widget.notification.time,
                    locale: context.locale.languageCode)
                .text
                .size(13)
                .color(context.appColors.lessImportant)
                .make()
                .pOnly(left: leftPadding + iconWidth),
          ],
        ),
      ),
    );
  }
}
