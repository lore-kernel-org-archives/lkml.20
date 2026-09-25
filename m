Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6CF493D24;
	Fri, 25 Sep 2026 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333658; cv=none; b=LzKgimuekim3xt0smrkM2zUAqiniuwcpPor9l4r1pI+8HUJZu2Fnbsr4kZVwEJQjJIAjfwTZ/M5OLPYlHdzVGaoKSOMelIChXwLRh4TbYU5XIHa7gzNU8UaHlHdxB6E6EcylD8GxiYOwe1Kx5Txtr5s2fu+lkAlXaFM3+Bg/OIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333658; c=relaxed/simple;
	bh=hnFuhaAmves0TbCwlufh91fMAAN9ahL72KQ2D+zNIvE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=SVraoFAikNAlDOXop2lX7YrbHqmioai4mr5ope6TuwoLqP75fZPVow8/HsIoc0nsmPuyPY9F80yH1H3bwm0ohwQBloN1W1sqHmMSO89KYCC3j05hQRxUioAfYA4szkNKLe9Bw6st8oWLXwFuwAgyCPjrl7PiywOmhBzdT2I6+SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sGbW1avO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ESlvIJe7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sGbW1avO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ESlvIJe7"
Date: Fri, 25 Sep 2026 10:54:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333655;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gThi9kguRloct2esxWqw0rt7p0IOPzl4Y35nPuqNpXw=;
	b=sGbW1avO1IN4CL6nmiofBI1Pt8ZJkQ0VMRkK1vSCcdJu72WrObdkqsU4ANw8+6blC6dbNW
	D5bmof+I0gQZdq4hbdTN3+RzGuRIif0UgaOR0XUy+p7bHxyxvJyjjdJeDJBCWoRXo8XYjQ
	RR0YzsJGjcGJjJ8qv63BW5krhFwKwKnZZJEepXNLPGRlRHGrWX9I6rJisNlaORyzsclktL
	fWIY1pH6wPwN/Qi59xF9Th+hp3OBqowEUFgZF8x4HcMJMyWrMpb6NKqfw2xTG+GJzszbI0
	ldcaQPJkROzKZyLdv6+S+Ya0HrZUyvwqujpcPjf9ozZQVtm0ll75QzrZ3Py8IA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333655;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gThi9kguRloct2esxWqw0rt7p0IOPzl4Y35nPuqNpXw=;
	b=ESlvIJe7+TPiZGkXAi1zsPQMU4zwd6dA6/p5Dff2fKGa+rQbbe2tBx+FLPUJCASi4Z4WIj
	oVMN6KIPS0tntTAA==
From: "tip-bot2 for Shubhang Kaushik (Ampere)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched: Restart fair hrtick after same-task repicks
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
 Zhan Xusheng <zhanxusheng@xiaomi.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260917-sched-fair-hrtick-restart-v4-1-4dd1414da81a@gentwo.org>
References: <20260917-sched-fair-hrtick-restart-v4-1-4dd1414da81a@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033365349.2819794.3113821108284833728.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     c72945693b90423f1b46ac2dbc8749c2b7804fc8
Gitweb:        https://git.kernel.org/tip/c72945693b90423f1b46ac2dbc8749c2b78=
04fc8
Author:        Shubhang Kaushik (Ampere) <sh@gentwo.org>
AuthorDate:    Thu, 17 Sep 2026 16:06:59 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:57 +02:00

sched: Restart fair hrtick after same-task repicks

Fair hrticks are one-shot timers. A same-task repick after hrtick expiry
skips set_next_task_fair() and leaves no hrtick armed for the next fair
preemption point:

    hrtick()
      -> task_tick_fair(..., queued=3D1)
         -> entity_tick()
            -> resched_curr()
      -> schedule()
         -> pick_task_fair() selects current
         -> put_prev_set_next_task(rq, prev, next)
            -> next =3D=3D prev
            -> return

Introduce SNT_REPICK for the next =3D=3D prev path:

    put_prev_set_next_task(rq, prev, next)
      -> next =3D=3D prev
      -> next->sched_class->set_next_task(rq, next, SNT_REPICK)
         -> set_next_task_fair()
            -> hrtick_start_fair()

set_next_task_fair() skips task-transition work for SNT_REPICK and
restarts the fair hrtick. hrtick_start() records the delay during
schedule(), and hrtick_schedule_exit() rearms the timer.

Do not restart the SCHED_DEADLINE hrtick for SNT_REPICK. Same-task
repicks skip put_prev_task() for both fair and SCHED_DEADLINE, but
pick_task_fair() refreshes the selected fair entity before selecting it
again. hrtick_start_fair() reads that refreshed entity, including with
group scheduling.

The SCHED_DEADLINE picker has no corresponding current-runtime update.
Restarting its hrtick on SNT_REPICK could therefore use stale
dl_se->runtime and delay the next runtime enforcement point.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Link: https://patch.msgid.link/20260917-sched-fair-hrtick-restart-v4-1-4dd141=
4da81a@gentwo.org
---
 kernel/sched/core.c      |  2 +-
 kernel/sched/deadline.c  |  7 +++++--
 kernel/sched/ext/ext.c   |  5 ++++-
 kernel/sched/fair.c      | 21 ++++++++++++++++-----
 kernel/sched/idle.c      |  5 ++++-
 kernel/sched/rt.c        |  7 +++++--
 kernel/sched/sched.h     | 16 ++++++++++++----
 kernel/sched/stop_task.c |  5 ++++-
 8 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5a61650..d368aaf 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7240,7 +7240,7 @@ pick_again:
 			 * on_cpu.
 			 */
 			donor->sched_class->put_prev_task(rq, donor, donor);
-			donor->sched_class->set_next_task(rq, donor, true);
+			donor->sched_class->set_next_task(rq, donor, SNT_PICK);
 		}
 	} else {
 		rq_set_donor(rq, next);
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index de6a361..c0ebdcd 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2773,11 +2773,14 @@ static void start_hrtick_dl(struct rq *rq, struct sch=
ed_dl_entity *dl_se)
  * DL keeps current in tree, because ->deadline is not typically changed whi=
le
  * a task is runnable.
  */
-static void set_next_task_dl(struct rq *rq, struct task_struct *p, bool firs=
t)
+static void set_next_task_dl(struct rq *rq, struct task_struct *p, enum snt_=
e type)
 {
 	struct sched_dl_entity *dl_se =3D &p->dl;
 	struct dl_rq *dl_rq =3D &rq->dl;
=20
+	if (type =3D=3D SNT_REPICK)
+		return;
+
 	p->se.exec_start =3D rq_clock_task(rq);
 	if (on_dl_rq(&p->dl))
 		update_stats_wait_end_dl(dl_rq, dl_se);
@@ -2788,7 +2791,7 @@ static void set_next_task_dl(struct rq *rq, struct task=
_struct *p, bool first)
 	WARN_ON_ONCE(dl_rq->curr);
 	dl_rq->curr =3D dl_se;
=20
-	if (!first)
+	if (type !=3D SNT_PICK)
 		return;
=20
 	if (rq->donor->sched_class !=3D &dl_sched_class)
diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 10af28a..53275bc 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -3001,10 +3001,13 @@ has_tasks:
 	return verdict;
 }
=20
-static void set_next_task_scx(struct rq *rq, struct task_struct *p, bool fir=
st)
+static void set_next_task_scx(struct rq *rq, struct task_struct *p, enum snt=
_e type)
 {
 	struct scx_sched *sch =3D scx_task_sched(p);
=20
+	if (type =3D=3D SNT_REPICK)
+		return;
+
 	if (p->scx.flags & SCX_TASK_QUEUED) {
 		/*
 		 * Core-sched might decide to execute @p before it is
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a42360c..36861f4 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15234,14 +15234,18 @@ static void switched_to_fair(struct rq *rq, struct =
task_struct *p)
 	}
 }
=20
-static void set_next_task_fair(struct rq *rq, struct task_struct *p, bool fi=
rst)
+static void set_next_task_fair(struct rq *rq, struct task_struct *p, enum sn=
t_e type)
 {
 	struct sched_entity *se =3D &p->se;
-	bool throttled =3D false;
 	struct cfs_rq *cfs_rq =3D &rq->cfs;
 	unsigned long weight =3D NICE_0_LOAD;
+	bool first =3D type =3D=3D SNT_PICK;
+	bool throttled =3D false;
 	bool on_rq =3D se->on_rq;
=20
+	if (type =3D=3D SNT_REPICK)
+		goto repick;
+
 	clear_buddies(cfs_rq, se);
=20
 	if (on_rq)
@@ -15285,11 +15289,18 @@ static void set_next_task_fair(struct rq *rq, struc=
t task_struct *p, bool first)
=20
 	WARN_ON_ONCE(se->sched_delayed);
=20
-	if (hrtick_enabled_fair(rq))
-		hrtick_start_fair(rq, p);
-
 	update_misfit_status(p, rq);
 	sched_fair_update_stop_tick(rq, p);
+
+repick:
+	/*
+	 * A same-task repick skips put_prev_task_fair(), but
+	 * pick_task_fair() refreshed the entity hrtick_start_fair() reads
+	 * before selecting it again. rq->cfs.curr identifies that entity,
+	 * including with group scheduling.
+	 */
+	if (hrtick_enabled_fair(rq))
+		hrtick_start_fair(rq, p);
 }
=20
 void init_cfs_rq(struct cfs_rq *cfs_rq)
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index eb73b65..76f3c84 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -487,8 +487,11 @@ static void put_prev_task_idle(struct rq *rq, struct tas=
k_struct *prev, struct t
 	update_rq_avg_idle(rq);
 }
=20
-static void set_next_task_idle(struct rq *rq, struct task_struct *next, bool=
 first)
+static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum=
 snt_e type)
 {
+	if (type =3D=3D SNT_REPICK)
+		return;
+
 	update_idle_core(rq);
 	scx_update_idle(rq, true, true);
 	schedstat_inc(rq->sched_goidle);
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 85303ad..1535046 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1654,11 +1654,14 @@ static void wakeup_preempt_rt(struct rq *rq, struct t=
ask_struct *p, int flags)
 		check_preempt_equal_prio(rq, p);
 }
=20
-static inline void set_next_task_rt(struct rq *rq, struct task_struct *p, bo=
ol first)
+static inline void set_next_task_rt(struct rq *rq, struct task_struct *p, en=
um snt_e type)
 {
 	struct sched_rt_entity *rt_se =3D &p->rt;
 	struct rt_rq *rt_rq =3D &rq->rt;
=20
+	if (type =3D=3D SNT_REPICK)
+		return;
+
 	p->se.exec_start =3D rq_clock_task(rq);
 	if (on_rt_rq(&p->rt))
 		update_stats_wait_end_rt(rt_rq, rt_se);
@@ -1666,7 +1669,7 @@ static inline void set_next_task_rt(struct rq *rq, stru=
ct task_struct *p, bool f
 	/* The running task is never eligible for pushing */
 	dequeue_pushable_task(rq, p);
=20
-	if (!first)
+	if (type !=3D SNT_PICK)
 		return;
=20
 	/*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c3ad70..1b64be5 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2630,6 +2630,12 @@ struct affinity_context {
=20
 extern s64 update_curr_common(struct rq *rq);
=20
+enum snt_e {
+	SNT_NORMAL,	/* set_next_task() */
+	SNT_PICK,	/* put_prev_set_next_task(): prev !=3D next */
+	SNT_REPICK,	/* put_prev_set_next_task(): prev =3D=3D next */
+};
+
 struct sched_class {
=20
 #ifdef CONFIG_UCLAMP_TASK
@@ -2687,7 +2693,7 @@ struct sched_class {
 	 * __schedule: rq->lock
 	 */
 	void (*put_prev_task)(struct rq *rq, struct task_struct *p, struct task_str=
uct *next);
-	void (*set_next_task)(struct rq *rq, struct task_struct *p, bool first);
+	void (*set_next_task)(struct rq *rq, struct task_struct *p, enum snt_e type=
);
=20
 	/*
 	 * select_task_rq: p->pi_lock
@@ -2790,7 +2796,7 @@ static inline void put_prev_task(struct rq *rq, struct =
task_struct *prev)
=20
 static inline void set_next_task(struct rq *rq, struct task_struct *next)
 {
-	next->sched_class->set_next_task(rq, next, false);
+	next->sched_class->set_next_task(rq, next, SNT_NORMAL);
 }
=20
 static inline void
@@ -2811,11 +2817,13 @@ static inline void put_prev_set_next_task(struct rq *=
rq,
=20
 	__put_prev_set_next_dl_server(rq, prev, next);
=20
-	if (next =3D=3D prev)
+	if (next =3D=3D prev) {
+		next->sched_class->set_next_task(rq, next, SNT_REPICK);
 		return;
+	}
=20
 	prev->sched_class->put_prev_task(rq, prev, next);
-	next->sched_class->set_next_task(rq, next, true);
+	next->sched_class->set_next_task(rq, next, SNT_PICK);
 }
=20
 /*
diff --git a/kernel/sched/stop_task.c b/kernel/sched/stop_task.c
index c909ca0..1e0109e 100644
--- a/kernel/sched/stop_task.c
+++ b/kernel/sched/stop_task.c
@@ -27,8 +27,11 @@ wakeup_preempt_stop(struct rq *rq, struct task_struct *p, =
int flags)
 	/* we're never preempted */
 }
=20
-static void set_next_task_stop(struct rq *rq, struct task_struct *stop, bool=
 first)
+static void set_next_task_stop(struct rq *rq, struct task_struct *stop, enum=
 snt_e type)
 {
+	if (type =3D=3D SNT_REPICK)
+		return;
+
 	stop->se.exec_start =3D rq_clock_task(rq);
 }
=20
