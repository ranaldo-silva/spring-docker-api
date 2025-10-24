package com.example.spring_docker_api.controller;

import com.example.spring_docker_api.entity.Mecanico;
import com.example.spring_docker_api.repository.MecanicoRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/mecanicos")
public class MecanicoController {

    private final MecanicoRepository repository;

    public MecanicoController(MecanicoRepository repository) {
        this.repository = repository;
    }

    @GetMapping
    public List<Mecanico> listar() {
        return repository.findAll();
    }

    @PostMapping
    public Mecanico salvar(@RequestBody Mecanico m) {
        return repository.save(m);
    }
}
