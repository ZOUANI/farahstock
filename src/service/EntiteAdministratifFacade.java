/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.EntiteAdministratif;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Younes
 */

public class EntiteAdministratifFacade extends AbstractFacade<EntiteAdministratif> {

    @PersistenceContext(unitName = "toBeDeletePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EntiteAdministratifFacade() {
        super(EntiteAdministratif.class);
    }
    
}
