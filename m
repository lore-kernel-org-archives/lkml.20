Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672A828D8D0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 01:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788397339; cv=none; b=EN4ALZOPCHbatDzeMyJs/8eEHf7auMbi9RrotgBF+qZvT0B3llZNrf7ZQ7/vrNlNYFw77qQZkH2i0EGCuaoT8Ww7z0Av12jykJTuIopeGCLkNNrK5oKdDsxS1TDBsZHRY5q0k6HPEvy3kjkIHLLBNdMBbS1tsYNUfgfa5eo3dlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788397339; c=relaxed/simple;
	bh=16yFk5ky5hpvXmZwimEh5KK/6nJBi9yTPuVxHX24RQI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jbDybAMbMHBXWULvX1ZKFAbSU62gItw/ZxOfjyMeK/9YL2xBRkp1DRZRLmUhGKPcwoxGjbOEWI1PWGC7I9N9Kap0NEVgaBk3hA4GbE+YWCfuY07hWsXix9ZuhrIYw3zctrAoOELM6s0nTZyIEqXgEY9gU358i3Ty5yTEMeYi9ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nsd89UvF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nsd89UvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788397338; x=1819933338;
  h=date:from:to:cc:subject:message-id;
  bh=16yFk5ky5hpvXmZwimEh5KK/6nJBi9yTPuVxHX24RQI=;
  b=Nsd89UvFX2rVYADIFksiouJJhiuVWGDeyBPeWSxqyNHyZIzSwkKOS1NA
   6F5mWNC7FvWcztJFoQx3pBZkPkEauareQHAfWmTPBbYeQPMjizjDLaI4l
   0Y5uayActGkYuFgdjI30jsg2pUt8OIVY3WPNH0dktQF/ICngGsT61b/SR
   6dcxCWDqvjFSL+ytbs3V8cIZ4IfrrVvJGPda6aNip/2yxRVwWgSJkY88A
   XVjCZOBsnvxrKvwl9GltVsZ2x1opqThS89X0gj1y20dIfEifOWb5q0sMJ
   nPsWgbceR3vsMhPkhP8qWiu2xdkSHNB0NCDfTr0Xs1F3PZzsVZgSW8ITb
   Q==;
X-CSE-ConnectionGUID: y5mAz61UQBaU6Eqdywisjg==
X-CSE-MsgGUID: s1PY55BzTV6LyKP+FkrCiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="114408469"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="114408469"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 18:02:17 -0700
X-CSE-ConnectionGUID: UO0geCMHQcWqAYYxsflW6A==
X-CSE-MsgGUID: G/EEXzPVSTmYw+3drxfsnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="263398758"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2026 18:02:14 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1vqF-000000003Yk-3Pcq;
	Thu, 03 Sep 2026 01:02:11 +0000
Date: Thu, 03 Sep 2026 09:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, Zeng Heng <zengheng4@huawei.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Gavin Shan <gshan@redhat.com>
Subject: drivers/resctrl/mpam_devices.c:1860:35-38: WARNING:
 Suspicious code. resource_size is maybe missing with msc_res
Message-ID: <202609030809.ObirDhR3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Ben,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89a312991dc6e638a36adc43ccb91dbc25504c04
commit: c544f00a473239835d22e7109b403314d8b85974 arm64: mpam: Drop the CONFIG_EXPERT restriction
date:   5 months ago
config: arm64-randconfig-r051-20260902 (https://download.01.org/0day-ci/archive/20260903/202609030809.ObirDhR3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2c2cffa015e9549aafba9e514384b08204c7cc4b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c544f00a4732 ("arm64: mpam: Drop the CONFIG_EXPERT restriction")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/resctrl/mpam_devices.c:1860:35-38: WARNING: Suspicious code. resource_size is maybe missing with msc_res

vim +1860 drivers/resctrl/mpam_devices.c

f04046f2577a5c James Morse 2025-11-19  1797  
f04046f2577a5c James Morse 2025-11-19  1798  static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
f04046f2577a5c James Morse 2025-11-19  1799  {
f04046f2577a5c James Morse 2025-11-19  1800  	int err;
f04046f2577a5c James Morse 2025-11-19  1801  	u32 tmp;
f04046f2577a5c James Morse 2025-11-19  1802  	struct mpam_msc *msc;
f04046f2577a5c James Morse 2025-11-19  1803  	struct resource *msc_res;
f04046f2577a5c James Morse 2025-11-19  1804  	struct device *dev = &pdev->dev;
f04046f2577a5c James Morse 2025-11-19  1805  
f04046f2577a5c James Morse 2025-11-19  1806  	lockdep_assert_held(&mpam_list_lock);
f04046f2577a5c James Morse 2025-11-19  1807  
f04046f2577a5c James Morse 2025-11-19  1808  	msc = devm_kzalloc(&pdev->dev, sizeof(*msc), GFP_KERNEL);
f04046f2577a5c James Morse 2025-11-19  1809  	if (!msc)
f04046f2577a5c James Morse 2025-11-19  1810  		return ERR_PTR(-ENOMEM);
01fb4b8224726a James Morse 2025-11-19  1811  	init_garbage(&msc->garbage);
01fb4b8224726a James Morse 2025-11-19  1812  	msc->garbage.pdev = pdev;
f04046f2577a5c James Morse 2025-11-19  1813  
f04046f2577a5c James Morse 2025-11-19  1814  	err = devm_mutex_init(dev, &msc->probe_lock);
f04046f2577a5c James Morse 2025-11-19  1815  	if (err)
f04046f2577a5c James Morse 2025-11-19  1816  		return ERR_PTR(err);
f04046f2577a5c James Morse 2025-11-19  1817  
f04046f2577a5c James Morse 2025-11-19  1818  	err = devm_mutex_init(dev, &msc->part_sel_lock);
f04046f2577a5c James Morse 2025-11-19  1819  	if (err)
f04046f2577a5c James Morse 2025-11-19  1820  		return ERR_PTR(err);
f04046f2577a5c James Morse 2025-11-19  1821  
49aa621c4dcaf8 James Morse 2025-11-19  1822  	err = devm_mutex_init(dev, &msc->error_irq_lock);
49aa621c4dcaf8 James Morse 2025-11-19  1823  	if (err)
49aa621c4dcaf8 James Morse 2025-11-19  1824  		return ERR_PTR(err);
09b89d2a72f37b James Morse 2025-11-19  1825  
09b89d2a72f37b James Morse 2025-11-19  1826  	err = devm_mutex_init(dev, &msc->cfg_lock);
09b89d2a72f37b James Morse 2025-11-19  1827  	if (err)
09b89d2a72f37b James Morse 2025-11-19  1828  		return ERR_PTR(err);
09b89d2a72f37b James Morse 2025-11-19  1829  
d02beb06ca2a62 James Morse 2025-11-19  1830  	mpam_mon_sel_lock_init(msc);
f04046f2577a5c James Morse 2025-11-19  1831  	msc->id = pdev->id;
f04046f2577a5c James Morse 2025-11-19  1832  	msc->pdev = pdev;
f04046f2577a5c James Morse 2025-11-19  1833  	INIT_LIST_HEAD_RCU(&msc->all_msc_list);
f04046f2577a5c James Morse 2025-11-19  1834  	INIT_LIST_HEAD_RCU(&msc->ris);
f04046f2577a5c James Morse 2025-11-19  1835  
f04046f2577a5c James Morse 2025-11-19  1836  	update_msc_accessibility(msc);
f04046f2577a5c James Morse 2025-11-19  1837  	if (cpumask_empty(&msc->accessibility)) {
f04046f2577a5c James Morse 2025-11-19  1838  		dev_err_once(dev, "MSC is not accessible from any CPU!");
f04046f2577a5c James Morse 2025-11-19  1839  		return ERR_PTR(-EINVAL);
f04046f2577a5c James Morse 2025-11-19  1840  	}
f04046f2577a5c James Morse 2025-11-19  1841  
49aa621c4dcaf8 James Morse 2025-11-19  1842  	err = mpam_msc_setup_error_irq(msc);
49aa621c4dcaf8 James Morse 2025-11-19  1843  	if (err)
49aa621c4dcaf8 James Morse 2025-11-19  1844  		return ERR_PTR(err);
49aa621c4dcaf8 James Morse 2025-11-19  1845  
f04046f2577a5c James Morse 2025-11-19  1846  	if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
f04046f2577a5c James Morse 2025-11-19  1847  		msc->iface = MPAM_IFACE_MMIO;
f04046f2577a5c James Morse 2025-11-19  1848  	else
f04046f2577a5c James Morse 2025-11-19  1849  		msc->iface = MPAM_IFACE_PCC;
f04046f2577a5c James Morse 2025-11-19  1850  
f04046f2577a5c James Morse 2025-11-19  1851  	if (msc->iface == MPAM_IFACE_MMIO) {
f04046f2577a5c James Morse 2025-11-19  1852  		void __iomem *io;
f04046f2577a5c James Morse 2025-11-19  1853  
f04046f2577a5c James Morse 2025-11-19  1854  		io = devm_platform_get_and_ioremap_resource(pdev, 0,
f04046f2577a5c James Morse 2025-11-19  1855  							    &msc_res);
f04046f2577a5c James Morse 2025-11-19  1856  		if (IS_ERR(io)) {
f04046f2577a5c James Morse 2025-11-19  1857  			dev_err_once(dev, "Failed to map MSC base address\n");
f04046f2577a5c James Morse 2025-11-19  1858  			return ERR_CAST(io);
f04046f2577a5c James Morse 2025-11-19  1859  		}
f04046f2577a5c James Morse 2025-11-19 @1860  		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
f04046f2577a5c James Morse 2025-11-19  1861  		msc->mapped_hwpage = io;
f04046f2577a5c James Morse 2025-11-19  1862  	} else {
f04046f2577a5c James Morse 2025-11-19  1863  		return ERR_PTR(-EINVAL);
f04046f2577a5c James Morse 2025-11-19  1864  	}
f04046f2577a5c James Morse 2025-11-19  1865  
f04046f2577a5c James Morse 2025-11-19  1866  	list_add_rcu(&msc->all_msc_list, &mpam_all_msc);
f04046f2577a5c James Morse 2025-11-19  1867  	platform_set_drvdata(pdev, msc);
f04046f2577a5c James Morse 2025-11-19  1868  
f04046f2577a5c James Morse 2025-11-19  1869  	return msc;
f04046f2577a5c James Morse 2025-11-19  1870  }
f04046f2577a5c James Morse 2025-11-19  1871  

:::::: The code at line 1860 was first introduced by commit
:::::: f04046f2577a5c76167333ca99d3903ee5331ba0 arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
