let productos = document.getElementById("productos");
let ventana = document.getElementById("ventana");
let imgSeleccionada = document.getElementById("img");
let modeloSeleccionado = document.getElementById("modelo");
let descripSeleccionada = document.getElementById("descripcion");
let precioSeleccionado = document.getElementById("precio");

function cargar(item){
    quitarBordes();
    productos.style.width = "60%";
    ventana.style.width = "40%";
    ventana.style.opacity = "1";
    prod.style.border = "2px solid red";

    imgSeleccionada.src = item.getElementsByTagName("img")[0].src;

    modeloSeleccionado.innerHTML =  item.getElementsByTagName("p")[0].innerHTML;

    descripSeleccionada.innerHTML = "Por Kg ";

    precioSeleccionado.innerHTML =  item.getElementsByTagName("span")[0].innerHTML;
}
function cerrar(){
    productos.style.width = "100%";
    ventana.style.width = "0%";
    ventana.style.opacity = "0";
    quitarBordes();
}
function quitarBordes(){
    var prod = document.getElementsByClassName("prod");
    for(i=0;i <items.length; i++){
        items[i].style.border = "none";
    }
}