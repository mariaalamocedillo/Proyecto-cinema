package es.mariaac.cinema.services;

import es.mariaac.cinema.entities.Cliente;
import es.mariaac.cinema.entities.Reserva;
import es.mariaac.cinema.entities.Sala;
import es.mariaac.cinema.repositories.ReservaRepository;
import es.mariaac.cinema.repositories.SalaRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class ReservaService {
    @Inject
    ReservaRepository reservaRepository;

    public List<Reserva> findAll () {
        return reservaRepository.findAll();
    }

    public Optional<Reserva> buscarPorId(Long id) {
        return reservaRepository.findOptionalBy(id);
    }

    public void guardar(Reserva reserva){reservaRepository.save(reserva);}


}