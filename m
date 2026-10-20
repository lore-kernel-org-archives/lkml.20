Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495480;
	b=CyJLP8bf75Z6EK9MBjKA54sXC70Em/rnVD3iqJEmUFK0+2jnFyt1cqswI8FYG4BCrqVH
	 FjApD8+sJ/aZJ2dy+YmwH5SeZZr3yALfKx5Hu83Ku37gimQR2iB5WIcMyMeepGRuUiSLQ
	 Ga2QjJWNL5hYGnKA8TSuVvDQbK4eIhqbAKy+fqK2LURuczQ8eyBEJq+t9r53oaaLskFzp
	 r8iUuCzDga7ldfkEEWLCD+T9Ar0yDdR3sjuL3LYXERAx/OPjTzELuml6VsMmw6FeNF7Bu
	 AON6wRhoHcHujFPReheB/JZwx3AEVR091iKd56xGY1g78ztSmLDUtvz5xyvWa3/6+gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495480;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=eT+WsZRl9ux3PL0kdIeK0imdIBGj+DxxcAnEIUtd4Rg=;
	b=qW5jk9ZCKaGZuui13c4paM5sQtXvyeyzx8uctJ2HjM/0j1iHkoOmCWEj+VJ3rXw8rqmS
	 FUFtVoEEDMpDcwYt2M9QWv7RW8en98HailK9OCibq2CP9x2BDmGFXZ4R6EgRoS+z5zeuD
	 +NH6fl8oIDRf8w/VBESLt2/FttjaiY74VS+8z5MitK0g+Ujtny+97RzPfPjWoXFKQqQ0+
	 j/7H2RqiIpYAHTNLTBUD7nFcGppYIsmsJj9OrEnVlkQcn/E1OPj/zb70//PGn2vAQc7S4
	 1Hz7CJHHszxv5BmpF3zDCWk4q5uzSyIBWX6HHjR+7bRL0H9pr58EjnyJgYFBFCQuMkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nPAsDPhY;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEF2606A330
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAEF2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nPAsDPhY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792495478; x=1824031478;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=T75rwM6ilVurY8P7tKLUjd3GWkVyHHWzwe02Nvcn9AU=;
  b=nPAsDPhY4QRlcHLdsJfvj3KYYvcZ0QmjdzoKDSNda/fFB+QK9Cni7HJ7
   rfABqH06n7FMiUH+oqsuNtoyXo5uqOpxfSV8Ov/ovK4I8UNVBZXklUb3Z
   RROPKGNNkqU00+rH/dYk3e7ube8uwQlsqIzaEc5oleSpBp9hkGW+kiqXF
   /yRmqvx49TmOT/DLg1wJ4IWZzo90plQIIU0z4Q/B1MQE5Ti4n2oxWghja
   yeRMzrEUvmn107o6MN59hz2tt8a/0v/DVopExUT0VyOPONiCfoTvw0Ish
   vSKNfX4blHzU9kzCkNO1WF/o/OIbdqEflI/RMFjpmvYxxgKfJKuu+8yYM
   w==;
X-CSE-ConnectionGUID: AEQN1EW6QF2DozfF8d08+Q==
X-CSE-MsgGUID: 5CQjXeNYQLS1XmAmW2VjwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1079693"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1079693"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 04:24:38 -0700
X-CSE-ConnectionGUID: AeMce1BPTnqMCWTBE+rrzw==
X-CSE-MsgGUID: Zqrh6M+SRLWAIsgk44rYyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3135333"
Received: from sdp-s2600wc.sh.intel.com (HELO [127.0.1.1]) ([10.112.229.16])
  by fmviesa008.fm.intel.com with ESMTP; 20 Oct 2026 04:24:35 -0700
From: Guobin Zhang <guobin.zhang@intel.com>
Date: Tue, 20 Oct 2026 19:24:25 +0800
Subject: [PATCH v2] riscv: signal: protect regs->status RMW from concurrent
 preemption
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
Message-Id: <20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com>
X-B4-Tracking: v=1; b=H4sIAGhP12oC/42OWw6CMBREt2L6bU2LgI1f7sOQpi0XuEYe6S1VQ
 9i7BTfg55lMzszCCDwCsethYR4iEo5Dgux4YK4zQwsc68QsE1kplLjwCC6MXjfTrD20pCmYMJP
 2/Us3+Oa2kI3JTV6ca8WSZPKQ4n3gXv2YZvtIks26NTqkJPzsD6Lcen+PRcklF06WKle2FLW94
 RDgeXJjz6p1Xb8z0Qap3gAAAA==
X-Change-ID: 20260807-vector_fpu_regs_status_rmw_fix-b51fa4a453d8
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Andy Chiu <tchiu@tenstorrent.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guobin Zhang <guobin.zhang@intel.com>
X-Mailer: b4 0.15.2

__fstate_clean() performs a non-atomic read-modify-write (RMW) on
task_pt_regs(current)->status to clear the FS bits. This RMW is
unprotected - it runs with preemption enabled and IRQs on during
signal delivery (setup_rt_frame -> fstate_save) and sigreturn
(restore_fp_state -> fstate_restore).

If a reschedule IPI or timer interrupt triggers preemption between
the load and store of this RMW, __switch_to_vector() calls
riscv_v_vstate_set_restore() which modifies the VS bits of the
same regs->status. When the preempted task resumes, it stores back
the stale value captured before preemption, overwriting the VS
update and restoring VS=DIRTY while TIF_RISCV_V_DEFER_RESTORE
remains set - a combination that should never occur and leads to
vector state corruption.

The race window:

  __fstate_clean (signal path)      set_restore (schedule path)
  -----------------------------     -----------------------------
  ld  a0, regs->status  // VS=DIRTY, FS=DIRTY
                                     <- preempted (reschedule IPI)
                                     regs->status VS = INITIAL
                                     set TIF_RISCV_V_DEFER_RESTORE
                                     <- resumed
  andi a0, ~FS
  ori  a0, FS_CLEAN     // stale a0 still has VS=DIRTY
  sd   a0, regs->status // overwrites VS=INITIAL with VS=DIRTY
  -> result: VS=DIRTY + DEFER -> ANOMALY

Fix by adding preempt_disable/enable in fstate_save() and
fstate_restore(), which covers the RMW in __fstate_clean(), and
around the RMW in fstate_off(). Add fstate_{save,restore}_preempt_off()
for code that already runs with preemption disabled (the scheduler and
kernel_mode_fpu).

riscv_v_vstate_set_restore() has the identical hazard: it is called
from __restore_v_state() (sigreturn path) with preemption enabled, and
it can race the same way against the scheduler's own call to
riscv_v_vstate_set_restore() for the same task in __switch_to_vector().
Wrap that call site with preempt_disable/enable as well.

Add WARN_ON_ONCE(preemptible()) to riscv_v_vstate_restore()
to catch any future unprotected callers at development time.

Suggested-by: Andy Chiu <tchiu@tenstorrent.com>
Signed-off-by: Guobin Zhang <guobin.zhang@intel.com>
---
regs->status is shared between the FPU (SR_FS) and vector (SR_VS) state
machines, and is updated with plain read-modify-write. When such an RMW
runs preemptible on the current task, the scheduler may update the other
field of the same word in between (e.g. riscv_v_vstate_set_restore() in
__switch_to_vector() on switch-in), and the stale store then clobbers
it, leaving VS=DIRTY with TIF_RISCV_V_DEFER_RESTORE set.

v2 follows Andy's suggestion: preemption is disabled at the
fstate_save()/fstate_restore() level, which is fine because the FPU
register save/restore itself is reentrant-safe, and new
fstate_{save,restore}_preempt_off() variants are used by callers that
already run with preemption disabled (__switch_to_fpu() and
kernel_fpu_{begin,end}()). fstate_off() and the
riscv_v_vstate_set_restore() call in __restore_v_state() are wrapped
directly.

local_irq_disable() is not needed: no IRQ handler touches regs->status.

Reproduced on Spacemit K1 hardware; not reproducible under QEMU/TCG.
---
Changes in v2:
- Disable preemption at the fstate_save()/fstate_restore() level and add
  fstate_{save,restore}_preempt_off() for the scheduler and kernel_mode_fpu
  (Andy Chiu)
- Drop preempt_disable() from __fstate_clean()
- Link to v1: https://patch.msgid.link/20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com
---
 arch/riscv/include/asm/switch_to.h  | 30 ++++++++++++++++++++++++------
 arch/riscv/include/asm/vector.h     |  2 ++
 arch/riscv/kernel/kernel_mode_fpu.c |  4 ++--
 arch/riscv/kernel/signal.c          |  2 ++
 4 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0e71eb82f920..709831688ef3 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -27,11 +27,13 @@ static inline void __fstate_clean(struct pt_regs *regs)
 static inline void fstate_off(struct task_struct *task,
 			      struct pt_regs *regs)
 {
+	preempt_disable();
 	regs->status = (regs->status & ~SR_FS) | SR_FS_OFF;
+	preempt_enable();
 }
 
-static inline void fstate_save(struct task_struct *task,
-			       struct pt_regs *regs)
+static inline void fstate_save_preempt_off(struct task_struct *task,
+					   struct pt_regs *regs)
 {
 	if ((regs->status & SR_FS) == SR_FS_DIRTY) {
 		__fstate_save(task);
@@ -39,8 +41,8 @@ static inline void fstate_save(struct task_struct *task,
 	}
 }
 
-static inline void fstate_restore(struct task_struct *task,
-				  struct pt_regs *regs)
+static inline void fstate_restore_preempt_off(struct task_struct *task,
+					      struct pt_regs *regs)
 {
 	if ((regs->status & SR_FS) != SR_FS_OFF) {
 		__fstate_restore(task);
@@ -48,14 +50,30 @@ static inline void fstate_restore(struct task_struct *task,
 	}
 }
 
+static inline void fstate_save(struct task_struct *task,
+			       struct pt_regs *regs)
+{
+	preempt_disable();
+	fstate_save_preempt_off(task, regs);
+	preempt_enable();
+}
+
+static inline void fstate_restore(struct task_struct *task,
+				  struct pt_regs *regs)
+{
+	preempt_disable();
+	fstate_restore_preempt_off(task, regs);
+	preempt_enable();
+}
+
 static inline void __switch_to_fpu(struct task_struct *prev,
 				   struct task_struct *next)
 {
 	struct pt_regs *regs;
 
 	regs = task_pt_regs(prev);
-	fstate_save(prev, regs);
-	fstate_restore(next, task_pt_regs(next));
+	fstate_save_preempt_off(prev, regs);
+	fstate_restore_preempt_off(next, task_pt_regs(next));
 }
 
 static __always_inline bool has_fpu(void)
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 00cb9c0982b1..da1559bcee36 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -315,6 +315,8 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
+	WARN_ON_ONCE(preemptible());
+
 	if (riscv_v_vstate_query(regs)) {
 		__riscv_v_vstate_restore(vstate, vstate->datap);
 		__riscv_v_vstate_clean(regs);
diff --git a/arch/riscv/kernel/kernel_mode_fpu.c b/arch/riscv/kernel/kernel_mode_fpu.c
index 0ac8348876c4..03d847fbfcf6 100644
--- a/arch/riscv/kernel/kernel_mode_fpu.c
+++ b/arch/riscv/kernel/kernel_mode_fpu.c
@@ -14,7 +14,7 @@
 void kernel_fpu_begin(void)
 {
 	preempt_disable();
-	fstate_save(current, task_pt_regs(current));
+	fstate_save_preempt_off(current, task_pt_regs(current));
 	csr_set(CSR_SSTATUS, SR_FS);
 }
 EXPORT_SYMBOL_GPL(kernel_fpu_begin);
@@ -22,7 +22,7 @@ EXPORT_SYMBOL_GPL(kernel_fpu_begin);
 void kernel_fpu_end(void)
 {
 	csr_clear(CSR_SSTATUS, SR_FS);
-	fstate_restore(current, task_pt_regs(current));
+	fstate_restore_preempt_off(current, task_pt_regs(current));
 	preempt_enable();
 }
 EXPORT_SYMBOL_GPL(kernel_fpu_end);
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 59784dc117e4..6f6f3315bc09 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -123,7 +123,9 @@ static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
 	 * to avoid getting the vstate incorrectly clobbered by the
 	 *  discarded vector state.
 	 */
+	preempt_disable();
 	riscv_v_vstate_set_restore(current, regs);
+	preempt_enable();
 
 	/* Copy everything of __sc_riscv_v_state except datap. */
 	err = __copy_from_user(&current->thread.vstate, &state->v_state,

---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260807-vector_fpu_regs_status_rmw_fix-b51fa4a453d8

Best regards,
--  
Guobin Zhang <guobin.zhang@intel.com>

