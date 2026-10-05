Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB7D4BEE58
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213752; cv=none; b=BiL4s4i2S6X1Up12q+P9E9bnJGxERjNjkydpmfGoJC5u4+7mxUr4HdYBSVkgT7Wuf7dksvglNyTFptdLpdAUQDRQ64OPrZtY5G1+c19ammSdYPd/uh3EINSnSXvuTTytvt+a6Zybt1UvK+LeeR/JDbE7GB3k9yNkjkh1JjRVNNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213752; c=relaxed/simple;
	bh=MnElmdFZCjeMUgnJg5TYuQIvcYSgyGbvybBxfQYLTq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W0uD789DgVm2O+cJo1QBWhbU3SoM7nYglYWToR6EPiAYiMCpCdwd0RLV3or0bYcP9aBvHrrTMSskEMx+zYTVSzvDBz6ubT1nQuTSzFh5euiCj+27X72E3HF5SLW3V5B9dEUm+LuZURG7rlxz409/ur+M2LPLqDTmM5ZJmfHpM7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4nCjEId; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4nCjEId"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791213751; x=1822749751;
  h=date:from:to:cc:subject:message-id;
  bh=MnElmdFZCjeMUgnJg5TYuQIvcYSgyGbvybBxfQYLTq0=;
  b=n4nCjEIdtjdYnKRB2ttJfWwcLufyAw7ImmatAABzB1UU0Vqk9XQkXtxP
   oiE+y+xHF0NBpZrami0BdlFI8Jdt8hMRAbAmSM2hY+L49J9G00e80MIJo
   f10HzB4uQfzgUDrsXSkbTnIWovWoC7thbgEqjpxFakpHwg9PyCXk91Ena
   aulZ9/e5bFAiUS9LuEiYvYphw7kVzhG10+oxeFQiu5SiPlXtleMRZuoMI
   vwKnSyK+Uv4igT+ZRFJUKh3HY1JVZVQ0HOvRmoCNJCGgTOyqhqLO49mrj
   vtXybt97shTepnunkPrr53smkwoBYni318nEhODPB3r+qrYz0XkmGm3g9
   w==;
X-CSE-ConnectionGUID: B1SNbALQTqm3a7f2hef+Pg==
X-CSE-MsgGUID: N8qa7P1pQsydoHeX9G2W4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="101210112"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="101210112"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 08:22:30 -0700
X-CSE-ConnectionGUID: kyt1zUw2SQqZ72qIOK+FiQ==
X-CSE-MsgGUID: FtjIaq8DRsi0WsqncZk8rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="276953345"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 05 Oct 2026 08:22:29 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDkWI-000000000CX-2T0f;
	Mon, 05 Oct 2026 15:22:26 +0000
Date: Mon, 05 Oct 2026 17:21:40 +0200
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/watchdog.c:36:21: warning: 'watchdog_mutex' defined
 but not used
Message-ID: <202610051721.Ul6QI2Or-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
commit: 25500ba7e77ce9d3d9b5a1929d41a2ee2e23f6fe locking/mutex: Remove the list_head from struct mutex
date:   7 months ago
config: powerpc64-randconfig-r2202-20261005 (https://download.01.org/0day-ci/archive/20261005/202610051721.Ul6QI2Or-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051721.Ul6QI2Or-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 25500ba7e77c ("locking/mutex: Remove the list_head from struct mutex")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051721.Ul6QI2Or-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/watchdog.c:15:
>> kernel/watchdog.c:36:21: warning: 'watchdog_mutex' defined but not used [-Wunused-variable]
      36 | static DEFINE_MUTEX(watchdog_mutex);
         |                     ^~~~~~~~~~~~~~
   include/linux/mutex.h:87:22: note: in definition of macro 'DEFINE_MUTEX'
      87 |         struct mutex mutexname = __MUTEX_INITIALIZER(mutexname)
         |                      ^~~~~~~~~


vim +/watchdog_mutex +36 kernel/watchdog.c

58687acba592667 Don Zickus      2010-05-07  35  
946d197794b2320 Thomas Gleixner 2017-09-12 @36  static DEFINE_MUTEX(watchdog_mutex);
ab992dc38f9ae40 Peter Zijlstra  2015-05-18  37  

:::::: The code at line 36 was first introduced by commit
:::::: 946d197794b23202b8b46c43016747c72fe23393 watchdog/core: Rename watchdog_proc_mutex

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
