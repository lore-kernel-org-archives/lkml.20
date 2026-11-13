Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794611221;
	b=HOP/E+D+o4pnTI6HkjMZaVcO+AOgyi7Itm2XwtOw5h10SAhJqjqofUf+hkwQPTHN+mpY
	 131LwV5szXx56kOpvtK+vMqdBCfdz4fO6RHrGMxxmUYulZ7DV4owaGTKp8plZdTuLeTPI
	 TuPseL5lR2na5ayEVUh+IaaOhntkhhxKl1CJrQxt8Gt6rKGc9gEr4jFthDJk+jE/CfTI4
	 F1amIj8wuFt0u2gtD5NFfN9YtBP1hJSv8dIOZ4L6RXIeWqRNIobWhgMUrfmIgDPTGIE/x
	 NbmmXS/EAkuL+IS1XpiXjLkcVDHeaG4KEI9InYAVmdhbdXP3z/tld08jMlD63EmnTeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794611221;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=6zeTznwnJoyafe0tC+JcmtPeL712XSkLRnDXgIueIPg=;
	b=oGSotsMinZTaZxVDyWJ4b0cnAcK1HrtXGtGkLPbpBZJN2CohOhUjNvuNYqNUCGS2pszv
	 gffPYlFZd994qqmlSRcqAZ5SMRaC91QB+IYEILVPkFYlMlx/T5sO7c4s8vOUV1ioTkF44
	 1UolbUEjeYQwmWZl6Jkpor3vSs9Ne+TE4UTSZgJyh2RUmuWk4WS6PFO6gRDDPTskB1y41
	 +JJEZp35hbPJouhF/3+b6hU+mQ1tjNRMLul+8AUlNCq+nnMeQ3HkXsIX8x/gHCZhsqjDF
	 iUUV25I0bqTD9Y5YMXPmRc4cupG3yMY4qNzuEpKbY4aKz7zPv48OfHjzLChaFhFdLlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QefPzyJn;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855DC606A338
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855DC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QefPzyJn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794611221; x=1826147221;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=FTcdjq9kdwJz7zVfgduw3HyP+X9UuhRTU3gVxE5yf5k=;
  b=QefPzyJned2IrI7vCSpyY8ZLcNSxbgYeivr+pdrO2jUGoIgu3EGoxS2v
   BbOYD8H3kTBBQDndw8WXGgHft0nNh7IaaKpAIGB1Y5MQDSQftPsXmKG8L
   0Z2Zh0L4decgOMhuo3j8TpG4bJEu2czn1GtItY39VohcqDtoGoXI5Fk3O
   fbEkxX00qg15Q1M8k6kbuuFlbG310gZNUGR9+MrAO+tnZQmL3Sl6QRFAt
   6wBSAqnAtXHeF5BebDpjdTlnsoChQdPhTJNNWpog5ZBB0+iM5bZuloudV
   R2jv8nzB0lLDHC1x39M4ag/+KDZrifj0CwIGxCxTzqK7p65t6e3EDVyby
   A==;
X-CSE-ConnectionGUID: lhlyOaqVSnK6E1nakQRKuw==
X-CSE-MsgGUID: zpAO3aJpRemnPoRQdRSLeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3442651"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3442651"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 15:06:59 -0800
X-CSE-ConnectionGUID: j5i6jYVMTlii8YUPW/y9CA==
X-CSE-MsgGUID: awO5RD7gSY+MNN2I28ShOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8883617"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.108.28]) ([10.125.108.28])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 15:06:59 -0800
Message-ID: <13d982ce42116f876f01a77bae7f02d3800f08fc.camel@linux.intel.com>
Subject: Re: [Patch v4 17/22] sched/cache: Avoid cache-aware scheduling for
 memory-heavy processes
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Jirka Hladky <jhladky@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, Ingo Molnar <mingo@redhat.com>, K
 Prateek Nayak <kprateek.nayak@amd.com>, "Gautham R . Shenoy"
 <gautham.shenoy@amd.com>, Vincent Guittot	 <vincent.guittot@linaro.org>,
 Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall	 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider	 <vschneid@redhat.com>, Madadi Vineeth Reddy
 <vineethr@linux.ibm.com>, Hillf Danton <hdanton@sina.com>, Shrikanth Hegde
 <sshegde@linux.ibm.com>, Jianyong Wu	 <jianyong.wu@outlook.com>, Yangyu
 Chen <cyy@cyyself.name>, Tingyin Duan	 <tingyin.duan@gmail.com>, Vern Hao
 <vernhao@tencent.com>, Vern Hao	 <haoxing990@gmail.com>, Len Brown
 <len.brown@intel.com>, Aubrey Li	 <aubrey.li@intel.com>, Zhao Liu
 <zhao1.liu@intel.com>, Chen Yu	 <yu.chen.surf@gmail.com>, Adam Li
 <adamli@os.amperecomputing.com>, Aaron Lu	 <ziqianlu@bytedance.com>, Tim
 Chen <tim.c.chen@intel.com>, Josh Don	 <joshdon@google.com>, Gavin Guo
 <gavinguo@igalia.com>, Qais Yousef	 <qyousef@layalina.io>, Libo Chen
 <libchen@purestorage.com>, 	linux-kernel@vger.kernel.org, "Luck, Tony"
 <tony.luck@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Philip
 Auld <pauld@redhat.com>, Joe Mario <jmario@redhat.com>
Date: Fri, 13 Nov 2026 15:06:58 -0800
In-Reply-To: <CAE4VaGAZavgRWDf=ukaj_EJvOO52hTpAYKPe1JEtUE3E2q0y0w@mail.gmail.com>
References: <cover.1775065312.git.tim.c.chen@linux.intel.com>
	 <339bb2636c7306e17540268a9295a8e673b92804.1775065312.git.tim.c.chen@linux.intel.com>
	 <20260409124642.GC3126523@noisy.programming.kicks-ass.net>
	 <a2d7e7b2-5a4c-48bc-b567-61e3cbd17786@intel.com>
	 <20260410092057.GG3126523@noisy.programming.kicks-ass.net>
	 <CAE4VaGAZavgRWDf=ukaj_EJvOO52hTpAYKPe1JEtUE3E2q0y0w@mail.gmail.com>
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

On Fri, 2026-11-13 at 17:29 +0100, Jirka Hladky wrote:
> Hi Peter, Chen Yu, Tim,
>=20
>=20
>=20

[snip]

> THE FOOTPRINT ESTIMATE NEVER LEAVES ZERO (MG class D, 64 threads)
>   Traced live on the stock kernel with bpftrace (comm-filtered),
>   across three CAS-on runs:
>=20
>     - grp->footprint: 0 in 44,670 and 40,638 task_cache_work()
>       samples over two full runs (min =3D max =3D 0), while ~7M pages
>       (26.4 GiB) were resident. NUMA balancing was active: 8k-20k
>       hint faults and up to 3.3M pages migrated per run.
>     - In those two runs the footprint write never executed: all
>       ~8k-13k task_numa_placement() calls per run (one per hint
>       fault, via task_numa_fault()) returned at the scan_seq gate.
>=20
>   WHY THE SIGNAL NEVER ACCUMULATES
>   1. grp->footprint is only written in task_numa_placement(),
>      which runs only when mm->numa_scan_seq changes. That counter
>      increments only in reset_ptenuma_scan(): when the NUMA scanner
>      has wrapped the whole address space.
>   2. The scanner walks the 26.4 GiB of mappings at ~0.3-1 GiB/s
>      (traced via mm->numa_scan_offset and change_prot_numa()
>      return values), so one sweep takes 30-40s or more. The 43s
>      benchmark completed 0 sweeps in two runs, 1 sweep (at t=3D33s)
>      in a third. The accounting runs at most once per task per
>      run.
>   3. The signal is also small: a run accumulates only 8k-20k
>      hint-fault events, 0.1-0.3% of the working set, below the
>      108 MiB threshold even when a sweep does complete.
>   4. And it is a rate signal, not a size: the increment is
>      diff =3D numa_faults[MEMBUF] - numa_faults[MEM] / 2, which is
>      zero at any steady fault rate.
>=20
>   Cadence, coverage and formula each independently hold the
>   footprint orders of magnitude below the resident set.
>=20
>   exceed_llc_capacity() is evaluated on every tick and every scan
>   epoch, but with footprint at 0 the comparison
>=20
>       llc_bytes * scale  <  footprint * PAGE_SIZE
>=20
>   is never true, so grp->cpu is never reset. After a 1.8s warm-up it
>   pointed at the same LLC for all 44,661 remaining samples.
>=20
>   Without NUMA balancing the check never triggers, as sched-cache.rst
>   documents. With CAS on and numa_balancing=3D0 the same run takes
>   42.2s, the same as with NUMA balancing on (42.0s).
>=20
> WHAT THE AGGREGATION COSTS (MG class D, 64 threads)
>   - With CAS on, 97% of thread-samples are on one node. The 26.4 GiB
>     working set starts ~50/50 across the nodes and NUMA balancing
>     then pulls it to the busy node (numa_maps 3.3M/2.7M pages ->
>     6.7M/0.2M; 1.42M pages migrated during the run).
>   - The cost is not on the CPU side: average CPU utilization is
>     essentially unchanged (6164% vs 6029% - about 61 of the 64
>     threads on-CPU in both configurations), and wakeup latency is
>     49us on average, 0.73ms max (perf sched). What grows is
>     UserTime, +48%: the threads keep running, each operation just
>     stalls longer on memory.
>   - The cost is the placement itself, not migration or remote
>     accesses:
>       a) 32 threads: memory fully converges to the busy node well
>          before the run ends, and the run is still 46% slower;
>       b) CAS on with numa_balancing=3D0: no migrations, pages stay
>          65/35, and the runtime is unchanged (42.2s);
>       c) CAS off with the process simply taskset-pinned to one
>          socket (memory 100% local from first touch, no
>          migrations): 40.3s, within the CAS-on range (40.6-42.9s).
>     64 memory-streaming threads on one socket get about two thirds
>     of the throughput they get spread across both sockets (Mop/s
>     -34%), wherever the pages live. So the only effective fix is to
>     not aggregate such a process in the first place.
>=20

Thanks for your detailed analysis of the regression on NAS MG
and its root cause. Much appreciated.

> QUESTIONS
>   1. Was the sweep-boundary gating of this accounting known or
>      intended? For a workload with a large address space it means
>      the footprint sees at most one update per run; for a shorter
>      one, none at all.

Not intended. Your reading of the code is right. The footprint is
only written from task_numa_placement(), and that function returns
early unless mm->numa_scan_seq has moved, which happens once per full
sweep of the address space. The cadence is fine for NUMA placement.
But it may be too long for large footprints. The tests we
validated against had a small enough RSS that the first sweep finished
within the first seconds of the run.

One correction to your point 3. numa_faults counts pages, not fault
events. A THP hint fault adds HPAGE_PMD_NR (512) pages per fault. Your
3.3M migrated pages from 8k-20k faults suggests THP was in use. If so,
one completed sweep would push the footprint to millions of pages, far
above the 27.6k pages that equal a 108 MiB LLC. Two things would help
confirm this:

  - Was THP enabled for the MG run?
  - In the third run, did grp->footprint become non-zero after the
    sweep completed at t=3D33s?

If both are yes, then sweep cadence is the problem and the size
estimate is not.

>   2. Could the check fail closed when there is no usable estimate
>      (warm-up, footprint still 0, NUMA balancing off)? RSS is a poor
>      estimate of the working set, as Peter said, but it is an upper
>      bound: if RSS fits in the LLC, so does the working set. Using it
>      only on the permit side - aggregate without a footprint estimate
>      only if RSS fits - would keep the gains for small processes and
>      not aggregate the ones we cannot judge. The costs are
>      asymmetric: a missed aggregation forfeits a gain, a wrong one
>      cost 65% here.

I think you have a point. I see two ways to fix this issue,
and they are complementary.

Fix 1:

  - When footprint is 0, or NUMA balancing is off, compare the RSS of
    the mm against llc_bytes * scale. Aggregate only if RSS fits.
  - Once a footprint estimate exists, use it as today.

RSS is not used as the estimate here, only as an upper bound while
there is no footprint from the sweep. That is consistent with Peter's
objection in April. It also closes the NUMA-balancing-off gap that
sched-cache.rst documents.

The downside: a process with a large RSS but a small hot set will not
be aggregated until an estimate exists, and with a very large RSS that
can be the whole run. A process that runs for less than one sweep
never gets an estimate at all.

Fix 2:

On the cadence side: accumulate the pages reported by
task_numa_fault() into the footprint as they arrive within the
current sweep, instead of waiting for task_numa_placement(). The
footprint then grows during the first sweep and the check trips
quickly for your MG run. At the sweep boundary task_numa_placement()
only applies the decay of the previous window, so the steady state
value is unchanged.

The downside: for a workload like yours there is still a short window
where we aggregate before the footprint crosses the LLC size. With
THP each hint fault adds 512 pages, so the 27.6k pages of a 108 MiB
LLC are reached after about 54 faults. At the few hundred faults per
second you measured that is under a second once scanning starts, and
scanning starts after the 1s scan delay. That is about the 1.8s
warm-up you saw before grp->cpu settled.

Fix 2 depends on NUMA balancing. Fix 1 also covers
your numa_balancing=3D0 run.

I lean toward doing both: Fix 2 for the cadence, Fix 1 for NUMA
balancing off and for the first sweep. Peter, is the RSS bound
acceptable when it is used only as a gate and never as the estimate?


>   3. Our data supports Peter's point that LLC hit/miss information
>      would be the better signal: the damage is purely memory-side
>      (UserTime +59% at flat CPU% in the 112-thread run), and a
>      memory-streaming process would show a low hit rate regardless
>      of how well its footprint is estimated. Is anyone looking at
>      that?

I am not aware of patches posted along these lines.=C2=A0

The two possible routes are RDT (CMT llc_occupancy and MBM bandwidth per RM=
ID)
and PMU miss counters. RDT needs an RMID per cache group, which
resctrl owns.  Mixing RMID management with scheduler will be tricky.

The scheduler does not own the PMU, so the PMU route is
unlikely to be accepted. Near term the usable signals are the RSS
bound above and user hints through prctl to enable/disable
cache aware scheduling or modify tuning knobs per sched group.


>   4. Chen Yu mentioned that you are reworking the footprint
>      accounting for the prctl v2 series [2]. Could the detection fix
>      be part of that rework?
>=20

The v2 work on footprint is about correctness, not cadence.=20

Fix 2 I mentioned above touches the same footprint code that the=C2=A0
v2 series reworks, so the two are not independent. I think we
would consider whether to add the proposed fixes in the same
series or leave it as a follow on.

Would you consider testing the patches when we post them?
We will CC you.

Tim

> [1] <50a8055e38958cdc39e07435aaad56e4719b2bd3.1794507151.git.tim.c.chen@l=
inux.intel.com>
> [2] <5c912bd3-8701-4395-a118-4ee6e09233e2@intel.com>
> [3] NAS Parallel Benchmarks: https://www.nas.nasa.gov/software/npb.html
>     MG is the multigrid kernel: four V-cycles of 27-point stencil
>     sweeps over a 3D grid hierarchy (finest grid 512^3 for class C,
>     1024^3 for class D) solving a Poisson equation. Each sweep
>     streams through a few double-precision arrays - a 3.3 GiB working
>     set for class C, 26.4 GiB for class D - far beyond any LLC, with
>     little reuse between sweeps: the kernel is memory-bandwidth-bound
>     by construction.
>=20
> The per-run logs, the placement/migration/sweep traces, and the
> bpftrace scripts behind them are available if useful.
>=20
> Regards,
> Jirka Hladky
> Red Hat
>=20
