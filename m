Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794210888;
	b=v8NAugbJzKb0HMPiBoVNwvDN2m5PuFttaiMg8QjXCrYr7kcR42qEHKfgD/d5YzpLJUP5
	 4ZDE/LlfV+6M3CLlbUjDO0DdTrtThYwEU0xtE7XOZsX5/87ywcL/Fz7CjTs+cgPybasr0
	 TVjRTFHKnoMrHWRZBmgqggR1gGnIOg2sNP/srcI4PyzmX5mnmV0klmDFVAMEDDYEQdPnD
	 kHgVtJ/uMC08TJriFN8Z4G9/S98izZYoIkkKwJi4+UdHGN8N13+tOJH9oH5SLhcVyTKuY
	 alo28U/Ulxv1RC+iHHZQvbpFJoChBROlVQHa7rxYryRB4oS8JQ/VDVRhU8IdRUtV6wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210888;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XBzsYfVAhhjke4pclcuDcTyD1Jq8HvwglfpfSzwW3KQ=;
	b=aVkXLNwiqBjlRDXaqqDWZu9Ltc7AwEqUo2z0S7Lfts2qw3OeJ+bEH/OoRU8xdsPIJLPB
	 BpfaQfW5pxb7JGyoU8eTHATrR2pvNTnSUKqbM3a6Zv0h5Cel0cupPEJ+YlQ6gs48G0ZmT
	 c0TgVW7sH+hDrRyqOt17GCc/CrX3tTzqeg9Es+ffeBYvhzM2k208ClvKSCLKIaHHC8eBA
	 0ymmqVgFo1OGsX3GrfI6f4Avw+29jykH5JG9cYsz3qnBRc+Va1J2ovgQHkYaRGsGNM6H6
	 cwjDnJazuJZpHFymrqGtunJKU6+E6dRA3KmHgynyJzNxAmppPpzRDkVJvEjaR17/JqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="S66+/Nlf";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189FD606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 189FD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S66+/Nlf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794210887; x=1825746887;
  h=date:from:to:cc:subject:message-id;
  bh=DhXQ/F9Bvaup89gZuosGV87vm9Uebn/h+1lx/g7CacA=;
  b=S66+/Nlfu5sPt6nDmwEVm9m3Vkpb4lGUrd76Rldgx/V3fSfMhiAbHXm6
   2KPuXu2uOv0GGqcLUAZls4w/C+x6COvGTO4x9tQuRWrLL+cVjga7wPM2K
   f1dud3PwH/ubgwb6URhkbYMr4BHHX9EjpTzf8y70PhZ7wSvYD3QMRwwvR
   FxanggnutkbMdkspYVpPPT34rHBbIKCqRlo3oNSHVj9yJuTKC6rRFJyLn
   uRNUkbicrpPE8qaOAr9gggsSq9z1qvG4x7SSog3lXS/GkAZHii0kAEXgA
   u7lxHhH8hxgUqOyT8NpCgcf2K6rL9M8Psv/hvn9GfL1HlMiCQaU9Q/ZfG
   w==;
X-CSE-ConnectionGUID: rfmhPWRDQMC5VVzEDf3kAQ==
X-CSE-MsgGUID: PoP9pGrxSY6Wm+fgSPDYVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2929611"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2929611"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 23:54:46 -0800
X-CSE-ConnectionGUID: CwypO6qcSAyaWvU+lwhdTg==
X-CSE-MsgGUID: Mp8WHjdAQlKf9D20eDzb3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7680893"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2026 23:54:43 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQKD9-000000000Gd-3JHr;
	Mon, 09 Nov 2026 07:54:39 +0000
Date: Mon, 09 Nov 2026 08:54:33 +0100
From: kernel test robot <lkp@intel.com>
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Subject: [tip:irq/drivers 7/11]
 drivers/irqchip/irq-imx-irqsteer.c:269:1: warning: label 'out' defined but
 not used
Message-ID: <202611090809.xeAXPI6O-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   0c0da722d7839e5250999416404d4a4055afb300
commit: 54ac29cd11115edd9f72f17aa4551658735f919d [7/11] irqchip/imx-irqsteer: Let devres own the clock
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20261109/202611090809.xeAXPI6O-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090809.xeAXPI6O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090809.xeAXPI6O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-imx-irqsteer.c: In function 'imx_irqsteer_probe':
>> drivers/irqchip/irq-imx-irqsteer.c:269:1: warning: label 'out' defined but not used [-Wunused-label]
     269 | out:
         | ^~~


vim +/out +269 drivers/irqchip/irq-imx-irqsteer.c

0136afa08967f6 Lucas Stach           2018-12-17  178  
0136afa08967f6 Lucas Stach           2018-12-17  179  static int imx_irqsteer_probe(struct platform_device *pdev)
0136afa08967f6 Lucas Stach           2018-12-17  180  {
0136afa08967f6 Lucas Stach           2018-12-17  181  	struct device_node *np = pdev->dev.of_node;
0136afa08967f6 Lucas Stach           2018-12-17  182  	struct irqsteer_data *data;
28528fca490814 Aisheng Dong          2019-02-20  183  	u32 irqs_num;
28528fca490814 Aisheng Dong          2019-02-20  184  	int i, ret;
0136afa08967f6 Lucas Stach           2018-12-17  185  
0136afa08967f6 Lucas Stach           2018-12-17  186  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
0136afa08967f6 Lucas Stach           2018-12-17  187  	if (!data)
0136afa08967f6 Lucas Stach           2018-12-17  188  		return -ENOMEM;
0136afa08967f6 Lucas Stach           2018-12-17  189  
33b1c47d1fc0b5 Shenwei Wang          2024-07-03  190  	data->dev = &pdev->dev;
358b9d248a026d Anson Huang           2019-04-01  191  	data->regs = devm_platform_ioremap_resource(pdev, 0);
0136afa08967f6 Lucas Stach           2018-12-17  192  	if (IS_ERR(data->regs)) {
0136afa08967f6 Lucas Stach           2018-12-17  193  		dev_err(&pdev->dev, "failed to initialize reg\n");
0136afa08967f6 Lucas Stach           2018-12-17  194  		return PTR_ERR(data->regs);
0136afa08967f6 Lucas Stach           2018-12-17  195  	}
0136afa08967f6 Lucas Stach           2018-12-17  196  
54ac29cd11115e Zhipeng Wang          2026-11-04  197  	data->ipg_clk = devm_clk_get_enabled(&pdev->dev, "ipg");
e0c45b107fc94c Anson Huang           2020-08-11  198  	if (IS_ERR(data->ipg_clk))
e0c45b107fc94c Anson Huang           2020-08-11  199  		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
e0c45b107fc94c Anson Huang           2020-08-11  200  				     "failed to get ipg clk\n");
0136afa08967f6 Lucas Stach           2018-12-17  201  
0136afa08967f6 Lucas Stach           2018-12-17  202  	raw_spin_lock_init(&data->lock);
0136afa08967f6 Lucas Stach           2018-12-17  203  
7d3a5eb78e3614 Arnd Bergmann         2019-03-04  204  	ret = of_property_read_u32(np, "fsl,num-irqs", &irqs_num);
7d3a5eb78e3614 Arnd Bergmann         2019-03-04  205  	if (ret)
7d3a5eb78e3614 Arnd Bergmann         2019-03-04  206  		return ret;
7d3a5eb78e3614 Arnd Bergmann         2019-03-04  207  	ret = of_property_read_u32(np, "fsl,channel", &data->channel);
7d3a5eb78e3614 Arnd Bergmann         2019-03-04  208  	if (ret)
7d3a5eb78e3614 Arnd Bergmann         2019-03-04  209  		return ret;
0136afa08967f6 Lucas Stach           2018-12-17  210  
5e72917802dd65 Ciprian Marian Costea 2026-03-11  211  	data->devtype_data = device_get_match_data(&pdev->dev);
5e72917802dd65 Ciprian Marian Costea 2026-03-11  212  	if (!data->devtype_data)
5e72917802dd65 Ciprian Marian Costea 2026-03-11  213  		return dev_err_probe(&pdev->dev, -ENODEV, "failed to match device data\n");
5e72917802dd65 Ciprian Marian Costea 2026-03-11  214  
28528fca490814 Aisheng Dong          2019-02-20  215  	/*
28528fca490814 Aisheng Dong          2019-02-20  216  	 * There is one output irq for each group of 64 inputs.
28528fca490814 Aisheng Dong          2019-02-20  217  	 * One register bit map can represent 32 input interrupts.
28528fca490814 Aisheng Dong          2019-02-20  218  	 */
28528fca490814 Aisheng Dong          2019-02-20  219  	data->irq_count = DIV_ROUND_UP(irqs_num, 64);
28528fca490814 Aisheng Dong          2019-02-20  220  	data->reg_num = irqs_num / 32;
f99f3c4acaff0d Fabio Estevam         2026-11-04  221  	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT)
f99f3c4acaff0d Fabio Estevam         2026-11-04  222  		return -EINVAL;
deb904e45b4e32 Aisheng Dong          2019-02-20  223  
4730d2233311d8 Lucas Stach           2022-04-06  224  	if (IS_ENABLED(CONFIG_PM)) {
0136afa08967f6 Lucas Stach           2018-12-17  225  		data->saved_reg = devm_kzalloc(&pdev->dev,
deb904e45b4e32 Aisheng Dong          2019-02-20  226  					sizeof(u32) * data->reg_num,
0136afa08967f6 Lucas Stach           2018-12-17  227  					GFP_KERNEL);
0136afa08967f6 Lucas Stach           2018-12-17  228  		if (!data->saved_reg)
0136afa08967f6 Lucas Stach           2018-12-17  229  			return -ENOMEM;
0136afa08967f6 Lucas Stach           2018-12-17  230  	}
0136afa08967f6 Lucas Stach           2018-12-17  231  
0136afa08967f6 Lucas Stach           2018-12-17  232  	/* steer all IRQs into configured channel */
5e72917802dd65 Ciprian Marian Costea 2026-03-11  233  	if (irqsteer_has_chanctrl(data->devtype_data))
0136afa08967f6 Lucas Stach           2018-12-17  234  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
0136afa08967f6 Lucas Stach           2018-12-17  235  
f98835ded6dcbb Zhipeng Wang          2026-11-04  236  	/*
f98835ded6dcbb Zhipeng Wang          2026-11-04  237  	 * Mask all interrupts before wiring up the chained handlers. CHANMASK
f98835ded6dcbb Zhipeng Wang          2026-11-04  238  	 * has inverted polarity (a set bit enables the interrupt), so writing
f98835ded6dcbb Zhipeng Wang          2026-11-04  239  	 * zero masks the source.
f98835ded6dcbb Zhipeng Wang          2026-11-04  240  	 */
f98835ded6dcbb Zhipeng Wang          2026-11-04  241  	for (i = 0; i < data->reg_num; i++)
f98835ded6dcbb Zhipeng Wang          2026-11-04  242  		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
f98835ded6dcbb Zhipeng Wang          2026-11-04  243  
95cb660c28dcec Zhipeng Wang          2026-11-04  244  	platform_set_drvdata(pdev, data);
95cb660c28dcec Zhipeng Wang          2026-11-04  245  
95cb660c28dcec Zhipeng Wang          2026-11-04  246  	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
95cb660c28dcec Zhipeng Wang          2026-11-04  247  	if (ret)
54ac29cd11115e Zhipeng Wang          2026-11-04  248  		return ret;
95cb660c28dcec Zhipeng Wang          2026-11-04  249  
93174c05dd2e9b Jiri Slaby (SUSE      2025-06-11  250) 	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
0136afa08967f6 Lucas Stach           2018-12-17  251  						&imx_irqsteer_domain_ops, data);
0136afa08967f6 Lucas Stach           2018-12-17  252  	if (!data->domain) {
0136afa08967f6 Lucas Stach           2018-12-17  253  		dev_err(&pdev->dev, "failed to create IRQ domain\n");
54ac29cd11115e Zhipeng Wang          2026-11-04  254  		return -ENOMEM;
0136afa08967f6 Lucas Stach           2018-12-17  255  	}
4730d2233311d8 Lucas Stach           2022-04-06  256  	irq_domain_set_pm_device(data->domain, &pdev->dev);
0136afa08967f6 Lucas Stach           2018-12-17  257  
28528fca490814 Aisheng Dong          2019-02-20  258  	for (i = 0; i < data->irq_count; i++) {
28528fca490814 Aisheng Dong          2019-02-20  259  		data->irq[i] = irq_of_parse_and_map(np, i);
7db5fd6b751fbc Shengjiu Wang         2025-03-05  260  		if (!data->irq[i])
7db5fd6b751fbc Shengjiu Wang         2025-03-05  261  			break;
28528fca490814 Aisheng Dong          2019-02-20  262  
28528fca490814 Aisheng Dong          2019-02-20  263  		irq_set_chained_handler_and_data(data->irq[i],
28528fca490814 Aisheng Dong          2019-02-20  264  						 imx_irqsteer_irq_handler,
0136afa08967f6 Lucas Stach           2018-12-17  265  						 data);
28528fca490814 Aisheng Dong          2019-02-20  266  	}
0136afa08967f6 Lucas Stach           2018-12-17  267  
0136afa08967f6 Lucas Stach           2018-12-17  268  	return 0;
28528fca490814 Aisheng Dong          2019-02-20 @269  out:
28528fca490814 Aisheng Dong          2019-02-20  270  	clk_disable_unprepare(data->ipg_clk);
28528fca490814 Aisheng Dong          2019-02-20  271  	return ret;
0136afa08967f6 Lucas Stach           2018-12-17  272  }
0136afa08967f6 Lucas Stach           2018-12-17  273  

:::::: The code at line 269 was first introduced by commit
:::::: 28528fca4908142bd1a3247956cba56c9c667d71 irqchip/imx-irqsteer: Add multi output interrupts support

:::::: TO: Aisheng Dong <aisheng.dong@nxp.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
