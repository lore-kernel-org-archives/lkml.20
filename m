Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=3.67.56.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522931;
	b=a3nHnVtAC+6LxMIZ/EsFdNcTQ8G0kZHe3oLrToqCzdmDuwFGJdLcJCwlhVbITFkhdlJu
	 er55YjoEZKthfFg9exW2YdW9IWDfVh6kU4ZwdVKI/BPeZylCnrjIiwCnDO4yWIFxIxfnM
	 1jBtXv8JSQFgZATsrCJfADcnGUKYrFxotKwBJvcfPLt3AZdka2ij0NfDItZkDUq6Q9eDW
	 bvqirdxRrJPufkCH6iOGkqzVbZFy/eh/jN0pSzLs1ZyfZ17b/oGIod14vDyJzsR5x5gzl
	 iGpyEYkTD/+o1C7d1JrngDfyoQR1vdnW5lcN4OvOD+rKYdEjGaV0VhcH1n2FJv0IuGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522931;
	h=DMARC-Filter:Received:X-Titan-User-Uid:DKIM-Signature:X-AuthUser:
	 Received:Date:Feedback-ID:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:X-F-Verdict:
	 X-Titan-Src-Out:X-CMAE-Score:X-CMAE-Analysis;
	bh=/OdMtMtDcnOCL1/5cdh8ra5gz0OmWkjdsptPnrqgojk=;
	b=Fqc1YMFjHg6EjSBSyZCMpnGQ8gNGxKUgtFmID2KYVYxwQ7SWdVftQg+TvSK/9gFlFLij
	 zxTICL03ImxMKW/t9NblHpEZF0vQI6AD4Klp4bBC9VTiCsk8BvpvfZPe3q7IsFO34LjjB
	 IsEFuV1x7QM5K7Fy9RGQmjb/mOsKbCie/TzmPy7r6bFIxtgqxvUrtqVXUk4+8w5xY2gKP
	 WFp7+TJUnHk2TSqmLbqJPz/u/n8H7tt5qketTaB0B4tWP3dO7Ts+xWXkUqQuYthe0VBXZ
	 UshvU8z7CQN5i/K53QOzmMSJVkls5+4sWh+LJ9GDYmC2UebyQ4poj9hj2apikClI61w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=techsingularity.net;
	spf=pass smtp.mailfrom=techsingularity.net;
	dkim=pass header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=NMRvEvy8;
	arc=none smtp.remote-ip=3.67.56.127
Received: from mail32.out.titan.email (mail32.out.titan.email [3.67.56.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37036606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37036606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=NMRvEvy8
Received: from localhost (localhost [127.0.0.1])
	by smtp-out0101.titan.email (Postfix) with ESMTP id 4jQZwC1Yb6z3wYn;
	Thu, 12 Nov 2026 22:35:23 +0000 (UTC)
X-Titan-User-Uid: eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..p2KZoEowiDcap7t-._RQGsgB8Os5X_tsNHoLj4dbIpGaNiF1xDBUgP4RN1W7EYTdsGCZjbbe-sOqPkZS1v3AcFbG9zw2hpgwRdjXaiJ0ar391Tjij5qEn6UNB0bXuUlsA5R_31PsXAQ.qqejugpVbML0W4-i0jZaVw
DKIM-Signature: a=rsa-sha256; bh=/OdMtMtDcnOCL1/5cdh8ra5gz0OmWkjdsptPnrqgojk=;
	c=relaxed/relaxed; d=techsingularity.net;
	h=date:message-id:mime-version:to:references:from:cc:subject:in-reply-to:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1794522923; v=1;
	b=NMRvEvy82fXPiAm+sXA8cGjWGSjlPbQPswKN/quNZCjvJL04bVgIOm3R4cpyQa3QFX7MU84H
	g+FDPylWS5R6GjHgf91dizdioJWjsBXy4KotfdJ45V2wnXqf7FaB5MlJSk5NV9VmcpKckl3vu1p
	phhZ/cPxaLFKieDOfZ9gLocA=
X-AuthUser: mgorman@techsingularity.net
Received: from techsingularity.net (unknown [84.203.169.71])
	by smtp-out0101.titan.email (Postfix) with ESMTPA id 4jQZwB2zpPz3wYd;
	Thu, 12 Nov 2026 22:35:22 +0000 (UTC)
Date: Thu, 12 Nov 2026 22:35:21 +0000
Feedback-ID: :mgorman@techsingularity.net:techsingularity.net:flockmailId
From: Mel Gorman <mgorman@techsingularity.net>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Seiji Nishikawa <snishika@redhat.com>, 
	Mian Yousaf Kaukab <ykaukab@suse.de>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] sched/rt: Do not account migrate-disabled tasks as
 pushable
Message-ID: <avYpbK0s8vdbocyt@techsingularity.net>
References: <avXKCDm7NiVejDiF@techsingularity.net>
 <20261112153120.GU1779021@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20261112153120.GU1779021@noisy.programming.kicks-ass.net>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1794522922988008633.2081352.4469356034877710515@prod-euc1-smtp-out1004.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=KNjj5FFo c=1 sm=1 tr=0 ts=6af63f2b
 a=z2qhHIlv8qvig73Ub5HWqw==:117 a=z2qhHIlv8qvig73Ub5HWqw==:17
 a=Q9fys5e9bTEA:10 a=CEWIc4RMnpUA:10 a=dwXSzScLiP2FeiiSJSAA:9
 a=PUjeQqilurYA:10

On Thu, Nov 12, 2026 at 04:31:20PM +0100, Peter Zijlstra wrote:
> On Thu, Nov 12, 2026 at 02:17:29PM +0000, Mel Gorman wrote:
> 
> > diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> > index 1535046a23ff..bb640278d30e 100644
> > --- a/kernel/sched/rt.c
> > +++ b/kernel/sched/rt.c
> > @@ -396,6 +396,13 @@ static inline void rt_queue_pull_task(struct rq *rq)
> >  
> >  static void enqueue_pushable_task(struct rq *rq, struct task_struct *p)
> >  {
> > +	if (p->nr_cpus_allowed <= 1)
> > +		return;
> > +#ifdef HAVE_RT_PUSH_IPI
> > +	if (sched_feat(RT_PUSH_IPI) && is_migration_disabled(p))
> > +		return;
> > +#endif
> 
> Is there any down-side from unconditionally having that
> is_migration_disabled() test there?
> 

It's a simple check of p->migration_disabled so compute-wise it's simple. It
might incur a cache miss that may not be already fetched if nothing else
prior contended on a spin lock. On !PREEMPT_RT, the static branch should
hide it by default so it's a PREEMPT_RT-specific hazard.

> >  	plist_del(&p->pushable_tasks, &rq->rt.pushable_tasks);
> >  	plist_node_init(&p->pushable_tasks, p->prio);
> >  	plist_add(&p->pushable_tasks, &rq->rt.pushable_tasks);
> > @@ -1448,7 +1455,7 @@ enqueue_task_rt(struct rq *rq, struct task_struct *p, int flags)
> >  	if (task_is_blocked(p))
> >  		return;
> >  
> > -	if (!task_current(rq, p) && p->nr_cpus_allowed > 1)
> > +	if (!task_current(rq, p))
> >  		enqueue_pushable_task(rq, p);
> >  }
> >  
> > @@ -1746,7 +1753,7 @@ static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_s
> >  	 * The previous task needs to be made eligible for pushing
> >  	 * if it is still active
> >  	 */
> > -	if (on_rt_rq(&p->rt) && p->nr_cpus_allowed > 1)
> > +	if (on_rt_rq(&p->rt))
> >  		enqueue_pushable_task(rq, p);
> >  }
> 
> And can I ask you to do the same to DL ? Where possible we try and keep
> them in-sync.

I can move the "p->nr_cpus_allowed > 1" check and I think that's what you
are referring to.

I cannot add the is_migration_disabled() to match as deadline does not
have a mechanism equivalent to RT_PUSH_IPI. Adding migration_disabled
check anyway damages pull_dl_task in a way that is difficult to detect
e.g. if a runqueue has multiple runnable tasks with earlier deadlines and 1
migrate-disabled then the 2 tasks can be left competing (side-effect benefit
but still). Worse, sometimes adding it would work better -- a running task
with an earlier deadline but sufficient time to complete is left alone if
the rq is shared with a migrate-disabled task and hidden as a push candidate.

V3 will follow shortly.

-- 
Mel Gorman
SUSE Labs
