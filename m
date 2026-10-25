Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792902885;
	b=li5nBGA6dvLaE8QWZ/cQIyhuk+4XFZStJVHGhANyHNzQc1kkKq8n2FDoAWHjkP61GnIX
	 oPtLHh8OsTy89xuhlqYTj+ZVhM8lwW3l8w8p5yAl46QJxMtYZSWR35zs8ixF5WI2z0PjD
	 FKhRRMzDo7QhYFqzcfnzwuegwM6FaOKy8Dcmt8CkZTKMh+S+nmLSgUxH27OcUPBI5rxOo
	 yIe2nORYFaOxo5lM9SWQToH9oKMIuPSJ6KeEr4SncFTI48yTRvGYZLl7BXSJY5PrJFiSH
	 MwYa7JtXfZdAXtvNYc6EPZOuAs88wi2cpcHCPy1l5cIxSFwYpnuZIDNQoZ1YPYtAJWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792902885;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=k8SxkW6hRm+hHFvtY9ZhGLiYVcCyFDMDpCnD8iFs6TQ=;
	b=EIa0cEm2TtKk9Pes8JG8Q+ErMS0ReR+UOUkWh4LOKAlML85KrdF7FxOehUJz1v0mdd31
	 ornQTFu9UpE01nmvkf8i8kRx2376VIfEdnDyV7ZqQHmG+Clf6b4G4j0NHu/EA/Nm8or9Y
	 u/mfyV6GLXuSu67SZODN4La3lC1wsdFy5xgm5U5iNGAKprV6K1GVbI3JYtPc4HNVFiWhi
	 wmjenBSwx2T3hZqLLRqHFOWr4ukXMtvpAiMcB/xk7wseSqOI2NvaTTgXKuERexzrOs2mL
	 vXC+OUNb4w2PkAHVpY+qxi5UdDnoqlwlkuNY7cLJ7s9O5HqUxX/T0MVj+WmOTioA95g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fm9uYAlI;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E1E606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2E1E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fm9uYAlI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792902884; x=1824438884;
  h=date:from:to:cc:subject:message-id;
  bh=3f2O6UkxexmrB9uni7V5HMLlFbjEcylEuVvuGpnI9Gc=;
  b=fm9uYAlIcGpbTCZU+UiIc1paNk2HKGETD9MMtcEKATG6OV1d9oJavgXi
   a/pjy3u9de90z0aQLASaGebyIjlnOMU0hglEOLdd4ljwTqvM8KeU4lsib
   UnZLzxoikz3MnoXqdXxZDR4DyakfOlQm75gze2qzU8WLlyZfZ/oPOTOOC
   cnAHIIrUWLc8YhdtfwkazqjtWXHNeYGZ85X0wUK6I4ds/5EUcgKY/FjDm
   vB0EdKFqv1Q+0SQlKrgZ0ygskP9P9iGFd6MRZqum7rpsoc8ukLXyVsW7h
   3b46Qhxp3fKNJ4M/NuRGFm6W9/3Q+pWMGaQBFbRk/NduUnJ1TyBD45EC7
   A==;
X-CSE-ConnectionGUID: lMkIorohQam39fUrani0fw==
X-CSE-MsgGUID: wVUXMPd+TiSqcWd398ZhMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1474762"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1474762"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 21:34:44 -0700
X-CSE-ConnectionGUID: KPzy1wh8RS2mTA71ev94nw==
X-CSE-MsgGUID: OrW+qSmbTNWiW2Zt2rPzwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="4327133"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 24 Oct 2026 21:34:43 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKpwO-000000003cV-0RB6;
	Sun, 25 Oct 2026 04:34:40 +0000
Date: Sun, 25 Oct 2026 05:33:48 +0100
From: kernel test robot <lkp@intel.com>
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
Subject: drivers/net/ethernet/meta/mpnic/mpnic_txrx.c:273:48:
 warning: '%u' directive output may be truncated writing between 1 and 10
 bytes into a region of size between 6 and 21
Message-ID: <202610250507.qjcLBj0W-lkp@intel.com>
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
head:   330517c63aa9b48227b6ab45f01003effac77ae4
commit: 3d4e4ad43aa455353067cf004d0618009ac39205 eth: mpnic: implement Tx queue allocation and cleanup
date:   4 weeks ago
config: arm64-randconfig-r2301-20261025 (https://download.01.org/0day-ci/archive/20261025/202610250507.qjcLBj0W-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610250507.qjcLBj0W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3d4e4ad43aa4 ("eth: mpnic: implement Tx queue allocation and cleanup")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610250507.qjcLBj0W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/meta/mpnic/mpnic_txrx.c: In function 'mpnic_alloc_napi_vectors':
>> drivers/net/ethernet/meta/mpnic/mpnic_txrx.c:273:48: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size between 6 and 21 [-Wformat-truncation=]
     snprintf(nv->name, sizeof(nv->name), "%s-TxRx-%u",
                                                   ^~
   drivers/net/ethernet/meta/mpnic/mpnic_txrx.c:273:39: note: directive argument in the range [0, 4294967294]
     snprintf(nv->name, sizeof(nv->name), "%s-TxRx-%u",
                                          ^~~~~~~~~~~~
   drivers/net/ethernet/meta/mpnic/mpnic_txrx.c:273:2: note: 'snprintf' output between 8 and 32 bytes into a destination of size 27
     snprintf(nv->name, sizeof(nv->name), "%s-TxRx-%u",
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       mpn->netdev->name, idx);
       ~~~~~~~~~~~~~~~~~~~~~~~


vim +273 drivers/net/ethernet/meta/mpnic/mpnic_txrx.c

   244	
   245	static int mpnic_alloc_napi_vector(struct mpnic_dev *mpd,
   246					   struct mpnic_net *mpn, unsigned int idx)
   247	{
   248		u32 __iomem *uc_addr = READ_ONCE(mpd->uc_addr0);
   249		struct mpnic_napi_vector *nv;
   250		int err;
   251	
   252		/* Doorbells are plain pointers into the register window, they have
   253		 * no way of noticing that it went away.
   254		 */
   255		if (!uc_addr)
   256			return -EIO;
   257	
   258		nv = kzalloc_flex(*nv, qt, 1);
   259		if (!nv)
   260			return -ENOMEM;
   261	
   262		nv->txt_count = 1;
   263		nv->mpd = mpd;
   264		nv->dev = mpd->dev;
   265		nv->v_idx = idx + MPNIC_NON_NAPI_VECTORS;
   266	
   267		mpn->napi[idx] = nv;
   268		netif_napi_add_config_locked(mpn->netdev, &nv->napi, mpnic_poll, idx);
   269		netif_napi_set_irq_locked(&nv->napi,
   270					  pci_irq_vector(to_pci_dev(mpd->dev),
   271							 nv->v_idx));
   272	
 > 273		snprintf(nv->name, sizeof(nv->name), "%s-TxRx-%u",
   274			 mpn->netdev->name, idx);
   275	
   276		err = mpnic_request_irq(mpd, nv->v_idx, mpnic_msix_clean_rings, 0,
   277					nv->name, nv);
   278		if (err)
   279			goto err_napi_del;
   280	
   281		mpnic_ring_init(&nv->qt[0].sub0, &uc_addr[MPNIC_TWQ_TAIL(idx, 0)], idx);
   282		mpnic_ring_init(&nv->qt[0].cmpl, &uc_addr[MPNIC_TCQ_HEAD(idx)], idx);
   283		mpn->tx[idx] = &nv->qt[0].sub0;
   284	
   285		return 0;
   286	
   287	err_napi_del:
   288		netif_napi_del_locked(&nv->napi);
   289		mpn->napi[idx] = NULL;
   290		kfree(nv);
   291		return err;
   292	}
   293	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
