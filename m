Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69892330301
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954408; cv=none; b=lbLOsdSize6Fy2awhbqVQce+BLnrwnq+/nqGu6aeghx4QFwcHcoQi12Na19ByUTMA12p6lqcUl9MGuHATlNOXXvm1DNYjZiJXlyp/LYGZBbbo4+gLzyastNcc57O146LZNgyvGhMaaUQh2Pef1ZJvV2VERYctezPFXtUo37GP8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954408; c=relaxed/simple;
	bh=D5wHx7ed/BRzm/wT5ADKjd8NkDCtLnef7iNDmTQ5ukg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2dFwRyAOi6vWfTAc3fKdv2caSkt0TyZ8uygkIrmC0dnU7P2eywJoY02oWP7yB2/DIWqHP7JzG4weP81DqerCZNPyzcekEmD6aGre970fojdk9wf9ueKWjrKoArAxmK0BDJ1W2pl01zq7nAg8H7ViUXiSoGpnxtAggbOATqQDkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nlH3Kq+Q; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nlH3Kq+Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=CZCNA5hXD8rEJ+ya1t/91nO9EvU/rN6ZxDBsiQB0+iQ=; b=nlH3Kq+QzPvsI1oA+vl2nN3uyT
	3u5p/GrqaroCuDn+P4sZjdlIOA6HYXnhzMgDHlKwDefMEpDN/M0kJndxd/bGDuSkDzDsT52bPhPWG
	s3CG+usSdd1vQENVLjrEtHcgMw9bu0F187mOKOmg50U6BYJGSeMvLVRpv6NvMeQSnUrxO40WmLzMp
	G59gia6yrat1rEfGuF61+RDi8bKdtmYQBqi7KKPmrODagq0xnvTxXu5wKQ4EOCZBLxYc5jyGUWZTB
	HvSTnKvEDYULu9SyEDzW4WAaJXyEe6zNk7K8vf7jI2AsGiCA29gScJiTvjvbZeJQ9MykGtqsWtBQw
	gAxHjRwQ==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCf34-000000064CR-2zi2;
	Fri, 02 Oct 2026 15:19:47 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xCf31-00000000IAu-3lqx;
	Fri, 02 Oct 2026 16:19:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Rodolfo Giometti <giometti@enneenne.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 1/2] arm64: Support inlined clocksource reads for the arch counter
Date: Fri,  2 Oct 2026 16:19:37 +0100
Message-ID: <20261002151938.69857-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002151938.69857-1-dwmw2@infradead.org>
References: <20261002151938.69857-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Commit 2e27beeb66e43 ("timekeeping: Allow inlining clocksource::read()")
allows an architecture's clocksource::read() to be inlined, and was only
wired up for x86_64 thus far in commit b27801189f7fc ("x86: Inline TSC
reads in timekeeping").

Add the corresponding ARCH_WANTS_CLOCKSOURCE_READ_INLINE support for the
arm64 arch counter, allowing the indirect clock->read() call in the fast
paths to be replaced with a direct sysreg read. A static key selects
CNTPCT vs CNTVCT as appropriate, and the inline support is only
advertised for the plain (no erratum workaround) read paths.

Measured on a Cortex-A53 at 1.35GHz (12.5MHz arch counter): the
interval from a raw counter read in the caller to the counter read
inside ktime_get_real_ts64() drops from 30.2ns to 23.4ns, mean of 1M
iterations. Every ktime_get*() user of tk_clock_read() benefits
similarly. Except ktime_get_snapshot_id(), which I shall get to shortly.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: LLM
---
 arch/arm64/Kconfig                     |  1 +
 arch/arm64/include/asm/clock_inlined.h | 26 ++++++++++++++++++++++++++
 drivers/clocksource/arm_arch_timer.c   | 21 +++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 arch/arm64/include/asm/clock_inlined.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..25795b87cd41 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -94,6 +94,7 @@ config ARM64
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
 	select ARCH_WANT_LD_ORPHAN_WARN
+	select ARCH_WANTS_CLOCKSOURCE_READ_INLINE
 	select ARCH_WANTS_EXECMEM_LATE
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
diff --git a/arch/arm64/include/asm/clock_inlined.h b/arch/arm64/include/asm/clock_inlined.h
new file mode 100644
index 000000000000..fe997412bc7d
--- /dev/null
+++ b/arch/arm64/include/asm/clock_inlined.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM64_CLOCK_INLINED_H
+#define _ASM_ARM64_CLOCK_INLINED_H
+
+#include <linux/jump_label.h>
+#include <asm/arch_timer.h>
+
+struct clocksource;
+
+/*
+ * Set by the arch timer driver when it selects the physical counter
+ * (kernel booted at EL2); otherwise the virtual counter is used. The
+ * driver only advertises CLOCK_SOURCE_CAN_INLINE_READ when it selected
+ * a plain (no erratum workaround) sysreg read matching this function.
+ */
+DECLARE_STATIC_KEY_FALSE(arch_timer_inline_read_pct);
+
+static __always_inline u64 arch_inlined_clocksource_read(struct clocksource *cs)
+{
+	if (static_branch_likely(&arch_timer_inline_read_pct))
+		return __arch_counter_get_cntpct();
+
+	return __arch_counter_get_cntvct();
+}
+
+#endif
diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index cc9a8b399004..1c3d503d881a 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -133,6 +133,13 @@ static noinstr u64 arch_counter_get_cntvct(void)
 u64 (*arch_timer_read_counter)(void) __ro_after_init = arch_counter_get_cntvct;
 EXPORT_SYMBOL_GPL(arch_timer_read_counter);
 
+#ifdef CONFIG_ARM64
+#include <asm/clock_inlined.h>
+
+/* Selects CNTPCT in arch_inlined_clocksource_read() */
+DEFINE_STATIC_KEY_FALSE(arch_timer_inline_read_pct);
+#endif
+
 static u64 arch_counter_read(struct clocksource *cs)
 {
 	return arch_timer_read_counter();
@@ -917,6 +924,15 @@ static void __init arch_counter_register(void)
 		} else {
 			rd = arch_counter_get_cntvct;
 			scr = arch_counter_get_cntvct;
+			/*
+			 * A plain sysreg read with no erratum workaround
+			 * matches arch_inlined_clocksource_read(); allow the
+			 * core timekeeping code to bypass the indirect call.
+			 */
+#ifdef CONFIG_ARM64
+			clocksource_counter.flags |=
+				CLOCK_SOURCE_CAN_INLINE_READ;
+#endif
 		}
 	} else {
 		if (arch_timer_counter_has_wa()) {
@@ -925,6 +941,11 @@ static void __init arch_counter_register(void)
 		} else {
 			rd = arch_counter_get_cntpct;
 			scr = arch_counter_get_cntpct;
+#ifdef CONFIG_ARM64
+			static_branch_enable(&arch_timer_inline_read_pct);
+			clocksource_counter.flags |=
+				CLOCK_SOURCE_CAN_INLINE_READ;
+#endif
 		}
 	}
 
-- 
2.43.0

