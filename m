Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21292531B13
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072269; cv=none; b=tj2s5nSlUjOLtXiZiYwid1PrUomx1MUP9ZLCFhGCUUzrFq1OPvevWyacvi0OmH1wXNmYDimLsrOOLWyrf9U2DaIQoZrMf5mRl+/46t3AhrSybEQU0UwsnrBTBvKhTWEhxh0bSEDnruo7BkmmOIpfQGF6dpkK0pbJzrcSO4X/Hrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072269; c=relaxed/simple;
	bh=mRrobkzCGIrxmh7BU/1/jNqIY+NwaI8rP+gPQjeJtwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9IP8nhyvs1uZEc0uXBqHNIZ3RqR81dxpYq2rx//DqbF4IRjEWDtb0kMiY6jgKanTsvYpPf+YDr7slvA28WsPc2ead7xYDVPfui0XaKJl4DpjY4NMtWsBqpMHEFnCn2kRV6yN6HCeN8R0UfBmp//4aYJA0hEXRQCR6K2U1z64RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Y8iQLF2q; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Y8iQLF2q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0aW2lUePGbmEJjrx+0hSLeO+bHodU7SZ9PSZrM0aV1s=; b=Y8iQLF2qqMP9WHoO8+bTa9kcYj
	f0TuqvWRMHBkTIIvu4S0lzHnyOzlb1imT2xY5CMT+YF7z/keWnZLXFB8WQ6GJ1gjsDJdsfsosgrbb
	SweM5oygkPwE5NK64CrVuk0jrFHIlh767X5SmpZRwSWWJ8oFiVfHcGycD92PJU+EncdtbbK9MFkpd
	SMK/eq1gZuwaiFhflgJUFiFTL2M5VSMs10akbuQgt0dHFjft4z21Zmhc93QUy4fR/AKImZItNpneM
	lVNyqopkGbjseUREfAqeQsSSC1840H1gx2B4dUCT64+u4ztIONJItspJAWvaROHBDfK0jGnTkWDY+
	3YboFuUg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8xZ9-0000000DQhJ-3Z51;
	Tue, 22 Sep 2026 10:17:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1E0A83008D6; Tue, 22 Sep 2026 12:17:35 +0200 (CEST)
Date: Tue, 22 Sep 2026 12:17:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, qyousef@layalina.io
Subject: Re: [PATCH 6/8] sched/eevdf: Add per cpu cached min_slice
Message-ID: <20260922101735.GR776954@noisy.programming.kicks-ass.net>
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
 <20260921152238.3804392-7-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921152238.3804392-7-vincent.guittot@linaro.org>

On Mon, Sep 21, 2026 at 05:22:36PM +0200, Vincent Guittot wrote:
> In order to use min_slice during cpu selection, update a cached value when
> needed after en/dequeing a new task. This cached value includes current
> task.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  kernel/sched/fair.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 739a3af60520..a01a88dde811 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1089,6 +1089,21 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
>  RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
>  		     run_node, min_vruntime, min_vruntime_update);
>  
> +static DEFINE_PER_CPU(u64, rq_min_slice) = INT_MAX;

Would it not be better to place this in struct rq, near data that is
already accessed in select_idle_siblings()? This more or less guarantees
a cache miss.

> +static u64 get_rq_min_slice(struct rq *rq)
> +{
> +	return READ_ONCE(per_cpu(rq_min_slice, cpu_of(rq)));
> +}
> +
> +static void __update_rq_min_slice(struct rq *rq)
> +{
> +	u64 min = cfs_rq_min_slice(&rq->cfs);
> +
> +	if (min != get_rq_min_slice(rq))
> +		WRITE_ONCE(per_cpu(rq_min_slice, cpu_of(rq)), min);
> +}
> +
>  /*
>   * Enqueue an entity into the rb-tree:
>   */
