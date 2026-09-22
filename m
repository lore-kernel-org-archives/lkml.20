Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914714DA9B8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071363; cv=none; b=srBi47gQ8R4zXy/bNmZyyxWYoszZ/C0Ct50TswpM2lKipqRI1UueyngfT2+GYsV1DnbFwXAWH+uPFYiR04ogr2bYgi3KgnURLaG0B5UB60B+cqwYhmRS7gMXR3lUD0CRqVQDw5lzHVM+nJG3TgQqHisturTLmEVWgmZbv98VWG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071363; c=relaxed/simple;
	bh=WWM2EFbzIc5ww9VfdftvDBxSKW+iXLMKoaXkmXKLpDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idohDsZMpsMpKTZAhPZfZ5cPqhRlxjP5sfCrkdq1kSLThWlyQdxCeDNe0x5cZ8JwSyxzZuTBdDWfNFxzUxr8QVlEhFRWQDKyENOvw0MVC0hQrqYHIRL4NSRyCFhl20p9nbB8Fva+PS4bV0gIrF2hZAczG7bEAdon8lQssyDaqC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=h9C0Vxas; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="h9C0Vxas"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1Le5V/iln+hZT8HI4QA6CNSCWrPk/YNdj3lk/dCc+/g=; b=h9C0VxasqbeZIyE13xaQsBFnY5
	Du4paS8YlzFxOo0zp17Vl7qfLPH/q/60UxWs/IY1pAxNzYD7cx/eHhDVomkQnKOYQ5c0D8j/E5tZ4
	aKYK/wbSKex/XzY2S1Aj0nULLTxvLPgd7vpTS0Z4uj2zbV8vOEHE8sJRywJYjBZlw0uwRXtaUGRz8
	/CAAS3qfUnBFN7F58o2C9Pb0+IrbtZVS6Rg1oEeOTkHaj9g/kxjmRmjKx5e2ejiN+e24PC1w5gNES
	0H2b5b1V15xYVVH7l4J3BDT+P4XzMS+ckRYemFcxSnIzukiu3GfaWbKdonDloKXBRUoqJBMzuiLSP
	8N+HcfNQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8xKc-0000000DPeM-1ccu;
	Tue, 22 Sep 2026 10:02:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9C892300708; Tue, 22 Sep 2026 12:02:33 +0200 (CEST)
Date: Tue, 22 Sep 2026 12:02:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, qyousef@layalina.io
Subject: Re: [PATCH 4/8] sched/eevdf: Decay positive lag of sleeping entities
Message-ID: <20260922100233.GP776954@noisy.programming.kicks-ass.net>
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
 <20260921152238.3804392-5-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921152238.3804392-5-vincent.guittot@linaro.org>

On Mon, Sep 21, 2026 at 05:22:34PM +0200, Vincent Guittot wrote:
> Similarly to delayed dequeue that enables an entity to decay its negative
> lag while sleeping, a task should not keep a positive lag forever.
> 
> The sleep duration and the weight of the entity is used to decay the
> positive lag at wakeup.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  kernel/sched/fair.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index e6eb9a4c03be..4230954d10d0 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -896,6 +896,32 @@ bool update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  	return avruntime - vlag != se->vruntime;
>  }
>  
> +static __always_inline
> +void decay_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
> +{
> +	s64 vlag = se->vlag;
> +	s64 delta_exec;
> +
> +	WARN_ON_ONCE(se->on_rq);
> +
> +	/* Negative lag implies delayed dequeue */
> +	if (vlag <= 0)
> +		return;
> +
> +	if (flags & ENQUEUE_MIGRATED)
> +		return;

Is not this a rather prevalent case?

> +
> +	/* Compute the sleep time */
> +	delta_exec = rq_clock_task(rq_of(cfs_rq)) - se->exec_start;
> +	if (unlikely(delta_exec <= 0))
> +		return;

Urgh, are we going to try and bring back all that sleep time stuff
again? ;-)

> +
> +	vlag -= calc_delta_fair(delta_exec, se);

Should this not be 'W+w' at the very least?, ideally it would be the
complete sum of all decaying weight rather than just 'w', but that might
be a tad tricky. 

> +
> +	/* vlag can't become negative while sleeping */
> +	se->vlag = max(0, vlag);
> +}

Anyway, the basic observation is that were this thing runnable, it would
have only a w/W share of runtime, not a w/w share.

Using the full fraction of sleep time like this will make the decay too
fast.

And dealing with that MIGRATED case is somewhat important; in which case
I suppose we can try and approximate by doing something like '(W1+W2)/2
+ w'.


