import '../entities/calculator.dart';

class PerformOperation {
  final Calculator calculator;

  PerformOperation(this.calculator);

  double add(double a, double b) => calculator.add(a, b);

  double subtract(double a, double b) => calculator.subtract(a, b);

  double multiply(double a, double b) => calculator.multiply(a, b);

  double divide(double a, double b) => calculator.divide(a, b);
}
