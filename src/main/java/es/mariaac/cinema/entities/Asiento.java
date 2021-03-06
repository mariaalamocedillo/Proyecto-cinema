package es.mariaac.cinema.entities;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "asiento", uniqueConstraints = {
        @UniqueConstraint(name = "uc_asiento_fila_letra_sala_id", columnNames = {"fila", "letra", "sala_id"})
})
public class Asiento {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(nullable = false, length = 1)
    private String fila;

    @Column(nullable = false, length = 1)
    private String letra;

    @ManyToOne(optional = false)
    @JoinColumn(name = "sala_id", nullable = false)
    private Sala sala;

    public String getName() {
        return getFila() + getLetra();
    }
}