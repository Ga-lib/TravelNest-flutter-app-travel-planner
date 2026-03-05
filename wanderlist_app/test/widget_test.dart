// This is a basic Flutter widget test for WanderList app.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wanderlist_app/main.dart';

void main() {
  testWidgets('WanderList app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WanderListApp());

    // Verify that our app shows the login screen with WanderList title.
    expect(find.text('WanderList'), findsOneWidget);

    // Verify that login screen elements are present.
    expect(find.text('USERNAME'), findsOneWidget);
    expect(find.text('PASSWORD'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
    expect(find.text('SIGN UP'), findsOneWidget);

    // Verify that username and password text fields are present.
    expect(find.byType(TextField), findsNWidgets(2));

    // Tap the LOGIN button and trigger a frame.
    await tester.tap(find.text('LOGIN'));
    await tester.pumpAndSettle(); // Wait for navigation animation to complete

    // Verify that we navigated to the home screen.
    expect(find.text('Search for a place...'), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
  });

  testWidgets('Login navigation test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WanderListApp());

    // Verify we start on login screen.
    expect(find.text('WanderList'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);

    // Enter some text in username field.
    await tester.enterText(find.byType(TextField).first, 'testuser');

    // Enter some text in password field.
    await tester.enterText(find.byType(TextField).last, 'testpassword');

    // Tap login button.
    await tester.tap(find.text('LOGIN'));
    await tester.pumpAndSettle();

    // Verify we're now on home screen.
    expect(find.text('Search for a place...'), findsOneWidget);
  });
}
