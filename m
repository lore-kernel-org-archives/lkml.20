Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AF5185B48
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789183062; cv=none; b=hIMmQODLyS2mLw1tXrrGRd2Y0l4qT97RJSdH/lpqazIj0pkJIfavgwMbCZ49Ve5PfRFol13NVkeupbaNqnfONzMCa84CBD8u9OTEs+xC6UjcuYWDsO0rODKHqxpfp6KM8ljCdu3VwZNjrlLga9RGEMvZTb2E5I9kjY9xrZAn5xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789183062; c=relaxed/simple;
	bh=wYgdKTtaiftOB1NzVdZ/Fy4nrse0zcR5mGExXehf1cc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i+rNjTQ+M9MUuWA0T+GJzDdOWcG4MNLJ3kWPZtH7FKxvba+YWI6SvII6sbgYZIQOrEjtNe1iiQAlq60L06Pu4wKMqmeSEjcSueCtdFYWyFUdVlhHJh13CRQErit0KVGC509onusCtIKLotJL4QErqaJEn0IHRYXOUGxLib+Ne6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k4TrAiCN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4TrAiCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789183059; x=1820719059;
  h=date:from:to:cc:subject:message-id;
  bh=wYgdKTtaiftOB1NzVdZ/Fy4nrse0zcR5mGExXehf1cc=;
  b=k4TrAiCNzYqgf4VnY08vFpETNmOry7P3BFZRe7skSiEAK5GjT4wldN4+
   WkBjZIzKPbqb8YLD//bd4WNVOlT3cpVOnLxj5mhP5E9vb9lTarHma1YPP
   ohUJVNLUMFioV1t0/wyunLmXCaRf13/uZdekzIRIDWOx0Kw9P0CeJEZzs
   zlVLaxikx4vM8er0lv1mitz3AnlZ8xJeSvOZVljpXeb/z0Q+UOZMqgsll
   HfAYsZhfs0nSD7x/YiYwvybalWv+ZtoJbiKuyeuz3loH2dsr/WJ7o+Zvk
   s5ytEEZYsYqMvKWT6Maz80u9m3puI53pcO7tR7smpJd2zlW6qO3GJzhKP
   A==;
X-CSE-ConnectionGUID: GxV34ZnwR4KJuZT70dQ5Hg==
X-CSE-MsgGUID: aah2mrcFRFaQpG6y5Uhc9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="100238841"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="100238841"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 20:17:39 -0700
X-CSE-ConnectionGUID: HoEN+FSuSE2FXOOf+j6O7Q==
X-CSE-MsgGUID: kBMPMspKRMmR1kWTJYjK/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="271606800"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Sep 2026 20:17:38 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5EFC-000000002aF-3zNN;
	Sat, 12 Sep 2026 03:17:34 +0000
Date: Sat, 12 Sep 2026 11:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Lucero <alucerop@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dave Jiang <dave.jiang@intel.com>
Subject: drivers/net/ethernet/sfc/efx_cxl.c:77: undefined reference
 to `devm_cxl_probe_mem'
Message-ID: <202609121058.6ZNcYDPM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08df884136f1c1197bab2a27814404fd329d9aac
commit: 0418860ef2ca8ab4e696ce3913fd76660c881c0e sfc: obtain and map cxl range using devm_cxl_probe_mem
date:   2 months ago
config: arm-randconfig-001-20260912 (https://download.01.org/0day-ci/archive/20260912/202609121058.6ZNcYDPM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121058.6ZNcYDPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0418860ef2ca ("sfc: obtain and map cxl range using devm_cxl_probe_mem")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121058.6ZNcYDPM-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/ethernet/sfc/efx_cxl.o: in function `efx_cxl_init':
>> drivers/net/ethernet/sfc/efx_cxl.c:77: undefined reference to `devm_cxl_probe_mem'


vim +77 drivers/net/ethernet/sfc/efx_cxl.c

    16	
    17	int efx_cxl_init(struct efx_probe_data *probe_data)
    18	{
    19		struct efx_nic *efx = &probe_data->efx;
    20		struct pci_dev *pci_dev = efx->pci_dev;
    21		struct range cxl_pio_range;
    22		struct efx_cxl *cxl;
    23		u16 dvsec;
    24		int rc;
    25	
    26		/* Is the device configured with and using CXL? */
    27		if (!pcie_is_cxl(pci_dev))
    28			return 0;
    29	
    30		dvsec = pci_find_dvsec_capability(pci_dev, PCI_VENDOR_ID_CXL,
    31						  PCI_DVSEC_CXL_DEVICE);
    32		if (!dvsec) {
    33			pci_info(pci_dev, "CXL_DVSEC_PCIE_DEVICE capability not found\n");
    34			return 0;
    35		}
    36	
    37		pci_dbg(pci_dev, "CXL_DVSEC_PCIE_DEVICE capability found\n");
    38	
    39		/* Create a cxl_dev_state embedded in the cxl struct using cxl core api
    40		 * specifying no mbox available.
    41		 */
    42		cxl = devm_cxl_dev_state_create(&pci_dev->dev, CXL_DEVTYPE_DEVMEM,
    43						pci_get_dsn(pci_dev), dvsec,
    44						struct efx_cxl, cxlds, false);
    45	
    46		if (!cxl)
    47			return -ENOMEM;
    48	
    49		rc = cxl_pci_setup_regs(pci_dev, CXL_REGLOC_RBI_COMPONENT,
    50					&cxl->cxlds.reg_map);
    51		if (rc) {
    52			pci_err(pci_dev, "No component registers\n");
    53			return rc;
    54		}
    55	
    56		if (!cxl->cxlds.reg_map.component_map.hdm_decoder.valid) {
    57			pci_err(pci_dev, "Expected HDM component register not found\n");
    58			return -ENODEV;
    59		}
    60	
    61		if (!cxl->cxlds.reg_map.component_map.ras.valid) {
    62			pci_err(pci_dev, "Expected RAS component register not found\n");
    63			return -ENODEV;
    64		}
    65	
    66		/* Set media ready explicitly as there are neither mailbox for checking
    67		 * this state nor the CXL register involved, both not mandatory for
    68		 * type2.
    69		 */
    70		cxl->cxlds.media_ready = true;
    71	
    72		if (cxl_set_capacity(&cxl->cxlds, EFX_CTPIO_BUFFER_SIZE)) {
    73			pci_err(pci_dev, "dpa capacity setup failed\n");
    74			return -ENODEV;
    75		}
    76	
  > 77		cxl->cxlmd = devm_cxl_probe_mem(&cxl->cxlds, &cxl_pio_range);
    78		if (IS_ERR(cxl->cxlmd)) {
    79			pci_err(pci_dev, "CXL accel memdev creation failed\n");
    80			return PTR_ERR(cxl->cxlmd);
    81		}
    82	
    83		cxl->ctpio_cxl = ioremap_wc(cxl_pio_range.start,
    84					    range_len(&cxl_pio_range));
    85		if (!cxl->ctpio_cxl) {
    86			pci_err(pci_dev, "CXL ioremap region (%pra) failed\n",
    87				&cxl_pio_range);
    88			return -ENOMEM;
    89		}
    90	
    91		probe_data->cxl = cxl;
    92	
    93		return 0;
    94	}
    95	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
