/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

/**
 *
 * @author noe.aguilar
 */
import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextPane;
import javax.swing.UIManager;
 
public class CompiladorGrafico extends JFrame implements ActionListener {

    String path;
    public CompiladorGrafico(){
        //Para poder cerrar la ventana
        setDefaultCloseOperation( JFrame.EXIT_ON_CLOSE );
 
        //Se agrega un layout
        setLayout( new BorderLayout() );
 
        //Se crea el editor de texto y se agrega a un scroll
        txp = new JTextPane();
        txp.setEditable(false);
        JScrollPane jsp = new JScrollPane();
        jsp.setViewportView( txp );
 
        add( jsp, BorderLayout.CENTER );
 
        //Se crea un boton para abrir el archivo
        JButton btn = new JButton( "Abrir" );
        btn.addActionListener( this );
        JButton btnCompilar = new JButton( "Compilar" );
        btnCompilar.addActionListener( this );
       
        add( btn, BorderLayout.NORTH );
        add( btnCompilar, BorderLayout.SOUTH );
 
        //Tamaño de la ventana
        setSize( 500, 500 );
 
        //Esto sirve para centrar la ventana
        setLocationRelativeTo( null );
   
        //Hacemos visible la ventana
        setVisible( true );
    }
 
    //------------------------------Action Performed-------------------------------//
    public void actionPerformed( ActionEvent e ){
        JButton btn = (JButton)e.getSource();
        if( btn.getText().equals( "Abrir" ) )
        {
            if( abrirArchivo == null ) abrirArchivo = new JFileChooser();
            //Con esto solamente podamos abrir archivos
            abrirArchivo.setFileSelectionMode( JFileChooser.FILES_ONLY );
 
            int seleccion = abrirArchivo.showOpenDialog( this );
 
            if( seleccion == JFileChooser.APPROVE_OPTION )
            {
                File f = abrirArchivo.getSelectedFile();
                try
                {
                    String nombre = f.getName();
                    path = f.getAbsolutePath();
                    System.out.println(path);
                    String contenido = getArchivo( path );
                    //Colocamos en el titulo de la aplicacion el 
                    //nombre del archivo
                    this.setTitle( nombre );
 
                    //En el editor de texto colocamos su contenido
                    txp.setText( contenido );
 
                }catch( Exception exp){}
            }
        }
        if( btn.getText().equals( "Compilar" ) )
        {

            parser parser = new parser();
            try {
                parser.addFile(new FileInputStream(path.replace("\\","\\\\")));
            } catch (FileNotFoundException ex) {
                Logger.getLogger(CompiladorGrafico.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                //Logger.getLogger(CompiladorGrafico.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Error de sintaxis");
            }
            System.out.println(parser.toString());
        }
    }
    //-----------------------------------------------------------------------------//
 
    //-------------------------Se obtiene el contenido del Archivo----------------//
    public String getArchivo( String ruta ){
        FileReader fr = null;
        BufferedReader br = null;
        //Cadena de texto donde se guardara el contenido del archivo
        String contenido = "";
        try
        {
            //ruta puede ser de tipo String o tipo File
            fr = new FileReader( ruta );
            br = new BufferedReader( fr );
 
            String linea;
            //Obtenemos el contenido del archivo linea por linea
            while( ( linea = br.readLine() ) != null ){ 
                contenido += linea + "\n";
            }
 
        }catch( Exception e ){  }
        //finally se utiliza para que si todo ocurre correctamente o si ocurre 
        //algun error se cierre el archivo que anteriormente abrimos
        finally
        {
            try{
                br.close();
            }catch( Exception ex ){}
        }
        return contenido;
    }
    //-----------------------------------------------------------------------------//
 
    public static void main( String[] arg ){
        try
        {
            //Cambiamos el Look&Feel
            JFrame.setDefaultLookAndFeelDecorated( true );
            UIManager.setLookAndFeel( new com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel() );
        }catch( Exception e ){}
        new CompiladorGrafico();
    }
 
    JTextPane txp;
    JFileChooser abrirArchivo;
}
    
