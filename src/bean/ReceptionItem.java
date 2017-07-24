/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author Younes
 */
@Entity
public class ReceptionItem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    private Produit produit;
    private Long qte;
    private Long qteAvoir;
    @ManyToOne
    private Magasin magasin;
    @ManyToOne
    private Reception reception;
   
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Produit getProduit() {
        return produit;
    }

   

    public void setProduit(Produit produit) {
        this.produit = produit;
    }

    public Long getQte() {
        if(qte == null){
            qte = 0l;
        }
        return qte;
    }

    public void setQte(Long qte) {
        this.qte = qte;
    }

    public Long getQteAvoir() {
        if(qteAvoir == null){
            qteAvoir = 0l;
        }
        return qteAvoir;
    }

    public void setQteAvoir(Long qteAvoir) {
        this.qteAvoir = qteAvoir;
    }



    public Magasin getMagasin() {
        return magasin;
    }

    public void setMagasin(Magasin magasin) {
        this.magasin = magasin;
    }

    public Reception getReception() {
        return reception;
    }

    public void setReception(Reception reception) {
        this.reception = reception;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReceptionItem)) {
            return false;
        }
        ReceptionItem other = (ReceptionItem) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bean.ReceptionItem[ id=" + id + " ]";
    }

}
