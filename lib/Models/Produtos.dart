class Produtos {
  String? nome;
  String? descricao;
  String? imagem;
  double? preco;

  Produtos.empty();

  Produtos({
    required this.nome,
    required this.descricao,
    required this.imagem,
    required this.preco,
  });

  @override
  factory Produtos.fromJson(Map<String, dynamic> json) {
    return Produtos(
        nome: json['nome'],
        descricao: json['descricao'],
        imagem: json['imagem'],
        preco: json['preco']);
  }

  Map<String, dynamic> toJson(Produtos produto) {
    return {
      "nome": produto.nome,
      "descricao": produto.descricao,
      "imagem": produto.imagem,
      "preco": produto.preco
    };
  }

  @override
  String toString() {
    return 'Produtos{nome: $nome,'
        'descricao: $descricao,'
        "imagem: $imagem,"
        "preco: $preco}";
  }
}
