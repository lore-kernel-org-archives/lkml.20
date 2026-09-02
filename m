Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5220536B05C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336802; cv=none; b=llhXtp8+q5XxK1sxCHGin4WXbXfOyRGIf9EnNwPQC5DZDj0WAr19q4+0FEwUn/wOHDbFViTz569qcXyCpWAkQzqM95l73PNMmgZ8l+ph5MKNmb8lp5Tv0LzUCQrx04yggZJIQI24VIm83jN6gLjRESsjrLHKdH/BlDQO4cmfQDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336802; c=relaxed/simple;
	bh=N7qmu7NXs/ntLRT1XsUH58VHOFF9PEvNAwM0KVAcu5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W76v5CWwwS6Kzcgz9L1gA4fuOz4qpr+LRsgHnDMUU0JASlmvBVsSJsbHkZc50ywvSEgHb+EnstbNoy33eRqfL7O3w3t390QSIE63lxVGwcfiPL0LRFOmPVC2IoGxOKjuhJJoGYcCEyc+mUeRRhGyFLwoMlzi45/cx1ufNNV4eqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vjQiaHGK; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vjQiaHGK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=B2PJiBEQDGvGPyG85bd35mA0RDTfQot+A/LxB6bWRvA=; b=vjQiaHGKHbO7MRbFo5kB7/j9lU
	X/dxYEN4uNzgHXW0oWjnXjx65Rq8v50vtBifNvP0JrPqeUaxocu/RISY0PfgemMiLeR7wsx5WBFZy
	Pq6qjxB3HiluEcblHKg/sDeSsQQGnS7S8ZD1aLNtDC/OENWf+383YbQv98aMJgM875SQ0i2ZhbJgb
	ahQ39+rtN7ecYZqPe4ShDehliL0Gh6S73zHB3XgmDqRebBjwJeSlOX+NnZayX89H6uwD681hCLy1k
	dzFIdL7Xswhqxa5UuzNrrmlHU+0NPmRU4C2er4TMrjYi0zVNcoRhJyRtpIT41UzNvsIvweLh6obqk
	4RU1kEsA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1g5e-00000006gXh-3TIi;
	Wed, 02 Sep 2026 08:13:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A68BF30026C; Wed, 02 Sep 2026 10:13:01 +0200 (CEST)
Date: Wed, 2 Sep 2026 10:13:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Chen Yu <yu.c.chen@intel.com>, mingo@kernel.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	tj@kernel.org, linux-kernel@vger.kernel.org, chen.yu@linux.dev,
	tim.c.chen@linux.intel.com
Subject: Re: [PATCH 4/4] sched/fair: Rework/fix task_h_load()
Message-ID: <20260902081301.GS4120091@noisy.programming.kicks-ass.net>
References: <20260828074059.232353141@infradead.org>
 <20260828075558.660152190@infradead.org>
 <apezcsScwu5hdNrr@fengwei-dev>
 <CAKfTPtBNAGQUQZbaDKYU7+Nsrcnj4M4p=54XkeML7rrLy+x+ZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtBNAGQUQZbaDKYU7+Nsrcnj4M4p=54XkeML7rrLy+x+ZQ@mail.gmail.com>

On Wed, Sep 02, 2026 at 09:55:49AM +0200, Vincent Guittot wrote:
> On Wed, 2 Sept 2026 at 07:39, Chen Yu <yu.c.chen@intel.com> wrote:
> >
> > On Fri, Aug 28, 2026 at 09:41:03AM +0200, Peter Zijlstra wrote:
> >
> > [ ... ]
> >
> > > @@ -15230,6 +15255,9 @@ static void set_next_task_fair(struct rq
> > >                       weight = __calc_prop_weight(cfs_rq, se, weight);
> > >       }
> > >
> > > +     for_each_sched_entity_bl(se, cfs_rq)
> > > +             update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> > > +
> >
> > It panics during bootup on a 192 Cores system,
> > [    9.445362][ T1687] Oops: general protection fault, kernel NULL pointer dereference 0x69: 0000 [#1] SMP NOPTI
> > [   18.987940][ T1687] CPU: 58 UID: 0 PID: 1687 Comm: systemd-udevd Not tainted 7.3.0-rc1-flat-hload+ #9 PREEMPTLAZY
> > [   19.022374][ T1687] RIP: 0010:pick_task_fair+0x43/0xd0
> > [   19.175316][ T1687]  <TASK>
> > [   19.181239][ T1687]  __pick_next_task+0x49/0x1b0
> > [   19.189229][ T1687]  __schedule+0x14b/0x6b0
> > [   19.196711][ T1687]  preempt_schedule+0x3a/0x60
> > [   19.204543][ T1687]  preempt_schedule_thunk+0x16/0x40
> > [   19.212931][ T1687]  _raw_spin_unlock_irqrestore+0x2b/0x30
> > [   19.221833][ T1687]  autogroup_move_group+0xc5/0x160
> > [   19.230124][ T1687]  sched_autogroup_create_attach+0xa7/0x180
> > [   19.239280][ T1687]  ksys_setsid+0x12c/0x170
> > [   19.246753][ T1687]  __do_sys_setsid+0xe/0x20
> > [   19.254292][ T1687]  do_syscall_64+0xbc/0x470
> > [   19.307858][ T1687]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > [   19.316405][ T1687] RIP: 0033:0x7f347bfbcb9b
> >
> > It seems that the crash is a read of se->sched_delayed on a NULL se inside
> > pick_next_entity(), so pick_eevdf() return NULL
> 
> I faced the same crash while testing

Weirdly that crash didn't show up for me :-(, I had a few others that I
cured.

> >
> > After the following top->down backlink traverse,
> > for_each_sched_entity_bl(se, cfs_rq)
> >     update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> >
> > cfs_rq is not the root->cfs_rq anymore, but a middle cfs_rq(autogroup
> > in above example). Meanwhile rq->cfs.curr remains NULL because the
> > rq->cfs.curr has been dequeued if the task is runnable and queued:
> > if (on_rq)
> >         __dequeue_entity(cfs_rq, se)
> >
> > se = &p->se;
> > cfs_rq->curr = se; /*wrong cfs_rq*/
> >
> > Then later _raw_spin_unlock_irqrestore triggers the scheduling
> > it picks from rq->cfs_rq.curr with a NULL tree.
> >
> > Maybe we need to restore the rq->cfs_rq after the
> > for_each_sched_entity_bl()?
> > se = &p->se;
> > cfs_rq = &rq->cfs; <--
> 
> Yes, this fixes it for me too

So I had this issue in task_tick_fair(), where
for_each_sched_entity_bl() clobbered cfs_rq, and fixed that by moving
things after reweight_eevdf() (which is what uses cfs_rq).

I at point I did actually look to see if anybody else would suffer that
same problem, but clearly I missed one.

I'm thinking the problem here is set_next_task_fair() ? I think I
misread the:

	se = &p->se;
	cfs_rq->curr = se;

to reset both se and cfs_rq, but clearly it doesn't. The below should
fix I suppose. Let me go and try and reproduce.


---
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15287,9 +15287,6 @@ static void set_next_task_fair(struct rq
 			weight = __calc_prop_weight(cfs_rq, se, weight);
 	}
 
-	for_each_sched_entity_bl(se, cfs_rq)
-		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
-
 	if (throttled)
 		task_throttle_setup_work(p);
 
@@ -15302,6 +15299,9 @@ static void set_next_task_fair(struct rq
 			set_protect_slice(cfs_rq, se);
 	}
 
+	for_each_sched_entity_bl(se, cfs_rq)
+		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
+
 	if (task_on_rq_queued(p)) {
 		/*
 		 * Move the next running task to the front of the list, so our
