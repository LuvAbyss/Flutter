// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:mini_porfolio/main.dart';

void main() {
  testWidgets('portfolio homepage renders all sections', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Hoàng Tùng'), findsOneWidget);
    expect(find.text('Sinh viên năm 4 - Đại học Thủy Lợi'), findsOneWidget);
    expect(find.text('Kỹ năng'), findsOneWidget);
    expect(find.text('Kinh nghiệm'), findsOneWidget);
    expect(find.text('Dự án đã làm'), findsOneWidget);
    expect(find.text('Liên hệ'), findsOneWidget);
    expect(find.text('Email'), findsWidgets);
    expect(find.text('GitHub'), findsWidgets);
  });
}
