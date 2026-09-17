Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E824AA1E2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684015; cv=none; b=HBC6Cujlolw4zE8ALZ2LeNVrNBM8SP/1u0YdpZXxLL8nFcXa3pgepcdTt4SpIX9M9UPkzEWk4OpZ/k7YeGF57tkyEQsFrso36Unp2JowISZwl2CPPtDm/2ENDCIrsUM31aYrqEBACwYn1PbrPsk114Hog+UUaKd98qc/pPiZwUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684015; c=relaxed/simple;
	bh=p3QB7A0D8Ul38i9HU9OTKQ3hGiuAG51E+qGDbLLU5nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sNvNo/1qGxuxa+6ruCuTQ4ZXbktZUNcpbE2W+MUx4U6f1Ebiko60xbRPwmcfGVLBzPw/yk/ZmYwbeuIoJlynq6t1OHoMgXyOx9HcQdDU74oxVojneunBnLe3a3tf4Cvsm1P65eWaBJ3vmKWm1omkrm3GnddvexL+W9q+ufbA7Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ww5WwfMe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ww5WwfMe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C371F00898;
	Thu, 17 Sep 2026 22:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684012;
	bh=JHAAVncEdFAV+mQ/Mne6NY2noAiQL6alzuzqwRcP920=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ww5WwfMeCDya5rz9JnjAIXdj6NimDOn4J4Uyd0wt95A15bkVl9spKB5LmY2kUqHFC
	 umh9kVOgnm4w9ZPwAkBRfDIInBDvUvM65lyhsh1ji82W4NcuRA7nhCzmzXMgwmzuCo
	 QBtpsIhckpNgoh0kiQce2XCfohLuoWjWu2xBPb7lORD2EQwsJHpiLzuE4kwCAww2Dq
	 hh9vlHNG3lXJFv9HPqGaNCn454MMVzKzu66fKnx4oMMTjC2Mg0lK2aIrWskoiFhbqh
	 TxhPqpzS/mbzAEh5KbGaMpMiIX9OBg7rKoveKZln1EXKc22yje1jyJWWELoWBcUyt0
	 ChD+ziIV5T9Qg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Sep 2026 23:14:17 +0100
Subject: [PATCH 2/2] arm64: gcs: Store GCSCRE0_EL1 values instead of
 userspace mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-arm64-gcs-store-gcscre0-v1-2-3c9fa9213bac@kernel.org>
References: <20260917-arm64-gcs-store-gcscre0-v1-0-3c9fa9213bac@kernel.org>
In-Reply-To: <20260917-arm64-gcs-store-gcscre0-v1-0-3c9fa9213bac@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=9505; i=broonie@kernel.org;
 h=from:subject:message-id; bh=p3QB7A0D8Ul38i9HU9OTKQ3hGiuAG51E+qGDbLLU5nU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrGklrjLUmZK/o0zGVW0DXko2NBbbA2L+ZmKxn
 TImH/WT7MqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqxpJQAKCRAk1otyXVSH
 0HeTB/97yL0sBMhXa+P3Dlg3Lx0Io/+LwCuFEwVHRdh/4R3w9gyAiaCy1/u4hyULhVLBO2TM6Qk
 iXgjJrlR43BXFD8Mi+KGupSLAAZlj+hhaXgk4MIXHgqr/Mn9rOd1AJzRUalA16SM8FnTdSgXX4X
 1EGnrAsDVhm5VXgYSFvjcl1Z88PIffYMWGpcIhj+3RYuD7k9HEYnEE9IAOmL/04GovSz+xC8CEk
 J2Ult7/TtwzCNTlmE2viO3bD7dFHdnCDO0Gp6iOMwcCNkcSUkqpL7MUghxshpIpBTaIQukwR9Vm
 ZcIId1JosXnY+BKivO2v92FXzjcyZ3tjXd0FmKzmZSfcfpik
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Currently we track which GCS features are enabled by storing the mode
bits set by userspace in the task struct, rather than a value for use
with the hardware.  While this is the value that needed by most of the
code the main place that needs the value configured in the hardware is
in the context switch path which is the most performance sensitive,
everything else that works with the flags is much more of a slow path.

Since there is a direct mapping between mode bits and bits in
GCSCRE0_EL1, the register that controls these features for EL0,
it is easy to translate between the two ways of storing the value so
refactor to store the GCSCRE0_EL1 which we need in the hot path and
translate into the userspace flags as needed.  Provide helpers
gcs_get_el0_mode() and gcs_set_el0_mode() for reading and writing the
mode that wrap up the translation for all the users which replace access
to the value stored in the task struct, except for the two locations
which update the hardware state.  Since the context switch path is now
just a single register write make it unconditional, avoiding the need
for branches.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h       |  7 +++---
 arch/arm64/include/asm/processor.h |  2 +-
 arch/arm64/kernel/process.c        | 11 ++++-----
 arch/arm64/kernel/ptrace.c         |  4 ++--
 arch/arm64/kernel/signal.c         |  8 +++----
 arch/arm64/mm/gcs.c                | 47 ++++++++++++++++++++++++--------------
 6 files changed, 46 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index 3e6eeeebd282..fe8c8512bbcf 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -56,12 +56,13 @@ static inline u64 gcsss2(void)
 
 #ifdef CONFIG_ARM64_GCS
 
-static inline bool task_gcs_el0_enabled(struct task_struct *task)
+static inline bool task_gcs_el0_enabled(const struct task_struct *task)
 {
-	return task->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE;
+	return task->thread.gcscre0_el1 & GCSCRE0_EL1_PCRSEL;
 }
 
-void gcs_set_el0_mode(struct task_struct *task);
+void gcs_set_el0_mode(struct task_struct *task, u64 flags);
+u64 gcs_get_el0_mode(const struct task_struct *task);
 int gcs_check_locked(struct task_struct *task, unsigned long new_val);
 void gcs_free(struct task_struct *task);
 void gcs_preserve_current_state(void);
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 6dfbcacd9ba0..5b9b22ce9329 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -196,7 +196,7 @@ struct thread_struct {
 	u64			tpidr2_el0;
 	u64			por_el0;
 #ifdef CONFIG_ARM64_GCS
-	unsigned int		gcs_el0_mode;
+	unsigned int		gcscre0_el1;
 	unsigned int		gcs_el0_locked;
 	u64			gcspr_el0;
 	u64			gcs_base;
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 581f80e9b9b7..50924572802b 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -293,9 +293,10 @@ static void flush_gcs(void)
 	current->thread.gcspr_el0 = 0;
 	current->thread.gcs_base = 0;
 	current->thread.gcs_size = 0;
-	current->thread.gcs_el0_mode = 0;
 	current->thread.gcs_el0_locked = 0;
-	write_sysreg_s(GCSCRE0_EL1_nTR, SYS_GCSCRE0_EL1);
+	current->thread.gcscre0_el1 = GCSCRE0_EL1_nTR;
+
+	write_sysreg_s(current->thread.gcscre0_el1, SYS_GCSCRE0_EL1);
 	write_sysreg_s(0, SYS_GCSPR_EL0);
 }
 
@@ -310,7 +311,7 @@ static int copy_thread_gcs(struct task_struct *p,
 	p->thread.gcs_base = 0;
 	p->thread.gcs_size = 0;
 
-	p->thread.gcs_el0_mode = current->thread.gcs_el0_mode;
+	p->thread.gcscre0_el1 = current->thread.gcscre0_el1;
 	p->thread.gcs_el0_locked = current->thread.gcs_el0_locked;
 
 	gcs = gcs_alloc_thread_stack(p, args);
@@ -593,9 +594,7 @@ static void gcs_thread_switch(struct task_struct *next)
 	/* GCSPR_EL0 is always readable */
 	gcs_preserve_current_state();
 	write_sysreg_s(next->thread.gcspr_el0, SYS_GCSPR_EL0);
-
-	if (current->thread.gcs_el0_mode != next->thread.gcs_el0_mode)
-		gcs_set_el0_mode(next);
+	write_sysreg_s(next->thread.gcscre0_el1, SYS_GCSCRE0_EL1);
 
 	/*
 	 * Ensure that GCS memory effects of the 'prev' thread are
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f743cbec1c3a..cec4d8284262 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -1568,7 +1568,7 @@ static int poe_set(struct task_struct *target, const struct
 static void task_gcs_to_user(struct user_gcs *user_gcs,
 			     const struct task_struct *target)
 {
-	user_gcs->features_enabled = target->thread.gcs_el0_mode;
+	user_gcs->features_enabled = gcs_get_el0_mode(target);
 	user_gcs->features_locked = target->thread.gcs_el0_locked;
 	user_gcs->gcspr_el0 = target->thread.gcspr_el0;
 }
@@ -1576,7 +1576,7 @@ static void task_gcs_to_user(struct user_gcs *user_gcs,
 static void task_gcs_from_user(struct task_struct *target,
 			       const struct user_gcs *user_gcs)
 {
-	target->thread.gcs_el0_mode = user_gcs->features_enabled;
+	gcs_set_el0_mode(target, user_gcs->features_enabled);
 	target->thread.gcs_el0_locked = user_gcs->features_locked;
 	target->thread.gcspr_el0 = user_gcs->gcspr_el0;
 }
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 38e6fa204c17..754ed1bf0baf 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -712,6 +712,7 @@ static int preserve_gcs_context(struct gcs_context __user *ctx)
 {
 	int err = 0;
 	u64 gcspr = read_sysreg_s(SYS_GCSPR_EL0);
+	u64 mode = gcs_get_el0_mode(current);
 
 	/*
 	 * If GCS is enabled we will add a cap token to the frame,
@@ -727,8 +728,7 @@ static int preserve_gcs_context(struct gcs_context __user *ctx)
 	__put_user_error(sizeof(*ctx), &ctx->head.size, err);
 	__put_user_error(gcspr, &ctx->gcspr, err);
 	__put_user_error(0, &ctx->reserved, err);
-	__put_user_error(current->thread.gcs_el0_mode,
-			 &ctx->features_enabled, err);
+	__put_user_error(mode, &ctx->features_enabled, err);
 
 	return err;
 }
@@ -763,7 +763,7 @@ static int restore_gcs_context(struct user_ctxs *user)
 	if (!(enabled & PR_SHADOW_STACK_ENABLE))
 		enabled = 0;
 
-	current->thread.gcs_el0_mode = enabled;
+	gcs_set_el0_mode(current, enabled);
 
 	/*
 	 * We let userspace set GCSPR_EL0 to anything here, we will
@@ -1080,7 +1080,7 @@ static int gcs_restore_signal(void)
 	if (!system_supports_gcs())
 		return 0;
 
-	if (!(current->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE))
+	if (!task_gcs_el0_enabled(current))
 		return 0;
 
 	gcspr_el0 = read_sysreg_s(SYS_GCSPR_EL0);
diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 84add924dc60..acac5544dff2 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -120,29 +120,39 @@ SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsi
 	return addr;
 }
 
-/*
- * Apply the GCS mode configured for the specified task to the
- * hardware.
- */
-void gcs_set_el0_mode(struct task_struct *task)
+void gcs_set_el0_mode(struct task_struct *task, u64 flags)
 {
-	u64 gcscre0_el1 = GCSCRE0_EL1_nTR;
+	task->thread.gcscre0_el1 = GCSCRE0_EL1_nTR;
 
-	if (task->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE)
-		gcscre0_el1 |= GCSCRE0_EL1_RVCHKEN | GCSCRE0_EL1_PCRSEL;
+	if (flags & PR_SHADOW_STACK_ENABLE)
+		task->thread.gcscre0_el1 |= GCSCRE0_EL1_RVCHKEN | GCSCRE0_EL1_PCRSEL;
 
-	if (task->thread.gcs_el0_mode & PR_SHADOW_STACK_WRITE)
-		gcscre0_el1 |= GCSCRE0_EL1_STREn;
+	if (flags & PR_SHADOW_STACK_WRITE)
+		task->thread.gcscre0_el1 |= GCSCRE0_EL1_STREn;
 
-	if (task->thread.gcs_el0_mode & PR_SHADOW_STACK_PUSH)
-		gcscre0_el1 |= GCSCRE0_EL1_PUSHMEn;
+	if (flags & PR_SHADOW_STACK_PUSH)
+		task->thread.gcscre0_el1 |= GCSCRE0_EL1_PUSHMEn;
+}
+
+u64 gcs_get_el0_mode(const struct task_struct *task)
+{
+	u64 flags = 0;
+
+	if (task->thread.gcscre0_el1 & GCSCRE0_EL1_PCRSEL)
+		flags |= PR_SHADOW_STACK_ENABLE;
 
-	write_sysreg_s(gcscre0_el1, SYS_GCSCRE0_EL1);
+	if (task->thread.gcscre0_el1 & GCSCRE0_EL1_STREn)
+		flags |= PR_SHADOW_STACK_WRITE;
+
+	if (task->thread.gcscre0_el1 & GCSCRE0_EL1_PUSHMEn)
+		flags |= PR_SHADOW_STACK_PUSH;
+
+	return flags;
 }
 
 int gcs_check_locked(struct task_struct *task, unsigned long new_val)
 {
-	unsigned long cur_val = task->thread.gcs_el0_mode;
+	unsigned long cur_val = gcs_get_el0_mode(task);
 
 	cur_val &= task->thread.gcs_el0_locked;
 	new_val &= task->thread.gcs_el0_locked;
@@ -211,9 +221,9 @@ int arch_set_shadow_stack_status(struct task_struct *task, unsigned long arg)
 				       SYS_GCSPR_EL0);
 	}
 
-	task->thread.gcs_el0_mode = arg;
+	gcs_set_el0_mode(task, arg);
 	if (task == current)
-		gcs_set_el0_mode(task);
+		write_sysreg_s(task->thread.gcscre0_el1, SYS_GCSCRE0_EL1);
 
 	return 0;
 }
@@ -221,13 +231,16 @@ int arch_set_shadow_stack_status(struct task_struct *task, unsigned long arg)
 int arch_get_shadow_stack_status(struct task_struct *task,
 				 unsigned long __user *arg)
 {
+	u64 mode;
+
 	if (!system_supports_gcs())
 		return -EINVAL;
 
 	if (is_compat_thread(task_thread_info(task)))
 		return -EINVAL;
 
-	return put_user(task->thread.gcs_el0_mode, arg);
+	mode = gcs_get_el0_mode(task);
+	return put_user(mode, arg);
 }
 
 int arch_lock_shadow_stack_status(struct task_struct *task,

-- 
2.47.3

