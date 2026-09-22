Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CD153A3A8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075999; cv=none; b=T4s9R0vP/dXb9EqLn6yJAxd+/QYcEBXafDZd9wNu564QrtWTYWO+CQeWZKNmEb/3qfzYQKz3BMTp+gS+Dur9Th0U18UKWorJ5GvBQggzabgf8gUVGBsl3UADCOYak+7Qdubf45EqVSj2wqecto79aITm7RVcWcM979XCJT99S5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075999; c=relaxed/simple;
	bh=PSbL/FDW3IFE5eZb+fBXsQIWeftKGZU2aioR1BGbDw4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l9u+JaHM+q7aY7rq5soWGhW66giFS3pFckgYv8wpxxEeaSpR7jogH1uSl/6HnxiQbBIzwtuIFscoZbpSQ3Yr2f/X/TuMYjsGwM3bLVUDCkj1kR2biW2+uiK4q9B2T4SLdMBf3sH3N5crEkEZIvYINuIQaNp5bVqubm+9gA3xTiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXbAzTkX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXbAzTkX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790075994; x=1821611994;
  h=date:from:to:cc:subject:message-id;
  bh=PSbL/FDW3IFE5eZb+fBXsQIWeftKGZU2aioR1BGbDw4=;
  b=LXbAzTkXYiBnAIAL6Pal6idce1JAnk+Lk0F5ybLQP/WE99EyXSTbdMI6
   SxKpZNOr00KyhmIQU/G88Of2kMyoS+elyHTdCLFXLeberyv461Wj0Vz8X
   LSHud7/PUqtUPYUE4Tx3jEkxZx1NrKHebpofQ92svZDybcKpvq0k6q1o7
   /AEC8FmzRTOFV6JcXfUWdc9Vz91lAGdd1j+b7QnTzGjm0x6L/FHLHCf+O
   gsMoQyhEofWLdq19lzgWj8ekMOmhQVQLHelVqqIgWi2Nx8h++SFTvZSag
   qAKyo9tEjq1WFQMJFY6nBARReMA3uAf9LzsppIYxrMbGSavUgFHwzKI6j
   w==;
X-CSE-ConnectionGUID: qZacIDIXReK2cCndYsAchw==
X-CSE-MsgGUID: Nmi274OHREeLS4qk6BgHoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="116191940"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="116191940"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 04:19:44 -0700
X-CSE-ConnectionGUID: mqNmBYrXR7mrKx0tAhjb+w==
X-CSE-MsgGUID: qr+aEa6UTfKzo5Xm7wT/7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="277878344"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2026 04:19:41 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8yXC-00000000FOp-2DrG;
	Tue, 22 Sep 2026 11:19:38 +0000
Date: Tue, 22 Sep 2026 19:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/fair.c:2004:38: sparse: sparse: incorrect type
 in initializer (different address spaces)
Message-ID: <202609221957.fJCjN9uZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 85570f10a4c61372c1d437365b9d8dbad512ec6f sched/eevdf: Move to a single runqueue
date:   3 months ago
config: alpha-randconfig-r1302-20260922 (https://download.01.org/0day-ci/archive/20260922/202609221957.fJCjN9uZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221957.fJCjN9uZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221957.fJCjN9uZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1335:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1335:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1335:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1945:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1945:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1945:33: sparse:     got struct sched_entity [noderef] __rcu *
>> kernel/sched/fair.c:2004:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:2004:38: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:2004:38: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:14433:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:14433:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:14433:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6960:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:6960:44: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:6960:44: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:7018:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:7018:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:7018:22: sparse:    struct task_struct *
   kernel/sched/fair.c:9440:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9440:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:9440:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9635:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9635:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:9635:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9809:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:9809:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:9809:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9843:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9843:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:9843:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:10045:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:10045:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:10045:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:11385:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:11385:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:11385:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:12151:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:12151:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:12151:22: sparse:    struct task_struct *
   kernel/sched/fair.c:13669:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13669:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13669:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:13300:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13300:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:13300:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:13805:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13805:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13805:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2454:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2454:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2454:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *

vim +2004 kernel/sched/fair.c

  2001	
  2002	static void update_curr_fair(struct rq *rq)
  2003	{
> 2004		struct sched_entity *se = &rq->donor->se;
  2005	
  2006		for_each_sched_entity(se)
  2007			update_curr(cfs_rq_of(se));
  2008	}
  2009	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
