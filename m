Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31C3368957
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073988; cv=none; b=fcFBZCMCSEvDR/qeolqp4S4eIPWjk+01ZTzHhT6J2h3cFqx+fR6r306R33lukBe4tIHbFFw97hh6SdGlDC+4TxCi3DKQ1L9LzH523KUs6Jl+OKsPH1H/FLao61pSw5DD1s8HYZbXwKGGupKAhIr0Y2dbuGksygISLOwSByFKYHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073988; c=relaxed/simple;
	bh=+Wcn6V2p67xgY+SeAp4rSHsqiUTsOBFgWUjNZV9XSkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1MsyiTDIpbIrKhnQYOfKEry+pjhilrQ6E3ZzpyLbt/Bd3TbxOGcx6FHLZSfTKrNCUqvAQHfY/Ssc43DaoSUj2T7xFc8hWGLJjMIG56thD7xfHDmYM9jMNNrRHRac+ScVmgFj+rsGkAaoJS+oArYIKe9a+VKUwzZyeHlae2un0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=q8ilHDJE; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="q8ilHDJE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uUB7mN08z9xJ1kSnGw8gqOV1OKIJcMzNPUn7E8wcDwA=; b=q8ilHDJEE4bUnavhiRkasSbzjC
	iGgOzBHDRdI8vIF070z3ze91Fxh2py5LKUyP2eyxatbEO2iIklhOSccntsn10OT8ynUlCr3fIwOzX
	uEWeL98/Vv8WpCZ3T1DpOmtPllyxk6QXTJdbES5L7Xb+UgBxsSZa/mAF/UqxB1PpEY23tfMHbTv01
	wQWryoghIuaYLX+osNHtMaPaydefRpxXX6DjTmE0/JfRBBA77uasWcXUndZH+DC70DBY6aWTArr5k
	3esfXfHB5E3aLiXtLOuOJXw3pMT9cd8v/dodM68lhT0o3OCp3VAEaBbnyN7xAYa36KwBxiyovga0p
	xjySnLmA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8y0p-0000000DSTO-0lib;
	Tue, 22 Sep 2026 10:46:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 094AB300708; Tue, 22 Sep 2026 12:46:10 +0200 (CEST)
Date: Tue, 22 Sep 2026 12:46:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, qyousef@layalina.io
Subject: Re: [PATCH 8/8] sched/eevdf: Add min slice check when selecting CPU
Message-ID: <20260922104609.GS776954@noisy.programming.kicks-ass.net>
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
 <20260921152238.3804392-9-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921152238.3804392-9-vincent.guittot@linaro.org>

On Mon, Sep 21, 2026 at 05:22:38PM +0200, Vincent Guittot wrote:
> Add a new level for selecting CPU when select_task_rq_fair() fails to find
> an idle CPU. This last level will compare the slice to select a CPU where
> the task could run 1st.
> This helps a waking task to select a CPU where a longer slice runs
> instead of one where a task with the same or shorter slice already runs.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  kernel/sched/fair.c | 63 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 452da94289fe..5c9add3e853c 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9023,6 +9023,59 @@ static inline bool asym_fits_cpu(unsigned long util,
>  	return true;
>  }
>  
> +static int select_slice_cpu(struct task_struct *p, struct sched_domain *sd, int target)
> +{
> +	unsigned long task_util, util_min, util_max;
> +	int cpu, nr = INT_MAX;
> +	u64 slice = p->se.slice;
> +	struct cpumask *cpus;
> +
> +	if (sched_feat(SIS_UTIL) && sd->shared) {
> +		/*
> +		 * Same nr_idle_scan hint as select_idle_cpu(), nr only limits
> +		 * the scan when not preferring an idle core.
> +		 */
> +		nr = READ_ONCE(sd->shared->nr_idle_scan) + 1;
> +		/* overloaded domain is unlikely to have idle cpu/core */
> +		if (nr == 1)
> +			return -1;
> +	}
> +
> +	cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
> +	cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
> +
> +	if (sched_asym_cpucap_active()) {
> +		task_util = task_util_est(p);
> +		util_min = uclamp_eff_value(p, UCLAMP_MIN);
> +		util_max = uclamp_eff_value(p, UCLAMP_MAX);
> +	}

This all seems duplicated from select_idle_siblings(), and while I
appreciated the breaking into functions, I do worry about the duplicate
work done too.

> +	/* Those CPUs have been tested not being idle and fiting */
> +	for_each_cpu_wrap(cpu, cpus, target) {
> +		/*
> +		 * Stop when the nr_idle_scan is exhausted (mirrors
> +		 * select_idle_cpu() logic).
> +		 */
> +		if (--nr <= 0)
> +			return -1;
> +
> +		if (slice >= get_rq_min_slice(cpu_rq(cpu)))
> +			continue;
> +
> +		if (sched_asym_cpucap_active()) {
> +			int fits = util_fits_cpu(task_util, util_min, util_max, cpu);
> +
> +			/* Perfect fit: capacity satisfies util + uclamp */
> +			if (fits > 0)
> +				return cpu;
> +		} else {
> +			return cpu;
> +		}
> +	}

And it does seem like a waste to re-scan the CPUs we've already visited.
Can't we keep track of the minimal slice CPU that was not idle during
our initial scan?


diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 2ad46fb2eafe..d3ab945f50ba 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9179,6 +9179,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	struct sched_domain *sd;
 	unsigned long task_util, util_min, util_max;
 	int i, recent_used_cpu, prev_aff = -1;
+	int best = target;
 
 	/*
 	 * On asymmetric system, update task utilization because we will check
@@ -9263,8 +9264,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 		 * capacity path.
 		 */
 		if (sd) {
-			i = select_idle_capacity(p, sd, target);
-			return ((unsigned)i < nr_cpumask_bits) ? i : target;
+			i = select_idle_capacity(p, sd, target, &best)
+			if ((unsigned)i < nr_cpumask_bits)
+				return i;
+			return best;
 		}
 	}
 
@@ -9282,7 +9285,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 		}
 	}
 
-	i = select_idle_cpu(p, sd, has_idle_core, target);
+	i = select_idle_cpu(p, sd, has_idle_core, target, &best);
 	if ((unsigned)i < nr_cpumask_bits)
 		return i;
 
@@ -9297,7 +9300,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
 		return recent_used_cpu;
 
-	return target;
+	return best;
 }
 
 /**
