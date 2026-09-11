Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1185130EF92
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789159573; cv=none; b=DFAOZzg6biY7RqO21DXtL/jw+PSYPgl4kzD4s4ovw9QRNPRfV65Mj3gtZdNMJw4Ny+RY/irMHtZgcQgRv9ZYMKfGF2BrzHwQ6+dIl7jQwi1SNgN0BuFnfBjGf575NpLNGZ2yNMINyFIBS7SxWW509FjAKRGGk278ykWkQ6+Uduw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789159573; c=relaxed/simple;
	bh=TT31i/fvUvTxHsWhpTQxj3jthDXVh6uvrE98k1zovWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IEILBZZzc3g8WN8qJ5g43ngRPdrucLW91A45JR8TK1L8SrmlLGt4k0Jd8MlrgKKcTllqcxQmAtsJ8Vq6x7q9GyWV7xdBvm5XT+RVKML1dxTBcHS2Qzq5ZjSxZbZF3PquxhXwdO3k+rCbTOWV9+UzFd7gD8iGSW3P6+aNyUPqZVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYvmOzL3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYvmOzL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789159571; x=1820695571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TT31i/fvUvTxHsWhpTQxj3jthDXVh6uvrE98k1zovWs=;
  b=hYvmOzL3+qM3hRuSKCxr6RTJ+g/wt8JAGtxHzB9l10aF4efdBRkmXp/z
   BwuVEFZma0IpO1RHWJu1Bpf6u6qZRRWY1ez4ptcEoenK4YhIyIIyBvY3H
   kE6rieIVaX9puN70rudcABEMr8HVFS5CHedPKEeBmBHGs2iRNm9mCY6Oc
   dfDnsd0tCM/oWBpbC8+KkjkyqYACI8KMaJGJ3LAq5Z2inhxtmk49stx/H
   i9m+B+5ZBqOdmSMgE5VYTnojS8RZEmoYxhxl1PWGKfRrbM8c4r2L8myYS
   HdxbE0blTWiZl28AKiHAy4cVI4ISZIaLWjuEONggBJj/5ZihCEsmAxVgh
   Q==;
X-CSE-ConnectionGUID: voniGWSmRBWN889taJ+gOA==
X-CSE-MsgGUID: dA0IKub3QWCRqPv2AJmuKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="88767537"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="88767537"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:46:10 -0700
X-CSE-ConnectionGUID: QGr2N0ITQXydgeip/Nh1/A==
X-CSE-MsgGUID: cdp0ojVbTHObEi/ZhFv5nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="295510660"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Sep 2026 13:46:05 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x588I-0000000029J-1mH8;
	Fri, 11 Sep 2026 20:46:02 +0000
Date: Sat, 12 Sep 2026 04:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>, akpm@linux-foundation.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, feng.tang@linux.alibaba.com, pmladek@suse.com,
	kprateek.nayak@amd.com, atomlin@atomlin.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/debug, sys_info: Introduce SYS_INFO_CPU_RUNQUEUES
Message-ID: <202609120421.J3jtss6v-lkp@intel.com>
References: <20260911022844.521413-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911022844.521413-1-atomlin@atomlin.com>

Hi Aaron,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on tip/sched/core akpm-mm/mm-nonmm-unstable linus/master v7.3-rc2 next-20260909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/sched-debug-sys_info-Introduce-SYS_INFO_CPU_RUNQUEUES/20260910-222844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260911022844.521413-1-atomlin%40atomlin.com
patch subject: [PATCH] sched/debug, sys_info: Introduce SYS_INFO_CPU_RUNQUEUES
config: microblaze-randconfig-r132-20260911 (https://download.01.org/0day-ci/archive/20260912/202609120421.J3jtss6v-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120421.J3jtss6v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609120421.J3jtss6v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/debug.c:868:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/debug.c:868:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/debug.c:868:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/debug.c:1220:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:1220:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:1220:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/debug.c:1220:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:1220:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:1220:9: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/debug.c:1355:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:1355:30: sparse:     expected struct task_struct *curr
   kernel/sched/debug.c:1355:30: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/debug.c:1360:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/debug.c:1360:30: sparse:     expected struct task_struct *curr
   kernel/sched/debug.c:1360:30: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/topology.c:118:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:118:56: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:118:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:137:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:137:60: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:137:60: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:160:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:160:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:160:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:470:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct perf_domain *pd @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:470:19: sparse:     expected struct perf_domain *pd
   kernel/sched/topology.c:470:19: sparse:     got struct perf_domain [noderef] __rcu *pd
   kernel/sched/topology.c:654:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:654:49: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:654:49: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:753:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:753:50: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:753:50: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:775:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:775:55: sparse:     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child
   kernel/sched/topology.c:775:55: sparse:     got struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:788:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:788:29: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:788:29: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:793:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:793:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:793:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:826:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:826:13: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:826:13: sparse:     got struct sched_domain [noderef] __rcu *sd
   kernel/sched/topology.c:1069:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sdp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1069:38: sparse:     expected struct sched_domain *sdp
   kernel/sched/topology.c:1069:38: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1076:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sdp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1076:21: sparse:     expected struct sched_domain *sdp
   kernel/sched/topology.c:1076:21: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1223:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1223:70: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1223:70: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1252:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1252:59: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1252:59: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1298:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1298:57: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1298:57: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1300:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1300:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1300:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1308:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1308:55: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1308:55: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1310:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1310:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1310:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1380:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1380:62: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1380:62: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1484:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1484:40: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:1484:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1620:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1620:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:1620:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1877:52: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1877:52: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:1877:52: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1987:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1987:43: sparse:     expected struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1987:43: sparse:     got struct sched_domain *child
   kernel/sched/topology.c:2791:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2791:31: sparse:     expected struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2791:31: sparse:     got struct sched_domain *sd
   kernel/sched/topology.c:2919:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent @@
   kernel/sched/topology.c:2919:16: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2919:16: sparse:     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent
   kernel/sched/topology.c:2921:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2921:24: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2921:24: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2926:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2926:16: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2926:16: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2931:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2931:24: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2931:24: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:3008:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd_asym @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:3008:25: sparse:     expected struct sched_domain *[assigned] sd_asym
   kernel/sched/topology.c:3008:25: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:3143:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:3143:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:3143:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:3165:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:3165:28: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:3165:28: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:3191:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:3191:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:3191:57: sparse:     got struct sched_domain [noderef] __rcu *parent

vim +1355 kernel/sched/debug.c

  1212	
  1213	#define PN(x) \
  1214		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rq->x))
  1215	
  1216		P(nr_running);
  1217		P(nr_switches);
  1218		P(nr_uninterruptible);
  1219		PN(next_balance);
> 1220		SEQ_printf(m, "  .%-30s: %ld\n", "curr->pid", (long)(task_pid_nr(rq->curr)));
  1221		PN(clock);
  1222		PN(clock_task);
  1223	#undef P
  1224	#undef PN
  1225	
  1226	#define P64(n) SEQ_printf(m, "  .%-30s: %Ld\n", #n, rq->n);
  1227		P64(avg_idle);
  1228		P64(max_idle_balance_cost);
  1229	#undef P64
  1230	
  1231	#define P(n) SEQ_printf(m, "  .%-30s: %d\n", #n, schedstat_val(rq->n));
  1232		if (schedstat_enabled()) {
  1233			P(yld_count);
  1234			P(sched_count);
  1235			P(sched_goidle);
  1236			P(ttwu_count);
  1237			P(ttwu_local);
  1238		}
  1239	#undef P
  1240	
  1241		print_cfs_stats(m, cpu);
  1242		print_rt_stats(m, cpu);
  1243		print_dl_stats(m, cpu);
  1244	
  1245		print_rq(m, rq, cpu, true, false);
  1246		SEQ_printf(m, "\n");
  1247	}
  1248	
  1249	static const char *sched_tunable_scaling_names[] = {
  1250		"none",
  1251		"logarithmic",
  1252		"linear"
  1253	};
  1254	
  1255	static void sched_debug_header(struct seq_file *m)
  1256	{
  1257		u64 ktime, sched_clk, cpu_clk;
  1258		unsigned long flags;
  1259	
  1260		local_irq_save(flags);
  1261		ktime = ktime_to_ns(ktime_get());
  1262		sched_clk = sched_clock();
  1263		cpu_clk = local_clock();
  1264		local_irq_restore(flags);
  1265	
  1266		SEQ_printf(m, "Sched Debug Version: v0.11, %s %.*s\n",
  1267			init_utsname()->release,
  1268			(int)strcspn(init_utsname()->version, " "),
  1269			init_utsname()->version);
  1270	
  1271	#define P(x) \
  1272		SEQ_printf(m, "%-40s: %Ld\n", #x, (long long)(x))
  1273	#define PN(x) \
  1274		SEQ_printf(m, "%-40s: %Ld.%06ld\n", #x, SPLIT_NS(x))
  1275		PN(ktime);
  1276		PN(sched_clk);
  1277		PN(cpu_clk);
  1278		P(jiffies);
  1279	#ifdef CONFIG_HAVE_UNSTABLE_SCHED_CLOCK
  1280		P(sched_clock_stable());
  1281	#endif
  1282	#undef PN
  1283	#undef P
  1284	
  1285		SEQ_printf(m, "\n");
  1286		SEQ_printf(m, "sysctl_sched\n");
  1287	
  1288	#define P(x) \
  1289		SEQ_printf(m, "  .%-40s: %Ld\n", #x, (long long)(x))
  1290	#define PN(x) \
  1291		SEQ_printf(m, "  .%-40s: %Ld.%06ld\n", #x, SPLIT_NS(x))
  1292		PN(sysctl_sched_base_slice);
  1293		P(sysctl_sched_features);
  1294	#undef PN
  1295	#undef P
  1296	
  1297		SEQ_printf(m, "  .%-40s: %d (%s)\n",
  1298			"sysctl_sched_tunable_scaling",
  1299			sysctl_sched_tunable_scaling,
  1300			sched_tunable_scaling_names[sysctl_sched_tunable_scaling]);
  1301		SEQ_printf(m, "\n");
  1302	}
  1303	
  1304	static int sched_debug_show(struct seq_file *m, void *v)
  1305	{
  1306		int cpu = (unsigned long)(v - 2);
  1307	
  1308		if (cpu != -1)
  1309			print_cpu(m, cpu);
  1310		else
  1311			sched_debug_header(m);
  1312	
  1313		return 0;
  1314	}
  1315	
  1316	void sysrq_sched_debug_show(void)
  1317	{
  1318		int cpu;
  1319	
  1320		sched_debug_header(NULL);
  1321		for_each_online_cpu(cpu) {
  1322			/*
  1323			 * Need to reset softlockup watchdogs on all CPUs, because
  1324			 * another CPU might be blocked waiting for us to process
  1325			 * an IPI or stop_machine.
  1326			 */
  1327			touch_nmi_watchdog();
  1328			touch_all_softlockup_watchdogs();
  1329			print_cpu(NULL, cpu);
  1330		}
  1331	}
  1332	
  1333	void sched_show_runqueues(void)
  1334	{
  1335		int cpu;
  1336	
  1337		pr_info("CPU Runqueues:\n");
  1338		for_each_online_cpu(cpu) {
  1339			struct rq *rq = cpu_rq(cpu);
  1340			struct task_struct *curr;
  1341			unsigned int nr_running;
  1342			u64 nr_switches;
  1343			unsigned long flags;
  1344			bool locked;
  1345	
  1346			touch_nmi_watchdog();
  1347			touch_all_softlockup_watchdogs();
  1348	
  1349			rcu_read_lock();
  1350			local_irq_save(flags);
  1351			locked = raw_spin_rq_trylock(rq);
  1352			if (locked) {
  1353				nr_running = rq->nr_running;
  1354				nr_switches = rq->nr_switches;
> 1355				curr = rq->curr;
  1356				raw_spin_rq_unlock(rq);
  1357			} else {
  1358				nr_running = READ_ONCE(rq->nr_running);
  1359				nr_switches = READ_ONCE(rq->nr_switches);
> 1360				curr = READ_ONCE(rq->curr);
  1361			}
  1362			local_irq_restore(flags);
  1363	
  1364			pr_info("cpu#%d: nr_running:%u switches:%llu curr:%s[%d]%s\n",
  1365				cpu, nr_running, nr_switches,
  1366				curr ? curr->comm : "<none>",
  1367				curr ? task_pid_nr(curr) : -1,
  1368				locked ? "" : " (contended)");
  1369	
  1370			print_rq(NULL, rq, cpu, false, true);
  1371			rcu_read_unlock();
  1372		}
  1373	}
  1374	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
