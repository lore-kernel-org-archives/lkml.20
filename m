Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402322;
	b=kAwMPevoqnRwKidKi9cuawv+TEEi63GQdbqHd8O/TeZdBc5UxdE13P9VsS6vWnx/NiuM
	 puY7c0mO9Y/kRyCZtHSaQHGLD33ERCnp9nDljlvmQmJhLSx6ZB74J1cSmThKi58M8K3sh
	 OZ/o6CPvncEZ8W23YEocVwuvWydukxcZApPKn8FBky7c+adLK/a58XKeztHJhhaMTKfo4
	 UpC5nr1mCdWCwPSNRYgAN9NoVlEiMMtqWuuWTzz9issWVZAPltvlbO5rdo4RLIggpqUPp
	 OeLIQKOfFULXYEBDCogYf5U8ad30dZTBYkNSrxgEkrW3dhMTo8GjT+R4loadtTmi3TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402322;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=S41CW/yU6kvATbYfyKjSfhuD72c6aPCh1dg40hUL4mA=;
	b=RZ3rORE44+f8ciDLHJ+cjqrWUxKSaRWDmZCjAqs06YtjMhpDTm3hK11kTBzzvanXtygI
	 KHymZ/zo4Jjmlax/oM5LAS9W63XhM41j9XWPO/c5DJ/0isTEO5dLXlsuYZr9S3marqryy
	 4lemopdafswZWMqvZZFHkdm++FdqI+w26GgZBzC+7vEb+FMjM9IaNNN9QBGhJbUAdJEEF
	 SmwFxgq3DAuaKiTTi8mNqNAgHsDItgjRAFlUsMFpIKjEyGIUaBX906TGJ91Og17YpchqD
	 OEAr6Ji9IBviqO5zgKWtbBkk2CWwMrWzIZreFpZzApNcJBNkmkvThFzmogVOlqEGe/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=WVe2XwOp;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85F4606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B85F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=WVe2XwOp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=S41CW/yU6kvATbYfyKjSfhuD72c6aPCh1dg40hUL4mA=; b=WVe2XwOp0dfSsSELleHcZ3CLsu
	M3anD20dyJ2lDU7ApCNoNYFuIMMDlsg/OMUyu+1Erd6xuPsVKMwxZol4AHzaRmKBfpXYa5RXn5WUA
	aYTIc7wFun2fmAR9gzwnoDSsXaD4GORFsNiiA2QOegS1H44OXjEI+Rb/uUlMGp61209CMpkljAl7J
	usuCyIq7AHy/sQRrxzp5XrczBP9yR6Nnb3oYbP4j3/sogUMm5qF4qZ+Hgw7cpU31ptg36qBjo6Jv9
	TsE29G20B/I4RDbBunMJYn/bMv/vWN7VKIW7sNisnBP/8gA5BbGmZaPkVJzrb3o3OWjCwS40Sx6IA
	vwwbH65g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR80n-0000000A41A-0HOG;
	Wed, 11 Nov 2026 13:05:13 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 39DAB3005AF; Wed, 11 Nov 2026 14:05:12 +0100 (CET)
Date: Wed, 11 Nov 2026 14:05:12 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 12/12] sched: Remove sched_class::balance()
Message-ID: <20261111130512.GO2668200@noisy.programming.kicks-ass.net>
References: <20261107115913.261163891@infradead.org>
 <20261107120208.153536827@infradead.org>
 <a98c40701cc874318e7fe475d90795c6@kernel.org>
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
In-Reply-To: <a98c40701cc874318e7fe475d90795c6@kernel.org>

On Wed, Nov 11, 2026 at 01:18:42AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Sat, Nov 07, 2026 at 12:59:25PM +0100, Peter Zijlstra wrote:
> >  static struct task_struct *pick_task_rt(struct rq *rq, struct rq_flags *rf)
> >  {
> > -	struct task_struct *p;
> > +	rq_modified_begin(rq, &rt_sched_class);
> > +	balance_rt(rq, rf);
> > +	if (rq_modified_above(rq, &rt_sched_class))
> > +		return RETRY_TASK;
> 
> This exposes an underlying problem on the DL side. rq->next_class is
> raised only by wakeup_preempt(), but dl_server_start(), dl_task_timer()
> and dl_server_timer() enqueue a DL entity and open-code resched_curr()
> without going through it. prev_balance() ran before any class was
> picked, so it didn't matter. Now, pick_task_dl() has already returned
> NULL when balance_rt() drops the lock, and rq_modified_above() is the
> only thing which can notice a DL entity queued in the meantime:
> 
>   CPU0 RT task blocks, pick_task_dl() returns NULL
>        pick_task_rt(), balance_rt() drops the rq lock
>   CPU1 wakes a fair task onto CPU0, dl_server_start()
>   CPU0 relocks, rq_modified_above() is false
>        picks an RT task with the fair server queued

A very nice catch, but I'm not entirely convinced it wasn't a problem
before.

Similar argument could be made for FAIR vs EXT, and picking a FAIR task
while an EXT server is pickable.

> resched_curr() doesn't help as __schedule() clears it on prev after the
> pick. I can trigger this with NO_RT_PUSH_IPI and a delay added in the
> lock drop. With RT_PUSH_IPI, pull_rt_task() doesn't drop the lock.
> 
> Maybe the DL sites should raise rq->next_class where they enqueue and
> resched, so that they behave the same as regular wakeups?

Yes, something like that. I think the below captures all enqueues,
irrespective of rescheds. I'll add it as fix at the start of the series.

(although maybe I'll massage this a little more and create a helper,
doing the same thing over and over like this is daft)

Thanks!

---
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -715,8 +715,7 @@ static struct rq *dl_task_offline_migrat
 	return later_rq;
 }
 
-static void
-enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags);
+static bool enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags);
 static void enqueue_task_dl(struct rq *rq, struct task_struct *p, int flags);
 static void dequeue_dl_entity(struct sched_dl_entity *dl_se, int flags);
 static void wakeup_preempt_dl(struct rq *rq, struct task_struct *p, int flags);
@@ -1184,7 +1183,8 @@ static enum hrtimer_restart dl_server_ti
 			dl_se->dl_defer_running = 1;
 		}
 
-		enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
+		if (enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH))
+			rq->next_class = &dl_sched_class;
 
 		if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &dl_se->rq->curr->dl))
 			resched_curr(rq);
@@ -1520,7 +1520,8 @@ static void update_curr_dl_se(struct rq
 					replenish_dl_new_period(dl_se, rq);
 					start_dl_timer(dl_se);
 				} else {
-					enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
+					if (enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH))
+						rq->next_class = &dl_sched_class;
 				}
 			} else {
 				enqueue_task_dl(rq, dl_task_of(dl_se), ENQUEUE_REPLENISH);
@@ -1812,7 +1813,8 @@ void dl_server_start(struct sched_dl_ent
 
 	trace_sched_dl_server_start_tp(dl_se, cpu_of(rq), dl_get_type(dl_se, rq));
 	dl_se->dl_server_active = 1;
-	enqueue_dl_entity(dl_se, ENQUEUE_WAKEUP);
+	if (enqueue_dl_entity(dl_se, ENQUEUE_WAKEUP))
+		rq->next_class = &dl_sched_class;
 	if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
 		resched_curr(dl_se->rq);
 }
@@ -2379,7 +2381,7 @@ static void __dequeue_dl_entity(struct s
 	dec_dl_tasks(dl_se, dl_rq);
 }
 
-static void
+static bool
 enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags)
 {
 	WARN_ON_ONCE(on_dl_rq(dl_se));
@@ -2418,7 +2420,7 @@ enqueue_dl_entity(struct sched_dl_entity
 		if (flags & ENQUEUE_WAKEUP)
 			task_contending(dl_se, flags);
 
-		return;
+		return false;
 	}
 
 	/*
@@ -2442,7 +2444,7 @@ enqueue_dl_entity(struct sched_dl_entity
 	 * deferred task and still got to wait, don't enqueue.
 	 */
 	if (dl_se->dl_throttled && start_dl_timer(dl_se))
-		return;
+		return false;
 
 	/*
 	 * We're about to enqueue, make sure we're not ->dl_throttled!
@@ -2457,6 +2459,7 @@ enqueue_dl_entity(struct sched_dl_entity
 	}
 
 	__enqueue_dl_entity(dl_se);
+	return true;
 }
 
 static void dequeue_dl_entity(struct sched_dl_entity *dl_se, int flags)
@@ -2534,7 +2537,8 @@ static void enqueue_task_dl(struct rq *r
 	if (task_on_rq_migrating(p))
 		flags |= ENQUEUE_MIGRATING;
 
-	enqueue_dl_entity(dl_se, flags);
+	if (enqueue_dl_entity(dl_se, flags))
+		rq->next_class = &dl_sched_class;
 
 	if (dl_server(dl_se))
 		return;
