import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

import java.io.File;
import java.io.PrintWriter;

public class LispLexerApp {
    public static void main(String[] args) {
        try {
            // Get the file path from the command line argument
            String filePath = args[0];

            // Create a CharStream that reads from the specified file
            CharStream charStream = CharStreams.fromFileName(filePath);

            // Create a lexer and parser for the input
            LispLexer lexer = new LispLexer(charStream);
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            LispParser parser = new LispParser(tokens);

            // Parse the input and generate the parse tree
            ParseTree tree = parser.program();

            // Get the vocabulary to convert token types to their names
            Vocabulary vocabulary = lexer.getVocabulary();

            for (Token token : tokens.getTokens()) {
                String tokenInfo = String.format(
                    "[@%d ='%s',<%d:%s>,%d:%d]",
                    token.getTokenIndex(),
                    token.getText(),
                    token.getType(),
                    vocabulary.getSymbolicName(token.getType()),
                    token.getLine(),
                    token.getCharPositionInLine()
                );
                System.out.println(tokenInfo);
            }

            // Print the parse tree (in Lisp format)
            System.out.println(tree.toStringTree(parser));

            // Generate a DOT file for the parse tree
            String dotFilePath = "parse_tree.dot";
            generateDotFile(tree, dotFilePath);
            System.out.println("DOT file created: " + dotFilePath);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void generateDotFile(ParseTree tree, String filePath) {
        try (PrintWriter writer = new PrintWriter(new File(filePath))) {
            writer.println("digraph G {");
            writeTreeToDot(tree, writer);
            writer.println("}");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static int nodeIdCounter = 0;

private static void writeTreeToDot(ParseTree tree, PrintWriter writer) {
    String nodeId = String.valueOf(tree.hashCode());
    writer.printf("  \"%s\" [label=\"%s\"];\n", nodeId, escapeLabel(tree.getText()));

    // Recursively write the children
    for (int i = 0; i < tree.getChildCount(); i++) {
        ParseTree child = tree.getChild(i);
        String childId = String.valueOf(child.hashCode());
        writer.printf("  \"%s\" -> \"%s\";\n", nodeId, childId);
        writeTreeToDot(child, writer);
    }
}
private static String escapeLabel(String label) {
    return label.replace("\\", "")  // Escape backslashes
    .replace("\"", "\\\"")  // Escape double quotes
    .replace("\n", "\\n")    // Escape newlines
    .replace("\r", "\\r");   
}// Escape carriage returns
}