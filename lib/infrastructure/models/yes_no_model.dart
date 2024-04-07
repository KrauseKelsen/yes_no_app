// La capa infrastructure es un puente entre el domain y presentation
// Permite mapear los json de las peticiones a objetos, para ser resistente a cambios de variables en el servidor

import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
      answer: json['answer'], forced: json['forced'], image: json['image']);

  Message toMessageEntity() =>
      Message(text: answer == 'yes' ? 'Si' : 'No', fromWho: FromWho.hers, imageUrl: image);
}
