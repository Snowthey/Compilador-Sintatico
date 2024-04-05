
import java.io.*;

public class Main_TesteAnalisador {

    public static void main(String[] args) throws FileNotFoundException{
        String arquivo = "C:/Users/sherl/OneDrive/Documents/NetBeansProjects/Prova2/src/codigofonte.txt";
        
        System.out.println("Arquivo analisado: " + arquivo);
        
        BufferedReader texto = new BufferedReader(new FileReader(arquivo));
        
        Lexer AnaliseLexica = new Lexer(texto);
        
        AnalisadorSintatico p = new AnalisadorSintatico(AnaliseLexica);
        
        try{
            p.parse();
        }
        catch(Exception e){
            System.out.println("Falha geral.");
            }
        }
    }


