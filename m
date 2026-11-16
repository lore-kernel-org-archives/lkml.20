Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794872328;
	b=VlXjBmhDR6okQ/r0hMipae/LZL6PRtVbi/qUoa7kQ891JO1e55w2NdxcXNL3xl/yvWSx
	 WBC9RA1ItOD6f/JTYdtLAq/gjqy65RnO0I+LdW3WPb8ETeChXglI22GKzW7I9+k+jRoHh
	 8TnXiuL8P6RhMCTdXtIhuY6wLONaFkhWwiBoNM+6TVda0vQ4TbPsvRcf7o6GlDlsWr7Sl
	 Lx1bggC3M1xick4TSfbMAC80/EbxqqbTeiXgNUKK8UhmfwRoC0ClctpCU14gy1cGrwBFU
	 ASLtmaq6mpoIp2G/FhV0R4M6CCPX8NC1K2DU/bUi1SRZlbIafuayz5RhW4fxPlx4u7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794872328;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=2pAGYCEMzeqgPRUqZmLZ9p4b4eNttHVhcC2rYwFEt5k=;
	b=JkzeZebCpHaMA5FbGV9Hvl4s2ufNj3vWyxAI24Yv/N1uE7F+UwgMUgI1JsdLeex8o9Yw
	 FxCui6IsySAbCiPgnUd6Wlo60dnMdVW7pO+X54YHWemI+Svu/u17dw0w00D2C3HA0Teei
	 CKNh9qKckQwxJXus2VFUzV/GEzbOYXWUY7y52K+Y8vEuyEoS/sAfiJvMxci5nuPQVGBls
	 slFhw6lW71FUfbi5vmUCGM1+oq36+gFqaS812rQEk0DqwHuilnAFwsmCfkBT+jTrWOTah
	 YjgTT26/YSBTKDRtBAWsZOESOnlwSkMNi71L7pKnMdf87c8zL97esff2igMxFNeiZew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AQpjXuG2;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E3A606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1E3A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AQpjXuG2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794872328; x=1826408328;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=NY7hcPa6JA1aOFkso+AGpODLpvcEe6Yqy8zfLBkHqBo=;
  b=AQpjXuG25P+onU4RyV/6/vQo4EpGkiRL9BjpykhfhJvSsqRLZavk5t0A
   l3xDXvUGh210Wug5b7sn/nQ1pFv9Z7B+Q3Jgp1EiOCER+3OJRqQnUUA43
   RqEw7HuLPnh5SLD680ErJngeWlFPQIBDIL6+QvdsJSIRPREvWhVBx3/Jf
   IcGkQrErUwP21mp2ZKUhzJivzGXbQ5ppFc2D/5sORgQNPSK8sj79d877Y
   ZWnoIOgiSvQ+uRh+Y5j5rq1TS0YUK+vTRzS2oOb3f4H523zp80mYGfz2u
   2u267vKYmOVse3mCERH460fZ8x4TiJ1Lk9f67Zk0XE7SFnbGab4qOUuWd
   g==;
X-CSE-ConnectionGUID: Z2OgF0kyTRKGksw+uixlqw==
X-CSE-MsgGUID: oDxHngsbRe+1AaLMVPmimg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3660154"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3660154"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 15:38:46 -0800
X-CSE-ConnectionGUID: SRarI9A9R42kXeLzJ4Gs4w==
X-CSE-MsgGUID: RgmU4GXWQaKA3W3h2cQSZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9743941"
Received: from unknown (HELO [10.241.242.209]) ([10.241.242.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 15:38:45 -0800
Message-ID: <e2a78b9560fc0a232f3c7bd21e7d9738c5915ce1.camel@linux.intel.com>
Subject: Re: [PATCH v11 1/2] sched/cache: Reduce the overhead of
 task_cache_work by only scan the visisted cpus
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Luo Gengkun <luogengkun@huaweicloud.com>, peterz@infradead.org, 
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	yu.c.chen@intel.com, kprateek.nayak@amd.com
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 15:38:43 -0800
In-Reply-To: <20261111110409.1498035-2-luogengkun@huaweicloud.com>
References: <20261111110409.1498035-1-luogengkun@huaweicloud.com>
	 <20261111110409.1498035-2-luogengkun@huaweicloud.com>
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

On Wed, 2026-11-11 at 11:04 +0000, Luo Gengkun wrote:

Nit:

subject would read better as

Reduce the overhead of task_cache_work() by scanning only the visited cpusw=
h

> The overhead of task_cache_work() is high, especially in multi-NUMA syste=
ms.
> Currently, task_cache_work() tries to find the prewf_llc by scanning all =
CPUs
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
>=20
> Below are the Redis test results conducted on AMD server.
>=20
> When NUMA balancing is disabled:
>=20
>   valkey-benchmark rps  |      baseline       |         schedcache       =
       |     schedcache_visit
>                         |  (no cache aware)   |    (without this series) =
       |     (with this series)
>   ----------------------+---------------------+---------------------+----=
-------+-------------------+--------
>                         |   p99 latency(ms)   |    p99 latency(ms)  |   D=
IFF(%) |   p99 latency(ms) |  DIFF(%)
>   400000                |      0.436          |        0.554        |   -=
25.68% |         0.441     |   -1.14%
>=20
>   Additionally, the output of perf top -e cycles:k highlights the overhea=
d
>   incurred by task_cache_work():
>=20
>   valkey-benchmark rps  |         schedcache                        |    =
 schedcache_visit
>                         |    (without this series)                  |    =
 (with this series)
>   ----------------------+-------------------------------------------+----=
-----------------------------------
>   400000                |  0.81%  [kernel]  [k] task_cache_work     |  0.=
02%  [kernel]  [k] task_cache_work
>=20
> The trace data is shown below:
>=20
> echo NO_SC_VISIT > /sys/kernel/debug/sched/features
>     redis-server-24660   [195] .....  2916.005989: sched_cache_scan: comm=
=3Dredis-server pid=3D24660 scan=3D384
>  valkey-benchmar-48836   [317] .....  2916.005993: sched_cache_scan: comm=
=3Dvalkey-benchmar pid=3D48836 scan=3D384
>  valkey-benchmar-48487   [310] .....  2916.006002: sched_cache_scan: comm=
=3Dvalkey-benchmar pid=3D48487 scan=3D384
>=20
> echo SC_VISIT > /sys/kernel/debug/sched/features
>     redis-server-29080   [225] .....  2876.257909: sched_cache_scan: comm=
=3Dredis-server pid=3D29080 scan=3D14
>     redis-server-26694   [018] .....  2876.257909: sched_cache_scan: comm=
=3Dredis-server pid=3D26694 scan=3D13
>  valkey-benchmar-48198   [103] .....  2876.257909: sched_cache_scan: comm=
=3Dvalkey-benchmar pid=3D48198 scan=3D16
>=20
> The above results show that this series significantly reduces the overhea=
d
> of task_cache_work() by decreasing the number of CPUs that need to be
> scanned, from 384 to 16, when NUMA balancing is disabled.
>=20
> Even with NUMA balancing enabled, this patch provides better performance
> benefits. The following tests were conducted with NUMA balancing enabled:
>=20
>   valkey-benchmark rps  |      baseline       |         schedcache       =
       |     schedcache_visit
>                         |  (no cache aware)   |    (without this series) =
       |     (with this series)
>   ----------------------+---------------------+---------------------+----=
-------+-------------------+--------
>                         |   p99 latency(ms)   |    p99 latency(ms)  |   D=
IFF(%) |   p99 latency(ms) |  DIFF(%)
>   400000                |      0.437          |        0.454        |   -=
3.89%  |         0.442     |   -1.14%
>=20
>   The overhead of task_cache_work() is as follows:
>=20
>   valkey-benchmark rps  |         schedcache                        |    =
 schedcache_visit
>                         |    (without this series)                  |    =
 (with this series)
>   ----------------------+-------------------------------------------+----=
-----------------------------------
>   400000                |  0.13%  [kernel]  [k] task_cache_work     |  0.=
03%  [kernel]  [k] task_cache_work
>=20
> Hackbench testing was also conducted. The results below show that this
> series does not affect the accuracy of cache-aware scheduling.
>=20
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   Hackbench Comparison: baseline vs schedcache
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   MODE       GROUPS  FDS |     baseline(std)  |  schedcache(std)   |    D=
IFF(%) | VERDICT
>   ---------- ------ -----+--------------------+--------------------+-----=
-------+-----------
>   threads         1   10 |    113.200 (4.22%) |     67.300 (1.32%) |     =
40.55% | IMPROVED
>   threads         1    2 |     16.555 (4.11%) |     11.020 (1.66%) |     =
33.43% | IMPROVED
>   threads         1   20 |    250.774 (1.26%) |    265.026 (5.44%) |     =
-5.68% | REGRESSED
>   threads         1    4 |     42.117 (1.44%) |     27.758 (1.64%) |     =
34.09% | IMPROVED
>   threads         1    6 |     65.140 (4.31%) |     39.182 (1.38%) |     =
39.85% | IMPROVED
>   threads         1    8 |     84.286 (1.29%) |     53.721 (1.58%) |     =
36.26% | IMPROVED
>   threads         2   10 |    122.592 (0.44%) |    113.365 (4.93%) |     =
 7.53% | IMPROVED
>   threads         2    2 |     17.702 (4.09%) |     10.473 (0.42%) |     =
40.84% | IMPROVED
>   threads         2   20 |    336.457 (1.77%) |    314.108 (1.51%) |     =
 6.64% | IMPROVED
>   threads         2    4 |     43.989 (0.88%) |     27.067 (3.38%) |     =
38.47% | IMPROVED
>   threads         2    6 |     69.322 (0.85%) |     41.707 (4.19%) |     =
39.84% | IMPROVED
>   threads         2    8 |    103.767 (1.81%) |     58.518 (3.00%) |     =
43.61% | IMPROVED
>   threads         4   10 |    148.882 (3.56%) |    149.449 (1.06%) |     =
-0.38% | REGRESSED
>   threads         4    2 |     18.909 (2.96%) |     11.063 (2.08%) |     =
41.49% | IMPROVED
>   threads         4   20 |    724.943 (2.14%) |    631.222 (3.92%) |     =
12.93% | IMPROVED
>   threads         4    4 |     48.191 (1.91%) |     27.352 (5.35%) |     =
43.24% | IMPROVED
>   threads         4    6 |     79.725 (3.84%) |     78.732 (4.10%) |     =
 1.25% | IMPROVED
>   threads         4    8 |    108.768 (1.36%) |    105.928 (1.65%) |     =
 2.61% | IMPROVED
>=20
>   Hackbench Comparison: schedcache vs schedcache_visit
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   MODE       GROUPS  FDS |    schedcache(std) |schedcache_visit(std) | DI=
FF(%) | VERDICT
>   ---------- ------ -----+--------------------+----------------------+---=
------+-----------
>   threads         1   10 |     67.300 (1.32%) |     67.014 (0.96%)   |   =
0.42% | IMPROVED
>   threads         1    2 |     11.020 (1.66%) |     10.557 (1.46%)   |   =
4.20% | IMPROVED
>   threads         1   20 |    265.026 (5.44%) |   212.366 (16.32%)   |  1=
9.87% | IMPROVED
>   threads         1    4 |     27.758 (1.64%) |     25.711 (1.32%)   |   =
7.37% | IMPROVED
>   threads         1    6 |     39.182 (1.38%) |     38.914 (0.34%)   |   =
0.68% | IMPROVED
>   threads         1    8 |     53.721 (1.58%) |     52.889 (0.27%)   |   =
1.55% | IMPROVED
>   threads         2   10 |    121.203 (6.99%) |    124.254 (1.38%)   |  -=
2.52% | REGRESSED
>   threads         2    2 |     10.473 (0.42%) |     11.206 (5.91%)   |  -=
7.00% | REGRESSED
>   threads         2   20 |    314.108 (1.51%) |    301.754 (1.95%)   |   =
3.93% | IMPROVED
>   threads         2    4 |     27.067 (3.38%) |     28.028 (2.01%)   |  -=
3.55% | REGRESSED
>   threads         2    6 |     41.707 (4.19%) |     42.149 (3.35%)   |  -=
1.06% | REGRESSED
>   threads         2    8 |     58.518 (3.00%) |     57.133 (4.39%)   |   =
2.37% | IMPROVED
>   threads         4   10 |    149.449 (1.06%) |    141.407 (0.08%)   |   =
5.38% | IMPROVED
>   threads         4    2 |     11.063 (2.08%) |     11.360 (5.85%)   |  -=
2.68% | REGRESSED
>   threads         4   20 |    631.222 (3.92%) |    622.780 (2.49%)   |   =
1.34% | IMPROVED
>   threads         4    4 |     27.352 (5.35%) |     27.947 (5.37%)   |  -=
2.18% | REGRESSED
>   threads         4    6 |     78.732 (4.10%) |     73.911 (0.70%)   |   =
6.12% | IMPROVED
>   threads         4    8 |    105.928 (1.65%) |    107.535 (3.29%)   |  -=
1.52% | REGRESSED
>=20
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Tested-by: Chen Yu <yu.c.chen@intel.com>
> Reviewed-by: Chen Yu <yu.c.chen@intel.com>
> Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
> ---
>  include/linux/sched.h |  2 +
>  kernel/sched/fair.c   | 99 ++++++++++++++++++-------------------------
>  2 files changed, 43 insertions(+), 58 deletions(-)
>=20
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index e4f6323d7855..1b08925c6358 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2385,6 +2385,7 @@ static __always_inline int task_mm_cid(struct task_=
struct *t)
>  struct sched_cache_time {
>  	u64 runtime;
>  	unsigned long epoch;
> +	unsigned long epoch_last_visit;
>  };
> =20
>  struct sched_cache_group {
> @@ -2397,6 +2398,7 @@ struct sched_cache_group {
>  	int cpu;
>  	refcount_t refcnt;
>  	struct rcu_head rcu;
> +	cpumask_var_t visited_cpus;
>  } ____cacheline_aligned_in_smp;
> =20
>  struct sched_cache_group *sched_cache_group_get(struct sched_cache_group=
 *grp);
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 79f6b3a4fd7f..c97f08eaa9e5 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1599,11 +1599,11 @@ int mm_init_sched(struct mm_struct *mm,
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
> @@ -1612,6 +1612,7 @@ int mm_init_sched(struct mm_struct *mm,
>  		pcpu_sched->runtime =3D 0;
>  		/* a slightly stale cpu epoch is acceptible */
>  		pcpu_sched->epoch =3D rq->cpu_epoch;
> +		pcpu_sched->epoch_last_visit =3D rq->cpu_epoch;
>  		epoch =3D rq->cpu_epoch;
>  	}
> =20
> @@ -1637,6 +1638,14 @@ int mm_init_sched(struct mm_struct *mm,
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
> @@ -1645,6 +1654,7 @@ static void sched_cache_group_free_rcu(struct rcu_h=
ead *rcu)
>  		container_of(rcu, struct sched_cache_group, rcu);
> =20
>  	free_percpu(grp->pcpu_sched);
> +	free_cpumask_var(grp->visited_cpus);
>  	kfree(grp);
>  }
> =20
> @@ -1785,13 +1795,24 @@ static inline void __update_mm_sched(struct rq *r=
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
> +	/* Evict the CPU if this sched group has not run on it for a while */
> +	if ((rq->cpu_epoch - pcpu_sched->epoch_last_visit) >
> +	    llc_epoch_affinity_timeout) {
> +		cpumask_clear_cpu(cpu, grp->visited_cpus);
> +		return 0;
> +	}
> +
>  	/*
>  	 * Runtime is a geometric series (r=3D0.5) and as such will sum to twic=
e
>  	 * the accumulation period, this means the multiplcation here should
> @@ -1867,6 +1888,9 @@ void account_mm_sched(struct rq *rq, struct task_st=
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
> @@ -1917,52 +1941,6 @@ static void task_tick_cache(struct rq *rq, struct =
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
> @@ -2011,7 +1989,7 @@ static void task_cache_work(struct callback_head *w=
ork)
>  	if (time_before(now, next_scan))
>  		return;
> =20
> -	/* only 1 thread is allowed to scan */
> +	/* elect a single scanner per epoch */
>  	if (!try_cmpxchg(&grp->next_scan, &next_scan,
>  			 now + max_t(unsigned long,
>  				     READ_ONCE(llc_epoch_period), 1)))
> @@ -2032,7 +2010,13 @@ static void task_cache_work(struct callback_head *=
work)
>  	scoped_guard (cpus_read_lock) {
>  		guard(rcu)();
> =20
> -		get_scan_cpumasks(cpus, p, grp);
> +		/*
> +		 * account_mm_sched() can set a bit in visited_cpus while
> +		 * it is read here locklessly for efficiency. A CPU missed
> +		 * this way has only just been used by this sched group,
> +		 * so its share small, and the next scan will include it.

Nit:  so its share is small,=20

> +		 */
> +		cpumask_and(cpus, cpu_online_mask, grp->visited_cpus);
> =20
>  		for_each_cpu(cpu, cpus) {
>  			/* XXX sched_cluster_active */
> @@ -2043,9 +2027,8 @@ static void task_cache_work(struct callback_head *w=
ork)
>  			if (!sd)
>  				continue;
> =20
> -			for_each_cpu(i, sched_domain_span(sd)) {
> -				occ =3D fraction_mm_sched(cpu_rq(i),
> -							per_cpu_ptr(grp->pcpu_sched, i));
> +			for_each_cpu_and(i, sched_domain_span(sd), cpus) {
> +				occ =3D fraction_mm_sched(i, grp);
>  				a_occ +=3D occ;
>  				if (occ > m_occ) {
>  					m_occ =3D occ;

Otherwise patch looks good to me.

Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>

Tim
