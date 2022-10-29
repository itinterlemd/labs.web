/**
 * 
 */
package itli.diplomado.heroes.models;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

/**
 * @author enunezt
 *
 */
@Entity (name="HEROES" )
public class Heroe implements Serializable{
    
    @Id
    @Column(name="HEROE_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id; //el nombre no necesariamente es igual
    
    @Column(name="NAME")
    private String name;
    
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "PODER_ID", foreignKey = @ForeignKey(name = "FK_HEROE_PODER"))
    private Poder poder;
    
    @ManyToMany(cascade = { CascadeType.ALL })
    @JoinTable(name = "REL_HEROE_TIPO",
            joinColumns = { @JoinColumn(name = "HEROE_ID") },
            inverseJoinColumns = { @JoinColumn(name = "TIPO_ID") })
    private Set<Tipo> tipos = new HashSet<Tipo>(); 
    
    
    public Set<Tipo> getTipos() {
        return tipos;
    }
    public void setTipos(Set<Tipo> tipos) {
        this.tipos = tipos;
    }
    public Poder getPoder() {
        return poder;
    }
    public void setPoder(Poder poder) {
        this.poder = poder;
    }
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
