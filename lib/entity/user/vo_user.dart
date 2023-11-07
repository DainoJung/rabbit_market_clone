import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_user.freezed.dart';

@freezed
class User with _$User {
  factory User({
    required final int id,
    required final String nickname,
    required final String profileUrl,
    required final double temperature,
  }) = _User;
}
