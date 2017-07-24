/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.CategorieProduit;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Younes
 */

public class CategorieProduitFacade extends AbstractFacade<CategorieProduit> {

    @PersistenceContext(unitName = "toBeDeletePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CategorieProduitFacade() {
        super(CategorieProduit.class);
    }
    
}
