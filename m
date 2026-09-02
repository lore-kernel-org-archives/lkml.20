Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487F53B5E08
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383472; cv=none; b=JJ5EUJGLyNl59x52jhq+T6WJoGH6k9bFdmihr37O748GKGmaE5jz4xfSbaDkalYQHR+PUEv4D6WsHVJzfDKrzBAg2uYXz4HdcB1FO2T7K/4sKt529hzX3918xn44hYO/Xryja3Ym1+yFlROT2ePfcN/2C8TbbQD6c0L/kDAAtsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383472; c=relaxed/simple;
	bh=oNimGPcgo8tQhmVwRRd8dupVi84pfUzthcX62wpCfRU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MV4Gvgl4ZNl8yNSeN1mXdhupuHLYcKmBw1mVmPBmI+cHH2gK15K/+eDe4daTCGP5oH75MpNrz+tz6Ke+jErF7iL3IIhU+fDhtuzqYH6b8d4yVfJfU02qBBhFa9HHIIZfTs/JfPUhQHusZYbvbRJEKUwNAEnSaNOJwOuz5rPzB98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbHM2mwd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbHM2mwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788383470; x=1819919470;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=oNimGPcgo8tQhmVwRRd8dupVi84pfUzthcX62wpCfRU=;
  b=HbHM2mwdfFwHAr/DG7K4/WC18ViMuDtk9hi3kgvDQzTqbAwj5pQQbmQ2
   zC7e4nwc0WQidFz9Z2kK5DbjvidVNcSwJvKo5Bg6CCq8G3GTHTJlRnAnm
   36TKNqKhDD3Qdxhv4D9FQtx+Wj5Z4ge4vb4mi/8gtbX52jSbhjKFm4b7J
   4PWcxH9rbZTZOq05LkYmJkz4x58ChtR0tAYAAR18P9jos5wguhHnl1xyq
   ttRn/6qKyFs8URSD41sbY4JhyovCD9bZrBEao8BjUe5JOqwHI9VX06z0t
   HIo0opoTB/NuegDHWsjji8CiOK+B2NeujojYRaEPEDri/WauPU6ouezZm
   g==;
X-CSE-ConnectionGUID: +JZDOJrER6usuyz2wkNL8g==
X-CSE-MsgGUID: QPIhj6Y+QeWyPXbVQ051LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100208241"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100208241"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:11:08 -0700
X-CSE-ConnectionGUID: XjEVjvTDSOGVUG2TyyoTUw==
X-CSE-MsgGUID: DKGkOPFCQd6FG1vKBPiwtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="268977250"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:11:08 -0700
Message-ID: <fac52a49e611f7f6a6637f04a2e44e8c23a260c6.camel@linux.intel.com>
Subject: Re: [RFC PATCH v2 11/23] sched/cache: Introduce helpers for task
 migration decisions
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Jianyong Wu <wujianyong@hygon.cn>, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot	 <vincent.guittot@linaro.org>, Chen Yu <yu.c.chen@intel.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt	
 <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman	
 <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek
 Nayak	 <kprateek.nayak@amd.com>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 Phil Auld	 <pauld@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, jianyong.wu@outlook.com, 	zhongyuan@hygon.cn,
 huangsj@hygon.cn, wangfengyu@hygon.cn, yingzhiwei@hygon.cn, 
	justin.he@arm.com
Date: Wed, 02 Sep 2026 14:11:07 -0700
In-Reply-To: <20260827122816.756234-12-wujianyong@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
	 <20260827122816.756234-12-wujianyong@hygon.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-08-27 at 20:28 +0800, Jianyong Wu wrote:
> Cache-aware scheduling makes migration decisions purely based on LLC
> affinity, allowing moves only toward a task's preferred LLC. This rigid
> policy cannot handle workloads that do not fit within a single LLC.
> A better approach is on-demand thread aggregation across LLCs: as the
> thread count increases, additional LLCs are recruited to host threads,
> enabling workload scaling at LLC granularity.
>=20
> To realize this behaviour, we need to pick the next eligible LLC once
> currently selected LLCs become saturated.
>=20
> Earlier patches have built node-level and LLC-level distance matrices.
> From these matrices we obtain a node-affinity sequence, and within each
> node an intra-node LLC-affinity sequence. These sequences provide the
> priority order used to pick subsequent LLC candidates.
>=20
> This patch adds a helper routine to determine whether task migration
> is permitted. It checks whether the destination CPU resides within the
> first eligible LLC. Migration is permitted if this condition holds,
> and vice versa.
>=20
> The first eligible LLC is resolved via a two-stage policy. The first
> stage operates at NUMA-node granularity: we iterate over the
> node-affinity sequence to find the first node that can accommodate
> the task. Once such a node is found, the second stage selects the
> first capacity-available LLC within this node by walking the
> intra-node LLC-affinity sequence.
>=20
> Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
> ---
>  kernel/sched/fair.c | 185 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 185 insertions(+)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index dc7bbdb1ab98..cfbd596992ab 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -10610,6 +10610,191 @@ static enum llc_mig can_migrate_llc(int src_cpu=
, int dst_cpu,
>  	return mig_llc;
>  }
> =20
> +/*
> + * Like get_llc_stats but for sched domain that above LLC level.
> + * Based on get_llc_stats, we can accumulate utilization and cap for
> + * sched domain in the granularity of LLC.
> + */
> +static bool get_span_stats(const struct cpumask *span, unsigned long *ut=
il_out,
> +					unsigned long *cap_out)
> +{
> +	cpumask_var_t mask;
> +	int cpu;
> +	unsigned long util_tmp, cap_tmp, util =3D 0, cap =3D 0;
> +	struct sched_domain *sd_tmp;
> +
> +	if (!span || !util_out || !cap_out)
> +		return false;
> +
> +	if (!alloc_cpumask_var(&mask, GFP_ATOMIC))
> +		return false;
> +
> +	cpumask_copy(mask, span);
> +	for_each_cpu(cpu, mask) {
> +		if (!get_llc_stats(cpu, &util_tmp, &cap_tmp)) {
> +			free_cpumask_var(mask);
> +			return false;
> +		}
> +
> +		sd_tmp =3D rcu_dereference(per_cpu(sd_llc, cpu));
> +		cpumask_andnot(mask, mask, sched_domain_span(sd_tmp));
> +		util +=3D util_tmp;
> +		cap +=3D cap_tmp;
> +	}
> +
> +	*util_out =3D util;
> +	*cap_out =3D cap;
> +
> +	free_cpumask_var(mask);
> +	return true;
> +}
> +
> +/*
> + * Decide if migration should happen on a specific node.
> + * The node here is an LLC or a NUMA.
> + */
> +static enum llc_mig __maybe_unused can_migrate_node(int src_cpu, int dst=
_cpu,
> +			struct task_struct *p, bool to_pref)
> +{
> +	const struct cpumask *span;
> +	struct mm_struct *mm;
> +	unsigned long dst_util, dst_cap, tsk_util =3D 0;
> +	unsigned long src_util =3D 0, src_cap =3D 0;
> +	unsigned long acc_util =3D 0, acc_cap =3D 0;
> +	int node, target_cpu =3D src_cpu;
> +	int get_src =3D 0;
> +
> +	if (!get_llc_stats(dst_cpu, &dst_util, &dst_cap))
> +		return mig_unrestricted;
> +
> +	if (!get_llc_stats(src_cpu, &src_util, &src_cap))
> +		src_cap =3D 0;
> +
> +	if (p) {
> +		mm =3D p->mm;
> +		if (mm) {
> +			if (mm->sc_stat.cpu >=3D 0)
> +				target_cpu =3D mm->sc_stat.cpu;
> +		}
> +		tsk_util =3D task_util(p);
> +	}
> +
> +	dst_util =3D dst_util + tsk_util;
> +
> +	if (to_pref) {
> +		unsigned long dst_pre =3D dst_util - tsk_util;

dst_pre was limited to this scope but was used later in a different
scope.  Should move the declaration to parent scope.

> +
> +		if (fits_llc_capacity(dst_util, dst_cap))
> +			return mig_llc;
> +
> +		/*
> +		 * The destination is over the margin. That is a reason to
> +		 * refuse a task while the margin can still be met, but not
> +		 * while every LLC of the node is over it: no placement
> +		 * satisfies the margin then, and refusing every migration
> +		 * leaves the imbalance in place.
> +		 *
> +		 * Let the task through when the move still lowers the peak,
> +		 * that is when the source is noticeably heavier than the
> +		 * destination and carries at least two more tasks worth of
> +		 * utilization. The second condition keeps the destination
> +		 * from becoming the heavier side, which would bounce the
> +		 * task straight back.
> +		 */
> +		if (src_cap && util_greater(src_util, dst_pre) &&
> +		    src_util >=3D dst_pre + 2 * tsk_util)
> +			return mig_llc;
> +
> +		return mig_forbid;
> +	}
> +
> +	for_each_sched_node(target_cpu, node) {
> +		unsigned long u =3D 0, c =3D 0, nu, nc;
> +
> +		/*
> +		 * The walk starts at the anchor, so the nodes it crosses before
> +		 * reaching the source say nothing about this migration: the task
> +		 * does not live there and is not going there. Judging them only
> +		 * lets an unrelated node with room refuse the move. Start at the
> +		 * node the task actually sits on.
> +		 */
> +		if (!get_src) {
> +			if (!cpumask_test_cpu(src_cpu, cpumask_of_node(node)))
> +				continue;
> +			else
> +				get_src =3D 1;
> +		}
> +
> +		if (cpumask_test_cpu(dst_cpu, cpumask_of_node(node))) {
> +			nu =3D 0;
> +			nc =3D 0;
> +			for_each_llc_node_span(node, span) {
> +				get_span_stats(span, &u, &c);
> +				nu +=3D u;
> +				nc +=3D c;
> +				if (cpumask_test_cpu(dst_cpu, span)) {
> +					if (fits_llc_capacity(u + tsk_util, c))
> +						return mig_llc;
> +
> +					/*
> +					 * The destination is over the margin,
> +					 * but so may be the source. Refusing
> +					 * then leaves the peak where it is:
> +					 * a LLC at seven tasks stays at seven
> +					 * while a neighbour in the same node
> +					 * sits at four, because taking one
> +					 * more would put that neighbour over
> +					 * the margin as well.
> +					 *
> +					 * Let the task through when the move
> +					 * still lowers the peak, guarded the
> +					 * same way as the aggregation path:
> +					 * the source must be noticeably
> +					 * heavier and carry at least two more
> +					 * tasks worth of utilization, so the
> +					 * destination cannot end up the
> +					 * heavier side and bounce it back.
> +					 */
> +					if (src_cap &&
> +					    util_greater(src_util, u + tsk_util) &&
> +					    src_util >=3D u + 2 * tsk_util)
> +						return mig_llc;
> +
> +					return mig_forbid;
> +				/*
> +				 * A nearer LLC only justifies vetoing this
> +				 * migration if the task would actually fit
> +				 * there, so account for its utilization the
> +				 * same way the destination branch above does.
> +				 * Without it a LLC already holding one task
> +				 * per core still reads as having room and
> +				 * vetoes every migration towards a farther,
> +				 * genuinely idle LLC.
> +				 */
> +				} else if (fits_llc_capacity(acc_util + nu + tsk_util,
> +						acc_cap + nc)
> +						&& fits_llc_capacity(u + tsk_util, c)
> +						&& !util_greater(u, dst_pre))

Got a compile error here when I try to build the code.  Seems like dst_pre =
was declared in previous scope above.
Likely the posted version is slightly different from the tested version.

$ make
  DESCEND objtool
  CC      kernel/sched/fair.o
kernel/sched/fair.c: In function =E2=80=98can_migrate_node=E2=80=99:
kernel/sched/fair.c:10855:69: error: =E2=80=98dst_pre=E2=80=99 undeclared (=
first use in this function)
10855 |                                                 && !util_greater(u,=
 dst_pre))
      |                                                                    =
 ^~~~~~~
kernel/sched/fair.c:10618:27: note: in definition of macro =E2=80=98util_gr=
eater=E2=80=99
10618 |         ((util1) * 100 > (util2) * (100 + llc_imb_pct))
      |                           ^~~~~
kernel/sched/fair.c:10855:69: note: each undeclared identifier is reported =
only once for each function it appears in
10855 |                                                 && !util_greater(u,=
 dst_pre))
      |                                                                    =
 ^~~~~~~
kernel/sched/fair.c:10618:27: note: in definition of macro =E2=80=98util_gr=
eater=E2=80=99
10618 |         ((util1) * 100 > (util2) * (100 + llc_imb_pct))
      |                           ^~~~~
make[4]: *** [scripts/Makefile.build:290: kernel/sched/fair.o] Error 1
make[3]: *** [scripts/Makefile.build:551: kernel/sched] Error 2
make[2]: *** [scripts/Makefile.build:551: kernel] Error 2
make[1]: *** [/home/tim/linux/Makefile:2229: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2

Tim

> +					return mig_forbid;
> +			}
> +		}
> +
> +		/* Don't migrate if this is a good place to live. */
> +		for_each_llc_node_span(node, span) {
> +			get_span_stats(span, &u, &c);
> +			if (cpumask_test_cpu(src_cpu, span)) {
> +				if (fits_llc_capacity(u, c))
> +					return mig_forbid;
> +			} else {
> +				if (fits_llc_capacity(u + tsk_util, c))
> +					return mig_forbid;
> +			}
> +		}
> +	}
> +
> +	return mig_unrestricted;
> +}
> +
>  /*
>   * Check if task p can migrate from source LLC to
>   * destination LLC in terms of cache aware load balance.
