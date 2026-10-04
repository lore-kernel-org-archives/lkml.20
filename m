Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088163A2E2B
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791118546; cv=none; b=LOt9TeD+57cU7awKciy6Fa6Xui/Rn8ZIUo217a/HGqrdzzj4GBUOz6+5ZbkJptcikN8ZUi4VOXhtYs9uo9cf1Kr4K7mEn6udirV/CApYqC+tpPzJ4eT/N/OQ3PFSXfug32rYd2ckGiktCuPeDBMskXZZ05U/Lf20enauk3WdiFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791118546; c=relaxed/simple;
	bh=4ZvQeSN/AuTA//R5gZ1ky9FRUHjS6KAfM7yHmQhXenI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BOkLMzzKjYBGHTtov/yxLESAgwHPNNw2CE658J9Hml/df7vTv5x2ynD0LT/pIuB66+Hr2oaUFXqrs93zAJRXaq+dsaekDt3Sxcfr7sqGUX11zUPeKuGHz9suO4a3pWsZHtifTQNBMpSjpY14tOiqpT51EdCGa0HkcTJXuJn9ZZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwiMDjQ3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwiMDjQ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791118544; x=1822654544;
  h=date:from:to:cc:subject:message-id;
  bh=4ZvQeSN/AuTA//R5gZ1ky9FRUHjS6KAfM7yHmQhXenI=;
  b=OwiMDjQ3h0LuMa/oZD20vJH3xPO0AiCNLlhpH/Fubrz/tiih74XUZOHV
   17CITmtWelEkbvLj3O3aWSDR9vOKi5zFBUf6Enzw7ATFyEvKBx/BDnvwK
   GZaTnN/Vv0SquUB7G4tWfqE2PG1z2p7MXZ+WnTMVh7k8DfWNogJcp0WFW
   U5iYA6l4oi8y0oQ3hAZt3TYIVY6UWjrt4q71CDTgfxdNJw3X19gOtHkHv
   rNufbycdpKsO6UgOql8sVUKzc5PW+31rX9KzqwMNwaD1QC5/SoIj9eQso
   nvdICuK746IYIMac/lrR1811C6mnGJKucnGQrlObGu8fbhRNqCZzNw3/k
   g==;
X-CSE-ConnectionGUID: E9t05/l6SFuG8N874QxpDQ==
X-CSE-MsgGUID: ZfhNerfQTwGEN7c2CZRDvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91833566"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="91833566"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 05:55:43 -0700
X-CSE-ConnectionGUID: q4sxPY5SQ/y3J1j1+Qnh2Q==
X-CSE-MsgGUID: fkrpoOoiT66uRoOMZBXyRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="279870939"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 04 Oct 2026 05:55:41 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDLkh-000000000IH-0C5I;
	Sun, 04 Oct 2026 12:55:39 +0000
Date: Sun, 04 Oct 2026 14:54:42 +0200
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: arch/mips/ralink/mt7621.c:68:13: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202610041411.uJXWXF8i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6addb4f385570ebc11c4eb499a4f1c149f313e84
commit: 4ddaf88aadd3bd09c2eb3734c53d2864af6b144e mips: ralink: mt7621: add missing __iomem
date:   4 months ago
config: mips-randconfig-r2304-20261004 (https://download.01.org/0day-ci/archive/20261004/202610041411.uJXWXF8i-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041411.uJXWXF8i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4ddaf88aadd3 ("mips: ralink: mt7621: add missing __iomem")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610041411.uJXWXF8i-lkp@intel.com/

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

1df7addb9671ac John Crispin    2016-01-04  63  
cc19db8b312a6c Chuanhong Guo   2022-02-11  64  static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
cc19db8b312a6c Chuanhong Guo   2022-02-11  65  {
4ddaf88aadd3bd Rosen Penev     2026-05-07  66  	void __iomem *dm = (void __iomem *)KSEG1ADDR(&detect_magic);
cc19db8b312a6c Chuanhong Guo   2022-02-11  67  
cc19db8b312a6c Chuanhong Guo   2022-02-11 @68  	if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
cc19db8b312a6c Chuanhong Guo   2022-02-11  69  		return true;
cc19db8b312a6c Chuanhong Guo   2022-02-11  70  	__raw_writel(MT7621_MEM_TEST_PATTERN, dm);
cc19db8b312a6c Chuanhong Guo   2022-02-11  71  	if (__raw_readl(dm) != __raw_readl(dm + size))
cc19db8b312a6c Chuanhong Guo   2022-02-11  72  		return false;
5d8965704fe566 Ilya Lipnitskiy 2022-02-28  73  	__raw_writel(~MT7621_MEM_TEST_PATTERN, dm);
cc19db8b312a6c Chuanhong Guo   2022-02-11  74  	return __raw_readl(dm) == __raw_readl(dm + size);
cc19db8b312a6c Chuanhong Guo   2022-02-11  75  }
cc19db8b312a6c Chuanhong Guo   2022-02-11  76  

:::::: The code at line 68 was first introduced by commit
:::::: cc19db8b312a6c75645645f5cc1b45166b109006 MIPS: ralink: mt7621: do memory detection on KSEG1

:::::: TO: Chuanhong Guo <gch981213@gmail.com>
:::::: CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
