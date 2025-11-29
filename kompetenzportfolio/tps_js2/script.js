function addition() {

    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) + Number(b);
    document.getElementById("resultat").value = c;

}

function soustraction() {

    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) - Number(b);
    document.getElementById("resultat").value = c;

}

function multiplication() {
    
    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) * Number(b);
    document.getElementById("resultat").value = c;
}

function division() {
    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) / Number(b);
    document.getElementById("resultat").value = c;
        document.getElementById("resultat").value = t1 / t2;
}

function permute() {
    // Récupère les valeurs actuelles
     var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var A =12
    var B =25;
    X=A;
    A=B;
    B=X;
    // Permute les valeurs
    document.getElementById("t1").value = t2;
    document.getElementById("t2").value = t1;
    document.getElementById("resultat").value =t1 + " et " + t2 + " ont été permutés.";
}

function pair() 
{
    var x = document.getElementById("t1").value;
    if (x % 2 == 0) {
        document.getElementById("pair").value = " Nombre pair";
    } 
    else {
        document.getElementById("pair").value = " Nombre impair";
    }
}
