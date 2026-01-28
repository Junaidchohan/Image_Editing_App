Image Editing App (Flutter)

A simple Flutter image editing application that allows users to pick an image from the gallery, add draggable text overlays, customize text styles, and save the final edited image to the device gallery.
```
Features

Pick images from device gallery
Add multiple text overlays on image
Drag and reposition text anywhere
Change text color
Increase or decrease font size
Bold and italic text styles
Text alignment options
Add multi-line text
Save edited image to gallery using screenshot capture

Tech Stack
Flutter
Dart
Material UI

Packages Used
image_picker for selecting images from gallery
screenshot for capturing edited image
image_gallery_saver for saving image to gallery
permission_handler for runtime permissions
cupertino_icons for iOS style icons

Project Structure
lib/
│
├── main.dart
├── screens/
│   ├── home_screen.dart
│   └── edit_image_screen.dart
│
├── widgets/
│   ├── edit_image_viewmodel.dart
│   └── image_text.dart

How It Works
User selects an image from the gallery.
App navigates to the edit screen.
User adds text overlays on the image.
Text can be dragged, styled, resized, and colored.
Final image is captured using screenshot controller.
Edited image is saved to device gallery.

Permissions Required
Android

Add the following permissions in AndroidManifest.xml:

<uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>


For Android 13 and above, media permissions are handled automatically via permission_handler.

Installation
Clone the repository

git clone https://github.com/your-username/image_editing_app.git

Navigate to project directory
cd image_editing_app


Install dependencies
flutter pub get
Run the app
flutter run

Requirements
Flutter SDK 3.10.4 or higher
Dart SDK compatible with Flutter version
Android Studio or VS Code
Android device or emulator
Future Improvements
Font family selection
Text rotation and scaling
Stickers and emoji support
Undo and redo actions
Crop and filter options
Share edited image directly to social media

Author
Muhammad Junaid
Flutter Developer
