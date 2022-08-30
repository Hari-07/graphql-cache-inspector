<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Graphql Cache Inspector

A Flutter Plugin that helps to inspect the graphql cache on device

## Features

- Visualizes the GraphQL Cache Data using simple lists

## Usage

import 'grapqhl_cache_inspector.dart' into your dart code.

```dart
import 'package:grapqhl_cache_inspector/grapqhl_cache_inspector.dart';
```

The GraphqlCacheInspector takes in a function that gets the cache data, as well as the data itself

```dart
GraphqlCacheInspector(
 title: 'GraphQL Cache',
 data: graphql.getCacheDump(),
 getCacheData: graphql.getCacheDump,
);
```

You may perhaps use this as a page of its own by having a button that opens the CacheInspector,
using something like

```dart
ElevatedButton(
 onPressed: () {
  Navigator.of(context).push(
   MaterialPageRoute(
    builder: ((context) {
     return GraphqlCacheInspector(
      title: 'GraphQL Cache',
      data: graphql.getCacheDump(),
      getCacheData: graphql.getCacheDump,
     );
    }),
   ),
  );
 },
 child: const Text('Get GraphQL Cache Dump'),
),
```

## Additional information

This is a WIP new package, expect breaking changes.
