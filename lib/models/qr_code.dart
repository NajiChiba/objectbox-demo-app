import 'package:objectbox/objectbox.dart';

@Entity()
class MyQrCode {
  @Id()
  int id;
  String? content;
  bool? pcr;
  String? type;

  MyQrCode({
    required this.id,
    this.content,
    this.pcr,
    this.type,
  });
}
