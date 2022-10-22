package itli.diplomado.heroes.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import itli.diplomado.heroes.models.Heroe;
import itli.diplomado.heroes.services.HeroeService;

@RestController
@RequestMapping("/api")
//@CrossOrigin(origins = "http://localhost:4200")
public class HeroeControlller {
    
    @Autowired
    HeroeService heroeService;    
    @GetMapping("/heroes")
    public ResponseEntity<List<Heroe>> getList(){        
        List<Heroe> heroesList=heroeService.getList();
        return new ResponseEntity<List<Heroe>>(heroesList,HttpStatus.OK);
    }
    
    
    @PostMapping("/heroes")
    public ResponseEntity<?> create(@RequestBody Heroe heroe){        
       
        if(heroe.getName() ==null || "".equals(heroe.getName())) {
            return new ResponseEntity<String>("El nombre es obligatorio.",HttpStatus.BAD_REQUEST);
        }
        
        try {
            Heroe heroeSaved=heroeService.save(heroe);
            return new ResponseEntity<Heroe>(heroeSaved,HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("Error en el servidor",HttpStatus.INTERNAL_SERVER_ERROR);
        }
        
    }
    

}
