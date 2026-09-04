Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B21511E94
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542231; cv=none; b=sVU6Vy32DWW8ocRkbP2krK6AAllF38r5N8gQp1yGRxSaDhTWV1Kr/oB1rvH9QzLjbup9gpHrD0CUiMpWCXVWx96C2c52HNQt/kl/iw2lT5dVloyoCMz6Iq2uZoThaMjOHyUH9oSgV0XE6LSV4ygLa9tueBJ1s/URrb9KQZf4A5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542231; c=relaxed/simple;
	bh=Jj4QyleD0ZUKrok69aamvZai5mrmHlNQmRfHuu3fllw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ny0VXjbhSZXJLAfKLAqYWyg8fzbc9P7IEv5onyGKzMKEBIlGIPCHn1rNpzm8vhNY4zWj9PqdAbAsQbNNYzGdqBlLTNvqOYhV1DS10pcsZGUkdhk3fVSBF6rJzTj9/Q1U6f43QVjjsp+NzyT9lj6/QHXfQ+p+Ry0ecHCTZP1EGJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnqtcupL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnqtcupL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788542225; x=1820078225;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Jj4QyleD0ZUKrok69aamvZai5mrmHlNQmRfHuu3fllw=;
  b=lnqtcupLbttmPLoi7t1OqldZ1xPaDcIYoBuy8Gj5pzmvH6b20gPUyDYA
   AiY3zYqUohZSvH9uqcTSjuSF3HBCgdl0MH9873qzUQug7D9hn/B1HFmln
   RQVmiJeYOuxOuHJ7MwmxEe9qsDPSvew1guA3qrgwTv+U/FfI9UlFTDncU
   E2awgWt/YYauVC5BoRSFiA8EMYtdYSTJuiLkK/GBM3dvaDsVDIDnivcv1
   pdgDCovYMZk34qqjV+xZUv7a8hBDmf0I5xMgrotickZTkMCPxlrUsN/rz
   krfrpFsAdZe/YX8qZn2gu98xxhFyqWL4ePQ0gB7LT4OahqzKAJRbbkmby
   Q==;
X-CSE-ConnectionGUID: J+l0zH2NRw+K+iJcs1oYNQ==
X-CSE-MsgGUID: sZZJmYOFRq+7+dKBkht68A==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89083374"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="89083374"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 10:17:04 -0700
X-CSE-ConnectionGUID: jsXcnIOqQWWJ9U2h4ExrnA==
X-CSE-MsgGUID: ObxladWfRg2ERlmgCjHv4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="270617094"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.111.11]) ([10.125.111.11])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 10:17:05 -0700
Message-ID: <84f83c4dab930ff41cafbe614bbfa866003caa21.camel@linux.intel.com>
Subject: Re: [PATCH v3 1/2] sched/numa: Drive NUMA task tick from execution
 context
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Hui Su <sh_def@163.com>, peterz@infradead.org, mingo@redhat.com, 
	yu.c.chen@intel.com, kprateek.nayak@amd.com
Cc: juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, 	rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, 	connoro@google.com,
 jstultz@google.com, linux-kernel@vger.kernel.org
Date: Fri, 04 Sep 2026 10:17:04 -0700
In-Reply-To: <20260904085244.799276-2-sh_def@163.com>
References: <20260904085244.799276-1-sh_def@163.com>
	 <20260904085244.799276-2-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-04 at 16:52 +0800, Hui Su wrote:
> Proxy execution separates the scheduling context in rq->donor from the
> execution context in rq->curr. sched_tick() invokes task_tick() for the
> donor's scheduling class.
>=20
> task_tick_numa() operates on state associated with the task actually
> executing, including its mm and NUMA work state. With proxy execution,
> rq->donor provides the scheduling context while rq->curr identifies the
> execution context.
>=20
> Task-level execution runtime is likewise accounted to rq->curr, and
> task_tick_numa() uses that runtime to drive periodic NUMA scanning.
> Keeping task_tick_numa() under task_tick_fair() also means that it is not
> invoked when a fair task executes on behalf of an RT or deadline donor.
>=20
> Move NUMA tick handling into a scheduler helper for the execution
> context, and invoke it from both sched_tick() and sched_tick_remote().
>=20
> Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_pr=
oxy_task()")
> Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
> Signed-off-by: Hui Su <sh_def@163.com>
> ---
>  kernel/sched/core.c  | 14 ++++++++++++++
>  kernel/sched/fair.c  |  7 ++-----
>  kernel/sched/sched.h |  1 +
>  3 files changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index f78275192036..4db55e4ace9e 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5762,6 +5762,17 @@ static int __init setup_resched_latency_warn_ms(ch=
ar *str)
>  }
>  __setup("resched_latency_warn_ms=3D", setup_resched_latency_warn_ms);
> =20
> +static void sched_tick_exec_ctx(struct rq *rq)

Just a minor nit.  We could consider putting sched_tick_exec_ctx()
in fair.c and export it instead.
That allows task_tick_numa() and task_tick_cache() declaration to
remain static.

No big deal either way.

Otherwise the two patches in the series look good to me.

Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>

Tim

> +{
> +	struct task_struct *curr =3D rq->curr;
> +
> +	if (curr->sched_class !=3D &fair_sched_class)
> +		return;
> +
> +	if (static_branch_unlikely(&sched_numa_balancing))
> +		task_tick_numa(rq, curr);
> +}
> +
>  /*
>   * This function gets called by the timer code, with HZ frequency.
>   * We call it with interrupts disabled.
> @@ -5794,6 +5805,8 @@ void sched_tick(void)
>  		resched_curr(rq);
> =20
>  	donor->sched_class->task_tick(rq, donor, 0);
> +	sched_tick_exec_ctx(rq);
> +
>  	if (sched_feat(LATENCY_WARN))
>  		resched_latency =3D cpu_resched_latency(rq);
>  	calc_global_load_tick(rq);
> @@ -5890,6 +5903,7 @@ static void sched_tick_remote(struct work_struct *w=
ork)
>  				WARN_ON_ONCE(delta > (u64)NSEC_PER_SEC * 30);
>  			}
>  			curr->sched_class->task_tick(rq, curr, 0);
> +			sched_tick_exec_ctx(rq);
> =20
>  			calc_load_nohz_remote(rq);
>  		}
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 8dff37059faf..55f0460e4ae3 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4425,7 +4425,7 @@ void init_numa_balancing(u64 clone_flags, struct ta=
sk_struct *p)
>  /*
>   * Drive the periodic memory faults..
>   */
> -static void task_tick_numa(struct rq *rq, struct task_struct *curr)
> +void task_tick_numa(struct rq *rq, struct task_struct *curr)
>  {
>  	struct callback_head *work =3D &curr->numa_work;
>  	u64 period, now;
> @@ -4491,7 +4491,7 @@ static void update_scan_period(struct task_struct *=
p, int new_cpu)
> =20
>  #else /* !CONFIG_NUMA_BALANCING: */
> =20
> -static void task_tick_numa(struct rq *rq, struct task_struct *curr)
> +void task_tick_numa(struct rq *rq, struct task_struct *curr)
>  {
>  }
> =20
> @@ -15042,9 +15042,6 @@ static void task_tick_fair(struct rq *rq, struct =
task_struct *curr, int queued)
>  	if (queued)
>  		return;
> =20
> -	if (static_branch_unlikely(&sched_numa_balancing))
> -		task_tick_numa(rq, curr);
> -
>  	task_tick_cache(rq, curr);
> =20
>  	update_misfit_status(curr, rq);
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index e656c7059bf8..4d619f272b15 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -4152,6 +4152,7 @@ extern void sched_cache_active_set(void);
>  void sched_domains_free_llc_id(int cpu);
> =20
>  extern void init_sched_mm(struct task_struct *p);
> +void task_tick_numa(struct rq *rq, struct task_struct *p);
> =20
>  extern u64 avg_vruntime(struct cfs_rq *cfs_rq);
>  extern int entity_eligible(struct cfs_rq *cfs_rq, struct sched_entity *s=
e);
>=20
