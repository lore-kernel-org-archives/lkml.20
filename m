Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5F951EE0F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867753; cv=none; b=GCxNLoTiAcvs0tftVVAKkOblPDDiZc23S3bMX/vufzxStr4eDiVlPvTsWRzpp231GPD4GDBvxPOXeFtl+wD4nF//GficWJu/XVnXUp5hpPgb4lIwudRHRvhPdTi4fFc5++2lH+TRk99ulq7k8SUgtb5RRLnqlmijopGewOYFLGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867753; c=relaxed/simple;
	bh=0acYuBFdiVAQXH+OKXXYOyx6nppCgH/7vJjjLNhh0As=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/aaR7dLxvEaf5q9e+XGvBytp7oYhI0Ga/fB1MfzhXNY983intxFV20rlEsqqA+SuLuRQDsgh0vFBT1WGgGzxwMDnnN/JFG425m08gh1pdKqNKQKsaaNARKg1avV7rY1pqxObDQPfx0ezXKbhcz3NwZ6upWPLIL3DnW5LzGQV9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GN7qKfOc; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GN7qKfOc"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F770497;
	Thu,  1 Oct 2026 08:15:47 -0700 (PDT)
Received: from [10.0.130.165] (e127648.arm.com [10.0.130.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF73B3F86F;
	Thu,  1 Oct 2026 08:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790867750; bh=0acYuBFdiVAQXH+OKXXYOyx6nppCgH/7vJjjLNhh0As=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GN7qKfOc1iYLT5VzGamMapu5utlpbUJrOlaZpg5Q4t70TFY8NQCTfhg0yKoVUnM2Z
	 wUxoIehnRF6pOdlAk8tFA/1gHUxD7aISJvccXphYD1ERRc77RwsTbjRIUOTG0AqOCZ
	 2TALydMMHFcmsCJZiA5ElcHyLcNsHdxh3b/7NFnc=
Message-ID: <b37e8f1c-0cc7-4ca1-9e40-620d908464bf@arm.com>
Date: Thu, 1 Oct 2026 16:15:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] sched/eevdf: Add min slice check when selecting CPU
To: Vincent Guittot <vincent.guittot@linaro.org>, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org
Cc: qyousef@layalina.io
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
 <20260921152238.3804392-9-vincent.guittot@linaro.org>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20260921152238.3804392-9-vincent.guittot@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/21/26 16:22, Vincent Guittot wrote:
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
> +
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

Maybe even additionally look for the rq with smallest
current->vprot - current->vruntime?

It's an interesting approach, OTOH of course it disincentivizes longer slice
tasks again. I'd be interested what this looks like on a full workload
with different slice lengths.
