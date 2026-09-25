Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392B34AEBF7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346865; cv=none; b=AUPDwz9Sx5wGYmF7ivuLxg7XjmUzUAXdLtkolKQvQchAkfqjs0zjlkUIw5omkiBSG+1wzkfryTvoI2KmN/7mAwGeNms4wf35DBDzHgezhlvzVi2VXAvrxtrQ/YxroZXzkvA0zYUNI3CicRac8NmC3Py3P4pIBeyoufaz3mM8LWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346865; c=relaxed/simple;
	bh=K4LhknRGZRbkp8NoljIOLwgL2WWM5tKa4K92POf23ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lniewO5FVafPJWQzpo6v2fpGoPgJkN2T01zg9IWfhyxBnNuKgfevkcFFhqdex4kN3JMMyLB1fuLNcHrIyiy7Idug8lPXHCU4zlS0nECGcNr39185Uhk5xJbDwLq/0rY+ocghpK9w7HadSQ1SGJBQP3BTjRdSwPRswMFr35Ctjb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oCjMU3Zy; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oCjMU3Zy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nyzqB28sbDK0BOdVIeRX5Nl490WDDS7xJAMbGqihmeY=; b=oCjMU3ZysTFHfc5DfyO8TeSadS
	F3dkG0u6jbScM7uygz+KXJNI8nBsd9Rr4ZtlOrbbpSWyMMlAsSjtHd7ZzNIYwO8wRpZVTJ1eXRLol
	YI3/QY0mCSM4WDSttZeFkyqYEj3KktFLFGXNpITpA8k2TRhmcjNk8p/ZQGBuxf2VYxDsxT44Od+OS
	UK8zUQV4PiZ9TTQdBOpYQgNxqHLkEDA6SWBcwbCnrhJoECKJ2SbJ6reogXxRyisH/vSAfOdHJTMp4
	DVV4FlN5PtrNKg5fsr2+KhM32HSvwYTMc6s5BlUtEFi2y9jPMTrIP9F/COYHIJ56e0yOD2Mti4I27
	/bx/ptfA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6zt-00000007qrd-2c3b;
	Fri, 25 Sep 2026 14:33:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8C7D9300673; Fri, 25 Sep 2026 16:33:56 +0200 (CEST)
Date: Fri, 25 Sep 2026 16:33:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aaron Lu <ziqianlu@bytedance.com>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, tj@kernel.org
Subject: Re: [PATCH 1/7] sched/core: Fix pick_next_task() self recursion
Message-ID: <20260925143356.GO4120091@noisy.programming.kicks-ass.net>
References: <20260828101659.812011872@infradead.org>
 <20260828104018.378378994@infradead.org>
 <20260903111335.GA3594512@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903111335.GA3594512@bytedance.com>

On Thu, Sep 03, 2026 at 07:13:35PM +0800, Aaron Lu wrote:
> On Fri, Aug 28, 2026 at 12:17:00PM +0200, Peter Zijlstra wrote:
> > It is possible for another sibling to end up in pick_next_task() when:
> > 
> >   pick_next_task()
> >     pick_task()
> >       sched_class::pick_task()
> > 
> > drops the core wide rq->lock. In this case they end up trampling the core wide
> > task selection state, possibly leading to NULL derefs. Detect this case by
> > keeping a local copy of core_task_seq, a value that is incremented on
> > {en,de}queue and schedule.
> > 
> > Since RETRY_TASK is only possible when a higher priority task gets enqueued
> > during the lock break, this must mean core_task_seq will also be incremented
> > and is thus completely covered by the seq number mismatch.
> 
> For the uncookied no-sync fast path, we should check if core wide is
> still uncookied after lock is re-acquired? Something like below, or we
> can pick an uncookied task when sibling picked a cookied one:
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index cd0149f5f6693..781f751acdb5b 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6314,6 +6314,14 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
>  			goto restart;
>  
>  		if (!next->core_cookie) {
> +			/*
> +			 * pick_task() can drop the core rq lock through newidle balance.
> +			 * If a sibling established a core-wide cookie while the lock was
> +			 * dropped, the uncookied no-sync fast path is no longer valid.
> +			 */
> +			if (unlikely(rq->core->core_cookie))
> +				goto restart;
> +
>  			rq->core_pick = NULL;
>  			rq->core_dl_server = NULL;
>  			/*
> 
> We can also do a core_task_seq check above but if sibling picked an
> uncookied task, it's actually OK for this rq to go this fast path so I
> chose to check rq->core->core_cookie here.

Indeed! I had considered adding the seq check here, but didn't see any
problem it would solve. Clearly I missed this case.

Let me add this.
