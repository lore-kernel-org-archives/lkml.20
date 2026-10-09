Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2C23F9263
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535380; cv=none; b=kD+JCUyGRj8WBDfUTbH8YVtCIIj9r/BS4w4rAjEcAC+geaKmwDAiY1SZL2iifHyLL4F0bb/lwFaby5cCz0dY5wY9yylFXqS0IBfTbMHldSLxf4YX1K65SYQPJ9Qk4RFqsZbyMa7rQOCOpOCtz0bCWdQ5v49hUbPihZxrpGyxjX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535380; c=relaxed/simple;
	bh=/tYCxkBNMTy6qylJemxQKSHq4Chn7/dLxP++oZsBCG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sw7okVj15jyc8RC7/6eGTHLbRxl2EEa5n7bln6DMPgAqnsVV0N80xxZCq8lPzvOzq0TUWiyIsZrIwzHdhTp14S/pQfGYU/IFVNVou6E+CSBTGyq0evZSLC4AIuA5eH3kt0MhY/iMIimmvdw1guqDAfqCq9LtWVSZoFtHhF9YToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=i3aRsb/y; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="i3aRsb/y"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791535368; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=5AY+qxPktrH798J79id4Fdk8qu63plCfc1VdTFiH2aU=;
	b=i3aRsb/yTYxexiBoRJpUcE1sfF/Jk+dzTH9XJ5AAWEwi01NnwFXFhBK9d7hqMAWKFcbpO0cZPzi8v9OkJnh+jtOWunCtc3N9M9QtjvwUVy3ZkVBa022ZZ3EgnUwLqU338WpfGTKM87TdoMC1RxkzqadB7O+yNkgEbGXHgO36nIg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R661e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0XCSo3lo_1791535349;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XCSo3lo_1791535349 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 16:42:47 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Support inlined clocksource reads for the time counter
Date: Fri,  9 Oct 2026 16:42:28 +0800
Message-ID: <20261009084228.3240-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit 2e27beeb66e4 ("timekeeping: Allow inlining clocksource::read()")
lets an architecture inline the clocksource read behind a static branch, so
that a read which is a single instruction stops paying for the indirect
call in front of it. The branch is only enabled for a clocksource
advertising CLOCK_SOURCE_CAN_INLINE_READ. The commit b27801189f7f ("x86:
Inline TSC reads in timekeeping") wired x86 up to it.

The overhead matters for consumers that need accurate timestamps and take
them very often: 1PPS edge timestamps, PTP stamping, and polling mode PPS
drivers all end up in the timekeeping fast path.

RISC-V has the same shape. In S-mode the counter is the time CSR, so on
64-bit a read is a single csr_read(CSR_TIME), and
riscv_clocksource.read() is a wrapper whose whole body is that one
instruction. Every fast path timestamp therefore pays an indirect call
and a return to reach a single CSR read. Letting timekeeping inline the
read issues that instruction at the call site and drops the call, which
is where the gain comes from.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
A few notes:

- The gain is in instructions executed per read. Without inlining, a
  read is a function pointer load, an indirect call, and a frame around
  the rdtime - 11 instructions in all; inlined it is a jump-label branch
  and the rdtime - 2. The read is no longer shared, so each fast path
  function in timekeeping.o grows by 11 instructions (438 bytes).

- RV32 is left out on purpose. There the read is a retry sequence
  (rdtimeh, rdtime, rdtimeh) rather than one instruction, so the saving
  is much smaller while the sequence is duplicated at every read site,
  which is the wrong trade on the small in-order cores with tight
  I-caches that run 32-bit Linux. rv32 depends on NONPORTABLE and
  nobody has asked for it; if hardware data says otherwise, enabling it
  is a one-line Kconfig change.

- M-mode is left out because RISCV_TIMER is not built there and the
  CLINT clocksource reads MMIO, so there is no cheap counter read to
  inline.

 arch/riscv/Kconfig                     |  1 +
 arch/riscv/include/asm/clock_inlined.h | 14 ++++++++++++++
 drivers/clocksource/timer-riscv.c      |  3 ++-
 3 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/clock_inlined.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d6c2dbf8455c..f5d314ef37b8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -90,6 +90,7 @@ config RISCV
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
+	select ARCH_WANTS_CLOCKSOURCE_READ_INLINE if !RISCV_M_MODE && 64BIT
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select ARCH_WEAK_RELEASE_ACQUIRE if ARCH_USE_QUEUED_SPINLOCKS
diff --git a/arch/riscv/include/asm/clock_inlined.h b/arch/riscv/include/asm/clock_inlined.h
new file mode 100644
index 000000000000..450add2436e4
--- /dev/null
+++ b/arch/riscv/include/asm/clock_inlined.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_CLOCK_INLINED_H
+#define _ASM_RISCV_CLOCK_INLINED_H
+
+#include <asm/timex.h>
+
+struct clocksource;
+
+static __always_inline u64 arch_inlined_clocksource_read(struct clocksource *cs)
+{
+	return get_cycles64();
+}
+
+#endif
diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index b310e6721fac..768e0d0eaeb0 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -96,7 +96,8 @@ static struct clocksource riscv_clocksource = {
 	.name		= "riscv_clocksource",
 	.rating		= 400,
 	.mask		= CLOCKSOURCE_MASK(64),
-	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
+	.flags		= CLOCK_SOURCE_IS_CONTINUOUS |
+			  CLOCK_SOURCE_CAN_INLINE_READ,
 	.read		= riscv_clocksource_rdtime,
 	.vdso_clock_mode = VDSO_CLOCKMODE_ARCHTIMER,
 };
-- 
2.50.1

