Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8483CCFCC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818433; cv=none; b=CZS6ruLjWioWcZxeRXU59+qkrS09axi5bDWzYSohUags4PxHHaB6M2PHg+jWrI/QavQRzUiq5Sbk0ShBe0due8C8QITUziRDeS5yvjRfBbZLKkyV2OQoMRQK2xF4PgVrwBaUj5AnpEwLkdp5KTfWI4nrG+xEEhBX14F1ZAkNLNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818433; c=relaxed/simple;
	bh=Y0vWQDvw9cTf1pgmU/S1Arhb5teh3B4TVpAsqAd+oqE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KgDKq+ym3m40b5Mjz/mnQWjeFf3JMsuG+qgBbRBud758fCr02ycWd6POZCsLMUbydQVDLCVUoP0DUBQMdTtpKUm1FtTSi6oiDizG8PTGqR5oVxl5o0wtD/qNixwr+UU/PdGDK5v8T3zOWRCb7nYujLzEOIZP/ZQGUari8hLaFNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wuo6eYvm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wuo6eYvm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787818423; x=1819354423;
  h=date:from:to:cc:subject:message-id;
  bh=Y0vWQDvw9cTf1pgmU/S1Arhb5teh3B4TVpAsqAd+oqE=;
  b=Wuo6eYvmjMHbr+jgOp3VdMGnQ2nUmdjnZ6Tanl3zishWBIYHrmEvR4RT
   4ZBnOpYn4sDyOysYWSJiFCmRlWs7KdvqHQ2tSznnb9hQMR/I8iJW0hshu
   ndwmO1cp4tnprJ2GEsgsP/rmIaO7j2/az8p7It6NgJX49P0h5cGmZAeYF
   TbdkRhzbAqgKwdQ4Kq31eFWKHf3Vh0pRTorD8s7wpVPouL6luGqRND/H8
   7UTkRuyyMMvmGlWY+B923nm88vFu5fzO95r6il5axOZBVOVxsMkHvvIeP
   1J90ojcQgZScyvs4IB9TNhgkGchPsanc8JX0IL60K9DKqkzILf+lTOrRi
   A==;
X-CSE-ConnectionGUID: YhvV3w+USe27PY1BK/6w4g==
X-CSE-MsgGUID: vfTvLnNbTHmNa6pBV2Ysog==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88191042"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88191042"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 01:13:39 -0700
X-CSE-ConnectionGUID: LTDY7pdpRHaShInw8PoqZQ==
X-CSE-MsgGUID: 2VMOuofmS0+4RYbTBAoPmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="269753356"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Aug 2026 01:13:37 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzVEt-0000000099P-0MHP;
	Thu, 27 Aug 2026 08:13:35 +0000
Date: Thu, 27 Aug 2026 16:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202608271621.Yk8t2Aal-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
commit: bb70e4fb626b70895b7917ee97c256f24d019c34 sched_ext: Eject the top rescue consumer on overload
date:   3 weeks ago
config: sparc-randconfig-r131-20260826 (https://download.01.org/0day-ci/archive/20260827/202608271621.Yk8t2Aal-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608271621.Yk8t2Aal-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bb70e4fb626b ("sched_ext: Eject the top rescue consumer on overload")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608271621.Yk8t2Aal-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/deadline.c:3314:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:3314:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:3314:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3316:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:3316:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:3316:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3578:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3578:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3578:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3631:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/ext.c:391:46: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:1423:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:1613:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:1613:48: sparse:    struct task_struct *
   kernel/sched/ext/ext.c:1613:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:2370:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:2384:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:3302:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:4381:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:4382:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:6821:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:6822:51: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:8357:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:8391:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:9776:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10275:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:10275:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:10275:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1418:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1313:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct *
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2481:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2481:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1442:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1442:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1442:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2339:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2339:15: sparse:    struct task_struct *
   kernel/sched/deadline.c:2339:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2481:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2481:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2481:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1442:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1442:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1442:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1343:11: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1676:15: sparse: sparse: dereference of noderef expression

vim +288 kernel/sched/ext/sub.c

   263	
   264	/**
   265	 * scx_rescue_charge - Charge the rescuee's runtime
   266	 * @rq: rq the rescuee is running on
   267	 * @delta_exec: runtime being charged
   268	 *
   269	 * Also ends the rescue once the admitted slice has been served in full. Ending
   270	 * on served time rather than slice exhaustion bounds both the rescue and the
   271	 * charging when a scheduler extends the rescuee's slice.
   272	 */
   273	void scx_rescue_charge(struct rq *rq, s64 delta_exec)
   274	{
   275		struct scx_sched_pcpu *pcpu;
   276	
   277		lockdep_assert_rq_held(rq);
   278	
   279		/*
   280		 * A rescue slice is bounded by one quantum and tick-driven expiry can
   281		 * overshoot by up to a tick. Clamp to avoid wild over-charges on VMs.
   282		 */
   283		delta_exec = min_t(s64, delta_exec, scx_rescue_quantum_ns + TICK_NSEC);
   284	
   285		rq->scx.rescue.budget -= delta_exec;
   286	
   287		/* per-cpu usage average feeds the overload victim pick */
 > 288		pcpu = per_cpu_ptr(scx_task_sched(rq->curr)->pcpu, cpu_of(rq));
   289		pcpu->rescue_avg = scx_rescue_decay_avg(pcpu) + delta_exec;
   290	
   291		if (!scx_rescue_slice_remaining(rq))
   292			scx_task_slice_ended(rq, rq->scx.rescue.curr);
   293	}
   294	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
