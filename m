Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBBA489FA9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135205; cv=none; b=RlNWi/vStEDEixpKJCkkX+EJ45qFL0PVMFvk/0B3ANdHdtl/PWiuPHuvM+iSQr7GkRPcKBNvyK8ZVMBAPEiRRRMwhWqzoAz5u3b886/AQNbK3+t2P0bhgtpIqNdMQdcUplgq7pVw3y3HPGOsJFz4N5dKJdekGQ7waxFf7nytoNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135205; c=relaxed/simple;
	bh=e/ajm+C0JmJU0sY4Sphd2J9w0lkILemO2n6BPZ4GQM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpvQixOg+4hZh/FwmMCiGjIM/Jt2niIXf1opDfzD2raRAYM/ozsS9uCz38I/5klBJuIwvDYWa78RWDb/ZP3hC0AnyXFrVHSQuk7rtyyTGNJ6DDLyL/SSz9wrWnIw1MSbaZ/JRoNt02JrGFECApe09WNBWgBa9sMreM8fcSMxiwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Sv6IyuZ1; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Sv6IyuZ1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LEM5NtihFLOUsjE1H1wI6Tl7KmbpU1m94+Cvkr/MIZw=; b=Sv6IyuZ1N+NTJkWhP9M4JfcEGM
	ioZ9L7H1h+8Y7KAUW+7rIpJYgvs9xRq8954j3G5JNykBoLl+n/2G5ELKGwYnPZkJliblZL/dHAeRV
	kqQqQybZz2H9xbKPyRaX9I1jZuL8JLgkxLz342125KDJIaNf2638K6fV/AwDVy45OYdKZ4oXxgT9n
	GM8vJYmTUmxb2yyA1xQqCRZ0DTIhV6yxZT1Ti6Vr9DheO9wII4csnbTI7pI/MNhg7aAi5j6uvzrfp
	qtDRllyBrnAheGE8S2axq7tWthRvc2+l5LlLvI7stD9FKK0gZ2N9a70h4wl0asgIfSAC4Yxoc046C
	nYGcNaKw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x51nE-00000003eKS-2FmW;
	Fri, 11 Sep 2026 13:59:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1E97A300400; Fri, 11 Sep 2026 15:59:51 +0200 (CEST)
Date: Fri, 11 Sep 2026 15:59:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Shubhang Kaushik <shubhang@os.amperecomputing.com>,
	Christoph Lameter <cl@gentwo.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Restart hrtick after same-task repicks
Message-ID: <20260911135951.GG1837346@noisy.programming.kicks-ass.net>
References: <20260813-sched-fair-hrtick-restart-v1-1-4230d1e18fbb@gentwo.org>
 <20260911112056.GY776954@noisy.programming.kicks-ass.net>
 <CAKfTPtD_aJeAh1biW6gKCLK6BnYcNtbz-FJvxUzZ1tD3V=43mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtD_aJeAh1biW6gKCLK6BnYcNtbz-FJvxUzZ1tD3V=43mw@mail.gmail.com>

On Fri, Sep 11, 2026 at 02:36:41PM +0200, Vincent Guittot wrote:

> > @@ -15293,11 +15297,12 @@ static void set_next_task_fair(struct rq *rq, struct task_struct *p, bool first)
> >
> >         WARN_ON_ONCE(se->sched_delayed);
> >
> > -       if (hrtick_enabled_fair(rq))
> > -               hrtick_start_fair(rq, p);
> > -
> >         update_misfit_status(p, rq);
> >         sched_fair_update_stop_tick(rq, p);
> > +
> > +repick:
> > +       if (hrtick_enabled_fair(rq))
> > +               hrtick_start_fair(rq, p);
> 
> While at it, you might want to replace:
> vdelta = se->deadline - se->vruntime;
> by
> vdelta = se->vprot - se->vruntime;
> in hrtick_start_fair()

That should be a separate patch.

> 
> >  }
> >
> >  void init_cfs_rq(struct cfs_rq *cfs_rq)

But that made me thing; do we want something like so folded in here?

Since we got picked again, we should set vprot again, no?

---
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15279,11 +15279,8 @@ static void set_next_task_fair(struct rq
 	se = &p->se;
 	cfs_rq->curr = se;
 
-	if (on_rq) {
+	if (on_rq)
 		reweight_eevdf(cfs_rq, se, weight, se->on_rq);
-		if (first)
-			set_protect_slice(cfs_rq, se);
-	}
 
 	if (task_on_rq_queued(p)) {
 		/*
@@ -15301,6 +15298,9 @@ static void set_next_task_fair(struct rq
 	sched_fair_update_stop_tick(rq, p);
 
 repick:
+	if (on_rq)
+		set_protect_slice(cfs_rq, se);
+
 	if (hrtick_enabled_fair(rq))
 		hrtick_start_fair(rq, p);
 }
