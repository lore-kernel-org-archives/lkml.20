Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7498A2EC54A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283434; cv=none; b=noVwasLVt62Nblhvh3idAhE2g9m/IijXM4Ubpe2X8MaPuPUxbl4/KknIsPsOYkprBtWY6DZGE+lpftqml+biEfx/irQxGhOnVjbQNy1mVOXUgdxw2AM0g+iOLyAlMbAW9CvKXJqYB6bnwQVI+lXhOFkFV3S6v7vdS/L9e3pE0ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283434; c=relaxed/simple;
	bh=/0yd4Du7QZlvnOx8zJS1srx0LAKVINg0cMFPHUNIvZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G2+Ep/zQNIpK2LJGvF+61FiJx/GMN5cdDfAJ25RlKXpAl/6ymijSojiO+lRnPSju62FIjeqNIqB68AskicYoDtot4PsZoVZWX++hHrjpctlwwtHBaj5W60p8ip1Jg6PAQUqVH4nSBFlPbdAFLI4Ep5Xu2qL4KlqHphA8JCiGtyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0qmS03/; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0qmS03/"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c294ad260fdso42678266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790283430; x=1790888230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gAY6iiq5ZHyYfStlP2cfZDHdWP/WZxVPSTqYIRNjTM8=;
        b=N0qmS03/hPEvvGRVHD1OV9p+2ku0R80TM5nrMcxt9IhrvU+kJ/ESnkT4XrzsXK6ZUP
         M7BFML9iogq2NFTnnVjgze760gTITjN0MFjyjz/WTVsJwOh9afwfmSsYPH/B3dG7hb91
         60whhckfjXQlvJ8s+ZZI3Q0hhgX//zWusC/N5Vqj/nvx506GNwDFTKoqV2G8l+1CY2zd
         pEGi06Q6eXj9ZNIQYqwDWs7rBsoXxr5UbbHxx8PQsd20ux9RUsZfEuTwbkKoXTTajWXm
         Mql2+HLeiM1K2O7nGhzC+gNl8ECYQXWl39M5I7UJjN+PHDnQpxDfBP9X4jJH/YUEuIAl
         ZYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283430; x=1790888230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gAY6iiq5ZHyYfStlP2cfZDHdWP/WZxVPSTqYIRNjTM8=;
        b=2EemWxeE/u4YivjZpPfUtMyBmY2VUFWnzngCyMWpxpcUpzTIscMl4LzNsclDlgvO6l
         owzJ2roTQRqbh3KGpyzueCUzKD3FAPiORBg7Sy1QswqeGV/qImkJ2b9oPK4yaGME+Wp9
         Q+UyN0YMRRhN+0TLAoMblijnFfx0PQ4FDkSKtYaHd1gHB3LCg+LoCPy3jMfyvGobwXhb
         ga0leLo5yDG+/TZ9Qjk8PYt/qHRGYsdvWKQdMwwb16Qu7CS5TUvA/BgmhNtTN+aABOID
         WTRSREIgo0WdZOhU0N0/CeH1T7H1sy1tGa7eoRQYgKkKkyZ9XQW0lZ3VVtTPde5d4T4l
         3VEA==
X-Forwarded-Encrypted: i=1; AKwUvBxr0q3g6AR/xUyPaQoh8Iss09hm4ILCngSwNXk/f3F47FUUbLTKSsVAdz2C528rpzvjRzsnSmoUhF97KC0=@vger.kernel.org
X-Gm-Message-State: AFuF++lilV7hd88OInSYILyAEr6rslTqxUiYRjgMjpebl6sdlXPgGQp2
	6kqggm7E2ZT70xOcqbTanWCjCkrIc/hhpfVkTb3GgWUsTxRnkFNc+GB/
X-Gm-Gg: AYBFou2Suz3ZzwZmzzDDvxxrVn4zWCSyOp03N86P1ElJTPaMKBhoKbvrec2v1QGnCQN
	XlOFzFIxyBWgNvZYv/hjvQ05BvPM01iniC9eoG0nP7OWf48W0gs2gnAgeKSGAKcZVIuA44IzcWW
	p39OOplpVGkwI/SIuuxDMcW+e74MzICebat0Q46sGxyizE+t4z+/Z50sI+HwQ5+MKLWiE1Dd48Q
	WPG7MZQ951OCgrFTCjAr0+hxB0KH6D880eqomxGx+jW95uqoeenf9mAv1x/KCewihaewm+8WL/1
	xu3L58jvk1ub78HJaYrelG3nVJNl8QFq+9duGL+cUWW2FPBvVO+9ca8es/eihde8aZEETLKqpmm
	HEzEV0XcgAh5HtgFjloISzPSaL2TRtPBsnTjA8GcIxYWHO8LAY+Qypn9gSEdpWW53e4Og/yx/bD
	FIEVdQDxcLqkdBJymmPlL7pWO6i0C7ggRt+TFCZKxb4GsdqQQWql/JMdJwW6rxNmQxmdfzKD1LO
	0L51AT37BlRR3S8WVKsXeGrTbWTplpyEWbBgbL1
X-Received: by 2002:a17:907:9622:b0:c29:3d25:15fc with SMTP id a640c23a62f3a-c2ac235cdbcmr321475766b.18.1790283429448;
        Thu, 24 Sep 2026 13:57:09 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7357cf3sm14378966b.17.2026.09.24.13.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:57:08 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH] sparc32: emulate UDIV/SDIV on illegal_instruction
Date: Thu, 24 Sep 2026 22:50:24 +0200
Message-ID: <20260924205646.870950-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some SPARC V8 implementations do not complete UDIV/SDIV for every operand
and raise illegal_instruction instead of producing a result. A
SuperSPARC-II (TI TMS390Z50) implements only a 52 by 32 bit integer divide
rather than the architecturally specified 64 by 32, and traps when the
dividend has significant bits beyond bit 51.

This is not a corner case: compiler-generated 64-bit division commonly
uses libgcc's __udivdi3, making this easy to encounter in ordinary
userspace:

	wr %oN, %y ; nop ; nop ; nop ; udiv %oM, %oK, %rd

so an ordinary arithmetic operation kills the process. Finish the
divide in software and step over it instead.

The emulation is generic because it is only reached after the hardware has
already refused the instruction. Linux handled this trap the same way
before, in do_user_muldiv(), removed by commit 1b35a57b1c17 ("sparc32:
Kill off software 32-bit multiply/divide routines."); unlike that code
this saturates the quotient and maintains the condition codes, both of
which the V8 manual specifies.

%g and %o come from pt_regs, but %l and %i may still be live in the
register file, so the windows are flushed to the stack first as the
unaligned access handler does. Without that the emulator reads stale
memory and computes a confidently wrong quotient.

A divide whose spilled window cannot be accessed raises SIGSEGV, not
SIGILL, with si_addr the failing register slot. S64_MIN / -1 saturates
directly rather than as a C division, which would be undefined. Signed
overflow uses V8's method A; method B differs only in V.

Fixes: 1b35a57b1c17 ("sparc32: Kill off software 32-bit multiply/divide routines.")
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
Applies and builds standalone on v7.3-rc1; cross-built with the SPARCstation
20 configuration, no new warnings.

sparc32 does not boot on current mainline without the prerequisite series
below, so this cannot be exercised on real hardware without them:

  sparc32: relocatable kernel / phys_base + Viking fixes
    https://lore.kernel.org/sparclinux/20260816075141.3489194-1-linmag7@gmail.com/T/#t
  sparc32: replace sp_banks with memblock (v3)
    https://lore.kernel.org/sparclinux/20260901214611.60560-1-linmag7@gmail.com/
  sparc32: SuperSPARC SMP synchronization fixes (v2)
    https://lore.kernel.org/sparclinux/20260917075842.784996-1-linmag7@gmail.com/

This and "sparc32: capture SuperSPARC data store error state" both insert
code immediately after do_hw_interrupt() in arch/sparc/kernel/traps_32.c.
They are independent - adjacent insertions, no shared functionality - but
whichever is applied second needs a trivial context rebase.
 arch/sparc/kernel/traps_32.c | 242 +++++++++++++++++++++++++++++++++++
 1 file changed, 242 insertions(+)

diff --git a/arch/sparc/kernel/traps_32.c b/arch/sparc/kernel/traps_32.c
index bb149f6cc34b..ce3408976133 100644
--- a/arch/sparc/kernel/traps_32.c
+++ b/arch/sparc/kernel/traps_32.c
@@ -20,6 +20,7 @@
 #include <linux/kdebug.h>
 #include <linux/export.h>
 #include <linux/pgtable.h>
+#include <linux/uaccess.h>
 
 #include <asm/delay.h>
 #include <asm/ptrace.h>
@@ -105,9 +106,241 @@ void do_hw_interrupt(struct pt_regs *regs, unsigned long type)
 			       (void __user *)regs->pc, type - 0x80);
 }
 
+/* Some SPARC V8 implementations raise illegal_instruction instead of
+ * completing UDIV/SDIV for every operand.  Finish the divide in software and
+ * step over it rather than killing the process for an instruction the
+ * architecture defines.
+ */
+#define DIV_OP3_UDIV	0x0e
+#define DIV_OP3_SDIV	0x0f
+#define DIV_OP3_UDIVCC	0x1e
+#define DIV_OP3_SDIVCC	0x1f
+
+/* %l and %i live in the register file until the windows spill, so force them
+ * out before reading them off the stack.  Without this we read stale memory and
+ * compute a confidently wrong quotient.
+ */
+static inline void div_maybe_flush_windows(unsigned int rs1, unsigned int rs2,
+					   unsigned int rd)
+{
+	if (rs2 >= 16 || rs1 >= 16 || rd >= 16) {
+		__asm__ __volatile__("save %sp, -0x40, %sp\n\t"
+				     "save %sp, -0x40, %sp\n\t"
+				     "save %sp, -0x40, %sp\n\t"
+				     "save %sp, -0x40, %sp\n\t"
+				     "save %sp, -0x40, %sp\n\t"
+				     "save %sp, -0x40, %sp\n\t"
+				     "save %sp, -0x40, %sp\n\t"
+				     "restore; restore; restore; restore;\n\t"
+				     "restore; restore; restore;\n\t");
+	}
+}
+
+/* The window is only reachable if %fp is a properly aligned user address. */
+static struct reg_window32 __user *div_user_window(struct pt_regs *regs)
+{
+	unsigned long fp = regs->u_regs[UREG_FP];
+
+	if (fp & (sizeof(unsigned long) * 2 - 1))
+		return NULL;
+	return (struct reg_window32 __user *) fp;
+}
+
+/* Where a windowed register was spilled, or NULL if unreachable.  %fp may be
+ * mapped while the slot itself lands on the next page, so callers report this
+ * address rather than %fp on failure.
+ */
+static unsigned long __user *div_reg_slot(unsigned int reg,
+					 struct pt_regs *regs)
+{
+	struct reg_window32 __user *win = div_user_window(regs);
+
+	if (!win)
+		return NULL;
+	if (reg < 24)
+		return &win->locals[reg - 16];
+	return &win->ins[reg - 24];
+}
+
+static int div_fetch_reg(unsigned int reg, struct pt_regs *regs,
+			 unsigned long *val, void __user **fault_at)
+{
+	unsigned long __user *slot;
+
+	if (reg < 16) {
+		*val = reg ? regs->u_regs[reg] : 0;
+		return 0;
+	}
+
+	/* %l and %i live in the register window on the user stack. */
+	slot = div_reg_slot(reg, regs);
+	if (!slot) {
+		*fault_at = (void __user *)regs->u_regs[UREG_FP];
+		return -EFAULT;
+	}
+	if (get_user(*val, slot)) {
+		*fault_at = (void __user *)slot;
+		return -EFAULT;
+	}
+	return 0;
+}
+
+static int div_store_reg(unsigned int reg, struct pt_regs *regs,
+			 unsigned long val, void __user **fault_at)
+{
+	unsigned long __user *slot;
+
+	if (reg == 0)			/* %g0 is hardwired to zero */
+		return 0;
+	if (reg < 16) {
+		regs->u_regs[reg] = val;
+		return 0;
+	}
+
+	slot = div_reg_slot(reg, regs);
+	if (!slot) {
+		*fault_at = (void __user *)regs->u_regs[UREG_FP];
+		return -EFAULT;
+	}
+	if (put_user(val, slot)) {
+		*fault_at = (void __user *)slot;
+		return -EFAULT;
+	}
+	return 0;
+}
+
+/* DIV_NOT_MINE: not one of ours, the caller must still raise SIGILL.
+ * DIV_DONE:     emulated (or turned into SIGFPE); swallow the trap.
+ * DIV_FAULT:    it was a divide, but its register window was unreachable.
+ */
+#define DIV_NOT_MINE	0
+#define DIV_DONE	1
+#define DIV_FAULT	(-1)
+
+static int emulate_divide(struct pt_regs *regs, unsigned long pc,
+			  void __user **fault_at)
+{
+	unsigned int insn, op3, rd, rs1, rs2;
+	unsigned long v1, divisor;
+	int is_signed, sets_cc;
+	unsigned long result;
+	u64 dividend;
+	int overflow = 0;
+
+	if (get_user(insn, (unsigned int __user *) pc))
+		return DIV_NOT_MINE;
+
+	if ((insn >> 30) != 2)			/* not format 3 */
+		return DIV_NOT_MINE;
+
+	op3 = (insn >> 19) & 0x3f;
+	switch (op3) {
+	case DIV_OP3_UDIV:
+		is_signed = 0;
+		sets_cc = 0;
+		break;
+	case DIV_OP3_SDIV:
+		is_signed = 1;
+		sets_cc = 0;
+		break;
+	case DIV_OP3_UDIVCC:
+		is_signed = 0;
+		sets_cc = 1;
+		break;
+	case DIV_OP3_SDIVCC:
+		is_signed = 1;
+		sets_cc = 1;
+		break;
+	default:
+		return DIV_NOT_MINE;
+	}
+
+	/* Definitely a divide now, so unreachable operands are a fault. */
+	rd  = (insn >> 25) & 0x1f;
+	rs1 = (insn >> 14) & 0x1f;
+	rs2 = (insn & 0x2000) ? 0 : (insn & 0x1f);
+
+	div_maybe_flush_windows(rs1, rs2, rd);
+
+	if (div_fetch_reg(rs1, regs, &v1, fault_at))
+		return DIV_FAULT;
+
+	if (insn & 0x2000) {			/* i=1, simm13 */
+		divisor = (unsigned long)(long)((int)(insn << 19) >> 19);
+	} else {
+		if (div_fetch_reg(rs2, regs, &divisor, fault_at))
+			return DIV_FAULT;
+	}
+
+	if (divisor == 0) {
+		/* Hardware raises division_by_zero here; keep that contract. */
+		send_sig_fault(SIGFPE, FPE_INTDIV, (void __user *)pc, current);
+		return DIV_DONE;
+	}
+
+	dividend = ((u64)regs->y << 32) | (u32)v1;
+
+	if (!is_signed) {
+		u64 q = dividend / (u32)divisor;
+
+		if (q > 0xffffffffULL) {
+			q = 0xffffffffULL;	/* V8: clamp on overflow */
+			overflow = 1;
+		}
+		result = (unsigned long)q;
+	} else {
+		s64 sdividend = (s64)dividend;
+		s32 sdivisor = (s32)divisor;
+		s64 q;
+
+		/* S64_MIN / -1 wants 2^63, which is not representable, and in
+		 * C the expression is undefined rather than merely out of
+		 * range.  Saturate directly instead of dividing.
+		 */
+		if (sdividend == S64_MIN && sdivisor == -1) {
+			q = (s64)0x7fffffff;
+			overflow = 1;
+		} else {
+			q = sdividend / sdivisor;
+		}
+
+		if (q > (s64)0x7fffffff) {
+			q = 0x7fffffff;
+			overflow = 1;
+		} else if (q < -(s64)0x80000000LL) {
+			q = -(s64)0x80000000LL;
+			overflow = 1;
+		}
+		result = (unsigned long)(s32)q;
+	}
+
+	if (div_store_reg(rd, regs, result, fault_at))
+		return DIV_FAULT;
+
+	if (sets_cc) {
+		unsigned long psr = regs->psr;
+
+		psr &= ~(PSR_N | PSR_Z | PSR_V | PSR_C);
+		if ((s32)result < 0)
+			psr |= PSR_N;
+		if (result == 0)
+			psr |= PSR_Z;
+		if (overflow)
+			psr |= PSR_V;
+		regs->psr = psr;
+	}
+
+	/* Step over the instruction we just performed. */
+	regs->pc = regs->npc;
+	regs->npc = regs->npc + 4;
+	return DIV_DONE;
+}
+
 void do_illegal_instruction(struct pt_regs *regs, unsigned long pc, unsigned long npc,
 			    unsigned long psr)
 {
+	void __user *fault_at = (void __user *)pc;
+
 	if(psr & PSR_PS)
 		die_if_kernel("Kernel illegal instruction", regs);
 #ifdef TRAP_DEBUG
@@ -115,6 +348,15 @@ void do_illegal_instruction(struct pt_regs *regs, unsigned long pc, unsigned lon
 	       regs->pc, *(unsigned long *)regs->pc);
 #endif
 
+	switch (emulate_divide(regs, pc, &fault_at)) {
+	case DIV_DONE:
+		return;
+	case DIV_FAULT:
+		/* The instruction was legal; the stack it spilled to was not. */
+		send_sig_fault(SIGSEGV, SEGV_MAPERR, fault_at, current);
+		return;
+	}
+
 	send_sig_fault(SIGILL, ILL_ILLOPC, (void __user *)pc, current);
 }
 
-- 
2.43.0

