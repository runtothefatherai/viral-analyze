#!/usr/bin/env bash
# viral-analyze 설치 스크립트
# /viral-analyze 커맨드를 Claude Code에 등록합니다.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_CMD_DIR="$HOME/.claude/commands"

echo "🔥 viral-analyze 설치 시작..."

# ~/.claude/commands 폴더 생성
mkdir -p "$CLAUDE_CMD_DIR"

# 커맨드 복사
cp "$SCRIPT_DIR/commands/viral-analyze.md" "$CLAUDE_CMD_DIR/viral-analyze.md"
echo "✅ /viral-analyze 커맨드 설치 완료 → $CLAUDE_CMD_DIR/viral-analyze.md"

# reference 폴더 안내
echo ""
echo "📚 프레임워크 참고 문서 위치: $SCRIPT_DIR/reference/"
echo ""
echo "🎉 설치 완료! Claude Code에서 다음과 같이 사용하세요:"
echo "   /viral-analyze https://www.tiktok.com/@handle/video/123"
