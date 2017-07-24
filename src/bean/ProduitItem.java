/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
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
public class ProduitItem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    private Produit produit;
    private Long qteDemande;
    private Long qteConfirm;

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

    public Long getQteDemande() {
        if(qteDemande == null){
            qteDemande = 0l;
        }
        return qteDemande;
    }

    public void setQteDemande(Long qteDemande) {
        this.qteDemande = qteDemande;
    }

    public Long getQteConfirm() {
        if(qteConfirm == null){
            qteConfirm = 0l;
        }
        return qteConfirm;
    }

    public void setQteConfirm(Long qteConfirm) {
        this.qteConfirm = qteConfirm;
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
        if (!(object instanceof ProduitItem)) {
            return false;
        }
        ProduitItem other = (ProduitItem) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bean.ProduitItem[ id=" + id + " ]";
    }

}
