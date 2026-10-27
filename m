Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108111;
	b=vl6+OTrns9wyYhqC/DoZFfZf2oABw/swDSGcrBYXBqlanVxtb2t7jhGFsm5cAZgymEa8
	 ifUkqxvUncVasiYaqeL6o7pgl2DdB+hwiDcpMPTvO5fn41hAZyFDuy23EaHhpFQRKCXPF
	 qVsCR7l4KHVQHrZVAAbZAB4FLcoSRkOnIzpwboznm/VlzBBF/WK6mqYRtVoE0hUmCsIvh
	 ORZrO42cLHNs8qgQtng/jexmJ4upPJ46fiy8nO/GqPefWH4iP0uJNyRLHfEwczoZ2CK5N
	 lNIUNybIt7kmzwIKP46k6CrdGm6RKWMzknAzAiVJjjXOxiWFrT1h5W9ydAEr2lh+uHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108111;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AoBNXOQoi1a4swVO+Hu1/0L+yWX2oi8HONhp+980T+0=;
	b=D9UrrUYs6wr85qOGEXK3oWDJTvRTXokCKUISj0aURttKwwBaPfEJcuFoDL3QULmBQ8Zd
	 da8TTx7YdslYrJFJpMncwzuEcIPl1qWlAr9pdtFC9lqgftlgSG43EViR1O2bg3MJl+zZU
	 84tGECbgXYWX/pc7BAxHQyBabnzOTC70FYAILttelKtVsLjzHKt2eM5KldgV8chMT1bRI
	 avEcsS+7VgpOo5Vm+g4YpnbdYhisqa9ZzZQzc5D1clbo+KlUbSgA5WYAaxBOgENYzyyTW
	 BmHvr3wKHRajM/emz4EA+Y6y2eduyHFZ5xdeeJMSrVDpIZYG23M4ip1mZpEczrZXBgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GyVXkKrj;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096CD606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 096CD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GyVXkKrj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793108110; x=1824644110;
  h=date:from:to:cc:subject:message-id;
  bh=M9YDtvvUlc1CuYmNza3TKPhD9GpAHkbG4taruddUJj0=;
  b=GyVXkKrjn6YUsh5opoA3eY4AhiNjG2msRBM30EJw3hok5Tuj5nwq9fbB
   lyWKiHAPhZcDy7qMl+DO3f2vMOv87tv64NNT46PvWMLBIv6wtBm5pwYCF
   E9KbAn1xq7z87RW/5e6vauUvH/Mdd8C3Wt4TpQxFcBCITyzM78BPFrMpo
   SDtMARSabWQOB6fo5EkCHrvdT3TqImYSnGF9JVsSn9f94PSQ/qXRlbUNW
   QSw0vRLVWko8yO9fy2hjwbVo/ED4FNd0wna4+7z0uythn0ZvUz9D7n01u
   lz9HeUSshWNrjXygOBgDZysx6mG0oA2Omn3ttnXvrt13/ycyl7ZIkmONx
   Q==;
X-CSE-ConnectionGUID: fZQPl82aQnykcwStsde2KA==
X-CSE-MsgGUID: 2igxuGcVQqGeVTSz9+LIYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1696623"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1696623"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 06:35:09 -0700
X-CSE-ConnectionGUID: 5BSQnQfHR82/neDQ6epjHQ==
X-CSE-MsgGUID: ck5I/wElRp6+6wV0fXDGUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5070948"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 27 Oct 2026 06:35:08 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLhKT-000000004Wx-3n03;
	Tue, 27 Oct 2026 13:35:05 +0000
Date: Tue, 27 Oct 2026 14:34:06 +0100
From: kernel test robot <lkp@intel.com>
To: Rustam Adilov <adilov@disroot.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: drivers/irqchip/irq-realtek-rtl.c:79:15: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202610271430.H39Nrho1-lkp@intel.com>
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
head:   d135ab453a7400a34930bdda1ef4bdc8acfac80e
commit: 58b34b72b64bfbfc5f8ad4d8f229942aff76597e irqchip/irq-realtek-rtl: Use readl_be()/writel_be() instead of readl()/writel()
date:   10 weeks ago
config: mips-randconfig-r2311-20261027 (https://download.01.org/0day-ci/archive/20261027/202610271430.H39Nrho1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271430.H39Nrho1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 58b34b72b64b ("irqchip/irq-realtek-rtl: Use readl_be()/writel_be() instead of readl()/writel()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271430.H39Nrho1-lkp@intel.com/

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
