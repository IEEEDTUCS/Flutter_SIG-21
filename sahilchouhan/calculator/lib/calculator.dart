dynamic calculator(dynamic a, dynamic b, Function claculation) {
  return claculation(a, b);
}

dynamic add(dynamic a, dynamic b) {
  return a + b;
}

dynamic sub(dynamic a, dynamic b) {
  return a - b;
}

dynamic multi(dynamic a, dynamic b) {
  return a * b;
}

dynamic divide(dynamic a, dynamic b) {
  return a / b;
}

dynamic percent(dynamic a) {
  return a / 100;
}
