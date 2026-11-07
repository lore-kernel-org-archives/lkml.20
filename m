Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052975;
	b=bROM4lAez3l9S9aWLLe6evDysrT9aDzD1QhBSmibzXGgD1lWVVsn8coKG+sYcKjiyEl1
	 l3dgnLS2Zj/GSfOgODQrYtdKvnGAeJfmzh1ZatWxAktXzMqBNdBlBjcDRIRFMgaNKAVic
	 sFK3P9HObp5jSSNUdLqA3d0gd0GMHqZa39pbjicLZar/jG2peHfVU6lbLXQKV5HkJlYGG
	 8G2LTIDnZFyeNEMVn7MBKCgpLBCVXonC9lEMM+HBxjmvnaTF1m9fsDDlW9wMlzPZngKaj
	 vTw2sA/uLhWl2kvmFzMQyXLy0F13u4LukZigQSC1Vg1weBoe+qUtN/z72fR6DVmGa1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052975;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=KuLz3vefNn5xh9zIM0MFtxrM6rHYInTb9vA6g+BILSA=;
	b=dTBkACmoruWVZl248UPPBDXh9SHPVkkUybKrvueV9Pt6TjT4FL5+oxKF8kSdEq2XT8v6
	 llpvCZ2V+brpNZUQG0oJJ8BJtNH8YTHq6zOXHcn1OTp0DFMFGXiB561nUPgR2pIvUfkxp
	 IODQq7km7QYfqa+Fa5hOnYWjdiyABTcrGMPYC5OCUVwYT/RpvSIqJJBIKUD/c961kr8lV
	 MjAD4CxyvVtXqk9pPPUJZJYZzkQgCHpBW0/oi4h+TRZ6K1YDCqhr5D6fzWDktuRBoQ8H7
	 Jmk1hwCE0ZhasjKVELiwwKPdMrx3N2qlF5DxF61iefAxlgp8m3SSLlwo9vwX2W4ZTxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=wJWIT4md;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EA8606A334
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42EA8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=wJWIT4md
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=KuLz3vefNn5xh9zIM0MFtxrM6rHYInTb9vA6g+BILSA=; b=wJWIT4mdFvW2ONdk03zLUPMfwg
	+eWO+HcJ8bZhk7E9L+fDda4MKYn3VKRhLEY/YYxi9CKsufPBSjepBmTIC8Fd8Uum5L9gQuAul2+O+
	xiRIo6IQ0o08Ws6B8KgXQaGg/5UR65dhXHDgIb8geh8B9CU8a6L8e+F5Vo9RYnOLnQdRCXebwpaT2
	A/Ze13EITnGAub1BA9HoIgF+H48TMpxnQs/UBmtadkUG8g8OH4HceW+chl0GgvRq1emK82niHHmnF
	BP90abOEjo0jfvigEeh4XgkWFzJWM9S5N/gVDKV07z7wx1fWSUyd/+l/ssAhDxfvy7+j7jH/cK5KA
	H868KUTQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPf8B-000000008zB-0Zbr;
	Sat, 07 Nov 2026 12:02:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 45742303315; Sat, 07 Nov 2026 13:02:45 +0100 (CET)
Message-ID: <20261107120208.153536827@infradead.org>
User-Agent: quilt/0.68
Date: Sat, 07 Nov 2026 12:59:25 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org,
 tj@kernel.org,
 ziqianlu@bytedance.com
Subject: [PATCH v2 12/12] sched: Remove sched_class::balance()
References: <20261107115913.261163891@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Ever since commit 50653216e4ff ("sched: Add support to pick functions to take
rf"), we have the unfortunate situation that both sched_class::balance() and
sched_class::pick_task() have overlapping functionality in that they drop
rq->lock and balance tasks.

Additionally, prev_balance() is only called for a single RQ in the core-sched
case, resulting in 'missed' balance opportunities in this case.

Just like pick_task(), prev_balance() would iterate the classes and stop when
there is a runnable task found. The only difference is that pick_task() starts
from the top class, while prev_balance() would start from prev->class.

This means that if prev was an RT task, we'd get an extra visit to balance_dl()
-- and similary, if prev is fair, we'd visit balance_{dl,rt}() both. However,
this is not a problem, because both need_pull_{dl,rt}_task() will DTRT.

Therefore, move balance_{rt,dl}() into pick_task_{rt,dl}() and remove
sched_class::balance().

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c      |   23 -----------------------
 kernel/sched/deadline.c  |   10 ++++++----
 kernel/sched/idle.c      |    7 -------
 kernel/sched/rt.c        |   14 ++++++--------
 kernel/sched/sched.h     |    5 -----
 kernel/sched/stop_task.c |    7 -------
 6 files changed, 12 insertions(+), 54 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6185,25 +6185,6 @@ static inline void schedule_debug(struct
 	schedstat_inc(this_rq()->sched_count);
 }
 
-static void prev_balance(struct rq *rq, struct rq_flags *rf)
-{
-	const struct sched_class *start_class = rq->donor->sched_class;
-	const struct sched_class *class;
-
-	/*
-	 * We must do the balancing pass before put_prev_task(), such
-	 * that when we release the rq->lock the task is in the same
-	 * state as before we took rq->lock.
-	 *
-	 * We can terminate the balance pass as soon as we know there is
-	 * a runnable task of @class priority or higher.
-	 */
-	for_active_class_range(class, start_class, &idle_sched_class) {
-		if (class->balance && class->balance(rq, rf))
-			break;
-	}
-}
-
 /*
  * Pick up the highest-prio task:
  */
@@ -6241,8 +6222,6 @@ __pick_next_task(struct rq *rq, struct r
 	}
 
 restart:
-	prev_balance(rq, rf);
-
 	for_each_active_class(class) {
 		p = class->pick_task(rq, rf);
 		if (unlikely(p == RETRY_TASK))
@@ -6348,8 +6327,6 @@ pick_next_task(struct rq *rq, struct rq_
 		goto out_set_next;
 	}
 
-	prev_balance(rq, rf);
-
 	smt_mask = cpu_smt_mask(cpu);
 
 restart:
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2705,7 +2705,7 @@ static void check_preempt_equal_dl(struc
 	resched_curr(rq);
 }
 
-static int balance_dl(struct rq *rq, struct rq_flags *rf)
+static void balance_dl(struct rq *rq, struct rq_flags *rf)
 {
 	/*
 	 * Note, rq->donor may change during rq lock drops,
@@ -2724,8 +2724,6 @@ static int balance_dl(struct rq *rq, str
 		pull_dl_task(rq);
 		rq_repin_lock(rq, rf);
 	}
-
-	return sched_stop_runnable(rq) || sched_dl_runnable(rq);
 }
 
 /*
@@ -2823,6 +2821,11 @@ static struct task_struct *__pick_task_d
 	struct dl_rq *dl_rq = &rq->dl;
 	struct task_struct *p;
 
+	rq_modified_begin(rq, &dl_sched_class);
+	balance_dl(rq, rf);
+	if (rq_modified_above(rq, &dl_sched_class))
+		return RETRY_TASK;
+
 again:
 	if (!sched_dl_runnable(rq))
 		return NULL;
@@ -3654,7 +3657,6 @@ DEFINE_SCHED_CLASS(dl) = {
 	.put_prev_task		= put_prev_task_dl,
 	.set_next_task		= set_next_task_dl,
 
-	.balance		= balance_dl,
 	.select_task_rq		= select_task_rq_dl,
 	.migrate_task_rq	= migrate_task_rq_dl,
 	.set_cpus_allowed       = set_cpus_allowed_dl,
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -468,12 +468,6 @@ select_task_rq_idle(struct task_struct *
 	return task_cpu(p); /* IDLE tasks as never migrated */
 }
 
-static int
-balance_idle(struct rq *rq, struct rq_flags *rf)
-{
-	return WARN_ON_ONCE(1);
-}
-
 /*
  * Idle tasks are unconditionally rescheduled:
  */
@@ -594,7 +588,6 @@ DEFINE_SCHED_CLASS(idle) = {
 	.put_prev_task		= put_prev_task_idle,
 	.set_next_task          = set_next_task_idle,
 
-	.balance		= balance_idle,
 	.select_task_rq		= select_task_rq_idle,
 	.set_cpus_allowed	= set_cpus_allowed_common,
 
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1596,7 +1596,7 @@ static void check_preempt_equal_prio(str
 	resched_curr(rq);
 }
 
-static int balance_rt(struct rq *rq, struct rq_flags *rf)
+static void balance_rt(struct rq *rq, struct rq_flags *rf)
 {
 	/*
 	 * Note, rq->donor may change during rq lock drops,
@@ -1615,8 +1615,6 @@ static int balance_rt(struct rq *rq, str
 		pull_rt_task(rq);
 		rq_repin_lock(rq, rf);
 	}
-
-	return sched_stop_runnable(rq) || sched_dl_runnable(rq) || sched_rt_runnable(rq);
 }
 
 /*
@@ -1718,14 +1716,15 @@ static struct task_struct *_pick_next_ta
 
 static struct task_struct *pick_task_rt(struct rq *rq, struct rq_flags *rf)
 {
-	struct task_struct *p;
+	rq_modified_begin(rq, &rt_sched_class);
+	balance_rt(rq, rf);
+	if (rq_modified_above(rq, &rt_sched_class))
+		return RETRY_TASK;
 
 	if (!sched_rt_runnable(rq))
 		return NULL;
 
-	p = _pick_next_task_rt(rq);
-
-	return p;
+	return _pick_next_task_rt(rq);
 }
 
 static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_struct *next)
@@ -2616,7 +2615,6 @@ DEFINE_SCHED_CLASS(rt) = {
 	.put_prev_task		= put_prev_task_rt,
 	.set_next_task          = set_next_task_rt,
 
-	.balance		= balance_rt,
 	.select_task_rq		= select_task_rq_rt,
 	.set_cpus_allowed       = set_cpus_allowed_common,
 	.rq_online              = rq_online_rt,
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2785,11 +2785,6 @@ struct sched_class {
 	void (*wakeup_preempt)(struct rq *rq, struct task_struct *p, int flags);
 
 	/*
-	 * schedule/pick_next_task/prev_balance: rq->lock
-	 */
-	int (*balance)(struct rq *rq, struct rq_flags *rf);
-
-	/*
 	 * schedule/pick_next_task: rq->lock
 	 */
 	struct task_struct *(*pick_task)(struct rq *rq, struct rq_flags *rf);
--- a/kernel/sched/stop_task.c
+++ b/kernel/sched/stop_task.c
@@ -15,12 +15,6 @@ select_task_rq_stop(struct task_struct *
 	return task_cpu(p); /* stop tasks as never migrate */
 }
 
-static int
-balance_stop(struct rq *rq, struct rq_flags *rf)
-{
-	return sched_stop_runnable(rq);
-}
-
 static void
 wakeup_preempt_stop(struct rq *rq, struct task_struct *p, int flags)
 {
@@ -110,7 +104,6 @@ DEFINE_SCHED_CLASS(stop) = {
 	.put_prev_task		= put_prev_task_stop,
 	.set_next_task          = set_next_task_stop,
 
-	.balance		= balance_stop,
 	.select_task_rq		= select_task_rq_stop,
 	.set_cpus_allowed	= set_cpus_allowed_common,
 


