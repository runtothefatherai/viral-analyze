# 🔥 viral-analyze — TikTok 바이럴 분석 도구

828 Brand 팀용 TikTok 바이럴 콘텐츠 분석 시스템.
TikTok 영상 링크를 넣으면 **왜 바이럴이 되었는지** Jenny Hoyos + Callaway 프레임워크로 분석해 HTML 리포트를 자동 생성합니다.

---

## 📦 무엇이 들어있나

```
viral-analyze/
├── commands/
│   └── viral-analyze.md      # /viral-analyze 슬래시 커맨드
├── reference/                # 분석 근거가 되는 프레임워크 문서
│   ├── How_to_Create_a_Killer_Hook...md
│   ├── I_Studied_1_000_Hooks...md
│   └── ...
├── reports/                  # 생성된 분석 리포트 (HTML)
│   ├── index.html            # 리포트 목록 (랜딩 페이지)
│   └── psalm91_viral_analysis.html
├── install.sh                # 팀원용 설치 스크립트
└── README.md
```

---

## 🚀 팀원 설치 방법 (처음 한 번)

Claude Code가 설치되어 있어야 합니다.

```bash
# 1. repo 클론
git clone https://github.com/runtothefatherai/viral-analyze.git
cd viral-analyze

# 2. 설치 스크립트 실행 (커맨드를 ~/.claude/commands/ 에 복사)
bash install.sh
```

설치 후 Claude Code에서 바로 사용:
```
/viral-analyze https://www.tiktok.com/@handle/video/1234567890
```

---

## 🔄 업데이트 받기

```bash
cd viral-analyze
git pull
bash install.sh   # 커맨드 갱신
```

---

## 📊 리포트 보기

생성된 분석 리포트는 **GitHub Pages**에서 링크로 바로 열람할 수 있습니다:

👉 **https://runtothefatherai.github.io/viral-analyze/reports/**

(repo Settings → Pages 활성화 후 사용 가능)

---

## 🧠 분석 프레임워크

| 프레임워크 | 핵심 |
|-----------|------|
| **Jenny Hoyos** | Shock → Expectation → End Goal (3초 훅), But/So 서사, Curiosity Gap, Peak-End |
| **Callaway** | 4 Mistakes (Delay/Confusion/Irrelevance/Disinterest), Visual+Spoken+Text 훅 정렬 |
| **Viral Multiplier** | 조회수 ÷ 팔로워수 = 팔로워 대비 도달 배수 |

---

## 📝 사용 예시

```
/viral-analyze https://tiktok.com/@a/video/1 https://tiktok.com/@b/video/2
```

→ Apify로 스크래핑 → 분석 → `reports/viral_analysis_YYYYMMDD.html` 생성 → 브라우저 자동 오픈

---

_Maintained by 828 Brand · Powered by Claude Code + Apify_
