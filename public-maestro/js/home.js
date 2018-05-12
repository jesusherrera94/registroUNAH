

$("#go-logout").click(function(){
    $.ajax({
        url:"/logout",
        method: "GET",
        success:function(respuesta){
            console.log('respuesta exitosa')
            location.href = '/';
                
        }
    });
})
