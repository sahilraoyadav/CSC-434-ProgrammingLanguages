
public class TestInterpreter {
	private static int testNumber = 1;

	/**
	 * This method evaluates a parse tree
	 * @param pt The AST (abstract syntax tree) to be evaluated
	 * @return the result of the evaluation
	 */
	private static double evaluate(ParseTree pt) {
		TreeNode curr = pt.getRoot();
		double value = 0;
		if (curr.isLeaf()) {
			return Double.valueOf(curr.getSymbol());
		}
		else {
			ParseTree ptRight = new ParseTree(curr.getRight());
			double right = evaluate(ptRight);
			ParseTree ptLeft = new ParseTree(curr.getLeft());
			double left = evaluate(ptLeft);
			if (curr.getSymbol().equals("^")) {
				value = Math.pow(left, right);
			}
			else if (curr.getSymbol().equals("+")) {
				value = left + right;
			}
			else if (curr.getSymbol().equals("*")) {
				value = left * right;
			}
			else if (curr.getSymbol().equals("/")) {
				value = left / right;
			}
			else if (curr.getSymbol().equals("-")) {
				value = left - right;
			}
			else if(curr.getSymbol().equals("#")){
				value = Math.max(left, right);
			}
			
		}
		return value;
	}

	
	public static void main(String[] args) {
		testEquals(interpret("2^3^2"), 512);
		testEquals(interpret("2^3"), 8);
		testEquals(interpret("2+3*2^2"), 14);
		testEquals(interpret("2^3"), 8);
		testEquals(interpret("2+3/2^2#3/2*4+2^3"),14);
		testEquals(interpret("2^(2^2#3^1)"),16);
		testEquals(interpret("2^1^2#3^1"),3);
		testEquals(interpret("(2+3)/2^(2#3)/2*(4+2)^3"),67.5);
		testEquals(interpret("1+2^3/4-5+6/2+(2-4)^2"),5);
		testEquals(interpret("1+2^3/4-5+6/2+(2-4)^2#6"),6);
	}

	private static double interpret(String exp) {
		CalcParser cp = new CalcParser(exp);
	
		ParseTree pt = cp.getAST();
		return evaluate(pt);
	}

	private static void testEquals(double actual, double expected) {
		// TODO Auto-generated method stub
		System.out.println("\nTest " + testNumber + " results");

		try {
			System.out.println("\t" + "Actual result = " + actual);
			System.out.println("\t" + "Expected result = " + expected);
			System.out.println("\tTest " + testNumber + " " + translate(actual == expected));
		} catch (Exception e) {
			System.out.println("\tTest " + testNumber + " failed");
		} finally {
			testNumber++;
		}
	}

	private static String translate(boolean b) {
		if (b)
			return "passed";
		else
			return "failed";
	}
}
