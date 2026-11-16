Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817421;
	b=EH/0GcvweJ6f0V0rGXrzskSG0jhGejqkzqBP86Dkz8eq0NLmcuG/DaMD76WR5WPBsqYS
	 Z40LlzUyd49Miz/LNg6TkYlppP+F0uz3VE4OhN+P0jguiugR2vK/twJnmwesYWfuUX5mE
	 //twA7Xg2iptUjI9dcYP9HItpiu99GvK7NV9fAIS7hGLvX0C5CLaMsYFO8Mo//X2PgSAG
	 ety3gUkYLcaRIITAodNlo9TpEnwSY6D2Jvhcqybnj3fFw81LzQuHNo78yTjhVMiRA14S2
	 ERoPo6BuoxnK6TqBiZ3gTKNCq1VqdV3IMvw8r+2iO36BhDnAFYOaSMVjJ57U3GbL24Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817421;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Th8b3XsPxdiH2UsnDosm3Rc2xd1zk7ieCjfGhuW5PxY=;
	b=enAuG+o2M8B4UkvwywTsfU0fqNsHqgb+mL28E/A2rxBjhReocSDrN9yMhDRnEbL/3dvf
	 FJaV/kxqA/bAe8qrFTVZM9h2zhRCdeDvx++dEDMjVjNg+uFsEORymUetN+L1aI+irQBAF
	 OkgS163N9F5JPelDvhDEmk4dFBaMORO7JwLpjRB9gkGoc6Jbpc9/3tNHZcOdbTMcmZDLr
	 DDs8ujlrQBQP7qLSwVssWkUTVMZSHCke1kfN6Bra09yecxbWoklNTZUMsv7QLzZoDMhDr
	 D4LThQ/cfP/g+fnDWXhJqSDzL+lNfBMS3WAK4qjt62+ouGBGzwhEHeNuVftlIKi+stg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=badR6xhq;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155F3606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 155F3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=badR6xhq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794817420; x=1826353420;
  h=date:from:to:cc:subject:message-id;
  bh=NwUJihYrrQDfIkS+2p+8JUdSqgBdqte6yvMEzSzs8oM=;
  b=badR6xhqHyEJ3/4Vy5Y0QWDjAL3tRvY1ornAor0x8IWGiDY/xAUm5096
   LGgshKDtljxk+pNhUo5QW+kn/ZMT1q/2bF/RVu7HUsiIEnEWfm4i+BwXw
   ScHZm8O0XDfbDDwoJgHyfbJPelttDgvtIPr0dRtxS6ZVHQagHpDJmi6z7
   lW08YnB2EPwkOH6xMBE84540b/gZ7nunZfM/WsTyXt2IeYCRB2UEBtIxP
   ra5Bc0QKfCH4bdxoEzSFYM+9OERjKYDicTvipjzrR/cKnU44I7NCsCNJg
   TMziBLL4KOqwwyRi5i9+T3MgczIrIOP0S4GIh8KApTnn12yyi87uYOvaQ
   g==;
X-CSE-ConnectionGUID: 1w47d9bRRpW2gmhGpmdvvw==
X-CSE-MsgGUID: tytYtow7RemB2xRRFa3yQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3533532"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3533532"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 00:23:39 -0800
X-CSE-ConnectionGUID: jIXPJHSlTvuwtjCgQixVIA==
X-CSE-MsgGUID: VVvXsXZzSLWP8QtM3H5j1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9817922"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 16 Nov 2026 00:23:38 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSrzz-000000002d7-3FTn;
	Mon, 16 Nov 2026 08:23:35 +0000
Date: Mon, 16 Nov 2026 09:23:18 +0100
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: arch/mips/ralink/mt7621.c:68:13: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202611160920.MuZU35zg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aebb7274476403040d582c61478df8f4a7bf9cd3
commit: 4ddaf88aadd3bd09c2eb3734c53d2864af6b144e mips: ralink: mt7621: add missing __iomem
date:   6 months ago
config: mips-randconfig-r2301-20261116 (https://download.01.org/0day-ci/archive/20261116/202611160920.MuZU35zg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160920.MuZU35zg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4ddaf88aadd3 ("mips: ralink: mt7621: add missing __iomem")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160920.MuZU35zg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/mips/ralink/mt7621.c:68:13: sparse: sparse: cast removes address space '__iomem' of expression
   arch/mips/ralink/mt7621.c: note: in included file (through arch/mips/include/asm/mips-cps.h):
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void [noderef] __iomem *
   arch/mips/ralink/mt7621.c: note: in included file (through arch/mips/include/asm/mips-cps.h):
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void [noderef] __iomem *
   arch/mips/ralink/mt7621.c: note: in included file (through arch/mips/include/asm/mips-cps.h):
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:244:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@

vim +/__iomem +68 arch/mips/ralink/mt7621.c

1df7addb9671ace John Crispin    2016-01-04  63  
cc19db8b312a6c7 Chuanhong Guo   2022-02-11  64  static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
cc19db8b312a6c7 Chuanhong Guo   2022-02-11  65  {
4ddaf88aadd3bd0 Rosen Penev     2026-05-07  66  	void __iomem *dm = (void __iomem *)KSEG1ADDR(&detect_magic);
cc19db8b312a6c7 Chuanhong Guo   2022-02-11  67  
cc19db8b312a6c7 Chuanhong Guo   2022-02-11 @68  	if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
cc19db8b312a6c7 Chuanhong Guo   2022-02-11  69  		return true;
cc19db8b312a6c7 Chuanhong Guo   2022-02-11  70  	__raw_writel(MT7621_MEM_TEST_PATTERN, dm);
cc19db8b312a6c7 Chuanhong Guo   2022-02-11  71  	if (__raw_readl(dm) != __raw_readl(dm + size))
cc19db8b312a6c7 Chuanhong Guo   2022-02-11  72  		return false;
5d8965704fe5662 Ilya Lipnitskiy 2022-02-28  73  	__raw_writel(~MT7621_MEM_TEST_PATTERN, dm);
cc19db8b312a6c7 Chuanhong Guo   2022-02-11  74  	return __raw_readl(dm) == __raw_readl(dm + size);
cc19db8b312a6c7 Chuanhong Guo   2022-02-11  75  }
cc19db8b312a6c7 Chuanhong Guo   2022-02-11  76  

:::::: The code at line 68 was first introduced by commit
:::::: cc19db8b312a6c75645645f5cc1b45166b109006 MIPS: ralink: mt7621: do memory detection on KSEG1

:::::: TO: Chuanhong Guo <gch981213@gmail.com>
:::::: CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
