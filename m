Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586094;
	b=tgUy/F9b00aM7xFMzD+jpaoOYj8cSX15CLebUaYijgWILn5CHSH7sXbAn5jMLH7tT+k4
	 8jlk9drGmTWBsbdpuK/MYhHAPnr3hdjyivuqTSljvfUdIJzOLEvAV0kixpkZJPE+765Ex
	 B0ssaGSWgYRuVqzbE7xb6F8+aFmIBsqgco7SsIR5Xw5X/pDe8Nb131JvUCf2FkPBstA7a
	 4YmCtJAqpioAxxiHSF1mXFrAFIxH+IxbqZAW2hWH2qhzcfEFrOhbg0kafZDIq4OkDnm9A
	 qI7xF1ClLA74rWT2AAMWOvbaAfYeGuq1BvCgROxIGZO1nygxX6SMvYQfuK/PK4lWhRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586094;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lXwycWPiBzi1+fEunz28otOYwhLIrT1B1MPZ7XmO1dA=;
	b=SHmn2QqK9TvuoQMxjluU/UrLLYjNcROO1syUkSpSLgER7hUuCG6+HEu8Ul2hnvZkWsXH
	 Vm3ATT2P0C+cSqZ9WjSa2/1YOwXCR2EiKcTjTHYjfxpTKfMLZZIDLUU23Xt3aOl+X8PCE
	 DaXxnzddz/3leo3ZGxWuGCh8rhgsJuJdldUZTa2GMc1iTPxHEB/n6wh6UKQZtDi4NteYk
	 erfS8og8WoPeYFFKv2KZC3T912a7gJKfz/YFR4bH83vfrPodZqdDIoe8zqAasMca4bjgN
	 jYNadRAlGefP0aX6SzFCANga2iGJv7F8pIw3Tyj3InS8Us0xtzhqGmna+Xt+sXDDyfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=JNf7qi6f;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94D860A380E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D94D860A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=JNf7qi6f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lXwycWPiBzi1+fEunz28otOYwhLIrT1B1MPZ7XmO1dA=; b=JNf7qi6fyvW3+UvUeaAtN24q6W
	boujn0NKHoGfwWUbXI88j735X9WvUu7uBZxontwto+bTsX/4cYOc35n6e3HJ9D5T8fyauHdMsfXA7
	bdHvwr7UrJp7ZcXlFVRfVfa1WeSSBqnEprdy1D0dPOPH8scB/c7Oz4ZWbhWgjRYcteEnw6dgUyW4N
	qGRrygIZbS/fED2Ic33A/qbTQL4jfloB89ZnifWPwUyd/CJyWivpXzXincwdVbfhFAKHxkihglh1G
	5t4R6NM5kv1TH6IBbOvbq55GY11CjlhqFk5EQMvxcWiRyPGeaYn03+A3G5XGjbQdHY0QhrurV0S04
	cHNW/VkA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJVWh-00000005nhN-1pG5;
	Wed, 21 Oct 2026 12:34:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2DA2F3007A4; Wed, 21 Oct 2026 14:34:38 +0200 (CEST)
Date: Wed, 21 Oct 2026 14:34:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Li kunyu <likunyu@open-hieco.net>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, "Li Wang (Hieco)" <li.wang@linux.dev>
Subject: Re: [RFC PATCH 1/6] sched/fair: Add SMT sibling push in periodic
 load balance
Message-ID: <20261021123438.GG2823843@noisy.programming.kicks-ass.net>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <20261020083746.37068-2-likunyu@open-hieco.net>
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
In-Reply-To: <20261020083746.37068-2-likunyu@open-hieco.net>

On Tue, Oct 20, 2026 at 04:37:41PM +0800, Li kunyu wrote:

Just a few remarks on coding style while I try and make sense of the
whole thing. Don't go rush out a new version with this stuff fixed
before you've seen feedback on the higher level stuff.

> @@ -14226,6 +14244,94 @@ update_newidle_cost(struct sched_domain *sd, u64 cost, unsigned int success)
>  	return false;
>  }
>  
> +/*
> + * An exciting thing is that we have implemented an efficient push
> + * function process.
> + *
> + * It is applied in cycle load balancing and nohz_kick process.
> + * It can help us solve the problem of high workload of CFS tasks in
> + * the RQ queue.
> + */
> +static bool smt_buddy_move_task(struct rq *src_rq)
> +{
> +	bool is_overload, is_move = false;
> +	int src_cpu = cpu_of(src_rq), smt_cpu;
> +	unsigned long src_cpu_runnable, smt_cpu_runnable;
> +	struct sched_domain *smt_sd;
> +	struct task_struct *p;
> +	struct rq *smt_rq;
> +	struct rq_flags rf;
> +
> +	if (!sched_feat(SMT_BUDDY_ASSIST) || !sched_smt_active())
> +		goto exit;
> +
> +restart:
> +	if (src_rq->nr_running < 2)
> +		goto exit;

Did this want to be:

	while (src_rq->nr_running > 1) {

> +
> +	rcu_read_lock();

	scoped_guard (rcu) {

> +
> +	is_overload = false;
> +	src_cpu_runnable = cpu_runnable(src_rq);
> +	for_each_cpu(smt_cpu, cpu_smt_mask(src_cpu)) {
> +		if (smt_cpu == src_cpu)
> +			continue;
> +
> +		smt_cpu_runnable = cpu_runnable(cpu_rq(smt_cpu));
> +		if ((src_cpu_runnable * 100 > smt_cpu_runnable * sysctl_smt_buddy_imbalance_pct)
> +			&& cpu_active(smt_cpu)) {

This is horrifically bad indenting. Operators go at the end of the
previous line and then you indent to the level of whatever ( is active.
If you're a vim user 'cino=(0' gets you that.

> +			is_overload = true;
> +			break;
> +		}
> +	}
> +
> +	if (!is_overload) {
> +		rcu_read_unlock();
> +		goto exit;

This pattern should scream at you for doing it wrong.

> +	}
> +
> +	smt_sd = lowest_flag_domain(src_cpu, SD_SHARE_CPUCAPACITY);
> +	if (!smt_sd) {
> +		rcu_read_unlock();
> +		goto exit;

And again.

> +	}
> +
> +	rcu_read_unlock();
	}
> +
> +	rq_lock_irqsave(src_rq, &rf);

	scoped_guard (irqsave) {
		scoped_guard (rq_lock, src_rq)

> +	smt_rq = cpu_rq(smt_cpu);
> +
> +	struct lb_env env = {
> +		.sd             = smt_sd,
> +		.dst_cpu        = smt_cpu,
> +		.dst_rq         = smt_rq,
> +		.src_cpu        = src_cpu,
> +		.src_rq         = src_rq,
> +		.idle           = 0,		/* __CPU_NOT_IDLE */
> +		.flags          = LBF_ACTIVE_LB,
> +	};
> +
> +	/* Update the src_rq clock only once when migrating tasks. */
> +	if (!is_move)
> +		update_rq_clock(src_rq);
> +
> +	p = detach_one_task(&env);
> +	if (!p) {
> +		rq_unlock_irqrestore(src_rq, &rf);
> +		goto exit;

More of the same bad pattern.
	
> +	}
> +
> +	rq_unlock(src_rq, &rf);
		}
> +	attach_one_task(smt_rq, p);
> +	local_irq_restore(rf.flags);
	}
> +	is_move = true;
> +
> +	goto restart;
	}
	
> +
> +exit:
> +	return is_move;
> +}
