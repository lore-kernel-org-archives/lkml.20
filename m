Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83E935FF58
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790916056; cv=none; b=mHUydvLwoH5aGbINvebfTNi3qsKy1t+DPbDAE8OkmiieB1X3Mlslr0nzdtwZkcpO6y77RtVQxUI7I5zvecupUaFav4J03hIZkQf7evdZHdkbwy7nh3JgJiciw3z/1xyrndlSzipjkF3Aqpj0fW9u9b3RXktviKeP+2BJFDgeklo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790916056; c=relaxed/simple;
	bh=3GiF/F59t2XnQ+ScY1DItyDBwlG5LFfzw638Jucz8rk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tX0wc3ZQ8CkuNSakP6XbnFNRLIIJw2jYxZAk7xueB0n1OFyU+5+iK+pO4i2ftzxp+UoIis/Ik10lETYuweAGyhrPmvpobE4DATDt4j1laq7PSYGnWttcnGctRNCMyeb21vHEBWLWH3/ixLKyfhWzVyJZQbzzZZw44ZDgnK5K4Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIWhJ09X; arc=none smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIWhJ09X"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e7b5de66d0so3603751b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790916053; x=1791520853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+aNuBHrd5RMEXmJ5WPHyWr9jcSxnvnt7cywTSQ93A8M=;
        b=cIWhJ09XRqTYgUs3LWboT5O+SyVbVfRIb8F8TDXXIgOB7zvUhdQunaUnH1eY8y9hee
         2oypUXvDYspNli4xf1Z3VpH0nHfr8D+rrQPW/tsdzp6XfbMlE5fn0CxFetExrS4Ss04a
         /x3eq4/o5BQ3h9kD4MCZrtNxRfEbnRB4JMvtflW4wmr4lr1QMniMqZuuF8agTlUKEGF3
         2LeD4IQz36zpNhBN9MQwas60Qmyovpt8o6DBtlF7ExNOY351ozi5WzMKrrW+A5nHlmCH
         If84auHepKoZFSa3Zf8NZoWy8laTDw4DlEVUUlQQAWxqW2ZJK9a8N5L8XITvOmrFYVxK
         g5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790916053; x=1791520853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aNuBHrd5RMEXmJ5WPHyWr9jcSxnvnt7cywTSQ93A8M=;
        b=z6S3nvLG92KSR4yrLyrQA9An9zY751qALIGo5np+awLOu2TdxUso8Lc9w5cFtl8RPQ
         fe74bjGGkzyIXHroA189H7lCXmq5hw+gL+mVQjBL/pdUAZix+kTYmoerbS5Hr63bjPxr
         QYGFxH25KsAjAXsaD0fERC2/UAhiU0bhCfAtakgPYva9ZoNM+UDp7qlJYxdPzmOHxXS1
         tf5WKqJIWa4kYHE/da5G2MpCe8A7LtkIZhSv8NjGrETU3nO0pqT+/osz2pYUnEH4gruP
         NWmq1rW3vVHZT0ltpIGCmB+wlPbcLP5mkBi2YK+AjG5RlIT6NEybntUoXhW0LO8xoSUx
         VMOA==
X-Forwarded-Encrypted: i=1; AKwUvBywu2n3uGd9o+vzJ592mOnCfop74USytZ9C/3noEBWznaZ9RCVLCrSiJkbuZ5qgexqAoYKvIFX/7ImNsHs=@vger.kernel.org
X-Gm-Message-State: AFuF++nWP5u/wCEWVzRMwuAUqxegycj4OiUApS7iCqcK4e2j+LdVj8NG
	3+xHQ0MWcZ5vATsnp72a1t+lKajmcFqlcYGXK+86WAnOWHirhWP206hj
X-Gm-Gg: AYBFou19jFmW6OeoHXCslgzyNwnpCzf/tZuFpqjVIiz5zlfKpB5OYbGd4A7PWdZbIpW
	l4oQzolIyNh+OqsOBM5TmSGev8FKS19dqNmpeS08/WLGuHbd4eyTvAZ52VOu0EUx8N0On4tqCIZ
	Y5MJvvlA5Bswws8Tv2e3tmfm8AqAZBLZUA0nCZHrvgDBHanj00QuG4W0BixB7u1OQPlxt1LZjOD
	ZQbiK5qSw5DeHFMU0AVvK3vBD+ePDiENoYQyYIpvMzJbJYeK16UoJUSgzewGKc0DsY9ZA/q5weN
	NUvyhftVb2Dksl83UfKV/Yg4k5d+7D8Vhk/4uWwNoeuqlUrqFHWGPy9xXAGp6TLI879IsG8697j
	Fe6AJjpQfrLaFGkIY2/e0BmKIncI7KZYnMlu+GGwf3SG3cwHk2wPcwqtLQv6F6ycddBje2XOPjB
	GtHQodw5p5fT8ryZib62qE5aogb1e2vmEErdv2/mYbsdxbA9NgXb951rRoWkN0ZahQ54B4
X-Received: by 2002:a05:6808:13c2:b0:4ea:bd4e:5cc5 with SMTP id 5614622812f47-4f52ab8b76amr1425589b6e.46.1790916053267;
        Thu, 01 Oct 2026 21:40:53 -0700 (PDT)
Received: from localhost ([2a03:2880:12ff:3::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f523da65c2sm1217527b6e.5.2026.10.01.21.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:40:52 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bpf, arm64: Fix text_mutex critical section in bpf_arch_text_poke()
Date: Thu,  1 Oct 2026 21:40:48 -0700
Message-ID: <20261002044050.1277356-1-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Widen the text_mutex critical section in bpf_arch_text_poke() to cover
the page permission changes made while updating a bpf prog's plt target.
When a long-jump trampoline is attached to or detached from a bpf prog,
the plt target at the end of the prog is currently updated before
text_mutex is taken, by temporarily making the page writable:

	set_memory_rw(page);
	WRITE_ONCE(plt->target, plt_target);
	set_memory_ro(page);

Leaving this outside text_mutex assumes the page belongs only to the
prog being poked, whose pokes are already serialized by its trampoline
lock. Commit 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory
management") broke that assumption; it switched the arm64 JIT to the bpf
prog pack allocator, which packs programs into small chunks of large
shared allocations, without updating bpf_arch_text_poke(). Since then,
unrelated progs (and their plts) commonly share a page. Two CPUs
attaching to or detaching from different target progs in the same page
hold different trampoline locks, so their permission changes can
interleave:

	CPU A                           CPU B
	set_memory_rw(page)
	                                set_memory_rw(page)
	                                WRITE_ONCE(plt_B->target, ...)
	                                set_memory_ro(page)
	WRITE_ONCE(plt_A->target, ...)  <- permission fault

This was hit on a 64K page arm64 machine:

  Unable to handle kernel write to read-only memory at virtual address ffff80008f46d5f8
  FSC = 0x0f: level 3 permission fault
  pte=00c00200ea5a0783
  pc : bpf_arch_text_poke+0x214/0x238
  Call trace:
   bpf_arch_text_poke+0x214/0x238 (P)
   __bpf_trampoline_link_prog+0x1c8/0x470
   bpf_trampoline_link_prog+0x64/0x90
   bpf_tracing_prog_attach+0x318/0x4a8
   bpf_raw_tp_link_attach+0x104/0x258
   bpf_raw_tracepoint_open+0x6c/0x90
   __sys_bpf+0x134c/0x3e10

Fixes: 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory management")
Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
 arch/arm64/net/bpf_jit_comp.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 475e70653454..66fab0bfd3da 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -3338,12 +3338,20 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type old_t,
 		 */
 		plt_target = (u64)&dummy_tramp;

+	/* pages of the bpf prog pack are shared between progs, so the
+	 * set_memory_rw()/set_memory_ro() window below must be serialized
+	 * against other pokers too.
+	 */
+	mutex_lock(&text_mutex);
+
 	if (plt_target) {
 		/* non-zero plt_target indicates we're patching a bpf prog,
 		 * which is read only.
 		 */
-		if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), 1))
-			return -EFAULT;
+		if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), 1)) {
+			ret = -EFAULT;
+			goto out;
+		}
 		WRITE_ONCE(plt->target, plt_target);
 		set_memory_ro(PAGE_MASK & ((uintptr_t)&plt->target), 1);
 		/* since plt target points to either the new trampoline
@@ -3357,10 +3365,11 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type old_t,
 	/* if the old target and the new target are both long jumps, no
 	 * patching is required
 	 */
-	if (old_insn == new_insn)
-		return 0;
+	if (old_insn == new_insn) {
+		ret = 0;
+		goto out;
+	}

-	mutex_lock(&text_mutex);
 	if (aarch64_insn_read(ip, &replaced)) {
 		ret = -EFAULT;
 		goto out;
--
2.53.0-Meta
