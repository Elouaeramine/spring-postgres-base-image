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

    @GetMapping(produces = MediaType.TEXT_HTML_VALUE)
    public ResponseEntity<List<Product>> readProducts () {
        
        String html = "<html>\n" + "<header><title>Welcome</title></header>\n" +
          "<body>\n" + "Hello world\n"+ productService.readProducts() + "</body>\n" + "</html>";
        return html;
    }
}
