String? validateEmail(String? value) {
  Pattern pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regExp = RegExp(pattern.toString());

  if (!regExp.hasMatch(value.toString())) {
    return "Enter valid email";
  } else {
    return null;
  }
}


String? validatePass(String? value){

if (value.toString().length < 8) {
    return "value must be of eight char";
  }



  Pattern pattern = r'^[0-9]*$';
  RegExp regExp = RegExp(pattern.toString());

  if (!regExp.hasMatch(value.toString())) {
    return "password should conatain digits";
  }

  return null;

  
}



String? validateName(
  String? value,
) {
  if (value!.isEmpty) {
    return "Value is required";
  }
  if (value.toString().length < 3) {
    return "Value must be greater than 3 chars";
  }
  Pattern pattern = r'^[a-zA-Z ]*$';
  RegExp regExp = RegExp(pattern.toString());

  if (!regExp.hasMatch(value.toString())) {
    return "Name should contain only chars or one space";
  }

  return null;
}


String? validateDob(String? value){
   if (value!.isEmpty) {
    return "Value is required";
  }
   return null;
}

String? validateAge(
  String? value,
) {
  if (value!.isEmpty) {
    return "Value is required";
  }

  Pattern pattern = r'^[0-9]*$';
  RegExp regExp = RegExp(pattern.toString());

  if (!regExp.hasMatch(value.toString())) {
    return "Age should contain numbers";
  }

  return null;
}

String? validateMobile(String? value) {
  if (value!.isEmpty) {
    return "Value is required";
  }
  if (value.toString().length < 11) {
    return "Value must be greater than 11 chars";
  }
  Pattern pattern = r'^03\d{9}$';
  RegExp regExp = RegExp(pattern.toString());

  if (!regExp.hasMatch(value.toString())) {
    return "Name should of pattern 03XXXXXXXXX";
  }

  return null;
}
