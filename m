Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A923244C664
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435349; cv=none; b=Myes5abHofSSd7qEuSWHLP9d2FAc1TFymOzRuf1M4tJa7T/EYqkR4auEcjpzalnvL1gnU/dtwKCeG8FcEXFoduX9LR40f3+r35jcCPvvSwnvbO/t0A1M4V101Stvoc+FsmY+0pnHXPq8k9pVZ2JR9DTEvUcNd+jxRjAWQfPyrq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435349; c=relaxed/simple;
	bh=V2f6t8seqAYkXoLsq8Jw1lCadHvMCV2oEh8bq+oPOqU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M0q2TjaBDR4gWHeJlis3W4BtTe4XO8oIdfsJTtmnOzeO8uMULjFHR7rAIZsbnc4Z/DtsdUOkzXEWp8c2IHLlWISlQONIBBPSvE834eC3yOonQDRcTN5nmQZyZeniJi/V3nXn6nUyxxf7Woh9yMpVVdow+308K5krMNEM2gUChxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gUd1MO6+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUd1MO6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788435341; x=1819971341;
  h=date:from:to:cc:subject:message-id;
  bh=V2f6t8seqAYkXoLsq8Jw1lCadHvMCV2oEh8bq+oPOqU=;
  b=gUd1MO6+zGTB/p0gv/42qzApffogGtUbnmaMgogQb5VDgtuE0LtutecM
   caUqu2NL5AJN86fW54SJWAU30vyCy2dcHV5QKE3PqutKRFVmFW7DEPdee
   E6ZOT+n7IS8Z7lCdpJ+aRPuWj+LNZ+3TLexoyJGVdoAiUkl7Jtw4TsDFd
   Ub9xhyWbZfRG2yhKJ5/rmJfROTUQqoq1l/SSGvtGfQEAiEwgrKcPC53DB
   DHAULCdnk7/YCKJVuAkOiSEd/WDaZ9zGTqN5Swkk5ImsWZ0331RWHd4RV
   4xVbw5NrhFs9L9WEVNu67YLXOR+7mznG8Nc9a94RF+DSqm7twtnz1fovz
   g==;
X-CSE-ConnectionGUID: gviso1c2RH6XC74oqmsw2Q==
X-CSE-MsgGUID: Krjd0w+mT+qiYnKTJqO4nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100073955"
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="100073955"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:35:37 -0700
X-CSE-ConnectionGUID: inmjmNR1TuGK4KQ+K33bWA==
X-CSE-MsgGUID: E023yWpYS82GoAdlPlJVng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="274972850"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Sep 2026 04:35:35 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x25jA-000000004j8-3Akp;
	Thu, 03 Sep 2026 11:35:32 +0000
Date: Thu, 03 Sep 2026 19:35:10 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jinjie Ruan <ruanjinjie@huawei.com>
Subject: include/linux/irq-entry-common.h:218: undefined reference to
 `syscall_enter_audit'
Message-ID: <202609031938.ZvZZaRQy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   940de590b839f71d6dc846160534bf202401b8b7
commit: 6f25517010ddd3f8080d7e06b9b1cb1b64b73772 entry: Rework syscall_audit_enter()
date:   6 weeks ago
config: riscv-randconfig-r052-20260903 (https://download.01.org/0day-ci/archive/20260903/202609031938.ZvZZaRQy-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031938.ZvZZaRQy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6f25517010dd ("entry: Rework syscall_audit_enter()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609031938.ZvZZaRQy-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/kernel/traps.o: in function `__exit_to_user_mode_validate':
>> include/linux/irq-entry-common.h:218: undefined reference to `syscall_enter_audit'


vim +218 include/linux/irq-entry-common.h

a70e9f647f501e3 Jinjie Ruan     2025-06-24  212  
70fe25a3bc53a89 Thomas Gleixner 2025-10-27  213  static __always_inline void __exit_to_user_mode_validate(void)
70fe25a3bc53a89 Thomas Gleixner 2025-10-27  214  {
a70e9f647f501e3 Jinjie Ruan     2025-06-24  215  	/* Ensure that kernel state is sane for a return to userspace */
a70e9f647f501e3 Jinjie Ruan     2025-06-24  216  	kmap_assert_nomap();
a70e9f647f501e3 Jinjie Ruan     2025-06-24  217  	lockdep_assert_irqs_disabled();
a70e9f647f501e3 Jinjie Ruan     2025-06-24 @218  	lockdep_sys_exit();
a70e9f647f501e3 Jinjie Ruan     2025-06-24  219  }
a70e9f647f501e3 Jinjie Ruan     2025-06-24  220  

:::::: The code at line 218 was first introduced by commit
:::::: a70e9f647f501e36a6a092888b1ea7386b7c5664 entry: Split generic entry into generic exception and syscall entry

:::::: TO: Jinjie Ruan <ruanjinjie@huawei.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
