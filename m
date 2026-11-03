Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667611;
	b=R4Y9mPvwxf5JICveYVWmz0VV8cN/0PVKMb1u5L2qiMKuN+V7/E6BSb8/RBuJucwWSLXu
	 /kuYlDmljJOhpSUbdAXTqy5kSH/PdopmQV6xUXz495EZxw0Yeffxev54XbslNzcw7Egeo
	 WTy5xDa5w5wnXfBNgFmYM1kaq91UrdIBEmewUn+6sZaiyBOzJVPZXtvm74ELsXbIPbesI
	 uK8vKQceXNPU4htBHRxufV6L56IIwVS82Bg16eHs7JBefVmiT3xcnl03GWqyh3JU/qFiA
	 nPBQENP2zPLH8QNiNc6gbzViUbythRY0OJTxVy+UkBIRYGXlX6T1q84Js5Vyy60IWrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aBqzfHrrrDSrk5+KBnyr/9dxfY5jyomRoQayhm7LPf4=;
	b=BvXT71SekHgM1tT14HstnK+uKJmdubRyCE2K7s/n7p+BuB69QVllK5lz+oI6kp13nnOb
	 nsaSTOWEb/4JA3TC9pGgzYSGNbic7OeTc69WTyszusAAUudENlb8bQPhCGvL386QOJjzP
	 9rmS8kTnvMFUtHR3GZtT4H8+PfcHm9cf12Yo9hLrWIaOOLsVF4jo4jRn37yGOCgJkND59
	 xWOrV8NBecR9rvzTza03rcH0ANrf0YlywPKcHG7IxK+EojDD0emd4pRHqosUJNK7dEm++
	 eswiHCASLmv9GbiJS+1Xva3/x4sjMCBYP09AmVpmfdSzgsDHtyNED0ITqVnQf1DVWOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kX+FeBn+;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73554606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73554606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kX+FeBn+
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so18886395e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793667610; x=1794272410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBqzfHrrrDSrk5+KBnyr/9dxfY5jyomRoQayhm7LPf4=;
        b=kX+FeBn+MO9/tBK3Ovg6/wK6KF0zkKhBxll1tvbZTBtYGlSOCUgpFzAtGwqX9B4AfD
         8YKnxNmMZG+FpBY8cZ8Vm66tFT58z/N+4jGmK2aT3QnghC/cMEKYPok36f9adfyxA7aB
         lhS0GjyqwObzVesH7w7ph/77mpK7IYgz7G/kLG1hHwn8SKhwHvmP+c+9ZgnUX2/JsUFc
         H3Xeq/zv5E5ZuH7NpdW3dIUYytPIKfnlX51QquZtbAyEqeHB+EAp9EwTWhuMEy4t/WvZ
         Epks22BuHRUkfWmCb+yLRzokZuHY+A9IRjDHKIB0GEzqDvYg72gzSFbtChE4yTkKBK58
         vU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667610; x=1794272410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aBqzfHrrrDSrk5+KBnyr/9dxfY5jyomRoQayhm7LPf4=;
        b=jr91FK9P1sAl8aC0HhZ9yPPm9UJOX6dRh/oC6V53KQ+Q+a0EaumHzQ3xHvWWBRqemr
         eTqt2yxFxqF+TNFalBIURL+0wJ4CPdBG7xsuNv9lkHiRWpOFD1LYW71v+Ny7wNMmdpdj
         ofcVnbQZXzQjwFo/eQMzC6bo5Nzb+ZwVpi45+kXf7TgTHnKJgzco4E5TKy6JLVx33B59
         o9x3HKCGgCoroUNtx826T9qepA2xl485WKn3Zq8p+kjcDo8JHA5jgUtl+N5gvdbnRczM
         LzahwnCKDGBambpohJQ6TTp0dvUd5/4DVpgSDE+NrqDGOHLVt1dpcuJcAA42SyEoGwp/
         8JLg==
X-Forwarded-Encrypted: i=1; AKwUvBw5mTK2JmNPBloU5TvbOWqze3JFOP/z7gUsed5KGGv7YCS1xM/JICra7WkWNlBEhtrTDjtO8vLJXz6aIfA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/96kySWCiuM+p9Bjfxger9JjV5jA9lFpDQ3o/zGjhGUA+GWmt
	8fUF8IIAGexuYfxwbF0ZW1cYFC3W6jlZWD/oCZktuVcBeMrWO676lViJt/zUUKDKcUA=
X-Gm-Gg: AYBFou08ekM6jjX8/QBim1wtUt2UhRHbCKnRWEgcs9di4jWlXV5LyLW+odHvu0aVah4
	Tum+w7CEHfXhURqp7AahHlsrOMyCQ2CQFSkxQ0rnMPmZO6b2I0Bm0Aq3uZEO901QUvDFLFD7yOm
	zdvBA64UmHc19m0x1X78Dl7sz/Wub5EJrJ+ExW1MLHi5cjoPGxNmWMu818QZ1CCVsALxXdvaAlY
	SS6d94S4pLOKWlWkSwz/aAsEgQtz7MYj5+z6/npuGnSpdHd1Qt+TeKWSXGutdYKSdp+FjbFfgZN
	XZWf31e9WXmZowH6elkOlti6xH30SgHs5NQULKAT9mVZG/0B2t1cqj2zuMHyn4q9kZNjrdDhIFA
	1Mc14mB9iK/zozh7Uak0IM8GtSGD4r8HZJh8FBoEUn4rodSaoX5HKOK1U0yasAWnrxsdoDx1IBb
	LPeiLck+U5zWD/DfuRx3AEboA+VpAPqN1Hbihi2Oo+tQe4Vu6rM+gVcn5LsJYtUYtF5MGJn16nM
	OYfIq+RWutAR/XGmmY2otofhb2LavN4ZS5vBQXSBbsY/x4YVrc5j+T+Q8IY5SmUMD54DTqPc9hp
	ENE7yMH+/LzhUvf8HIpaYU74FhJ93DuBOn+ebpiS23OhinwnHqOnA6Ezh23tXHds83kgzd6T/2I
	xZw==
X-Received: by 2002:a05:600c:46d1:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4ac17b2c8a7mr263989265e9.25.1793667609838;
        Mon, 02 Nov 2026 17:00:09 -0800 (PST)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9eaeesm22351872f8f.49.2026.11.02.17.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:00:09 -0800 (PST)
From: Qais Yousef <qyousef@layalina.io>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	linux-kernel@vger.kernel.org,
	Qais Yousef <qyousef@layalina.io>
Subject: [PATCH v5 4/4] sched/uclamp: Move uclamp_rq_{inc, dec}() from core.c
Date: Tue,  3 Nov 2026 00:59:53 +0000
Message-ID: <20261103005953.56271-5-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103005953.56271-1-qyousef@layalina.io>
References: <20261103005953.56271-1-qyousef@layalina.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fair and RT throttling can dequeue tasks without going through core
leading to partial dequeue and corrupt rq uclamp state. Fix the problem
by pairing uclamp_rq_{inc, dec}() with {add, sub}_nr_running() so that
each class that cares about uclamp updates the rq state along with the
nr_running.

Remove the sched_delayed guards from uclamp_rq_{inc, dec}() since we now
react at the appropriate time to do the operations and no longer need to
care about this detail. With this gone, the flags parameter can be
dropped too.

Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/core.c    | 33 +++++++++------------------------
 kernel/sched/ext/ext.c |  6 ++----
 kernel/sched/fair.c    |  6 ++----
 kernel/sched/rt.c      | 20 ++++++++++++--------
 kernel/sched/sched.h   |  8 ++++----
 5 files changed, 29 insertions(+), 44 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index a2035d66270b9..bf690d27faf6e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1866,7 +1866,7 @@ static inline void uclamp_rq_dec_id(struct rq *rq, struct task_struct *p,
 	}
 }
 
-static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags)
+void uclamp_rq_inc(struct rq *rq, struct task_struct *p)
 {
 	enum uclamp_id clamp_id;
 
@@ -1879,13 +1879,6 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
 	if (!uclamp_is_used())
 		return;
 
-	if (unlikely(!p->sched_class->uclamp_enabled))
-		return;
-
-	/* Only inc the delayed task which being woken up. */
-	if (p->se.sched_delayed && !(flags & ENQUEUE_DELAYED))
-		return;
-
 	for_each_clamp_id(clamp_id)
 		uclamp_rq_inc_id(rq, p, clamp_id);
 
@@ -1894,7 +1887,7 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
 		uclamp_rq_clear_idle(rq);
 }
 
-static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
+void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
 {
 	enum uclamp_id clamp_id;
 
@@ -1907,12 +1900,6 @@ static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
 	if (!uclamp_is_used())
 		return;
 
-	if (unlikely(!p->sched_class->uclamp_enabled))
-		return;
-
-	if (p->se.sched_delayed)
-		return;
-
 	for_each_clamp_id(clamp_id)
 		uclamp_rq_dec_id(rq, p, clamp_id);
 }
@@ -2151,8 +2138,6 @@ static void __init init_uclamp(void)
 }
 
 #else /* !CONFIG_UCLAMP_TASK: */
-static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags) { }
-static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) { }
 static inline void uclamp_fork(struct task_struct *p) { }
 static inline void uclamp_post_fork(struct task_struct *p) { }
 static inline void init_uclamp(void) { }
@@ -2188,11 +2173,10 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
 		update_rq_clock(rq);
 
 	/*
-	 * Can be before ->enqueue_task() because uclamp considers the
-	 * ENQUEUE_DELAYED task before its ->sched_delayed gets cleared
-	 * in ->enqueue_task().
+	 * Need to be careful what operations are done here, some classes like
+	 * fair and RT can enqueue tasks without going through core due to some
+	 * features like throttling.
 	 */
-	uclamp_rq_inc(rq, p, flags);
 
 	p->sched_class->enqueue_task(rq, p, flags);
 
@@ -2222,10 +2206,11 @@ inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 	psi_dequeue(p, flags);
 
 	/*
-	 * Must be before ->dequeue_task() because ->dequeue_task() can 'fail'
-	 * and mark the task ->sched_delayed.
+	 * Need to be careful what operations are done here, some classes like
+	 * fair and RT can dequeue tasks without going through core due to some
+	 * features like throttling.
 	 */
-	uclamp_rq_dec(rq, p);
+
 	return p->sched_class->dequeue_task(rq, p, flags);
 }
 
diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 0403c46342813..fe0971cdba691 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -2174,6 +2174,7 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int core_enq_
 	p->scx.flags |= SCX_TASK_QUEUED;
 	rq->scx.nr_running++;
 	add_nr_running(rq, 1);
+	uclamp_rq_inc(rq, p);
 
 	if (SCX_HAS_OP(sch, runnable) && !task_on_rq_migrating(p))
 		SCX_CALL_OP_TASK(sch, runnable, rq, p, enq_flags);
@@ -2319,6 +2320,7 @@ static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int core_deq_
 	p->scx.flags &= ~SCX_TASK_QUEUED;
 	rq->scx.nr_running--;
 	sub_nr_running(rq, 1);
+	uclamp_rq_dec(rq, p);
 
 	scx_dispatch_dequeue(rq, p);
 
@@ -5068,10 +5070,6 @@ DEFINE_SCHED_CLASS(ext) = {
 	.prio_changed		= prio_changed_scx,
 
 	.update_curr		= update_curr_scx,
-
-#ifdef CONFIG_UCLAMP_TASK
-	.uclamp_enabled		= 1,
-#endif
 };
 
 s32 scx_init_dsq(struct scx_dispatch_q *dsq, u64 dsq_id, struct scx_sched *sch)
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0feec172fd37e..a518e28538a7f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8210,6 +8210,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 
 	/* At this point se is NULL and we are at root level*/
 	add_nr_running(rq, 1);
+	uclamp_rq_inc(rq, p);
 
 	/*
 	 * Since new tasks are assigned an initial util_avg equal to
@@ -8328,6 +8329,7 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 		__dequeue_entity(cfs_rq, se);
 
 	sub_nr_running(rq, 1);
+	uclamp_rq_dec(rq, p);
 
 	/* balance early to pull high priority tasks */
 	if (unlikely(!was_sched_idle && sched_idle_rq(rq)))
@@ -15886,10 +15888,6 @@ DEFINE_SCHED_CLASS(fair) = {
 #ifdef CONFIG_SCHED_CORE
 	.task_is_throttled	= task_is_throttled_fair,
 #endif
-
-#ifdef CONFIG_UCLAMP_TASK
-	.uclamp_enabled		= 1,
-#endif
 };
 
 void print_cfs_stats(struct seq_file *m, int cpu)
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index cefb0a8d37e81..96d37a1ccc2a8 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1132,8 +1132,12 @@ void inc_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 	inc_rt_prio(rt_rq, prio);
 	inc_rt_group(rt_se, rt_rq);
 
-	if (!group_rt_rq(rt_se))
-		add_nr_running(rq_of_rt_rq(rt_rq), 1);
+	if (!group_rt_rq(rt_se)) {
+		struct rq *rq = rq_of_rt_rq(rt_rq);
+
+		add_nr_running(rq, 1);
+		uclamp_rq_inc(rq, rt_task_of(rt_se));
+	}
 }
 
 static inline
@@ -1147,8 +1151,12 @@ void dec_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 	dec_rt_prio(rt_rq, rt_se_prio(rt_se));
 	dec_rt_group(rt_se, rt_rq);
 
-	if (!group_rt_rq(rt_se))
-		sub_nr_running(rq_of_rt_rq(rt_rq), 1);
+	if (!group_rt_rq(rt_se)) {
+		struct rq *rq = rq_of_rt_rq(rt_rq);
+
+		sub_nr_running(rq, 1);
+		uclamp_rq_dec(rq, rt_task_of(rt_se));
+	}
 }
 
 /*
@@ -2578,10 +2586,6 @@ DEFINE_SCHED_CLASS(rt) = {
 #ifdef CONFIG_SCHED_CORE
 	.task_is_throttled	= task_is_throttled_rt,
 #endif
-
-#ifdef CONFIG_UCLAMP_TASK
-	.uclamp_enabled		= 1,
-#endif
 };
 
 #ifdef CONFIG_RT_GROUP_SCHED
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 0cab55963657c..40876533defdd 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2650,10 +2650,6 @@ enum snt_e {
 
 struct sched_class {
 
-#ifdef CONFIG_UCLAMP_TASK
-	int uclamp_enabled;
-#endif
-
 	/*
 	 * move_queued_task/activate_task/enqueue_task: rq->lock
 	 * ttwu_do_activate/activate_task/enqueue_task: rq->lock
@@ -3703,6 +3699,8 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
 
 unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
 void init_uclamp_rq(struct rq *rq);
+void uclamp_rq_inc(struct rq *rq, struct task_struct *p);
+void uclamp_rq_dec(struct rq *rq, struct task_struct *p);
 
 /*
  * When uclamp is compiled in, the aggregation at rq level is 'turned off'
@@ -3812,6 +3810,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
 }
 
 static inline void init_uclamp_rq(struct rq *rq) {}
+static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p) {}
+static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) {}
 
 static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
 
-- 
2.53.0

