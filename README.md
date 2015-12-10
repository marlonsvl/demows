# Demo WS (Spring Boot App)

Niveles de madurez del Dr. Leonard Richardson http://martinfowler.com/articles/richardsonMaturityModel.html


## Proyecto RESTful accediendo a MySQL con JPA

El proyecto ha sido creado usando Spring Boot App.

La base de datos se llama 'demows' y se crea solamente una tabla llamada 'person'

La configuración de la base de datos se la realiza en un archivo llamado application.properties donde se encuentran los datos de configuración para poder acceder a la bd

Se usa ddl.auto = update para que el schema de la base de datos sea creado y modificado automáticamente de acuerdo a las entidades encontradas en el proyecto.

No olvidar todas las librerías que se agregan en el archivo pom.xml


### Pruebas

Para probar los servicios web se ejecuta desde STS click derecho en el proyecto > Run as > Spring Boot App

Para ejecutarlo desde la consola se ejecuta el siguiente comando:
```
mvn spring-boot:run
```

Mas info aqui http://docs.spring.io/spring-boot/docs/current/reference/html/using-boot-running-your-application.html

### Usando el cliente curl

####curl http://localhost:8080/demows/

Se muestra los siguiente:

```
{
  "_links" : {
    "people" : {
      "href" : "http://localhost:8080/people{?page,size,sort}",
      "templated" : true
    }
  }
}
```

####curl http://localhost:8080/demows/people

Se muestra los siguiente

```
{
  "_links" : {
    "self" : {
      "href" : "http://localhost:8080/people{?page,size,sort}",
      "templated" : true
    },
    "search" : {
      "href" : "http://localhost:8080/people/search"
    }
  },
  "page" : {
    "size" : 20,
    "totalElements" : 0,
    "totalPages" : 0,
    "number" : 0
  }
}
```

####curl -i -X POST -H "Content-Type:application/json" -d '{  "firstName" : "Marlon",  "lastName" : "Viñan" }' http://localhost:8080/people

###Explicación:
* -i : Asegura que se pueda ver el mensaje de respuesta incluyendo sus cabeceras. Se muestra la URI de la nueva persona creaada en el atributo _Location_
* -X POST : Se utiliza para crear una nueva entrada
* -H "Content-Type:application/json" Establece el tipo de contenido que la aplicación va a aceptar 
* -d '{ "firstName" : "Marlon", "lastName" : "Viñan" }' es la data que va a ser enviada


Se muestra los siguiente:

```
HTTP/1.1 201 Created
Server: Apache-Coyote/1.1
Location: http://localhost:8080/people/1
Content-Length: 0
Date: Wed, 26 Feb 2014 20:26:55 GMT
```

####curl http://localhost:8080/demows/people/1

```
{
  "firstName" : "Frodo",
  "lastName" : "Baggins",
  "_links" : {
    "self" : {
      "href" : "http://localhost:8080/demows/people/1"
    }
 }
```

####curl http://localhost:8080/demows/people/search

```
{
  "_links" : {
    "findByLastName" : {
      "href" : "http://localhost:8080/demowspeople/search/findByLastName{?name}",
      "templated" : true
    }
}
```

####curl http://localhost:8080/demows/people/search/findByLastName?name=Viñan

```
{
  "_embedded" : {
    "people" : [ {
      "firstName" : "Marlon",
      "lastName" : "Viñan",
      "_links" : {
        "self" : {
          "href" : "http://localhost:8080/demows/people/2"
        }
      }
    } ]
}
```

####Se puede usar también PUT, PATCH and DELETE REST 

######curl -X PUT -H "Content-Type:application/json" -d '{ "firstName": "Bilbo", "lastName": "Baggins" }' http://localhost:8080/demows/people/1
######curl http://localhost:8080/demows/people/1



######curl -X PATCH -H "Content-Type:application/json" -d '{ "firstName": "Bilbo Jr." }' http://localhost:8080/demows/people/1
######curl http://localhost:8080/demows/people/1


######curl -X DELETE http://localhost:8080/demows/people/1
######curl http://localhost:8080/demows/people

#####Enlace para la resolución de problemas de empaquetado en war o jar

http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#build-tool-plugins-maven-packaging

https://spring.io/blog/2014/03/07/deploying-spring-boot-applications

#####Enlace para propiedades en el archivo application.properties

http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#common-application-properties

#####Otros enlaces sobre documentacion de servicios web
http://docs.spring.io/spring-data/rest/docs/current/reference/html/
http://spring.io/guides/tutorials/bookmarks/
https://github.com/spring-projects/spring-security-oauth/tree/master/tests/annotation/jdbc




