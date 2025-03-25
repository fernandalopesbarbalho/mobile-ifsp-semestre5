//Classe abstrata Personagem Mágico que declara as variáveis privadas
abstract class PersonagemMagico {
  String _nome;
  int _nivel;
  double _mana;

  PersonagemMagico(this._nome, this._nivel, this._mana);

  //Métodos Get e Set para acessar os atributos privados
  String get nome => _nome;
  set nome(String nome) => _nome = nome;

  int get nivel => _nivel;
  set nivel(int nivel) => _nivel = nivel;

  double get mana => _mana;
  set mana(double mana) => _mana = mana;

  void lancarMagia(String tipoMagia);
}

//Classe que herda as propriedades de Personagem Mágico
class Mago extends PersonagemMagico {
  String _especialidade; //Cria um atributo exclusivo para o Mago

  Mago(String nome, int nivel, double mana, this._especialidade)
    : super(nome, nivel, mana);

  String get especialidade => _especialidade;
  set especialidade(String especialidade) => _especialidade = especialidade;

  //Cada magia lançada consome 20 de mana
  @override
  void lancarMagia(String tipoMagia) {
    if (mana >= 20) {
      mana -= 20;
      print("O mago $nome lançou $tipoMagia\n");
    } else {
      print("O mago $nome não tem mana suficiente para lançar $tipoMagia\n");
    }
  }

  //Ao subir de nível, o personagem recebe mais 50 de mana
  void subirNivel() {
    nivel += 1;
    mana += 50;
  }
}

void main() {
  Mago merlin = Mago(
    "Merlin",
    5,
    200.0,
    "Magia Arcana",
  ); //Criação do Mago Merlin

  print("Nome: ${merlin.nome}");
  print("Nível: ${merlin.nivel}");
  print("Mana: ${merlin.mana}");
  print("Especialidade: ${merlin.especialidade}\n");

  merlin.lancarMagia("Magia de Fogo"); //Chamando a função lançar magia
  merlin.lancarMagia("Magia de Água");

  merlin.nome = "Merlin o Mago"; //Atualizando os valores
  merlin.especialidade = "Mago Elemental";
  merlin.subirNivel(); //Chamando a função subir de nível

  print("Nome: ${merlin.nome}");
  print("Nível: ${merlin.nivel}");
  print("Mana: ${merlin.mana}");
  print("Especialidade: ${merlin.especialidade}\n");
}