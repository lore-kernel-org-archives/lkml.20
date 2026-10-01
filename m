Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCB837A831
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863052; cv=none; b=M4uGuR5p4JieJgbfH+l1WKx6s6KwDYwFKROdlMxLy7CYQZchNydt/jCTzVxF+LSPtwdf29kTzq6sbCBu6wp3aPZw1sAXiPdqmU6yhjY2j0YiHqqEzCy5F5C1gpCzqyDluBZ2WozPWIT9PNVVkjbZanf9bxOiahihd31sZOXx3a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863052; c=relaxed/simple;
	bh=HN5XavKK1xCW43JBlhHw4vxvNHH446KT/Jla66/fgrE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LOBNB1D6RddZ3UyOqk6ub/fpV6BMZdAN622hu0v49/cGra1oiPzySGOjz71N3WWdDfaJMcYmteDQPTgGF8Q6MHwGUNXrTOYohhkYz7shmbJCi11cA7mJJEe0t7qwJHjCWEaQuj1BxQ82mgLUQbppvZyskz3/I5uc5wGC2s7j/nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oqN067Rv; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqN067Rv"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93ca50c8ba6so246026485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790863045; x=1791467845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DYhRgdXSzDJVurFDLv4PHup3HFD+RVOANjvlBQkYgM=;
        b=oqN067Rvy0IQRkHvTd751o/GJQ1IGGMAb3Umwe2jntRwXoxGlyGOwSDrdJNFfATjag
         zCGP60rcCH4xRhZUCo6/AWArdJ2m8MukLNyspqE0+t4xqxv4RbRpNhvRsuzCNfeTeeJO
         tEHtiXnX50v+sB5t5TWMOgAjHKHnLCJuUsbeFxuEAwzLoUrBypX7SbOnSb5FDqzHtJQx
         xJG5CBOUhb4N4rLIfZ22yoVJ1TxrEieXoEySemNv8uONvO/QAEUyd4+tza7MsuD/+Zka
         8w6BfOm6WQVDPy7SliUAWSKWUkQfJqOuxz2ViNvTBmx7wZiojFsRcMTEeUalGv3uDUDo
         3SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863045; x=1791467845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DYhRgdXSzDJVurFDLv4PHup3HFD+RVOANjvlBQkYgM=;
        b=1X7OckMLl4m/KZurjElSlx1b6O4K8oWkvwK6KIzNt9rFJwgXq5SGxavM3HRoXzaCFH
         i2rGNDGi2ozuIfbGB6/RVqpnrMVAWzlj3nnOz+Agdx3QDE7ZIi9nxMI5kL/jU9miGhEB
         Zyxpjdhue3oPjL8shsbB2xGYAQvsQfLRcnrSdWqVrGD4dAl/kSoOgt9t8mFXvKvIlYdO
         9wmvl4QNSCbFO4cke48OfU0UbNYX/PGAUqlVS2bSkzt0+JDpmbIMcXh211QtipQWNJA3
         K2vdVpx4T5p6/R1ziyjbrvKMhwCbze+h137wqgmT5qBEDjbYyA59XIl9U9b48aNZSrz7
         qXrw==
X-Forwarded-Encrypted: i=1; AKwUvBwPPLRVD7PL3v7M4HfaQBgywhwquHgIe1uXyDRRO2tpxfAQZsILDqvHACies6N1ew/eFtSkiwUXaBhqVOk=@vger.kernel.org
X-Gm-Message-State: AFuF++nRj/xwHPqwxWrm49eaHRUE6j3mDIWPtfW6XKHqbo14dmlOOHWG
	aICbiNvtc+z2sp4DxZB8tV9wiUsgAICpAmQKoABThT2HiX/66z9vzUtb
X-Gm-Gg: AYBFou1+igUeRFxAuSGQ7G8IOfoj9Ge6JAaKk2eQHB70cU789LyzUa900K6gCvvje7m
	o4GLrKEuxTumN4UhGG4Iwe4Gp3tpkdWGPn9m0muPg1rZDCvAJ3iWlgJEOuDGLfKf84zFslJ3zF5
	Tu5QtuS0BPCrziWce1CIIAY8vcEacCQvPLeYsB0JFNxjmoEFscu4YHG6SLcC3kLJz+dwHgYBw5P
	jo3JY1oVRvVTUps0SUUt6zTplu/2z7I4abX8+re4oa9fSH8ARw6svIws6zWYhJeiricLv9yGNZi
	aas4bO83cVgwpsv1O+GQnU9bAlpFyxvzoCwPEOKETsrqk8w3G++xl6IGT9bXvGWE4NqY7qwp+fu
	l6s03wn0eDqHyelYrR7Uv9mEpYV7Jo4khDNM+XYyWU/SQiIrC6Dpwd2kpcOHnRUH7d7/bY/dMSb
	Z/uSwihdUoYcc4kz3SBtO7spGfToYnCmEGgCUHZzPJD7QeYWI8YEhA0L+nqV4ACGOQP18mRROzP
	zjKbiOkP0feFBL+ZMdWB9XMYLrP78/OBeWnaSMYLlJt79qoqu2lccmGlvX+vMZwIYjRxoxa/KTC
	rTfwGeF9
X-Received: by 2002:a05:620a:2550:b0:93c:3d7e:6e90 with SMTP id af79cd13be357-93ca96e9ddemr839989885a.32.1790863043915;
        Thu, 01 Oct 2026 06:57:23 -0700 (PDT)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89a52d2sm26940176d6.14.2026.10.01.06.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:57:23 -0700 (PDT)
From: Ziyi Guo <guoziyi114@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samitolvanen@google.com
Cc: wangruikang@iscas.ac.cn,
	debug@rivosinc.com,
	conor.dooley@microchip.com,
	namcao@linutronix.de,
	zong.li@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ziyi Guo <guoziyi114@gmail.com>
Subject: [PATCH] riscv: entry: gate shadow call stack reload on sstatus.SPP, not tp
Date: Thu,  1 Oct 2026 13:57:11 +0000
Message-Id: <20261001135711.934152-1-guoziyi114@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Under CONFIG_SHADOW_CALL_STACK, handle_exception() reloads the kernel
shadow call stack pointer (gp) only when the trap came from userspace.
It made that decision with scs_load_current_if_task_changed, which
compares the trap-time tp (read back from sscratch into s5) against the
current tp:

	beq	\prev, tp, _skip_scs
	scs_load_current
_skip_scs:

tp is a user-writable register.  A user task that sets tp to the
linear-map address of its own task_struct (&current) before trapping
makes the comparison succeed (can achieve by brute force with KASLR 
enable under our test), so the kernel skips scs_load_current and
keeps running with the gp that userspace left in place.  Under
CONFIG_SHADOW_CALL_STACK gp is the shadow call stack pointer and
load_global_pointer is a no-op, so the compiler-emitted
"sd ra, -8(gp)" / "ld ra, -8(gp)" in every non-leaf function then write
to, and return through, an attacker-controlled address -- an
unprivileged kernel arbitrary-write and control-flow-hijack primitive.
The poisoned gp is saved to task_struct.scs_sp on return, so the reload
is skipped on every subsequent entry as well.

Decide "came from userspace" from the hardware sstatus.SPP bit (already
in s1 at this point) instead of from tp, mirroring the check that
ret_from_exception already uses a few instructions later.  SPP is
written by hardware on trap entry and cannot be forged from U-mode.
Legitimate behaviour is unchanged: user entries (SPP=0) reload the task
shadow call stack, nested kernel entries (SPP=1) skip it.

Fixes: d1584d791a29 ("riscv: Implement Shadow Call Stack")
Signed-off-by: Ziyi Guo <guoziyi114@gmail.com>
---
 arch/riscv/include/asm/scs.h | 17 +++++++++++++----
 arch/riscv/kernel/entry.S    |  2 +-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
index 023a412fe38d..49e40eef4ed7 100644
--- a/arch/riscv/include/asm/scs.h
+++ b/arch/riscv/include/asm/scs.h
@@ -4,6 +4,7 @@
 
 #ifdef __ASSEMBLER__
 #include <asm/asm-offsets.h>
+#include <asm/csr.h>
 
 #ifdef CONFIG_SHADOW_CALL_STACK
 
@@ -22,9 +23,17 @@
 	REG_L	gp, TASK_TI_SCS_SP(tp)
 .endm
 
-/* Load task_scs_sp(current) to gp, but only if tp has changed. */
-.macro scs_load_current_if_task_changed prev
-	beq	\prev, tp, _skip_scs
+/*
+ * Load task_scs_sp(current) to gp, but only when the trap came from U-mode.
+ * The source privilege level is taken from the saved sstatus.SPP bit (written
+ * by hardware on trap entry), not by comparing tp.  tp is a user-writable
+ * register, so gating the shadow call stack reload on it let a user task that
+ * set tp == &current skip the reload and run the kernel with an attacker
+ * controlled gp (the shadow call stack pointer).
+ */
+.macro scs_load_current_if_from_user status, tmp
+	andi	\tmp, \status, SR_SPP
+	bnez	\tmp, _skip_scs
 	scs_load_current
 _skip_scs:
 .endm
@@ -42,7 +51,7 @@
 .endm
 .macro scs_load_current
 .endm
-.macro scs_load_current_if_task_changed prev
+.macro scs_load_current_if_from_user status, tmp
 .endm
 .macro scs_save_current
 .endm
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index d799c4e56f80..61b7a7716697 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -208,7 +208,7 @@ SYM_CODE_START(handle_exception)
 	load_global_pointer
 
 	/* Load the kernel shadow call stack pointer if coming from userspace */
-	scs_load_current_if_task_changed s5
+	scs_load_current_if_from_user s1, s5
 
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 	move a0, sp
-- 
2.34.1

