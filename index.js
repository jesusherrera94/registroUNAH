var express = require('express');
var myParser = require("body-parser");
var app = express();
var fs = require("fs");
var path    = require("path");
var mysql = require("mysql");


var credenciales = {
    user:"root",
    password:"Alis&dei15",
    host:"localhost",
    database:"db_unah",
    port:"3306"
};



app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');
app.use(myParser.urlencoded({extended : true}));

//app.use(express.static("public"));
app.use(express.static(__dirname + '/public'));
app.get("/", function(req, res){

})
app.get("/login", function(req, res){
    console.log('peticion recibida')
    res.render(path.join(__dirname+'/public/html/login'));

})
app.get("/admin", function(req, res){
    console.log('peticion recibida')
    res.render(path.join(__dirname+'/public/html/admin'));
})

app.post('/crear-campus', function(req,res){
    //Body es un JSON con todos los parametros en post
	var conexion = mysql.createConnection(credenciales);
	conexion.query(
		"INSERT INTO TBL_CAMPUS(CODIGO_CAMPUS, NOMBRE_CAMPUS) VALUES (NULL,?)", 
		[
			req.body.nombreCampus
		],
		function(error, resultado){
			if (resultado.affectedRows==1){
				
						conexion.end();
						res.send("Creación Exitosa");		
					
				
			}
			
		});
})

app.get("/obtener-campus",function(peticion, respuesta){
	var conexion = mysql.createConnection(credenciales);
	conexion.query("SELECT CODIGO_CAMPUS, NOMBRE_CAMPUS FROM TBL_CAMPUS", function(error, informacion, campos){
		conexion.end();
		respuesta.send(informacion);
	});
});


app.get("/obtener-tipos-aula",function(peticion, respuesta){
	var conexion = mysql.createConnection(credenciales);
	conexion.query("SELECT CODIGO_TIPO_AULA, TIPO_AULA FROM TBL_TIPOS_AULAS", function(error, informacion, campos){
		conexion.end();
		respuesta.send(informacion);
	});
});

app.get("/obtener-edificios",function(peticion, respuesta){
	var conexion = mysql.createConnection(credenciales);
	conexion.query("SELECT CODIGO_EDIFICIO, NOMBRE_EDIFICIO FROM TBL_EDIFICIOS", function(error, informacion, campos){
		conexion.end();
		respuesta.send(informacion);
	});
})
app.post('/crear-edificio', function(req,res){
    var values = []
    for (let i = 0; i < req.body.edificio.length; i++) {
        values.push([req.body.edificio[i].nombreEdificio,req.body.edificio[i].aliasEdificio,Number(req.body.edificio[i].codigoCampus)])
    }
	var conexion = mysql.createConnection(credenciales);
	conexion.query(
		"INSERT INTO TBL_EDIFICIOS( NOMBRE_EDIFICIO, ALIAS_EDIFICIO, CODIGO_CAMPUS) VALUES ?", 
		[
			values
		],
		function(error, resultado){
            if (error) throw error;
			if (resultado.affectedRows>1 || resultado.affectedRows==1 ){
				
						conexion.end();
						res.send("Creación Exitosa");		
					
				
			}
			
		});
})

app.post('/crear-aula', function(req,res){
    var values = []
    for (let i = 0; i < req.body.aulas.length; i++) {
        values.push([req.body.aulas[i].numeroAula,req.body.aulas[i].codigoTipoAula,Number(req.body.aulas[i].codigoEdificio)])
    }
	var conexion = mysql.createConnection(credenciales);
	conexion.query(
		"INSERT INTO TBL_AULAS(NUMERO_AULA, CODIGO_TIPO_AULA, CODIGO_EDIFICIO) VALUES ?", 
		[
			values
		],
		function(error, resultado){
            if (error) throw error;
			if (resultado.affectedRows>1 || resultado.affectedRows==1 ){
				
						conexion.end();
						res.send("Creación Exitosa");		
					
				
			}
			
		});
})

app.get("/obtener-estado-civil",function(peticion, respuesta){
	var conexion = mysql.createConnection(credenciales);
	conexion.query("SELECT CODIGO_ESTADO_CIVIL, NOMBRE_ESTADO_CIVIL FROM TBL_ESTADOS_CIVILES", function(error, informacion, campos){
		conexion.end();
		respuesta.send(informacion);
	});
});

app.get("/obtener-tipo-empleado",function(peticion, respuesta){
	var conexion = mysql.createConnection(credenciales);
	conexion.query("SELECT CODIGO_TIPO_EMPLEADO, NOMBRE_TIPO_EMPLEADO FROM TBL_TIPO_EMPLEADO", function(error, informacion, campos){
		conexion.end();
		respuesta.send(informacion);
	});
});

app.get("/obtener-cargo",function(peticion, respuesta){
	var conexion = mysql.createConnection(credenciales);
	conexion.query("SELECT CODIGO_CARGO, NOMBRE_CARGO FROM TBL_CARGOS", function(error, informacion, campos){
		conexion.end();
		respuesta.send(informacion);
	});
});
app.get("/obtener-titularidad",function(peticion, respuesta){
	var conexion = mysql.createConnection(credenciales);
	conexion.query("SELECT CODIGO_TITULARIDAD, NOMBRE_TITULARIDAD FROM TBL_TITULARIDAD", function(error, informacion, campos){
		conexion.end();
		respuesta.send(informacion);
	});
});
app.get("/obtener-especializacion",function(peticion, respuesta){
	var conexion = mysql.createConnection(credenciales);
	conexion.query("SELECT CODIGO_ESPECIALIZACION, DESCRIPCION FROM TBL_AREA_ESPECIALIZACIONES", function(error, informacion, campos){
		conexion.end();
		respuesta.send(informacion);
	});
});

app.post("/guardar-empleado", function(peticion, respuesta){
	
	var conexion = mysql.createConnection(credenciales);
	conexion.query(
		`INSERT INTO TBL_PERSONAS
		(CODIGO_PERSONA, CODIGO_GENERO, CODIGO_CAMPUS, CODIGO_ESTADO_CIVIL, NOMBRE, APELLIDO, FECHA_NACIMIENTO, IDENTIDAD, DIRECCION, TELEFONO, CORREO_ELECTRONICO) 
		VALUES (NULL,?,?,?,?,?,?,?,?,?,?)`, 
		[
			peticion.body.genero,
			peticion.body.campus,
			peticion.body.estadoCivil,
			peticion.body.nombres,
			peticion.body.apellidos,
			peticion.body.fechaNacimiento,
			peticion.body.identidad,
			peticion.body.direccion,
			peticion.body.telefono,
			peticion.body.email
		],
		function(error, resultado){
			if (resultado.affectedRows==1){
				conexion.query("INSERT INTO TBL_EMPLEADOS(CODIGO_EMPLEADO, NUMERO_EMPLEADO, SUELDO_BASE, CODIGO_TIPO_EMPLEADO, CODIGO_CARGO, CONTRASENIA) VALUES (?,?,?,?,?,?)",
					[resultado.insertId,
						peticion.body.numeroEmpleado,
						peticion.body.sueldoBase,
						peticion.body.tipoEmpleado,
						peticion.body.cargo,
						peticion.body.contrasenia
					],
					function(errorSelect, resultado2){
						if (errorSelect) throw errorSelect;

						if(resultado2.affectedRows==1){
							conexion.query(`INSERT INTO TBL_MAESTROS(CODIGO_MAESTRO, CODIGO_ESPECIALIZACION, CODIGO_TITULARIDAD) VALUES (?,?,?)`,[
								resultado.insertId,
								peticion.body.especializacion,
								peticion.body.titularidad
							],function(error3,resultado3){
								if(resultado3.affectedRows==1){
								conexion.end();
								respuesta.send('Inserts exitosos');
								}
							})

						}
								
					}
				);
			}
			
		});
});


app.post("/guardar-empleado-admin", function(peticion, respuesta){
	
	var conexion = mysql.createConnection(credenciales);
	conexion.query(
		`INSERT INTO TBL_PERSONAS
		(CODIGO_PERSONA, CODIGO_GENERO, CODIGO_CAMPUS, CODIGO_ESTADO_CIVIL, NOMBRE, APELLIDO, FECHA_NACIMIENTO, IDENTIDAD, DIRECCION, TELEFONO, CORREO_ELECTRONICO) 
		VALUES (NULL,?,?,?,?,?,?,?,?,?,?)`, 
		[
			peticion.body.genero,
			peticion.body.campus,
			peticion.body.estadoCivil,
			peticion.body.nombres,
			peticion.body.apellidos,
			peticion.body.fechaNacimiento,
			peticion.body.identidad,
			peticion.body.direccion,
			peticion.body.telefono,
			peticion.body.email
		],
		function(error, resultado){
			if (resultado.affectedRows==1){
				conexion.query("INSERT INTO TBL_EMPLEADOS(CODIGO_EMPLEADO, NUMERO_EMPLEADO, SUELDO_BASE, CODIGO_TIPO_EMPLEADO, CODIGO_CARGO, CONTRASENIA) VALUES (?,?,?,?,?,?)",
					[resultado.insertId,
						peticion.body.numeroEmpleado,
						peticion.body.sueldoBase,
						peticion.body.tipoEmpleado,
						peticion.body.cargo,
						peticion.body.contrasenia
					],
					function(errorSelect2, resultado2){
						if (errorSelect2) throw errorSelect;

						if(resultado2.affectedRows==1){
							conexion.end();
							respuesta.send('Inserts exitosos');

						}
								
					}
				);
			}
			
		});
});

app.listen(2020);