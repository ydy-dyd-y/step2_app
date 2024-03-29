import 'package:gsheets/gsheets.dart';
import 'user.dart';
import 'package:intl/intl.dart';

import 'package:firebase_auth/firebase_auth.dart';

String getToday() {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyyMMdd');
  var strToday = formatter.format(now);
  return strToday;
}

class SurvSheetsApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "gsheets-346013",
  "private_key_id": "e5d38697e88a62f54959c2af963409729706de23",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDVS3rFi3mqJE8h\niioET2cEEvlLUNKqDQ1O/gATn0eNJ6BG9p9zZXbeny2A+INnFDFPWLe9VTiNDSg6\nJB1YIkQ9agkIRqmLDMhifMYuO+CsOVKKuYXjb5c2+hynL8z/FXr/QBHEpzZ12BI0\npoSUZz4Laa7G/DZ/0nq7iBiKGCUEGKCPZSjuWl/EZ11R4wFRkFSGNnySt8NgGWUN\nJR6ggNW+OJ2uwTvn24280l9WHSaC9URtHbo+IO5QbC4hJ69T/+WD8e6mM7WpHu1N\nmEXS7ES64/XotOp699j5qHCdpbOFiz7BGRe1ixh9vpXoU7qJ8kdOQfr3x1T5cw2t\nYoNZuX95AgMBAAECggEAGNamvAs5XnfGusdIDBMykgoDG7MUaz7knDyuRdq0NoMF\nMkpdSG8KDBQBlK2sALScZur0D7F1SdC8zOOAgs9Pvs6isWLoMsQI8FYrLn5k1C2D\nOBoxdio8M+flrw79Gn32AjRD9XCLAidovFahZRZORn42vx+nGZTJW94WDHvSELM2\njNoecqmSZvG4ZsGwueo3/gF/RD1285i7XUCShjmN90wjSNJ14LE8p7Mp8B0qxte4\nQoXIwThQDKVIaHiyrN8GBLcnU4bS+7W/TGiK/kLsJldJuqvOhYapoJbxvy7dZ+b4\nJR2+7W4ls4F2nsekcba+ZIEMwNF4vpy0b7kmEsNdoQKBgQDujmo2dsbFw4FMQbs4\nVk/VWuWNNPIXCtulVq5lZnLksiN9tnaiUfv6bXSbc1oAMhtAJYyshn/BArUSx0j3\ngY7rUJD6svPBQMAkaISvtbe3k3RN0QCkeqvcJfPX2QPxV20QW6q2lhpceRuLP0ko\nSbwOGqUGannyGPz6JbkrjuU1WQKBgQDk5DCnIJXAGZuXtjfLV73eaacobJySXTF5\nJ4uZa/buxoBaNyKnzYKDl8Jf1kwfx1kzsqHC8+0PZqKlzlaDiskiKOhJfiLNBbLM\nZRi0f53OOU3q+KvI32WjmeL3wC3uAzhMJ6OnRwLGPEFCDsQMAY35U5C0CRDwTlsQ\nUPykfQO3IQKBgCEq++mGqixk+l035mf22DK56KCxc9dwUwmx+51tmRvjCLw52lTH\nQVmYTlYuu5y7Wr6Yee6i5LBZSAPMYYDIKq7dDMtOhkWgUxa80XX8tgZ4IfuPy58S\nz0JUpIqmSb4MgcV8eUfZpuCklgfOTMWlOthbLAawVzQp9UJybER6IbRBAoGAQYGc\n+ve0Y9nwUabwqN1flXufP052MN1C/2114l6nuQZOTYNiA6wpIggYtNzbxGyE9uq0\nqNquia3R9qnq0JKzpXcXo5DZ3Ns4pI56V43+V7rGteydHUvyBrRP5J+3hVqejgz6\nJTGJdbpg4srfCKCZRTXJP/0oP93s6eqDo3+zxIECgYBYwHw20/En2+I5HVfYcbea\n8f9Wrl63i5SEv/OWKdIgMnk30LIOUfROBF9FFVqZfIFHi9ExK8VW6Stb+llhFO43\nfNwHI7PWoKbkDLC/5Ds4TPYbhuzFWhHjT2DDutlKlHMODrUa2lo1U+qJeBXOGv+a\nKMmSa/sbYJyis/BV/NSYDQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheets-346013.iam.gserviceaccount.com",
  "client_id": "117081205385881231609",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-346013.iam.gserviceaccount.com"
}
  ''';
  // static final _spreadsheetId = inputData();
  static final _SurvGSheets = GSheets(_credentials);
  static Worksheet? _dailySheet;
  static Worksheet? _morningSheet;
  static Worksheet? _weeklySheet;

  static Future init() async {
    final _spreadsheetId = await inputData();
    final spreadsheet = await _SurvGSheets.spreadsheet(_spreadsheetId);
    _dailySheet = await _getWorkSheet(spreadsheet, title: 'daily');
    _morningSheet = await _getWorkSheet(spreadsheet, title: 'ema_m');
    _weeklySheet = await _getWorkSheet(spreadsheet, title: 'weekly');

    final firstRow = FeedbackFields.getFields();
    _dailySheet!.values.insertRow(1, firstRow);

    final firstRow2 = FeedbackFields2.getFields();
    _morningSheet!.values.insertRow(1, firstRow2);

    final firstRow3 = FeedbackFields3.getFields();
    _weeklySheet!.values.insertRow(1, firstRow3);
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert_date(Map<String, dynamic> rowMap) async {
    if (_dailySheet == null) return;
    List rowVal = [];
    rowMap.forEach((key, value) {
      rowVal.add(value);
    });
    _dailySheet!.values.appendRow([getToday()]);
    _dailySheet!.values.appendRow(rowVal, fromColumn: 2);
  }

  static Future insert(Map<String, dynamic> rowMap) async {
    // C-pass
    if (_dailySheet == null) return;
    List rowList = [];
    rowMap.forEach((key, value) {
      rowList.add(value);
    });
    _dailySheet!.values.appendRow(rowList, fromColumn: 3, inRange: true);
  }

  static Future insertpmE(Map<String, dynamic> rowMap) async {
    if (_dailySheet == null) return;
    List rowList = [];
    rowMap.forEach((key, value) {
      rowList.add(value);
    });
    _dailySheet!.values.appendRow(rowList, fromColumn: 27, inRange: true);
  }

  static Future insertpmM(Map<String, dynamic> rowMap) async {
    if (_dailySheet == null) return;
    List rowList = [];
    rowMap.forEach((key, value) {
      rowList.add(value);
    });
    _dailySheet!.values.appendRow(rowList, fromColumn: 35, inRange: true);
  }

  static Future insertamS(Map<String, dynamic> rowMap) async {
    if (_morningSheet == null) return;
    List rowList = [];
    rowMap.forEach((key, value) {
      rowList.add(value);
    });
    _morningSheet!.values.appendRow([getToday()]);
    _morningSheet!.values.appendRow(rowList, fromColumn: 2);
  }

  static Future insertamM(Map<String, dynamic> rowMap) async {
    if (_morningSheet == null) return;
    List rowList = [];
    rowMap.forEach((key, value) {
      rowList.add(value);
    });
    _morningSheet!.values.appendRow(rowList, fromColumn: 3, inRange: true);
  }  

  static Future insertamE(Map<String, dynamic> rowMap) async {
    if (_morningSheet == null) return;
    List rowList = [];
    rowMap.forEach((key, value) {
      rowList.add(value);
    });
    if (rowList.length == 7) {
      _morningSheet!.values.appendRow(rowList, fromColumn: 9, inRange: true);
    } else {
      List rowval = rowList.sublist(0, 1);
      _morningSheet!.values.appendRow(rowval, fromColumn: 9, inRange: true);
      List subList = rowList.sublist(1, 6);
      _morningSheet!.values.appendRow(subList, fromColumn: 11, inRange: true);
    }
  }

  static Future insertW(Map<String, dynamic> rowMap) async {
    if (_weeklySheet == null) return;
    List rowList = [];
    rowMap.forEach((key, value) {
      rowList.add(value);
    });
    _weeklySheet!.values.appendRow([getToday()]);
    _weeklySheet!.values.appendRow(rowList, fromColumn: 2);
  }

  static Future insertW1(Map<String, dynamic> rowMap) async {
    if (_weeklySheet == null) return;
    List rowList = [];
    rowMap.forEach((key, value) {
      rowList.add(value);
    });
    _weeklySheet!.values.appendRow(rowList, fromColumn: 12, inRange: true);
  }

  static Future insertW2(Map<String, dynamic> rowMap) async {
    if (_weeklySheet == null) return;
    List rowList = [];
    rowMap.forEach((key, value) {
      rowList.add(value);
    });
    _weeklySheet!.values.appendRow(rowList, fromColumn: 22, inRange: true);
  }
}

Map<String, String> sheetid = {
  'fssxRT6p6xaBisZXnvbIN4oHAsC3': "1CcdwosWJ5AWCTwYVIMXqmHcxB5679bCjOeWs4w0Ryjo",
  'pIIzWWdaQlMjVWW62Y7AdASHnqr1': "1saeiZkL5o-dA4h0BO0LBEHwOlGirM1MDmaX_zYi5gDw",
  'aeGt9QETSCO2JaLYd4HGNIrmX9x2': "1D1X7iYQHY4dcTsjRXN3Wdgc33YhNt_S0WqtxPBe5Qbk",
  'zVQieDy5W5RRgW1Givx61RWohmC2': "1rODFEQFYb_JJQAtq5hkZqC_QEFA3sW9oQQk6YJTfQIM",
  'amCqJj7UOLdSuzsNq7KrHGpduTe2': "1VJ0sjvfu9MTFG1jFVUmShfX-nzawt_almxEPwF4VKQw",
  'v3Pti8IdPFOMiOaQeyh2RoSrZGY2': "1mDvijbC64TrCAJsgXMzLXhxcybD4YksxZho9-vU2knI",
  'Hqi6VkCKSedJBaX8zBPf02t5wnb2': "1_Brxh10S9XWK1-B1QnOhYYuwoO5MRQSD7qmo6ANvBEY",
  'hl1yzQylqgOPXnwX3Nu6GUuhvtl1': "1j4zvAUbmRKT86OnAFoUIZabOTNP4CnHUIWYD19JHhH0",
  'pmdd_09': "15QLipOUcuHToFLCEQ9nUgRkYwY4UkGHt3Jyefo85Tyw",
  'pmdd_10': "1JDIxYNjeay_eVNdc_-3vzfx5W-OI693YvkOkqRvqEc4",
  'pmdd_11': "1fADdKYtBHdUsgar4bsCIq4l0q4RxFXI82_ig69nELFQ",
  'pmdd_12': "1opnmvD1PB9jfQd_kAv7iCGPaF0mxT3cn6uIWwvtyIhU",
  'pmdd_13': "1sm-POXPNsreDy_IWxODIZfeIOaSlRPPBsCQ5onr-KnE",
  'pmdd_14': "1MxD2VMlOsNNi801Vmh8dMgPrICOjg0ploHJomVl9x_w",
  'pmdd_15': "1-45IwkevC4wO-i8vO9OmTipbjeGr505nMQe3MyvJS-s",
  'pmdd_16': "1_tep3s1vCyi-r5jmcM-ZDLW38tycDtLcktB2jsqV9JQ",
  'pmdd_17': "16z778R_W4nPg-s7Ru8Juf9YudOupEMDEy00fIzYfFeY",
  'pmdd_18': "1GZZKJfOxfsPc9Kvfrf8w4uDeT0r6BKkZ49Iefi2jHXE",
  'pmdd_19': "1EHjmY23qkiBdJkkcBswkzfMAAdFV9eYVUFJhCFEE148",
  'pmdd_20': "1CDiKe25uUjKLqAxs5vywMr9Gws1xvl5YUa_RbXPfw5g",
  'pmdd_21': "1LB8rOwiEnuFMJl5YpCHcIL9T61G1wFacYKtVHM40c_0",
  'pmdd_22': "1cy6jOQGWPfG82OaUbDMQIsOgciwXXOYXaP-K5giHb00",
  'pmdd_23': "1_OjlgkGp_r_Ik8whvL7YNe9orJUHn3zV2NG1li1pFXM",
  'pmdd_24': "1I-GipoBcP8Yc4s3M8rPLmtp-8tU5yHniHLx88kUvZNQ",
  'pmdd_25': "1bYlykW2Y7vVUi5NWVzNfJJfBxDFzVg6FNChE51PnkfQ",
  'pmdd_26': "11BaNtH6-YcUty1ILavn6kGalbCIrPXcWMzOp0vhuZfg",
  'pmdd_27': "1CwhkwiG3eBSGPsJm25hZ7pSVaHwVxsPozwXeyY9ifJk",
  'pmdd_28': "1sbaqNTyPQ7FKbyhYZ1vykWuR7phuICxYg878rnMcDcc",
  'pmdd_29': "14FJhBzZwZEWjlbw9yoLZM6laEpqH06x7xbXZH7dmyJ8",
  'pmdd_30': "17m8MgvtOd7jCcXocQLxhd8yYrc0w_rTH7TqOxEfvU4k"  
};

inputData() {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;
  if (user == null) {
    print('need to login');
  } else {
    String currentUseruid = user.uid;
    return sheetid[currentUseruid];
  }
}
