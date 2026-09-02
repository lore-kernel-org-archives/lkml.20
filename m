Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2D63E6DC8;
	Wed,  2 Sep 2026 07:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335699; cv=none; b=EYZQvZFjD/fgaxo0F6JdijAV3gvvn8SpDUGzEMGXYcgUxLwcYVpEaoLxKKTTU6lj6H+uZxLGfU/Rt9iF69/5EvC1ocb6hNiSijl8T35BEWP16p48ruxgkg9k8y3tS3mgK9L4+ZiJ83GLKdu+1NeituslxLk7VFKhhp9qw1o8zbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335699; c=relaxed/simple;
	bh=ugwkcc9OJ+XsIUOiAInwH4xu/9+daQNAaMObzZjiX68=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=n5yLWN18yOQNQqZ6FC7r8WvvFOQakFel8h34rFjbI5I47l+mdG7op7XzAxPIQXR6nWMNpTuQny+3noylsPTNFBHc/M4OWb0Av3+trsj792lJivWR3LgY0MVIM7A+hwyg1lRiYv/9DmbQNSwbT5dnKXV03FuoQL8cg8LOwF6w4LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RNENuaMs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BHFRH4jd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RNENuaMs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BHFRH4jd"
Date: Wed, 02 Sep 2026 07:54:52 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788335694;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HirKjXXvLnB96DzjJaUDJBrQ50yDLOIy1qFjLk9zRlM=;
	b=RNENuaMsUlBsRLOtuiIthja5/6mu50jEMknUVh6S6Iay1eCOylIJOqoial4BlqjMszx6f2
	lAOCAjMQvM9eZ7FXm4B13iG8lG1BjCLc9OhM7E50TXabFk3Q0aGjKm+x6Dy27TAnjhml0R
	ifT9a+8dJHpjjyriO7EfsJZF/bCA+lemnPQaTCzGjExLrQjMofjA4/BuhYRG4ZL5Zs0xfT
	QfIgvl9zHTGYPfb8xwFI/dfYUDOsuPCMlHsgJ/5BOD9J+RtCsupSMSoUnzaNpP4YC11QMY
	XcwECMRhJPxHia6iUgvlYNGIz51VUiH/Bki2YP3VZak5vCbJym6ciiwS/A7yTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788335694;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HirKjXXvLnB96DzjJaUDJBrQ50yDLOIy1qFjLk9zRlM=;
	b=BHFRH4jdxJmhE9uhDqohVWeRGOFXlGHwvWl4V4Z/0rmJbS1M1rv6AGKQiJq+jkLBJSRTsV
	NPNslb8zRIM3kYBQ==
From: "tip-bot2 for Mark Rutland" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched: dynamic: Simplify {cond,might}_resched()
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Mete Durlu <meted@linux.ibm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260803191731.3244294-3-mark.rutland@arm.com>
References: <20260803191731.3244294-3-mark.rutland@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833569227.3717435.16432655650021840152.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     88e0b3bb9930605ad7e5d3ddac7d9875325bebf0
Gitweb:        https://git.kernel.org/tip/88e0b3bb9930605ad7e5d3ddac7d9875325=
bebf0
Author:        Mark Rutland <mark.rutland@arm.com>
AuthorDate:    Mon, 03 Aug 2026 20:17:27 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:37:22 +02:00

sched: dynamic: Simplify {cond,might}_resched()

PREEMPT_DYNAMIC is now limited to the FULL and LAZY preemption models.
In either model, both cond_resched() and might_resched() are always
disabled and do nothing.

Remove the unnecessary code for these when PREEMPT_DYNAMIC is selected.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Mete Durlu <meted@linux.ibm.com>
Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Link: https://patch.msgid.link/20260803191731.3244294-3-mark.rutland@arm.com
---
 include/linux/kernel.h | 20 +-------------------
 include/linux/sched.h  | 31 ++---------------------------
 kernel/sched/core.c    | 44 +-----------------------------------------
 3 files changed, 4 insertions(+), 91 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 24414c7..4b11d1d 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -43,30 +43,10 @@ struct completion;
 struct user;
=20
 #ifdef CONFIG_PREEMPT_VOLUNTARY_BUILD
-
 extern int __cond_resched(void);
 # define might_resched() __cond_resched()
-
-#elif defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC=
_CALL)
-
-extern int __cond_resched(void);
-
-DECLARE_STATIC_CALL(might_resched, __cond_resched);
-
-static __always_inline void might_resched(void)
-{
-	static_call_mod(might_resched)();
-}
-
-#elif defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC=
_KEY)
-
-extern int dynamic_might_resched(void);
-# define might_resched() dynamic_might_resched()
-
 #else
-
 # define might_resched() do { } while (0)
-
 #endif /* CONFIG_PREEMPT_* */
=20
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 8b3d47a..d7cc771 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2134,44 +2134,19 @@ static inline void set_need_resched_current(void)
  * value indicates whether a reschedule was done in fact.
  * cond_resched_lock() will drop the spinlock before scheduling,
  */
-#if !defined(CONFIG_PREEMPTION) || defined(CONFIG_PREEMPT_DYNAMIC)
+#if !defined(CONFIG_PREEMPTION)
 extern int __cond_resched(void);
=20
-#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_C=
ALL)
-
-DECLARE_STATIC_CALL(cond_resched, __cond_resched);
-
-static __always_inline int _cond_resched(void)
-{
-	return static_call_mod(cond_resched)();
-}
-
-#elif defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC=
_KEY)
-
-extern int dynamic_cond_resched(void);
-
-static __always_inline int _cond_resched(void)
-{
-	return dynamic_cond_resched();
-}
-
-#else /* !CONFIG_PREEMPTION */
-
 static inline int _cond_resched(void)
 {
 	return __cond_resched();
 }
-
-#endif /* PREEMPT_DYNAMIC && CONFIG_HAVE_PREEMPT_DYNAMIC_CALL */
-
-#else /* CONFIG_PREEMPTION && !CONFIG_PREEMPT_DYNAMIC */
-
+#else
 static inline int _cond_resched(void)
 {
 	return 0;
 }
-
-#endif /* !CONFIG_PREEMPTION || CONFIG_PREEMPT_DYNAMIC */
+#endif
=20
 #define cond_resched() ({			\
 	__might_resched(__FILE__, __LINE__, 0);	\
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 84e7685..0060efc 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7794,7 +7794,7 @@ out_unlock:
 }
 #endif /* CONFIG_RT_MUTEXES */
=20
-#if !defined(CONFIG_PREEMPTION) || defined(CONFIG_PREEMPT_DYNAMIC)
+#if !defined(CONFIG_PREEMPTION)
 int __sched __cond_resched(void)
 {
 	if (should_resched(0) && !irqs_disabled()) {
@@ -7822,38 +7822,6 @@ int __sched __cond_resched(void)
 EXPORT_SYMBOL(__cond_resched);
 #endif
=20
-#ifdef CONFIG_PREEMPT_DYNAMIC
-# ifdef CONFIG_HAVE_PREEMPT_DYNAMIC_CALL
-#  define cond_resched_dynamic_enabled	__cond_resched
-#  define cond_resched_dynamic_disabled	((void *)&__static_call_return0)
-DEFINE_STATIC_CALL_RET0(cond_resched, __cond_resched);
-EXPORT_STATIC_CALL_TRAMP(cond_resched);
-
-#  define might_resched_dynamic_enabled	__cond_resched
-#  define might_resched_dynamic_disabled ((void *)&__static_call_return0)
-DEFINE_STATIC_CALL_RET0(might_resched, __cond_resched);
-EXPORT_STATIC_CALL_TRAMP(might_resched);
-# elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
-static DEFINE_STATIC_KEY_FALSE(sk_dynamic_cond_resched);
-int __sched dynamic_cond_resched(void)
-{
-	if (!static_branch_unlikely(&sk_dynamic_cond_resched))
-		return 0;
-	return __cond_resched();
-}
-EXPORT_SYMBOL(dynamic_cond_resched);
-
-static DEFINE_STATIC_KEY_FALSE(sk_dynamic_might_resched);
-int __sched dynamic_might_resched(void)
-{
-	if (!static_branch_unlikely(&sk_dynamic_might_resched))
-		return 0;
-	return __cond_resched();
-}
-EXPORT_SYMBOL(dynamic_might_resched);
-# endif
-#endif /* CONFIG_PREEMPT_DYNAMIC */
-
 /*
  * __cond_resched_lock() - if a reschedule is pending, drop the given lock,
  * call schedule, and on return reacquire the lock.
@@ -7923,8 +7891,6 @@ EXPORT_SYMBOL(__cond_resched_rwlock_write);
 # endif
=20
 /*
- * SC:cond_resched
- * SC:might_resched
  * SC:preempt_schedule
  * SC:preempt_schedule_notrace
  * SC:irqentry_exit_cond_resched
@@ -7937,16 +7903,12 @@ EXPORT_SYMBOL(__cond_resched_rwlock_write);
  *   (unselectable)
  *
  * FULL:
- *   cond_resched               <- RET0
- *   might_resched              <- RET0
  *   preempt_schedule           <- preempt_schedule
  *   preempt_schedule_notrace   <- preempt_schedule_notrace
  *   irqentry_exit_cond_resched <- irqentry_exit_cond_resched
  *   dynamic_preempt_lazy       <- false
  *
  * LAZY:
- *   cond_resched               <- RET0
- *   might_resched              <- RET0
  *   preempt_schedule           <- preempt_schedule
  *   preempt_schedule_notrace   <- preempt_schedule_notrace
  *   irqentry_exit_cond_resched <- irqentry_exit_cond_resched
@@ -7993,8 +7955,6 @@ static void __sched_dynamic_update(int mode)
 {
 	switch (mode) {
 	case preempt_dynamic_full:
-		preempt_dynamic_disable(cond_resched);
-		preempt_dynamic_disable(might_resched);
 		preempt_dynamic_enable(preempt_schedule);
 		preempt_dynamic_enable(preempt_schedule_notrace);
 		preempt_dynamic_enable(irqentry_exit_cond_resched);
@@ -8004,8 +7964,6 @@ static void __sched_dynamic_update(int mode)
 		break;
=20
 	case preempt_dynamic_lazy:
-		preempt_dynamic_disable(cond_resched);
-		preempt_dynamic_disable(might_resched);
 		preempt_dynamic_enable(preempt_schedule);
 		preempt_dynamic_enable(preempt_schedule_notrace);
 		preempt_dynamic_enable(irqentry_exit_cond_resched);
