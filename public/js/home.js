

$("#go-login").click(function(){
    $.ajax({
        url:"/login",
        method: "GET",
        success:function(respuesta){
            location.href = '/login'
                
        }
    });
})
