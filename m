Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594373;
	b=47DYkY5W8RM5XlJE9TSMMyhkQkq9mcpwruMReuPJEkpnl4CFCrwib+CpzHWkBRGg1eKE
	 Vi8Gr3vS65H3zr0FNJWfpXw73zH+ydxA+7YsRXg3Y2uMPel85N5+cFD9tyMEs9ewu5Ev2
	 zfbHCZjFeh8KbSnLUIUUot218eKMkV37yTea5VJ7b3BT/vAs4MP52aSnGGWjDFBXG1AER
	 qbsRJrPKf4G4TzIBjXGW7CGE5ecexmAHO7LBHVYiDye704UGL/bUnOLHv6dv+xbYzUNE/
	 85/t6ZN/xgwqEbuqZLVdWSNJoo/aFdofyrNW02pOLt6UfhYv+KAVP/yP4cfDY0ueYxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594373;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yCt22GINH7VVMqpK3DG4ULuMRP/y9K0Os3XzSbMXiWU=;
	b=4VafIQ1bvS83Yj/K12e86RNff6MySVKlxBve9aH/Z680Y0/Z7z/NJyOhvFyBJ+zLcA7h
	 Wddhtg1IjjpOl42BSwtjpYoPIzAmoePNQ6e34hogXVo3ubHP/xdSwRFZYqKrgvaLrE8L6
	 gUrAFEf8CLzmv/aZi9FkEUBJummxVyhAQU0HhwZ/bYfq7sUhCQ6t6QOe/CzSE5gagowPm
	 XcsRUdYfT+XSKpPIyGN2DP7ifcnhjTY37jDXSk27oFXShlGbWvLaFWmha+qOh+6+CwbC/
	 Vpi/bmWQ5iDRfnCM1tDtIhEuXAyi5Zwz4xsyYsMGCJHqNxxgrYGkhWDkgYsWioBgodQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xhU9zOdq;
	arc=none smtp.remote-ip=95.215.58.198
Received: from mta1.migadu.com (out-198.mta1.migadu.com [95.215.58.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F703606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F703606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xhU9zOdq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=W3N0HjBs5elGdBPTt/W9l12M7ByILze1TCap73imTEw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794594369; v=1; x=1795199169;
 b=xhU9zOdqaquKS9aWGoSfuEgiSX73erobQXALPB49juNilyIxJ8SBi29UhPfOULItnmHQ89PP
 6t1HEIE+VaIMJ1P4/calTNhQHHNJEcLh2vC2LCEa/6xejQHRI0OiPfigwUf+WavUVxUTSFbsuNg
 jsA+r+9wjeWJi29f242x0IVA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id e3afecfd60183309;
	Fri, 13 Nov 2026 18:26:08 +0000
X-Mizu-Trace-ID: e3afecfd60183309
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrea Righi <arighi@nvidia.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	peterz@infradead.org,
	mingo@redhat.com,
	vincent.guittot@linaro.org,
	kprateek.nayak@amd.com,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	samuelcrossley@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	kas@kernel.org,
	riel@surriel.com,
	Arnav Aghav <aghav@meta.com>
Subject: Re: [PATCH] Revert "sched/fair: Add SIS_UTIL support to select_idle_capacity()"
Date: Fri, 13 Nov 2026 10:26:00 -0800
Message-ID: <20261113182601.569981-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <avdIycF_mZV8CHKb@gpd4>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 13 Nov 2026 18:28:41 +0100 Andrea Righi <arighi@nvidia.com> wrote:

> Hi Usama,
>

Hello Andrea!
 
> On Fri, Nov 13, 2026 at 07:31:57AM -0800, Usama Arif wrote:
> > This reverts commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support to
> > select_idle_capacity()").
> > 
> > That commit applied the SIS_UTIL scan budget to select_idle_capacity().
> > The early checks in select_idle_sibling() consider a few specific
> > candidates: the target, previous and recently used CPUs. If none is
> > selected, the asymmetric path calls select_idle_capacity() to search
> > the allowed domain. With SIS_UTIL enabled, a zero scan budget makes it
> > return -1 before that search. The caller then returns the selected
> > target, even if an unexamined CPU in the domain is idle and fits the
> > task.
> 
> Isn't this consistent with select_idle_cpu(), which also skips the scan
> when the SIS_UTIL budget is zero? Missing an idle CPU is an intentional
> tradeoff of that heuristic. Could you clarify why we should remove the
> budget specifically from the asymmetric path?
>

It is consistent.

Symmetric path also has this (I didnt check this before sending the patch).
The service is running on Grace servers which report capacity differences
and updating the kernel from 6.16 resulted in the problem I outlined below.

Maybe the symmetric path needs to be audited as well?

Or maybe this service should not have ever run with SIS_UTIL at all..
(The only thing is that kernel upgrade caused a serious regression)

(Should have made this patch RFC :))

> > 
> > The budget is derived from aggregate CFS utilization. High aggregate
> > utilization can coexist with idle CPUs when a task wakes.
> > 
> > On a 72-CPU NVIDIA grace arm64 server, small reported capacity differences
> > (1013-1024) within the single LLC activate asymmetric selection. Both
> > the reference and affected kernels were observed with a zero scan
> > hint. The reference kernel ignored it and still searched the domain.
> > A latency-sensitive, wakeup-heavy production workload saw its reported
> > minute p50 latencies average 129 ms on the reference kernel and 223 ms
> > on the affected kernel.
> 
> Have you tried forcing the symmetric idle-selection path through
> select_idle_cpu(), with SIS_UTIL both enabled and disabled?
> 

This cant be done from a running kernel, right? My understanding is
that the cpu capacities come from firmware, so cant be changed at
runtime to be constant across all CPUs in kernel?

Changing kernel on a production service can be a bit of a process.

> It'd be useful to see whether disabling SIS_UTIL produces the same
> improvement there and whether symmetric idle selection performs better
> overall on this system.
> 
> > 
> > Disabling SIS_UTIL reduced the aggregate involuntary context switch
> > rate of worker main threads from 71.6k/s to 13.3k/s; re-enabling it
> > raised the rate to 73.7k/s. A five-minute disabled run also reduced
> > kernel CPU time per request by 10.9%. The available minute p50 samples
> > averaged 149 ms, compared with 241 ms before the trial.
> > 
> > These measurements come from disabling SIS_UTIL on the installed
> > kernel. The feature toggle also disables the symmetric scan limit and
> > shared scan-hint updates.
> > 
> > Restore the search of the allowed domain, retaining the capacity,
> > uclamp and SMT selection rules and their early returns. Domains with
> > no suitable idle CPU can again require a full scan, potentially increasing
> > scan CPU cost.
> 
> Yeah, this is my main concern, full scans can become quite expensive on
> large systems with lots of CPUs in the same LLC.
> 

Yeah I imagine this was the reason for the initial patch.

The same workload on 6.16 kernel placed 69% of wakeups on an idle CPU,
the affected kernel with the patch that this is reverting only placed 7%.

Do you know how much CPU usage can be attributed to the scan on these
large systems if you do full scans?

> Thanks,
> -Andrea
> 
> > 
> > Reported-by: Arnav Aghav <aghav@meta.com>
> > Fixes: 61ea17a63719 ("sched/fair: Add SIS_UTIL support to select_idle_capacity()")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > ---
> >  kernel/sched/fair.c | 19 -------------------
> >  1 file changed, 19 deletions(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index d4cc0caee6265..def5cda2e6bad 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -9091,7 +9091,6 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
> >  	int fits, best_fits = ASYM_IDLE_THREAD_MISFIT;
> >  	int cpu, best_cpu = -1;
> >  	struct cpumask *cpus;
> > -	int nr = INT_MAX;
> >  
> >  	cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
> >  	cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
> > @@ -9100,28 +9099,10 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
> >  	util_min = uclamp_eff_value(p, UCLAMP_MIN);
> >  	util_max = uclamp_eff_value(p, UCLAMP_MAX);
> >  
> > -	if (sched_feat(SIS_UTIL) && sd->shared) {
> > -		/*
> > -		 * Same nr_idle_scan hint as select_idle_cpu(), nr only limits
> > -		 * the scan when not preferring an idle core.
> > -		 */
> > -		nr = READ_ONCE(sd->shared->nr_idle_scan) + 1;
> > -		/* overloaded domain is unlikely to have idle cpu/core */
> > -		if (nr == 1)
> > -			return -1;
> > -	}
> > -
> >  	for_each_cpu_wrap(cpu, cpus, target) {
> >  		bool preferred_core = !has_idle_core || is_core_idle(cpu);
> >  		unsigned long cpu_cap = capacity_of(cpu);
> >  
> > -		/*
> > -		 * Stop when the nr_idle_scan is exhausted (mirrors
> > -		 * select_idle_cpu() logic).
> > -		 */
> > -		if (!has_idle_core && --nr <= 0)
> > -			return best_cpu;
> > -
> >  		if (!choose_idle_cpu(cpu, p))
> >  			continue;
> >  
> > -- 
> > 2.53.1-Meta
> > 
> > 
> 
