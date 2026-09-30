import 'package:flutter_test/flutter_test.dart';
import 'package:xylophone/main.dart';

void main() {
  testWidgets('Xylophone smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const XylophoneApp());

    expect(find.text('Xylophone'), findsOneWidget);
    expect(find.text('C - Đô'), findsOneWidget);
    expect(find.text('B - Si'), findsOneWidget);
  });
}
