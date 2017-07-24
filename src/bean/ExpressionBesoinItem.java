/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

/**
 *
 * @author Younes
 */
@Entity
public class ExpressionBesoinItem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(columnDefinition = "TEXT")
    private String description;
    @OneToOne
    private CategorieProduit categorieProduit;
    @ManyToOne
    private ExpressionBesoin expressionBesoin;
    private Long qteDemande;
    private Long qteConfirme;
    private int etat; // 0 waiting for, 1 trans to demande, 2 ref

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getEtat() {
        return etat;
    }

    public void setEtat(int etat) {
        this.etat = etat;
    }

    public Long getQteConfirme() {
        if (qteConfirme == null) {
            qteConfirme = 0l;
        }
        return qteConfirme;
    }

    public void setQteConfirme(Long qteConfirme) {
        this.qteConfirme = qteConfirme;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public CategorieProduit getCategorieProduit() {
        return categorieProduit;
    }

    public void setCategorieProduit(CategorieProduit categorieProduit) {
        this.categorieProduit = categorieProduit;
    }

    public ExpressionBesoin getExpressionBesoin() {
        return expressionBesoin;
    }

    public void setExpressionBesoin(ExpressionBesoin expressionBesoin) {
        this.expressionBesoin = expressionBesoin;
    }

    public Long getQteDemande() {
        if (qteDemande == null) {
            qteDemande = 0l;
        }
        return qteDemande;
    }

    public void setQteDemande(Long qteDemande) {
        this.qteDemande = qteDemande;
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
        if (!(object instanceof ExpressionBesoinItem)) {
            return false;
        }
        ExpressionBesoinItem other = (ExpressionBesoinItem) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bean.ExpressionBesoinItem[ id=" + id + " ]";
    }

}
