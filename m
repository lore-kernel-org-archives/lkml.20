Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413734;
	b=2n+G3UzpzHwIb53/ocvE017afliG7mtx6MVbm0LYBsNnbhESCT7iL9BSawwNxCpBOkui
	 03VwOK70j3H17Hhvr7e9OCRWcbCwLC61ffsAUxqTriG3mozipqPHfiGdExYNTLAlT1hX8
	 X7G1xcIR9QI1bHKNnCW1nqZkGrqSIIQLS0zOHAuZw8PERPpmkETfqh8cSy5zPH65LkGwn
	 p+8IPnaaMTtFS+zmoV4A+4845FivgfLjOL4mX7VxViOgq1ud3ECViPdFZSe+9gcy7Swwb
	 2tFWvei2w5k3+ORmBvgDCfEtWjCV3KEAc8wzbpfG7Hjr4RJRzElE75zHWKlPB4yyVIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413734;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=VKVZDuo43HDlgu6gOEYkUkH86H3I7WTmhbeGGpDOkGg=;
	b=baTqt/JCc8kwPgrYoHoGF/h6DsE3gD3ldMD/ZB+ZT2/LOv0ABDAWDPEv+a/02L3YZMTX
	 Ic8IQFoDFuvgEDmCHiueh+zI20eLiTJReYLfETHWBKNR1qYUp2Lad/YmR1qtva4QvqZ7P
	 hdp6riRT0lDbvSR9+ciY8Lke2IZorxvprzwxYxKOUPlIsL231UCXR/nUxNQyiHfoJME0y
	 iYDWq9NAqzPyXG2PBIDRATYFvR74v/Q3VcJ7FgdPfAEhWe3zxj/XQdbxnmWHkcvrhInvb
	 RTtd3GHHWDeNkPMkgFWHFwEcqIbOP5zkM2l3CUSodHywoOVx6Sh+SeKhbzqtQ663Mdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CHBNpW0b;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23122606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23122606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CHBNpW0b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VKVZDuo43HDlgu6gOEYkUkH86H3I7WTmhbeGGpDOkGg=; b=CHBNpW0baXKgM/vEfq+f7+aypQ
	d8ZbOtLs7oqqWRkyn5DCFKw3Yd/deF+oyBP5lOQkkxKusfZMZoor7/UI1O+9pmG6rnSwakg2gPPj6
	aLLcjCj3Q0hHpmMR3jDW3uoTBadLKFOylP/L6vbRKyyJ/5gZ9EssEHLRC56fPMPDhtcfs6MJ8ftTz
	0eG63vKAQcpytW/mMl+1/vRVAf7Ye3Zvf9gb6/ABpI5fxAvITAIHlmzJdikaZNNrdEDPZ4nqnRuFb
	HlJgC9s02RRE8ho5YgqHQLxpIAQihuer0KcV9SofX7NUkxmpz5UuOWBpSPquX7tD5nFPPHWL5uicO
	7EP04rjQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAyp-00000009K8T-3ug4;
	Wed, 11 Nov 2026 16:15:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 97C8A30031E; Wed, 11 Nov 2026 17:15:22 +0100 (CET)
Date: Wed, 11 Nov 2026 17:15:22 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, mingo@kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 12/12] sched: Remove sched_class::balance()
Message-ID: <20261111161522.GD1922751@noisy.programming.kicks-ass.net>
References: <20261107115913.261163891@infradead.org>
 <20261107120208.153536827@infradead.org>
 <a98c40701cc874318e7fe475d90795c6@kernel.org>
 <20261111130512.GO2668200@noisy.programming.kicks-ass.net>
 <20261111131152.GD2669272@noisy.programming.kicks-ass.net>
 <avRzGYNT-_p3KP9R@scheduler.schedules>
 <20261111154724.GO1779021@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111154724.GO1779021@noisy.programming.kicks-ass.net>

On Wed, Nov 11, 2026 at 04:47:24PM +0100, Peter Zijlstra wrote:
> On Wed, Nov 11, 2026 at 05:57:01PM +0300, Kayra Cizmeci wrote:
> > Hi Peter!
> 
> > Let's say a fair task named TA is working in CPU1, a DL task named DA is
> > waking up. We enter the normal wakeup path, and call enqueue_task_dl()
> > and from there enqueue_dl_entity(). enqueue_dl_entity() sets next_class
> > to dl_sched_class. Later enqueue, when we call wakeup_preempt TA does
> > not gets preempted because:
> > 
> > void wakeup_preempt(struct rq *rq, struct task_struct *p, int flags)
> > {
> > 	struct task_struct *donor = rq->donor;
> > 
> > 	if (p->sched_class == rq->next_class) {
> > 		rq->next_class->wakeup_preempt(rq, p, flags);
> > 
> 
> Gah, you're right. This don't work right. Let me try again.

Here, something like so then?

---
Subject: sched/deadline: Fix wakeup_preempt() vs dl_server
From: Peter Zijlstra <peterz@infradead.org>
Date: Wed Nov 11 14:12:25 CET 2026

Tejun noted that dl_se enqueues from timers, esp. those for dl_server, do not
pass through wakeup_preempt() and will not cause rq->next_class to be bumped.
As such, when such an enqueue happend in the middle of schedule(), this might
cause a failure to restart the pick and run a lower class entity.

Fixes: 704069649b5b ("sched/core: Rework sched_class::wakeup_preempt() and rq_modified_*()")
Reported-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/deadline.c |   40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -715,8 +715,7 @@ static struct rq *dl_task_offline_migrat
 	return later_rq;
 }
 
-static void
-enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags);
+static void enqueue_dl_entity(struct rq *rq, struct sched_dl_entity *dl_se, int flags);
 static void enqueue_task_dl(struct rq *rq, struct task_struct *p, int flags);
 static void dequeue_dl_entity(struct sched_dl_entity *dl_se, int flags);
 static void wakeup_preempt_dl(struct rq *rq, struct task_struct *p, int flags);
@@ -1184,10 +1183,7 @@ static enum hrtimer_restart dl_server_ti
 			dl_se->dl_defer_running = 1;
 		}
 
-		enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
-
-		if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &dl_se->rq->curr->dl))
-			resched_curr(rq);
+		enqueue_dl_entity(rq, dl_se, ENQUEUE_REPLENISH);
 
 		__push_dl_task(rq, rf);
 	}
@@ -1520,7 +1516,7 @@ static void update_curr_dl_se(struct rq
 					replenish_dl_new_period(dl_se, rq);
 					start_dl_timer(dl_se);
 				} else {
-					enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
+					enqueue_dl_entity(rq, dl_se, ENQUEUE_REPLENISH);
 				}
 			} else {
 				enqueue_task_dl(rq, dl_task_of(dl_se), ENQUEUE_REPLENISH);
@@ -1812,9 +1808,7 @@ void dl_server_start(struct sched_dl_ent
 
 	trace_sched_dl_server_start_tp(dl_se, cpu_of(rq), dl_get_type(dl_se, rq));
 	dl_se->dl_server_active = 1;
-	enqueue_dl_entity(dl_se, ENQUEUE_WAKEUP);
-	if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
-		resched_curr(dl_se->rq);
+	enqueue_dl_entity(rq, dl_se, ENQUEUE_WAKEUP);
 }
 
 void dl_server_stop(struct sched_dl_entity *dl_se)
@@ -2379,8 +2373,8 @@ static void __dequeue_dl_entity(struct s
 	dec_dl_tasks(dl_se, dl_rq);
 }
 
-static void
-enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags)
+static bool
+_enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags)
 {
 	WARN_ON_ONCE(on_dl_rq(dl_se));
 
@@ -2418,7 +2412,7 @@ enqueue_dl_entity(struct sched_dl_entity
 		if (flags & ENQUEUE_WAKEUP)
 			task_contending(dl_se, flags);
 
-		return;
+		return false;
 	}
 
 	/*
@@ -2442,7 +2436,7 @@ enqueue_dl_entity(struct sched_dl_entity
 	 * deferred task and still got to wait, don't enqueue.
 	 */
 	if (dl_se->dl_throttled && start_dl_timer(dl_se))
-		return;
+		return false;
 
 	/*
 	 * We're about to enqueue, make sure we're not ->dl_throttled!
@@ -2457,6 +2451,22 @@ enqueue_dl_entity(struct sched_dl_entity
 	}
 
 	__enqueue_dl_entity(dl_se);
+	return true;
+}
+
+static void enqueue_dl_entity(struct rq *rq, struct sched_dl_entity *dl_se, int flags)
+{
+	/*
+	 * Deadline can enqueue entities from various timers; and esp.
+	 * dl_server() entities will not pass through wakeup_preempt().
+	 */
+	if (!_enqueue_dl_entity(dl_se, flags))
+		return;
+
+	if (!dl_task(rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
+		resched_curr(dl_se->rq);
+
+	rq->next_class = &dl_sched_class;
 }
 
 static void dequeue_dl_entity(struct sched_dl_entity *dl_se, int flags)
@@ -2534,7 +2544,7 @@ static void enqueue_task_dl(struct rq *r
 	if (task_on_rq_migrating(p))
 		flags |= ENQUEUE_MIGRATING;
 
-	enqueue_dl_entity(dl_se, flags);
+	enqueue_dl_entity(rq, dl_se, flags);
 
 	if (dl_server(dl_se))
 		return;
