/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package compilador;

import java.io.FileInputStream;

/**
 *
 * @author 110243
 */
public class Compilador {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        // TODO code application logic here
        
        parser parser = new parser();
        parser.addFile(new FileInputStream("c:\\Users\\110243\\Documents\\compilador.txt"));
      
    }
    
}
