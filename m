Received: from mail-oi2-f41.google.com (mail-oi2-f41.google.com [74.125.231.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6663C3C0F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943158; cv=none; b=jc7bqdHvtH+XqjgwIO3elTn57eNPrJSFGvbWkm+MF56uWtb7PKdf8+GjS1KrMvxM8YIDvFIxk4tK9KGMVFcfoD9hfCn8Pz1NV+FeO0NCvtSmu8w4qOIz1tL77SCalthwMOCF66qqAYCIyZ7Qi/amEyzf2lSzwRB0kMJfSPNAsxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943158; c=relaxed/simple;
	bh=E1TRzDYd12tNpsM0OfO5X8br7h+EQkP9n3ZjhaF1+1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPZVhNuRy8CGK61S066mhX7cXngMXwVXcs6pS9FX4PGK9p1T9GYyvXA0S7F37l+/uf9GuOE389nAFdPRrbYS7QvM3HRDTX8j5RUHSfB8Y9k8dgafU+2n1yK+jDKPfQcHNvbhDCDWLZRLylPTHyXtadyoh80nUs1ulZ2U32tc6f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoX7YFxP; arc=none smtp.client-ip=74.125.231.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoX7YFxP"
Received: by mail-oi2-f41.google.com with SMTP id 5614622812f47-4f3312ca9f6so536968b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790943154; x=1791547954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=81uGpmP7cmZ5oefPKsTcsvoJoAO1uuBsnrj4SEE2374=;
        b=IoX7YFxPIcdu3uyAc/OBm14rDWq9jy9NfO2PeXWWKQuOA3zJ5TLojDCHFu7LP1Kyid
         yaU5viRyfF7kEoJJIF1BI46UaRDlAJbdLHKaI4vE0EYhBjmwNEersaJarFRx9jUBYg8L
         x+lNMWW0KeCQwONNyDEvKO9T6WVEUkc2O43opBcf4E6YL5TFJCOOeV0fdqQXB0IDjn7U
         GOE7MuKx05sXbtlrxEpI4jb6/07yz/rkkmASm2HL3NFdUP+dxeLI5ptDWU5HXtcCVA4B
         Yk0QINjVcR/7gnYv29NF0lpJXfHoWs7vFScLg3IxrgwvbS6PIodBgWXob8s7ywFSALGt
         2URw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790943154; x=1791547954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81uGpmP7cmZ5oefPKsTcsvoJoAO1uuBsnrj4SEE2374=;
        b=c9+7kuCrKRfRm6ShQgtVXzOhuNmL4BrIsdhj5FptHIdQedwMoxhNAppbnIsApdF5FE
         cmvMJ9RQK7n+ys7nt/M6KSCqm57DwRN72PSt6x/uPzRw8qlievPgMDoqTY3J3LzHpik3
         pk7HlU0DhqtbF8sbYxwQ7xk+jJ/vmQh56l0GlOFodcvZPQh+rQZWG+q6Cze0UwhdYQKy
         h2dO7RQgr6SRVKAZIJWAZ1G96vkp1xiyWEQGVEEW4NssEY1HVsxdC/ocP1ym1kL/OrnE
         sbtFCj/pHIq3klB5OBUE0ktG+VEGdiORmqhNNvM+lPaEWhHRRmB13bUhu6YVX2i1vaK8
         xOZw==
X-Forwarded-Encrypted: i=1; AKwUvBwu2YLUQ96LF0ttLxNHzLDyYKqE/2kvUkZH/xTho4TUdH/ah8oYGO8QAnQaul4KJ/nPCTLo1+UzRgx0yOk=@vger.kernel.org
X-Gm-Message-State: AFuF++klFKN6xQUMPLEN1vZt5YjwEq+21OVzT21cAbAOhN1q1GDbIT9/
	NHFx43TLeeI8dO64KjgM+m0SogcALtMBIpIcDJfmL5DM+HeyoJCTSmzP
X-Gm-Gg: AYBFou35OQjhqG6KqIBXH5juSSdFnByVesrxokIQNbdOaTrj5blMqNcgO4OXEnGWs6P
	b958ydmKVLz0xHxq8T2GB86P0q9rOKQzx6xUfJ3DDmYdfaTgLzSFfnCcWPD/oLaINWAM0EWkpav
	wMVkGVjDnuitY36Tei1DoEEvsv1VSmqglXZ/swvZjQtfvIHnDENXFhKsAGB7H2WXFSPalSpHIlk
	P1iN1pwWqR0A7H13nBCTRhP8JoPjfgOvzXdUdM5wbWXiAO4zHnN8LRBJ6ALmeZYS960gdp+LW7h
	lEDs+nlmncMoxvI0hj/D2h3PwtQigaqqu/bXOJSeN/3RbikNr1ZNOcCXCqjFeBvJsFoY1blwSCy
	nYtpzgLVVOZLhH0iWX6ENnUn/34lWduWjgHcUUFHtlS67LTaQ4WLP2g68YE1/dotp60ymUlBHB8
	pG8d+gSDzFqd/LOTZrcIjvP7Fv5se6EdmHhf1DMVjlkydVQJNimA8LaDBWnry6sDprAUJDAA==
X-Received: by 2002:a05:6808:14c2:b0:4c3:cec9:fd18 with SMTP id 5614622812f47-4f528ccf57emr1327475b6e.11.1790943154581;
        Fri, 02 Oct 2026 05:12:34 -0700 (PDT)
Received: from localhost ([2a03:2880:12ff:43::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f524cd09e2sm1963119b6e.14.2026.10.02.05.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:12:34 -0700 (PDT)
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
Subject: [PATCH v2] bpf, arm64: Fix racy plt target update in bpf_arch_text_poke()
Date: Fri,  2 Oct 2026 05:12:31 -0700
Message-ID: <20261002121233.561368-1-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a long-jump trampoline is attached to or detached from a bpf prog,
bpf_arch_text_poke() updates the plt target at the end of the prog by
temporarily making the page writable:

	set_memory_rw(page);
	WRITE_ONCE(plt->target, plt_target);
	set_memory_ro(page);

Since commit 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory
management"), bpf progs are allocated from the bpf prog pack, so
unrelated progs and their plts commonly share a page. The sequence
above is not serialized against other pokers, it runs before text_mutex
is taken and callers only hold the lock of the trampoline being
updated. Two CPUs attaching to or detaching from different target progs
in the same page can therefore race:

	CPU A                           CPU B
	set_memory_rw(page)
	                                set_memory_rw(page)
	                                WRITE_ONCE(plt_B->target, ...)
	                                set_memory_ro(page)
	WRITE_ONCE(plt_A->target, ...)  <- permission fault

This was hit on an arm64 server with 64K pages while attaching fentry
programs to bpf progs:

  Unable to handle kernel write to read-only memory at virtual address ffff80008f46d5f8
  ESR = 0x000000009600004f
  FSC = 0x0f: level 3 permission fault
  pte=00c00200ea5a0783
  Internal error: Oops: 000000009600004f [#1]  SMP
  pc : bpf_arch_text_poke+0x214/0x238
  lr : bpf_arch_text_poke+0x200/0x238
  Call trace:
   bpf_arch_text_poke+0x214/0x238 (P)
   __bpf_trampoline_link_prog+0x1c8/0x470
   bpf_trampoline_link_prog+0x64/0x90
   bpf_tracing_prog_attach+0x318/0x4a8
   bpf_raw_tp_link_attach+0x104/0x258
   bpf_raw_tracepoint_open+0x6c/0x90
   __sys_bpf+0x134c/0x3e10

Rather than serializing the permission changes, stop changing page
permissions altogether and write the plt target with
aarch64_insn_write_literal_u64(). It writes through the text patching
fixmap under patch_lock, the same way the rest of the prog pack is
written, and performs a single-copy atomic 64-bit store. The plt target
is naturally aligned (see build_plt()), so CPUs concurrently executing
the plt still observe either the old or the new target. This is the
same helper ftrace and static calls use to update 64-bit literals that
are loaded concurrently.

Fixes: 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory management")
Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
Changes in v2:
- Replace page permissions change with call to aarch64_insn_write_literal_u64
- Link to v1: https://lore.kernel.org/linux-arm-kernel/CADvopvZPO1gDMDhDOPcArjRJ0cPpSUZ5suMg-1kwRi+_-Xeitw@mail.gmail.com/
---
 arch/arm64/net/bpf_jit_comp.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 475e70653454..e353403cc1c3 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -3339,13 +3339,15 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type old_t,
 		plt_target = (u64)&dummy_tramp;

 	if (plt_target) {
-		/* non-zero plt_target indicates we're patching a bpf prog,
-		 * which is read only.
+		/*
+		 * non-zero plt_target indicates we're patching a bpf prog,
+		 * which is read only. The prog shares its page in the bpf
+		 * prog pack with other progs, so write the aligned target
+		 * through the text patching fixmap without flipping the
+		 * page permissions to avoid racing with concurrent pokers.
 		 */
-		if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), 1))
+		if (aarch64_insn_write_literal_u64(&plt->target, plt_target))
 			return -EFAULT;
-		WRITE_ONCE(plt->target, plt_target);
-		set_memory_ro(PAGE_MASK & ((uintptr_t)&plt->target), 1);
 		/* since plt target points to either the new trampoline
 		 * or dummy_tramp, even if another CPU reads the old plt
 		 * target value before fetching the bl instruction to plt,
--
2.53.0-Meta
