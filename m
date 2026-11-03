Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679686;
	b=DEe6ACRhDsgi7Thr+ld5DgDZucnuDFvq8WBLJIPoNvcK1Q7t/anCUd2KOhTaZIEKPMKh
	 PzGF8TbNkHBvgIfT6gi3JMyN3hOdLlUKm0z1UFq4WjCoIU7AdglOb+zADGXa9pfVFh9Td
	 GtLLV6HEU2sjp+U9JqUzGqJ9KB02hfg2yBM1flYf0A5HpySFvUrfRTGKjowbN3FyfGhor
	 AkTza3O1ozWMCU6WuCYENre68LJEEiXQpGfE85WVG8Hs01ubPcfuSirhpbLAd9yzWZTq0
	 Y33YaIYg/nh4WvtX+tixyPMIGSA84UVe8Pk6sWEvoBvlB58FAmTOdnFiC8R/FeLDZTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679686;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=7hpI2iCSGoz71vPjJKjpaH2lhKVzdhV0IEDs+PYjGYI=;
	b=zv6cqaTDSx056rYn5aYn3NPtJsCmvmi+my7qKr5arT4RdD/8l0tCP1rqLpUsr2gqHIDu
	 t4k66qwLjR7IQSZupuUQzizJ6WmOXDDFPMSWq6Db+GdxbQ0jwi+zzO/c9cpt6MZhPKrYL
	 x17Qt6v5bysn0col9hxw6AcQdqouG5opba3gRafMK7kfilK4if1BJevjdek4DmYxZIIHj
	 Z/UL2Jk11enGKXANupUHLindNTXOyzXhUOh40k4JjU87u8SQjRqpK5I5uKyZY4hti8N4N
	 KpJ7/lso0Gc7HGpCehXGgmJBqZ6i1LyWmj1d++1v8RVdov4PezYHc2TabfK4vOrhWYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bOykYUWF;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35470606A326;
	Tue,  3 Nov 2026 04:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35470606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bOykYUWF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793679684; x=1825215684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e/FUd/e/mAYT7IeYzGgwu4zSfKt4EcJEQsjr//9wYN8=;
  b=bOykYUWFUwpgjQzzyCElyiY3wnujUeznqtjBEqbgEDWPU2tPv+lfYlHA
   k4KKcr9n2JfxnSXfFiwZZ+yr6mw0fj+9RikZJjV3C1MYwo7ZUOSTH4e5P
   l3hdvbT0nZE0AWDJvwTOaOu8JW0B8hDQ/6TsCxqqv108o2JQXnurPsq6A
   /k8sOXt+aovbtXMIXir5oe8xiQpPQ+vhAcsbB+bn4KerItALqsX1MFWpU
   Znzt9+P370Hq3pedVK77lYgpcRwMP7sdYDwJR+C67qfvMTNvchSYFQEsR
   qxiT0mj+aU00KemEnCfBTGom6W0t7U56om+OmbsGcVTtmEnN6gkrAJfn8
   w==;
X-CSE-ConnectionGUID: wr9nd00wQ92+3JGj/L5jEQ==
X-CSE-MsgGUID: VJOs+BUSRbmbc52eHjlntA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2495159"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2495159"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 20:21:23 -0800
X-CSE-ConnectionGUID: JaDX/0xDSXe4TwWItdmlvQ==
X-CSE-MsgGUID: C6+kcDqrTNGoQJ5+2a7VTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6633917"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Nov 2026 20:21:19 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xO61L-00000000iI4-2oC3;
	Tue, 03 Nov 2026 04:21:15 +0000
Date: Tue, 3 Nov 2026 12:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 RESEND 5/6] firmware: smccc: lfa: Register DT interrupt
Message-ID: <202611031233.vQxtNp7l-lkp@intel.com>
References: <20261102165421.3651202-6-andre.przywara@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102165421.3651202-6-andre.przywara@arm.com>

Hi Andre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm64/for-next/core linus/master next-20261030]
[cannot apply to arm/for-next arm/fixes clk/clk-next kvmarm/next rockchip/for-next soc/for-next nferre-at91/at91-next shawnguo/for-next v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andre-Przywara/dt-bindings-arm-Add-Live-Firmware-Activation/20261102-175415
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20261102165421.3651202-6-andre.przywara%40arm.com
patch subject: [PATCH v5 RESEND 5/6] firmware: smccc: lfa: Register DT interrupt
config: arm64-randconfig-1000-20261103 (https://download.01.org/0day-ci/archive/20261103/202611031233.vQxtNp7l-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611031233.vQxtNp7l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611031233.vQxtNp7l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/smccc/lfa_fw.c: In function 'lfa_register_dt':
   drivers/firmware/smccc/lfa_fw.c:939:16: error: implicit declaration of function 'devm_request_threaded_irq'; did you mean 'devm_request_region'? [-Werror=implicit-function-declaration]
     939 |         return devm_request_threaded_irq(dev, lfa_irq, NULL,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                devm_request_region
   drivers/firmware/smccc/lfa_fw.c:940:66: error: 'IRQF_COND_ONESHOT' undeclared (first use in this function)
     940 |                                          lfa_irq_handler_thread, IRQF_COND_ONESHOT,
         |                                                                  ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:940:66: note: each undeclared identifier is reported only once for each function it appears in
   drivers/firmware/smccc/lfa_fw.c: In function 'lfa_smccc_remove':
   drivers/firmware/smccc/lfa_fw.c:1034:9: error: implicit declaration of function 'devm_free_irq'; did you mean 'devm_free_pages'? [-Werror=implicit-function-declaration]
    1034 |         devm_free_irq(&sdev->dev, lfa_irq, NULL);
         |         ^~~~~~~~~~~~~
         |         devm_free_pages
   drivers/firmware/smccc/lfa_fw.c: In function 'lfa_register_dt':
>> drivers/firmware/smccc/lfa_fw.c:942:1: warning: control reaches end of non-void function [-Wreturn-type]
     942 | }
         | ^
   cc1: some warnings being treated as errors


vim +942 drivers/firmware/smccc/lfa_fw.c

   925	
   926	static int lfa_register_dt(struct device *dev)
   927	{
   928		struct device_node *np;
   929	
   930		np = of_find_compatible_node(NULL, NULL, "arm,lfa");
   931		if (!np)
   932			return -ENODEV;
   933	
   934		lfa_irq = irq_of_parse_and_map(np, 0);
   935		of_node_put(np);
   936		if (!lfa_irq)
   937			return -ENODEV;
   938	
   939		return devm_request_threaded_irq(dev, lfa_irq, NULL,
   940						 lfa_irq_handler_thread, IRQF_COND_ONESHOT,
   941						 NULL, NULL);
 > 942	}
   943	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
