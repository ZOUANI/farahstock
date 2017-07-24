/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.ProduitItem;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Younes
 */

public class ProduitItemFacade extends AbstractFacade<ProduitItem> {

    @PersistenceContext(unitName = "toBeDeletePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProduitItemFacade() {
        super(ProduitItem.class);
    }
    
}
