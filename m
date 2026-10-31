Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793418148;
	b=HQMJtCuJNkRdRzfiryp6yQok6xZNiPbBpSNegKdy+vgKhS0FYW2qopUPDFZfOZ+Spze1
	 CjLnkRO/cqr3AtY/SnCBqUk8JMR9yQRO/DxCkqSmRwyP1viI8Ro1CD6uLhaYtxSoxL+Ob
	 Snq61yHstlENkPR/s9CkBftKFYXPdg2BU0+4IlWJlsD+eQV96DJ79M/o9p3Fa4UE0iM15
	 MAkbCLC0zkuBN8CSVNzt8joyMsghuV8wXFhXTwWUgnjZfeg8duc0FATr51JsnqLbl4SLG
	 IIvNsZdl0URwx+4nlmjbPOgA05XfhZ1OefhXcxw/n/dlK4I2iQ4301YuhYoiu7l4EQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793418148;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8Uj9OZsbv88tlXQeC3giO92nHVmp5niI8PEJKn2vPKI=;
	b=1wY3Xb/E57xHN1nKfDRkE8SEgcWmvcSWNBjKFl1sADeEew0ll7BaFTxoP+eSyGIvr3WG
	 K7tOKsUU+rC6AQVOJHUUJIFAwWof0XDJuEQhNiBeg7vVUsDvg5XZmGpCFT7JKcM/tbM3o
	 mxXIhht43wJR54YPZZXl/gFtHPmoqYMcR3cReufE+xS26N0+IOhNzYGyYA4pT4y4oHPfp
	 RDMe/MVUPnax0jv6G13UWzUp0MDohE7jR/SJARYe9lfSo9+DIv2B/5FlmO0egthU0oWq+
	 9vg8VybzIBEsR7yDc6DHBbVRTBjA0OCd1PyJDx1bqtLY91YnSEwK0o/T8ObnshbxQUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TXWCymuv;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94757606A31C;
	Sat, 31 Oct 2026 03:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94757606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TXWCymuv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793418147; x=1824954147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pLDMaA9u2DIya46UgXd1Q3O/zpB0FhmIJRX1KN0DRWI=;
  b=TXWCymuvedz5RioXASBMSDAXJx+dFiybQWlCW9JYMVNz3K5QtZWZZ/LA
   eZUFKYDnond2HFcQZd0Z5glVkti6Pfn1DT90lccG+T2ZLWRpK+/96eoWm
   N6S5hZvYykhIhZOgrh27sFx+43wXyXVZyK/Mz2cPCh+ubQBFqs8bHJCxS
   7iPboqjIVgEvAsVumy9Eo/rJBZb9zWBcBJZgpbtZvKJpqIAB7VFkYJN/t
   +h3c+pwU2PUoFYTbYsdq946N2zL1/KKMBYGzMDE4G+7kHJxHNskW4eZ7U
   q3wIAFk6FzHPaWWFkq55gnS7lS44PvG+9rV8ojwlrZVqaRwHXk4HRrIUf
   w==;
X-CSE-ConnectionGUID: U/kFInLMRn2qNRHktZoY4w==
X-CSE-MsgGUID: hlSdxvIfQHipWiQNwy9n5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2188803"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2188803"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 20:42:27 -0700
X-CSE-ConnectionGUID: DlbAhomOT9OdKtm3J6iyBQ==
X-CSE-MsgGUID: tV3OVMKbQOieESNB2zVCiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5568179"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Oct 2026 20:42:24 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMzz3-00000000cVM-2DbZ;
	Sat, 31 Oct 2026 03:42:21 +0000
Date: Sat, 31 Oct 2026 11:41:44 +0800
From: kernel test robot <lkp@intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Mika Westerberg <westeri@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
Message-ID: <202610311159.EWCMURna-lkp@intel.com>
References: <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
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
In-Reply-To: <20261030082539.1208733-2-chunfeng.yun@mediatek.com>

Hi Chunfeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on westeri-thunderbolt/next]
[also build test ERROR on linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chunfeng-Yun/thunderbolt-add-platform-nhi-driver/20261030-162536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20261030082539.1208733-2-chunfeng.yun%40mediatek.com
patch subject: [PATCH 1/4] thunderbolt: add platform nhi driver
config: arm64-randconfig-1003-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311159.EWCMURna-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311159.EWCMURna-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311159.EWCMURna-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/thunderbolt/domain.o: in function `tb_domain_init':
>> drivers/thunderbolt/domain.c:909: multiple definition of `init_module'; drivers/thunderbolt/pci.o:drivers/thunderbolt/pci.c:753: first defined here
   aarch64-linux-ld: drivers/thunderbolt/domain.o: in function `tb_domain_exit':
>> drivers/thunderbolt/domain.c:935: multiple definition of `cleanup_module'; drivers/thunderbolt/pci.o:drivers/thunderbolt/pci.c:753: first defined here
   aarch64-linux-ld: drivers/thunderbolt/plat.o: in function `nhi_plat_driver_init':
   drivers/thunderbolt/plat.c:152: multiple definition of `init_module'; drivers/thunderbolt/pci.o:drivers/thunderbolt/pci.c:753: first defined here
   aarch64-linux-ld: drivers/thunderbolt/plat.o: in function `nhi_plat_driver_exit':
   drivers/thunderbolt/plat.c:152: multiple definition of `cleanup_module'; drivers/thunderbolt/pci.o:drivers/thunderbolt/pci.c:753: first defined here


vim +909 drivers/thunderbolt/domain.c

a8937f35cf39c3 Mika Westerberg 2025-11-06  907  
4bef343876ebc1 Chunfeng Yun    2026-10-30  908  static int __init tb_domain_init(void)
9d3cce0b613689 Mika Westerberg 2017-06-06 @909  {
d1ff70241a2751 Mika Westerberg 2017-10-02  910  	int ret;
d1ff70241a2751 Mika Westerberg 2017-10-02  911  
cba57ed6f1e752 Mika Westerberg 2025-08-12  912  	tb_configfs_init();
54e418106c765c Gil Fine        2020-06-29  913  	tb_debugfs_init();
ccc5cb8ad5d18e Rajmohan Mani   2021-04-01  914  	tb_acpi_init();
ccc5cb8ad5d18e Rajmohan Mani   2021-04-01  915  
d1ff70241a2751 Mika Westerberg 2017-10-02  916  	ret = tb_xdomain_init();
d1ff70241a2751 Mika Westerberg 2017-10-02  917  	if (ret)
ccc5cb8ad5d18e Rajmohan Mani   2021-04-01  918  		goto err_acpi;
d1ff70241a2751 Mika Westerberg 2017-10-02  919  	ret = bus_register(&tb_bus_type);
d1ff70241a2751 Mika Westerberg 2017-10-02  920  	if (ret)
54e418106c765c Gil Fine        2020-06-29  921  		goto err_xdomain;
54e418106c765c Gil Fine        2020-06-29  922  
54e418106c765c Gil Fine        2020-06-29  923  	return 0;
54e418106c765c Gil Fine        2020-06-29  924  
54e418106c765c Gil Fine        2020-06-29  925  err_xdomain:
d1ff70241a2751 Mika Westerberg 2017-10-02  926  	tb_xdomain_exit();
ccc5cb8ad5d18e Rajmohan Mani   2021-04-01  927  err_acpi:
ccc5cb8ad5d18e Rajmohan Mani   2021-04-01  928  	tb_acpi_exit();
54e418106c765c Gil Fine        2020-06-29  929  	tb_debugfs_exit();
d1ff70241a2751 Mika Westerberg 2017-10-02  930  
d1ff70241a2751 Mika Westerberg 2017-10-02  931  	return ret;
9d3cce0b613689 Mika Westerberg 2017-06-06  932  }
9d3cce0b613689 Mika Westerberg 2017-06-06  933  
4bef343876ebc1 Chunfeng Yun    2026-10-30  934  static void __exit tb_domain_exit(void)
9d3cce0b613689 Mika Westerberg 2017-06-06 @935  {
9d3cce0b613689 Mika Westerberg 2017-06-06  936  	bus_unregister(&tb_bus_type);
9d3cce0b613689 Mika Westerberg 2017-06-06  937  	ida_destroy(&tb_domain_ida);
719a5fe87ecd71 Mika Westerberg 2020-03-05  938  	tb_nvm_exit();
d1ff70241a2751 Mika Westerberg 2017-10-02  939  	tb_xdomain_exit();
ccc5cb8ad5d18e Rajmohan Mani   2021-04-01  940  	tb_acpi_exit();
54e418106c765c Gil Fine        2020-06-29  941  	tb_debugfs_exit();
cba57ed6f1e752 Mika Westerberg 2025-08-12  942  	tb_configfs_exit();
9d3cce0b613689 Mika Westerberg 2017-06-06  943  }
4bef343876ebc1 Chunfeng Yun    2026-10-30  944  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
