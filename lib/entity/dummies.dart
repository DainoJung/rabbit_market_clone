import 'package:fast_app_base/common/dart/extension/num_duration_extension.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';

String picSum(int id) {
  return 'http://picsum.photos/id/$id/200/200';
}

final user1 = User(
  id: 1,
  nickname: '홍길동',
  profileUrl: picSum(1010),
  temperature: 36.5,
);

final user2 = User(
  id: 2,
  nickname: '바다',
  profileUrl: picSum(900),
  temperature: 36.5,
);

final user3 = User(
  id: 3,
  nickname: '파도',
  profileUrl: picSum(700),
  temperature: 36.5,
);

final product1 = Product(
  user1,
  '아이폰13',
  700000,
  '깨끗하게 잘 쓰던 물건이에요.'
      '잘쓰면 좋겠습니다.'
      '감사합니다.',
  ProductStatus.normal,
  [picSum(100), picSum(101), picSum(103)],
);

final product2 = Product(
  user2,
  '크레마 카르테',
  30000,
  '깨끗하게 잘 쓰던 물건이에요.'
      '잘쓰면 좋겠습니다.'
      '감사합니다.',
  ProductStatus.normal,
  [picSum(200), picSum(201), picSum(203)],
);

final product3 = Product(
  user3,
  '마우스',
  7000,
  '깨끗하게 잘 쓰던 물건이에요.'
      '잘쓰면 좋겠습니다.'
      '감사합니다.',
  ProductStatus.normal,
  [picSum(300), picSum(301), picSum(303)],
);

final post1 = ProductPost(
  product1.user,
  product1,
  '글의 내용입니다.',
  Address('서울시 특별한 주소', '타트동'),
  3,
  2,
  DateTime.now().subtract(5.minutes),
);

final post2 = ProductPost(
  product2.user,
  product2,
  '글의 내용입니다.',
  Address('서울시 특별한 주소', '플러터동'),
  145,
  41,
  DateTime.now().subtract(30.minutes),
);

final post3 = ProductPost(
  product3.user,
  product3,
  '글의 내용입니다.',
  Address('서울시 특별한 주소', '앱동'),
  30,
  21,
  DateTime.now().subtract(10.seconds),
);

final postList = [post1, post2, post3, post1, post2, post3];
