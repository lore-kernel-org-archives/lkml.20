Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9807351815B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790701792; cv=none; b=uhrJtBYCrkPUYwKrxuBSQ9hihQm4fGBwI7N+yIisGB2TDjxF/chACDWs87tLT3j41HtdQ3gaVtUuETreVypYIA65kkx5MVRlPuYJOejTBHuuo3LwlWVHk5vuFmcxDjn6wpSI0+SCPOOb+8KDyEyclp+XVf8IwQ51cNwocKYdoDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790701792; c=relaxed/simple;
	bh=vAWpKfoMcBcYFQiIgPpQZt2gAuw45VdrXu4vr32WnR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mnISwCdQLQTEksoTY55ueUGYM8DfTWcp6itQW/9jzcaehTk9HrZpptJU0JjeUoKPhujxc2P68OPfKkjcrWkXVQrxwy6nFgHwiEWgC4jo3hheBmMyq9BvDZpHl/MsI2hnoFOPpWDVw7iAlp6GjQurkZG3SNEmslzQiEoV+wjTtVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=fcjy7/tK; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="fcjy7/tK"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aa8d882so5180051d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790701790; x=1791306590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fr6kFLYx3hqPZHfOilkUN+oxGtJHBsVQ4xuLKdXd4To=;
        b=fcjy7/tKQos+IaENciyf25aJplXfB/l4HZNTOxfL+gIfGqQ+7KS644jlBGR4LAMHwd
         ZBdOTVXJHUJJ3w4WKTzRMYjQ66oZIsjyCPkmSwLgRWo5HIk95npkOsWDZpDjZVcThiop
         I+mzKmkEKLmlEzey6x2256Ww8/pBozWPII56txkO5YRwMfYhSUCLLDmFYNVEeP80Nscf
         sNCLaKQPC2lYbyalSiNtEqUEANCWzqzaXt1bVKIIKnexaTTSSm8YH1PONFte7U4Zu1n+
         v2FLIlBduyNxF0tTE20k0VH2JnAeqmXwbGm+W8MnGRi6pmUN3xaS9dikxSpDWHnkO2Tg
         wvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701790; x=1791306590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr6kFLYx3hqPZHfOilkUN+oxGtJHBsVQ4xuLKdXd4To=;
        b=TK5dbsu0Xlfx4OKtK18NrhC0XhdsQ7MaIqbgIpLYYSso/6EHf2+5QUNqea3CetSZ2d
         2Aiz+NHGL5c7YqzaSLWDJuXhLIBVMr4MEOSkojj3zDvSAk8lfXm7WXU/ta9aYV+lcJoM
         SuWOm1OVDW52yV0O1AXWeL1SV9Y7ku4s+vCERjMe9VeGaEiB4tRThVyv/nfF10mVfYtV
         pisdNmn228pt1MOmY1tfJPfDbqGq+QBncvxMM2iX+s+HFjpvJz/S9wMA7ISlRbIUBOk0
         LijBVB32Tl52lBDW1xWAOR/lACTaRZ5cOOkJ6gd/baPCJLDiSULc/uNDdXqmhcEVmu9S
         T+1g==
X-Forwarded-Encrypted: i=1; AKwUvBx3VLDDjwXn7k1bjwWqWAZ7X/ee6NvlBiePKI4Dcf35mot7Hf4UGi4yaUgysFYM45fRFWq7SPD8sSoDv9Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLI8fy6O3jfzOb1Q38jQrJcBnuJbhU9o6AJycG3KI0fOr/A17/
	YA/896bWGy99HJchI5/A0oWy/gM3G8lptXa0aJAOLXFFo6irhWDeY8JAFAd1FjkmMMnONXy6t5z
	TCh4ASjc=
X-Gm-Gg: AYBFou3KStrXbOUW3iLWk1G+7ioZ7+aPlNMcgixoL+J5BDm9yMW4QseHt7H00pr3EsZ
	tnz7yeQ0fK5k2reLpqImH3zmv+lD8iiWwZPvupdvDFVtMKkQd/8kJpwmPJLeF7JkgSqQloZaEwh
	qEzWGwlZ0i3pmxuO5oap3k0uM+z58swXPHHg2f29MG06Q/KVQ+ThRHYbRhNYSZqnHaehAuW+gnm
	oO8S1rg+t6d4BZM7ANYbn52kcjHqLsfphuJKnwAES2dtywOWMy+aCM09KzwbDu7PZbX3/diyGLn
	gSlEXUXbRsMP/sa2V7zFmpBoXayMnGB0YmKZ61hALeBlD8sqeiheXDSlAcWup3xe8KR1eZYB6hI
	4LVEUmFZIKguo4odnhuVDQvqkaEo1qgC+oDEhvW0s7nQwxxXAP1ZVyUbBFHEnwYVhO0wV3OqqZJ
	u6AkS9aZbam1PUs7bcaB6q08IvG5OcTkP+Anu+IK5HL2eZm6GsSinR8js5luA470twbipyuf0VH
	NpCHo2K6aeQ5co=
X-Received: by 2002:a05:690e:1381:b0:675:6228:2fdd with SMTP id 956f58d0204a3-67562283283mr1486048d50.4.1790701789596;
        Tue, 29 Sep 2026 10:09:49 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d36dc53sm15111636d6.37.2026.09.29.10.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:09:48 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 29 Sep 2026 17:07:19 +0000
Subject: [PATCH v6 02/14] entry: Pass pt_regs to
 irqentry_exit_cond_resched()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rcu-tasks-preempt-qs-v6-2-c111ee02caca@toxicpanda.com>
References: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
In-Reply-To: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Boqun Feng <boqun@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 rcu@vger.kernel.org, bpf@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790701681; l=4297;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=vAWpKfoMcBcYFQiIgPpQZt2gAuw45VdrXu4vr32WnR0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJ82CGQXfqnbJiVp3TBiWQlv0t3DHZRPE4o+VRe/LAxOZF8rZHNhVg51z28EpN+QditmDbtfNGQ
 sOegaspVm+Aw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The irq-exit preemption path is about to need the interrupted context's
registers to decide whether the preemption may be reported to Tasks RCU
as a quiescent state.  irqentry_exit_to_kernel_mode_preempt() already
has them; hand them down through irqentry_exit_cond_resched(), its
PREEMPT_DYNAMIC static-call and static-key variants, and
raw_irqentry_exit_cond_resched().  The only caller outside the generic
entry code is Xen PV's upcall handler, which has regs as well.

No functional change.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/xen/enlighten_pv.c      |  2 +-
 include/linux/irq-entry-common.h | 13 +++++++------
 kernel/entry/common.c            |  6 +++---
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 2c64b388f616..3d85035f5624 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -739,7 +739,7 @@ __visible noinstr void xen_pv_evtchn_do_upcall(struct pt_regs *regs)
 
 	inhcall = get_and_clear_inhcall();
 	if (inhcall && !WARN_ON_ONCE(state.exit_rcu)) {
-		irqentry_exit_cond_resched();
+		irqentry_exit_cond_resched(regs);
 		instrumentation_end();
 		restore_inhcall(inhcall);
 	} else {
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 0bb6c03481fa..e19b41ee6b18 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -343,24 +343,25 @@ typedef struct irqentry_state {
 
 /**
  * irqentry_exit_cond_resched - Conditionally reschedule on return from interrupt
+ * @regs:	Pointer to pt_regs of interrupted context
  *
  * Conditional reschedule with additional sanity checks.
  */
-void raw_irqentry_exit_cond_resched(void);
+void raw_irqentry_exit_cond_resched(struct pt_regs *regs);
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 #if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
 #define irqentry_exit_cond_resched_dynamic_enabled	raw_irqentry_exit_cond_resched
 #define irqentry_exit_cond_resched_dynamic_disabled	NULL
 DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
-#define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)()
+#define irqentry_exit_cond_resched(regs)	static_call(irqentry_exit_cond_resched)(regs)
 #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void);
-#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
+void dynamic_irqentry_exit_cond_resched(struct pt_regs *regs);
+#define irqentry_exit_cond_resched(regs)	dynamic_irqentry_exit_cond_resched(regs)
 #endif
 #else /* CONFIG_PREEMPT_DYNAMIC */
-#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
+#define irqentry_exit_cond_resched(regs)	raw_irqentry_exit_cond_resched(regs)
 #endif /* CONFIG_PREEMPT_DYNAMIC */
 
 /**
@@ -465,7 +466,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
 		return;
 
 	if (IS_ENABLED(CONFIG_PREEMPTION))
-		irqentry_exit_cond_resched();
+		irqentry_exit_cond_resched(regs);
 }
 
 /**
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e3d381fd3d25..e4acd50bd81a 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -134,7 +134,7 @@ static inline bool arch_irqentry_exit_need_resched(void);
 static inline bool arch_irqentry_exit_need_resched(void) { return true; }
 #endif
 
-void raw_irqentry_exit_cond_resched(void)
+void raw_irqentry_exit_cond_resched(struct pt_regs *regs)
 {
 	if (!preempt_count()) {
 		/* Sanity check RCU and thread stack */
@@ -150,11 +150,11 @@ void raw_irqentry_exit_cond_resched(void)
 DEFINE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
 #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void)
+void dynamic_irqentry_exit_cond_resched(struct pt_regs *regs)
 {
 	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
 		return;
-	raw_irqentry_exit_cond_resched();
+	raw_irqentry_exit_cond_resched(regs);
 }
 #endif
 #endif

-- 
2.55.0

