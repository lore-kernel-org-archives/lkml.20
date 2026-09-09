Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3DF492E35
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788943078; cv=none; b=c/b2OO2hM3wHZLXrhR120rMMG4Pj8Siz732NdV/K+drp6vfiYCvaaHgdok13HAp86MpgZtx+UAnHZn7M8CNdpS/5qv+Z/JKxkxPhEH/IBJgSaBEVuDY60/Q7F0s6EfIQ1q7zrwle5U/LJ0pcnWUx9TEbL/zpLmBgvp1fRstBfX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788943078; c=relaxed/simple;
	bh=RTgyWuos+dlVWJsUkc2mLL6FHdJvohZdmtiGA1cqGRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXavpuILcnD0MH61Ah7eHjciIjSILvEnIB5BEWtNQEddfqgfQSSyhF/flH0IAFKuAsuFprpKKsNQBRsFizRqC1OiFny5T+kmz7u8+15CrTfNbV73KY3Cy3elQ6w+IU2ZQSPvkPdpDayx77508AJV3aNXyvdYMLBI9/VjmURe0/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jlWDGNrx; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jlWDGNrx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EwztdronqOJwt5dYWo45Y3H6fqnP8z7dPMjrAMHItcA=; b=jlWDGNrx4bEXETcSNFgThbOltk
	1CcLgMMOk+hpsT8EkTXGV2//RxydiDaH4BsoQ0Ra0UKyoO0/tQxxVSSOvck3bvTIlgw2J5npka83K
	r44DYqeps63OO5xHSKUZiLuTsy7TkyjtrBU9BVnHfuA+WLRdYwc/bIhG26bb3GYqotsZDacTqT2cH
	unkQEDnxvaQ2FdYFtggETa1y4jjo4W60DYXNNkeDNQZVPsOaGXCkwx4rr04XeDXRhQBBicrXgi5w9
	sB4aE73hFwK5yYKLLENyMZih25MVwQlOsRFzwXcR8DMqiS9Zhu1ywZc4fw5Z7CzWpHqO2NVbHkSvf
	wqhRwNmA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DoG-00000002yR5-1Eo6;
	Wed, 09 Sep 2026 08:37:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 652033005AF; Wed, 09 Sep 2026 10:37:35 +0200 (CEST)
Date: Wed, 9 Sep 2026 10:37:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Hui Su <sh_def@163.com>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, tim.c.chen@linux.intel.com,
	mingo@redhat.com, kprateek.nayak@amd.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, connoro@google.com, jstultz@google.com,
	linux-kernel@vger.kernel.org, arighi@nvidia.com
Subject: Re: [PATCH v3 1/2] sched/numa: Drive NUMA task tick from execution
 context
Message-ID: <20260909083735.GK776954@noisy.programming.kicks-ass.net>
References: <20260904085244.799276-1-sh_def@163.com>
 <20260904085244.799276-2-sh_def@163.com>
 <20260908083545.GM4121339@noisy.programming.kicks-ass.net>
 <a89a2aef-f374-4fd6-aafe-ca21d21c980d@intel.com>
 <20260908104407.GD687043@noisy.programming.kicks-ass.net>
 <20260908121021.53837-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908121021.53837-1-sh_def@163.com>

On Tue, Sep 08, 2026 at 09:10:21PM +0900, Hui Su wrote:
> On Tue, Sep 08, 2026 at 12:44:07PM +0200, Peter Zijlstra wrote:
> > I also wondered if we should have task_tick() do curr_class->task_tick()
> > last, rather than first. But I couldn't immediately find a compelling
> > argument either way around.
> >
> > Updated...
> >
> > @@ -910,6 +910,16 @@ static void __used hrtick_clear(struct rq *rq)
> >  		hrtimer_cancel(&rq->hrtick_timer);
> >  }
> >
> > +static inline void task_tick(struct rq *rq, int queued)
> > +{
> > +	const struct sched_class *curr_class = rq->curr->sched_class,
> > +				*donor_class = rq->donor->sched_class;
> > +
> > +	curr_class->task_tick(rq, queued);
> > +	if (sched_proxy_exec() && donor_class != curr_class)
> > +		donor_class->task_tick(rq, queued);
> > +}
> 
> The per-class split looks good to me. I noticed a couple of details while
> going through the updated version.
> 
> First, I think there is a reason to call curr_class->task_tick() last.
> 
> For example, with an RT/DL donor and a FAIR execution context, the donor
> class tick calls update_curr_*(), which goes through
> update_curr_common()/update_se() and accounts the elapsed task runtime
> to rq->curr->se.sum_exec_runtime. If the FAIR callback runs first,
> task_tick_numa() observes sum_exec_runtime before the current tick's runtime
> has been accounted.
> 
> Calling the donor class first preserves the accounting-before-consumer
> ordering:
> 
> 	donor_class->task_tick(rq, queued);
> 	if (sched_proxy_exec() && curr_class != donor_class)
> 		curr_class->task_tick(rq, queued);
> 
> This also matches the ordering in v3, where the donor tick ran before
> sched_tick_exec_ctx().

Indeed!

> Second, task_tick() is added after hrtick_clear(), which puts it inside
> CONFIG_SCHED_HRTICK. Since sched_tick() calls task_tick() unconditionally,
> CONFIG_SCHED_HRTICK=n would leave task_tick() undefined. The helper needs
> to be outside the CONFIG_SCHED_HRTICK block.

Whoopsie ;-)

> With those changes, the split and the queued handling look good to me so far.
> I'll test the cross-class and hrtick cases, rework the series accordingly,
> and send a v4.

Thanks!
