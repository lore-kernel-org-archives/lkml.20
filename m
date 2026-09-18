Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887285187EA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748117; cv=none; b=tUOF6i3iqhL7kFJrORIjxrNc8dunEjUq2RZb8PX44QYf8syrSB6FB9ETv7yFaBY+p3aDZm7Thm5xmfa6rDgMb0zlOe6RK3zgLyH/bASg4nYwyjnZTQJK0Z1/urCWggD2tpLCB1naKZCjz3ErA/Hpa+QF4gG6Rg8lg6p9guR+umA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748117; c=relaxed/simple;
	bh=4H8nq6aN5191R1wLSk/mNRCy+uaEBAGMhwj0bVdfAxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VceumLk6PrEXxMgmDfLrLc+LIBcC3sLjQekROECRz/EfW9DtUDSgv0GwOlesMeM9xHrbJFvcEHuWwm7lMrrMaVugRymRs627WlMFGWTrGpA2BEITj/5tPMLatKf/w/NnTOOsHgjzJyZZIdOGp1edxmH0dxvu7yY73giezgzAWUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jtCEb6pB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jtCEb6pB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8179F1F000FF;
	Fri, 18 Sep 2026 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748115;
	bh=O4WlNdEIdKBpgRVlNn9eY6c+SeO9ekMqgtGrusaeyd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jtCEb6pB1QhXR5GjRKnPXcGta5jkaxic0bs+1/lBhmhZpIXV+PNrFy8CjgacFxm++
	 PUy4J4jF4ok0N/IX52sLgWM8qU3KTAqMOIvOUuxX4Cj1DNs7BC1rcC/k1zjCBv3l5p
	 NEoCygbAed/r3GOd0v7pGSGDdLezqr8Qtv/hfMU3K0PfWvzyf/I+E1UdM4kS21ntPG
	 vQPbPQSidbgM7N250L2i9MQ8UQ/Pm8NNGb2MAw2/Mg8Gpl6WYScphFzxIoErZHGlfE
	 Zv16DarCVy3RLMvEZoTMtLNx5E2m08aUR9kLRmSmT2neYQjf7nNL3jo2/Xa4LYTXmz
	 X31DJ/ldCeuVA==
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
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 17/21] arm64: entry: Use SPSel to switch to overflow stack
Date: Fri, 18 Sep 2026 17:14:01 +0100
Message-ID: <20260918161407.2300-18-will@kernel.org>
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

When detecting a stack overflow on exception entry from EL1, use SPSel
to switch to the overflow stack without corrupting any GPRs. Not only is
this simpler than the previous logic, but it also opens the door to
more complicated overflow checks (for example, based on per-task stack
sizes or stacks which are not aligned to a specific page order) as well
as the possibility of returning from a stack fault if we were able to
resolve it.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/entry.S | 69 ++++++++++++---------------------------
 1 file changed, 21 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 6958ee238649..b4df2f23ebe7 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -51,11 +51,11 @@
 	mov	x30, xzr
 	.endif
 .Lskip_tramp_vectors_cleanup\@:
-	.endif
-
+	sub	sp, sp, #PT_REGS_SIZE
+	.else	/* \el == 1 */
+	.ifc	\ht, h
 	sub	sp, sp, #PT_REGS_SIZE
 
-	.if	\el == 1
 	/*
 	 * Test whether the SP has overflowed, without corrupting a GPR.
 	 * Task and IRQ stacks are aligned so that SP & (1 << THREAD_SHIFT)
@@ -63,45 +63,16 @@
 	 */
 	add	sp, sp, x0			// sp' = sp + x0
 	sub	x0, sp, x0			// x0' = sp' - x0 = (sp + x0) - x0 = sp
-	tbnz	x0, #THREAD_SHIFT, 0f
+	tbnz	x0, #THREAD_SHIFT, __bad_stack
 	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
 	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
+	.else	/* EL1t */
+	msr	spsel, #0			// Stay on the overflow stack
+	sub	sp, sp, #PT_REGS_SIZE
+	.endif
 	.endif
 
 	b	el\el\ht\()_\regsize\()_\label
-
-	.if	\el == 1
-0:
-	/*
-	 * Either we've just detected an overflow, or we've taken an exception
-	 * while on the overflow stack. Either way, we won't return to
-	 * userspace, and can clobber EL0 registers to free up GPRs.
-	 */
-
-	/* Stash the original SP (minus PT_REGS_SIZE) in tpidr_el0. */
-	msr	tpidr_el0, x0
-
-	/* Recover the original x0 value and stash it in sp_el0 */
-	sub	x0, sp, x0
-	msr	sp_el0, x0
-
-	/* Switch to the overflow stack */
-	adr_this_cpu sp, overflow_stack + OVERFLOW_STACK_SIZE, x0
-
-	/*
-	 * Check whether we were already on the overflow stack. This may happen
-	 * after panic() re-enables interrupts.
-	 */
-	mrs	x0, tpidr_el0			// sp of interrupted context
-	sub	x0, sp, x0			// delta with top of overflow stack
-	tst	x0, #~(OVERFLOW_STACK_SIZE - 1)	// within range?
-	b.ne	__bad_stack			// no? -> bad stack pointer
-
-	/* We were already on the overflow stack. Restore sp/x0 and carry on. */
-	sub	sp, sp, x0
-	mrs	x0, sp_el0
-	b	el\el\ht\()_\regsize\()_\label
-	.endif
 .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?
 	.endm
 
@@ -544,22 +515,24 @@ SYM_CODE_END(vectors)
 
 SYM_CODE_START_LOCAL(__bad_stack)
 	/*
-	 * We detected an overflow in kernel_ventry, which switched to the
-	 * overflow stack. Stash the exception regs, and head to our overflow
-	 * handler.
+	 * We detected an overflow in kernel_ventry.
+	 * Restore SP and X0.
 	 */
+	sub	x0, sp, x0
+	sub	sp, sp, x0
+	add	sp, sp, #PT_REGS_SIZE
 
-	/* Restore the original x0 value */
-	mrs	x0, sp_el0
+	/* Switch to the overflow stack */
+	msr	spsel, #0
 
-	/*
-	 * Store the original GPRs to the new stack. The orginal SP (minus
-	 * PT_REGS_SIZE) was stashed in tpidr_el0 by kernel_ventry.
-	 */
+	/* Stash the exception regs */
 	sub	sp, sp, #PT_REGS_SIZE
 	kernel_entry 1
-	mrs	x0, tpidr_el0
-	add	x0, x0, #PT_REGS_SIZE
+
+	/* Fix-up the saved SP */
+	msr	spsel, #1
+	mov	x0, sp
+	msr	spsel, #0
 	str	x0, [sp, #S_SP]
 
 	/* Stash the regs for handle_bad_stack */
-- 
2.55.0.1082.g2b9226bbc0-goog

