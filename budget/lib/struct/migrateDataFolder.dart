// Clover: move data from an older app folder, if one is ever listed.
//
// Clover is a new app with its own data folder (~/.local/share/<app id>), so
// nothing is migrated by default and no other app's data is ever touched.
// If the app id changes in the future, add the old id to [_oldAppIds]: when the
// new folder is empty and an old one exists, it is moved over once.

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

const List<String> _oldAppIds = [];

Future<void> migrateOldDataFolder() async {
  if (kIsWeb || !Platform.isLinux || _oldAppIds.isEmpty) return;
  try {
    Directory newDir = await getApplicationSupportDirectory();
    bool newHasData = File(p.join(newDir.path, "db.sqlite")).existsSync() ||
        File(p.join(newDir.path, "shared_preferences.json")).existsSync();
    if (newHasData) return;
    for (String oldId in _oldAppIds) {
      Directory oldDir = Directory(p.join(newDir.parent.path, oldId));
      if (!oldDir.existsSync()) continue;
      if (newDir.existsSync()) await newDir.delete(recursive: true);
      await oldDir.rename(newDir.path);
      print("Moved data folder from " + oldDir.path + " to " + newDir.path);
      return;
    }
  } catch (e) {
    print("Could not migrate old data folder: " + e.toString());
  }
}
