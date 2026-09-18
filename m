Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BE53CF20A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789698405; cv=none; b=HzpKoPWASjmIwZ+M1H3TRGUbc/T5lC2/2PUqwRj/a7CPvJZjWuNHBcO97XjIXKA88Smq2C1ZG+T1o2z4WwxPIHCF/GpxOniS0TeMTHdAtC0AWKoFKJHeq5N/RCASYSG/filYxLJAIsWiQd7gmUfaF8cpjdOY9W86sDNNAYkcPYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789698405; c=relaxed/simple;
	bh=m+MitJT0bYbQYz92yrN1l6vDM2lP30RzED+pUz2adlM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LxqkuyXSZ6CsDtKzztAXN92ULjn1t0w81RAw3BDGuKtBWGY4+8iVxvimUl7heKcMQpy8YUts/9kS8TeowmwLlReLTSn78tnBjLenBfhVR+K3Of449hiAT9m9b3jl4cgvAA1AQd0EPweU4bT1pItbA6LyUpxjhZA/SHoSdUS2ozU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=THbJkAcS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THbJkAcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789698399; x=1821234399;
  h=date:from:to:cc:subject:message-id;
  bh=m+MitJT0bYbQYz92yrN1l6vDM2lP30RzED+pUz2adlM=;
  b=THbJkAcSr1sbU5XJBE/tkrCL1CBqHxYPuIHLL1MyESV5PvXJ1BEZJTZc
   jWnG9Q0UiW1VxlyqsEGCAnJ2qfBeu7oEi+GLBNOz+AChyU1vxhwde2LDw
   O8auDiy50Gc8SGDKUzsGe6i0qg5VYKSSdYx+aGrT++wwRTAIM2X2Ur7VF
   yXQuc6yS/BewLNqQCrj6Lb9DrM/Ay3vfNvxxiPPKua38wXjyWcdWdrkgS
   0OlkoexAQ0/eIKS8zTO3jeq48nIfNyTyLxH17AM53AYnVpPuM835Hn78C
   1+Qqx714feaa+cvys9Zq9lAy9nkQF3b81qTFw3SCl7kgY36pUEsKptWYB
   g==;
X-CSE-ConnectionGUID: /uCedI8kSyKQ7GXNdhd1rQ==
X-CSE-MsgGUID: VsnJ4Y55Tse5VGEGpuDTJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90040613"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90040613"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 19:26:35 -0700
X-CSE-ConnectionGUID: 2II9iJZcSBKMNCIV3BNS4A==
X-CSE-MsgGUID: Ci83QIH5TsqvjYcJ+KFuBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297616730"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Sep 2026 19:26:33 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7OJ0-0000000096x-09dC;
	Fri, 18 Sep 2026 02:26:26 +0000
Date: Fri, 18 Sep 2026 10:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext/ext.c:1451:38: sparse: sparse: incorrect
 type in initializer (different address spaces)
Message-ID: <202609180902.DfxdJTuY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: bba2c3615bd6cfee7456d1130f2e6b01b3f4e9ba sched_ext: Move sources under kernel/sched/ext/
date:   3 months ago
config: sparc-randconfig-r1302-20260917 (https://download.01.org/0day-ci/archive/20260918/202609180902.DfxdJTuY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180902.DfxdJTuY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bba2c3615bd6 ("sched_ext: Move sources under kernel/sched/ext/")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180902.DfxdJTuY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   kernel/sched/deadline.c:2713:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3312:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:3312:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:3312:38: sparse:     got struct task_struct [noderef] __rcu *curr
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
>> kernel/sched/ext/ext.c:1451:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext/ext.c:1622:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:1622:48: sparse:    struct task_struct *
   kernel/sched/ext/ext.c:1622:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:1771:66: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:1771:66: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:1771:66: sparse:    struct task_struct *
>> kernel/sched/ext/ext.c:2315:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:2315:35: sparse:     expected struct task_struct *p
   kernel/sched/ext/ext.c:2315:35: sparse:     got struct task_struct [noderef] __rcu *donor
>> kernel/sched/ext/ext.c:2326:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:2326:38: sparse:     expected struct task_struct *from
   kernel/sched/ext/ext.c:2326:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext/ext.c:3000:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:3000:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3000:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:3136:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:3136:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3136:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
>> kernel/sched/ext/ext.c:3278:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:3278:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext/ext.c:3278:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:3509:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:3509:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3509:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:3915:62: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext/ext.c:3915:62: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3915:62: sparse:     got struct scx_sched [noderef] __rcu *scx_sched
   kernel/sched/ext/ext.c:4459:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:4459:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:4459:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:4488:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:4488:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:4488:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:4500:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:4500:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:4500:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:4548:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:4548:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:4548:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:4569:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:4569:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:4569:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:4590:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:4590:13: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:4590:13: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:4606:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:4606:13: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:4606:13: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:4623:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:4623:13: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:4623:13: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:5803:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext/ext.c:5803:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext/ext.c:5803:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext/ext.c:5806:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:5806:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext/ext.c:5806:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext/ext.c:5806:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:5806:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext/ext.c:5806:27: sparse:    struct scx_kick_syncs *
>> kernel/sched/ext/ext.c:6626:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext/ext.c:6627:51: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:6784:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext/ext.c:6787:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:6787:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext/ext.c:6787:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext/ext.c:6796:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:6796:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext/ext.c:6796:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext/ext.c:7523:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *parent @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext/ext.c:7839:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext/ext.c:8379:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext/ext.c:9751:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10196:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:10196:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:10196:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/idle.c:748:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext/idle.c:768:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1418:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1313:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct *
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2462:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2462:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1423:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2339:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2339:15: sparse:    struct task_struct *
   kernel/sched/deadline.c:2339:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2462:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2462:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *

vim +1451 kernel/sched/ext/ext.c

7b0888b7cc1924 kernel/sched/ext.c Tejun Heo       2024-06-18  1448  
f0e1a0643a59bf kernel/sched/ext.c Tejun Heo       2024-06-18  1449  static void update_curr_scx(struct rq *rq)
f0e1a0643a59bf kernel/sched/ext.c Tejun Heo       2024-06-18  1450  {
f0e1a0643a59bf kernel/sched/ext.c Tejun Heo       2024-06-18 @1451  	struct task_struct *curr = rq->curr;
7799140b6a1697 kernel/sched/ext.c Tejun Heo       2024-08-06  1452  	s64 delta_exec;
f0e1a0643a59bf kernel/sched/ext.c Tejun Heo       2024-06-18  1453  
7799140b6a1697 kernel/sched/ext.c Tejun Heo       2024-08-06  1454  	delta_exec = update_curr_common(rq);
7799140b6a1697 kernel/sched/ext.c Tejun Heo       2024-08-06  1455  	if (unlikely(delta_exec <= 0))
f0e1a0643a59bf kernel/sched/ext.c Tejun Heo       2024-06-18  1456  		return;
f0e1a0643a59bf kernel/sched/ext.c Tejun Heo       2024-06-18  1457  
7b0888b7cc1924 kernel/sched/ext.c Tejun Heo       2024-06-18  1458  	if (curr->scx.slice != SCX_SLICE_INF) {
7799140b6a1697 kernel/sched/ext.c Tejun Heo       2024-08-06  1459  		curr->scx.slice -= min_t(u64, curr->scx.slice, delta_exec);
7b0888b7cc1924 kernel/sched/ext.c Tejun Heo       2024-06-18  1460  		if (!curr->scx.slice)
7b0888b7cc1924 kernel/sched/ext.c Tejun Heo       2024-06-18  1461  			touch_core_sched(rq, curr);
7b0888b7cc1924 kernel/sched/ext.c Tejun Heo       2024-06-18  1462  	}
cd959a3562050d kernel/sched/ext.c Andrea Righi    2026-01-26  1463  
cd959a3562050d kernel/sched/ext.c Andrea Righi    2026-01-26  1464  	dl_server_update(&rq->ext_server, delta_exec);
f0e1a0643a59bf kernel/sched/ext.c Tejun Heo       2024-06-18  1465  }
f0e1a0643a59bf kernel/sched/ext.c Tejun Heo       2024-06-18  1466  
06e51be3d5e7a0 kernel/sched/ext.c Tejun Heo       2024-06-18  1467  static bool scx_dsq_priq_less(struct rb_node *node_a,
06e51be3d5e7a0 kernel/sched/ext.c Tejun Heo       2024-06-18  1468  			      const struct rb_node *node_b)
06e51be3d5e7a0 kernel/sched/ext.c Tejun Heo       2024-06-18  1469  {
06e51be3d5e7a0 kernel/sched/ext.c Tejun Heo       2024-06-18  1470  	const struct task_struct *a =
d4af01c3731ff9 kernel/sched/ext.c Tejun Heo       2024-07-08  1471  		container_of(node_a, struct task_struct, scx.dsq_priq);
06e51be3d5e7a0 kernel/sched/ext.c Tejun Heo       2024-06-18  1472  	const struct task_struct *b =
d4af01c3731ff9 kernel/sched/ext.c Tejun Heo       2024-07-08  1473  		container_of(node_b, struct task_struct, scx.dsq_priq);
06e51be3d5e7a0 kernel/sched/ext.c Tejun Heo       2024-06-18  1474  
06e51be3d5e7a0 kernel/sched/ext.c Tejun Heo       2024-06-18  1475  	return time_before64(a->scx.dsq_vtime, b->scx.dsq_vtime);
06e51be3d5e7a0 kernel/sched/ext.c Tejun Heo       2024-06-18  1476  }
06e51be3d5e7a0 kernel/sched/ext.c Tejun Heo       2024-06-18  1477  
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1478  static void dsq_inc_nr(struct scx_dispatch_q *dsq, struct task_struct *p, u64 enq_flags)
f0e1a0643a59bf kernel/sched/ext.c Tejun Heo       2024-06-18  1479  {
80a54b807d6c0b kernel/sched/ext.c Tejun Heo       2026-03-07  1480  	/* scx_bpf_dsq_nr_queued() reads ->nr without locking, use WRITE_ONCE() */
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1481  	WRITE_ONCE(dsq->nr, dsq->nr + 1);
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1482  
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1483  	/*
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1484  	 * Once @p reaches a local DSQ, it can only leave it by being dispatched
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1485  	 * to the CPU or dequeued. In both cases, the only way @p can go back to
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1486  	 * the BPF sched is through enqueueing. If being inserted into a local
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1487  	 * DSQ with IMMED, persist the state until the next enqueueing event in
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1488  	 * do_enqueue_task() so that we can maintain IMMED protection through
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1489  	 * e.g. SAVE/RESTORE cycles and slice extensions.
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1490  	 */
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1491  	if (enq_flags & SCX_ENQ_IMMED) {
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1492  		if (unlikely(dsq->id != SCX_DSQ_LOCAL)) {
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1493  			WARN_ON_ONCE(!(enq_flags & SCX_ENQ_GDSQ_FALLBACK));
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1494  			return;
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1495  		}
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1496  		p->scx.flags |= SCX_TASK_IMMED;
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1497  	}
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1498  
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1499  	if (p->scx.flags & SCX_TASK_IMMED) {
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1500  		struct rq *rq = container_of(dsq, struct rq, scx.local_dsq);
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1501  
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1502  		if (WARN_ON_ONCE(dsq->id != SCX_DSQ_LOCAL))
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1503  			return;
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1504  
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1505  		rq->scx.nr_immed++;
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1506  
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1507  		/*
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1508  		 * If @rq already had other tasks or the current task is not
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1509  		 * done yet, @p can't go on the CPU immediately. Re-enqueue.
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1510  		 */
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1511  		if (unlikely(dsq->nr > 1 || !rq_is_open(rq, enq_flags)))
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1512  			schedule_reenq_local(rq, 0);
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1513  	}
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1514  }
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1515  
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1516  static void dsq_dec_nr(struct scx_dispatch_q *dsq, struct task_struct *p)
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1517  {
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1518  	/* see dsq_inc_nr() */
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1519  	WRITE_ONCE(dsq->nr, dsq->nr - 1);
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1520  
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1521  	if (p->scx.flags & SCX_TASK_IMMED) {
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1522  		struct rq *rq = container_of(dsq, struct rq, scx.local_dsq);
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1523  
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1524  		if (WARN_ON_ONCE(dsq->id != SCX_DSQ_LOCAL) ||
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1525  		    WARN_ON_ONCE(rq->scx.nr_immed <= 0))
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1526  			return;
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1527  
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1528  		rq->scx.nr_immed--;
98d709cba3193f kernel/sched/ext.c Tejun Heo       2026-03-13  1529  	}
f0e1a0643a59bf kernel/sched/ext.c Tejun Heo       2024-06-18  1530  }
f0e1a0643a59bf kernel/sched/ext.c Tejun Heo       2024-06-18  1531  
c0008a5632103e kernel/sched/ext.c Tejun Heo       2025-09-23  1532  static void refill_task_slice_dfl(struct scx_sched *sch, struct task_struct *p)
69120f82282977 kernel/sched/ext.c Honglei Wang    2025-04-18  1533  {
e1cccf365ef4b8 kernel/sched/ext.c Tejun Heo       2026-03-06  1534  	p->scx.slice = READ_ONCE(sch->slice_dfl);
c0008a5632103e kernel/sched/ext.c Tejun Heo       2025-09-23  1535  	__scx_add_event(sch, SCX_EV_REFILL_SLICE_DFL, 1);
69120f82282977 kernel/sched/ext.c Honglei Wang    2025-04-18  1536  }
69120f82282977 kernel/sched/ext.c Honglei Wang    2025-04-18  1537  
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1538  /*
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1539   * Return true if @p is moving due to an internal SCX migration, false
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1540   * otherwise.
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1541   */
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1542  static inline bool task_scx_migrating(struct task_struct *p)
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1543  {
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1544  	/*
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1545  	 * We only need to check sticky_cpu: it is set to the destination
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1546  	 * CPU in move_remote_task_to_local_dsq() before deactivate_task()
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1547  	 * and cleared when the task is enqueued on the destination, so it
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1548  	 * is only non-negative during an internal SCX migration.
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1549  	 */
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1550  	return p->scx.sticky_cpu >= 0;
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1551  }
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1552  
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1553  /*
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1554   * Call ops.dequeue() if the task is in BPF custody and not migrating.
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1555   * Clears %SCX_TASK_IN_CUSTODY when the callback is invoked.
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1556   */
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1557  static void call_task_dequeue(struct scx_sched *sch, struct rq *rq,
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1558  			      struct task_struct *p, u64 deq_flags)
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1559  {
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1560  	if (!(p->scx.flags & SCX_TASK_IN_CUSTODY) || task_scx_migrating(p))
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1561  		return;
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1562  
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1563  	if (SCX_HAS_OP(sch, dequeue))
7cd9a5d7d4b758 kernel/sched/ext.c Cheng-Yang Chou 2026-04-10  1564  		SCX_CALL_OP_TASK(sch, dequeue, rq, p, deq_flags);
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1565  
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1566  	p->scx.flags &= ~SCX_TASK_IN_CUSTODY;
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1567  }
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1568  
4e3d7c89e15ac5 kernel/sched/ext.c zhidao su       2026-04-23  1569  static void local_dsq_post_enq(struct scx_sched *sch, struct scx_dispatch_q *dsq,
4e3d7c89e15ac5 kernel/sched/ext.c zhidao su       2026-04-23  1570  			       struct task_struct *p, u64 enq_flags)
530b6637c79e72 kernel/sched/ext.c Tejun Heo       2025-12-11  1571  {
530b6637c79e72 kernel/sched/ext.c Tejun Heo       2025-12-11  1572  	struct rq *rq = container_of(dsq, struct rq, scx.local_dsq);
530b6637c79e72 kernel/sched/ext.c Tejun Heo       2025-12-11  1573  
4e3d7c89e15ac5 kernel/sched/ext.c zhidao su       2026-04-23  1574  	call_task_dequeue(sch, rq, p, 0);
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1575  
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1576  	/*
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1577  	 * Note that @rq's lock may be dropped between this enqueue and @p
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1578  	 * actually getting on CPU. This gives higher-class tasks (e.g. RT)
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1579  	 * an opportunity to wake up on @rq and prevent @p from running.
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1580  	 * Here are some concrete examples:
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1581  	 *
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1582  	 * Example 1:
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1583  	 *
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1584  	 * We dispatch two tasks from a single ops.dispatch():
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1585  	 * - First, a local task to this CPU's local DSQ;
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1586  	 * - Second, a local/remote task to a remote CPU's local DSQ.
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1587  	 * We must drop the local rq lock in order to finish the second
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1588  	 * dispatch. In that time, an RT task can wake up on the local rq.
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1589  	 *
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1590  	 * Example 2:
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1591  	 *
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1592  	 * We dispatch a local/remote task to a remote CPU's local DSQ.
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1593  	 * We must drop the remote rq lock before the dispatched task can run,
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1594  	 * which gives an RT task an opportunity to wake up on the remote rq.
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1595  	 *
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1596  	 * Both examples work the same if we replace dispatching with moving
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1597  	 * the tasks from a user-created DSQ.
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1598  	 *
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1599  	 * We must detect these wakeups so that we can re-enqueue IMMED tasks
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1600  	 * from @rq's local DSQ. scx_wakeup_preempt() serves exactly this
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1601  	 * purpose, but for it to be invoked, we must ensure that we bump
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1602  	 * @rq->next_class to &ext_sched_class if it's currently idle.
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1603  	 *
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1604  	 * wakeup_preempt() does the bumping, and since we only invoke it if
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1605  	 * @rq->next_class is below &ext_sched_class, it will also
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1606  	 * resched_curr(rq).
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1607  	 */
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1608  	if (sched_class_above(p->sched_class, rq->next_class))
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1609  		wakeup_preempt(rq, p, 0);
ebf1ccff79c43f kernel/sched/ext.c Andrea Righi    2026-02-18  1610  
f5e1e5ec204da1 kernel/sched/ext.c Tejun Heo       2025-12-11  1611  	/*
f5e1e5ec204da1 kernel/sched/ext.c Tejun Heo       2025-12-11  1612  	 * If @rq is in balance, the CPU is already vacant and looking for the
f5e1e5ec204da1 kernel/sched/ext.c Tejun Heo       2025-12-11  1613  	 * next task to run. No need to preempt or trigger resched after moving
f5e1e5ec204da1 kernel/sched/ext.c Tejun Heo       2025-12-11  1614  	 * @p into its local DSQ.
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1615  	 * Note that the wakeup_preempt() above may have already triggered
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1616  	 * a resched if @rq->next_class was idle. It's harmless, since
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1617  	 * need_resched is cleared immediately after task pick.
f5e1e5ec204da1 kernel/sched/ext.c Tejun Heo       2025-12-11  1618  	 */
f5e1e5ec204da1 kernel/sched/ext.c Tejun Heo       2025-12-11  1619  	if (rq->scx.flags & SCX_RQ_IN_BALANCE)
f5e1e5ec204da1 kernel/sched/ext.c Tejun Heo       2025-12-11  1620  		return;
f5e1e5ec204da1 kernel/sched/ext.c Tejun Heo       2025-12-11  1621  
530b6637c79e72 kernel/sched/ext.c Tejun Heo       2025-12-11 @1622  	if ((enq_flags & SCX_ENQ_PREEMPT) && p != rq->curr &&
530b6637c79e72 kernel/sched/ext.c Tejun Heo       2025-12-11  1623  	    rq->curr->sched_class == &ext_sched_class) {
530b6637c79e72 kernel/sched/ext.c Tejun Heo       2025-12-11  1624  		rq->curr->scx.slice = 0;
530b6637c79e72 kernel/sched/ext.c Tejun Heo       2025-12-11  1625  		resched_curr(rq);
530b6637c79e72 kernel/sched/ext.c Tejun Heo       2025-12-11  1626  	}
163f8b7f9a8408 kernel/sched/ext.c Kuba Piecuch    2026-04-28  1627  }
530b6637c79e72 kernel/sched/ext.c Tejun Heo       2025-12-11  1628  

:::::: The code at line 1451 was first introduced by commit
:::::: f0e1a0643a59bf1f922fa209cec86a170b784f3f sched_ext: Implement BPF extensible scheduler class

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
