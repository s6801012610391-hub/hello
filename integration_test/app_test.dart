import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:hello/main.dart' as app;

void main() {
IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('ทดสอบ Flow การทำงานรวม',(WidgetTester tester) async {
    // 1. เริ่มรันแอปพลิเคชัน
    app.main();
    await tester.pumpAndSettle();

    // กดเลือก p1 กด rock p2 กด paper
    await tester.tap(find.byKey(Key('p1r')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('p2p')));
    await tester.pumpAndSettle();

    // ตรวจสอบว่าผู้เล่น 1 เลือกค้อน
    expect(find.byKey(const Key('p1_pick')), findsOneWidget);
    expect(find.text('Player 1 Pick.rock'), findsOneWidget);

    // ตรวจสอบว่าผู้เล่น 2 เลือกกระดาษ
    expect(find.byKey(const Key('p2_pick')), findsOneWidget);
    expect(find.text('Player 2 Pick.paper'), findsOneWidget);

    // กดปุ่ม result
    final resultButton = find.widgetWithText(ElevatedButton, 'Result').first;
    await tester.tap(resultButton);
    await tester.pumpAndSettle();

    // ตรวจสอบผลลัพธ์
    expect(find.byKey(const Key('result_text')), findsOneWidget);
    expect(find.text('Player 2 won'), findsOneWidget);

    // กดเลือก p1 กด scissors p2 กด scissors
    await tester.tap(find.byKey(Key('p1s')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('p2s')));
    await tester.pumpAndSettle();

    // ตรวจสอบว่าผู้เล่น 1 เลือกคกรรไกร
    expect(find.byKey(const Key('p1_pick')), findsOneWidget);
    expect(find.text('Player 1 Pick.scissors'), findsOneWidget);

    // ตรวจสอบว่าผู้เล่น 2 เลือกกรรไกร
    expect(find.byKey(const Key('p2_pick')), findsOneWidget);
    expect(find.text('Player 2 Pick.scissors'), findsOneWidget);

    // กดปุ่ม result
    await tester.tap(resultButton);
    await tester.pumpAndSettle();

    // ตรวจสอบผลลัพธ์
    expect(find.byKey(const Key('result_text')), findsOneWidget);
    expect(find.text('Tie'), findsOneWidget);

  });
}