Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009588;
	b=ZoRztwWZETuqon7TYtsK0/VUHVewTSkAM4sTYROW4y67Mj5cUUyJJ8W804rRtVEJbcfz
	 XdwTcSARAb0OmLjbZlj1bXMzr4npD6jBiMr4ISHl2WuIOSzl18w1N4bdrZ+bJD4XsRyFR
	 wlvFwCsf7pY54LfS/zZ5eCegX03/DAGfJmedcAgTp1pBIrFcfpiwkuUe3FsXP3YppPeHV
	 FJ7toHKlJYOmtrXJbL9v7H0eTH7jTe4U58cfNTU8JtXpECqSddE6D9Oy4mEGvj+JTfJCx
	 X59Wle4PC2KPWkgQ2QfCVWjPb3IvHBpbrU3HZt6EKvJkiZY3hmFgG9ywV1s2w42n72Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009588;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=nESduMqia6gP/rxZ9IW15LDaNeBLJQQduuyyyp24WF4=;
	b=fbkr/x5iY7p1l2udGbg6CUODKDpXTDFIgXtyk3TRenQN5g9DKb09vZADY5WleSQHcZst
	 0sIARym7GtqoSk3VbqthvyKOz5ZEvauvL0rR3Rrzg7kMNpB5t76i8uf+v7IgsrjqmhF7W
	 IaPNcG/aqvVUTHH+wyt1qxjpmdTIq86/k4nKadGWR6e8sV5AXdisLZ9YsiLIM+TDU/Q/S
	 3wuGoh3qTYr29xfZJ/jDExBQcypFlL3zrWdMos5DeGBsh68RmG3tmxV4PldOdOFSdBpvn
	 4eTGxyz1OSLZ2Vhye9IKjwuNwRVbYR2fwSef0JbUNesLmnIHfEY+mDNnF7pqJF6RyAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BKeCC0N8;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7791A606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7791A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BKeCC0N8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nESduMqia6gP/rxZ9IW15LDaNeBLJQQduuyyyp24WF4=; b=BKeCC0N8FdK+zM2O8LOPyYlCMN
	XeAaerQyAdn3wU3IN8eUf5nM83W75IJU04tw7ukkj8yzBt+QjAMYQaO3b/JikxFSDrZHDB7zltGsk
	0+PIJWUvpoDMNueID6beoyyfW4PlJcV3qr/kCvLJwpfWVnTuesnc88KBshGxHXeod3hgy424nCgta
	tRqHRRd3LH81KQ3DzaXM0/cJrdpmp2XMiegqdiucd2DvdYTrBl25BPRpa6XSWKxpim0lA6w0I/+oF
	kAtdXrF8oupJLQeo3z3wDKP2GKdT4MtdBRVhJRoiDxGJ9/7HApXDfIDWlg7DF45x97m+kCTg9W13i
	iKrczC8Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHhI-0000000DgL5-2k3c;
	Mon, 26 Oct 2026 10:12:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F24F3300DB9; Mon, 26 Oct 2026 11:12:54 +0100 (CET)
Date: Mon, 26 Oct 2026 11:12:54 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	Wei Wang <wvw@google.com>
Subject: Re: [PATCH v2] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
Message-ID: <20261026101254.GA2668200@noisy.programming.kicks-ass.net>
References: <20261025162612.360033-1-qyousef@layalina.io>
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
In-Reply-To: <20261025162612.360033-1-qyousef@layalina.io>

On Sun, Oct 25, 2026 at 04:26:12PM +0000, Qais Yousef wrote:

> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> index 76f3c84ca6846..950e2885bba63 100644
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -502,6 +502,23 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
>  	 * lost_idle_time of clock_pelt
>  	 */
>  	update_idle_rq_clock_pelt(rq);
> +
> +	/*
> +	 * Due to a race condition when enabling sched_uclamp_used static key,
> +	 * we can end up with imbalance where uclamp_rq_inc_id() has happened
> +	 * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
> +	 * the static key flipped. The race condition is unlikely, but ensure
> +	 * the uclamp_rq() state is set properly on each entry to idle.
> +	 *
> +	 * The reset will cause the uclamp_max from uclamp_idle_value() to be
> +	 * lost. Since we are imbalanced, hard to know what is right. So just
> +	 * cleanup. This should be a transient error state once we recover
> +	 * everything should work as expected.
> +	*/

Whitespace fail here.

> +	if (uclamp_is_used()) {
> +		if (unlikely(uclamp_is_imbalanced(rq)))
> +			init_uclamp_rq(rq);
> +	}
>  }
>  
>  struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 7d2ec527b8a25..47dcfd74e150f 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3704,6 +3704,7 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
>  #ifdef CONFIG_UCLAMP_TASK
>  
>  unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
> +void init_uclamp_rq(struct rq *rq);
>  
>  /*
>   * When uclamp is compiled in, the aggregation at rq level is 'turned off'
> @@ -3783,6 +3784,33 @@ static inline unsigned int uclamp_bucket_id(unsigned int clamp_value)
>  	return min_t(unsigned int, clamp_value / UCLAMP_BUCKET_DELTA, UCLAMP_BUCKETS - 1);
>  }
>  
> +static inline bool __uclamp_is_imbalanced(struct rq *rq, enum uclamp_id clamp_id)
> +{
> +	struct uclamp_bucket *bucket = rq->uclamp[clamp_id].bucket;
> +	int bucket_id = UCLAMP_BUCKETS - 1;
> +
> +	/*
> +	 * On idle all bucket.tasks must be 0, or we have hit imbalance
> +	 * problem.
> +	 */
> +	for ( ; bucket_id >= 0; bucket_id--)
> +		if (bucket[bucket_id].tasks)
> +			return true;
> +
> +	return false;
> +}
> +
> +static inline bool uclamp_is_imbalanced(struct rq *rq)
> +{
> +	enum uclamp_id clamp_id;
> +
> +	for_each_clamp_id(clamp_id)
> +		if(__uclamp_is_imbalanced(rq, clamp_id))
> +			return true;
> +
> +	return false;
> +}

Anyway; I was thinking, since we have a hole in struct uclamp_rq; and
also uclamp_flags. Can we fold uclamp_flags into the hold, and also use
UCLAMP_FLAG_IDLE to detect if we need this bucket scan at all?
