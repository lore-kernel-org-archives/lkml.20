Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.60
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843375;
	b=y9Sivj7fP9M2OMn4X7bNix7RA75rNnDy+6bp4eopMNgAcrKcTuJTEhozq/p+5niNBRyd
	 FElEoijN52u7Xwls3AYBuI/37npV4if6O/+odzkHiwHHnjQR1bvurxzIIjekBePNefTS9
	 dxbwFo3qqfqQPzFA+b/fnoqy/lJRLNB8ATqF7iWFMCum9T4aQL2DaN8ScUbvuXgMnS8gA
	 2lB3yLZ/XzQZsY6Ye6uMauFXelNFxnE0X2hwkBbdtDysE+EyJNt9JrNzpDDoUbyxjzeiG
	 aA8g29R4LTbF6aeuCL7kXjrWbWMj5/gX7OoWjxnstC5yjMRk6QZpQoHkJrQGIVoT99A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843375;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wwsLEHMebjRIZ6cm6aRO0/os5Z7Wo6Sx/qPBcxQH3m0=;
	b=r6aCc6tpG5dZZ1bIZpPZtrlWguiMUY9cPorhw373DJSYGqg6RLkJMYOwUGHZ6tEBOeYt
	 K257Cg8+uVt1m/ctM/+kUhLyd1H4Hg30IHnDw7UHXP7AqkSR/exUy7486sdMrbLgVHHL0
	 UgZ19LrBAEUPBkIDkh5QNvSJ585bbmTQLeK327PqeNVMufzRkhEbbA52DHyONoz9LzVIU
	 Q0dOVqJiXlqV5AbD3qeDqh0Db5Lgv+sh7ZP2vxpuJUfMskT93En/ko72nSUXhEm9RrGgn
	 udtC3rjBBYtocvg/lmWFWRjTcfaeI91sZVVKDTymbO0XNwFfk6MqAClht88UlyFDy/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mOuGKedZ;
	arc=none smtp.remote-ip=91.218.175.60
Received: from mta0.migadu.com (out-60.mta0.migadu.com [91.218.175.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7CB606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A7CB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mOuGKedZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oPKPgBXpCregrS1C96Nn7lFsq7OnOEEdtVUsZzmJR48=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794843371; v=1; x=1795448171;
 b=mOuGKedZfsYbdumuWblFKyNTZUrt2u9GsKvKimd+F3zUMdp5Gs4uFZUcSFf1Eb0yGbQSgvFW
 JGaerYFtqKOK9YX8DggY+7KoALO2phN45+YQY6Ja4ecKFLCvHb+4fECGF3f0eYht/LFhEWitZEH
 GETIrVcgnhyiSYujWyqwVROc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fefba341e4ad7393;
	Mon, 16 Nov 2026 15:36:11 +0000
X-Mizu-Trace-ID: fefba341e4ad7393
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 23:37:23 +0800
From: Chen Yu <chen.yu@linux.dev>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Andrea Righi <arighi@nvidia.com>, Usama Arif <usama.arif@linux.dev>,
	peterz@infradead.org, mingo@redhat.com, kprateek.nayak@amd.com,
	juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, samuelcrossley@gmail.com,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	kas@kernel.org, riel@surriel.com, Arnav Aghav <aghav@meta.com>,
	tim.c.chen@linux.intel.com
Subject: Re: [PATCH] Revert "sched/fair: Add SIS_UTIL support to
 select_idle_capacity()"
Message-ID: <avsfYA0fM5eaPPY1@three-body>
References: <avdIycF_mZV8CHKb@gpd4>
 <20261113182601.569981-1-usama.arif@linux.dev>
 <aveB5xbos9hRa3Nn@gpd4>
 <CAKfTPtCgzJakXU1o7C2EMEVTnD_mVS_xrdOJkQ9d_70U4_yCPg@mail.gmail.com>
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
In-Reply-To: <CAKfTPtCgzJakXU1o7C2EMEVTnD_mVS_xrdOJkQ9d_70U4_yCPg@mail.gmail.com>

On Sat, Nov 14, 2026 at 10:06:25AM +0100, Vincent Guittot wrote:
> 
> On Fri, 13 Nov 2026 at 22:32, Andrea Righi <arighi@nvidia.com> wrote:
> >
> > On Fri, Nov 13, 2026 at 10:26:00AM -0800, Usama Arif wrote:
> > > On Fri, 13 Nov 2026 18:28:41 +0100 Andrea Righi <arighi@nvidia.com> wrote:
> > >
> > > > Hi Usama,
> > > >
> > >
> > > Hello Andrea!
> > >
> > > > On Fri, Nov 13, 2026 at 07:31:57AM -0800, Usama Arif wrote:
> > > > > This reverts commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support to
> > > > > select_idle_capacity()").
> > > > >
> > > > > That commit applied the SIS_UTIL scan budget to select_idle_capacity().
> > > > > The early checks in select_idle_sibling() consider a few specific
> > > > > candidates: the target, previous and recently used CPUs. If none is
> > > > > selected, the asymmetric path calls select_idle_capacity() to search
> > > > > the allowed domain. With SIS_UTIL enabled, a zero scan budget makes it
> > > > > return -1 before that search. The caller then returns the selected
> > > > > target, even if an unexamined CPU in the domain is idle and fits the
> > > > > task.
> > > >
> > > > Isn't this consistent with select_idle_cpu(), which also skips the scan
> > > > when the SIS_UTIL budget is zero? Missing an idle CPU is an intentional
> > > > tradeoff of that heuristic. Could you clarify why we should remove the
> > > > budget specifically from the asymmetric path?
> > > >
> > >
> > > It is consistent.
> > >
> > > Symmetric path also has this (I didnt check this before sending the patch).
> > > The service is running on Grace servers which report capacity differences
> > > and updating the kernel from 6.16 resulted in the problem I outlined below.
> > >
> > > Maybe the symmetric path needs to be audited as well?
> > >
> > > Or maybe this service should not have ever run with SIS_UTIL at all..
> > > (The only thing is that kernel upgrade caused a serious regression)
> > >
> > > (Should have made this patch RFC :))
> > >
> > > > >
> > > > > The budget is derived from aggregate CFS utilization. High aggregate
> > > > > utilization can coexist with idle CPUs when a task wakes.
> > > > >
> > > > > On a 72-CPU NVIDIA grace arm64 server, small reported capacity differences
> > > > > (1013-1024) within the single LLC activate asymmetric selection. Both
> > > > > the reference and affected kernels were observed with a zero scan
> > > > > hint. The reference kernel ignored it and still searched the domain.
> > > > > A latency-sensitive, wakeup-heavy production workload saw its reported
> > > > > minute p50 latencies average 129 ms on the reference kernel and 223 ms
> > > > > on the affected kernel.
> > > >
> > > > Have you tried forcing the symmetric idle-selection path through
> > > > select_idle_cpu(), with SIS_UTIL both enabled and disabled?
> > > >
> > >
> > > This cant be done from a running kernel, right? My understanding is
> > > that the cpu capacities come from firmware, so cant be changed at
> > > runtime to be constant across all CPUs in kernel?
> > >
> > > Changing kernel on a production service can be a bit of a process.
> >
> > Yeah, this would require a patch and a reboot. Unfortunately there isn't
> > an existing runtime switch to force symmetric/asym idle selection.
> >
> > >
> > > > It'd be useful to see whether disabling SIS_UTIL produces the same
> > > > improvement there and whether symmetric idle selection performs better
> > > > overall on this system.
> > > >
> > > > >
> > > > > Disabling SIS_UTIL reduced the aggregate involuntary context switch
> > > > > rate of worker main threads from 71.6k/s to 13.3k/s; re-enabling it
> > > > > raised the rate to 73.7k/s. A five-minute disabled run also reduced
> > > > > kernel CPU time per request by 10.9%. The available minute p50 samples
> > > > > averaged 149 ms, compared with 241 ms before the trial.
> > > > >
> > > > > These measurements come from disabling SIS_UTIL on the installed
> > > > > kernel. The feature toggle also disables the symmetric scan limit and
> > > > > shared scan-hint updates.
> > > > >
> > > > > Restore the search of the allowed domain, retaining the capacity,
> > > > > uclamp and SMT selection rules and their early returns. Domains with
> > > > > no suitable idle CPU can again require a full scan, potentially increasing
> > > > > scan CPU cost.
> > > >
> > > > Yeah, this is my main concern, full scans can become quite expensive on
> > > > large systems with lots of CPUs in the same LLC.
> > > >
> > >
> > > Yeah I imagine this was the reason for the initial patch.
> > >
> > > The same workload on 6.16 kernel placed 69% of wakeups on an idle CPU,
> > > the affected kernel with the patch that this is reverting only placed 7%.
> >
> > That's a substantial difference, I agree the regression should be
> > addressed. Perhaps this points to a limitation of the SIS_UTIL
> > heuristic?
> >
> > We could investigate incorporating observed idle CPU availability into
> > the SIS_UTIL budget calculation, rather than relying solely on aggregate
> > utilization. Periodic load balancing already collects idle CPU
> > statistics, which might help distinguish actual saturation from high
> > utilization with CPUs still available.
> 
> We want to keep same behavior for select_idle_cpu and
> select_idle_capacity with both using the same SIS_UTIL algorithm.
> 
> That being said, the current algorithm is probably a bit too cautious,
> particularly for systems with a small number of CPUs
>

OK, maybe we can scale the minimal scan number according to the number of CPUs in an LLC,
the smaller the LLC, the more CPUs should be scanned, and vice versa. This "minimal scan guarantee"
was once in SIS_PROP, which is 4 IIUC. Now we can make it triggered when there are idle CPUs in
the domain, per Andrea:
"We could investigate incorporating observed idle CPU availability into
the SIS_UTIL budget calculation, rather than relying solely on aggregate
utilization."

scale by 256 / llc_weight, Grace would have to scan at least 3 CPUs, not sure if
it works for Usama

LLC CPUs   nr_min
    8        8
   16       16
   32        8
   64        4
   72        3   Grace
  128        2
  256        1
  512        0

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d1f3b179013e..fdde96564030 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12890,7 +12890,8 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 }
 
 static void update_idle_cpu_scan(struct lb_env *env,
-				 unsigned long sum_util)
+				 unsigned long sum_util,
+				 bool has_idle_cpus)
 {
 	struct sched_domain_shared *sd_share;
 	struct sched_domain *sd = env->sd;
@@ -12954,6 +12955,11 @@ static void update_idle_cpu_scan(struct lb_env *env,
 	/* equation [2] */
 	y *= llc_weight;
 	do_div(y, SCHED_CAPACITY_SCALE);
+
+	/* scale the minimal scan number for small LLC */
+	if (has_idle_cpus)
+		y = max_t(u64, y, min(llc_weight, 256 / llc_weight));
+
 	if ((int)y != sd_share->nr_idle_scan)
 		WRITE_ONCE(sd_share->nr_idle_scan, (int)y);
 }
@@ -12970,6 +12976,7 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
 	struct sg_lb_stats *local = &sds->local_stat;
 	struct sg_lb_stats tmp_sgs;
 	unsigned long sum_util = 0;
+	unsigned int nr_idle_cpus = 0;
 	bool sg_overloaded = 0, sg_overutilized = 0;
 
 	env->dst_core_idle = !sched_smt_active() || is_core_idle(env->dst_cpu);
@@ -13002,6 +13009,7 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
 		sds->total_capacity += sgs->group_capacity;
 
 		sum_util += sgs->group_util;
+		nr_idle_cpus += sgs->idle_cpus;
 		sg = sg->next;
 	} while (sg != env->sd->groups);
 
@@ -13027,7 +13035,7 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
 		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
 	}
 
-	update_idle_cpu_scan(env, sum_util);
+	update_idle_cpu_scan(env, sum_util, nr_idle_cpus > 0);
 }
 
 /**
-- 
2.43.0

 
> And for a latency-sensitive workload, it would be good to consider
> setting a shorter slice to the latency sensistive task would run 1st
> even on a busy CPU
>

Yes, and a short slice task will be pushed to another CPU if it is waiting on the runqueue.
 

thanks,
Chenyu
