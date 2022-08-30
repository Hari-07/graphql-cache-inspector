import 'package:flutter/material.dart';

import 'components/components.dart';

typedef CacheDataModel = Map<dynamic, dynamic>?;

class GraphqlCacheInspector extends StatelessWidget {
  /// Primarily For internal use
  /// Better to provide [getCacheData] function when using this in an app
  final CacheDataModel data;

  /// Title that'd be shown at the top of each screen
  final String title;

  /// Takes in a function that'd return the cachedata, this is required
  /// instead of the data itself in order to handle references properly
  final CacheDataModel Function() getCacheData;

  const GraphqlCacheInspector({
    Key? key,
    required this.title,
    required this.getCacheData,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        data: ThemeData.light(),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          appBar: AppBar(
            title: Text(
              title,
            ),
          ),
          body: data == null
              ? const Card(
                  child: ListTile(title: Text('NULL')),
                )
              : ListView.builder(
                  itemBuilder: ((context, index) {
                    final String id = data!.keys.elementAt(index);
                    final parsedID = id.split(':');
                    return Card(
                      child: data![id] is Map
                          ? LinkToChild(
                              type: parsedID[0],
                              uuid: parsedID.length > 1 ? parsedID[1] : null,
                              data: data,
                              id: id,
                              getCacheData: getCacheData,
                            )
                          : parsedID[0] == '\$ref'
                              ? LinkToRef(
                                  getCacheData: getCacheData,
                                  refKey: data![id],
                                )
                              : DataField(
                                  fieldKey: parsedID[0],
                                  fieldValue: '${data![id]}',
                                ),
                    );
                  }),
                  itemCount: data!.keys.length,
                ),
        ),
      ),
    );
  }
}
