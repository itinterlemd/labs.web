package itli.diplomado.heroes.services;

import java.util.List;
import java.util.Optional;

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
         heroe = heroeRepository.findById(heroe.getId()).get();
         System.out.println(heroe.getPoder());
         
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
    
    /**
     * 
     * @param id
     * @return
     */
    public boolean existsById(int id){
        return heroeRepository.existsById(id);
    }
    
    public Heroe findById(int id){    
        Optional<Heroe> e=heroeRepository.findById(id);
        
        e.ifPresent((value)->{
            System.out.println("Heore tipos : " + value.getTipos().size());
        });
               
        // heroeRepository.findById(id).map(Heroe::getTipos);
        return e.get();
    }
    
}
