# LLM 코딩 행동 지침 (보조)

> **메인 규칙:** [`.cursorrules`](.cursorrules) 계층을 먼저 Read한다.  
> 그래프: `path:www/`(프론트) · `path:sangho/`(백엔드) 경로로 구분.  
> 본 문서는 Karpathy 가이드라인 **보조** 참고용이다. 충돌 시 `.cursorrules`가 우선한다.

[Andrej Karpathy의 LLM 코딩 관찰](https://x.com/karpathy/status/2015883857489522876)을 바탕으로, LLM이 자주 내는 코딩 실수를 줄이기 위한 행동 지침이다.

**트레이드오프:** 속도보다 신중함에 우선한다. 사소한 작업은 상황에 맞게 판단한다.

---

## 메인 `.cursorrules` 링크

| 경로 | 메인 | 보조 (본 문서) |
|------|------|----------------|
| 루트 | [`.cursorrules`](.cursorrules) | [`CLAUDE.md`](CLAUDE.md) |
| 백엔드 | [`sangho/.cursorrules`](sangho/.cursorrules) | [`sangho/CLAUDE.md`](sangho/CLAUDE.md) |
| 프론트 | [`www/.cursorrules`](www/.cursorrules) | [`www/CLAUDE.md`](www/CLAUDE.md) |
| Titanic | [`titanic/_docs/.cursorrules`](sangho/apps/titanic/_docs/.cursorrules) | [`titanic/_docs/CLAUDE.md`](sangho/apps/titanic/_docs/CLAUDE.md) |

---

## 1. 구현 전 사고 (Think Before Coding)

**가정하지 않는다. 혼란을 숨기지 않는다. 트레이드오프를 드러낸다.**

- 자신의 가정을 명시적으로 말한다. 불확실하면 질문한다.
- 해석이 여러 개면 조용히 하나를 고르지 말고, 대안을 나열한다.
- 더 단순한 방법이 있으면 말한다. 타당하면 사용자 요청에도 반대 의견을 낸다.
- 불분명하면 멈춘다. 무엇이 헷갈리는지 구체적으로 짚고 질문한다.

스택별 적용 → 각 경로 **`.cursorrules` 먼저**, 필요 시 하위 `CLAUDE.md`

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
| [`.cursorrules`](.cursorrules) | **메인** — 하네스·코딩 규칙·vault |
| [`agent.md`](agent.md) | useState 객체 압축 등 |
