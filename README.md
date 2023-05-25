# Test Mobile Application

PeopleFirst Mobile application for Android and IOS ,built with Flutter cross-platform Google SDK.


### Flutter SDK used
build project using fluter 3.3.3

### Project apk for android can be downloaded directly from below link valid till 24th June 2023
https://easyupload.io/pwsulj


## Getting Started with Flutter

In order to get started with Flutter, we have to install some software on your local machine. You can either use macOS, Windows or Linux to get started with Flutter, however, macOS has the benefit of getting both the iOS and Android environment on the same machine. We will assume that you are using macOS for Flutter development, but you can always follow the similar instructions for Windows and Linux as well.

### Install Flutter

Flutter installation needs some command line tools installed on macOS. Most of the tools come with Xcode. You can download Flutter SDK either from Github or the official  [download](https://flutter.dev/docs/get-started/install/macos#get-the-flutter-sdk)  page. Once we have the Flutter SDK, we have to add it into the PATH so that we can access Flutter binary globally. The first step is to download Flutter SDK and unzip it to a suitable location on our disk. We can do this by using the following command:

```bash
cd ~/development
unzip ~/Downloads/flutter_macos_v1.5.4-hotfix.2-stable.zip

unzip flutter_macos_v0.7.3-beta.zip

```

Now that we have downloaded the Flutter SDK, we need to add Flutter to our $PATH so that we can access Flutter globally. This varies from shell to shell, bash, we can simply run this command:

```bash
export PATH=[PATH_TO_FLUTTER__DIRECTORY]/flutter/bin:$PATH

```

You can find the instructions to update the Flutter PATH  [here](https://flutter.dev/docs/get-started/install/macos#update-your-path). Once you set up the PATH, you should then be able to confirm installation by running:

```bash
flutter --help

```

This command will print all available commands of Flutter.

### Install Dart (Optional)

Once Flutter is installed, you may also want to install Dart. Usually, some Dart libraries come with Flutter itself, but if you need more Dart developer tools then you probably need to install Dart as well. This is optional but good to have. You need to install Homebrew in order to get Dart on your machine. You can install Homebrew by using the following command:

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

```

This will take some time, but once the installation is complete, you should be able to install any package using  [Homebrew](https://brew.sh/). Let’s  [install Dart](https://v1-dartlang-org.firebaseapp.com/install/mac)  by using following commands:

```bash
brew tap dart-lang/dart
brew install dart

```

You will now have Dart installed on your local machine.  [Know more](https://flutter.dev/docs/get-started/install)


