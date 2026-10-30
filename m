Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399143;
	b=a2AJsvsOm7GqGzH3i+RdmQ1LfJ85Ywei6BpgdeNmMWsXo1fbBgpWlD79U4BLONyoDDCO
	 H8bwuDqcHMIkXQ9LOIke0WHBjfcdpCKCo18F7NklEOCqx9f2iisCa7Lfx2UuBdjrqGrAv
	 hS0IyqSAMpTyjhpgX5/1D7Padb/709FxywpecHodlUXby/1Zp0l8ugcXwZf6Wf2oI35R5
	 tGYnh0XRZrIu53QDo5aM/UALGAS5rXNSW3lSdqGqIC/lNVeeMpD0rjsukk/q4tSF9suss
	 i/Ixhtj6muQBla3YYcK3fUPAecUByEk6cN3uPkKf7D4yc1j+nCiVdFI2PjT/xGGx6dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399143;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Y1n5wumFDIgsyS30s6mfyNDWk1UqqiypdP8Ght8uUkI=;
	b=a3JBLoq1UGx/I3J8s9kCErn6Y5eTCV/v1bQCxfHG9+GuhHmkTRUMOLKp/5KlLCCo9rMZ
	 1cGEfqUyhF9+CT1DJsb95N5cMnOJhZmTdUAoXW7HfeBs0FjVe/b4+Gmy5f64WKX/4JESD
	 w0xIRNJXhccbkfO+8Fk7ZRW07S2YMw6FOruYo9pFDWB8fhIVR2eDiGwUqIDpm+v59SmT4
	 z8NYxvJJc4tiZmr4/Xv9HOugRXmURITqaqEeC4fI1p9FRPMj52TJ4FGqLEmbjZKHLkEGp
	 WVqtEFqj202Hmwx92hAqBolcF0EOUXwUmL8J9ifmRD9J2Lud88reTpmhRgdmCmVB10w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="i/G5Lyfb";
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4488B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4488B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i/G5Lyfb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793399141; x=1824935141;
  h=date:from:to:cc:subject:message-id;
  bh=mX7o1WdmKKIjoux41HqbivKuN/Q90qQYfE+o+KMMPsM=;
  b=i/G5LyfbJY8XqVeVm4VOr3WGvliAl2cC880Ba9tfUxIOnstp7wPdBUK+
   K8SkdAvhCQcMl+sfNrutmQWMT5CaTd1mHfI+tBNdxXBMQ0uMNtA2UBEF4
   z8GSYsINdLNXCodzh5sBxxNt9uLoyzVGi8NQGuLOGeq3dP/YLAZXs9lMj
   YO/fZKkhTaGOE9Jmr9h8vZ/tZ8r1XtWqwtsXGJ9zv7H1X3KsWAnuglOJw
   tBrlfFpRI2S9h/N4AeE8D3Cyuh20GW6labWdjb7MCdGUEwHPtKJ1xHLqi
   UkcN31nFtGCrYfWgPewfoDuJ+RceDDNROMk69pZYrumjq3pmNJrwrRWFn
   Q==;
X-CSE-ConnectionGUID: lQynTqvsRseDCCtCNYt1MA==
X-CSE-MsgGUID: K2gcNSwFTy+ObGB4xdMaeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2176910"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2176910"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 15:25:40 -0700
X-CSE-ConnectionGUID: tMnPVB1NQvu3UhUWUyyWpw==
X-CSE-MsgGUID: h9uufwBzSmiTcI4yxb22qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5438301"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 30 Oct 2026 15:25:38 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMv2W-000000005jV-2b4D;
	Fri, 30 Oct 2026 22:25:36 +0000
Date: Fri, 30 Oct 2026 23:25:00 +0100
From: kernel test robot <lkp@intel.com>
To: Swarna Prabhu <sw.prabhu6@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Pankaj Raghav <p.raghav@samsung.com>
Subject: drivers/scsi/sd.c:4493:2-17: WARNING: NULL check before some
 freeing functions is not needed.
Message-ID: <202610302345.WFnRd62s-lkp@intel.com>
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
head:   abf8c33470f78e2226ee3dcdc69004660020ab47
commit: 7179e626b76eb42f2529c6f6dd6ba88ea2445372 scsi: sd: Enable sector size > PAGE_SIZE in SCSI sd driver
date:   8 months ago
config: loongarch-randconfig-r2103-20261029 (https://download.01.org/0day-ci/archive/20261030/202610302345.WFnRd62s-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7179e626b76e ("scsi: sd: Enable sector size > PAGE_SIZE in SCSI sd driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610302345.WFnRd62s-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/sd.c:4493:2-17: WARNING: NULL check before some freeing functions is not needed.

vim +4493 drivers/scsi/sd.c

  4478	
  4479	/**
  4480	 *	exit_sd - exit point for this driver (when it is a module).
  4481	 *
  4482	 *	Note: this function unregisters this driver from the scsi mid-level.
  4483	 **/
  4484	static void __exit exit_sd(void)
  4485	{
  4486		int i;
  4487	
  4488		SCSI_LOG_HLQUEUE(3, printk("exit_sd: exiting sd driver\n"));
  4489	
  4490		scsi_unregister_driver(&sd_template);
  4491		mempool_destroy(sd_page_pool);
  4492		if (sd_large_page_pool)
> 4493			mempool_destroy(sd_large_page_pool);
  4494	
  4495		class_unregister(&sd_disk_class);
  4496	
  4497		for (i = 0; i < SD_MAJORS; i++)
  4498			unregister_blkdev(sd_major(i), "sd");
  4499	}
  4500	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
