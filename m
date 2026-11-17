Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903683;
	b=NSnZdTOhixhiUBlfY0Xfoq35tftUu1YEsJYTS3zpZGhG18zi5uKYgp49LfFhKLpjqFkN
	 eu9eHpEG+OPcfWqXjyPhq74nX8A1KEFq+/GVbIz4nRGuJwwRinomB8/Dtxo9XSQ6KJs/1
	 i6VddBNkQRBCHGaogwrY59zilfgc9/AZZ+2Agf3apU5WduoYeBlq5rrVvQfgkA0n+ysbA
	 OsUiZuxxNdj+5/zqtKYGJWwdzxIJAMyNlYXNIQxVD62BaCXFwCzvnKkPvd/b5BTSlDTnJ
	 yZDAN1x938nbUVFhKB0lDrQHPi1Vr9QdZZ0oBimy8AJHlVy4FrYKTOppHw5jfybytAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903683;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=8i0TTE7h9bbQBwURemuTXftASyL5xgUCoM3o8JauDWs=;
	b=S1JUJlRhsCxu2u99oqGlGpufy5QIk58XzsTdqqvjVbckJg7vXAUpRl7GqiFVET4vwtax
	 IbhVwaVniXmMmHzGmlF0lO+H/DwTD5hXpkN7/U0D/FHGbKhkzdS6CkfADjPFFEzmFTCUJ
	 mHSu/+6NqXMkCgaEAd2bN2Ir1yrdJOCFzLEjC/TkLBrsiCX5bxdtRbPMy3ealj+zzpVCA
	 /gNjeoRJhvTiBaD6YtQpORF1Rr9Xe/mPCqE/FC7VrOwTIjWD1EHx4eh+g5adAkSkLkAWE
	 1t0HPfdbp7O7eOAE/qA2/YqN3CTBK8acpSw0DLU/7q/OEzD0zyx1ZL8RL2FmHIZ0xyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eem3T4eH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A0E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eem3T4eH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066871F000C4;
	Tue, 17 Nov 2026 08:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794903683;
	bh=8i0TTE7h9bbQBwURemuTXftASyL5xgUCoM3o8JauDWs=;
	h=From:Date:Subject:To:Cc;
	b=eem3T4eHcQ2HzlfNt5xHYmoj4MrJEUiXZ9VwDP3Hw4xrTohCP7OyUktYyAn3BimYE
	 U3fjjBfO7WsKMNqjVOuI40CguDlb4xbE9HpDzrXcw23a2Eloy+xJ0HnGVSVZaYCC0S
	 qjFjk+fVQ1y/s8iM7DZMQgmOg5tM3MPuDXUXGOlkEIzvCw0AmQO+s4q35C3Ud88gvH
	 q4oMZfRv9valUvNNayO+kuPwyogjuzA8v1W1PcTere/ICiDj5uaQ8wuuCHxka5KHsj
	 h344ZjOmpeSDdeTw7Rrcygr4mN0AHW479SPalmV1Ci5lT8elbTl53308ivtP7IorPC
	 sy5Oet1pPCrtQ==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 09:21:19 +0100
Subject: [PATCH] ARM: enable PREEMPT_LAZY
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-arm-lazy-preempt-v1-1-b5a9b0824b59@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQqCQBAG4KsM/7MDjpTaXiV62NZRB9KWWYlKv
 HvQd4BvR1E3LQi0w/VlxZ4rAklFSHNcJ2UbEAhN3bQi0nH0hR/x++HsqkveuD6Pl3RKvQztHRU
 hu472/pfX23H8AEkvHMtiAAAA
X-Change-ID: 20261117-arm-lazy-preempt-05f9c4c81d6b
To: Russell King <linux@armlinux.org.uk>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Add lazy preemption support following commit c8597e2dd8b6 ("arm64:
enable PREEMPT_LAZY"). Define TIF_NEED_RESCHED_LAZY in the low flag
bits inspected by the assembly return-to-user paths, include it in
_TIF_WORK_MASK, and handle it in do_work_pending() by calling schedule().

Keep kernel-mode IRQ return preemption restricted to TIF_NEED_RESCHED,
so lazy requests can defer preemption until return to userspace or
escalation by the scheduler tick.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Tested with Debian armhf on QEMU virt with four Cortex-A15 CPUs, in
both lazy and full modes: 45 futex, 21 POSIX timer and 12 nanosleep
checks passed, along with CPU/syscall, affinity and signal stress.
A temporary test module verified scheduling on lazy-only syscall
return requests. Single-CPU lazy-mode boot and stress also passed.
ARMv5 and Thumb-2 static-lazy return-path build checks passed.

Assisted by an LLM.
---
 arch/arm/Kconfig                   | 1 +
 arch/arm/include/asm/thread_info.h | 6 ++++--
 arch/arm/kernel/signal.c           | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0cc289a7184a..9f5e346249a1 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -21,6 +21,7 @@ config ARM
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
+	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SET_MEMORY
diff --git a/arch/arm/include/asm/thread_info.h b/arch/arm/include/asm/thread_info.h
index 943ffcf069d2..8bc647b8e079 100644
--- a/arch/arm/include/asm/thread_info.h
+++ b/arch/arm/include/asm/thread_info.h
@@ -144,6 +144,7 @@ extern int vfp_restore_user_hwstate(struct user_vfp *,
 #define TIF_NOTIFY_RESUME	2	/* callback before returning to user */
 #define TIF_UPROBE		3	/* breakpointed or singlestepping */
 #define TIF_NOTIFY_SIGNAL	4	/* signal notifications exist */
+#define TIF_NEED_RESCHED_LAZY	5	/* lazy rescheduling needed */
 
 #define TIF_USING_IWMMXT	17
 #define TIF_MEMDIE		18	/* is terminating due to OOM killer */
@@ -156,6 +157,7 @@ extern int vfp_restore_user_hwstate(struct user_vfp *,
 
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
+#define _TIF_NEED_RESCHED_LAZY	(1 << TIF_NEED_RESCHED_LAZY)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_UPROBE		(1 << TIF_UPROBE)
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
@@ -172,9 +174,9 @@ extern int vfp_restore_user_hwstate(struct user_vfp *,
 /*
  * Change these and you break ASM code in entry-common.S
  */
-#define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
+#define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY | \
 				 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
-				 _TIF_NOTIFY_SIGNAL)
+				 _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING)
 
 #endif /* __KERNEL__ */
 #endif /* __ASM_ARM_THREAD_INFO_H */
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 763e1930a1ea..efc8b8c2dc67 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -619,7 +619,7 @@ do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
 	 */
 	trace_hardirqs_off();
 	do {
-		if (likely(thread_flags & _TIF_NEED_RESCHED)) {
+		if (likely(thread_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))) {
 			schedule();
 		} else {
 			if (unlikely(!user_mode(regs)))

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261117-arm-lazy-preempt-05f9c4c81d6b

Best regards,
--  
Linus Walleij <linusw@kernel.org>

