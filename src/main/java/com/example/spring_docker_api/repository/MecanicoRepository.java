package com.example.spring_docker_api.repository;

import com.example.spring_docker_api.entity.Mecanico;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MecanicoRepository extends JpaRepository<Mecanico, Long> {
}
