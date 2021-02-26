import 'data.dart';

class Calculate{
  UserData userData;
  Calculate(this.userData);

  double calculate_kcal(){
    double result;
    if(userData.gender == "KADIN"){
      result = 665+(9.6*userData.weight)+(1.7*userData.length)-(4.7*userData.age);
    }
    else{
      result = 66+(9.6*userData.weight)+(1.7*userData.length)-(4.7*userData.age);
    }
    result = result + userData.move*200;
    return double.parse((result).toStringAsFixed(2));
  }

  double calculate_bmi(){
    double result;
    double lenght = (userData.length / 100)*(userData.length / 100);
    result = userData.weight / lenght;
    return double.parse((result).toStringAsFixed(2));

  }

  String recommend(){
    double result;
    double lenght = (userData.length / 100)*(userData.length / 100);
    result = userData.weight / lenght;
    result = result.roundToDouble();

    String bmi_result;
    if(result < 18.5 ){
      return bmi_result = "Zayıfsınız, beslenmenizi arttırmalısınız.";
    }
    else if(result >= 18.5 && result <24.9){
      return bmi_result = "Kilonuz normal.";
    }
    else if(result >= 25 && result <29.9){
      return bmi_result = "Kilolusunuz, beslenmenize dikkat etmelisiniz.";
    }
    else if(result >= 30 && result <39.9){
      return bmi_result = "Obezsiniz, bir diyetisyene görünmelisiniz.";
    }
    else if(result >= 40 ){
      return bmi_result = "İleri derece obezsiniz, sağlık kuruluşlarına acilen başvurmalısınız.";
    }
  }


}