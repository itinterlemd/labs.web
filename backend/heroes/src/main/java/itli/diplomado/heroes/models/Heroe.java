/**
 * 
 */
package itli.diplomado.heroes.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * @author enunezt
 *
 */
@Entity (name="HEROES")
public class Heroe implements Serializable{
    
    @Id
    @Column(name="HEROE_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id; //el nombre no necesariamente es igual
    
    @Column(name="NAME")
    private String name;
    
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
