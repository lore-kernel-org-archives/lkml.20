Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479678;
	b=gkDCdGzwR7F8t2OjP6dt0J/TmS0q628D1xLj7OSzjp3BkvSjMPJTnw8YxIEnOIP450pm
	 s60BqVhasZNneWApSlmZH8VKUobSOcekJPSrL8KHMIDno1uMaojQOVxBR5LDep2Jh6haH
	 ch1e/scJ5CK1mF1YRYdQWFWVzqh+k3Yr89GQhX/Y17wdEaLKW/MS63EUM08K8y7dJPPyG
	 m82Eid+i8fCeLVStQ7dDAFP79nr4rRwYVDXq7W6Rj1EbPWMAKVNbYNUUzI2D5o0ibOtIb
	 vkvQoExvSmEVPZHDKR//rPP3zoHB19/Fj6wHweZ/yV9MokojTyb+BICuIRpW8JnkJEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479678;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=24Di0oVdbRa9+U5Ppc4n9yzHRj1J82Vy+STZrPc+dm4=;
	b=PC5mN/xUGiTizhH8saLTHSeSuEB7V27nJsQ/irrUbTINv/KX4NhP9B4BzrJ6Rb8IZRIP
	 8fTWi3ShaTpAkwHNgASmDUTB1iiycYbA07dCjiC/XF8o9p32mTNQ5kVv0R4UmN6o35xnN
	 B72GFDZbYtJnHoLqu73kyEO0adf4VFrQnWsKTbd7C0R2QN2fGRnuReZFnnQFZy50uQjbb
	 f0j+PG0CXYUqzUdyFk/QHK3BohXnzNmlzrIjmJUnIVlqye3A4Qc1tL6PIH7Sxq2Jz1qjA
	 mwCS5Lyc+dB97uyqvGy/TBhkPHjhFc4Mo3IPq3ebpAAYzdNbbbYjuM/DAHvIdj5K1bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=iD5bkkOP;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A805B606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A805B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=iD5bkkOP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=24Di0oVdbRa9+U5Ppc4n9yzHRj1J82Vy+STZrPc+dm4=; b=iD5bkkOP+ixfN0Bw201599ROSB
	hG558K+qxCOV8Gv4zMeT7NNLVjae52mbxD0WQ/eJ3CdYodxxRlkNO82ZjZhB7THaaEoNzK5yLzTHU
	ZyOc/utefm4msQ3s3OZvQ9UeKgkaetrTaSVNs2R5NFc9VIKPoOfFb7sU7KaYqeqIUTWVivYlD2tPU
	VhoC4KECIqQo+0NOtQlmIYcZak5TUyHfznmh5+mdmK9gcvzAnt9GzsZSPxkJmICKkcVpNh8x/pwzv
	Wv9eoJdPkQidMANQ85o5hIa7lPO+K012J5XC1FjN5+VOpvoGIjcmzNsEMad0wjqALT7yC2ioR129Q
	Y7Bg3uXA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRS8S-00000006Dpn-3Wub;
	Thu, 12 Nov 2026 10:34:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 15D0B30066A; Thu, 12 Nov 2026 11:34:28 +0100 (CET)
Date: Thu, 12 Nov 2026 11:34:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Andrea Righi <arighi@nvidia.com>, mingo@kernel.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org,
	tj@kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 12/12] sched: Remove sched_class::balance()
Message-ID: <20261112103428.GL2668804@noisy.programming.kicks-ass.net>
References: <20261107115913.261163891@infradead.org>
 <20261107120208.153536827@infradead.org>
 <56e1d372-c938-468a-950b-4f984ad6bde1@amd.com>
 <20261112093308.GI2668804@noisy.programming.kicks-ass.net>
 <87ed02f4-f510-47a7-b3fa-30ad7909cb24@amd.com>
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
In-Reply-To: <87ed02f4-f510-47a7-b3fa-30ad7909cb24@amd.com>

On Thu, Nov 12, 2026 at 03:47:00PM +0530, K Prateek Nayak wrote:

> >> In that case, why should RETRY_TASK want to try balance again for the old
> >> "rq->donor" for which we have already ran balanced for? Shouldn't it simply
> >> pick the task then? Am I missing something?
> > 
> > need_pull_dl_task() has '&& dl_task(prev)', so if prev was FAIR, then it
> > will not be true and pick will not cause it to pull another task. And
> > similar for RT, it checks if the current highest prio is less than the
> > previous prio, and if prev is FAIR that won't be the case.
> 
> Ack, but assume:
> 
>   /* RT tasks blocks */
>   pick_task_rt()
>     balance_rt()
>     /* Fails */
> 
>   pick_task_fair()
>     sched_balance_newidle()
>       raw_spin_rq_unlock()
> 
>       /* New RT task wakes up */
>       
>       raw_spin_rq_lock()
>       if (rq_modified_above()) /* True */
>         return -1
>      return RETRY_TASK;
> 
> 
>   pick_task_rt()
>     balance_rt()
>      need_pull_rt_task() / *Still true */
>        /* Again: Probably unnecessary? */
> 
>     /* But it does find an RT task so loop ends */ 

Ah, yes, in this case we appear to have an unnecessary balance.


> > So the problem is with ext :/ They need balance and pick to be one. If
> > we have separate loops there is the possibility of doing a balance but
> > then not picking it. In that case ext needs to undo the balance and we
> > don't have anything for that.
> > 
> > Humm...
> > 
> > Ah! we now have consistent cross-class wakeup_preempt calls. If we have
> > the following scenario:
> > 
> >   - only EXT tasks
> >   - balance_ext(), moves task from global DSQ to local DSQ
> >   - wakeup FAIR
> >       wakeup_preempt
> >         if (sched_class_above(p->sched_class, rq->next_class))
> > 	  rq->next_class->wakeup_preempt(rq, p, flags)
> > 	    // could move task back to global DSQ
> 
> This part I'm slightly confused about (on tip:sched/core):
> 
>   prev was RT
> 
>   pick_task_scx()
>     do_pick_task_scx()
> 
>       rq_modified_begin(rq, &ext_sched_class);
> 
>       dispatch_pick()
>         dispatch_one()
>           ops.acquire() <-- CPU is back in control of ext
> 
>           /* Pulls a task to local DSQ */
> 
>           /* A new RT task wakes up */
> 
>       if (!force_scx && rq_modified_above(rq, &ext_sched_class)) /* True for normal pick */
> 	return RETRY_TASK;
> 
>   ... goes and picks next RT task
> 
> 
> The ops.release() is only called when put_prev_task_scx() sees next of
> higher class which means the local dispatch from the pick stays that
> way until it is picked to run.
> 
> So, the question is, should balance_ext() do anything more than what
> pick is doing today to pull the task if local DSQ is empty? Am I
> missing something?

Aah, wakeup_preempt_scx() already does what it needed here. See how it
calls scx_schedule_reenq_local() when p's sched class isn't ext.

