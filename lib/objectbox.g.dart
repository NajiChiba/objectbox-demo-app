// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/contact.dart';
import 'models/qr_code.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3843236125656049029),
      name: 'Contact',
      lastPropertyId: const IdUid(3, 9107390553790338962),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6086003057140844976),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7849422041316058134),
            name: 'udid',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 9107390553790338962),
            name: 'token',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 883239851409166560),
      name: 'MyQrCode',
      lastPropertyId: const IdUid(4, 1073134582237683631),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1618682537582786487),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2494016392283225145),
            name: 'content',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4868542911455003240),
            name: 'pcr',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1073134582237683631),
            name: 'type',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 883239851409166560),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Contact: EntityDefinition<Contact>(
        model: _entities[0],
        toOneRelations: (Contact object) => [],
        toManyRelations: (Contact object) => {},
        getId: (Contact object) => object.id,
        setId: (Contact object, int id) {
          object.id = id;
        },
        objectToFB: (Contact object, fb.Builder fbb) {
          final udidOffset =
              object.udid == null ? null : fbb.writeString(object.udid!);
          final tokenOffset =
              object.token == null ? null : fbb.writeString(object.token!);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, udidOffset);
          fbb.addOffset(2, tokenOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Contact(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              udid: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              token: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8));

          return object;
        }),
    MyQrCode: EntityDefinition<MyQrCode>(
        model: _entities[1],
        toOneRelations: (MyQrCode object) => [],
        toManyRelations: (MyQrCode object) => {},
        getId: (MyQrCode object) => object.id,
        setId: (MyQrCode object, int id) {
          object.id = id;
        },
        objectToFB: (MyQrCode object, fb.Builder fbb) {
          final contentOffset =
              object.content == null ? null : fbb.writeString(object.content!);
          final typeOffset =
              object.type == null ? null : fbb.writeString(object.type!);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, contentOffset);
          fbb.addBool(2, object.pcr);
          fbb.addOffset(3, typeOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = MyQrCode(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              content: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              pcr: const fb.BoolReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              type: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 10));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Contact] entity fields to define ObjectBox queries.
class Contact_ {
  /// see [Contact.id]
  static final id = QueryIntegerProperty<Contact>(_entities[0].properties[0]);

  /// see [Contact.udid]
  static final udid = QueryStringProperty<Contact>(_entities[0].properties[1]);

  /// see [Contact.token]
  static final token = QueryStringProperty<Contact>(_entities[0].properties[2]);
}

/// [MyQrCode] entity fields to define ObjectBox queries.
class MyQrCode_ {
  /// see [MyQrCode.id]
  static final id = QueryIntegerProperty<MyQrCode>(_entities[1].properties[0]);

  /// see [MyQrCode.content]
  static final content =
      QueryStringProperty<MyQrCode>(_entities[1].properties[1]);

  /// see [MyQrCode.pcr]
  static final pcr = QueryBooleanProperty<MyQrCode>(_entities[1].properties[2]);

  /// see [MyQrCode.type]
  static final type = QueryStringProperty<MyQrCode>(_entities[1].properties[3]);
}
