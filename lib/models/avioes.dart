class AviaoModel {
  String id;
  String nome;
  String ano;
  String pais;
  

  AviaoModel({
    required this.id,
    required this.nome,
    required this.ano,
    required this.pais
  });

    
    Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      nome: nome,
      ano: ano,
      pais: pais,
    };
    
    return map;
  }

  factory AviaoModel.fromJson(Map<String, dynamic> json) {
    return AviaoModel(
      id: json['id'],
      nome: json['nome'],
      ano: json['ano'],
      pais: json['pais']
    );
  }
}