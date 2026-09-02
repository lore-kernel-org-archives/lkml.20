Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706973603D5;
	Wed,  2 Sep 2026 07:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335696; cv=none; b=LhOtHPdInwUb+aPuBDSodY8UjRXy9TxVM6q1jE52WkPuLQczW9jgSFLUMSgnDuwq8iX9RzrfKdFDmPe6ytM+/31CvQVv2wFVyc8ZLYcL/1WzIjfRTAOxSF9LBuwp02URC2RDzmRZtpmv/LI5Uy8SZC57G/DdRVwJklqEQQNaj6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335696; c=relaxed/simple;
	bh=zzuJ3ZnLsGEf/MeyUAm0YmmJLOHm0GZJwyye1osP62g=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Vz7P5u7ZQhCigtmc5WFEyGytsvInYHhatDCFBZp1pv7wHy6gwf05uIqiuHFbT8+LHgLMFQ6yjlj+VyQ/3SmMlmMhCcbCh4/n5Ytxn1tmGgy59tbv2uDfbpJx6VZLCBIMVWMQ3u+//S9BUH7Pv/d0Io5n1SmSXN+akOsvVXCuk10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Fs+Csu5D; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/XtL27/C; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Fs+Csu5D";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/XtL27/C"
Date: Wed, 02 Sep 2026 07:54:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788335692;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8lQmtyL8WlEg8d3HP+O9lEg+ESvOPnMIxCP6XgCFQI=;
	b=Fs+Csu5D5/nwD2YTkv2b169yCnA9Xk1gh6KHpZGL2qDFBsViKBJHTMi/vt8krqlMrQ2dMG
	Jeu5SW6PRSkC8k674UPq5YJiZMLnZj0IXyAiv7BSr9N3dYumiTq47uS2ygvxi3w9LPCfMl
	GgmR0W/vuUX/3u24gvHnHb7sSG2jwhhzmdJDd3uNBL+pzeZNl0MlB7YvVlBddzsEh/9IsJ
	d0dw6RG9R+5cETxX4DHW7HExrzUQ0fC7OeET51tFbGlVwNwGRVdaOhWvUkFt+dNSSuYE0N
	HY4Bic5xZuAPq+jrXfcmKXeqsVsqQ9VyNo+GSmVkJWssbkQjatnD9lTvgAUv8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788335692;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8lQmtyL8WlEg8d3HP+O9lEg+ESvOPnMIxCP6XgCFQI=;
	b=/XtL27/C9RpC+VZjQTQbSYbStXnCST7La3/pkdlbJDTe4WdJQW/U1v+DYgJrHpY4B0gBqS
	BIFA2Wqyg4ZnAtAg==
From: "tip-bot2 for Mark Rutland" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched: dynamic: Simplify preempt_schedule{,_notrace}()
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Mete Durlu <meted@linux.ibm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260803191731.3244294-4-mark.rutland@arm.com>
References: <20260803191731.3244294-4-mark.rutland@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833569080.3717435.12300058244789301986.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     b9d267b9d632feec9ddd1ce12078b7113f429a51
Gitweb:        https://git.kernel.org/tip/b9d267b9d632feec9ddd1ce12078b7113f4=
29a51
Author:        Mark Rutland <mark.rutland@arm.com>
AuthorDate:    Mon, 03 Aug 2026 20:17:28 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:37:22 +02:00

sched: dynamic: Simplify preempt_schedule{,_notrace}()

PREEMPT_DYNAMIC is now limited to the FULL and LAZY preemption models.
In either model, both preempt_schedule() and preempt_schedule_notrace()
are always called and never disabled.

Remove the unnecessary code for these when PREEMPT_DYNAMIC is selected.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Mete Durlu <meted@linux.ibm.com>
Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Link: https://patch.msgid.link/20260803191731.3244294-4-mark.rutland@arm.com
---
 arch/arm64/include/asm/preempt.h | 10 +------
 arch/s390/include/asm/preempt.h  | 11 +-------
 arch/x86/include/asm/preempt.h   | 28 +-----------------
 include/asm-generic/preempt.h    | 10 +------
 kernel/sched/core.c              | 52 +-------------------------------
 5 files changed, 111 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preemp=
t.h
index 9ecc276..e86e850 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -104,19 +104,9 @@ static inline bool should_resched(int preempt_offset)
 void preempt_schedule(void);
 void preempt_schedule_notrace(void);
=20
-#ifdef CONFIG_PREEMPT_DYNAMIC
-
-void dynamic_preempt_schedule(void);
-#define __preempt_schedule()		dynamic_preempt_schedule()
-void dynamic_preempt_schedule_notrace(void);
-#define __preempt_schedule_notrace()	dynamic_preempt_schedule_notrace()
-
-#else /* CONFIG_PREEMPT_DYNAMIC */
-
 #define __preempt_schedule()		preempt_schedule()
 #define __preempt_schedule_notrace()	preempt_schedule_notrace()
=20
-#endif /* CONFIG_PREEMPT_DYNAMIC */
 #endif /* CONFIG_PREEMPTION */
=20
 #endif /* __ASM_PREEMPT_H */
diff --git a/arch/s390/include/asm/preempt.h b/arch/s390/include/asm/preempt.h
index 5560d5f..60c6f01 100644
--- a/arch/s390/include/asm/preempt.h
+++ b/arch/s390/include/asm/preempt.h
@@ -155,20 +155,9 @@ static __always_inline int __preempt_count_sub_return(in=
t val)
 void preempt_schedule(void);
 void preempt_schedule_notrace(void);
=20
-#ifdef CONFIG_PREEMPT_DYNAMIC
-
-void dynamic_preempt_schedule(void);
-void dynamic_preempt_schedule_notrace(void);
-#define __preempt_schedule()		dynamic_preempt_schedule()
-#define __preempt_schedule_notrace()	dynamic_preempt_schedule_notrace()
-
-#else /* CONFIG_PREEMPT_DYNAMIC */
-
 #define __preempt_schedule()		preempt_schedule()
 #define __preempt_schedule_notrace()	preempt_schedule_notrace()
=20
-#endif /* CONFIG_PREEMPT_DYNAMIC */
-
 #endif /* CONFIG_PREEMPTION */
=20
 #endif /* __ASM_PREEMPT_H */
diff --git a/arch/x86/include/asm/preempt.h b/arch/x86/include/asm/preempt.h
index fafb6f8..d16d9c2 100644
--- a/arch/x86/include/asm/preempt.h
+++ b/arch/x86/include/asm/preempt.h
@@ -137,43 +137,15 @@ static __always_inline bool should_resched(int preempt_=
offset)
 extern asmlinkage void preempt_schedule(void);
 extern asmlinkage void preempt_schedule_thunk(void);
=20
-#define preempt_schedule_dynamic_enabled	preempt_schedule_thunk
-#define preempt_schedule_dynamic_disabled	NULL
-
 extern asmlinkage void preempt_schedule_notrace(void);
 extern asmlinkage void preempt_schedule_notrace_thunk(void);
=20
-#define preempt_schedule_notrace_dynamic_enabled	preempt_schedule_notrace_th=
unk
-#define preempt_schedule_notrace_dynamic_disabled	NULL
-
-#ifdef CONFIG_PREEMPT_DYNAMIC
-
-DECLARE_STATIC_CALL(preempt_schedule, preempt_schedule_dynamic_enabled);
-
-#define __preempt_schedule() \
-do { \
-	__STATIC_CALL_MOD_ADDRESSABLE(preempt_schedule); \
-	asm volatile ("call " STATIC_CALL_TRAMP_STR(preempt_schedule) : ASM_CALL_CO=
NSTRAINT); \
-} while (0)
-
-DECLARE_STATIC_CALL(preempt_schedule_notrace, preempt_schedule_notrace_dynam=
ic_enabled);
-
-#define __preempt_schedule_notrace() \
-do { \
-	__STATIC_CALL_MOD_ADDRESSABLE(preempt_schedule_notrace); \
-	asm volatile ("call " STATIC_CALL_TRAMP_STR(preempt_schedule_notrace) : ASM=
_CALL_CONSTRAINT); \
-} while (0)
-
-#else /* PREEMPT_DYNAMIC */
-
 #define __preempt_schedule() \
 	asm volatile ("call preempt_schedule_thunk" : ASM_CALL_CONSTRAINT);
=20
 #define __preempt_schedule_notrace() \
 	asm volatile ("call preempt_schedule_notrace_thunk" : ASM_CALL_CONSTRAINT);
=20
-#endif /* PREEMPT_DYNAMIC */
-
 #endif /* PREEMPTION */
=20
 #undef __pc_op
diff --git a/include/asm-generic/preempt.h b/include/asm-generic/preempt.h
index c8683c0..1adddea 100644
--- a/include/asm-generic/preempt.h
+++ b/include/asm-generic/preempt.h
@@ -96,19 +96,9 @@ static __always_inline bool should_resched(int preempt_off=
set)
 extern asmlinkage void preempt_schedule(void);
 extern asmlinkage void preempt_schedule_notrace(void);
=20
-#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_K=
EY)
-
-void dynamic_preempt_schedule(void);
-void dynamic_preempt_schedule_notrace(void);
-#define __preempt_schedule()		dynamic_preempt_schedule()
-#define __preempt_schedule_notrace()	dynamic_preempt_schedule_notrace()
-
-#else /* !CONFIG_PREEMPT_DYNAMIC || !CONFIG_HAVE_PREEMPT_DYNAMIC_KEY*/
-
 #define __preempt_schedule() preempt_schedule()
 #define __preempt_schedule_notrace() preempt_schedule_notrace()
=20
-#endif /* CONFIG_PREEMPT_DYNAMIC && CONFIG_HAVE_PREEMPT_DYNAMIC_KEY*/
 #endif /* CONFIG_PREEMPTION */
=20
 #endif /* __ASM_PREEMPT_H */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0060efc..844f374 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7500,27 +7500,6 @@ asmlinkage __visible void __sched notrace preempt_sche=
dule(void)
 NOKPROBE_SYMBOL(preempt_schedule);
 EXPORT_SYMBOL(preempt_schedule);
=20
-#ifdef CONFIG_PREEMPT_DYNAMIC
-# ifdef CONFIG_HAVE_PREEMPT_DYNAMIC_CALL
-#  ifndef preempt_schedule_dynamic_enabled
-#   define preempt_schedule_dynamic_enabled	preempt_schedule
-#   define preempt_schedule_dynamic_disabled	NULL
-#  endif
-DEFINE_STATIC_CALL(preempt_schedule, preempt_schedule_dynamic_enabled);
-EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
-# elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
-static DEFINE_STATIC_KEY_TRUE(sk_dynamic_preempt_schedule);
-void __sched notrace dynamic_preempt_schedule(void)
-{
-	if (!static_branch_unlikely(&sk_dynamic_preempt_schedule))
-		return;
-	preempt_schedule();
-}
-NOKPROBE_SYMBOL(dynamic_preempt_schedule);
-EXPORT_SYMBOL(dynamic_preempt_schedule);
-# endif
-#endif /* CONFIG_PREEMPT_DYNAMIC */
-
 /**
  * preempt_schedule_notrace - preempt_schedule called by tracing
  *
@@ -7573,27 +7552,6 @@ asmlinkage __visible void __sched notrace preempt_sche=
dule_notrace(void)
 }
 EXPORT_SYMBOL_GPL(preempt_schedule_notrace);
=20
-#ifdef CONFIG_PREEMPT_DYNAMIC
-# if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
-#  ifndef preempt_schedule_notrace_dynamic_enabled
-#   define preempt_schedule_notrace_dynamic_enabled	preempt_schedule_notrace
-#   define preempt_schedule_notrace_dynamic_disabled	NULL
-#  endif
-DEFINE_STATIC_CALL(preempt_schedule_notrace, preempt_schedule_notrace_dynami=
c_enabled);
-EXPORT_STATIC_CALL_TRAMP(preempt_schedule_notrace);
-# elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
-static DEFINE_STATIC_KEY_TRUE(sk_dynamic_preempt_schedule_notrace);
-void __sched notrace dynamic_preempt_schedule_notrace(void)
-{
-	if (!static_branch_unlikely(&sk_dynamic_preempt_schedule_notrace))
-		return;
-	preempt_schedule_notrace();
-}
-NOKPROBE_SYMBOL(dynamic_preempt_schedule_notrace);
-EXPORT_SYMBOL(dynamic_preempt_schedule_notrace);
-# endif
-#endif
-
 #endif /* CONFIG_PREEMPTION */
=20
 /*
@@ -7891,8 +7849,6 @@ EXPORT_SYMBOL(__cond_resched_rwlock_write);
 # endif
=20
 /*
- * SC:preempt_schedule
- * SC:preempt_schedule_notrace
  * SC:irqentry_exit_cond_resched
  *
  *
@@ -7903,14 +7859,10 @@ EXPORT_SYMBOL(__cond_resched_rwlock_write);
  *   (unselectable)
  *
  * FULL:
- *   preempt_schedule           <- preempt_schedule
- *   preempt_schedule_notrace   <- preempt_schedule_notrace
  *   irqentry_exit_cond_resched <- irqentry_exit_cond_resched
  *   dynamic_preempt_lazy       <- false
  *
  * LAZY:
- *   preempt_schedule           <- preempt_schedule
- *   preempt_schedule_notrace   <- preempt_schedule_notrace
  *   irqentry_exit_cond_resched <- irqentry_exit_cond_resched
  *   dynamic_preempt_lazy       <- true
  */
@@ -7955,8 +7907,6 @@ static void __sched_dynamic_update(int mode)
 {
 	switch (mode) {
 	case preempt_dynamic_full:
-		preempt_dynamic_enable(preempt_schedule);
-		preempt_dynamic_enable(preempt_schedule_notrace);
 		preempt_dynamic_enable(irqentry_exit_cond_resched);
 		preempt_dynamic_key_disable(preempt_lazy);
 		if (mode !=3D preempt_dynamic_mode)
@@ -7964,8 +7914,6 @@ static void __sched_dynamic_update(int mode)
 		break;
=20
 	case preempt_dynamic_lazy:
-		preempt_dynamic_enable(preempt_schedule);
-		preempt_dynamic_enable(preempt_schedule_notrace);
 		preempt_dynamic_enable(irqentry_exit_cond_resched);
 		preempt_dynamic_key_enable(preempt_lazy);
 		if (mode !=3D preempt_dynamic_mode)
