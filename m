Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B383DAAAF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462318; cv=none; b=p6/VavFsCY281IhgX91XJZa/cXh6m5nzWbxhP0HlgaXgieJE1mubR7fQa+Fl0+E3xjcxe8X7lJjBnvYFfTDfHzKl5+4OYz84SwpFvfEUJdYa0Nwg7+7eaQtWE+zGf91mG5YLBrmZcC0hcqZIcj5EsJ9LlrhKhavx3fKly1kY32c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462318; c=relaxed/simple;
	bh=nCzJhkvcHxOtfFZkvIuLcGqarVgwSs8ul4gcR9tlWZs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vy5eqriHUAr2o1jRu4PGY3PxD2dA5lWus2kHUh/fbNosax1K7+SR7cxYBRg+m6J3WJqJAtBGKmYiNI2yLVeoT3lUbV2NrmQUq899/MaIeu8iPW2fb42ftutBBGO6j6t/Cqj9N2kBjLdi2PwKKr92H7+Wm3RMWyh3RhqfkNZfYvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFKAA80p; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFKAA80p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788462310; x=1819998310;
  h=date:from:to:cc:subject:message-id;
  bh=nCzJhkvcHxOtfFZkvIuLcGqarVgwSs8ul4gcR9tlWZs=;
  b=oFKAA80pyBCZN7m35+JMb9Cbz6xN1k0uV6VR6GlKUCbwOh9Y7qCRYwd3
   r06AoKY0zOMkVgcXlTPPPiJtYxcvsCDaHxu6CgFbmJ8Vj8VqPXW1SepzW
   ZvIW1MC2HWcAz3nH9DgzDtihKNNAkLsWWUPtzx9XUb5dJCfYSlLw7K44B
   ysJxHtIEXQ35PnnmJXwweYeO8Lp4ZY95qaSmwTzMjWLI9wEazsoFC8pSB
   YAH9gypIVIFS7R8qFfqzevG2Krx5HGpTBEIoTwl5G0jydza82JGvcqAuN
   NPvQXIRIDpXW6fTSIjaTtz1qmiuOYzjv668Y8cVdpya1dPZQNVu8kEKUM
   Q==;
X-CSE-ConnectionGUID: CFL7IjzmSii7bPNQ6bRaew==
X-CSE-MsgGUID: rElSVnndQVWL0i/SAF1KkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88978068"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88978068"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 12:05:07 -0700
X-CSE-ConnectionGUID: QjS5V4oQQqiLEzOjJxDlKw==
X-CSE-MsgGUID: whpNM5IXTG63P/ZmPG722A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="263622423"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Sep 2026 12:05:04 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2CkA-000000005H8-09Wq;
	Thu, 03 Sep 2026 19:05:02 +0000
Date: Fri, 04 Sep 2026 03:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202609040234.7zfFgTWS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   940de590b839f71d6dc846160534bf202401b8b7
commit: bb70e4fb626b70895b7917ee97c256f24d019c34 sched_ext: Eject the top rescue consumer on overload
date:   4 weeks ago
config: sparc-randconfig-r131-20260826 (https://download.01.org/0day-ci/archive/20260904/202609040234.7zfFgTWS-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260904/202609040234.7zfFgTWS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bb70e4fb626b ("sched_ext: Eject the top rescue consumer on overload")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609040234.7zfFgTWS-lkp@intel.com/

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
