Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619229;
	b=bNRrYovDu1gcTKiN1oOg0C6MiFG5nco79sWjAK/hoiSs0LQh+5CQuBpQG+AFy+1SwmpM
	 0fo61qjsgC3qJ9cNONs92DObTwfxbOzUkwz2Cu6QjJY493Qx7nFhDVgqk/mHU6D4iQAwJ
	 lol0uzDWokC8/NwQ8pIxBhFxcxFa37Z7WRUkvlhmivMPOIgIU+29yea5NfsUhc1KFQqr5
	 RwT6nmgCIbLm0BaNFVxfM1I8udca7p/XPicGMgVOzF66ZWwAlim18Czr/rTbN5cOVeQHc
	 8nSfMqjq34QDoevvUwItpGmv7a87VEXAjvweodJXygX0fkkLtYL6s+/791rKm8UOTQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619229;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=c39nrSLk/3Ry5AZhnuxZomtF0nUULxHwjuxORm7OuT0=;
	b=mIiyP9t+98UvFNSYTvQPRWOAHuDGXpkbF4Eu8TrkOTphkvmbmg3XLts3oKwAKDr4ZSYJ
	 QOjFJe3W5lq0EaARHPjLLXQVpS7OPgcjgt/632cku3JUVKqKCQQsiN1gur88mi7zcZQiz
	 ivsi+Yq74rT+yWw/4TPcPba6yXhoONPa/lipoGeSRpOFgPGmpGfTehJNpdtfAOti/zkJ7
	 jNvNrQfXjuFu5t72LZT0fbC3hw4Mkpshm3cpXCSz4+k7YwCIHX6BcjXO3eIkw2Et7LVu1
	 T2u4go/h7hPZ7N7wTAEKT3RXUL2YYsw8WAPuF4FRTdwlj37z/nPsHZmR+KtszZYV6tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MCep1tJW;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8641606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8641606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MCep1tJW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792619229; x=1824155229;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Z0xMvrJAQD08B6u/g8mp5Iy4+lI8nxoi7R8hm0lSzm8=;
  b=MCep1tJW4S3jLv3a8f3rlCrkv6RhbwxFDqTMVRRubsTpIKgmd6Rg9ZFS
   v0H0oyWhKlNLpIS4dA1dXCL6VKvLcuzcVUr6sNkf/vasJWIOooeqF8MNL
   ZUzIrGByBnN42FAQDcdS/dofSdaYfWmHYRYyEEPKzKvScsaVgLvF5OgEv
   Lf3OSg9S+vU83mzurO2Mt4I4Rl+/K5viTFcNULmW9oyXApLENXIwI0jBk
   HGVszNfVfK+FFDqF+jiZaFLZqAXW93f2JP5p27ISuHFLs18YC12LLVbyL
   NSz0QhLI1cqrUnq+0PL9AJzhp49OUNJuOwQVIjjlx8hcPr0TtiDntO7UT
   g==;
X-CSE-ConnectionGUID: tOu6C1JbT9ezhSnLSDtTxw==
X-CSE-MsgGUID: MmiRF8nwT76E2zeeF9QwTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1394102"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1394102"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 14:46:47 -0700
X-CSE-ConnectionGUID: RCBvu3OqQv+5qd+J0/zULQ==
X-CSE-MsgGUID: LdJpuN/uQBe1C6XdsrV6TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3322960"
Received: from unknown (HELO [10.241.242.209]) ([10.241.242.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 14:46:46 -0700
Message-ID: <995dc27d9bd27276c1fbf729ed88b7e6c91172f7.camel@linux.intel.com>
Subject: Re: [PATCH v10 1/2] sched/cache: Reduce the overhead of
 task_cache_work by only scan the visisted cpus
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Luo Gengkun <luogengkun@huaweicloud.com>, peterz@infradead.org, 
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	yu.c.chen@intel.com
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org
Date: Wed, 21 Oct 2026 14:46:45 -0700
In-Reply-To: <20261009032943.95091-2-luogengkun@huaweicloud.com>
References: <20261009032943.95091-1-luogengkun@huaweicloud.com>
	 <20261009032943.95091-2-luogengkun@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-10-09 at 03:29 +0000, Luo Gengkun wrote:
> The overhead of task_cache_work() is high, especially in multi-NUMA syste=
ms.
> Currently, task_cache_work() tries to find the pref_llc by scanning all C=
PUs
> in the system. However, most of these scans are meaningless, such as thos=
e
> for CPUs that have never been visited or were accessed a long time ago.
>=20
> To address this problem, introduce visited_cpus to track the visited CPUs
> and evict them once they have not been accessed for a duration exceeding
> llc_epoch_affinity_timeout.
>=20
> Now that we know exactly which CPUs to scan from visited_cpus, we can rem=
ove
> get_scan_cpumasks().

The patch mostly looks good.  Some minor nits below.

>=20
> Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
> ---
>  include/linux/sched.h |   2 +
>  kernel/sched/fair.c   | 117 +++++++++++++++++++-----------------------
>  2 files changed, 55 insertions(+), 64 deletions(-)
>=20
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index d35ae49a991f..09bd18c7a667 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2404,6 +2404,7 @@ static __always_inline int task_mm_cid(struct task_=
struct *t)
>  struct sched_cache_time {
>  	u64 runtime;
>  	unsigned long epoch;
> +	unsigned long epoch_last_visit;
>  };
> =20
>  struct sched_cache_group {
> @@ -2416,6 +2417,7 @@ struct sched_cache_group {
>  	int cpu;
>  	refcount_t refcnt;
>  	struct rcu_head rcu;
> +	cpumask_var_t visited_cpus;
>  } ____cacheline_aligned_in_smp;
> =20
>  struct sched_cache_group *sched_cache_group_get(struct sched_cache_group=
 *grp);
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 57360f5cdde4..691b4ecdb2e7 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1656,11 +1656,11 @@ int mm_init_sched(struct mm_struct *mm,
>  	int i;
> =20
>  	grp =3D kzalloc_obj(*grp);
> -	if (!grp) {
> -		free_percpu(_pcpu_sched);
> -		mm->sched_cache_grp =3D NULL;
> -		return -ENOMEM;
> -	}
> +	if (!grp)
> +		goto err_free_pcpu;
> +
> +	if (!zalloc_cpumask_var(&grp->visited_cpus, GFP_KERNEL))
> +		goto err_free_grp;
> =20
>  	for_each_possible_cpu(i) {
>  		struct sched_cache_time *pcpu_sched =3D per_cpu_ptr(_pcpu_sched, i);
> @@ -1669,6 +1669,7 @@ int mm_init_sched(struct mm_struct *mm,
>  		pcpu_sched->runtime =3D 0;
>  		/* a slightly stale cpu epoch is acceptible */
>  		pcpu_sched->epoch =3D rq->cpu_epoch;
> +		pcpu_sched->epoch_last_visit =3D rq->cpu_epoch;
>  		epoch =3D rq->cpu_epoch;
>  	}
> =20
> @@ -1694,6 +1695,14 @@ int mm_init_sched(struct mm_struct *mm,
>  	 */
>  	smp_store_release(&mm->sched_cache_grp, grp);
>  	return 0;
> +
> +err_free_grp:
> +	kfree(grp);
> +
> +err_free_pcpu:
> +	free_percpu(_pcpu_sched);
> +	mm->sched_cache_grp =3D NULL;
> +	return -ENOMEM;
>  }
> =20
>  static void sched_cache_group_free_rcu(struct rcu_head *rcu)
> @@ -1702,6 +1711,7 @@ static void sched_cache_group_free_rcu(struct rcu_h=
ead *rcu)
>  		container_of(rcu, struct sched_cache_group, rcu);
> =20
>  	free_percpu(grp->pcpu_sched);
> +	free_cpumask_var(grp->visited_cpus);
>  	kfree(grp);
>  }
> =20
> @@ -1842,13 +1852,23 @@ static inline void __update_mm_sched(struct rq *r=
q,
>  	}
>  }
> =20
> -static unsigned long fraction_mm_sched(struct rq *rq,
> -				       struct sched_cache_time *pcpu_sched)
> +static unsigned long fraction_mm_sched(int cpu,
> +				       struct sched_cache_group *grp)
>  {
> +	struct sched_cache_time *pcpu_sched =3D
> +		per_cpu_ptr(grp->pcpu_sched, cpu);
> +	struct rq *rq =3D cpu_rq(cpu);
> +
>  	guard(raw_spinlock_irqsave)(&rq->cpu_epoch_lock);
> =20
>  	__update_mm_sched(rq, pcpu_sched);
> =20
> +	/* Skip the rq that has not been hit for a long time */
> +	if ((rq->cpu_epoch - pcpu_sched->epoch_last_visit) > llc_epoch_affinity=
_timeout) {

Suggest updating comment to below as it does more than
skip: it clears the visited cpus bit.  Also break the long line.

       /* Evict the CPU if this sched group has not run on it for a while *=
/
       if ((rq->cpu_epoch - pcpu_sched->epoch_last_visit) >
           llc_epoch_affinity_timeout) {

> +		cpumask_clear_cpu(cpu, grp->visited_cpus);
> +		return 0;
> +	}
> +
>  	/*
>  	 * Runtime is a geometric series (r=3D0.5) and as such will sum to twic=
e
>  	 * the accumulation period, this means the multiplcation here should
> @@ -1924,6 +1944,9 @@ void account_mm_sched(struct rq *rq, struct task_st=
ruct *p, s64 delta_exec)
>  		pcpu_sched->runtime +=3D delta_exec;
>  		rq->cpu_runtime +=3D delta_exec;
>  		epoch =3D rq->cpu_epoch;
> +		pcpu_sched->epoch_last_visit =3D epoch;
> +		if (!cpumask_test_cpu(cpu_of(rq), grp->visited_cpus))
> +			cpumask_set_cpu(cpu_of(rq), grp->visited_cpus);
>  	}
> =20
>  	/*
> @@ -1974,52 +1997,6 @@ static void task_tick_cache(struct rq *rq, struct =
task_struct *p)
>  	}
>  }
> =20
> -static void get_scan_cpumasks(cpumask_var_t cpus, struct task_struct *p,
> -			      struct sched_cache_group *grp)
> -{
> -#ifdef CONFIG_NUMA_BALANCING
> -	int cpu, curr_cpu, nid, pref_nid;
> -
> -	if (!static_branch_likely(&sched_numa_balancing))
> -		goto out;
> -
> -	cpu =3D READ_ONCE(grp->cpu);
> -	if (cpu !=3D -1)
> -		nid =3D cpu_to_node(cpu);
> -	curr_cpu =3D task_cpu(p);
> -
> -	/*
> -	 * Scanning in the preferred NUMA node is ideal. However, the NUMA
> -	 * preferred node is per-task rather than per-process. It is possible
> -	 * for different threads of the process to have distinct preferred
> -	 * nodes; consequently, the process-wide preferred LLC may bounce
> -	 * between different nodes. As a workaround, maintain the scan
> -	 * CPU mask to also cover the process's current preferred LLC and the
> -	 * current running node to mitigate the bouncing risk.
> -	 * TBD: numa_group should be considered during task aggregation.
> -	 */
> -	pref_nid =3D p->numa_preferred_nid;
> -	/* honor the task's preferred node */
> -	if (pref_nid =3D=3D NUMA_NO_NODE)
> -		goto out;
> -
> -	cpumask_or(cpus, cpus, cpumask_of_node(pref_nid));
> -
> -	/* honor the task's preferred LLC CPU */
> -	if (cpu !=3D -1 && !cpumask_test_cpu(cpu, cpus) && nid !=3D NUMA_NO_NOD=
E)
> -		cpumask_or(cpus, cpus, cpumask_of_node(nid));
> -
> -	/* make sure the task's current running node is included */
> -	if (!cpumask_test_cpu(curr_cpu, cpus))
> -		cpumask_or(cpus, cpus, cpumask_of_node(cpu_to_node(curr_cpu)));
> -
> -	return;
> -
> -out:
> -#endif
> -	cpumask_copy(cpus, cpu_online_mask);
> -}
> -
>  static inline void update_avg_scale(u64 *avg, u64 sample)
>  {
>  	int factor =3D per_cpu(sd_llc_size, raw_smp_processor_id());
> @@ -2068,7 +2045,7 @@ static void task_cache_work(struct callback_head *w=
ork)
>  	if (time_before(now, next_scan))
>  		return;
> =20
> -	/* only 1 thread is allowed to scan */
> +	/* elect a single scanner per epoch */
>  	if (!try_cmpxchg(&grp->next_scan, &next_scan,
>  			 now + max_t(unsigned long,
>  				     READ_ONCE(llc_epoch_period), 1)))
> @@ -2089,7 +2066,18 @@ static void task_cache_work(struct callback_head *=
work)
>  	scoped_guard (cpus_read_lock) {
>  		guard(rcu)();
> =20
> -		get_scan_cpumasks(cpus, p, grp);
> +		/*
> +		 * Data race: While evaluating the visited_cpus without
> +		 * a lock, a CPU could be concurrently set by
> +		 * account_mm_sched(), meaning the scan might skip the newly
> +		 * visited CPU if the bit changes during the scan. This is
> +		 * a deliberate trade-off between accuracy and efficiency:
> +		 * locking would prevent this race but incur extra overhead.
> +		 * The missed runtime contribution is negligible because it
> +		 * implies this process hasn't run on that CPU for a long
> +		 * time, and will be captured in the next cycle.
> +		 */

Maybe we can shorten the comments to:

	       /*
                * account_mm_sched() can set a bit in visited_cpus while
                * it is read here locklessly for efficiency. A CPU missed t=
his way has
                * only just been used by this sched group, so its share is
                * small, and the next scan will include it.                =
=C2=A0
		*/


> +		cpumask_and(cpus, cpu_online_mask, grp->visited_cpus);
> =20
>  		for_each_cpu(cpu, cpus) {
>  			/* XXX sched_cluster_active */
> @@ -2100,15 +2088,7 @@ static void task_cache_work(struct callback_head *=
work)
>  			if (!sd)
>  				continue;
> =20
> -			for_each_cpu(i, sched_domain_span(sd)) {
> -				occ =3D fraction_mm_sched(cpu_rq(i),
> -							per_cpu_ptr(grp->pcpu_sched, i));
> -				a_occ +=3D occ;
> -				if (occ > m_occ) {
> -					m_occ =3D occ;
> -					m_cpu =3D i;
> -				}
> -
> +			for_each_cpu_and(i, sched_domain_span(sd), cpus) {
>  				/*
>  				 * rcu_access_pointer() is used because the
>  				 * pointer is only compared, never dereferenced.
> @@ -2117,6 +2097,15 @@ static void task_cache_work(struct callback_head *=
work)
>  				if (cur && !(cur->flags & (PF_EXITING | PF_KTHREAD)) &&
>  				    rcu_access_pointer(cur->sched_cache_grp) =3D=3D grp)
>  					nr_running++;
> +
> +				occ =3D fraction_mm_sched(i, grp);
> +				if (occ =3D=3D 0)
> +					continue;
> +				a_occ +=3D occ;
> +				if (occ > m_occ) {

The continue does nothing. When occ is 0, "a_occ +=3D occ" adds nothing
and "occ > m_occ" is false. If you remove it, the nr_running block can
stay where it was, and this hunk becomes just a two-line change.

-                       for_each_cpu_and(i, sched_domain_span(sd), cpus) {
-                               occ =3D fraction_mm_sched(i, grp);
+                       for_each_cpu(i, sched_domain_span(sd)) {
+                               occ =3D fraction_mm_sched(cpu_rq(i),
+                                                       per_cpu_ptr(grp->pc=
pu_sched, i));


Thanks.

Tim

> +					m_occ =3D occ;
> +					m_cpu =3D i;
> +				}
>  			}
> =20
>  			/*
