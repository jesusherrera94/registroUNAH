//Variables Globales
var campus = [];
var edificioIndex = 1;
var aulasIndex = 1;
//________________________________________________________________________________
$('#crear-campus').click(function(){
    $.ajax({
        url:"/crear-campus",
        method: "POST",
        data: "nombreCampus="+$('#nombre-campus').val(),
        datatype: 'json',
        success:function(respuesta){
            alert("Se creó el campús con Éxito")
            $('#nombre-campus').val('')
        },
        error: function(){
            alert("Ha ocurrido un error")
        }
    });
})

$(document).ready(function(){
    $.ajax({
        url:"/obtener-campus",
        method: "GET",
        datatype: 'json',
        success:function(respuesta){
            for(let i=0; i<respuesta.length; i++){
            $('#campus-trabajo-empleado').append(`<option value="${respuesta[i].CODIGO_CAMPUS}">${respuesta[i].NOMBRE_CAMPUS}</option>`)
            $('#campus-alumno').append(`<option value="${respuesta[i].CODIGO_CAMPUS}">${respuesta[i].NOMBRE_CAMPUS}</option>`)
            }
            $('select').select2();
            obtenerEstadoCivil();
            obtenerCarreras();    
        }
    })
})

function obtenerCarreras(){
    $.ajax({
        url:"/obtener-carreras",
        method: "GET",
        datatype: 'json',
        success:function(respuesta){
            for(let i=0; i<respuesta.length; i++)
            $('#carrera').append(`<option value="${respuesta[i].CODIGO_CARRERA}">${respuesta[i].NOMBRE_CARRERA}</option>`)

            $('select').select2();    
        }
    })
}




function obtenerEstadoCivil(){
    $.ajax({
        url:"/obtener-estado-civil",
        method: "GET",
        datatype: 'json',
        success:function(respuesta){
            //CODIGO_ESTADO_CIVIL, NOMBRE_ESTADO_CIVIL
            for(let i=0; i<respuesta.length; i++){
            $('#estado-civil-empleado').append(`<option value="${respuesta[i].CODIGO_ESTADO_CIVIL}">${respuesta[i].NOMBRE_ESTADO_CIVIL}</option>`)
            $('#estado-civil-alumno').append(`<option value="${respuesta[i].CODIGO_ESTADO_CIVIL}">${respuesta[i].NOMBRE_ESTADO_CIVIL}</option>`)
            }
            $('select').select2();
            obtenerTipoDeEmpleado();    
        }
    })
}

function obtenerTipoDeEmpleado(){
    $.ajax({
        url:"/obtener-tipo-empleado",
        method: "GET",
        datatype: 'json',
        success:function(respuesta){
            //CODIGO_TIPO_EMPLEADO, NOMBRE_TIPO_EMPLEADO 
            for(let i=0; i<respuesta.length; i++)
            $('#tipo-empleado').append(`<option value="${respuesta[i].CODIGO_TIPO_EMPLEADO}">${respuesta[i].NOMBRE_TIPO_EMPLEADO}</option>`)

            $('select').select2();
            obtenerCargo();    
        }
    })
}

function obtenerCargo(){
    $.ajax({
        url:"/obtener-cargo",
        method: "GET",
        datatype: 'json',
        success:function(respuesta){
            //CODIGO_CARGO, NOMBRE_CARGO
            for(let i=0; i<respuesta.length; i++)
            $('#cargo').append(`<option value="${respuesta[i].CODIGO_CARGO}">${respuesta[i].NOMBRE_CARGO}</option>`)

            $('select').select2();
            obtenerTitularidad()
            obtenerEspecializacion()    
        }
    })
}
function obtenerTitularidad(){
    $.ajax({
        url:"/obtener-titularidad",
        method: "GET",
        datatype: 'json',
        success:function(respuesta){
            //CODIGO_CARGO, NOMBRE_CARGO
            for(let i=0; i<respuesta.length; i++)
            $('#titularidad').append(`<option value="${respuesta[i].CODIGO_TITULARIDAD}">${respuesta[i].NOMBRE_TITULARIDAD}</option>`)

            $('select').select2();    
        }
    })
}
function obtenerEspecializacion(){
    $.ajax({
        url:"/obtener-especializacion",
        method: "GET",
        datatype: 'json',
        success:function(respuesta){
            //CODIGO_CARGO, NOMBRE_CARGO
            for(let i=0; i<respuesta.length; i++)
            $('#especializacion').append(`<option value="${respuesta[i].CODIGO_ESPECIALIZACION}">${respuesta[i].DESCRIPCION}</option>`)

            $('select').select2();    
        }
    })
}
$(function(){
    $(document).on('change', 'select[id=cargo]', function(event) {
        if($('#cargo').val()>1)
        $('#datos-maestro').css('display','block')
        else
        $('#datos-maestro').css('display','none')
    })})



$('#agregar-card-edificio').click(function(){
    $.ajax({
        url:"/obtener-campus",
        method: "GET",
        datatype: 'json',
        success:function(respuesta){
            campus = respuesta;
            let opciones = ''
            for (let i = 0; i < campus.length; i++) {
                opciones += `<option value="${campus[i].CODIGO_CAMPUS}">${campus[i].NOMBRE_CAMPUS}</option>`
                
            }

            $('#lista-de-edificios').append(
               ` <div class="row" id="${edificioIndex}>
               <div class="col-sm-6">
                    <div class="card">
                            <div class="card-body" id="edificio-${edificioIndex}">
                              <h5 class="card-title">Crear Edificio(s)</h5>
                              <hr>
                             <label for="nombre-edificio"> Nombre Edificio: <input type="text" id="nombre-edificio-${edificioIndex}" class="form-control" placeholder="Nombre del edificio"></label>
                             <br>
                             <label for="alias-edificio"> alias Edificio: <input type="text" id="alias-edificio-${edificioIndex}" class="form-control" placeholder="alias del edificio"></label>
                             <br>
                             <label for="campus">Campus:</label>
                             <select name="campus" id="campus-selected-${edificioIndex}">
                                ${opciones}    
                                  </select>
                             <br>
                            </div>
                            </div>
                          </div>
                        </div>`
            )
            edificioIndex++;
            $('select').select2();
                
        }
    });
})

$('#agregar-edificio').click(function(){
    let grupoEdificios = {};
    for (let i = 0; i < edificioIndex-1; i++) {
        grupoEdificios[i] = {
            codigoEdificio: null,
            nombreEdificio : $('#nombre-edificio-'+(i+1)).val(),
            aliasEdificio : $('#alias-edificio-'+(i+1)).val(),
            codigoCampus : $('#campus-selected-'+(i+1)).val()
        }
    }
    
    $.ajax({
        url:"/crear-edificio",
        method: "POST",
        data: {edificio: grupoEdificios},
        datatype: 'json',
        success:function(respuesta){
            alert("Se creó el/los edificions con Éxito")
            for (let i = 0; i < edificioIndex-1; i++) {
            $('#nombre-edificio-'+(i+1)).val('')
            $('#alias-edificio-'+(i+1)).val('')
            $('#campus-selected-'+(i+1)).val('')
        }
            
        },
        error: function(){
            alert("Ha ocurrido un error")
        }
    });


})

$('#agregar-card-aula').click(function(){
    $.ajax({
        url:"/obtener-tipos-aula",
        method: "GET",
        datatype: 'json',
        success:function(respuesta){
            tipoAula = respuesta;
            let opciones = ''
            for (let i = 0; i < tipoAula.length; i++) {
                opciones += `<option value="${tipoAula[i].CODIGO_TIPO_AULA}">${tipoAula[i].TIPO_AULA}</option>`
                
            }


            $.ajax({
                url:"/obtener-edificios",
                method: "GET",
                datatype: 'json',
                success:function(respuesta2){
                    edificio = respuesta2;
                    let opciones2 = ''
                    for (let j = 0; j < edificio.length; j++) {
                        opciones2 += `<option value="${edificio[j].CODIGO_EDIFICIO}">${edificio[j].NOMBRE_EDIFICIO}</option>`
                        
                    }
                    
                    $('#lista-de-aulas').append(
                        ` <div class="row" id="${aulasIndex}>
                        <div class="col-sm-6">
                             <div class="card">
                                     <div class="card-body" id="aula-${aulasIndex}">
                                       <h5 class="card-title">Crear aula(s)</h5>
                                       <hr>
                                      <label for="numero-aula"> Número aula: <input type="number" id="nombre-aula-${aulasIndex}" class="form-control" placeholder="numero del aula" min='1' max='100000'></label>
                                      <br>
                                      <label for="edificio"> Edificio: 
                                      <select name="edificio" id="edificio-selected-${aulasIndex}">
                                         ${opciones2}    
                                           </select>
                                      </label>
                                      <br>
                                      <label for="aula">Aula:</label>
                                      <select name="aula" id="aula-selected-${aulasIndex}">
                                         ${opciones}    
                                           </select>
                                      <br>
                                     </div>
                                     </div>
                                   </div>
                                 </div>`
                     )
                     aulasIndex++;
                     $('select').select2();
                    
                        
                }
            });
            
                
        }
    });
})

$('#agregar-aula').click(function(){
    let grupoAulas = {};
    for (let i = 0; i < aulasIndex-1; i++) {
        grupoAulas[i] = {
            codigoAulas: null,
            numeroAula : $('#nombre-aula-'+(i+1)).val(),
            codigoTipoAula : $('#edificio-selected-'+(i+1)).val(),
            codigoEdificio : $('#aula-selected-'+(i+1)).val()
        }
    }
    
    $.ajax({
        url:"/crear-aula",
        method: "POST",
        data: {aulas: grupoAulas},
        datatype: 'json',
        success:function(respuesta){
            alert("Se creó la(s) Aulas con Éxito")
            for (let i = 0; i < edificioIndex-1; i++) {
                $('#nombre-aula-'+(i+1)).val(''),
                 $('#edificio-selected-'+(i+1)).val(''),
                 $('#aula-selected-'+(i+1)).val('')
        }
            
        },
        error: function(){
            alert("Ha ocurrido un error")
        }
    });


})


$('#crear-empleado').click(function(){
    if(validacionesEmpleado()==''){
        if($('#cargo').val()>1){
        parametros = "nombres="+$('#nombres').val()+"&apellidos="+$('#apellidos').val()+"&fechaNacimiento="+$('#fecha-nacimiento').val()+"&identidad="+$('#identidad').val()+"&direccion="+$('#direccion').val()+"&telefono="+$("#telefono").val()
        +"&email="+$('#email').val()+"&genero="+$('input:radio[name=genero]:checked').val()+"&campus="+$("#campus-trabajo-empleado").val()+"&estadoCivil="+$('#estado-civil-empleado').val()+"&sueldoBase="+$('#sueldo-base').val()+"&tipoEmpleado="+$('#tipo-empleado').val()+"&cargo="+$('#cargo').val()+
        "&titularidad="+$('#titularidad').val()+"&especializacion="+$('#especializacion').val()+"&contrasenia="+$('#contrasenia').val()+"&numeroEmpleado="+$('#numero-empleado').val();
    $.ajax({
        url:"/guardar-empleado",
        method: "POST",
        data: parametros,
        datatype: 'json',
        success:function(respuesta){
            alert("Se creó el Empleado con Éxito")
            LimpiarTodoEmpleados()
        },
        error: function(){
            alert("Ha ocurrido un error")
        }
    });}
    else{
        
            parametros = "nombres="+$('#nombres').val()+"&apellidos="+$('#apellidos').val()+"&fechaNacimiento="+$('#fecha-nacimiento').val()+"&identidad="+$('#identidad').val()+"&direccion="+$('#direccion').val()+"&telefono="+$("#telefono").val()
            +"&email="+$('#email').val()+"&genero="+$('input:radio[name=genero]:checked').val()+"&campus="+$("#campus-trabajo-empleado").val()+"&estadoCivil="+$('#estado-civil-empleado').val()+"&sueldoBase="+$('#sueldo-base').val()+"&tipoEmpleado="+$('#tipo-empleado').val()+"&cargo="+$('#cargo').val()+
            "&contrasenia="+$('#contrasenia').val()+"&numeroEmpleado="+$('#numero-empleado').val();
       $.ajax({
            url:"/guardar-empleado-admin",
            method: "POST",
            data: parametros,
            datatype: 'json',
            success:function(respuesta){
                alert("Se creó el empleado con Éxito")
                LimpiarTodoEmpleados()
                
            },
            error: function(){
                alert("Ha ocurrido un error")
            }
        });
    }
}
else{
    alert(validacionesEmpleado())
}

    
})

$('#crear-alumno').click(function(){
      if(validacionesEstudiantes()==''){  parametros = "nombres="+$('#nombres-alumno').val()+"&apellidos="+$('#apellidos-alumno').val()+"&fechaNacimiento="+$('#fecha-nacimiento-alumno').val()+"&identidad="+$('#identidad-alumno').val()+"&direccion="+$('#direccion-alumno').val()+"&telefono="+$("#telefono-alumno").val()
        +"&email="+$('#email-alumno').val()+"&genero="+$('input:radio[name=genero-alumno]:checked').val()+"&campus="+$("#campus-alumno").val()+"&estadoCivil="+$('#estado-civil-alumno').val()+  "&cuenta="+$('#numero-cuenta').val()+"&codigoCarrera="+$('#carrera').val()+"&promedio="+$('#promedio').val()+
        "&clasesAprobadas="+$('#clases-aprobadas').val()+"&contrasenia="+$('#contrasenia-alumno').val();
        console.log(parametros)
    $.ajax({
        url:"/guardar-alumno",
        method: "POST",
        data: parametros,
        datatype: 'json',
        success:function(respuesta){
            alert("Se creó el Alumno con Éxito")
            limpiarTodoEstudiantes()
            
        },
        error: function(){
            alert("Ha ocurrido un error")
        }
    });}
    else{
        alert(validacionesEstudiantes())
    }
})

function validacionesEmpleado(){
    var errores = ''
    if($('#nombres').val()==''){
        errores +='nombres vacios '
    }
    if($('#apellidos').val()==''){
        errores +='apellidos vacios '
    }
    if($('#fecha-nacimiento').val()==''){
        errores +='fecha nacimiento vacias '
    }
    if($('#identidad').val()==''){
        errores +='identidad vacia '
    }
    if($('#direccion').val()==''){
        errores +='Direccion vacia '
    }
    if($("#telefono").val()==''){
        errores +='telefono vacias '
    }
    if($('#email').val()==''){
        errores +='email vacio '
    }
    if($('input:radio[name=genero]:checked').val()==''){
        errores +='debe seleccionar un género '
    }
    if($("#campus-trabajo-empleado").val()==''){
        errores +='debe seleccionar un campus '
    }
    if($('#estado-civil-empleado').val()==''){
        errores +='debe seleccionar un estado civil '
    }
    if($('#sueldo-base').val()==''){
        errores +='sueldo base vacio '
    }
    if($('#tipo-empleado').val()==''){
        errores +='Debe seleccionar tipo de empleado '
    }
    if($('#cargo').val()==''){
        errores +='Debe seleccionar un cargo '
    }
    if($('#contrasenia').val()==''){
        errores +='Contraseña Vacia '
    }
    if($('#numero-empleado').val()==''){
        errores +='Debe de llenar el número de empleado '
    }
    if($('#numero-empleado').val().length!=4){
        errores +='El número de empleado debe tener 4 digitos '
    }
    return errores;
}

function validacionesEstudiantes(){
    var errores=''
    if($('#nombres-alumno').val()==''){
        errores +='nombres vacios '
    }
    if($('#apellidos-alumno').val()==''){
        errores +='apellidos vacios '
    }
    if($('#fecha-nacimiento-alumno').val()==''){
        errores +='fecha nacimiento vacias '
    }
    if($('#identidad-alumno').val()==''){
        errores +='identidad vacia '
    }
    if($('#direccion-alumno').val()==''){
        errores +='Direccion vacia '
    }
    if($("#telefono-alumno").val()==''){
        errores +='telefono vacias '
    }
    if($('#email-alumno').val()==''){
        errores +='email vacio '
    }
    if($('input:radio[name=genero-alumno]:checked').val()==''){
        errores +='debe seleccionar un género '
    }
    if($("#campus-alumno").val()==''){
        errores +='debe seleccionar un campus '
    }
    if($('#estado-civil-alumno').val()==''){
        errores +='debe seleccionar un estado civil '
    }
    if($('#numero-cuenta').val()==''){
        errores +='Número de Cuenta vacia '
    }
    if($('#carrera').val()==''){
        errores +='debe seleccionar una carrera '
    }
    if($('#promedio').val()==''){
        errores +='Promedio Vacio '
    }
    if($('#clases-aprobadas').val()==''){
        errores +='Clases Aprobadas vacia '
    }
    if($('#contrasenia-alumno').val()==''){
        errores +='Contraseña vacia '
    }
    if($('#numero-cuenta').val().length != 11){
        errores +='Numero de cuenta debe tener 11 dígitos '
    }
    return errores;
}

function LimpiarTodoEmpleados(){
    $('#nombres').val('')
    $('#apellidos').val('')
    $('#fecha-nacimiento').val('')
    $('#identidad').val('')
    $('#direccion').val('')
    $("#telefono").val('')
    $('#email').val('')
    $('input:radio[name=genero]:checked').prop('checked', false);
    $('#sueldo-base').val('')
    $('#contrasenia').val('')
    $('#numero-empleado').val('')
}

function limpiarTodoEstudiantes(){
    $('#nombres-alumno').val('')
    $('#apellidos-alumno').val('')
    $('#fecha-nacimiento-alumno').val('')
    $('#identidad-alumno').val('')
    $('#direccion-alumno').val('')
    $("#telefono-alumno").val('')
    $('#email-alumno').val('')
    $('input:radio[name=genero-alumno]:checked').prop('checked', false);
    $('#numero-cuenta').val('')
    $('#promedio').val('')
    $('#clases-aprobadas').val('')
    $('#contrasenia-alumno').val('')
}