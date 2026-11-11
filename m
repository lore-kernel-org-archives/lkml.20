Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393930;
	b=kVZltJjKt9Ublvnh6rhelK6wqh3vi9lglJmXVjI2oM3VZPAIn8nrRwegBLOCseVmvF8E
	 0EagoKZKX5/8e2ceIz5tPIh1eUFsoiZNf/QFFKFvi8NWHX6Z1NvM4Z0Rwa7eb66Y1RN0g
	 25/XEqjGrZyL7fmRMe0GPsEU56m6PBytIvbWjQtgxnKDQRDtxQ9avvkn3rZuANTXeEAie
	 EfmZeskS4X5hRlUxZmVLKZB6AYl01LTUxyU1x6ABZgy088p5EJil4y10R9FUhzeqzOD8G
	 NLsNdcfUx4dtkOxW99Ylvc6W8QA0f69+1+IQENWUwa3n49FOpCAwUnDC6Dube0jzwLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393930;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wd8eTxOZMOfM7YlCLcDnebYNAm4uPrq/cRge9Z6pYd0=;
	b=fpfEnq9nPs/dybli92MpQ4jZRE964OI26TWrxYwYNlz7IDTeknvr1yC2z53rtj9B3bFw
	 NimBivZKuGhFRrFWdIWqFIMhT33ZuzpIBVZCGxWRCjiexiYIyjAH2VvYYra1CSLr7QDlj
	 dqdd8LMnsZAqYH4gfpK2Q5zvNCpZ6BaX/8LE/QXFPYuww6lGvtE16MXa2prezpdKucsDA
	 Xuzz5nle6X78Li+nmkkKlTQXeXCGAxoWZPxs1pnD6D491Lq2jMo4RPME7Z1uaoMtBxUDI
	 KcgjTWIVgUAdQP4diFUmh6+Qhgm594yMBAxWbLz5SzDyj7DbL6fJzxp3bNDjk+2Qahw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=S0X6tDfq;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14623606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14623606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=S0X6tDfq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wd8eTxOZMOfM7YlCLcDnebYNAm4uPrq/cRge9Z6pYd0=; b=S0X6tDfqbGvxVLzQbzgxCbSS5L
	iJVLLAIyQIg7ulRVqXgFL/RXrEw3a4UB71C0MLlAgv76/9mZwFlBBmWqlSXZ1r8CeBJEKF2wznBqp
	jvE3XaEMX1Kl7JMkctcmmzE2RF0QB1u3rlppbJnZmZJpOh8iDl1VTInvqIP/Eo+lDcdMgs2qPaWkb
	XizU5mbTlWnV+zKx/HNNeP1HXqHgkI+o3+Nal0jBxmIeL7fpqY1/1jx4o2xpyx6KKhx66wYuEedm6
	Lx4qe5UoRT5jaahFeydz2iu0rbc102CoU0aRb7qWZXfNS39P3ybLXoQjQ8klI/ikH2235iznluAYQ
	znfCMQng==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5pR-00000008cJE-2cnS;
	Wed, 11 Nov 2026 10:45:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 37F973005AF; Wed, 11 Nov 2026 11:45:21 +0100 (CET)
Date: Wed, 11 Nov 2026 11:45:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 01/12] sched/core: Fix pick_next_task() self recursion
Message-ID: <20261111104521.GL2668200@noisy.programming.kicks-ass.net>
References: <20261107115913.261163891@infradead.org>
 <20261107120206.744550421@infradead.org>
 <69d54f4e77e99f41ea0fb22b7381a522@kernel.org>
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
In-Reply-To: <69d54f4e77e99f41ea0fb22b7381a522@kernel.org>

On Tue, Nov 10, 2026 at 02:30:33PM -1000, Tejun Heo wrote:
> Hello, Peter.
> 
> On Sat, Nov 07, 2026 at 12:59:14PM +0100, Peter Zijlstra wrote:
> > Since RETRY_TASK is only possible when a higher priority task gets enqueued
> > during the lock break, this must mean core_task_seq will also be incremented
> > and is thus completely covered by the seq number mismatch.
> 
> This doesn't hold for sched_ext, which returns RETRY_TASK whenever
> dispatch released the rq lock, e.g. ops.dispatch() inserting a task into
> a remote CPU's local DSQ, with no enqueue or dequeue on this core.
> 
> [ ... ]
> 
> >  		if (!next->core_cookie) {
> > +			/*
> > +			 * pick_task() can drop the core rq lock through
> > +			 * newidle balance. If a sibling established a
> > +			 * core-wide cookie while the lock was dropped, the
> > +			 * uncookied no-sync fast path is no longer valid.
> > +			 */
> > +			if (unlikely(rq->core->core_cookie))
> > +				goto restart;
> > +
> >  			rq->core_pick = NULL;
> >  			rq->core_dl_server = NULL;
> 
> This only catches a sibling selection which has already committed. One
> still in flight has reset core_cookie to 0 and may have set this CPU's
> core_pick, which the fast path then clears without changing
> core_task_seq. It needs three or more SMT siblings (e.g. POWER), so it
> isn't a common case:
> 
> 1. CPU2 is in the fast path and drops the lock in newidle.
> 2. CPU1 starts a core-wide selection: bumps core_task_seq, resets
>    core_cookie, sets rq2->core_pick and drops the lock in
>    pick_task(rq3).
> 3. CPU2 retakes the lock, sees core_cookie == 0, clears rq2->core_pick
>    and commits.
> 4. CPU1 retakes the lock, passes the seq check and hands the NULL
>    rq2->core_pick to cookie_equals().
> 
> This becomes reachable with 10/12 ("sched/fair: Reflow pick_task_fair()
> / newidle"), where pick_task_fair() can drop the lock in newidle without
> returning RETRY_TASK, and reliably oopses in __schedule() on an SMT4 VM.

Nice find.

> One way could be bumping core_task_seq when the fast path commits after
> the seq moved, so that the in-flight selection restarts. Another would
> be testing seq != core_task_seq instead of core_cookie, at the cost of
> restarting on any enqueue or dequeue during the lock break.

It always did bother me this test wasn't the same we used below. Let
them both be: 'seq != rq->core->core_task_seq'.

> [ ... ]
> 
> >  		p = pick_task(rq_i, rf);
> > -		if (unlikely(p == RETRY_TASK)) {
> > +		if (unlikely(seq != rq->core->core_task_seq ||
> > +			     WARN_ON_ONCE(p == RETRY_TASK))) {
> 
> As sched_ext can return RETRY_TASK with core_task_seq unchanged, this
> triggers reliably with a BPF scheduler running cookied tasks. The
> restart is still correct. Can the WARN_ON_ONCE() be dropped? The plain
> RETRY_TASK test is still needed as the seq can match.

Sure, dropped the WARN.

---
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6391,13 +6391,7 @@ pick_next_task(struct rq *rq, struct rq_
 		}
 
 		if (!next->core_cookie) {
-			/*
-			 * pick_task() can drop the core rq lock through
-			 * newidle balance. If a sibling established a
-			 * core-wide cookie while the lock was dropped, the
-			 * uncookied no-sync fast path is no longer valid.
-			 */
-			if (unlikely(rq->core->core_cookie))
+			if (unlikely(seq != rq->core->core_task_seq))
 				goto restart;
 
 			rq->core_pick = NULL;
@@ -6431,8 +6425,7 @@ pick_next_task(struct rq *rq, struct rq_
 			update_rq_clock(rq_i);
 
 		p = pick_task(rq_i, rf);
-		if (unlikely(seq != rq->core->core_task_seq ||
-			     WARN_ON_ONCE(p == RETRY_TASK))) {
+		if (unlikely(seq != rq->core->core_task_seq || p == RETRY_TASK)) {
 			/* rq lock may have been dropped, clocks invalidated */
 			core_clock_updated = false;
 			if (!(rq->clock_update_flags & RQCF_UPDATED))
