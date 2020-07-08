/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author luisa
 */
public class Principal {
    
    public static void main(String[] args) throws Exception {
        String ruta1 = "C:/Users/luisa/Documents/NetBeansProjects/Analizador-v3/src/codigo/Lexer.flex";
        String ruta2 = "C:/Users/luisa/Documents/NetBeansProjects/Analizador-v3/src/codigo/LexerCup.flex";
        String[] rutaS = {"-parser","Sintax","C:/Users/luisa/Documents/NetBeansProjects/Analizador-v3/src/codigo/Sintax.cup"};
        generar(ruta1,ruta2,rutaS);
        
    }
    
    public static void generar(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception
    {
        File archivo;
        archivo = new File(ruta1);
        JFlex.Main.generate(archivo);
        
        archivo = new File(ruta2);
        JFlex.Main.generate(archivo);
        
        java_cup.Main.main(rutaS);
        
        Path rutaSym = Paths.get("C:/Users/luisa/Documents/NetBeansProjects/Analizador-v3/src/codigo/sym.java");
        if(Files.exists(rutaSym))
        {
            Files.delete(rutaSym);
        }
        
        Path rutaSin = Paths.get("C:/Users/luisa/Documents/NetBeansProjects/Analizador-v3/src/codigo/Sintax.java");
        if(Files.exists(rutaSin))
        {
            Files.delete(rutaSin);
        }
        
        Files.move(
                Paths.get("C:/Users/luisa/Documents/NetBeansProjects/Analizador-v3/Sym.java"),
                Paths.get("C:/Users/luisa/Documents/NetBeansProjects/Analizador-v3/src/codigo/sym.java")
        );
        Files.move(
                Paths.get("C:/Users/luisa/Documents/NetBeansProjects/Analizador-v3/Sintax.java"),
                Paths.get("C:/Users/luisa/Documents/NetBeansProjects/Analizador-v3/src/codigo/Sintax.java")
        );
        
        
    }
    
}
