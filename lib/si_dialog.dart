import 'package:flutter/material.dart';

// 이 다이얼로그는
// UI의 BuildContext를 받고, 타이틀과 메시지를 받고,
// 버튼이 싱글이냐 아니냐를 입력받고.
// 물어본 결과를 Boolean형으로 답변해주는 역활을 합니다.
Future<bool?> siDialog(BuildContext context, String title, String message, bool isSingle,
    {String buttonText = ''}) async {
  return await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        // 알림 다이얼로그를 사용한것이고,
        // 이건 플러터에서 제공하는 팝업? Widget이라고 생각하시면 됩니다.
        return AlertDialog(
          // 모서리를 둥글게 만들기 위해서 라운디드 사가격형 볼더를 만들어 줘라.
          // 저걸 얼마나 굴곡지게 할건지.를 세팅 해주는.
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14))),
          // 이런 값들은 옵션이라서 다른 값을 넣어보면 뭔지 알수 있어요.
          contentPadding: EdgeInsets.zero, // 이건 안쪽 패딩을 얼마나 줄거냐.
          insetPadding: EdgeInsets.zero, // 요건 저도 잘 모르겠고.
          // MediaQuery.of(context).size <<--  이거는 화면 사이즈 얻어오는거.
          // width 넓이 에서 0.9를 곱한 값으로 사용.
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.90 >= 320
                ? 320
                : MediaQuery.of(context).size.width * 0.90,
            // height: 170,
            // height를 선언 안한 것은 컨텐츠(내용)의 길이가 자유자제로 늘어나게 하기 위함.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // title String의 값이 비어있지 않으면  타이틀을 그려라.
                // 당연히 비어있으면 안그리겠죠?
                // Title ---------------------------------------
                if (title.isEmpty == false)
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            // color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                // Message ---------------------------------------
                Container(
                  padding: const EdgeInsets.all(14),
                  alignment: Alignment.center,
                  child: Text(
                    message,
                    style: TextStyle(height: 1.3, fontSize: 17),
                  ),
                ),
                const SizedBox(height: 5),
                // double의 infinity를 쓰면 길이를 최대한으로 해주세요.라는 뜻.
                // 굵기가 1인 라인을 그려주세요.
                Container(
                    width: double.infinity,
                    height: 1,
                    color: const Color(0xffDADADD)),
                // 넓이는 무한대에 51짜리 투명 박스를 만들고,
                SizedBox(
                    width: double.infinity,
                    height: 51,
                    // 그안에 가로로 위젯을 넣을 겁니다.
                    child: Row(
                      children: [
                        // 자동으로 최대화 시켜줘라.
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                    buttonText.isEmpty ? '확인' : buttonText,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: const Color(0xff2D91FE),
                                        fontWeight: FontWeight.w700))),
                            onTap: () {
                              // 여기서 상인다이얼로그가 답변을 하는거에요.
                              // 예!!!!!! true
                              // 이 다이얼로그를 닫을거야(pop) 근데 날 부른놈한테
                              // 예(true)라고 답할꺼야!.
                              // 라고 외치는거.
                              Navigator.pop(context, true);
                            },
                          ),
                        ),
                        // isSingle은 취소를 하게 해줄꺼냐? 이고요.
                        // 만약 싱글 버튼이 아니면 중간 선을 그려라.
                        if (isSingle == false)
                          Container(
                              width: 1,
                              height: double.infinity,
                              color: Colors.grey[300]),
                        // 만약 싱글 버튼이 아니면 취소버튼을 만들어라.
                        if (isSingle == false)
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: const Text('취소',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: const Color(0xff2D91FE),
                                          fontWeight: FontWeight.w600))),
                              onTap: () {
                                // 여기서 상인다이얼로그가 답변을 하는거에요.
                                // 아니오!!!!!!!! false
                                // 이 다이얼로그를 닫을거야(pop) 근데 날 부른놈한테
                                // 아니오(false)라고 답할꺼야!.
                                // 라고 외치는거.
                                Navigator.pop(context, false);
                              },
                            ),
                          ),
                      ],
                    ))
              ],
            ),
          ),
        );
      });
}
