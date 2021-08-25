package com.javatodev.api.controller;

import com.javatodev.api.model.Product;
import com.javatodev.api.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/")
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;

    @GetMapping()
    public ResponseEntity<String> readProducts () {
        
        String html = "<html>\n" + "<header><title>Welcome</title></header>\n" +
          "<body>\n" + "Hello From 3S\n"+ productService.readProducts() + "</body>\n" + "</html>";
        return ResponseEntity.ok(html);
    }
}
