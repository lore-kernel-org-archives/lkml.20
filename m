Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479063D45FE;
	Tue,  8 Sep 2026 20:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900716; cv=none; b=X9T7z5UaX92qDyluQB6Y9hiH/iYXnA0OP0AN0ymjP9ABtqbfQj3cmhEWWpZjjdqGa9bwEpk3oqMZegX3pMnf9vIEoHhSM+Vhs7eOFQffI6VkhDYefW1Sg50yEVqbynMWXaCz62qX38Qcs11RJ1la+uuR0BQZQm7daRXqXiR1Tfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900716; c=relaxed/simple;
	bh=j9VUgU+og6f2Lo8DYhf0Xsl/06JLTk3aUeTtGITpi38=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=hl5eSYl+CDPYZg3ka68VfvZ2aywvtwDmaNrQiLa8qiTg1GYmNBzGMBnx38awgbEl+bCegufw5AsRCQUN3+GrY9gFZu5r5z5PnP/l+BwueOhezEJJRO0X+YA4gtlvCh+I93tW8OF6WCUbu8B074GzUMBX6uQ/hB38dO1eZpRAdJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=beSQW5bX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o5eqenqD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="beSQW5bX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o5eqenqD"
Date: Tue, 08 Sep 2026 20:51:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900712;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MqRUWVxD02DAEmMota9s4tHA0uuKlUmrajSbjQbQ8Sc=;
	b=beSQW5bXdhzPKMsyOJJXRhsOG0pxjm58nekQLyFlVXPZAyWgGAr9T1VvQM49coHRh3lAxj
	nTqgPo/EhoDfPPsozG/6dZ/3KuRwfsRWmHXExcVYvL8GVwmNEjPz+/4fnZF6+1tyVkkOGa
	WM/5Ra7B8Tiy9L4jJIELSnAG9Z0pKBi86t8WdGHhc3cHX82SUEEl8oXqgsVzneVcoPe3Qh
	8ZUHzaVzSCGmPFmVcoubHXV9zTi6Z0cNKpzpSdW/U6nX7Lwhbfkmr0phLGY6LTXsV3Kxcg
	fGnFXUCU33Qpfsuh7jJeYEjOfFrIQUei6gLKDHOBAR6UBuKCIO4ZOHN5gKxqMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900712;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MqRUWVxD02DAEmMota9s4tHA0uuKlUmrajSbjQbQ8Sc=;
	b=o5eqenqDXjgXvwmBwBoxWw0QGWFL2Zss4J8z2OJn5ceKgl+fqhBo29wPqKSdWZft9Neyvu
	2P2CZojRltl8ZuBw==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] x86/fpu: Add update_fpu_state_and_flag() helper
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-8-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-8-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890071086.623050.13758352261538120696.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     450d73dc5f9188ade87fe2d2d967cf18e63b280f
Gitweb:        https://git.kernel.org/tip/450d73dc5f9188ade87fe2d2d967cf18e63=
b280f
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:15 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:41 +02:00

x86/fpu: Add update_fpu_state_and_flag() helper

Add update_fpu_state_and_flag() as suggested by Peter and Dave.
The helper saves user FPU state and then sets TIF_NEED_FPU_LOAD,
ensuring the task FPU state is saved whenever the flag is set.

Subsequent patches will use this guarantee in NMI context by checking
TIF_NEED_FPU_LOAD before retrieving user FPU state from the saved
task FPU state.

Also add barrier() in the host/guest FPU state switch path and move
clearing of fpu->__task_fpstate after switching back to host state. So
fpu->__task_fpstate is always observed as host FPU state when non-NULL.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lore.kernel.org/all/20251204154721.GB2619703@noisy.programming.=
kicks-ass.net/
Link: https://patch.msgid.link/20260824082731.1013973-8-dapeng1.mi@linux.inte=
l.com
---
 arch/x86/include/asm/fpu/sched.h |  5 +++--
 arch/x86/kernel/fpu/core.c       | 33 +++++++++++++++++++++++++------
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/fpu/sched.h b/arch/x86/include/asm/fpu/sche=
d.h
index 89004f4..dcb2fa5 100644
--- a/arch/x86/include/asm/fpu/sched.h
+++ b/arch/x86/include/asm/fpu/sched.h
@@ -10,6 +10,8 @@
 #include <asm/trace/fpu.h>
=20
 extern void save_fpregs_to_fpstate(struct fpu *fpu);
+extern void update_fpu_state_and_flag(struct fpu *fpu,
+				      struct task_struct *task);
 extern void fpu__drop(struct task_struct *tsk);
 extern int  fpu_clone(struct task_struct *dst, u64 clone_flags, bool minimal,
 		      unsigned long shstk_addr);
@@ -36,8 +38,7 @@ static inline void switch_fpu(struct task_struct *old, int =
cpu)
 	    !(old->flags & (PF_KTHREAD | PF_USER_WORKER))) {
 		struct fpu *old_fpu =3D x86_task_fpu(old);
=20
-		set_tsk_thread_flag(old, TIF_NEED_FPU_LOAD);
-		save_fpregs_to_fpstate(old_fpu);
+		update_fpu_state_and_flag(old_fpu, old);
 		/*
 		 * The save operation preserved register state, so the
 		 * fpu_fpregs_owner_ctx is still @old_fpu. Store the
diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index d1aeecd..047244e 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -213,6 +213,19 @@ void restore_fpregs_from_fpstate(struct fpstate *fpstate=
, u64 mask)
 	}
 }
=20
+/*
+ * Save the FPU register state in fpu->fpstate->regs and set
+ * TIF_NEED_FPU_LOAD subsequently.
+ *
+ * Must be called with fpregs_lock() held, ensuring flag
+ * TIF_NEED_FPU_LOAD is set last.
+ */
+void update_fpu_state_and_flag(struct fpu *fpu, struct task_struct *task)
+{
+	save_fpregs_to_fpstate(fpu);
+	set_tsk_thread_flag(task, TIF_NEED_FPU_LOAD);
+}
+
 void fpu_reset_from_exception_fixup(void)
 {
 	restore_fpregs_from_fpstate(&init_fpstate, XFEATURE_MASK_FPSTATE);
@@ -383,13 +396,13 @@ int fpu_swap_kvm_fpstate(struct fpu_guest *guest_fpu, b=
ool enter_guest)
=20
 	/* Swap fpstate */
 	if (enter_guest) {
-		fpu->__task_fpstate =3D cur_fps;
+		WRITE_ONCE(fpu->__task_fpstate, cur_fps);
+		barrier();
 		fpu->fpstate =3D guest_fps;
 		guest_fps->in_use =3D true;
 	} else {
 		guest_fps->in_use =3D false;
 		fpu->fpstate =3D fpu->__task_fpstate;
-		fpu->__task_fpstate =3D NULL;
 	}
=20
 	cur_fps =3D fpu->fpstate;
@@ -406,6 +419,16 @@ int fpu_swap_kvm_fpstate(struct fpu_guest *guest_fpu, bo=
ol enter_guest)
 		xfd_update_state(cur_fps);
 	}
=20
+	/*
+	 * Clear fpu->__task_fpstate after switching back to host state.
+	 * A non-NULL __task_fpstate means guest state is still resident in
+	 * hardware; reset it only once host state has been restored.
+	 */
+	if (!enter_guest) {
+		barrier();
+		WRITE_ONCE(fpu->__task_fpstate, NULL);
+	}
+
 	fpregs_mark_activate();
 	fpregs_unlock();
 	return 0;
@@ -481,10 +504,8 @@ void kernel_fpu_begin_mask(unsigned int kfpu_mask)
 	this_cpu_write(kernel_fpu_allowed, false);
=20
 	if (!(current->flags & (PF_KTHREAD | PF_USER_WORKER)) &&
-	    !test_thread_flag(TIF_NEED_FPU_LOAD)) {
-		set_thread_flag(TIF_NEED_FPU_LOAD);
-		save_fpregs_to_fpstate(x86_task_fpu(current));
-	}
+	    !test_thread_flag(TIF_NEED_FPU_LOAD))
+		update_fpu_state_and_flag(x86_task_fpu(current), current);
 	__cpu_invalidate_fpregs_state();
=20
 	/* Put sane initial values into the control registers. */
