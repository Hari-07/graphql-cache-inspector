import 'package:flutter/material.dart';

import '../graphql_cache_inspector.dart';

class LinkToRef extends StatelessWidget {
  const LinkToRef({
    Key? key,
    required this.getCacheData,
    required this.refKey,
  }) : super(key: key);

  final CacheDataModel? Function() getCacheData;
  final String refKey;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Reference'),
      textColor: Colors.black,
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => GraphqlCacheInspector(
                  data: getCacheData()![refKey],
                  title: refKey,
                  getCacheData: getCacheData,
                )),
          ),
        );
      },
    );
  }
}
