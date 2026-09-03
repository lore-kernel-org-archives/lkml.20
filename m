Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79113AFD02
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422955; cv=none; b=DYVtNEb0PEn8z16f68j45TJDhbQJu349S2zPAbvxyjX0zEoUapdUX/7d5Sz+QkQaunQG1Pz8zvI++GEEPNCTNyl8NEtNe3t2hY8515CoPAXbmwpHs1g04FOY4KgGzwidqMks4ZG/hC6bUTzkJ9dGS0PKisDwYkCbOud4lC2KSkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422955; c=relaxed/simple;
	bh=qQdDrMQQOpfb7in/N+je8NHTJuXu/TB71ez8hj3iaB4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sVLxVMocjwpfM/SvCeDrrB0y2yMFFJV4FodPoBdmo24JADB6oIX8wa+C3CSTfYeE5iJOnuCOAjIO3BsWQ3LIJWfrXeu7a47hWQvd/AdyiZvIAI+ZZ2W/1jrwH2eAIf+wEGfpQunJKmh74nrJGgmkMEfpSazYlde3sMAw12BfVAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPbySkzU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPbySkzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788422953; x=1819958953;
  h=date:from:to:cc:subject:message-id;
  bh=qQdDrMQQOpfb7in/N+je8NHTJuXu/TB71ez8hj3iaB4=;
  b=kPbySkzUcGTE0tDJ7qLUdhFLPgCG/tOK7EwdYnmvHyXeua1mjVz6lSOp
   cWZNH3qRqUbwjFBkHP1tjoryXI+WnkqxAok+e73bBjQYNGquLwcFNe12y
   yCiEpxn7PBCooo0xOaxXouQMnAVuInxSD1jqezzbcqYNAwWfXh6NEbkFs
   spEB20Z0RdnzOr4+c+SELz9SquUlsccElNd0h+oI+gAFc4mgsiSJdheyg
   tfSmSMyfhYJkBrf8S9LyRJNdH3tL0UAqx7/q42XTGKZozSuEPgnm6Pd0K
   CMr8pMy7Vey0G9Wcy740ViWKPUI6FvQt7baVLJtBjN3c8ipUkpJMmzC8+
   Q==;
X-CSE-ConnectionGUID: zV5OIvGWTcOuQFGBRVis8A==
X-CSE-MsgGUID: cHWRzZMTQTacoJCxUzVAiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100253732"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100253732"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 01:09:13 -0700
X-CSE-ConnectionGUID: 2sasvAdAT4uzvfkDcRwaBg==
X-CSE-MsgGUID: 7SeLVU5VSFaj0uF8f7312g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="263470598"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Sep 2026 01:09:11 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x22VQ-000000004Ma-22qb;
	Thu, 03 Sep 2026 08:09:08 +0000
Date: Thu, 03 Sep 2026 16:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: Rustam Adilov <adilov@disroot.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: drivers/irqchip/irq-realtek-rtl.c:79:15: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202609031600.1CNIzNmV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   940de590b839f71d6dc846160534bf202401b8b7
commit: 58b34b72b64bfbfc5f8ad4d8f229942aff76597e irqchip/irq-realtek-rtl: Use readl_be()/writel_be() instead of readl()/writel()
date:   2 weeks ago
config: mips-randconfig-r111-20260903 (https://download.01.org/0day-ci/archive/20260903/202609031600.1CNIzNmV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2c2cffa015e9549aafba9e514384b08204c7cc4b)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031600.1CNIzNmV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 58b34b72b64b ("irqchip/irq-realtek-rtl: Use readl_be()/writel_be() instead of readl()/writel()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609031600.1CNIzNmV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-realtek-rtl.c:79:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:79:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:79:15: sparse:     got unsigned int *
>> drivers/irqchip/irq-realtek-rtl.c:79:15: sparse: sparse: cast to restricted __be32
>> drivers/irqchip/irq-realtek-rtl.c:81:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/irqchip/irq-realtek-rtl.c:81:9: sparse:     expected unsigned int [usertype] val
   drivers/irqchip/irq-realtek-rtl.c:81:9: sparse:     got restricted __be32 [usertype]
>> drivers/irqchip/irq-realtek-rtl.c:81:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:81:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:81:9: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:167:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:167:19: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:167:19: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:167:19: sparse: sparse: cast to restricted __be32
   drivers/irqchip/irq-realtek-rtl.c:168:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:168:19: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:168:19: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:168:19: sparse: sparse: cast to restricted __be32
   drivers/irqchip/irq-realtek-rtl.c:58:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:58:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:58:16: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:58:16: sparse: sparse: cast to restricted __be32
   drivers/irqchip/irq-realtek-rtl.c:60:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/irqchip/irq-realtek-rtl.c:60:9: sparse:     expected unsigned int [usertype] val
   drivers/irqchip/irq-realtek-rtl.c:60:9: sparse:     got restricted __be32 [usertype]
   drivers/irqchip/irq-realtek-rtl.c:60:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:60:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:60:9: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse: sparse: cast to restricted __be32
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     expected unsigned int [usertype] val
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     got restricted __be32 [usertype]
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse:     got unsigned int *
   drivers/irqchip/irq-realtek-rtl.c:67:16: sparse: sparse: cast to restricted __be32
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     expected unsigned int [usertype] val
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     got restricted __be32 [usertype]
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/irqchip/irq-realtek-rtl.c:69:9: sparse:     got unsigned int *

vim +79 drivers/irqchip/irq-realtek-rtl.c

    71	
    72	static void write_irr(unsigned int cpu, int hw_irq, u32 value)
    73	{
    74		void __iomem *irr0 = REG(cpu, RTL_ICTL_IRR0);
    75		unsigned int offset = IRR_OFFSET(hw_irq);
    76		unsigned int shift = IRR_SHIFT(hw_irq);
    77		u32 irr;
    78	
  > 79		irr = readl_be(irr0 + offset) & ~(0xf << shift);
    80		irr |= (value & 0xf) << shift;
  > 81		writel_be(irr, irr0 + offset);
    82	}
    83	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
