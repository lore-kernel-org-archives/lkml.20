Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABDC3C8C48
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622281; cv=none; b=J7IsqD0KD3J8lOhIVdbwuQpgOsSjM5XeUKaQiJDdQ2lhucDqTogiSDWjJsY/WVXAF8Deio0CEca7ShLkDi4YbNMIObaLUhSxMSQ78MCRkYvsjy/h2xkf+fmLz0XzztQ38gEQrXqokWPmw3EjV/vIeQHbNH0JwirfotMWVlWPd2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622281; c=relaxed/simple;
	bh=cd+qtmAUyM54UmD8OqQP4Yq41CihaITI5H1EIaBCFO8=;
	h=Cc:Mime-Version:References:From:In-Reply-To:Content-Type:To:
	 Subject:Date:Message-Id; b=g0VTPQSked5g2ZLrupDSs/apnIVEqhO/M343pVnMBDQ3IJxpgpI5BXYrzCqbgtRK9ThzvB/QWRFJG8lc5VOAjoPudXHqsroTVob4y239uI/eo+fVXx+fvqBX05Pyb/4IxMinTzWLQ/z733ot2zAGNHpkRhtl82emcyJVm9AFXnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=nMoo/SF1; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="nMoo/SF1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791622271; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=US+Gg57swXQ2D9e2dltsJCvKtQB77YrVn7jqeloa4eI=;
 b=nMoo/SF1pWKjC+qel/mkFZOq902NvICMhgxq46LNnzUnpGTXrZgp/BLtY42qb+8nahyQI+
 pzKcIEBtRkBDyCnGoBJ50nKFnba6kFEhzFt+0N0yqqkFNwK/XusKc2Wudd9mSkkcDNLDCf
 t51jmPkv9z+TVfF+CLSZqi8G1pnLyTTSr/oa3X/zJoUII50H4x4OQhj8bp/VDD3Jo8ztjH
 RSzJQ876Dt03ZyyOC9GPDhKrhoz2dw6v4aieyfMV8KjUH9O+NFUxngngvVITdQ4FYjq7oB
 echs45WRoWauLHTRBo4dwFqZgy4goWf4yGvzBaR7oRbzNjtaua9YxCHdCvFoNQ==
Cc: <mark.rutland@arm.com>, <ardb@kernel.org>, <song@kernel.org>, 
	<dylanbhatch@google.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>, 
	<stable@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ac9fc7d+e011b0+vger.kernel.org+qirui.001@bytedance.com>
References: <20261010084721.2197683-1-qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20261010084721.2197683-1-qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
X-Original-From: Rui Qi <qirui.001@bytedance.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>
Subject: [PATCH 2/3] arm64: patching: Fix instruction byte order in aarch64_insn_set()
Date: Sat, 10 Oct 2026 16:50:54 +0800
Message-Id: <20261010085055.2200241-1-qirui.001@bytedance.com>

aarch64_insn_set() passes the host-endian u32 instruction straight to
text_poke_memset(), which memset32()'s it into memory in host byte order.
AArch64 instructions must be little-endian in memory, so on a big-endian
kernel the written bytes are reversed and the CPU takes an UNDEFINED
instruction exception when fetching them.  The sibling aarch64_insn_write()
already converts with cpu_to_le32(); aarch64_insn_set() does not.

This is reachable in-tree: bpf_arch_text_invalidate() fills freed JIT
regions with AARCH64_BREAK_FAULT through aarch64_insn_set(), and arm64
selects HAVE_EBPF_JIT without a big-endian guard, so the path is taken on
BE kernels with BPF JIT.  The direct-fill loop in the same file already
cpu_to_le32()'s the constant, confirming the expected byte order.

Convert the instruction to little-endian before the memset, mirroring
aarch64_insn_write().  On LE the conversion is a no-op, so behaviour is
unchanged.

Fixes: 451c3cab9a65e656c3b3d106831fc02d56b8c34a ("arm64: patching: implement text_poke API")
Cc: stable@vger.kernel.org
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/arm64/kernel/patching.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 09f019c6547a..ffd790b2b277 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -170,10 +170,12 @@ noinstr void *aarch64_insn_copy(void *dst, void *src, size_t len)
  */
 noinstr void *aarch64_insn_set(void *dst, u32 insn, size_t len)
 {
+	__le32 __insn = cpu_to_le32(insn);
+
 	if ((uintptr_t)dst & 0x3)
 		return NULL;
 
-	return __text_poke(text_poke_memset, dst, &insn, len);
+	return __text_poke(text_poke_memset, dst, &__insn, len);
 }
 
 int __kprobes aarch64_insn_patch_text_nosync(void *addr, u32 insn)
-- 
2.20.1
