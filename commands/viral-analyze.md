# /viral-analyze

TikTok 영상 링크를 분석해서 왜 바이럴이 되었는지 HTML 리포트를 생성합니다.

## 사용법
```
/viral-analyze [TikTok URL1] [URL2] [URL3] ...
```

## 실행 흐름

사용자가 TikTok URL을 1개 이상 제공하면:

### STEP 1 — Apify로 영상 데이터 수집
`clockworks/tiktok-scraper` Actor를 사용해 각 URL에서 다음을 추출:
- 영상 메타데이터 (좋아요, 조회수, 저장수, 팔로워수, 캡션, 작성자)
- 영상 재생 URL
- 자막/트랜스크립트 (가능한 경우)

Actor input:
```json
{
  "postURLs": ["<url1>", "<url2>", ...],
  "shouldDownloadVideos": false,
  "shouldDownloadCovers": false,
  "shouldDownloadSubtitles": true
}
```

트랜스크립트가 Apify KV store에 저장되면 API URL로 직접 curl 다운로드:
```bash
curl "https://api.apify.com/v2/key-value-stores/{storeId}/records/{key}" -o transcript.txt
```

### STEP 2 — 바이럴 멀티플라이어 계산
각 영상에 대해:
- **Viral Multiplier** = 조회수 ÷ 팔로워수
- 1x 미만: 언더퍼폼
- 10x~100x: 바이럴
- 100x 이상: 초바이럴 🔥

### STEP 3 — Jenny Hoyos + Callaway 프레임워크 분석

#### 3초 HOOK 해부
처음 3초를 분석해서:
- **Visual Hook**: 화면에 뭐가 보이는가
- **Spoken Hook**: 첫 마디가 뭔가
- **Text Hook**: 자막/텍스트 오버레이
- **Hook Type**: Shock / Promise / Question / Pain Point / Identity

Jenny Hoyos 공식 체크:
- [ ] Shock → Expectation → End Goal 구조인가?
- [ ] Curiosity Gap이 열렸는가?
- [ ] 시청자가 "이게 나 얘기네" 느끼는가?

#### Callaway 4 Mistakes 체크
- [ ] **Delay 없음**: 바로 본론 시작하는가?
- [ ] **Confusion 없음**: 첫 3초에 무슨 내용인지 명확한가?
- [ ] **Relevance 있음**: 타겟 시청자에게 관련 있는가?
- [ ] **Interest 있음**: 계속 볼 이유가 있는가?

#### 대본 구조 분석 (But/So 흐름)
```
HOOK (0-3초) → BUT (갈등/문제) → SO (해결/변화) → PEAK → CTA
```

#### 반응 트리거 마커
대본 전체에 다음 마커 표시:
- 🛑 SCROLL STOP — 스크롤 멈추게 하는 순간
- ❓ CURIOSITY GAP — 궁금증 유발
- 😰 PAIN POINT — 시청자의 고통 공명
- 🔄 BUT/SO — 서사 전환
- ⚡ PEAK — 감정 최고조
- 💾 SAVE — 저장 욕구 유발
- 🚪 EXIT — 이탈 위험 지점

### STEP 4 — HTML 리포트 생성

파일명: `viral_analysis_YYYYMMDD.html` (바탕화면 TikTok_bench 폴더)

리포트 구조:
1. **헤더**: 분석 날짜, 영상 수, 주제 키워드
2. **바이럴 멀티플라이어 랭킹** (높은 순)
3. **영상별 상세 분석** (각 영상마다):
   - 영상 임베드 (또는 썸네일 + 링크)
   - 캡션 전문
   - 계정 정보 (팔로워, 조회수, 좋아요, 저장수, 바이럴 배수)
   - 3초 HOOK 해부 카드
   - 반응 마커가 달린 전체 대본
   - Callaway 4 Mistakes 체크 결과
   - 스크립트 구조 시각화
   - 벤치마킹 인사이트 (이 영상에서 훔쳐야 할 것 3가지)
4. **종합 벤치마킹**: 공통 패턴, 재현 가능한 공식

디자인: 다크 테마, 모바일 친화적, `#0a0a0a` 배경

### STEP 5 — 리포트 열기
```bash
open ~/Desktop/TikTok_bench/viral_analysis_YYYYMMDD.html
```

## 분석 근거 파일
- Jenny Hoyos 프레임워크: `~/Desktop/Viral Story Telling - Jenny Hoyos/`
  - `How_to_Create_a_Killer_Hook__Impossible_to_Skip_.md`
  - `I_Studied_1_000_Hooks__Here_s_How_to_ACTUALLY_Go_Viral.md`

## 참고 예시
`~/Desktop/TikTok_bench/psalm91_viral_analysis.html` — 이 기준의 리포트 품질을 유지할 것

## 중요 규칙
- 대본을 **절대 요약하지 말고** 전문(verbatim) 그대로 표시
- 추정 리텐션 그래프 SVG는 포함하지 말 것
- Apify 트랜스크립트가 자동 요약되어 오면, curl로 raw text 직접 다운로드
- 바이럴 멀티플라이어가 낮은 영상도 패턴 분석 포함 (왜 안 됐는지도 인사이트)
