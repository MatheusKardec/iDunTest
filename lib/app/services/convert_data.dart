

String convertData(DateTime time){
  return  "Date: ${date(time)}\nHours: ${hour(time)}";
}

String date(DateTime time){
  return "${addZerobefore(time.day)}:${addZerobefore(time.month)}:${addZerobefore(time.year)}";
}

String hour(DateTime time){
  return "${addZerobefore(time.hour)}:${addZerobefore(time.minute)}:${addZerobefore(time.second)}"; 
}

String addZerobefore(int numb){
  return numb < 10 ? "0$numb" : "$numb";
}