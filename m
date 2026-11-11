Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402719;
	b=KUSTEjiv+dO7zNTknCfkFw+a65Mbn040TsqnjaANhVYP8KB/HurLS525J4YBljDS4RjF
	 MWvSrLAH9nTaelymTsaET4MLb7HIbJlUJB3K/pJ/4XIkec7c50u7aihf5yETdMTEjEg9H
	 5w8T7BxAH1rUrn1d8SH4JvRluOwZLK3kmtGFK+nmmVy1YOLx24LBs4XV9ET0lPl3dcrRi
	 Q1hHt2m+CXF773Zfh47mPb0Lx13b7Y8Dt7kCvusXhCOfnJPcXQ3bLNQePtaozwDT9WG4Q
	 Iw4t9xKkaK/DX4zQERwE2NjKSN4yh3U0gC/F05RTNfYG86Db/7MoNqcZFz6vjBmpM6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402719;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=OvNwj1NR6c0Jt8mRPTGwZj5b5ZhFzIrphoc1MFIW61E=;
	b=4fhIgi0z+nCCPrElkXCBUoHa6T9WNdRYIg6X50g5xsqvlY4jtLjazXPDflK5kgX8OO07
	 L762CQWBCIjVHgfW/DY/+cY+8pxPWUqrY1222/mKUhQV6CcyJdwJBmssOe+RozVVntOqz
	 qzzOpJTXFdrpx4c/f/XEBVocFqasUnKf3z7wr8Y8NIC4pvi8fENp1YJvCgxr1HHiFRwY5
	 jd8uoQMZmYd97FhTnN8RldpnEqwOCCuc+Wdge8v3aLF8uPW8+baHAZMST6hSbqHAMCvQd
	 X+yPvn9br8Hwmp57l0m+TtYglh/48jJ8oTWmdLxWwd4o9iGdvMpYG+N4E5nTmoiT0cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=KhvsWjcM;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40B4606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F40B4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=KhvsWjcM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OvNwj1NR6c0Jt8mRPTGwZj5b5ZhFzIrphoc1MFIW61E=; b=KhvsWjcMK6m5OKYhzuvW5VxmJ8
	JC7TRKDeLBxXGRt0RcwxPoqHkG/bp42TO75GuIJhrFK4PP9JRiygdiAXQtWHsE5ZoD0h2ifJ23sij
	DIXqA90BoZHK8OsBQlymSNP6Oj5FFrUsXrfAUXqvslB0kXhSexvELM7SuwSwFMFqWjFoDS6AFCXg4
	Dpisu8GLuP+kn25tGCFdWz4xsG/IeU4qmO/rsc7it2V2J7iG4XOWh1+Hx+5YEpm5DETALkRevJIfD
	4O8/kZvQxnG55YdEbIH62y1uLEnQZrDA3tOFdFLkgZk7J9rgEWCA4J2B2wsVK/ElyWk0oS3x/Y3oj
	mwtOSCBA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR87F-0000000A7cb-17QU;
	Wed, 11 Nov 2026 13:11:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C4EBF300969; Wed, 11 Nov 2026 14:11:52 +0100 (CET)
Date: Wed, 11 Nov 2026 14:11:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 12/12] sched: Remove sched_class::balance()
Message-ID: <20261111131152.GD2669272@noisy.programming.kicks-ass.net>
References: <20261107115913.261163891@infradead.org>
 <20261107120208.153536827@infradead.org>
 <a98c40701cc874318e7fe475d90795c6@kernel.org>
 <20261111130512.GO2668200@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261111130512.GO2668200@noisy.programming.kicks-ass.net>

On Wed, Nov 11, 2026 at 02:05:12PM +0100, Peter Zijlstra wrote:
> On Wed, Nov 11, 2026 at 01:18:42AM -1000, Tejun Heo wrote:
> > Hello,
> > 
> > On Sat, Nov 07, 2026 at 12:59:25PM +0100, Peter Zijlstra wrote:
> > >  static struct task_struct *pick_task_rt(struct rq *rq, struct rq_flags *rf)
> > >  {
> > > -	struct task_struct *p;
> > > +	rq_modified_begin(rq, &rt_sched_class);
> > > +	balance_rt(rq, rf);
> > > +	if (rq_modified_above(rq, &rt_sched_class))
> > > +		return RETRY_TASK;
> > 
> > This exposes an underlying problem on the DL side. rq->next_class is
> > raised only by wakeup_preempt(), but dl_server_start(), dl_task_timer()
> > and dl_server_timer() enqueue a DL entity and open-code resched_curr()
> > without going through it. prev_balance() ran before any class was
> > picked, so it didn't matter. Now, pick_task_dl() has already returned
> > NULL when balance_rt() drops the lock, and rq_modified_above() is the
> > only thing which can notice a DL entity queued in the meantime:
> > 
> >   CPU0 RT task blocks, pick_task_dl() returns NULL
> >        pick_task_rt(), balance_rt() drops the rq lock
> >   CPU1 wakes a fair task onto CPU0, dl_server_start()
> >   CPU0 relocks, rq_modified_above() is false
> >        picks an RT task with the fair server queued
> 
> A very nice catch, but I'm not entirely convinced it wasn't a problem
> before.
> 
> Similar argument could be made for FAIR vs EXT, and picking a FAIR task
> while an EXT server is pickable.
> 
> > resched_curr() doesn't help as __schedule() clears it on prev after the
> > pick. I can trigger this with NO_RT_PUSH_IPI and a delay added in the
> > lock drop. With RT_PUSH_IPI, pull_rt_task() doesn't drop the lock.
> > 
> > Maybe the DL sites should raise rq->next_class where they enqueue and
> > resched, so that they behave the same as regular wakeups?
> 
> Yes, something like that. I think the below captures all enqueues,
> irrespective of rescheds. I'll add it as fix at the start of the series.
> 
> (although maybe I'll massage this a little more and create a helper,
> doing the same thing over and over like this is daft)
> 
> Thanks!

---
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
@@ -1184,7 +1183,7 @@ static enum hrtimer_restart dl_server_ti
 			dl_se->dl_defer_running = 1;
 		}
 
-		enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
+		enqueue_dl_entity(rq, dl_se, ENQUEUE_REPLENISH);
 
 		if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &dl_se->rq->curr->dl))
 			resched_curr(rq);
@@ -1520,7 +1519,7 @@ static void update_curr_dl_se(struct rq
 					replenish_dl_new_period(dl_se, rq);
 					start_dl_timer(dl_se);
 				} else {
-					enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
+					enqueue_dl_entity(rq, dl_se, ENQUEUE_REPLENISH);
 				}
 			} else {
 				enqueue_task_dl(rq, dl_task_of(dl_se), ENQUEUE_REPLENISH);
@@ -1812,7 +1811,7 @@ void dl_server_start(struct sched_dl_ent
 
 	trace_sched_dl_server_start_tp(dl_se, cpu_of(rq), dl_get_type(dl_se, rq));
 	dl_se->dl_server_active = 1;
-	enqueue_dl_entity(dl_se, ENQUEUE_WAKEUP);
+	enqueue_dl_entity(rq, dl_se, ENQUEUE_WAKEUP);
 	if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
 		resched_curr(dl_se->rq);
 }
@@ -2379,8 +2378,8 @@ static void __dequeue_dl_entity(struct s
 	dec_dl_tasks(dl_se, dl_rq);
 }
 
-static void
-enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags)
+static bool
+_enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags)
 {
 	WARN_ON_ONCE(on_dl_rq(dl_se));
 
@@ -2418,7 +2417,7 @@ enqueue_dl_entity(struct sched_dl_entity
 		if (flags & ENQUEUE_WAKEUP)
 			task_contending(dl_se, flags);
 
-		return;
+		return false;
 	}
 
 	/*
@@ -2442,7 +2441,7 @@ enqueue_dl_entity(struct sched_dl_entity
 	 * deferred task and still got to wait, don't enqueue.
 	 */
 	if (dl_se->dl_throttled && start_dl_timer(dl_se))
-		return;
+		return false;
 
 	/*
 	 * We're about to enqueue, make sure we're not ->dl_throttled!
@@ -2457,6 +2456,13 @@ enqueue_dl_entity(struct sched_dl_entity
 	}
 
 	__enqueue_dl_entity(dl_se);
+	return true;
+}
+
+static void enqueue_dl_entity(struct rq *rq, struct sched_dl_entity *dl_se, int flags)
+{
+	if (_enqueue_dl_entity(dl_se, flags))
+		rq->next_class = &dl_sched_class;
 }
 
 static void dequeue_dl_entity(struct sched_dl_entity *dl_se, int flags)
@@ -2534,7 +2540,7 @@ static void enqueue_task_dl(struct rq *r
 	if (task_on_rq_migrating(p))
 		flags |= ENQUEUE_MIGRATING;
 
-	enqueue_dl_entity(dl_se, flags);
+	enqueue_dl_entity(rq, dl_se, flags);
 
 	if (dl_server(dl_se))
 		return;
