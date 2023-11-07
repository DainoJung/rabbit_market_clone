import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_address.freezed.dart';

@freezed
class Address with _$Address {
  factory Address(
    final String fullAddress,
    final String simpleAddress,
  ) = _Address;
}
