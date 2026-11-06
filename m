Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793940132;
	b=gVTweyptxmq/pghx43+xRpaig+L+If3lGawjaUdXpZrtZwIQWMIgUd6UI1E0id4WN1j4
	 3gHCFPNWQGW8l2WKYeNkUP/0vX9tR/EKo7/CNxomOuYfF5GykNIcvHZYW/So+V6GJKFZu
	 DYI0F2rV9b0NhCb29R6bTTh4j9ISkry3/jhQBckNtAgDbyoTpMiJbnR3HQ0KfGAkFueK0
	 mmq1GdMWp/fSrDVraiBPgiphSv5hMnZCnMgOOkggjPuk3rd2mId9vAJ147c/WaB41eFQx
	 nB+MAMjhTD83gAg2z2ABxjHeVt8ve538Q+QjFicSnxLns3PvktErv3o85hNPQshce/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793940132;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=cH0k23uQ0R5ThMdjtKSKUDnfHUc+a7kfcJ8zCx6tF0M=;
	b=I6iGfWdKXn1Mm6JYb6ePBINzhuDUM0436DATuiOHsCjOC42hyC5XyF4z5hJR95agfQqX
	 ZzdmcKGLKQy8tmAeA11o+AigUekQYs2hvGqtDVkcJT5FCYQNK/aLla4fb1WC6qXz1PqwR
	 spIR8HJFLSgFa+2mbdt1Z86M/QVtDXR1Et9Cbddd21GNoMBZB1ZX6jaw9b10sw2RtrASJ
	 qBSf1/zkeNAyDOfN0oT6fdW0AornlhVEuP6houBwOvxpTq8BIEb8DM7p34L0akwm4qn1V
	 IjrW0/2GNav3eB8L4bNzG7ussKSWSDH1bzaF/zl57/Geu82wLlGnwrtklgUZ5jc1WRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SNPNMi4M;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4163E606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4163E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SNPNMi4M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793940131; x=1825476131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P89PlaK+/hvait3mFpoUo17/ifRpIJ9Cd+NQmTZRaj4=;
  b=SNPNMi4MIar3OGIZxDJVEc+wacEYMxOQ7ak8XcjopsdRhB+MnUzv4Gzz
   54Thj3sDlJAwMcOHR4/fNLqNKdqX3T78OoQTKAq9cYoQK8fu28vs4VxVx
   hj7jf8VVDmcJsfBQMpc2ZyMgkiDg/+vRf6o7Q7VBtS5USYSwuAFnCmmto
   gC9tvpbMT/k0iISOMGQVfuzAV1b6x/LLMi/hmYoOmmnUdUyg5gyKpLZU1
   mL6+rFEqu+GIRo5TyZlEMhqoBNvNiOaG0oJxlpuG6p9PGBV+MfYCaC3IO
   7sofhSc9lGBt1aQRndv69fT9X6zDBPYvRNaR3X+R+jJZRM7I/6vTNlcWR
   A==;
X-CSE-ConnectionGUID: jE7fkjj7RqanwtH3fwqoZQ==
X-CSE-MsgGUID: xriqGzvnRBWxtL3mUzcapg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2787851"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2787851"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 20:42:10 -0800
X-CSE-ConnectionGUID: CLdB014lRY+wouytS07x1g==
X-CSE-MsgGUID: IOKiHfd5Qm6pFMR3YJ0Tew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7335016"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2026 20:42:08 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPBmA-00000000A1h-2kCl;
	Fri, 06 Nov 2026 04:42:06 +0000
Date: Fri, 06 Nov 2026 05:41:38 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: drivers/gpu/drm/xe/xe_svm.c:1615:48-51: ERROR: Missing
 resource_size with res
Message-ID: <202611060555.alPmrU8P-lkp@intel.com>
User-Agent: s-nail v14.9.25
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f66469d9905b39d2c260a15d7d6db450f4db67c1
commit: 8a52f4d9b1efc90eb338b0d59912e640400b9c63 drm/xe: Use the drm_pagemap cache and shrinker
date:   11 months ago
config: loongarch-randconfig-r2105-20261104 (https://download.01.org/0day-ci/archive/20261106/202611060555.alPmrU8P-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e2e3d6c39cfebec9eace23629a5a103df2c79ba6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 8a52f4d9b1ef ("drm/xe: Use the drm_pagemap cache and shrinker")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060555.alPmrU8P-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_svm.c:1615:48-51: ERROR: Missing resource_size with res

vim +1615 drivers/gpu/drm/xe/xe_svm.c

  1563	
  1564	/**
  1565	 * xe_pagemap_create() - Create a struct xe_pagemap object
  1566	 * @xe: The xe device.
  1567	 * @vr: Back-pointer to the struct xe_vram_region.
  1568	 *
  1569	 * Allocate and initialize a struct xe_pagemap. On successful
  1570	 * return, drm_pagemap_put() on the embedded struct drm_pagemap
  1571	 * should be used to unreference.
  1572	 *
  1573	 * Return: Pointer to a struct xe_pagemap if successful. Error pointer
  1574	 * on failure.
  1575	 */
  1576	static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram_region *vr)
  1577	{
  1578		struct device *dev = xe->drm.dev;
  1579		struct xe_pagemap *xpagemap;
  1580		struct dev_pagemap *pagemap;
  1581		struct drm_pagemap *dpagemap;
  1582		struct resource *res;
  1583		void *addr;
  1584		int err;
  1585	
  1586		xpagemap = kzalloc(sizeof(*xpagemap), GFP_KERNEL);
  1587		if (!xpagemap)
  1588			return ERR_PTR(-ENOMEM);
  1589	
  1590		pagemap = &xpagemap->pagemap;
  1591		dpagemap = &xpagemap->dpagemap;
  1592		INIT_WORK(&xpagemap->destroy_work, xe_pagemap_destroy_work);
  1593		xpagemap->vr = vr;
  1594	
  1595		err = drm_pagemap_init(dpagemap, pagemap, &xe->drm, &xe_drm_pagemap_ops);
  1596		if (err)
  1597			goto out_no_dpagemap;
  1598	
  1599		res = devm_request_free_mem_region(dev, &iomem_resource,
  1600						   vr->usable_size);
  1601		if (IS_ERR(res)) {
  1602			err = PTR_ERR(res);
  1603			goto out_err;
  1604		}
  1605	
  1606		pagemap->type = MEMORY_DEVICE_PRIVATE;
  1607		pagemap->range.start = res->start;
  1608		pagemap->range.end = res->end;
  1609		pagemap->nr_range = 1;
  1610		pagemap->owner = xe_svm_devm_owner(xe);
  1611		pagemap->ops = drm_pagemap_pagemap_ops_get();
  1612		addr = devm_memremap_pages(dev, pagemap);
  1613		if (IS_ERR(addr)) {
  1614			err = PTR_ERR(addr);
> 1615			devm_release_mem_region(dev, res->start, res->end - res->start + 1);
  1616			goto out_err;
  1617		}
  1618		xpagemap->hpa_base = res->start;
  1619		return xpagemap;
  1620	
  1621	out_err:
  1622		drm_pagemap_put(dpagemap);
  1623		return ERR_PTR(err);
  1624	
  1625	out_no_dpagemap:
  1626		kfree(xpagemap);
  1627		return ERR_PTR(err);
  1628	}
  1629	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
