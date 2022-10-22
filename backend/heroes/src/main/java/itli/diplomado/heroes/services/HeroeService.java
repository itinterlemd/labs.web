package itli.diplomado.heroes.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import itli.diplomado.heroes.models.Heroe;
import itli.diplomado.heroes.repository.HeroeRepository;

@Service
@Transactional(noRollbackFor = Exception.class)
public class HeroeService {

    @Autowired
    HeroeRepository heroeRepository;
    
    /**
     * Consulta todos los heroes
     * @return
     */
    public List<Heroe> getList(){        
        return heroeRepository.findAll();                
    }
    
    /**
     * Guardar un Heroe
     * @param heroe
     * @return
     */
    public Heroe save(Heroe heroe) {
        
         heroeRepository.save(heroe);
         return heroe;
    }
    
    /**
     * Borrar un heroe
     * @param id
     */
    public void delete(Integer id) {
        
        heroeRepository.deleteById(id); 
    }
    
    /**
     * Guardar un Heroe
     * @param heroe
     * @return
     */
    public Heroe update(Heroe heroe) {
        return heroeRepository.save(heroe);
    }
    
}
