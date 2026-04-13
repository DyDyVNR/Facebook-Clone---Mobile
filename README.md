# 📘 Facebook UI Clone — Mobile

![Framework](https://img.shields.io/badge/framework-Flutter-02569B.svg?logo=flutter)
![Language](https://img.shields.io/badge/language-Dart-0175C2.svg?logo=dart)

A pixel-faithful recreation of the Facebook mobile app UI built with Flutter. This is a pure front-end clone focused on replicating the look and layout of Facebook's mobile interface — no backend, no auth, just clean Flutter widgets.

---

## Features

- Recreates the Facebook mobile UI using Flutter widgets
- Includes key screens such as the News Feed, Stories bar, and navigation bottom bar
- Stateless UI-focused architecture — great for learning Flutter layout and widget composition
- Runs on **Android, iOS, Web, and Windows** from a single codebase

---

## Tech Stack

| Category    | Technology                        |
|-------------|-----------------------------------|
| Framework   | [Flutter](https://flutter.dev)    |
| Language    | Dart                              |
| UI Approach | Custom widgets, no third-party UI library |
| Platforms   | Android, iOS, Web, Windows        |

---

## Project Structure

```
Facebook-Clone---Mobile/
├── android/              # Android platform-specific files
├── ios/                  # iOS platform-specific files
├── web/                  # Web platform-specific files
├── windows/              # Windows platform-specific files
├── lib/                  # Main Dart source code (screens & widgets)
├── test/                 # Widget and unit tests
├── pubspec.yaml          # Flutter dependencies and project config
└── pubspec.lock          # Locked dependency versions
```

---

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart SDK (included with Flutter)
- Android Studio, Xcode, or VS Code with the Flutter extension

---

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/DyDyVNR/Facebook-Clone---Mobile.git
   cd Facebook-Clone---Mobile
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # Run on a connected device or emulator
   flutter run

   # Run on web
   flutter run -d chrome

   # Run on Windows
   flutter run -d windows
   ```

---

## Purpose

This project was built as a personal side project to practice Flutter UI development specifically widget composition, layout techniques, and styling. It's a great reference for anyone learning how to replicate complex real-world UIs in Flutter.

---

## Contributing

Feel free to fork this and build on it!

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-screen`)
3. Commit your changes (`git commit -m 'Add your screen'`)
4. Push to the branch (`git push origin feature/your-screen`)
5. Open a Pull Request

---

## Disclaimer

This project is for **educational and practice purposes only**. It is not affiliated with, endorsed by, or connected to Meta Platforms, Inc. in any way. All Facebook branding and UI design belong to their respective owners.

---
