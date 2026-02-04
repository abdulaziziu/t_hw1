import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:t_hw_1/main.dart';

void main() {
  testWidgets('User cards screen shows three cards', (WidgetTester tester) async {
    await tester.pumpWidget(const UserCardsApp());

    expect(find.text('User Cards'), findsOneWidget);
    expect(find.byType(Card), findsNothing);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(CircleAvatar), findsNWidgets(3));
  });
}
