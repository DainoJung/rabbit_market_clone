import 'package:fast_app_base/common/dart/extension/num_duration_extension.dart';
import 'package:fast_app_base/common/util/async/flutter_async.dart';
import 'package:fast_app_base/data/network/result/api_error.dart';
import 'package:fast_app_base/data/simple_result.dart';
import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/screen/notification/vo/notification_dumies.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

class DaangnApi {
  static Future<SimpleResult<List<DaangnNotification>, ApiError>>
      getNotification() async {
    await sleepAsync(300.ms);
    return SimpleResult.success(notificationList);
  }

  static Future<ProductPost> getPost(int id) async {
    await sleepAsync(300.ms);
    return ProductPost(
      simpleProductPost: post1,
      content: '깨끗하게 잘쓰던 물건이에요'
          '잘쓰면 좋겠습니다.'
          '감사합니다',
    );
  }
}
