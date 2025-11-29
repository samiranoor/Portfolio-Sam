function calcul_moyenne() {
var n1 = prompt("donner la première note :");
var n2 = prompt("donner la deuxième note :");
var n3 = prompt("donner la troisième note :");

var somme = Number(n1) + Number(n2) + Number(n3);

document.write ("Voici la somme :" + somme + "<br>");

var moyenne = somme/3;

document.write ("Voici la moyenne :" + moyenne+ "<br>");

if (moyenne < 10) {
    document.write("Désolé, vous êtes recalé.");

} 

else {


    document.write("Félicitations, vous êtes admis.");
}

}



function test_âge() {
var âge = prompt("quelle est vôtre âge ?");
if (âge < 18) {
    document.write("Vous êtes mineur.");
    document.bgColor = "red";
} 

else {
document.write("Vous êtes majeur.");
document.bgColor = "green";

}

}



function simple_affichage() {
    var name = prompt("Donner votre nom");
    let prenom = prompt("Donner votre prénom");

    document.write( '<div style="margin:auto; width:300px; border:2px solid blue;">');
    document.write( "Bonjour " + prenom + " " + name);
    document.write( '</div>');
}

function test_couleur() {
    let couleur = prompt("Donner une couleur");

    if (couleur == "rouge" || couleur == "red") {
        document.body.style.backgroundColor = couleur == "red";
    }
    else if (couleur == "vert" || couleur == "green") {
        document.body.style.backgroundColor = couleur == "green";
    }
    else if (couleur == "bleu" || couleur == "blue") {
        document.body.style.backgroundColor = couleur == "blue";
    }
    else if (couleur == "jaune" || couleur == "yellow") {
        document.body.style.backgroundColor = couleur == "yellow";
    }
    else {
    document.write("Couleur non comprise");
    }
}