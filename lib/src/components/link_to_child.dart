import 'package:flutter/material.dart';

import '../graphql_cache_inspector.dart';

class LinkToChild extends StatelessWidget {
  const LinkToChild({
    Key? key,
    required this.type,
    required this.uuid,
    required this.data,
    required this.id,
    required this.getCacheData,
  }) : super(key: key);

  final String type;
  final String? uuid;
  final String id;
  final CacheDataModel? data;
  final CacheDataModel Function() getCacheData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(type),
      subtitle: uuid == null ? null : Text(uuid!),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => GraphqlCacheInspector(
                  data: data![id],
                  title: id,
                  getCacheData: getCacheData,
                )),
          ),
        );
      },
    );
  }
}
