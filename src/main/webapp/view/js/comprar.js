document.addEventListener('DOMContentLoaded', function () {
    calcularPrecioTotal();
    const form = document.querySelector('form');

    form.addEventListener('submit', function (e) {
        e.preventDefault();
        const nombre = document.getElementById('nombre');
        const apellido = document.getElementById('apellido');
        const mail = document.getElementById('mail');
        const cantidad = document.getElementById('cantidad');
        const tipoEntrada = document.getElementById('descuento');

        const errors = [];
        if (nombre.value.trim() === '')
            errors.push('El campo Nombre es obligatorio.');
        if (apellido.value.trim() === '')
            errors.push('El campo Apellido es obligatorio.');
        const mailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        if (!mailPattern.test(mail.value))
            errors.push('El campo Mail no es válido.');
        if (cantidad.value.trim() === '' || isNaN(cantidad.value) || parseInt(cantidad.value) <= 0)
            errors.push('El campo Cantidad debe ser un número positivo.');
        if (tipoEntrada.value === 'Seleccionar')
            errors.push('Debe seleccionar un Tipo de Entrada.');
        const errorContainer = document.getElementById('error-container');
        errorContainer.innerHTML = '';
        if (errors.length > 0) {
            errors.forEach(function (error) {
                const errorDiv = document.createElement('div');
                errorDiv.classList.add('text-danger');
                errorDiv.innerText = error;
                errorContainer.appendChild(errorDiv);
            });
        } else {
            form.submit();
            alert('Gracias por su compra');
        }
    });
});

const cards = document.querySelectorAll('.card');

cards.forEach(function (card) {
    card.addEventListener('click', function () {
        const selectedOption = card.getAttribute('data-option');
        const tipoEntrada = document.getElementById('descuento');
        tipoEntrada.value = selectedOption;
        calcularPrecioTotal();
    });
});

const precioIndividual = 5000;

var select = document.getElementById("descuento");
select.addEventListener("change", calcularPrecioTotal);

function calcularDescuento(option) {
    switch (option) {
        case 'Estudiante':
            return 0.2; 
        case 'Socio':
            return 0.65;
        case 'Standard':
            return 1; 
        default:
            return 1;
    }
}

function calcularPrecioTotal() {
    const tipoEntrada = document.getElementById('descuento');
    const selectedOption = tipoEntrada.value;
    const cantidad = document.getElementById('cantidad').value;
    const descuento = calcularDescuento(selectedOption);
    const precioTotal =  precioIndividual * parseInt(cantidad) * descuento;
    document.getElementById('total').innerText = precioTotal;
}

const cantidadInput = document.getElementById('cantidad');
cantidadInput.addEventListener('input', calcularPrecioTotal);

/*

PRIMER ENTREGA TP INDIVIDUAL


function calcularTotal() 
{
    const cantidad = parseInt(document.getElementById('cantidad').value);
    const precioUnitario = 5000; 
    const total = cantidad * precioUnitario;
    document.getElementById('total').textContent = total;
}

document.getElementById('cantidad').addEventListener('input', calcularTotal);

document.getElementById('comprar').addEventListener('click', function() {
    const cantidad = parseInt(document.getElementById('cantidad').value);
    if ( isNaN(cantidad) || cantidad <= 0 )
        alert('Ingrese una cantidad y presione comprar.');
    else
        alert('Compra exitosa. Gracias por tu compra.');
});

*/