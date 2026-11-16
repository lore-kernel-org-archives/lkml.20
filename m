Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815684;
	b=UoApt/8nPzSfk+Ta/vHsE9/hqjSszukt4vz3Y97MdAs8LuRAltxdJGYXV3T/rrB2LwNT
	 oKIfdujIlnqdVZoUFE2GGZoK9nf5X3y0VJdrnCWy6k4nZDN/XY+Io7ROmjKv0X2X31s7W
	 pT9aiP3x/w4+vH1niN7NlvISmpavZxWbCmrkKeDkVQ2jYtN4KWtoXWrCVxc1xBug3jIuQ
	 cUK5e//E3X2XMTcoTPlvTnoMmOsBZNI4ntUGUnMOp2D9cyBF3YL5aomitTi+16tVMOnRF
	 6A3yjlSx08u/gCGORiA+oKzjGrBPChcKLEev6BrIMrFkr8sarFOnIFo0kUTE9x0oPvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3S8KfE2z0glH5v8quz46BnbWAnWJFZkpiRBDqpKkjZU=;
	b=3NrhsBmC2iMw4wbehvu0dXJ+SBx8eZBLTl9q9xtnPH4rz5baOfT9JTwxIK5LnZ6hkLap
	 arKsRjKHb2jVHiq9jKNC8HQgxpq4X0sKD6R9RUcy9WOCAmLcIcqCLXs+2wHa4D8mVRRC4
	 JkNAcpmEDQ6KtEn2v1QzGGl576Hjx3EdPWbD531l+/eDyAIeoPG2lY7xxWZUgjoMJgloT
	 w6A7Pa6kW7+pdRArmNSMHYh5b00F5dRNoFjHA4+gcqavS3ah+M6ZUivGOEDPo4QIKU3F9
	 +P560jE0GUx+WPDIjFn0iSz8Lrwp6EUDNCw7NKhEWAt/eHMGyjrUKUdb84b4T1oYfOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Svoyk9Oe;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5B0606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B5B0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Svoyk9Oe
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so17525745e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815682; x=1795420482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3S8KfE2z0glH5v8quz46BnbWAnWJFZkpiRBDqpKkjZU=;
        b=Svoyk9OeIgA5CrWzHRhBX/vVjGQ4KhCIwR8o+KZGSUeFauGW52ixWvTzihSZzy1AQF
         Jatlbgw2Oz/zzI8h3uf7zloAqp5S/zXdBi4u6E/YbQwCIIuH98hbAyryjBM9Gy8EvuUC
         jnJU0NM/O1FPwEOUUmZ0gt0YtUXszZZ4ZKrkQzerfilHTJVx7Jljx2KJFPzDX6NUDanB
         R8Om7gbV0y+Un8qQBOHE0KJC9QuaiA1PModXec5xfD8CUghQp7eIiepyoB5Qgk0HinjF
         Q5DpKj80L6HnqXk82BGO2/TZOE6VbgiX9pNz6htp5UInfwuxtd2BexPu2VhqvMFkrloN
         GQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815682; x=1795420482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3S8KfE2z0glH5v8quz46BnbWAnWJFZkpiRBDqpKkjZU=;
        b=oXyEFgICf9s6cAHawZNWqFIE1fmBay146EdgHsf6Rcvzz+an671AXS+lpgP5GDXsF9
         e00PIJZvYDqwLRFWa2rcGNuvPcsOW8tTxumZKjFgQQD8W62BtrM4rZ3AAYq8JIyW3nsZ
         CzhaGKAj+YyHuyXAW0LqC4AX60VzEt5+1XmNpCv8eD09gIjVzmPIQawvkJoI7nn81cTY
         QIPLIRWe1+Y1J3x80C9A7lniz8xLUeYZBKujPrY/PgYnE/RZgW8NkUhQxVSWDH/mk94j
         BtMk2hfyB+rQfljFnU3RdkwAJMhCVbP3pFPaRzvfhkimZIwzvuXS9aS7sTODibk1/3As
         wjkw==
X-Forwarded-Encrypted: i=1; AL+hErFRS40xFUpqmtqynILTJ9+KPVpYc1olcJ/YrfMZMNO6yH711Kc8D6lTs+0j4wo8kyHXKDzs1Q7lJ/05nQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WgjVnCbpNzZQ3dhgI0FEBe59vE33BAf6VkR/2lN7Z0BSEmVU0
	hx8LSbtyvriLlk0KU8yjtUaIJ6bHOmaur4D9kr3iQL+t+1vohosOBlea
X-Gm-Gg: AYBFou2QEWESuKQ+1qxsCWeRj6HOunAkJTtIdO5MbqTmjvmZI/iAsncRd0iPqT02MlK
	Tnt01UnIoKxWGSLjvg70Wn9VUA30IPsm46Lu0m9AHlKTEyZQgdBZuLoqsZlI5pQevgAImNbblza
	FsU+jhfWb3TLQZQxXfjJUiH76IDAb59PBvdxpBsqLinkhbxb4cXryVVh3a107TxWFEud0U0VbTj
	faDAvPq2bMN30P9wgJzRDfb1nqaGQfH/WkNixg2DZHstHIIh62dCXVY1OeSbQZTzWVP/rlNenT/
	dPEHMcqWV74HmcRXPSzUS5Oxy6oT/HWd4anMwWYXS98BcYSfxh+bwy/PLRqADphp4WBiWmcIO78
	KD/kgA5ljKzw2k3W0VCaujF3Z7WCeY0gThgXSPfvFPNFgIrc9MPyAylM+WlYi7hT3SyQPcxwd7u
	suAZxE6+IlqjhiAXVl1FHgmLlnRjAPA1gkiDMrDPjcy4WvIUHldb9Hegedw4MGQHgCY/ruF5Aa9
	PiEhFkpRjQFxzu9Fx32TkLvjsh5sw7taK3FGCgUZAdsOGPJUC2rPYkLAUdNBffqOI6airKXMm1K
	YIeIRN9WzmPdT5pR3M2bdYGh7Mm2ZWX0pUXKTck6h2gk8O866GuRdsusPyYpEm/Wnmolh9pKr9C
	HoBs2fT+SXtV9OoOEXKCoY9ykQuynXKYVHHB4xp086qcMmHcdwFa/Rc6fmM5qbKZPNOVHWk0NUT
	zAaQt5TvIRB5xxc0VO84ECAs5KFWFH
X-Received: by 2002:a05:600c:2d2:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4bb55a63720mr149965015e9.24.1794815682214;
        Sun, 15 Nov 2026 23:54:42 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-117-148-032.95.117.pool.telefonica.de. [95.117.148.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm210329875e9.14.2026.11.15.23.54.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 23:54:41 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] sched/preempt: Check notrace preempt-count updates
Date: Mon, 16 Nov 2026 08:54:21 +0100
Message-Id: <cover.1794814699.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_DEBUG_PREEMPT, the notrace preemption macros bypass the
bounds checks used by ordinary operations. Add checked noinstr updates
for their existing callers and share validation with
preempt_count_add() and preempt_count_sub().

Patch 1 forces the arm64 raw updates called by the new helpers inline.
Patch 2 does the same for preempt_count(), which the helpers use, for
should_resched(), reached by the debug notrace enable path, and for the
existing non-debug __preempt_count_dec_and_test() path. The corresponding
x86, s390 and asm-generic operations are already __always_inline.

Patch 1 is extracted from Hongyan Xia's entry RFC. Song Liu also posted
notrace annotations for the same arm64 helpers:

  https://lore.kernel.org/r/20261023011049.1164625-10-song@kernel.org

Patch 3 disables branch profiling for core.o when DEBUG_PREEMPT and
TRACE_BRANCH_PROFILING are both enabled. DEBUG_LOCKS_WARN_ON() evaluates
its condition before entering its instrumentation region, so profiling
that condition would call ftrace_likely_update() from noinstr text. The
scheduler Makefile already uses this per-object exclusion for
build_policy.o and build_utility.o.

The cost is loss of branch-profile data for the rest of core.o in that
configuration. Scheduler tracepoints and function tracing are unchanged.
A dedicated non-profiled object is the fallback if this object-wide cost
is considered too broad.

This series is independently useful. It also supplies the checked count
update planned for follow-up IRQ-entry work; it does not change IRQ entry,
trace-recursion lifetime or TRACE_CTX_TRANSITION.

This addresses Peter's suggestion here:

  https://lore.kernel.org/r/20261029093219.GH1779021@noisy.programming.kicks-ass.net

The series is based on v7.4-rc2.

Testing:

- Clang 19.1.7 x86-64: a W=1 defconfig-derived build with
  DEBUG_PREEMPT, annotated branch profiling, DEBUG_ENTRY and noinstr
  validation passed. A nested-KVM boot passed the built-in and external
  module checks and all five tracer workloads. A DEBUG_PREEMPT=n control
  retained branch profiling for core.o and emitted no new helper symbols.
- GCC 14.2 arm64: a W=1 PREEMPT_RT build and allmodconfig passed. The
  latter's nVHE object had no undefined references to the new helpers.
  A native Axion boot passed the built-in and module checks and all five
  tracers.
- GCC 14.2 and 16.2 ARC, C-SKY and MIPS: performance, size, all-branches
  and forced-noinline core.o inspections passed without prohibited
  noinstr relocations or branch-profile records. Full baseline and patched
  kernels plus the external debug module built. Matching QEMU boots reached
  the expected balanced and invalid-count markers on ARC and C-SKY UP and
  MIPS UP/SMP. The patched kernels diagnosed every invalid operation;
  rejected decrements retained their counts. An ARC DEBUG_PREEMPT=n
  control retained core.o profiling without references to the new helpers.

The MIPS UP baseline and patched positive boots emitted the same three
existing smp_processor_id() diagnostics; the SMP boots emitted none.

I used an LLM to help extract and review the changes, write the test
harnesses and prepare the commit messages.

Hongyan Xia (1):
  arm64: Always inline raw preempt count updates

Karl Mehltretter (2):
  arm64: Always inline preempt count and reschedule checks
  sched/preempt: Check preempt counts in notrace helpers

 arch/arm64/include/asm/preempt.h | 10 ++++----
 include/linux/preempt.h          | 22 ++++++++++++++----
 kernel/sched/Makefile            |  3 +++
 kernel/sched/core.c              | 40 ++++++++++++++++++++++++++++----
 4 files changed, 62 insertions(+), 13 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
