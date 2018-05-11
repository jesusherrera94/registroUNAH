
(function ($) {
    "use strict"
    var check;
    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');
//esta funcion está pegada al form, por lo tanto tiene que devolver false para poder ejecutar alguna petición al servidor

    $('#go').on('click',function(){

        for(var i=0; i<input.length; i++) {
            //si algo no está bien se detiene el proceso hasta que la info concuerda o sea que si validate retorna falso entonces hay un problema
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }else{
                //petición ajax al servidor
                if($('#pass').val()== '' || $('#cta').val().length ==0){
                    console.log("entro en negacion")
                    $('#pass-validate').addClass('alert-validate');
                }else{

                    $.ajax({
                        url:"/login",
                        method: "GET",
                        success:function(respuesta){
                            location.href ="/admin";
                            check = true;
                        }
                    });
                }
                return false;
            }
        }
        return check;
    });


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
                return false
            }else{
                //aqui hago la validacion de la información, en el caso de que no concuerte se activa las banderas
                if($('#cta').val().length ==0){
                    $('#cta-validate').attr({
                        'data-validate': 'Cuenta Es Requerida',
                        'class':' wrap-input100 validate-input m-b-12 alert-validate'
                    })
                    $('#pass-validate').removeClass('alert-validate');
                }
                else{
                if($('#cta').val().length < 4){
                    $('#cta-validate').attr({
                        'data-validate': 'No cumple el formato 4 y 11 digitos',
                        'class':' wrap-input100 validate-input m-b-12 alert-validate'
                    })
                    $('#pass-validate').removeClass('alert-validate');
                    return false;
                }else{
                    if($('#cta').val().length > 4 && $('#cta').val().length < 11){
                        $('#cta-validate').attr({
                            'data-validate': 'No cumple el formato 4 y 11 digitos',
                            'class':'wrap-input100 validate-input m-b-12 alert-validate'
                        })
                        $('#pass-validate').removeClass('alert-validate');
                    return false;
                    }else{
                        $('#cta-validate').attr({
                            'data-validate': 'Cuenta Es requerida'
                        })
                        $('#pass-validate').removeClass('alert-validate');
                        $('#cta-validate').removeClass('alert-validate');
                    }
                }
            }
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();
        if($('#pass').val()!= ''){
        $('#pass-validate').removeClass('alert-validate');
        }else{
        $(thisAlert).addClass('alert-validate');
        }
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    
    /*==================================================================
    [ Mostrar Contraseña ]*/
    var showPass = 0;
    $('.btn-show-pass').on('click', function(){
        if(showPass == 0) {
            $(this).next('input').attr('type','text');
            $(this).find('i').removeClass('fa-eye');
            $(this).find('i').addClass('fa-eye-slash');
            showPass = 1;
        }
        else {
            $(this).next('input').attr('type','password');
            $(this).find('i').removeClass('fa-eye-slash');
            $(this).find('i').addClass('fa-eye');
            showPass = 0;
        }
        
    });
    

})(jQuery);