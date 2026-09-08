Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CD64F55C0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862454; cv=none; b=dTbKf3VmScvIzaA2z1X8BnGRaWBVuH+Q3h3nZLkF+Vl6LdypTKoaA5oc+5h/2c+JFUJ1Kx8z9kQ6J7TskDsnPHThRNJthlAqcPGv1VYzckDuVnbHpbvH6VWO4L7QvJGZRsAoMWFYHXrI92vSo44twhs6+3xDaqlUzx9aSJNyYtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862454; c=relaxed/simple;
	bh=Eafz/m31gJwF+ZTHl1GXO8bjhQrD6AqWtABgTBHegR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZ9vvJQ83K2WFGxhRza8vsVCdYgur2YPVVlAbT3RDrARbuSAqe0vQbVxx5X4BF50g0NpI8BbaBulR4bWk0BLvc0KP5dct4Ud/eQzPgjjpGJWrf+QVQkq36NQuWZJg1AaRPUyJw+t8TfnYodEHMEpZVuTTtKP7sEIWDvhscwHILo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DjF0kkNN; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DjF0kkNN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j70+Q1wkkEdPXNf/AtEPTMS8PCzc+evpEhRMVT0Ndfs=; b=DjF0kkNNwJJlgBPUDhWqfXXUSw
	MGM7JP1WkWGkRdU39kMrK5SbaSEobz7NvZDPxFBI+V57xiFDbDV5VmujGHqdhtApgEaHpl9dX+arQ
	j2PsbkZ3f8UJcmQ5Qf3rEfV8gFUjZ2o5tWkPEbCuxuliFQWYAE3dCLzaVdbLlhNjz9OnI1QJdHHoB
	RDzOK+R1025Jxlj7HIhV24aJhSHYKvwTxMoFjwR0fBpz6lS98nJCiCxaD+U7Wn5r0kTy7A1IYE2G9
	vpOxHUDS5BkBoKfjcEWaFOrJKjOBSqDXzRmSIAjAMJzTfZrpRm7BC3Hf9nmsEkwoMzabh5phg7uBx
	Dn3syYzg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sq5-000000083wy-3q23;
	Tue, 08 Sep 2026 10:14:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CDE053005AF; Tue, 08 Sep 2026 12:14:04 +0200 (CEST)
Date: Tue, 8 Sep 2026 12:14:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Richter <tmricht@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, hca@linux.ibm.com, sumanthk@linux.ibm.com
Subject: Re: [PATCH] perf/core: Allow list_del during perf_event_overflow()
Message-ID: <20260908101404.GP4121339@noisy.programming.kicks-ass.net>
References: <20260908064759.1241413-1-tmricht@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908064759.1241413-1-tmricht@linux.ibm.com>

On Tue, Sep 08, 2026 at 08:47:59AM +0200, Thomas Richter wrote:
> A PMU might use perf_sched_cb_inc() and perf_sched_cb_dec()
> interface to get the PMU call back function pmu::sched_task
> invoked at schedule in and schedule out. This is achieved
> by walking along the list anchored by sched_cb_list.
> 
> The following scenario might lead to a list corruption.
> 
>    perf_pmu_sched_task()
>       for_each_list_entry(..., &sched_cb_list)
>       +--> __perf_pmu_sched_task()
>            +--> event->pmu->sched_task())
>                 +--> PMU_push_sample()
>                      +--> perf_event_overflow()
>                           +--> __perf_event_overflow()
>                                +--> pmu->stop()
>                                     +--> perf_sched_cb_dec()
>                                          remove entry from sched_cb_list
>                                          while list node in use.
> 
> This happens when ioctl(fd, PERF_EVENT_IOC_REFRESH, xxx) has been
> invoked and perf_event::event_limit hits zero.
> 
> Prevent the list corruption and convert for_each_list_entry()
> to for_each_list_entry_safe().
> 

This reads like it wants a Fixes tag.

> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Thomas Richter <tmricht@linux.ibm.com>
> ---
>  kernel/events/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index a6c8e38a3110..cdd9518ac046 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -3925,13 +3925,13 @@ static void perf_pmu_sched_task(struct task_struct *prev,
>  				bool sched_in)
>  {
>  	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
> -	struct perf_cpu_pmu_context *cpc;
> +	struct perf_cpu_pmu_context *cpc, *cpc2;
>  
>  	/* cpuctx->task_ctx will be handled in perf_event_context_sched_in/out */
>  	if (prev == next || cpuctx->task_ctx)
>  		return;
>  
> -	list_for_each_entry(cpc, this_cpu_ptr(&sched_cb_list), sched_cb_entry)
> +	list_for_each_entry_safe(cpc, cpc2, this_cpu_ptr(&sched_cb_list), sched_cb_entry)
>  		__perf_pmu_sched_task(cpc, sched_in ? next : prev, sched_in);
>  }
>  
> -- 
> 2.55.0
> 
