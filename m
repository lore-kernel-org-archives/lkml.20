Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE36647254D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932883; cv=none; b=IT6YBN+7uK67UojkMbG3NTe2TLrs3RrGouk/71K2rCxelJKYx2wvzP+7yBtu4qcexETFoZqcKLu9PJewgkHNkTZglYhkpC8TIvnQPDr80D6LAlcYQXqIiurSgzPc3FuG1GOiH6totoKWGhNZd7tErW9CsDsvTjO4wZwRsV3N/X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932883; c=relaxed/simple;
	bh=q8WJrseoE/kdUf7SKPGM0R/KR+dIfSqwElqBeMaralk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jeLufMrLDo7e1EfRLiCHqW7FEV1SzpAChHGTLEPMC1br2JP9md5fdy21pLO5gaCl9KH2VulYe7N7PSklWocYN4Ij9MSOAP54C3BrqpK4EBH9mQ0MBvVjGg/bYBW3RxziN3WS+DvIfdzqXMsb2mtac59zGUAx4HnoY2hssrUhMe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ntZ4zosL; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ntZ4zosL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u9ergtYYHUXVdb3fBfoORzF1nd08xTwKjVKvujrYIPg=; b=ntZ4zosL/P8rYDVbtlBIwPMFAH
	6Bm6EnwvULu6d5ILKpbqfzjxPArrMiQqZFGobDks1xTnYC5Cadb8skw/p2mEdoIekElL2KO6+4RVc
	guZMLSUg2Te9Z7Nll1GTrePnUEFPmnLWv7Diy5CzMLpAdg6OXEhM5g0lQsFC2emVwiwqN57zxlfZ3
	bLxJbrMbSYz9CwnNs4dLJnc7heJsOpimTvWShHbpAA96MM7sJeazFgx3Ig7JuSGW0rbi0jKNTFIHv
	64K7gcZqzuGOrv58yI2PcwPe05f8p3J0QPG5hYkVA4/v0tYsCHEAZ3Zr9dFMUjfY7RDegvPZsj9ZG
	zGjZbpuw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZRs-0000000GWp6-0Pvv;
	Fri, 02 Oct 2026 09:21:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 03322300390; Fri, 02 Oct 2026 11:20:59 +0200 (CEST)
Date: Fri, 2 Oct 2026 11:20:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Andrea Righi <arighi@nvidia.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Haufe <dhaufe@simplextrading.com>,
	Cao Ruichuang <create0818@163.com>,
	Furkan =?utf-8?B?w4dhbMSxxZ9rYW4=?= <frn1furkan10@gmail.com>
Subject: Re: [PATCH v2] sched/deadline: Make dl-server nohz full aware
Message-ID: <20261002092058.GA409038@noisy.programming.kicks-ass.net>
References: <20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com>
 <20261001142735.GT2009045@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001142735.GT2009045@noisy.programming.kicks-ass.net>

On Thu, Oct 01, 2026 at 04:27:36PM +0200, Peter Zijlstra wrote:

> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index 0663c00c41c0..5388bde93410 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -401,6 +401,7 @@ static void __dl_clear_params(struct sched_dl_entity *dl_se);
>   */
>  static void task_non_contending(struct sched_dl_entity *dl_se, bool dl_task)
>  {
> +	enum hrtimer_mode mode = HRTIMER_MODE_REL_HARD;
>  	struct hrtimer *timer = &dl_se->inactive_timer;
>  	struct rq *rq = rq_of_dl_se(dl_se);
>  	struct dl_rq *dl_rq = &rq->dl;
> @@ -459,8 +460,10 @@ static void task_non_contending(struct sched_dl_entity *dl_se, bool dl_task)
>  	dl_se->dl_non_contending = 1;
>  	if (!dl_server(dl_se))
>  		get_task_struct(dl_task_of(dl_se));
> +	else
> +		mode |= HRTIMER_MODE_PINNED;
>  
> -	hrtimer_start(timer, ns_to_ktime(zerolag_time), HRTIMER_MODE_REL_HARD);
> +	hrtimer_start(timer, ns_to_ktime(zerolag_time), mode);
>  }
>  
>  static void task_contending(struct sched_dl_entity *dl_se, int flags)
> @@ -1061,6 +1064,7 @@ static inline u64 dl_next_period(struct sched_dl_entity *dl_se)
>   */
>  static int start_dl_timer(struct sched_dl_entity *dl_se)
>  {
> +	enum hrtimer_mode mode = HRTIMER_MODE_ABS_HARD;
>  	struct hrtimer *timer = &dl_se->dl_timer;
>  	struct dl_rq *dl_rq = dl_rq_of_se(dl_se);
>  	struct rq *rq = rq_of_dl_rq(dl_rq);
> @@ -1112,7 +1116,9 @@ static int start_dl_timer(struct sched_dl_entity *dl_se)
>  	if (!hrtimer_is_queued(timer)) {
>  		if (!dl_server(dl_se))
>  			get_task_struct(dl_task_of(dl_se));
> -		hrtimer_start(timer, act, HRTIMER_MODE_ABS_HARD);
> +		else
> +			mode |= HRTIMER_MODE_PINNED;
> +		hrtimer_start(timer, act, mode);
>  	}
>  
>  	return 1;

Bah, this would require something like:

  hrtime_start_on(timer, act, mode, rq->cpu);

which we don't currently have. The problem is that on remote enqueue, we
can start the dl-server remotely, and it then being pinned, means its on
the 'wrong' CPU.

Doing remote hrtimer_start isn't entirely trivial either. So scrap this
for now :-(
