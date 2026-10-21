Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586548;
	b=Ki9bW/yp5+P7Q6h/IBH4aqSk34QewqJZYk7g1t011L80fH0O+E/Bj3h2UZdowYQN26Kp
	 A3ObNiBzLwwTXpz67Q0goBs0F9DCwgsE/uZErD0QztX7VLz+3+sbU/hLydsysi0byvh9y
	 0OmO6omPeI27K8npZ/o6pbd2cIE1GD2t2VO4iugv/iksp/NiPdHKS8tnDAYdJsjMpEqmr
	 rBHJwtc0Xgz7mhmdROIT7KIZfOVH3YfSP2QNsLBu3iO8w4F5VQtrt98lE3l6Ul/63q5jh
	 98VtKG48rpGYAi5KD3eT5BZIOjBmOWtUZZ3OexiJ9kUDF+vJSl9pcUkbz2eApGJTF7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586548;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2ommWee4MyCahncwDfAzycqhXdWog0om9E1EShLfWfs=;
	b=vo+MDpJ3Z0FXiLga+44t8uf870UlIpWdV0G2W+kogEvSX0vs6CF+fpXRN3K8Ohv083yp
	 N5uhYp63fjsyDcILk8VpfVO2tBxULkVemhoO4EVEoZ78iB3dPODTHz3sGYn4YdPu2nDh7
	 TJ3w+l9xYQccFCV3ydrBA30p0h/ELjSrRv3YfYJ4/9rNXp5sLwLgmD5dWIFGXaJVsgTR+
	 d5t8o8n02AB5O6Iujw92BVCVkUpH2vINm2BGAlEZ0GzWWKXGMMUua/KNXBqZFMziuhtrM
	 5STT21Od483AG4W0hZr7riJjOQ2+O6akNG/1n3ekd7pzWfousbkTM6+5Xw8+aq3H2Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Vv72FW4J;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161B2606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 161B2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Vv72FW4J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2ommWee4MyCahncwDfAzycqhXdWog0om9E1EShLfWfs=; b=Vv72FW4JvESR4va443XTNzqalK
	59MYzmeBSwZCAm8XC2rrWoT+79HaZ7FoiyQ8NLq8xt6YWRtUYccRxHuoAxqBTMI9bRinpnGkwMKuB
	WbgzyAKxLfd9jjUt4ZNzoMWtOoKDxbbx1tfzyfvI7E559fXLMSkQ6ymKP8p9+CUQVyf5G3w5vyub0
	2yIwQxDPHgCoPbuxHYvR0Dm6mJjFV2o+uc4DHZqY1hA/bRCBfdq/5miHr9OIsS4VmpJzDe5k4rAbz
	q41Z3La9Z62OoB595IIQ8AZsQekjyTB2TqgBYlXYePWhrnpjK7GMGxgWrUPQFW6bjMuFeeH9JPUJx
	J05UCBUw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVe7-00000009Dwf-0ZQS;
	Wed, 21 Oct 2026 12:42:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AE197300720; Wed, 21 Oct 2026 14:42:18 +0200 (CEST)
Date: Wed, 21 Oct 2026 14:42:18 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Li kunyu <likunyu@open-hieco.net>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, "Li Wang (Hieco)" <li.wang@linux.dev>
Subject: Re: [RFC PATCH 4/6] sched/fair: Restrict newidle balance to LLC
 domain
Message-ID: <20261021124218.GJ2823843@noisy.programming.kicks-ass.net>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <20261020083746.37068-5-likunyu@open-hieco.net>
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
In-Reply-To: <20261020083746.37068-5-likunyu@open-hieco.net>

On Tue, Oct 20, 2026 at 04:37:44PM +0800, Li kunyu wrote:

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 6e2271484c86..f2bf4b53d8a9 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -14983,6 +14983,24 @@ static inline bool nohz_idle_balance(struct rq *this_rq, enum cpu_idle_type idle
>  static inline void nohz_newidle_balance(struct rq *this_rq) { }
>  #endif /* !CONFIG_NO_HZ_COMMON */
>  
> +/*
> + * is_smt_buddy_newidle_constrain - After enabling the smt_buddy_assist
> + *                                  feature, check whether the current
> + *                                  scheduling domain meets the conditions
> + *                                  for skipping statistics.
> + * @sd: The current scheduling domain that is to be traversed.
> + */
> +static bool is_smt_buddy_newidle_constrain(struct sched_domain *sd)
> +{
> +	if (!sched_feat(SMT_BUDDY_ASSIST))
> +		return false;
> +
> +	if (sd->flags & SD_NUMA)
> +		return true;
> +
> +	return false;
> +}
> +
>  /*
>   * sched_balance_newidle is called by schedule() if this_cpu is about to become
>   * idle. Attempts to pull tasks from other CPUs.
> @@ -15080,7 +15098,8 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
>  				weight = (1024 + weight/2) / weight;
>  			}
>  
> -			pulled_task = sched_balance_rq(this_cpu, this_rq,
> +			if (!is_smt_buddy_newidle_constrain(sd))
> +				pulled_task = sched_balance_rq(this_cpu, this_rq,
>  						   sd, CPU_NEWLY_IDLE,
>  						   &continue_balancing,
>  							false);

You could have just fiddled with SD_BALANCE_NEWIDLE, no? But instead you
went and did something inscrutable and violated coding style *again*.
Any multi-line block must have {} on.
