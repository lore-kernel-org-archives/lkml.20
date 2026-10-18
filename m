Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D09B320CD3
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792359155; cv=none; b=eOrtXFsrGyfKWDOVc9ryi8kHQIg7Jr6hhsTKbFKmMrsu4HnHmif1yKH5sZ7kY8A1e0pNiQDUFFpACmWEcT5IfIouuJvDbj1Mg0qkCayAFF5S3bRPDPWkrXBCUAoFJqGRYdbkrQ4UJfghF2FW0BamZbDgXnJ1gFaoKUn/wLjJd30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792359155; c=relaxed/simple;
	bh=5NwnMIKfFqwyjQgEop8sZstqnyCkb98DLAeMenrSIig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wb+B5XXVZiSA3GLXPFtUCe3ddWjXM2g+X5YVDRhQ+5UzlKyxQ/Qmopsv44VFTRVrVYfywcHeS3g0czhP3qjaWxaAvqVqvDkusexpfXe0opkj/2H1GSWfMlFdjDLbQzpfn7qi+XZRmKQsfUJjdY6DJOo9xI2uah9HWlF4ODLvV1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cVHKI+Dh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVHKI+Dh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792359152; x=1823895152;
  h=date:from:to:cc:subject:message-id;
  bh=5NwnMIKfFqwyjQgEop8sZstqnyCkb98DLAeMenrSIig=;
  b=cVHKI+DhBuEZ0BrLO1SMQmYc5ZRFFvWUb9VMYKedhww5xV5BUuewWt5f
   +kWB9UQJoHwiqMf3O6iZQc/BG4UATDoX9xG/TIYXCbi/fPNG6Mf3htbu2
   wLjTxKocFvJn4PjI8zEm+D1GZB/ZiLly3Xi8SDoPGppRzFLMdmh+hcD8z
   PLg7fRw4RAMrFyJ34b0NA7/DkYGZ690OripagSrntm1+ZNu1hpAO3EEld
   WfL/4xK2ewfQgBtvmM1Eo6Vy6Iny+valEYHdNQKD/VvZPaIezTlV+7/qm
   GfWmD3P938+dgqhh0R97Y0WdhHBdZH8XGcudftraIkFXtznQ0zJMtJ2JI
   Q==;
X-CSE-ConnectionGUID: QYzuvwJ1QsOyzlkCvBhGjQ==
X-CSE-MsgGUID: 8VLLEPZpS+iov/+1V9lZEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1059211"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1059211"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 14:32:32 -0700
X-CSE-ConnectionGUID: YcgqGTiZRo+kr0lUMsJjSw==
X-CSE-MsgGUID: 1uSZ1T07ThKG18yAxLuvwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2382045"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Oct 2026 14:32:30 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIYUV-00000000Kri-1sfa;
	Sun, 18 Oct 2026 21:32:27 +0000
Date: Mon, 19 Oct 2026 05:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: drivers/soc/loongson/loongson2_pm.c:178:49: warning: cast
 from pointer to integer of different size
Message-ID: <202610190549.WM2PO3vO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f909e534f5e34feb2ea2701d54df63e21aa506fc
commit: 3d9aba6618d115750729bba2d1f8af180bd7d3bd LoongArch: Adjust build infrastructure for 32BIT/64BIT
date:   6 months ago
config: loongarch-randconfig-1001-20261019 (https://download.01.org/0day-ci/archive/20261019/202610190549.WM2PO3vO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190549.WM2PO3vO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3d9aba6618d1 ("LoongArch: Adjust build infrastructure for 32BIT/64BIT")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190549.WM2PO3vO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/loongson/loongson2_pm.c: In function 'loongson2_pm_probe':
>> drivers/soc/loongson/loongson2_pm.c:178:49: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     178 |                 loongson_sysconf.suspend_addr = (u64)phys_to_virt(suspend_addr);
         |                                                 ^


vim +178 drivers/soc/loongson/loongson2_pm.c

67694c076bd7d6b Yinbo Zhu   2023-08-03  162  
67694c076bd7d6b Yinbo Zhu   2023-08-03  163  static int loongson2_pm_probe(struct platform_device *pdev)
67694c076bd7d6b Yinbo Zhu   2023-08-03  164  {
67694c076bd7d6b Yinbo Zhu   2023-08-03  165  	int irq, retval;
67694c076bd7d6b Yinbo Zhu   2023-08-03  166  	u64 suspend_addr;
67694c076bd7d6b Yinbo Zhu   2023-08-03  167  	struct device *dev = &pdev->dev;
67694c076bd7d6b Yinbo Zhu   2023-08-03  168  
67694c076bd7d6b Yinbo Zhu   2023-08-03  169  	loongson2_pm.base = devm_platform_ioremap_resource(pdev, 0);
67694c076bd7d6b Yinbo Zhu   2023-08-03  170  	if (IS_ERR(loongson2_pm.base))
67694c076bd7d6b Yinbo Zhu   2023-08-03  171  		return PTR_ERR(loongson2_pm.base);
67694c076bd7d6b Yinbo Zhu   2023-08-03  172  
67694c076bd7d6b Yinbo Zhu   2023-08-03  173  	irq = platform_get_irq(pdev, 0);
67694c076bd7d6b Yinbo Zhu   2023-08-03  174  	if (irq < 0)
67694c076bd7d6b Yinbo Zhu   2023-08-03  175  		return irq;
67694c076bd7d6b Yinbo Zhu   2023-08-03  176  
67694c076bd7d6b Yinbo Zhu   2023-08-03  177  	if (!device_property_read_u64(dev, "loongson,suspend-address", &suspend_addr))
67694c076bd7d6b Yinbo Zhu   2023-08-03 @178  		loongson_sysconf.suspend_addr = (u64)phys_to_virt(suspend_addr);
67694c076bd7d6b Yinbo Zhu   2023-08-03  179  	else
67694c076bd7d6b Yinbo Zhu   2023-08-03  180  		dev_err(dev, "No loongson,suspend-address, could not support S3!\n");
67694c076bd7d6b Yinbo Zhu   2023-08-03  181  
67694c076bd7d6b Yinbo Zhu   2023-08-03  182  	if (loongson2_power_button_init(dev, irq))
67694c076bd7d6b Yinbo Zhu   2023-08-03  183  		return -EINVAL;
67694c076bd7d6b Yinbo Zhu   2023-08-03  184  
67694c076bd7d6b Yinbo Zhu   2023-08-03  185  	retval = devm_request_irq(&pdev->dev, irq, loongson2_pm_irq_handler,
67694c076bd7d6b Yinbo Zhu   2023-08-03  186  				  IRQF_SHARED, "pm_irq", &loongson2_pm);
67694c076bd7d6b Yinbo Zhu   2023-08-03  187  	if (retval)
67694c076bd7d6b Yinbo Zhu   2023-08-03  188  		return retval;
67694c076bd7d6b Yinbo Zhu   2023-08-03  189  
67694c076bd7d6b Yinbo Zhu   2023-08-03  190  	loongson2_pm_irq_enable();
67694c076bd7d6b Yinbo Zhu   2023-08-03  191  	loongson2_pm_status_clear();
67694c076bd7d6b Yinbo Zhu   2023-08-03  192  
67694c076bd7d6b Yinbo Zhu   2023-08-03  193  	if (loongson_sysconf.suspend_addr)
67694c076bd7d6b Yinbo Zhu   2023-08-03  194  		suspend_set_ops(&loongson2_suspend_ops);
67694c076bd7d6b Yinbo Zhu   2023-08-03  195  
a2fd542287d02d3 Binbin Zhou 2023-08-31  196  	/* Populate children */
a2fd542287d02d3 Binbin Zhou 2023-08-31  197  	retval = devm_of_platform_populate(dev);
a2fd542287d02d3 Binbin Zhou 2023-08-31  198  	if (retval)
a2fd542287d02d3 Binbin Zhou 2023-08-31  199  		dev_err(dev, "Error populating children, reboot and poweroff might not work properly\n");
a2fd542287d02d3 Binbin Zhou 2023-08-31  200  
67694c076bd7d6b Yinbo Zhu   2023-08-03  201  	return 0;
67694c076bd7d6b Yinbo Zhu   2023-08-03  202  }
67694c076bd7d6b Yinbo Zhu   2023-08-03  203  

:::::: The code at line 178 was first introduced by commit
:::::: 67694c076bd7d6b8b73c59d4881822f0493caf35 soc: loongson2_pm: add power management support

:::::: TO: Yinbo Zhu <zhuyinbo@loongson.cn>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
