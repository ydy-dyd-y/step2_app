import 'package:flutter/material.dart';
import 'package:conditional_questions/conditional_questions.dart';

List<Question> questions1() {
  return [
    PolarQuestion(
        question: "출혈이 있습니까?",
        answers: ["있음", "없음"],
        isMandatory: true),
  ];
}
///
List<Question> questions1_1() {
  return [
    PolarQuestion(
        question: "기분이 우울하거나 슬프거나 가라앉거나 꿀꿀했음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "절망적인 느낌이 들었음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "가치가 없거나 죄책감이 들었음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "불안하거나 긴장되었음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "기분 변화가 있었음(갑자기 슬프거나 울컥함)",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "거절에 민감해지거나 쉽게 상처받았음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "화 나고 짜증이 났음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "다른 사람들과(대인관계에서) 갈등이 생기거나 문제가 생겼음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "일상적인 활동(일, 공부, 친구, 취미 등)에 흥미가 떨어졌음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "집중하기 어려웠음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "무기력하거나 피곤하거나 에너지가 떨어졌음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "식욕이 증가하거나 과식을 했음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "특정한 음식을 마구 먹고 싶은 충동이 들었음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "잠이 늘어나고, 낮에 졸립고, 일어나기 힘들었음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "잠 들기가 어렵거나 잠을 유지하기 어려웠음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "감당할 수 없을 정도로 압도된 느낌(어쩔줄 모르겠는 느낌)이 들었음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "통제할 수 없을 것 같은 느낌이 들었음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "유방을 누르면 아팠음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "유방이 붓거나 속이 더부룩하거나 체중이 늘었음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "관절 또는 근육통이 있었음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "두통이 있었음",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "위의 증상들로 일/학업에 지장 주는 정도",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "위의 증상들로 취미생활에 지장 주는 정도",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
    PolarQuestion(
        question: "위의 증상들로 대인관계에 지장 주는 정도",
        answers: ["전혀 없음", "약간 있음", "경미함", "중등도", "심함", "매우 심함"],
        isMandatory: true),
  ];
}
///

List<Question> questions1_2_1() {
  return [
    PolarQuestion(
        question: "지난 밤 잠을 잘 잤나요?",
        answers: ["-3 : 전혀 그렇지 않다", "-2", "-1", "0", "1", "2", "3 : 매우 잘 잤다"],
        isMandatory: true),
    PolarQuestion(
        question: "열정적인",
        answers: ["0 : 전혀 그렇지 않다", "1", "2", "3", "4 : 매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "쾌활한",
        answers: ["0 : 전혀 그렇지 않다", "1", "2", "3", "4 : 매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "편안한",
        answers: ["0 : 전혀 그렇지 않다", "1", "2", "3", "4 : 매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "불안한",
        answers: ["0 : 전혀 그렇지 않다", "1", "2", "3", "4 : 매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "슬픈",
        answers: ["0 : 전혀 그렇지 않다", "1", "2", "3", "4 : 매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "예민한",
        answers: ["0 : 전혀 그렇지 않다", "1", "2", "3", "4 : 매우 그렇다"],
        isMandatory: true),
  ];
}
///

List<Question> questions1_2_2() {
  return [
    NestedQuestion(
        question: "아래 목록 중에서 오늘 중 할 것 같은 활동(일과) 한 가지만 선택해주세요. 만약 한 개 이상인 경우, 그 중 가장 중요하다고 생각하는 것을 하나만 고르세요.",
        answers: ["일(업무)", "수업/공부", "운동", "취미활동", "소셜미디어(인스타, 페이스북 등)", "Youtube/영화/TV시청", "아이 혹은 가족 돌보기", "식사", "집안일/심부름", "친구들 혹은 가족들과의 연락\n(만나거나 이야기하거나 카톡/문자)", "사회활동 참여(운동, 친교, 파티 등)", "위에 해당하지 않음"],
        isMandatory: true,
        children: {
          '위에 해당하지 않음': [
            Question(
                question: "어떤 활동을 할 예정인지 적어주세요",
                validate: (field) {
                  if (field.isEmpty) return "Field cannot be empty";
                  return null;
              },
            )
          ]
        }
    ),
    PolarQuestion(
        question: "위에서 선택한 가장 중요한 활동을 혼자 혹은 다른 사람과 같이 하나요?",
        answers: ["혼자", "다른 사람들"],
        isMandatory: true),
    PolarQuestion(
        question: "위에서 선택한 활동에 대한 (긍정적/부정적) 기대를 점수로 나타낸다면?",
        answers: ["-4 : 매우 부정적인", "-3", "-2", "-1", "0", "1", "2", "3", "4 : 매우 긍정적인"],
        isMandatory: true),
    PolarQuestion(
        question: "그 활동으로 인해 얼마나 스트레스 받을 것 같은지?",
        answers: ["-4 : 매우 스트레스 받을 것 같은", "-3", "-2", "-1", "0", "1", "2", "3", "4 : 전혀 스트레스를 받을 것 같지 않은"],
        isMandatory: true),
    PolarQuestion(
        question: "앞으로 1주일 간에 대한 기대(전망)를 점수로 나타낸다면? ",
        answers: ["-4 : 매우 부정적인", "-3", "-2", "-1", "0", "1", "2", "3", "4 : 매우 긍정적인"],
        isMandatory: true),
    PolarQuestion(
        question: "지난 1주일 간을 점수로 나타낸다면?",
        answers: ["-4 : 매우 부정적인", "-3", "-2", "-1", "0", "1", "2", "3", "4 : 매우 긍정적인"],
        isMandatory: true),
  ];
}
///
List<Question> questions1_2_3() {
  return [
    PolarQuestion(
        question: "오늘 있을 거라고 예상했던 그 활동이 일어났나요\n(그 활동을 했나요)?",
        answers: ["예", "아니오"],
        isMandatory: true),
    PolarQuestion(
        question: "그 활동이 일어났거나 일어나지 않은 것에 대해 \n얼마나 아쉬운가요? \n혹은 그 활동을 했거나 하지 않았던 것에 대해 \n얼마나 후회하나요?",
        answers: ["0 : 전혀 아쉽거나 후회하지 않음", "1", "2", "3", "4", "5 : 매우 아쉽거나 후회스러움"],
        isMandatory: true),
    PolarQuestion(
        question: "그 활동이 어땠나요?",
        answers: ["-4 : 매우 부정적인", "-3", "-2", "-1", "0", "1", "2", "3", "4 : 매우 긍정적인"],
        isMandatory: true),
    PolarQuestion(
        question: "그 활동으로 인해 얼마나 스트레스 받았나요?",
        answers: ["-4 : 매우 스트레스 받을 것 같은", "-3", "-2", "-1", "0", "1", "2", "3", "4 : 전혀 스트레스를 받을 것 같지 않은"],
        isMandatory: true),
    NestedQuestion(
        question: "(좋은 일이든 안좋은 일이든지 상관없이)\n오늘 있을 거라고 예상하지 못했던 일이 있었나요?",
        answers: ["예", "아니오"],
        isMandatory: true,
        children: {
          '예' : [
            PolarQuestion(
                question: "예상치 못한 일이 아래 목록 중에서 있었다면, \n그 중 가장 중요하다고 생각하는 것을 하나만 고르세요.",
                answers: ["일(업무)", "수업/공부", "운동", "취미활동", "소셜미디어(인스타, 페이스북 등)", "Youtube/영화/TV시청", "아이 혹은 가족 돌보기", "식사", "집안일/심부름", "친구들 혹은 가족들과의 연락\n(만나거나 이야기하거나 카톡/문자)", "사회활동 참여(운동, 친교, 파티 등)", "위에 해당하지 않음"],
                isMandatory: true),
            PolarQuestion(
                question: "예상치 못했던 일이 어땠나요?",
                answers: ["-4 : 매우 부정적인", "-3", "-2", "-1", "0", "1", "2", "3", "4 : 매우 긍정적인"],
                isMandatory: true),
            PolarQuestion(
                question: "예상치 못했던 일로 인해 얼마나 스트레스 받았나요?",
                answers: ["-4 : 매우 스트레스 받을 것 같은", "-3", "-2", "-1", "0", "1", "2", "3", "4 : 전혀 스트레스를 받을 것 같지 않은"],
                isMandatory: true),
          ]
        }
    )
  ];
}
///

List<Question> questions1_2_4() {
  return [
    PolarQuestion(
        question: "열정적인",
        answers: ["0 : 전혀 그렇지 않다", "1", "2", "3", "4 : 매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "쾌활한",
        answers: ["0 : 전혀 그렇지 않다", "1", "2", "3", "4 : 매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "편안한",
        answers: ["0 : 전혀 그렇지 않다", "1", "2", "3", "4 : 매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "불안한",
        answers: ["0 : 전혀 그렇지 않다", "1", "2", "3", "4 : 매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "슬픈",
        answers: ["0 : 전혀 그렇지 않다", "1", "2", "3", "4 : 매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "예민한",
        answers: ["0 : 전혀 그렇지 않다", "1", "2", "3", "4 : 매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "오늘 하루동안 \n아래 증상들로 인해 얼마나 지장을 받았나요? \n 1. 흥미나 재미가 없었음 \n2.우울하거나 희망이 없는 느낌\n3.지치거나 에너지가 떨어짐\n4.예민함, 날이 서있음\n4.걱정을 계속하고 멈추기가 어려움",
        answers: ["0 : 전혀 지장이 없었다", "1", "2", "3", "4", "5 : 매우 지장을 받았다"],
        isMandatory: true),
  ];
}
///

List<Question> questions2_1() {
  return [
    PolarQuestion(
        question: "지난 한주 동안, 예상치 못한 일이 생겨서 \n기분 나빠진 적이 얼마나 있었나요?",
        answers: ["전혀 없음", "거의 없음", "가끔 있음", "꽤 자주 있음", "매우 자주 있음"],
        isMandatory: true),
    PolarQuestion(
        question: "지난 한주 동안, 중요한 일들을 통제할 수 없다고 \n느낀 적은 얼마나 있었나요?",
        answers: ["전혀 없음", "거의 없음", "가끔 있음", "꽤 자주 있음", "매우 자주 있음"],
        isMandatory: true),
    PolarQuestion(
        question: "지난 한주 동안, 초조하거나 스트레스가 쌓인다고 \n느낀 적은 얼마나 있었나요?",
        answers: ["전혀 없음", "거의 없음", "가끔 있음", "꽤 자주 있음", "매우 자주 있음"],
        isMandatory: true),
    PolarQuestion(
        question: "지난 한주 동안, 짜증나고 성가신 일들을 \n성공적으로 처리한 적이 얼마나 있었나요?",
        answers: ["전혀 없음", "거의 없음", "가끔 있음", "꽤 자주 있음", "매우 자주 있음"],
        isMandatory: true),
    PolarQuestion(
        question: "지난 한주 동안, 생활 속에서 일어난 중요한 변화들을 \n효과적으로 대처한 적이 얼마나 있었나요?",
        answers: ["전혀 없음", "거의 없음", "가끔 있음", "꽤 자주 있음", "매우 자주 있음"],
        isMandatory: true),
    PolarQuestion(
        question: "지난 한주 동안, 개인적인 문제를 처리하는 능력에 대해 \n자신감을 느낀 적은 얼마나 있었나요?",
        answers: ["전혀 없음", "거의 없음", "가끔 있음", "꽤 자주 있음", "매우 자주 있음"],
        isMandatory: true),
    PolarQuestion(
        question: "지난 한주 동안, 자신의 뜻대로 일이 진행된다고 \n느낀 적은 얼마나 있었나요?",
        answers: ["전혀 없음", "거의 없음", "가끔 있음", "꽤 자주 있음", "매우 자주 있음"],
        isMandatory: true),
    PolarQuestion(
        question: "지난 한주 동안, 매사를 잘 컨트롤하고 있다고 \n느낀 적이 얼마나 있었나요?",
        answers: ["전혀 없음", "거의 없음", "가끔 있음", "꽤 자주 있음", "매우 자주 있음"],
        isMandatory: true),
    PolarQuestion(
        question: "지난 한주 동안, 당신이 통제할 수 없는 범위에서 \n발생한 일 때문에 화가난 적이 얼마나 있었나요?",
        answers: ["전혀 없음", "거의 없음", "가끔 있음", "꽤 자주 있음", "매우 자주 있음"],
        isMandatory: true),
    PolarQuestion(
        question: "지난 한주 동안, 어려운 일이 너무 많이 쌓여서 \n극복할 수 없다고 느낀 적이 얼마나 있었나요?",
        answers: ["전혀 없음", "거의 없음", "가끔 있음", "꽤 자주 있음", "매우 자주 있음"],
        isMandatory: true),
  ];
}
///
List<Question> questions2_2() {
  return [
    PolarQuestion(
        question: "예상치 못한 일이 생긴다면 기분이 나빠질 것 같다",
        answers: ["전혀 아니다", "거의 아니다", "보통이다", "그렇다", "매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "중요한 일들을 통제할 수 없을 것 같다.",
        answers: ["전혀 아니다", "거의 아니다", "보통이다", "그렇다", "매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "초조하거나 스트레스가 쌓인다고 느낀다.",
        answers: ["전혀 아니다", "거의 아니다", "보통이다", "그렇다", "매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "짜증나고 성가신 일들을 잘 처리할 것 같다",
        answers: ["전혀 아니다", "거의 아니다", "보통이다", "그렇다", "매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "생활 속에서 일어난 중요한 변화들을 효과적으로 대처할 수 있을 것 같다.",
        answers: ["전혀 아니다", "거의 아니다", "보통이다", "그렇다", "매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "개인적인 문제를 처리하는 능력에 대해 자신감을 느낀다. ",
        answers: ["전혀 아니다", "거의 아니다", "보통이다", "그렇다", "매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "자신의 뜻대로 일이 진행된다고 느낀다.",
        answers: ["전혀 아니다", "거의 아니다", "보통이다", "그렇다", "매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "매사를 잘 컨트롤하고 있다고 느낀다. ",
        answers: ["전혀 아니다", "거의 아니다", "보통이다", "그렇다", "매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "통제할 수 없는 일이 발생하면 화가 날 것 같다.",
        answers: ["전혀 아니다", "거의 아니다", "보통이다", "그렇다", "매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "어려운 일이 너무 많이 쌓여서 극복할 수 없다고 느낀다.",
        answers: ["전혀 아니다", "거의 아니다", "보통이다", "그렇다", "매우 그렇다"],
        isMandatory: true),
  ];
}
///
List<Question> questions2_3() {
  return [
    PolarQuestion(
        question: "이렇게 스트레스 받는 자신을 보면서 화가 난다.",
        answers: ["전혀 아니다", "거의 아니다", "보통이다", "그렇다", "매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: "내가 스트레스 받는 이유를 알 수 있다.",
        answers: ["전혀 아니다", "거의 아니다", "보통이다", "그렇다", "매우 그렇다"],
        isMandatory: true),
    PolarQuestion(
        question: " 자신에게 화가 난 이유를 알 수 있다. ",
        answers: ["전혀 아니다", "거의 아니다", "보통이다", "그렇다", "매우 그렇다"],
        isMandatory: true),
  ];
}
///

List<Question> questions3() {
  return [
    Question(
      question: "이름",
      validate: (field) {
        if (field.isEmpty) return "Field cannot be empty";
        return null;
      },
    ),
    Question(
      question: "나이(만)",
      validate: (field) {
        if (field.isEmpty) return "Field cannot be empty";
        return null;
      },
    ),
    PolarQuestion(
        question: "소득",
        answers: ["50만원 미만", "50만원 이상 200만원 미만", "200만원 이상 400만원 미만", "400만원 이상 600만원 미만", "600만원 이상"],
        isMandatory: true),
    PolarQuestion(
        question: "최종학력",
        answers: ["고등학교 졸업 이하", "대학교 졸업", "대학원 졸업"],
        isMandatory: true),
    PolarQuestion(
        question: "직업",
        answers: ["공무원", "대기업 임직원", "사무직/기술직", "일반기업/임직원", "교육/연구직", "전문/자유직", "자영업", "기타(학생, 무직)"],
        isMandatory: true),
    PolarQuestion(
        question: "흡연유무",
        answers: ["No", "Yes"],
        isMandatory: true),
  ];
}