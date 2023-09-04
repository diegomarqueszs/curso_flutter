# Curso Flutter 
## Desenvolvimento Android & IOS

### Resumão Dart
***
#### Variáveis

Tipos imutáveis já em momento de compilação
```dart
// Declaração de variável com especificação de tipo
String name = "Diego Marques";
int idade = 22;
// Atribuição incorreta, causando um erro em tempo de compilação
name = idade; // Erro, pois a variável 'name' não é do tipo int
```
O tipo **var** permite que o tipo da variável não seja especificado no início de sua declaração. No entanto, uma vez atribuído um tipo à variável, seu tipo não pode ser alterado.
```dart
// Declaração de variável sem especificar seu tipo
var name = "Diego Marques";
name = '10'; //Erro, já que a variável foi inicializada como String e não int
```
O tipo **dynamic** assim como o tipo **var** permite que o tipo da variável não precise ser declarado. No entanto, ao contrário do var, o tipo dynamic permite a modificação do seu tipo dinamicamente em tempo de execução.

```dart
// Declaração de variável sem especificar seu tipo
dymanic name = "Diego Marques"
//Atribuição válida,agora o tipo "String" atribuido no primeiro momento passa a ser "int";
name = 22;
```


#### Modificadores de Imutabilidade
#### const
Torna um objeto **constante**, ou seja, o seu valor de estado não pode ser alterado após a sua inicialização. A principal diferença em relação ao final é a necessidade de ser inicializado no momento de sua declaração **São constantes em tempo de compilação.**
```dart
const String name = 'Diego Marques';
name = 'Jorge'; //Erro, o valor "Diego Marques" não pode ser alterado
const String sobreNome; // Erro! A constante deve ser inicializada!

```
#### final
Assim como const, após ter sido atribuído um valor, seu valor se torna imutável. No entanto, ao contrário de const, não é necessário atribuição no momento da declaração. **São constantes em tempo de execução.**
```dart
final String name = 'Diego Marques';
name = 'Jorge'; //Erro, o valor "Diego Marques" não pode ser alterado
```

#### late
A utilização do tipo **late** permite definir uma variável como non-nullable, e seu valor será inicializado após a declaração. Caso seja utilizada antes de sua inicialização, irá gerar um erro, então é necessário garantir que a variável seja inicializada para evitar esse erro.

```dart
late String name;
print(name); //Erro, pois a variável 'name' não foi inicializada

late String name;
name = "Diego Marques";
print(name); // Correto, pois foi inicializada antes de sua utilização.
```
***
### Funções
#### Especifícação de retorno e simplificação
Assim como em outras linguagens a estrutura de declaração das funções são as mesmas, porém com algumas coisas a mais. Em Dart, quando uma função não retorna nenhum valor, não é necessário específicar o tipo do retorno, ou caso queria deixar isso evidente, pode-se utilizar também o tipo _void_

```dart
void printSoma(int a, int b){
    print(a+b);
}
//também pode ser declarado da seguinte forma
printSoma(int a, int b){
    print(a+b);
}
```
Uma forma de simplificar também sua declaração além de ocultar seu tipo de retorno é com a utilização de *"=>"*, ao qual é a mesma coisa de um *return*.

```dart
printSoma(int a, int b) return a+b;
printSoma(int a, int b) => a+b;
```
#### Parâmetros opcionais
Em dart é possível definir parâmetros como opcionais, sendo da escolha do programador inferir um valor ou não há variável. 

```dart
void main(){
    printPessoa("Diego Marques",22,"Brasileiro");
}
//forma ao qual é necessário passar todos os argumentos por parâmetro
printPessoa(String name, int idade, String nacionalidade){
    print(name);
    print(idade);
    print(nacionalidade);
}
```
Para tornar os parâmetros como opcionais, basta colocá-los entre **'{}**'.
```dart
void main(){
    //como agora idade é um parâmetro opcional, é necessário indicar no momento da atribuição a função qual variável deseja inferir.
    printPessoa("Diego Marques",idade:22);
}
//forma ao qual é necessário passar todos os argumentos por parâmetro
printPessoa(String name, {int idade, String nacionalidade}){
    print(name);
    print(idade);
    print(nacionalidade);
}
```