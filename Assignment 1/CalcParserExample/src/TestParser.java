import java.util.Scanner;

public class TestParser {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		System.out.println("Enter statement: ");
		String exp = s.nextLine();

		CalcParser cp = new CalcParser(exp);

		ParseTree pt = cp.getAST();
		System.out.println(exp + " parses as " + pt);

		s.close();
		return;
	}
}
