
import 'package:get/get.dart';

class PalindromChecked{

  var sentece = ''.obs;
  var isPalindrome = false.obs;

  bool checkPalindrome(String sentence){
    String clear = sentence.replaceAll(RegExp(r'\s+'),'').toLowerCase();
    return clear == clear.split('').reversed.join('');
  }
}