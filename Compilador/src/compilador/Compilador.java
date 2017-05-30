package compilador;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
        parser.addFile(new FileInputStream("c:\\Users\\cnt\\Documents\\compilador.txt"));
        System.out.println(parser.toString());
      
    }
    
}
