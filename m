Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2D8288C2C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663779; cv=none; b=O2ysP07lR1yT9WlNZji3WRWrgBtiPpkuC1HXQ7Vq402WOE8z/kF+2YaFY5WC4VT2iNUlGvirXKCHOeWzKZx0lIwmMWlpbCvm6gQdwdMlhXOlyew2iVP8fQrNtCwCtf3627Lz1WVZb9m/M+DN3bKzWTFAWibZozIeLdU3XMkEbOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663779; c=relaxed/simple;
	bh=BqxozFaAwAPO2pse7NRsJtPP0Ps2Mi4ecoQqC9QOJM0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XBs2oxvgKy8C3G6KKu7+WmYd2on1X9ocG1JILiXQIznhUzXkgoisDA79RFM/joaPaW07sD9KRSrzwpD6bkFbELaXztOiEczhDmGdCkikbXe3K3YAqStqeUjKFJzLWGrIRvJBte6V08HMHbEh1vFrv6YhML+19LkVmHoGj6VXRLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltk4KeE8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltk4KeE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789663776; x=1821199776;
  h=date:from:to:cc:subject:message-id;
  bh=BqxozFaAwAPO2pse7NRsJtPP0Ps2Mi4ecoQqC9QOJM0=;
  b=ltk4KeE8Tq6JWQZRj4kOFGvYeGQdwgS7qPl+Y/p41QDLTQps18WqtvyT
   ZPjWs1q/k44b9AwKAsx2ovPAybIQcYBEqcPaWNoT+z6pmF2uU72zCLS8q
   kDAG3A4rC6ayxTuz7G7koTQDOG3PzEG2j3mbmHOhnh82CC0zp3dFxgkib
   v+Vp5gCTklKG/evZse9gDKcFBoj9LlAWFYDCkrjXY7oJo+Ley1sp/qYhT
   j0QUyu0SDQP9DF16jT0YYCK1VKjW0Xqcus+FJmuzU/YFOG8r54nDiFBC9
   rvFFR9EL38wRyKgn2YRCtrYZ/OiE987wz0ItdAQbmZG4PFPmkw44bI5Tl
   Q==;
X-CSE-ConnectionGUID: kBO0zBZzTamfBQZ+wiKHaA==
X-CSE-MsgGUID: rhrBYu/KSJCdsOgxfxqBKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101454566"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101454566"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 09:49:36 -0700
X-CSE-ConnectionGUID: xQ8T09NgTJWZYKLjQ3wu/g==
X-CSE-MsgGUID: 6Mu7l0hPRamiWdgm10duPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267671896"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2026 09:49:33 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7FIh-000000008F3-06hk;
	Thu, 17 Sep 2026 16:49:31 +0000
Date: Fri, 18 Sep 2026 00:49:12 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Tim Chen <tim.c.chen@linux.intel.com>
Subject: kernel/sched/topology.c:1037:21: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202609180028.7pOuivmX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: 5beff4f087277901444787d4b7af6b3a93c34c54 sched/cache: Fix cache aware scheduling enabling for multi LLCs system
date:   4 months ago
config: powerpc64-randconfig-r1306-20260917 (https://download.01.org/0day-ci/archive/20260918/202609180028.7pOuivmX-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180028.7pOuivmX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5beff4f08727 ("sched/cache: Fix cache aware scheduling enabling for multi LLCs system")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180028.7pOuivmX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/debug.c:788:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/debug.c:788:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/debug.c:788:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/debug.c:1129:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:1129:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:1129:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/debug.c:1129:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:1129:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:1129:9: sparse:     got struct task_struct [noderef] __rcu *curr
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
   kernel/sched/topology.c:650:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:650:49: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:650:49: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:737:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:737:50: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:737:50: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:752:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:752:55: sparse:     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child
   kernel/sched/topology.c:752:55: sparse:     got struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:765:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:765:29: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:765:29: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:770:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:770:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:770:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:803:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:803:13: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:803:13: sparse:     got struct sched_domain [noderef] __rcu *sd
   kernel/sched/topology.c:1030:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sdp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1030:38: sparse:     expected struct sched_domain *sdp
   kernel/sched/topology.c:1030:38: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/topology.c:1037:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sdp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1037:21: sparse:     expected struct sched_domain *sdp
   kernel/sched/topology.c:1037:21: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1184:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1184:70: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1184:70: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1213:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1213:59: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1213:59: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1259:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1259:57: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1259:57: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1261:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1261:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1261:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1269:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1269:55: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1269:55: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1271:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1271:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1271:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1341:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1341:62: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1341:62: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1445:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1445:40: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:1445:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1583:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1583:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:1583:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1840:52: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1840:52: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:1840:52: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1950:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1950:43: sparse:     expected struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1950:43: sparse:     got struct sched_domain *child
   kernel/sched/topology.c:2749:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2749:31: sparse:     expected struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2749:31: sparse:     got struct sched_domain *sd
   kernel/sched/topology.c:2877:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent @@
   kernel/sched/topology.c:2877:16: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2877:16: sparse:     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent
   kernel/sched/topology.c:2879:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2879:24: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2879:24: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2884:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2884:16: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2884:16: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2889:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2889:24: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2889:24: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:3018:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:3018:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:3018:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:3037:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:3037:28: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:3037:28: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:3067:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:3067:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:3067:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:2401:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2401:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2401:25: sparse:    struct task_struct *

vim +1037 kernel/sched/topology.c

  1010	
  1011	/*
  1012	 * Return true if @sd belongs to an LLC group whose enclosing
  1013	 * partition spans more than one LLC. @sd must be the topmost
  1014	 * SD_SHARE_LLC domain.
  1015	 *
  1016	 * Any duplicated parent domains with the same span as @sd are
  1017	 * skipped: before cpu_attach_domain() degeneration these still
  1018	 * exist, after degeneration the loop is a no-op. This makes the
  1019	 * helper usable both during sched domain build and against an
  1020	 * already-attached domain tree.
  1021	 *
  1022	 * Note: For systems with a single LLC per node, cache-aware
  1023	 * scheduling is still enabled when multiple nodes exist.
  1024	 * However, NUMA balancing decisions take precedence over
  1025	 * cache-aware scheduling. Conversely, if there is only one
  1026	 * LLC per partition, cache-aware scheduling should be disabled.
  1027	 */
  1028	static bool sd_in_multi_llcs(struct sched_domain *sd)
  1029	{
  1030		struct sched_domain *sdp = sd->parent;
  1031	
  1032		/* it does not make sense to aggregate to 1 CPU */
  1033		if (sd->span_weight == 1)
  1034			return false;
  1035	
  1036		while (sdp && sdp->span_weight == sd->span_weight)
> 1037			sdp = sdp->parent;
  1038	
  1039		return !!sdp;
  1040	}
  1041	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
