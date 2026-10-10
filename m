Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382363B4E9E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622076; cv=none; b=DqaaN9gD7H+VxfzYnGrzsgVGpik3CgsZCd/ElexdOfGahHEXhILvpDZVmtYSUPMxxWwi9lTXGUwMjBTYvdSVgUri55p6bGJSGXn9iORZs3eBjEOBhf91kYqUw3QZiPeyLhaWZw4a3WUu59GA3sZvU3Ku3k9qRrFKVRr40WOPNSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622076; c=relaxed/simple;
	bh=UtJEpKehQlvHwTb8cyBmPYvh5MgaScZYytb4juh2wjE=;
	h=Cc:From:Date:Message-Id:Content-Type:To:Subject:Mime-Version; b=W8SxnitFrmcNfFnh73c+uREQ976IoVAm+ESe1LK4yl0ctTeqsKsLwzxbgAdVBl+XI2VEVthTyuakWIVwQA5YFLpASjDN0uJfeicTrU3QzzRAXOdJ9OVvQ3HvYNn+TlQP2J9ctCcW4QQfSL8xiH5yy5ES8XS8R81eDptQ2EqMpmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=FTCKS6Pu; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="FTCKS6Pu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791622056; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Hy1eyWOTseZ82z5E7nGJ2+53iQ77tmb6cEWZz/WiuzA=;
 b=FTCKS6PujMKYvM2dPEXCZsYJMIUYp+dWEq9Frvj0lpttWdPG5r/7kWE6cTz/XfgOSV9sTH
 crvXy4klvZd8AGc7UCSshbU8UcQtg6R89QoJjx/jq3hO60pQ0Na1n7tAVyOTtIJxk605od
 tj/Yk2TvKI3GJzXEFyLwpIFEzW9uHHsLJbGixfwNgLVxdZuappfocpNsmmUmrV+g+mUn/o
 KnoKEqUr19KVC3qd4MAdMb9lPMkP2uqpMmrqbmztZB/sODDhE9xPsL/ajlbpjUKIOanLzN
 sB5aEK0tzWQr9fi5z5v/9jvkzmfvHkM5YcT4Lfbvg6aItR5T8dr6q7ryp6F8XQ==
Cc: <mark.rutland@arm.com>, <ardb@kernel.org>, <song@kernel.org>, 
	<dylanbhatch@google.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Date: Sat, 10 Oct 2026 16:47:18 +0800
Content-Transfer-Encoding: 7bit
Message-Id: <20261010084721.2197683-1-qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26ac9fba6+c0a566+vger.kernel.org+qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
To: <catalin.marinas@arm.com>, <will@kernel.org>
Subject: [PATCH 0/3] arm64: Fix text-poke byte-order and late PLT/veneer ROX handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1

This series fixes three bugs in the arm64 text-poke / module relocation
path, all introduced by the recent text-poke rework (451c3cab9a65
"arm64: patching: implement text_poke API" and 91b89a634487
"arm64/module: Use text-poke API for late relocations.").  The first
two are big-endian byte-order issues; the third is a panic when
livepatch emits PLT entries into read-only executable memory.

Patch 1 fixes big-endian breakage in late data relocations.  The
WRITE_PLACE() macro declared its temporary with the type of the source
argument (s64), but aarch64_insn_copy() copies only sizeof(*place)
bytes from the start of that temporary.  On a big-endian kernel the
most significant bytes sit at the lowest address, so a 16- or 32-bit
relocation copies the sign-extension upper half instead of the
computed value.  Typing the temporary after the destination element
fixes this.

Patch 2 fixes big-endian breakage in aarch64_insn_set().  The
instruction is passed to text_poke_memset() in host byte order, but
A64 instructions must be little-endian in memory.  On a big-endian
kernel the written bytes are reversed and the CPU takes an UNDEFINED
instruction exception when fetching them.  This is reachable in-tree:
bpf_arch_text_invalidate() fills freed JIT regions with
AARCH64_BREAK_FAULT through aarch64_insn_set(), and arm64 selects
HAVE_EBPF_JIT without a big-endian guard.  Converting to little-endian
before the memset, mirroring aarch64_insn_write(), fixes this.

Patch 3 (the main fix) routes PLT/veneer emission through the
text-poke API.  module_emit_plt_entry() and module_emit_veneer_for_adrp()
wrote PLT entries into the .plt section by direct assignment, but once
a module is fully formed its .plt is read-only/executable.  A late
(livepatch) relocation that falls back to PLT emission -- an
out-of-range R_AARCH64_CALL26/JUMP26, or an ADRP under
CONFIG_ARM64_ERRATUM_843419 -- triggers a synchronous Data Abort and
panics.  Routing through the text-poke API (mirroring WRITE_PLACE())
maps the page through the fixmap, avoiding the fault.

All three are tagged for stable.

Base-commit: next-20261008

Rui Qi (3):
  arm64/module: Fix big-endian breakage in late data relocations
  arm64: patching: Fix instruction byte order in aarch64_insn_set()
  arm64: module: Use text-poke for late PLT/veneer emission

 arch/arm64/kernel/module-plts.c | 35 ++++++++++++++++++++++++++++++---
 arch/arm64/kernel/module.c      |  2 +-
 arch/arm64/kernel/patching.c    |  4 +++-
 3 files changed, 36 insertions(+), 5 deletions(-)

-- 
2.20.1
