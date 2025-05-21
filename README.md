# 10SHDS App 🎨 🎵

A Flutter application that displays random goofy pictures of me and my friends and plays funny sounds.

## 📱 Overview

10SHDS is a minimalist media player app built with Flutter. The app displays random wallpapers from a collection and plays corresponding sounds.

The app features:
- 🖼️ Random wallpaper slideshow
- 🔊 Synchronized audio playback
- 🌈 Clean Material Design interface
- ⏱️ Timed transitions between media

## 🛠️ Technologies Used

- **Flutter**: Cross-platform UI framework
- **Dart**: Programming language
- **AudioPlayers**: Package for audio playback
- **Material Design**: UI design system

## 🧩 Project Structure

```
shds_app/
├── android/                # Android platform code
├── ios/                    # iOS platform code
├── lib/                    # Dart source code
│   └── main.dart           # Application entry point
├── assets/                 # Application resources
│   ├── images/             # Image assets
│   │   ├── icons/          # App icons
│   │   └── wallpapers/     # Wallpaper images
│   ├── json/               # Configuration files
│   │   ├── wallpapers.json # Wallpaper metadata
│   │   └── sounds.json     # Sound metadata
│   └── sounds/             # Audio files
├── test/                   # Test files
└── pubspec.yaml            # Project configuration
```

## 🔍 Key Features

### Wallpaper Display

The app loads wallpaper images from a JSON configuration file and displays them in a slideshow format. Each wallpaper is shown for a set duration before fading away.

```dart
// Load wallpapers from JSON
Future<void> loadWallpaperJson() async {
  final String jsonWallpaperString = await rootBundle.loadString('assets/json/wallpapers.json');
  setState(() {
    wallpaperPaths = List<String>.from(json.decode(jsonWallpaperString));
  });
}

// Display random wallpaper
void showRandomWallpaperForDuration(BuildContext context, int durationInSeconds) {
  String randomWallpaperPath = wallpaperPaths[random.nextInt(wallpaperPaths.length)];
  
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ImageScreen(wallpaperPath: randomWallpaperPath),
    ),
  );
  
  // Duration delay
  Future.delayed(Duration(seconds: durationInSeconds), () {
    if (context.mounted) {
      Navigator.of(context).pop();
    }
    
    wallpaperPaths.remove(randomWallpaperPath);
    
    if (wallpaperPaths.isEmpty) {
      loadWallpaperJson();
    }
  });
}
```

### Audio Playback

The app uses the AudioPlayers package to play sounds that complement the wallpapers. Sounds are loaded from a JSON configuration file and played randomly.

```dart
// Load sounds from JSON
Future<void> loadSoundJson() async {
  final String jsonSoundString = await rootBundle.loadString('assets/json/sounds.json');
  setState(() {
    soundPaths = List<String>.from(json.decode(jsonSoundString));
  });
}

// Play random sound
void playRandomSoundForDuration(int durationInSeconds) async {
  String randomSoundPath = soundPaths[random.nextInt(soundPaths.length)];
  
  await _audioPlayer.play(randomSoundPath);
  
  // Duration delay
  Future.delayed(Duration(seconds: durationInSeconds), () {
    _audioPlayer.stop();
    
    soundPaths.remove(randomSoundPath);
    
    if (soundPaths.isEmpty) {
      loadSoundJson();
    }
  });
}
```

### UI Design

The app uses Material Design for a clean, modern interface:

```dart
return MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  ),
  home: const MyHomePage(),
);
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (version 3.5.4 or higher)
- Dart SDK
- Android Studio or Xcode for platform-specific development

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/zrsoo/shds_app.git
   cd shds_app
   ```

2. Install dependencies:
   ```
   flutter pub get
   ```

3. Run the app:
   ```
   flutter run
   ```

### Configuration

To customize the wallpapers and sounds:

1. Add your wallpaper images to `assets/images/wallpapers/`
2. Add your sound files to `assets/sounds/`
3. Update the JSON configuration files:
   - `assets/json/wallpapers.json`: List of wallpaper file paths
   - `assets/json/sounds.json`: List of sound file paths

## 📋 Project Structure Details

### Main Components

- **MyApp**: The root application widget
- **MyHomePage**: The main screen widget
- **ImageScreen**: Full-screen image display widget
- **AudioPlayer**: Handles sound playback

### State Management

The app uses Flutter's built-in state management with `StatefulWidget` and `State` classes.

Created with 💙 using Flutter
