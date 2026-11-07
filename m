Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036982;
	b=FXPwwyhNytfZC8/olQmKf/ALsrpgq6FXG4n0BPl40hMVQOkOVS5IK4nyPathjn734CTD
	 5nj7wq7j3ySsFGEGRW+pnGepriTVDeq4/V8adD1/I8GWvGufXFgEyo8eHtgkOA6z2B5dH
	 zdT5BoUZG1YcDbPDu6zpe9l/mk9kUBXLykWgH/uAyuOosmTDV0HUvgy2xy1PbPtmTdkh5
	 9GJdpI4vJybUfK9HmmImHjLqwDk28C05VFo9lnCZ3Qameoy8BjN9dqpBkmgQEJHP9VRNB
	 oLN5Eravhx1upzsMlM35FQxzp+zhs72jCTHQc26hV2ka7mWrQIGNfYj1E85t0jLnHfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036982;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6ReLcQgH9RvLD/pxySU154o3ASat434BAppbZmrKH4U=;
	b=JgnYgNVxgoo481yxta+ES3zKKW8n2AuzTSb5Wp7JI8otJSC/fPHRxQKTnFpL2UdQmj+b
	 mYfw7F0KXiN8CpIBEYiG9Qy9NYwIRGiBdavv02Si0fX8K749siSA6oRlbEIZZR9+cFTRX
	 SOdwWPVipv0Plf1iCvVpuLsLJ/TYqHZH6qSDkKGpaPKKY5az2EmNj/SDi+CcTlv9TctBA
	 EtSDSfvDnSmEhXpUi5hDgDFZEzU44DYOE2uccT+k/VXUPqfuqzBNq4g0DeqMgcUNhAaAK
	 Z2DzQ16owtXfSVlpJL9R5sXp7WEmcfJ8EHbIcHzd8ceiRQaSyvxQf4H9rDRwgZXT7QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L6EW9FTA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F6F606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L6EW9FTA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1581F008A3;
	Sat,  7 Nov 2026 07:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036982;
	bh=6ReLcQgH9RvLD/pxySU154o3ASat434BAppbZmrKH4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L6EW9FTArbdHrH1LURcBnbWL0uJNoSHMjZR/Fifq+ELmIb6D22mOGvNTQ2xnVrHPy
	 dSRlV457Ix078Cwe1hHHOugcuW1ZqqQNVSi3kRhLUwShZ+30iVZWzXokRkS7ZRrsCM
	 tK/Pkcuy4Cjq4NpAcJrqgwcIn2HzZC7pDvS0kBEvsmq7T3J2/oERttMj+3XHH81KIA
	 cfGCay6w6kSwiSiGXx5v03YeHhLn+ClfpwY01j2qsyxxPoGKzh+JSNyyVUGGFZQB4D
	 Bj8vnHETDYNFpg3OsRx1sTPr5elgOYRSSU00YJlrIDNAu4K+v1pFkqGPOoc507Hef0
	 445MA3ooEALcA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: Keep helpers used by noinstr code in non-instrumentable text
Date: Sat,  7 Nov 2026 15:16:05 +0800
Message-ID: <20261107071605.17536-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107071605.17536-1-jszhang@kernel.org>
References: <20261107071605.17536-1-jszhang@kernel.org>
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

A plain inline annotation does not guarantee inlining. In particular,
size optimization can cause helpers called from noinstr functions to
be emitted out of line in .text. Such copies do not inherit the
caller's instrumentation restrictions.

Use __always_inline for the IRQ, idle, stack-check and vector helpers
reachable from non-instrumentable entry paths, including their nested
helpers. Also force inline arch_exit_to_user_mode_prepare().

Build-tested the affected entry, trap, idle, stacktrace and KVM objects
with GCC and CONFIG_CC_OPTIMIZE_FOR_SIZE=y. Inspected object symbols
and relocations.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 arch/riscv/include/asm/cpuidle.h      |  2 +-
 arch/riscv/include/asm/entry-common.h |  4 ++--
 arch/riscv/include/asm/irqflags.h     | 14 +++++++-------
 arch/riscv/include/asm/processor.h    |  2 +-
 arch/riscv/include/asm/stacktrace.h   |  2 +-
 arch/riscv/include/asm/vector.h       | 16 ++++++++--------
 6 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/cpuidle.h b/arch/riscv/include/asm/cpuidle.h
index 71fdc607d4bc..edb064a8d2e5 100644
--- a/arch/riscv/include/asm/cpuidle.h
+++ b/arch/riscv/include/asm/cpuidle.h
@@ -10,7 +10,7 @@
 #include <asm/barrier.h>
 #include <asm/processor.h>
 
-static inline void cpu_do_idle(void)
+static __always_inline void cpu_do_idle(void)
 {
 	/*
 	 * Add mb() here to ensure that all
diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index 34ed149af5d1..90c6d61a2251 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -7,8 +7,8 @@
 #include <asm/thread_info.h>
 #include <asm/vector.h>
 
-static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
-						  unsigned long ti_work)
+static __always_inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
+							   unsigned long ti_work)
 {
 	if (ti_work & _TIF_RISCV_V_DEFER_RESTORE) {
 		clear_thread_flag(TIF_RISCV_V_DEFER_RESTORE);
diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index 6fd8cbfcfcc7..0478ea545ceb 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -10,43 +10,43 @@
 #include <asm/csr.h>
 
 /* read interrupt enabled status */
-static inline unsigned long arch_local_save_flags(void)
+static __always_inline unsigned long arch_local_save_flags(void)
 {
 	return csr_read(CSR_STATUS);
 }
 
 /* unconditionally enable interrupts */
-static inline void arch_local_irq_enable(void)
+static __always_inline void arch_local_irq_enable(void)
 {
 	csr_set(CSR_STATUS, SR_IE);
 }
 
 /* unconditionally disable interrupts */
-static inline void arch_local_irq_disable(void)
+static __always_inline void arch_local_irq_disable(void)
 {
 	csr_clear(CSR_STATUS, SR_IE);
 }
 
 /* get status and disable interrupts */
-static inline unsigned long arch_local_irq_save(void)
+static __always_inline unsigned long arch_local_irq_save(void)
 {
 	return csr_read_clear(CSR_STATUS, SR_IE);
 }
 
 /* test flags */
-static inline int arch_irqs_disabled_flags(unsigned long flags)
+static __always_inline int arch_irqs_disabled_flags(unsigned long flags)
 {
 	return !(flags & SR_IE);
 }
 
 /* test hardware interrupt enable bit */
-static inline int arch_irqs_disabled(void)
+static __always_inline int arch_irqs_disabled(void)
 {
 	return arch_irqs_disabled_flags(arch_local_save_flags());
 }
 
 /* set interrupt enabled status */
-static inline void arch_local_irq_restore(unsigned long flags)
+static __always_inline void arch_local_irq_restore(unsigned long flags)
 {
 	csr_set(CSR_STATUS, flags & SR_IE);
 }
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index e9d339bcb7e9..a921c6f2675a 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -186,7 +186,7 @@ extern void start_thread(struct pt_regs *regs,
 extern unsigned long __get_wchan(struct task_struct *p);
 
 
-static inline void wait_for_interrupt(void)
+static __always_inline void wait_for_interrupt(void)
 {
 	ALT_RISCV_WFI();
 }
diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index b1495a7e06ce..c7c991452e11 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -16,7 +16,7 @@ extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *re
 extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
 			   const char *loglvl);
 
-static inline bool on_thread_stack(void)
+static __always_inline bool on_thread_stack(void)
 {
 	return !(((unsigned long)(current->stack) ^ current_stack_pointer) & ~(THREAD_SIZE - 1));
 }
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index cd09f32e1ea3..8e6a4c97cfb5 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -85,12 +85,12 @@ static __always_inline bool has_xtheadvector(void)
 		return false;
 }
 
-static inline void __riscv_v_vstate_clean(struct pt_regs *regs)
+static __always_inline void __riscv_v_vstate_clean(struct pt_regs *regs)
 {
 	regs->status = __riscv_v_vstate_or(regs->status, CLEAN);
 }
 
-static inline void __riscv_v_vstate_dirty(struct pt_regs *regs)
+static __always_inline void __riscv_v_vstate_dirty(struct pt_regs *regs)
 {
 	regs->status = __riscv_v_vstate_or(regs->status, DIRTY);
 }
@@ -105,7 +105,7 @@ static inline void riscv_v_vstate_on(struct pt_regs *regs)
 	regs->status = __riscv_v_vstate_or(regs->status, INITIAL);
 }
 
-static inline bool riscv_v_vstate_query(struct pt_regs *regs)
+static __always_inline bool riscv_v_vstate_query(struct pt_regs *regs)
 {
 	return !__riscv_v_vstate_check(regs->status, OFF);
 }
@@ -198,7 +198,7 @@ static __always_inline void __vstate_csr_restore(struct __riscv_v_ext_state *src
 	}
 }
 
-static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
+static __always_inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 					 void *datap)
 {
 	unsigned long vl;
@@ -235,7 +235,7 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 	riscv_v_disable();
 }
 
-static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_from,
+static __always_inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_from,
 					    void *datap)
 {
 	unsigned long vl;
@@ -272,7 +272,7 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 	riscv_v_disable();
 }
 
-static inline void __riscv_v_vstate_discard(void)
+static __always_inline void __riscv_v_vstate_discard(void)
 {
 	unsigned long vl, vtype_inval = 1UL << (BITS_PER_LONG - 1);
 
@@ -300,7 +300,7 @@ static inline void __riscv_v_vstate_discard(void)
 	riscv_v_disable();
 }
 
-static inline void riscv_v_vstate_discard(struct pt_regs *regs)
+static __always_inline void riscv_v_vstate_discard(struct pt_regs *regs)
 {
 	if (riscv_v_vstate_query(regs)) {
 		__riscv_v_vstate_discard();
@@ -317,7 +317,7 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 	}
 }
 
-static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
+static __always_inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
 	if (riscv_v_vstate_query(regs)) {
-- 
2.55.0

