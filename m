Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FECD3E557D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886502; cv=none; b=o/2kCGStylCt4ThTCIP+ALfGeSaooidIBaOLCNHgVE0RAr+gtKLJosET77E+oGH2BjA8/xcYevCCXyRxqHKNrmIaan28Zr7lSWfravfkTskwP7Hel9fTOH9tMf6kWeiX8IDD1rRo6eo2nCqj5bAB2HM7tF7QVYyBRZe84wV5QXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886502; c=relaxed/simple;
	bh=3TsI7y2QTRvz7po8QtRnPwo6G/1giofSXcVTs6ieuGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRV1cgXc3nsPUGPA7QiGKR+tmEphv7ZofsT/MGEu7mfcvvl/cknfvVUgeVb6UOj/cgNv/mVFc1+ns0UcFYYrjH8CptXbqfSjmUiTDyIJIjyzm54asZuEv0JL3ULdpg+w0WLpHQAksCAe7w40y4Xd5FzQ11jRenHI/DHgt8Gr/IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tPxy6CK1; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tPxy6CK1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eIDW8Q5jqiYNl5MLa1uC7+lJ9vL8wRWWy5hvUvXG3CM=; b=tPxy6CK18Q26XdJnkoTnRDW00h
	M66ofZsUt0BoZtRBvqg/oM2ma1V3MXwCKZow7AdShWuerVERkFQtrfCTJQKrGG8FmhIT/hBmJxJky
	Z8QElfBqyF3DsmHkUSNXteEIOAFECul17SUy7EpgKQeohqmOWS1q2ONMLjRRu2idN9OS3kI9pObyL
	YFGuS25Wdzr2zZUP+Gm11S1aiEofj6YE63IAcvGC6uCObvDeB75UGK97grxGoXYOUTZgCYS6GsSMB
	7AboQRVSqDuL4BauEZACz3jsS4dapUKzMi6H1sx1lbkP8FdHRfn3Bwmil6r5CGE+3rl6wpnKdR9hp
	7PzgSpFw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZX2-0000000CixA-1zj5;
	Tue, 13 Oct 2026 10:14:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0DA8630063F; Tue, 13 Oct 2026 12:14:52 +0200 (CEST)
Date: Tue, 13 Oct 2026 12:14:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, paulmck@kernel.org,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG] Apparent lost wakeups
Message-ID: <20261013101452.GG2009045@noisy.programming.kicks-ass.net>
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
 <b2dd8374-63d4-4b04-9e2c-f6a84728f092@amd.com>
 <69622916-cc8a-44d5-b776-6e25f79aceda@amd.com>
 <CAKfTPtDz35egMZEVz+wb5kytgVrv7APcVOYBkCByvzPSCH7Meg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtDz35egMZEVz+wb5kytgVrv7APcVOYBkCByvzPSCH7Meg@mail.gmail.com>

On Tue, Oct 13, 2026 at 09:58:25AM +0200, Vincent Guittot wrote:

> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 0f63c30b4324..b37c771c41ad 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -11256,6 +11262,9 @@ void sched_change_end(struct sched_change_ctx *ctx)
>                  if (ctx->running) {
>                          /*
>                          * If this was a class promotion; let the old class
>                          * know it got preempted. Note that none of the
>                          * switch*_from() methods know the new class and none
>                          * of the switch*_to() methods know the old class.
>                          */
>                          if (sched_class_above(p->sched_class, ctx->class)) {
>                                  rq->next_class->wakeup_preempt(rq, p, 0);
>                                  rq->next_class = p->sched_class;
>                          }
>                          /*
>                          * If this was a degradation in class; make sure to
>                          * reschedule.
> >                          */
> >                         if (sched_class_above(ctx->class, p->sched_class))
> >                                 resched_curr(rq);
> > +               } else if (ctx->queued) {
> > +                       /* Check if we need can preempt the current task. */
> > +                       wakeup_preempt(rq, p, 0);
> 
> Isn't what we have for ctx->running above what we also want in this case ?
> Then sched_balance_newidle() will detect it with
> 
>                  /* If a higher prio class was modified, restart the pick */
>                 if (rq_modified_above(this_rq, &fair_sched_class))
>                          pulled_task = -1;
> 

Ah, I'm maybe slowly starting to see the shape of this. Does something
like so make sense?

That is, any task on the rq cares about promotion, only the current
running task cares about demotion.

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 047fbe8ef298..2a8bf562a769 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11261,7 +11261,7 @@ void sched_change_end(struct sched_change_ctx *ctx)
 		if (p->sched_class->switched_to)
 			p->sched_class->switched_to(rq, p);
 
-		if (ctx->running) {
+		if (ctx->queued) {
 			/*
 			 * If this was a class promotion; let the old class
 			 * know it got preempted. Note that none of the
@@ -11272,6 +11272,9 @@ void sched_change_end(struct sched_change_ctx *ctx)
 				rq->next_class->wakeup_preempt(rq, p, 0);
 				rq->next_class = p->sched_class;
 			}
+		}
+
+		if (ctx->running) {
 			/*
 			 * If this was a degradation in class; make sure to
 			 * reschedule.
