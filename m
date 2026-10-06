Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E104F36F908
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791324952; cv=none; b=ZD0NFtdtuDurQN6KfHrWHBXKRfv0vAM25SjCSjbdF/QtjKrGo7zxUGTgptxg44+wSwDCdWqkAml2hS9KGqmA2rE1y20e1lcauHV1gfzyRZMlP6P1i52W+ffzeETnbV757LI1oKPzEV9vFzYkxGugTtnTJE/uWIODVX6owdwaNwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791324952; c=relaxed/simple;
	bh=xDgaYx1EFS+199xB8Wpw7zO7kBJdMPgykC466D5JTzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=szxFXdueUNXKHi4WV12QUK8HLDV9e0Je3Q0Cip2Cb+6BvAMlqfOG50Mfo2UVe5EUgFYD6FiGYgRieI0qNFHklMdrlymZk41fEpWKjKBi199vaC7kdjhjNZe7Rac6LMzQ8BH10DRCkEEZZ4KC4zYegMbySpiwfEp8SfDDn35LP8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=CKYlDEkN; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="CKYlDEkN"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6df7f544919so785042eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791324946; x=1791929746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dhS/FnZjdJag3+q0E1Ont8ZosVleeXOvI2+Sfd5L34Y=;
        b=CKYlDEkNnzliuXdycBoUfCwd7+ht1pWB942cCG/h4iTFtidKSR7nBdxWMWIDpzwIuR
         aSUQS2OoCn/LydvjZXD54w//i8KDTgUjYbbNvCtqJLi1xn85NU7ZcSl4nSZplbuSrDuj
         MU8tpABVd87OmLjhg2SqqgcrEEUFIXpJNeXAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791324946; x=1791929746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhS/FnZjdJag3+q0E1Ont8ZosVleeXOvI2+Sfd5L34Y=;
        b=00dj8ZkltEGCpT7Shs78dMPDOq/KpALzU9P7m6oLhpuwONFP450dRBH6Ttcz4BNdOX
         c7HRcWlfwwNnhTUtYw+72f4t2szxf5N3CJS1OoX/3vG1Mi9vVSdwZBnDyTudtPQdiU3P
         oac59evycP7IrKCoV++XOPYwCY/CRonYOC89PhXL4Hgu+FTJDpbrWJdsQRK7j0myIFoj
         TihL89SR6R6VOxpVY0D8Nk8VA+5dh5Uotva8G0T7BQkKhNdHM5ilOnAMZ9+AToGbbwhZ
         yozRUuQ9X0uo08Dtnzlf6BktJivJpBx0kWlAtYtkOVYIriUc5OUYGJQjfmzVKa35GwFS
         C1sg==
X-Gm-Message-State: AFuF++my5/6/WjC+hauEaQZalPPT3DzvWHe5GByusnLqV95YrXSzDilZ
	NOVneByIiiWBHnXcav64NlMIqthIlU9WwnjuII6Ec181IbXOIf9yCeBr6wkbyrP0efFVfhDlatF
	i0TXwpyU=
X-Gm-Gg: AYBFou0Z/ag8vP8hiMVTIp24wG25H9zJDp7VMBN92+kSO/u+fyXe7cKNoT2sV+kaCo9
	0tnPZZB+tgOk99is1cel/vyrWS8o314UKTMxFmHQ1wjkEfDs6MWvV7Ha2D3zdNdHN9d1vUKK71g
	ujLbJwBVWeDeAUzQV3UHg8FPIdwY9HCWbl8tMxP1W+c4DNJH1k0+G6TeR2pDq+4evUF1VB5nCxK
	woe1PHCqoSnJgDPBsVm97adagOQFbZhHIp//spExbWz64zZy1qgU8ztLrUmPecboomrkOvlweJ2
	SmCwGpqngMkUmTky01mdBWqTYQxUBH9yKqYorS23rsGmf3R9znszdtOOsqzSQ+s31ucnDaUcvj9
	h1Z2kFhGp5vis5eTBYU965Wci2J5+lWr4HBhv73zMzB8tAzmqE1lYlWThWwh7l0eduCCJ95ogfs
	XUD9MWI/YVzfK8YARStT/6rZKHxg4oPUTV3sP7V/KgOYx8Zkk2FWjsADv2vxNjbbfm2J+OQO189
	cQih3DMr9+VOOuzJjlrNtwaGcuUrnHsK0T3Xo5nz6bQ/J20nefQwP6VmG54/HENVtOf0RqO/e0=
X-Received: by 2002:a05:6820:16a2:b0:6d7:58ee:fd72 with SMTP id 006d021491bc7-6e7a5c989f7mr660751eaf.14.1791324945800;
        Tue, 06 Oct 2026 15:15:45 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm689793eaf.8.2026.10.06.15.15.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:15:45 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-kernel@vger.kernel.org
Cc: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH] x86/fpu: Avoid kernel-address leaks in the FXSAVE workaround
Date: Tue,  6 Oct 2026 15:15:41 -0700
Message-ID: <20261006221541.35963-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On AMD CPUs without XSaveErPtr, restoring x87 state without a pending
exception can leave FDP/FIP/FOP unchanged.  The existing workaround
replaces the previous context's pointers by executing FILD on a kernel
fpstate.  This exposes the kernel instruction and operand addresses
instead.  On TCG qemu64, an unprivileged task can recover the kernel
text slide with FNSTENV at ELF entry, even though FXSAVE64 reports zero
error pointers.

Use FNINIT to clear the pointers without recording new addresses.  It
also clears pending exceptions without waiting for them, and the
following restore reloads the intended x87 state.

Apply the workaround in the FXRSTOR and FP-capable XRSTOR helpers,
including the safe and user-sigframe variants.  This also covers the
init-state and direct sigreturn paths, which must not retain pointers
from kernel FPU use or another task.  Retain preparation for the
no-FXSR FRSTOR fallback too: it was covered by the old common
workaround, and TCG qemu64 can also leave the legacy pointers unchanged
after that restore.  Only initialize x87 when the restore mask includes
FP, so partial and supervisor-only restores keep the unrequested state
intact.

Fixes: 18bd057b1408 ("[PATCH] i386/x86-64: Fix x87 information leak between processes")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 arch/x86/kernel/fpu/core.c     | 14 --------------
 arch/x86/kernel/fpu/internal.h | 19 +++++++++++++++++++
 arch/x86/kernel/fpu/legacy.h   | 14 ++++++++++++++
 arch/x86/kernel/fpu/xstate.h   |  5 +++++
 4 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index d1aeecd57f5e..9113f55b80d8 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -161,20 +161,6 @@ void save_fpregs_to_fpstate(struct fpu *fpu)
 
 void restore_fpregs_from_fpstate(struct fpstate *fpstate, u64 mask)
 {
-	/*
-	 * AMD K7/K8 and later CPUs up to Zen don't save/restore
-	 * FDP/FIP/FOP unless an exception is pending. Clear the x87 state
-	 * here by setting it to fixed values.  "m" is a random variable
-	 * that should be in L1.
-	 */
-	if (unlikely(static_cpu_has_bug(X86_BUG_FXSAVE_LEAK))) {
-		asm volatile(
-			"fnclex\n\t"
-			"emms\n\t"
-			"fildl %[addr]"	/* set F?P to defined value */
-			: : [addr] "m" (*fpstate));
-	}
-
 	if (use_xsave()) {
 		/*
 		 * Dynamically enabled features are enabled in XCR0, but
diff --git a/arch/x86/kernel/fpu/internal.h b/arch/x86/kernel/fpu/internal.h
index 975de070c9c9..3b4d178edc31 100644
--- a/arch/x86/kernel/fpu/internal.h
+++ b/arch/x86/kernel/fpu/internal.h
@@ -2,6 +2,9 @@
 #ifndef __X86_KERNEL_FPU_INTERNAL_H
 #define __X86_KERNEL_FPU_INTERNAL_H
 
+#include <asm/cpufeature.h>
+#include <asm/fpu/types.h>
+
 extern struct fpstate init_fpstate;
 
 /* CPU feature check wrappers */
@@ -15,6 +18,22 @@ static __always_inline __pure bool use_fxsr(void)
 	return cpu_feature_enabled(X86_FEATURE_FXSR);
 }
 
+/*
+ * AMD CPUs without XSaveErPtr may leave FDP/FIP/FOP unchanged on restore
+ * when no x87 exception is pending.  Using an x87 load to overwrite them
+ * leaks the kernel instruction and operand addresses through FNSTENV.
+ *
+ * FNINIT clears the pointers without recording any new ones.  Only do this
+ * when the x87 state is about to be replaced; a partial XRSTOR must leave
+ * unrequested components alone.
+ */
+static inline void fpregs_restore_prepare(u64 mask)
+{
+	if (unlikely(static_cpu_has_bug(X86_BUG_FXSAVE_LEAK)) &&
+	    (mask & XFEATURE_MASK_FP))
+		asm volatile("fninit");
+}
+
 #ifdef CONFIG_X86_DEBUG_FPU
 # define WARN_ON_FPU(x) WARN_ON_ONCE(x)
 #else
diff --git a/arch/x86/kernel/fpu/legacy.h b/arch/x86/kernel/fpu/legacy.h
index 098f367bb8a7..fe825c9a00c7 100644
--- a/arch/x86/kernel/fpu/legacy.h
+++ b/arch/x86/kernel/fpu/legacy.h
@@ -4,6 +4,8 @@
 
 #include <asm/fpu/types.h>
 
+#include "internal.h"
+
 extern unsigned int mxcsr_feature_mask;
 
 static inline void ldmxcsr(u32 mxcsr)
@@ -63,6 +65,8 @@ static inline int fxsave_to_user_sigframe(struct fxregs_state __user *fx)
 
 static inline void fxrstor(struct fxregs_state *fx)
 {
+	fpregs_restore_prepare(XFEATURE_MASK_FP);
+
 	if (IS_ENABLED(CONFIG_X86_32))
 		kernel_insn(fxrstor %[fx], "=m" (*fx), [fx] "m" (*fx));
 	else
@@ -71,6 +75,8 @@ static inline void fxrstor(struct fxregs_state *fx)
 
 static inline int fxrstor_safe(struct fxregs_state *fx)
 {
+	fpregs_restore_prepare(XFEATURE_MASK_FP);
+
 	if (IS_ENABLED(CONFIG_X86_32))
 		return kernel_insn_err(fxrstor %[fx], "=m" (*fx), [fx] "m" (*fx));
 	else
@@ -79,6 +85,8 @@ static inline int fxrstor_safe(struct fxregs_state *fx)
 
 static inline int fxrstor_from_user_sigframe(struct fxregs_state __user *fx)
 {
+	fpregs_restore_prepare(XFEATURE_MASK_FP);
+
 	if (IS_ENABLED(CONFIG_X86_32))
 		return user_insn(fxrstor %[fx], "=m" (*fx), [fx] "m" (*fx));
 	else
@@ -87,16 +95,22 @@ static inline int fxrstor_from_user_sigframe(struct fxregs_state __user *fx)
 
 static inline void frstor(struct fregs_state *fx)
 {
+	fpregs_restore_prepare(XFEATURE_MASK_FP);
+
 	kernel_insn(frstor %[fx], "=m" (*fx), [fx] "m" (*fx));
 }
 
 static inline int frstor_safe(struct fregs_state *fx)
 {
+	fpregs_restore_prepare(XFEATURE_MASK_FP);
+
 	return kernel_insn_err(frstor %[fx], "=m" (*fx), [fx] "m" (*fx));
 }
 
 static inline int frstor_from_user_sigframe(struct fregs_state __user *fx)
 {
+	fpregs_restore_prepare(XFEATURE_MASK_FP);
+
 	return user_insn(frstor %[fx], "=m" (*fx), [fx] "m" (*fx));
 }
 
diff --git a/arch/x86/kernel/fpu/xstate.h b/arch/x86/kernel/fpu/xstate.h
index 38a2862f09d3..ac378d839534 100644
--- a/arch/x86/kernel/fpu/xstate.h
+++ b/arch/x86/kernel/fpu/xstate.h
@@ -7,6 +7,8 @@
 #include <asm/fpu/xcr.h>
 #include <asm/msr.h>
 
+#include "internal.h"
+
 #ifdef CONFIG_X86_64
 DECLARE_PER_CPU(u64, xfd_state);
 #endif
@@ -240,6 +242,7 @@ static inline void os_xrstor(struct fpstate *fpstate, u64 mask)
 	u32 hmask = mask >> 32;
 
 	xfd_validate_state(fpstate, mask, true);
+	fpregs_restore_prepare(mask);
 	XSTATE_XRESTORE(&fpstate->regs.xsave, lmask, hmask);
 }
 
@@ -334,6 +337,7 @@ static inline int xrstor_from_user_sigframe(struct xregs_state __user *buf, u64
 	int err;
 
 	xfd_validate_state(x86_task_fpu(current)->fpstate, mask, true);
+	fpregs_restore_prepare(mask);
 
 	stac();
 	XSTATE_OP(XRSTOR, xstate, lmask, hmask, err);
@@ -355,6 +359,7 @@ static inline int os_xrstor_safe(struct fpstate *fpstate, u64 mask)
 
 	/* Ensure that XFD is up to date */
 	xfd_update_state(fpstate);
+	fpregs_restore_prepare(mask);
 
 	if (cpu_feature_enabled(X86_FEATURE_XSAVES))
 		XSTATE_OP(XRSTORS, xstate, lmask, hmask, err);
-- 
2.53.0

