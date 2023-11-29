import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'w_floating_daangn_button.state.dart';

final floatingButtonStateProvider =
    StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
  (ref) => FloatingButtonStateNotifier(
    FloatingButtonState(false, false, false),
  ),
);

class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);

  // @override
  // bool updateShouldNotify(
  //     FloatingButtonState old, FloatingButtonState current) {
  //   return super.updateShouldNotify(old, current);
  // }
  bool needToMakeButtonBigger = false;

  void toggleMenu() {
    final isExpanded = state.isExpanded;
    final isSmall = state.isSmall;

    state = state.copyWith(
        isExpanded: !state.isExpanded,
        isSmall: needToMakeButtonBigger ? false : true);

    if (needToMakeButtonBigger) {
      needToMakeButtonBigger = false;
    }

    if (!isSmall && !isExpanded) {
      needToMakeButtonBigger = true;
    }
  }

  void changeButtonSize(bool isSmall) {
    // 확장시 코드 접근을 막을 수 있다.
    if (state.isExpanded) {
      return;
    }
    state = state.copyWith(isSmall: isSmall);
  }

  void hideButton() {
    state = state.copyWith(isHided: true);
  }

  void showButton() {
    state = state.copyWith(isHided: false);
  }
}
