package es.mariaac.cinema.controllers;

import es.mariaac.cinema.entities.Cliente;
import es.mariaac.cinema.entities.Pelicula;
import es.mariaac.cinema.services.ClienteService;
import es.mariaac.cinema.services.PeliculaService;
import es.mariaac.cinema.services.ProyeccionService;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.mvc.binding.BindingResult;
import jakarta.mvc.binding.ParamError;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.executable.ExecutableType;
import jakarta.validation.executable.ValidateOnExecution;
import jakarta.ws.rs.*;
import lombok.extern.slf4j.Slf4j;

import java.util.Objects;
import java.util.Optional;

import static java.util.stream.Collectors.groupingByConcurrent;
import static java.util.stream.Collectors.toList;

@Slf4j
@Path("/usuario")
@Controller
@RequestScoped
public class ClienteController {
    @Inject
    private Models models;

    @Inject
    ClienteService clienteService;

    @Inject
    private BindingResult bindingResult;

    @Inject
    private Mensaje mensaje;

    @Inject
    private Errores errores;

    @GET
    @Path("/")
    public String index() {
        return "perfil/login";
    }

    @POST
    @Path("login")
    public String login(@FormParam("email") String email, @FormParam("contrasena") String psswd) {
        if (clienteService.logear(email, psswd)) {
            return "perfil/perfil";
        } else{
            models.put("mensajeError", "Nombre de usuario o contraseña inválido");
            return "perfil/login";
        }

    }

    @GET
    @Path("registro")
    public String nueva() {
        Cliente user = new Cliente();
        models.put("cliente", user);
        return "perfil/signup";
    }

    @POST
    @Path("/registro/submit")
    @ValidateOnExecution(type = ExecutableType.NONE)
    public String nuevaSubmit(@FormParam("email") String email, @FormParam("contrasena") String psswd,
                              @FormParam("tlfn") Long tlfn, @FormParam("nombre") String nombre) {
        Cliente cliente = new Cliente(nombre, tlfn, email, psswd);
        System.out.println(cliente);
        log.debug("Nuevo cliente recibido: {}", cliente);
        if (clienteService.buscarPorEmail(cliente.getEmail()) != null){
            mensaje.setTexto("Este email ya está asociado a una cuenta");
            return "perfil/signup";
        }

        try {
            clienteService.guardar(cliente);
            mensaje.setTexto("La cuenta de " + cliente.getEmail() + " se guardó satisfactoriamente ! ");
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            mensaje.setTexto("Ocurrió un error y la cuenta de " + cliente.getEmail() + " (" + cliente.getNombre() + ") no se pudo almacenar.");
            return "perfil/signup";
        }

        return "perfil/perfil";
    }


/*
    @POST
    @Path("/registro/submit")
    @ValidateOnExecution(type = ExecutableType.NONE)
    public String nuevaSubmit(@Valid @BeanParam Cliente cliente) {
        log.debug("Nuevo cliente recibido: {}", cliente);
        if (clienteService.buscarPorEmail(cliente.getEmail()) != null){
            mensaje.setTexto("Este email ya está asociado a una cuenta");
            return "perfil/signup";
        }
        if (bindingResult.isFailed()) {
            logErrores();
            setErrores();
            models.put("cliente", cliente);
            return "perfil/signup";
        }
        try {
            clienteService.guardar(cliente);
            mensaje.setTexto("La cuenta de " + cliente.getEmail() + " se guardó satisfactoriamente ! ");
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            mensaje.setTexto("Ocurrió un error y la cuenta de " + cliente.getEmail() + " (" + cliente.getNombre() + ") no se pudo almacenar.");
            return "perfil/signup";
        }

        return "perfil/perfil";
    }
*/

        private void setErrores() {
        errores.setErrores(bindingResult.getAllErrors()
                .stream()
                .collect(toList()));
    }

    private void logErrores() {
        bindingResult.getAllErrors()
                .stream()
                .forEach((ParamError t) ->
                        log.debug("Error de validación: {} {}", t.getParamName(), t.getMessage()));
    }

}