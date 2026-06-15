# LLM 코딩 행동 지침 (메인)

## 0. 최상위 아키텍처 원칙 (Overrides All)

> 이 섹션은 모든 하위 `.cursorrules` · `CLAUDE.md` 보다 **우선**한다.

### 0-1. 목표: Wiki + LLM PKS (Personal Knowledge System)
- Karpathy 하네스 엔지니어링 원칙을 기반으로 Wiki와 LLM을 결합한 PKS를 구현한다.
- 모든 도메인 지식은 문서화 가능한 단위로 분리하고, LLM이 문맥을 추론할 수 있도록 구조화한다.

### 0-2. 아키텍처 원칙 (SOLID + Hexagonal + Clean + DDD)
- **SOLID** 원칙을 반드시 준수한다. 단일 책임·개방-폐쇄·리스코프 치환·인터페이스 분리·의존성 역전을 모두 지킨다.
- **헥사고날 아키텍처**: 도메인 로직은 인바운드(API/CLI)·아웃바운드(DB/외부 서비스) 어댑터에 의존하지 않는다.
- **클린 아키텍처**: 의존성은 항상 안쪽(도메인)을 향한다. 도메인 레이어가 프레임워크·인프라를 import하면 즉시 거부한다.
- **DDD**: 바운디드 컨텍스트·애그리거트·도메인 이벤트를 명시적으로 모델링한다. 유비쿼터스 언어를 코드에 반영한다.

### 0-3. 경로 규칙 (Path Convention)
- `sangho/apps/<앱명>/` 내부를 작업할 때, 패키지 경로는 **`jsangho`와 `apps`를 생략**하고 앱명부터 시작한다.
  - 예: `sangho/apps/titanic/domain/...` → 경로 표기는 `titanic.domain....`
- **core 패키지** 경로는 반드시 `jsangho.core.` 로 시작한다.
  - 예: `sangho/core/shared/...` → `jsangho.core.shared....`
- 경로 표기가 위 규칙과 어긋나면 코드를 작성하기 전에 멈추고 사용자에게 확인한다.

---

> **본 문서가 메인 규칙이다.** 충돌 시 `CLAUDE.md`가 우선한다.  
> 그래프: `path:www/`(프론트) · `path:sangho/`(백엔드) 경로로 구분.  
> [`.cursorrules`](.cursorrules)는 보조 참고용이다.

[Andrej Karpathy의 LLM 코딩 관찰](https://x.com/karpathy/status/2015883857489522876)을 바탕으로, LLM이 자주 내는 코딩 실수를 줄이기 위한 행동 지침이다.

**트레이드오프:** 속도보다 신중함에 우선한다. 사소한 작업은 상황에 맞게 판단한다.

---

## 규칙 파일 링크

| 경로 | 메인 (본 문서 계층) | 보조 |
|------|---------------------|------|
| 루트 | [`CLAUDE.md`](CLAUDE.md) | [`.cursorrules`](.cursorrules) |
| 백엔드 | [`sangho/CLAUDE.md`](sangho/CLAUDE.md) | [`sangho/.cursorrules`](sangho/.cursorrules) |
| 프론트 | [`www/CLAUDE.md`](www/CLAUDE.md) | [`www/.cursorrules`](www/.cursorrules) |
| Titanic | [`titanic/_docs/CLAUDE.md`](sangho/apps/titanic/_docs/CLAUDE.md) | [`titanic/_docs/.cursorrules`](sangho/apps/titanic/_docs/.cursorrules) |

---

## 1. 구현 전 사고 (Think Before Coding)

**가정하지 않는다. 혼란을 숨기지 않는다. 트레이드오프를 드러낸다.**

- 자신의 가정을 명시적으로 말한다. 불확실하면 질문한다.
- 해석이 여러 개면 조용히 하나를 고르지 말고, 대안을 나열한다.
- 더 단순한 방법이 있으면 말한다. 타당하면 사용자 요청에도 반대 의견을 낸다.
- 불분명하면 멈춘다. 무엇이 헷갈리는지 구체적으로 짚고 질문한다.

스택별 적용 → 각 경로 **`CLAUDE.md` 먼저**, 보조로 `.cursorrules` 참고

---

## 2. 단순성 우선 (Simplicity First)

- 요청받지 않은 기능·추상화·설정 가능성·비현실적 예외 처리를 넣지 않는다.
- “시니어 엔지니어가 과하게 복잡하다고 할까?”에 스스로 답한다.

---

## 3. 정밀한 수정 (Surgical Changes)

- 인접 코드·포맷·무관 데드 코드 정리 금지(언급만).
- **내 변경**으로 불필요해진 import·변수·함수만 제거한다.
- 바뀐 모든 줄이 사용자 요청과 직접 연결되어야 한다.

---

## 4. 목표 중심 실행 (Goal-Driven Execution)

- 모호한 일을 검증 가능한 목표로 바꾼다.
- 다단계 작업이면 단계별 검증 지점을 적는다.
- “작동하게 만들기”는 완료 기준이 아니다.

---

## 관련 문서

| 문서 | 역할 |
|------|------|
| [`CLAUDE.md`](CLAUDE.md) | **메인** — 아키텍처·코딩 행동 규칙 |
| [`.cursorrules`](.cursorrules) | **보조** — 하네스·vault |
| [`agent.md`](agent.md) | useState 객체 압축 등 |
