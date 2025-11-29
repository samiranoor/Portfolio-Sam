function calcul_moyenne() {
var n1 = prompt("donner la première note :");
var n2 = prompt("donner la deuxième note :");
var n3 = prompt("donner la troisième note :");

var somme = Number(n1) + Number(n2) + Number(n3);

document.write ("Voici la somme :" + somme + "<br>");

var moyenne = somme/3;

document.write ("Voici la moyenne :" + moyenne+ "<br>");

if (moyenne < 10) {
    document.write("Redoublant");
}
else if (moyenne< 12) {
    document.write("Admis Passable");
}
else if (moyenne < 14) {
    document.write("Admis Bien");
}
else if (moyenne > 14 ){
    document.write("Admis_Très Bien");
}
document.write('<br><br><a href="index.html">Retour à la page d\'accueil</a>');

}



function test_température() {
var température = prompt("quelle est la température ?");
if (température < 10) {
    document.write("Froid.");
    document.bgColor = "pink";
} 
if (température < 25) {
    document.write("Normal");
    document.bgColor = "yellow";
}

if (température > 25) {
document.write("Chaud.");
document.bgColor = "orange";
}
document.write('<br><br><a href="index.html">Retour à la page d\'accueil</a>');
}



function comparaison_de_deux_nombres() {
    var nombre = prompt("Affiche le plus grand et le plus petit de ces nombres");
    let valeur1 = document.getElementById("champ1").value;
let valeur2 = document.getElementById("champ2").value;

if (valeur1 === valeur2) {
  alert("Les deux valeurs sont identiques !");
} 
else {
  alert("Les valeurs sont différentes.");
}
document.write('<br><br><a href="index.html">Retour à la page d\'accueil</a>');
}
