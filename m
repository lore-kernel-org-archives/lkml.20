Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA1C1A5B9E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088328; cv=none; b=dkWXFJCuqoDOLHp7J/0zLb+yO9QS0J0tusfsoy1LAl8c9ci3pzmsK/w8jIZ2K/kJaysmCR6esAex6Bcrwpj8ZtpHf8BFF+xaL+KrnbmRHs3mmsVg40C1tR51tMjI5P+VJbDdfHnXkXojTO6sSadN1mx3RRdTekiPb1rN+BMzD5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088328; c=relaxed/simple;
	bh=wClLg0yaVE7ZNlfOejYMjeuBPlKktDttE2UMYYQRfL0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WNQ7Yiw8bmDjHTM7wxkHj96+mFWtt4qnWT+vLNKnyFjrDvv/Wng71CgFujklTGMOMv/gAA3f4EYqfQjAkujS9oILTSOWuzopEIyoH5aO2+CIRW+qqVGDalkzCpwqcvNtNZEEcQ9A3Iu1CeFthPWF8xTh+u84wZywxRLuW7u4QAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEzrwIVz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEzrwIVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789088326; x=1820624326;
  h=date:from:to:cc:subject:message-id;
  bh=wClLg0yaVE7ZNlfOejYMjeuBPlKktDttE2UMYYQRfL0=;
  b=TEzrwIVzSGP7UwOLvJ/oCLJNlkGGAOAWRMLGQCkTONo1BAKX/j1rBVaI
   tG14gbpnE7bweMIWjB8rQEW0azkadiFZPjne0seftoFmCh5Wf/iPXkBtQ
   iqPctPMaEmXUQDPaXE1ez93QLoemMdo3suPPEAuewRyjX8wiO4dPGtF3+
   2jLaF217Z45Bvl7jBpHriZeAF2csJ0HlhHHUGOeH1PyA6JqQHlaQakh/0
   /ABZICyz731exvNquDECksBViM80jpsHxeLley7aj2rShOMUf1G45frti
   wmYV7rrBpr+/bUbKqg9wFPfM0PyHGwsg+hDjvMFDiX/dArMt+NenoPpdV
   Q==;
X-CSE-ConnectionGUID: +ebahQymSNionfe8aznyDA==
X-CSE-MsgGUID: 0TBwefe7RZ6qiMcuXp6u6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89422644"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89422644"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 17:58:46 -0700
X-CSE-ConnectionGUID: XEU3bjSxQlGispXVvQljOA==
X-CSE-MsgGUID: lx+ekBHXQEKtoD+y0f4prA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="270410924"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Sep 2026 17:58:44 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4pbG-000000000kX-0KFl;
	Fri, 11 Sep 2026 00:58:42 +0000
Date: Fri, 11 Sep 2026 08:57:43 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: kernel/futex/core.c:62:16: sparse: sparse: cast truncates
 bits from constant value (123456789abcdef becomes 89abcdef)
Message-ID: <202609110834.wO7fAXlN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Peter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08df884136f1c1197bab2a27814404fd329d9aac
commit: b78b0b65825275f58336a43611a700de174be8c3 futex: Use runtime constants for __futex_hash() hot path
date:   6 weeks ago
config: i386-randconfig-063-20260911 (https://download.01.org/0day-ci/archive/20260911/202609110834.wO7fAXlN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110834.wO7fAXlN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b78b0b658252 ("futex: Use runtime constants for __futex_hash() hot path")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110834.wO7fAXlN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/futex/core.c:532:38: sparse: sparse: cast removes address space '__user' of expression
   kernel/futex/core.c:532:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] __user *naddr @@     got void * @@
   kernel/futex/core.c:532:51: sparse:     expected unsigned int [noderef] [usertype] __user *naddr
   kernel/futex/core.c:532:51: sparse:     got void *
   kernel/futex/core.c:548:38: sparse: sparse: cast removes address space '__user' of expression
   kernel/futex/core.c:548:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] __user *naddr @@     got void * @@
   kernel/futex/core.c:548:51: sparse:     expected unsigned int [noderef] [usertype] __user *naddr
   kernel/futex/core.c:548:51: sparse:     got void *
>> kernel/futex/core.c:62:16: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)

vim +62 kernel/futex/core.c

    59	
    60	static __always_inline struct futex_hash_bucket **futex_queues(void)
    61	{
  > 62		return runtime_const_ptr(__futex_queues);
    63	}
    64	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
