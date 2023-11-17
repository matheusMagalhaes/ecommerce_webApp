class Produtos {
  int? id;
  String? nome;
  String? descricao;
  String? imagem;
  double? preco;

  Produtos({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.imagem,
    required this.preco,
  });

  Produtos.empty();

  factory Produtos.fromJson(Map<String, dynamic> json) {
    return Produtos(
        id: json['id'],
        nome: json['nome'],
        descricao: json['descricao'],
        imagem: json['imagem'],
        preco: json['preco']);
  }

  Map<String, dynamic> toJson(Produtos produto) {
    return {
      "id": produto.id,
      "nome": produto.nome,
      "descricao": produto.descricao,
      "imagem": produto.imagem,
      "preco": produto.preco
    };
  }

  @override
  String toString() {
    return 'Produtos{id: $id,'
        'nome: $nome,'
        'descricao: $descricao,'
        "imagem: $imagem,"
        "preco: $preco}";
  }
}
