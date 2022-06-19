import 'hadith.dart';

class HadithBrain {
  int _hadithNumber = 0;
  bool _outOfBound = false;
  final List<Hadith> _hadithBank = [
    Hadith(
        hadithText:
            '"By Him in Whose Hands my life is, none of you will have faith till he loves me more than his father and his children."'),
    Hadith(
        hadithText:
            '“Truthfulness leads to righteousness and righteousness leads to Paradise. A man will keep speaking the truth and striving to speak the truth until he will be recorded with Allah as a siddeeq (speaker of the truth). Lying leads to wickedness and wickedness leads to Hell fire. A man will keep telling lies and striving to tell lies until he is recorded with Allah as a liar."'),
    Hadith(
        hadithText:
            '"Any person who takes even a span of land unjustly, his neck shall be encircled with it down seven earths."'),
    Hadith(
        hadithText:
            '"Actions are (judged) by motives (niyyah), so each man will have what he intended. Thus, he whose migration (hijrah) was to Allah and His Messenger, his migration is to Allah and His Messenger; but he whose migration was for some worldly thing he might gain, or for a wife he might marry, his migration is to that for which he migrated."'),
    Hadith(
        hadithText:
            '"Islam has been built on five [pillars]: testifying that there is no deity worthy of worship except Allah and that Muhammad is the Messenger of Allah, establishing the salah (prayer), paying the zakat (obligatory charity), making the hajj (pilgrimage) to the House, and fasting in Ramadhan."'),
    Hadith(
        hadithText:
            '“What I have forbidden for you, avoid. What I have ordered you [to do], do as much of it as you can. For verily, it was only the excessive questioning and their disagreeing with their Prophets that destroyed [the nations] who were before you.”'),
    Hadith(
        hadithText:
            '“Part of the perfection of one’s Islam is his leaving that which does not concern him.”'),
    Hadith(
        hadithText:
            '"None of you [truly] believes until he loves for his brother that which he loves for himself."'),
    Hadith(
        hadithText:
            '"Let him who believes in Allah and the Last Day speak good, or keep silent; and let him who believes in Allah and the Last Day be generous to his neighbour; and let him who believes in Allah and the Last Day be generous to his guest."'),
    Hadith(hadithText: '“Whosoever of you sees an evil, let him change it with his hand; and if he is not able to do so, then [let him change it] with his tongue; and if he is not able to do so, then with his heart — and that is the weakest of faith.”')
  ];

  void nextHadith() {
    if (_hadithNumber < _hadithBank.length - 1) {
      _hadithNumber++;
    } else {
      _outOfBound = true;
    }
  }

  void previousHadith() {
    if (_hadithNumber > 0) {
      _hadithNumber--;
    } else {
      _outOfBound = true;
    }
  }

  int getCurrHadith() {
    return _hadithNumber;
  }

  bool isFirstHadith() {
    return _hadithNumber == 0;
  }

  bool isLastHadith() {
    return _hadithNumber == _hadithBank.length - 1;
  }

  int getNumberOfHadiths() {
    return _hadithBank.length;
  }

  bool isOutOfBound() {
    return _outOfBound;
  }

  void reset() {
    _hadithNumber = 0;
    _outOfBound = false;
  }

  String getHadithText() {
    var hadithText =
        'Hadith No. ${_hadithNumber + 1} \n\n ${_hadithBank[_hadithNumber].hadithText}';
    return (hadithText);
  }
}
