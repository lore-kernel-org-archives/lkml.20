Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D2E511229
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748062; cv=none; b=NVuRI3gUERcvWnAmvZmzy+/NGIjeHeYVujJU3H+ii03fp0/RolERadqpvhzOySI91fLOuWB4EYySf8hrg3hj30CvLtk9wfsoR7Heqm1fVle4k5awhuYQs3w5hdCYpqZATQzmI9EakMKyeNutTrklmHT/Q6Mp4K7/JSCvSAmcj70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748062; c=relaxed/simple;
	bh=jEHOyThQNVQGH87GswmHtKYBQUn0el5qwv3lK3LootU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZ+MTTjrnaRsGd5hY/9O8eIg3nAKVLgTbpPQ6z0YXvf4kTtQ+C/WNRz7BoJ+RLGdwfIxVD9tbcdpuy6YaOPhTu/xUu1Wz73hAcHKQ++Lixy1XeRtx+MZpwgbWXcz64Ab5UtzGk5M7V0t7iTcCr4U0cjiV8fFXbtM5ApHZJimr9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJ/U7tCM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJ/U7tCM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4BF1F00898;
	Fri, 18 Sep 2026 16:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748059;
	bh=g05Ard4UsBeemIxWUEUKYYZHiVLLsuvwUe2V0GrB124=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iJ/U7tCMmdcODZval+eCkvTcE/eHYCD/sk5kfMZJcWywfaUd5spljQRtyBnx2LLcr
	 mvOYukQVMrnMRhxDtFtAYpGoMnhyOa7KbHNsFb9umxVfLqPyWmp5/2Vu8aE5v2DDei
	 4M9OVXmoEijL8ztroDyvYwqaxwDMFKJu2KhtG39A3rhg19Isk/1Z6p0IuD81zB/wPT
	 /8ysYLuZ90um3OuJCNfUbo159L37cfQ3cqkB2bAsIcRoFhlmGldQFENq0osA/ouRW+
	 xF5jmImyd7jDelonalvOm/5ryybQ6GNT/08JxX9Wo0BiifR4WxmcWmI6ABZRT4fGBw
	 8Q9a6i4QiIZFg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: [PATCH v2 01/21] arm64: entry: Defer setting of TPIDRRO_EL0 until exit to userspace
Date: Fri, 18 Sep 2026 17:13:45 +0100
Message-ID: <20260918161407.2300-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for using TPIDRRO_EL0 to point at 'current' while running
inside the kernel, defer its userspace initialisation from the
context-switch patch to exception return. This has the added benefit of
not having to worry about keeping the in-memory value and the register
value in-sync during preemptible sections.

Cc: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/asm-offsets.c |  1 +
 arch/arm64/kernel/entry.S       |  4 +++-
 arch/arm64/kernel/process.c     | 16 +---------------
 arch/arm64/kernel/sys_compat.c  |  7 -------
 4 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 9c853ed3ceab..6038ab3beb25 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -42,6 +42,7 @@ int main(void)
 #endif
   BLANK();
   DEFINE(THREAD_CPU_CONTEXT,	offsetof(struct task_struct, thread.cpu_context));
+  DEFINE(THREAD_TP_VALUE,	offsetof(struct task_struct, thread.uw.tp_value));
   DEFINE(THREAD_SCTLR_USER,	offsetof(struct task_struct, thread.sctlr_user));
 #ifdef CONFIG_ARM64_PTR_AUTH
   DEFINE(THREAD_KEYS_USER,	offsetof(struct task_struct, thread.keys_user));
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index f63049ac32dc..59f045e496ec 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -47,7 +47,6 @@
 	b	.Lskip_tramp_vectors_cleanup\@
 	.if	\regsize == 64
 	mrs	x30, tpidrro_el0
-	msr	tpidrro_el0, xzr
 	.else
 	mov	x30, xzr
 	.endif
@@ -360,9 +359,12 @@ alternative_else_nop_endif
 	.if	\el == 0
 	ldr	x23, [sp, #S_SP]		// load return stack pointer
 	msr	sp_el0, x23
+	msr	tpidrro_el0, xzr
 	tst	x22, #PSR_MODE32_BIT		// native task?
 	b.eq	3f
 
+	ldr	x0, [tsk, #THREAD_TP_VALUE]
+	msr	tpidrro_el0, x0
 #ifdef CONFIG_ARM64_ERRATUM_845719
 alternative_if ARM64_WORKAROUND_845719
 #ifdef CONFIG_PID_IN_CONTEXTIDR
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 581f80e9b9b7..bfdc12166895 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -256,17 +256,8 @@ static void tls_thread_flush(void)
 	if (system_supports_tpidr2())
 		write_sysreg_s(0, SYS_TPIDR2_EL0);
 
-	if (is_compat_task()) {
+	if (is_compat_task())
 		current->thread.uw.tp_value = 0;
-
-		/*
-		 * We need to ensure ordering between the shadow state and the
-		 * hardware state, so that we don't corrupt the hardware state
-		 * with a stale shadow state during context switch.
-		 */
-		barrier();
-		write_sysreg(0, tpidrro_el0);
-	}
 }
 
 static void flush_tagged_addr_state(void)
@@ -531,11 +522,6 @@ static void tls_thread_switch(struct task_struct *next)
 {
 	tls_preserve_current_state();
 
-	if (is_compat_thread(task_thread_info(next)))
-		write_sysreg(next->thread.uw.tp_value, tpidrro_el0);
-	else
-		write_sysreg(0, tpidrro_el0);
-
 	write_sysreg(*task_user_tls(next), tpidr_el0);
 	if (system_supports_tpidr2())
 		write_sysreg_s(next->thread.tpidr2_el0, SYS_TPIDR2_EL0);
diff --git a/arch/arm64/kernel/sys_compat.c b/arch/arm64/kernel/sys_compat.c
index 0451f96c2c3f..59eee301c6f4 100644
--- a/arch/arm64/kernel/sys_compat.c
+++ b/arch/arm64/kernel/sys_compat.c
@@ -89,13 +89,6 @@ long compat_arm_syscall(struct pt_regs *regs, int scno)
 
 	case __ARM_NR_compat_set_tls:
 		current->thread.uw.tp_value = regs->regs[0];
-
-		/*
-		 * Protect against register corruption from context switch.
-		 * See comment in tls_thread_flush.
-		 */
-		barrier();
-		write_sysreg(regs->regs[0], tpidrro_el0);
 		return 0;
 
 	default:
-- 
2.55.0.1082.g2b9226bbc0-goog

