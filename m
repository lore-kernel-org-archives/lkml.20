Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F3F362137
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790627360; cv=none; b=c4ikPiub33YMDvNfXtGrLJSIaW0WMxPR1hh+w2gREimfSeMalzb9mW+rcSIJHvOG9FXGMOlzMRE4hQ61/anzASr7oi6mg40vwcknUDISmCPyZutY6OqbeFdpyV2Im8lbmcg3wnJBhzz2OqoyZFRiDUmcsjF011nLyKxXcuR1fEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790627360; c=relaxed/simple;
	bh=qVNfrE+NoGLrijNdhlMDOJ2YaWh2WaQMZoXGZekNrD4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CC3WDOur5RpkiTpqy6hR/EcBKlyfIkFe7ilCLy5/XcZ8AbYKHr8iCCY4zXnu2JY2X9XQ2HEBnqhkBf/AvqrS0j3GeGLuOykt69wLclMx5dpegyD118pV7bYrSqKAgXIGBk6yEEny+n//VYSH/K9A8tv14e+imlvlHHKSHNB03KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+vqjXQv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+vqjXQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790627359; x=1822163359;
  h=date:from:to:cc:subject:message-id;
  bh=qVNfrE+NoGLrijNdhlMDOJ2YaWh2WaQMZoXGZekNrD4=;
  b=K+vqjXQvkkwTjAe9Dfr/OyLwsR8VHuhoP7GD1IUKP0TAti48ZefTWqrX
   hjQuiBAEKw9vXk2PB3iQHM/ssSbAa2/LvA3jK4wyXl0Nkp6Dz3eVQ0WJL
   Re2vysBR4RlJ0+3DGEFYIwFmVh6BgD5ilRhctwRqkQATpjU0VvnKvyneG
   WnosynH2mMVaAyWSRtM6HFoktn7tUb82xSEmn8TOfYoeXCjMn/XqbERqn
   /pjiEQl/RydPf6Z8q+lTNMZJUB8p+AJWIY5JQOkjrir3AyW3iwaSOKbSO
   juX37w+TuwdMsMQqeHovUwLLwm6HzDNvDMI1wVKgnaqpkx0zru8/snl+r
   w==;
X-CSE-ConnectionGUID: Z4IriZmRSd2KSl2Rvv7mAQ==
X-CSE-MsgGUID: /M313OYWSO+foiehKlLX1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="107718984"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="107718984"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 13:29:18 -0700
X-CSE-ConnectionGUID: nDMu+CS2QtmO0SBcQIx5Xw==
X-CSE-MsgGUID: wvSv4M64Sn27PAIYmz69aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="313071632"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Sep 2026 13:29:17 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBHyM-0000000017v-0Ksa;
	Mon, 28 Sep 2026 20:29:14 +0000
Date: Mon, 28 Sep 2026 22:28:48 +0200
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202609282245.GrTRG62D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
commit: bb70e4fb626b70895b7917ee97c256f24d019c34 sched_ext: Eject the top rescue consumer on overload
date:   8 weeks ago
config: arm-randconfig-r2305-20260928 (https://download.01.org/0day-ci/archive/20260928/202609282245.GrTRG62D-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7615da10b75c57286a4032eac8bb43c1b8d2ba46)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609282245.GrTRG62D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bb70e4fb626b ("sched_ext: Eject the top rescue consumer on overload")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609282245.GrTRG62D-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   kernel/sched/ext/ext.c:8745:18: sparse: sparse: symbol 'scx_bpf_dsq_insert___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:8767:18: sparse: sparse: symbol 'scx_bpf_dsq_insert' was not declared. Should it be static?
   kernel/sched/ext/ext.c:8825:1: sparse: sparse: symbol '__scx_bpf_dsq_insert_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:8844:18: sparse: sparse: symbol 'scx_bpf_dsq_insert_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:8989:17: sparse: sparse: symbol 'scx_bpf_dispatch_nr_slots' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9009:18: sparse: sparse: symbol 'scx_bpf_dispatch_cancel' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9053:18: sparse: sparse: symbol 'scx_bpf_dsq_move_to_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9096:18: sparse: sparse: symbol 'scx_bpf_dsq_move_to_local' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9110:18: sparse: sparse: symbol 'scx_bpf_dsq_move_set_slice' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9129:18: sparse: sparse: symbol 'scx_bpf_dsq_move_set_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9163:18: sparse: sparse: symbol 'scx_bpf_dsq_move' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9188:18: sparse: sparse: symbol 'scx_bpf_dsq_move_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9229:17: sparse: sparse: symbol 'scx_bpf_reenqueue_local' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9268:17: sparse: sparse: symbol 'scx_bpf_create_dsq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9355:18: sparse: sparse: symbol 'scx_bpf_task_set_slice' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9409:18: sparse: sparse: symbol 'scx_bpf_task_set_dsq_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9500:18: sparse: sparse: symbol 'scx_bpf_kick_cpu' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9522:18: sparse: sparse: symbol 'scx_bpf_kick_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9545:17: sparse: sparse: symbol 'scx_bpf_dsq_nr_queued' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9592:18: sparse: sparse: symbol 'scx_bpf_destroy_dsq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9613:17: sparse: sparse: symbol 'bpf_iter_scx_dsq_new' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9654:32: sparse: sparse: symbol 'bpf_iter_scx_dsq_next' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9672:18: sparse: sparse: symbol 'bpf_iter_scx_dsq_destroy' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9701:32: sparse: sparse: symbol 'scx_bpf_dsq_peek' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9740:18: sparse: sparse: symbol 'scx_bpf_dsq_reenq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9776:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9869:18: sparse: sparse: symbol 'scx_bpf_exit_bstr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9894:18: sparse: sparse: symbol 'scx_bpf_error_bstr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9921:18: sparse: sparse: symbol 'scx_bpf_dump_bstr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9976:17: sparse: sparse: symbol 'scx_bpf_cpuperf_cap' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9996:17: sparse: sparse: symbol 'scx_bpf_cidperf_cap' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10027:17: sparse: sparse: symbol 'scx_bpf_cpuperf_cur' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10047:17: sparse: sparse: symbol 'scx_bpf_cidperf_cur' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10134:18: sparse: sparse: symbol 'scx_bpf_cpuperf_set' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10158:17: sparse: sparse: symbol 'scx_bpf_cidperf_set' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10181:17: sparse: sparse: symbol 'scx_bpf_nr_node_ids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10191:17: sparse: sparse: symbol 'scx_bpf_nr_cpu_ids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10201:17: sparse: sparse: symbol 'scx_bpf_nr_cids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10215:17: sparse: sparse: symbol 'scx_bpf_nr_online_cids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10227:17: sparse: sparse: symbol 'scx_bpf_this_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10242:34: sparse: sparse: symbol 'scx_bpf_get_possible_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10250:34: sparse: sparse: symbol 'scx_bpf_get_online_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10259:18: sparse: sparse: symbol 'scx_bpf_put_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10275:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:10275:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:10275:33: sparse:    struct task_struct const *
   kernel/sched/ext/ext.c:10282:17: sparse: sparse: symbol 'scx_bpf_task_cpu' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10295:17: sparse: sparse: symbol 'scx_bpf_task_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10315:23: sparse: sparse: symbol 'scx_bpf_locked_rq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10342:32: sparse: sparse: symbol 'scx_bpf_cpu_curr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10366:32: sparse: sparse: symbol 'scx_bpf_cid_curr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10391:32: sparse: sparse: symbol 'scx_bpf_tid_to_task' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10459:17: sparse: sparse: symbol 'scx_bpf_now' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10490:18: sparse: sparse: symbol 'scx_bpf_events' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10527:27: sparse: sparse: symbol 'scx_bpf_task_cgroup' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/cid.c:467:18: sparse: sparse: symbol 'scx_bpf_cid_override' was not declared. Should it be static?
   kernel/sched/ext/cid.c:624:17: sparse: sparse: symbol 'scx_bpf_cid_to_cpu' was not declared. Should it be static?
   kernel/sched/ext/cid.c:646:17: sparse: sparse: symbol 'scx_bpf_cpu_to_cid' was not declared. Should it be static?
   kernel/sched/ext/cid.c:916:18: sparse: sparse: symbol 'scx_bpf_cid_topo' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/idle.c:1027:17: sparse: sparse: symbol 'scx_bpf_cpu_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1055:17: sparse: sparse: symbol 'scx_bpf_select_cpu_dfl' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1110:1: sparse: sparse: symbol '__scx_bpf_select_cpu_and' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1129:17: sparse: sparse: symbol 'scx_bpf_select_cpu_and' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1165:34: sparse: sparse: symbol 'scx_bpf_get_idle_cpumask_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1191:34: sparse: sparse: symbol 'scx_bpf_get_idle_cpumask' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1223:34: sparse: sparse: symbol 'scx_bpf_get_idle_smtmask_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1253:34: sparse: sparse: symbol 'scx_bpf_get_idle_smtmask' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1282:18: sparse: sparse: symbol 'scx_bpf_put_idle_cpumask' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1303:18: sparse: sparse: symbol 'scx_bpf_test_and_clear_cpu_idle' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1342:17: sparse: sparse: symbol 'scx_bpf_pick_idle_cpu_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1384:17: sparse: sparse: symbol 'scx_bpf_pick_idle_cpu' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1428:17: sparse: sparse: symbol 'scx_bpf_pick_any_cpu_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1477:17: sparse: sparse: symbol 'scx_bpf_pick_any_cpu' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/sub.c:2309:17: sparse: sparse: symbol 'scx_bpf_sub_grant' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2430:18: sparse: sparse: symbol 'scx_bpf_sub_revoke' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2524:17: sparse: sparse: symbol 'scx_bpf_sub_caps' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2614:17: sparse: sparse: symbol 'scx_bpf_sub_kill_bstr' was not declared. Should it be static?
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
