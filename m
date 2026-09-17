Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBB24848B1
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671055; cv=none; b=m5IFAjVm9b5NjCtzDMkJXD4mEUHK/xqddy1Uf+4lLy1DO/bHbfrV+EkSBdHHX+FQmwsjpJZEUec7z0h544X3rNU7Ob5uJMc/x6eiyYWX1GlCnsNZszG9Krqn6Pz8yLAZ6gMonM9smqKHKTsSShn+kuxKxTJFgVEikjs25qcF5zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671055; c=relaxed/simple;
	bh=tcnM7Zij8zPswf2puRpPE2is3PVN8B+kToNLGsHwEGE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TfpvmbstJqt9LLsICllIJ5NCpnDtc2mFNSsqOG6+J0NICcoYiX5Nyv4I2BBm7YxQUV1w/F5UDoqT/sqLtwArDYRIP2dr9NMx8VItJ3NjAno7f5sLrShi5WwXePdoWh7JXRJw9awWQwygkbOkQ78Xs1SBJptirtiuNV467zgjjMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSEiK/F3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSEiK/F3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789671052; x=1821207052;
  h=date:from:to:cc:subject:message-id;
  bh=tcnM7Zij8zPswf2puRpPE2is3PVN8B+kToNLGsHwEGE=;
  b=ZSEiK/F3atTf0JVgUqCfAoaCKeCeiVNk5u7HvzK00UZrvb9OalxJcPvd
   Y1UvgobPg2tOlS9d8/tfkVwE+Hp2wZJRnO3OyBiyhb1mztUdNBezg1l+N
   axckJxTX0dsQsyLmqSHd5jYqx99D3zEYTkxCgUFM4NxvCzGLIg6Lam7Hf
   wP1WOs0odLKtlpKRE//nIQZBvo1zJe2MtpLBRnFYKp4F5VbXnMSsztjlY
   BOoEZkMssMfR740vZfS2td4mU4Ki7ES31cdA9JzFj5x16kklFeVuAACuh
   S/0ZlhS/TN3W4rdS4kzR15ixUGN1GavXYhR96yK+0Dk8pd7BIFc79VRq6
   A==;
X-CSE-ConnectionGUID: nPrnvJgMRf6cIhllxpnoyQ==
X-CSE-MsgGUID: XizuT6fYRqqRuQrkJjiOBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90260525"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90260525"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 11:50:51 -0700
X-CSE-ConnectionGUID: nlmC/WZTQNaHEt+hNsw7EQ==
X-CSE-MsgGUID: c94Dbl97SFmItl6agyodSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271310446"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Sep 2026 11:50:49 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7HC3-000000008PB-0aeX;
	Thu, 17 Sep 2026 18:50:47 +0000
Date: Fri, 18 Sep 2026 02:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/idle.c:511:45: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202609180239.7Jr6Miwi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: ca3aec453d64d2ad89156c10a2e1b15a93b9fe50 sched_ext: Route ops.update_idle() to sub-schedulers and re-notify owed scheds
date:   9 weeks ago
config: x86_64-randconfig-1300-20260917 (https://download.01.org/0day-ci/archive/20260918/202609180239.7Jr6Miwi-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180239.7Jr6Miwi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ca3aec453d64 ("sched_ext: Route ops.update_idle() to sub-schedulers and re-notify owed scheds")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180239.7Jr6Miwi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/idle.c:511:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/idle.c:511:45: sparse:     expected struct task_struct const *p
   kernel/sched/idle.c:511:45: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:2325:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2325:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2325:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:976:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:976:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:976:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1498:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1498:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1498:31: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1826:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1826:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1826:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1517:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1517:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1517:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1518:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1518:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1518:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1579:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1579:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1579:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1605:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1605:35: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1605:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1627:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1627:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1627:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1652:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1652:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1652:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2002:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2002:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2002:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2025:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2025:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2025:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2376:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2376:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2376:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2378:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2378:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2378:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2378:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2378:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2378:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/cpudeadline.c:255:24: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/cpudeadline.c:255:24: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/cpudeadline.c:255:24: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:3151:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:3151:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:3151:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3161:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3161:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:3161:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3267:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3267:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:3267:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2744:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2744:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2744:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2754:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2754:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2754:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1188:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1188:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1188:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1188:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1188:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1188:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1286:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1286:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1286:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1815:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1815:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1815:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1815:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1815:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1815:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2130:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2130:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2130:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2973:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2973:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2973:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2618:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2618:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2618:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2619:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2619:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2619:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2693:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2693:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2693:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2713:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2713:35: sparse:     expected struct task_struct *p

vim +511 kernel/sched/idle.c

   503	
   504	struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
   505	{
   506		/*
   507		 * Notify scx only on an idle-to-idle re-pick (the cpu was already idle).
   508		 * A real task->idle transition is delivered by set_next_task_idle(), so
   509		 * calling here too would duplicate it.
   510		 */
 > 511		if (scx_enabled() && is_idle_task(rq->curr))
   512			scx_update_idle(rq, true, false);
   513		return rq->idle;
   514	}
   515	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
