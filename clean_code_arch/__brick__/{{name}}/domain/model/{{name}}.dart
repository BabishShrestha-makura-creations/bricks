import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:seed_lms_app/src/core/config/hive/hive_box.dart';

part '{{name.snakeCase()}}.freezed.dart';
part '{{name.snakeCase()}}.g.dart';

@freezed
class {{name.pascalCase()}} with _${{name.pascalCase()}} {
  // @HiveType(typeId: HiveBox.authCredentialHiveId)
  const factory {{name.pascalCase()}}({
    // @HiveField(0)
    String? email,
    @JsonKey(
      includeToJson: false,
    )
    // @HiveField(1)
    String? password,
  }) = _{{name.pascalCase()}};

  factory {{name.pascalCase()}}.fromJson(Map<String, dynamic> json) => _${{name.pascalCase()}}FromJson(json);

  // factory Auth.fromFirestore(
  //         DocumentSnapshot snapshot, SnapshotOptions? options) =>
  //     Auth.fromJson(snapshot.data() as Map<String, dynamic>);

  // // Modify the toFirestore method to use the enum's stringValue
  // static Map<String, Object?> toFirestore(Auth auth, SetOptions? options) {
  //   final Map<String, Object?> json = auth.toJson();
  //   json['role'] = auth.role?.stringValue; // Convert enum to string
  //   return json;
  // }
}
