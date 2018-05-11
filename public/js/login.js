$('#go').click(function(){
    if($('#cta').val().length < 4){
        $('#error').text('No cumple el formato 4-11 digitos')
        $('#error').css('color','red')
        $('#error').css('display','block')
    }else{
        if($('#cta').val().length > 4 && $('#cta').val().length < 11){
        $('#error').text('No cumple el formato 4-11 digitos')
        $('#error').css('color','red')
        $('#error').css('display','block')
        }else{
            $('#error').text('')
        $('#error').css('color','black')
        $('#error').css('display','none')
        }
    }
})