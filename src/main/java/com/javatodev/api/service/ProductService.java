package com.javatodev.api.service;

import com.javatodev.api.model.Product;
import com.javatodev.api.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;

    public List<Product> readProducts () {
        System.out.println("Successfully reached find all method");
        return productRepository.findAll();
    }

}
