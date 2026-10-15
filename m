Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D5D280035
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792104388; cv=none; b=LrEPASjALG4yvbAU5Z+J9EiFxaiOfKJEoLcMX4Q1Uy/aU/mRACKZ4R7LQiwpgaI61G0w4GBrGR40+pMNktz5t+e3egL8FJeeUZmyBAtXZZKAkxEj945Eeqx4FnzSOqeH082Ovv2yJRDb4PqDZmMl9unMMA1MVxmhv/BkWHGHEmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792104388; c=relaxed/simple;
	bh=0zqn6aaDJ0XjPQTLOB2Y0LIJtss8uLnbyZXcGV0AbII=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n2pZSDFLUxLFwxiH9XdkKUlBbleF2yiuCFGMy6RcCK4i/Kvwo6ttRLpjJo/F2PR0rXfhtTcizgOc0Vigsv11NxdK+sO/whsxkIjDw2nxjxAToeiNkobLieA518iYuhLvnXXyAlrQ2c70DAJ6H4FXMKtLJNthwXJpvfa5OdXOJxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hw7gvuAW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hw7gvuAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792104385; x=1823640385;
  h=date:from:to:cc:subject:message-id;
  bh=0zqn6aaDJ0XjPQTLOB2Y0LIJtss8uLnbyZXcGV0AbII=;
  b=Hw7gvuAWQ78mzWhjedNHPTrTB9M9GRunSrs1swgSdAG7tsXd5X0znRLP
   frkA81GsvRwRAx1xkyaXAiX/NbeIWQxcaH7V6zr1Z37MSmmmeZI1HcC4P
   G1OQpwlmzPX+BIRTV+NmA4UANulX398/nBQjRBs5wrd45iukqc2mn2WB7
   ksDk7OB42CC755UfHxiHUX23FDtIW/fa5Xtjjd7sUeVyVrieM/5n5AFFR
   +HFrklfKBhvDa0KEhUOcoGMBXN555RKA3SB/l70xDhsa+wdbf0DjcgOl4
   lGuoM1tFYQ+q85y15QEH1FphUqO3WQMmaGzSopZcMfWafbecU/RNtMvWa
   g==;
X-CSE-ConnectionGUID: LCmIQ+VYQ92zFnsNGdSN3g==
X-CSE-MsgGUID: XDgpQ5CJR8Og8gJliUjGhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="990710"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="990710"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 15:46:21 -0700
X-CSE-ConnectionGUID: qNJ+0QUVQsaTd1HaJiaBwQ==
X-CSE-MsgGUID: +Ol1ZdJYTPKBc4r1v+CLsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1696270"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 15 Oct 2026 15:46:19 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHUDJ-00000000Bti-36WU;
	Thu, 15 Oct 2026 22:46:17 +0000
Date: Fri, 16 Oct 2026 00:45:30 +0200
From: kernel test robot <lkp@intel.com>
To: Richard Patel <ripatel@wii.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:irq/core 3/7] kernel/irq/manage.c:1208:2: error: call
 to undeclared function 'clear_and_wake_up_bit'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202610160017.QOA49KVT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
head:   4351cc74202857f5b85b3573c477c9f798f5cd88
commit: 313fa9ffa302f81b437e1ebbb1e6abae06be0cad [3/7] genirq: Defer kfree(irqaction) until irq_thread_dtor() finishes
config: i386-randconfig-2200-20261015 (https://download.01.org/0day-ci/archive/20261016/202610160017.QOA49KVT-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610160017.QOA49KVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610160017.QOA49KVT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/irq/manage.c:1208:2: error: call to undeclared function 'clear_and_wake_up_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1208 |         clear_and_wake_up_bit(IRQTF_EXIT_WORK, &action->thread_flags);
         |         ^
   kernel/irq/manage.c:1292:2: error: call to undeclared function 'clear_and_wake_up_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1292 |         clear_and_wake_up_bit(IRQTF_EXIT_WORK, &action->thread_flags);
         |         ^
>> kernel/irq/manage.c:1866:2: error: call to undeclared function 'wait_on_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1866 |         wait_on_bit(&action->thread_flags, IRQTF_EXIT_WORK, TASK_UNINTERRUPTIBLE);
         |         ^
   3 errors generated.


vim +/clear_and_wake_up_bit +1208 kernel/irq/manage.c

  1202	
  1203	static void irq_thread_dtor(struct callback_head *unused)
  1204	{
  1205		struct irqaction *action = kthread_data(current);
  1206	
  1207		__irq_thread_dtor(action);
> 1208		clear_and_wake_up_bit(IRQTF_EXIT_WORK, &action->thread_flags);
  1209	}
  1210	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
