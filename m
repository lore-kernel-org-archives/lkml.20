Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1A954706D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790468619; cv=none; b=s8hYc0s/ryh0Cu5Ep/3iwrAC0iWsWbYqoHQ0hAkcAIrGcuJuMBFasxIhH8XSiZZhn6KNHh7gbxyW3wHUV58gDWe3mDmfCIO4ieVLex2MUQxWlwAtaBHXxGF7VHYhaT9S5wARtUoFd/LesKYAkPVN5LPcnntt4X2IrgBIWoTkhqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790468619; c=relaxed/simple;
	bh=mL5fXRFBekm9Pv9gIAnk7evSoKQGQY9tyN4XinWWk1A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j5/9nMKv4tQQwMAYzm2DoBwHTnW/o4ZJycLWrzTQga3Mpu2847LjlMv7pH8WDEE29B7W7ZZvd1MJqz2W5b8yuRXCk0g1uihsZ/dNX/ZsPYLo7mw7yrZqVhDf/chcSvXd/1N7Gx481YzIc7RJ5Mo32ZOOQwTwvbInJhv0k/ZktLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cq6tsAMG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cq6tsAMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790468617; x=1822004617;
  h=date:from:to:cc:subject:message-id;
  bh=mL5fXRFBekm9Pv9gIAnk7evSoKQGQY9tyN4XinWWk1A=;
  b=cq6tsAMG/6rSOPxZXEZ7h2MBPzdf5qI5+9ukxJCC9DUNpXnb1Tl+MGRQ
   bGmbHtAmtXMkQmEAQIjp+itVTQfjCse/LjbDMzqbjg2keNkbxRdFGNJ7/
   F9zmYr4v1nxB+u4SA40DtEn1X/ldll0UPZNVupjUlhjq+PqubQFVuH5QK
   tWhxUfpfzpWK/hFOI7pyXatm4fHyg9OlGgu15zcabJjk8V5YmatQ6tcEJ
   LplybFEEIuCgyYdP3//4pS5v8MiIJza4SnCShBMizkD2IKUEEkvKPNlx5
   KBh4sMg9qdQ8Kc5rZKGTYk6QdJpiW2cElcvmGKZNQ2Vv8DrR2yNtqU8VL
   w==;
X-CSE-ConnectionGUID: ZggdGLq8RwK8WibTIXuUsA==
X-CSE-MsgGUID: u1s7erTDQy2svJrGCDqIZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="116740913"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="116740913"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 17:23:37 -0700
X-CSE-ConnectionGUID: 69c5AcvwQiGsw4RGQ4e1zg==
X-CSE-MsgGUID: LF4wpcBcQdCr7RMmS+UmNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="300956306"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Sep 2026 17:23:35 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAcfz-000000000IB-1Dzg;
	Sun, 27 Sep 2026 00:23:31 +0000
Date: Sun, 27 Sep 2026 02:23:04 +0200
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: drivers/dma/fsl_raid.c:116:17: sparse: sparse: incorrect
 type in argument 1 (different base types)
Message-ID: <202609270216.QNnFJc1u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd179f8a05be3ccae366b9b96e176b51fbe54aab
commit: 68b7fbc235290937e4e2daa097896b6b94618f15 dma: fsl_raid: keep MMIO bases as void __iomem and cast at access
date:   2 months ago
config: powerpc-randconfig-r2305-20260926 (https://download.01.org/0day-ci/archive/20260927/202609270216.QNnFJc1u-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609270216.QNnFJc1u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 68b7fbc23529 ("dma: fsl_raid: keep MMIO bases as void __iomem and cast at access")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270216.QNnFJc1u-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/fsl_raid.c:116:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:116:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/dma/fsl_raid.c:116:17: sparse:     got restricted __be32 [noderef] __iomem *
>> drivers/dma/fsl_raid.c:130:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:130:34: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/dma/fsl_raid.c:130:34: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/dma/fsl_raid.c:170:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:170:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/dma/fsl_raid.c:170:17: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/dma/fsl_raid.c:195:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:195:34: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/dma/fsl_raid.c:195:34: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/dma/fsl_raid.c:209:36: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:209:36: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/dma/fsl_raid.c:209:36: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/dma/fsl_raid.c:219:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:219:42: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/dma/fsl_raid.c:219:42: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/dma/fsl_raid.c:225:26: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:225:26: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/dma/fsl_raid.c:225:26: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/dma/fsl_raid.c:338:18: sparse: sparse: incompatible types for operation (<=):
   drivers/dma/fsl_raid.c:338:18: sparse:    struct fsl_re_desc *[assigned] desc
   drivers/dma/fsl_raid.c:338:18: sparse:    int
   drivers/dma/fsl_raid.c:462:18: sparse: sparse: incompatible types for operation (<=):
   drivers/dma/fsl_raid.c:462:18: sparse:    struct fsl_re_desc *[assigned] desc
   drivers/dma/fsl_raid.c:462:18: sparse:    int
   drivers/dma/fsl_raid.c:546:18: sparse: sparse: incompatible types for operation (<=):
   drivers/dma/fsl_raid.c:546:18: sparse:    struct fsl_re_desc *[assigned] desc
   drivers/dma/fsl_raid.c:546:18: sparse:    int
   drivers/dma/fsl_raid.c:711:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:713:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:715:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:717:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:719:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:721:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:725:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:728:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:734:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:773:19: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:776:19: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:778:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:778:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:778:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@

vim +116 drivers/dma/fsl_raid.c

ad80da658bbcaa Xuelin Shi 2015-03-03  104  
ad80da658bbcaa Xuelin Shi 2015-03-03  105  /* Copy descriptor from per chan software queue into hardware job ring */
ad80da658bbcaa Xuelin Shi 2015-03-03  106  static void fsl_re_issue_pending(struct dma_chan *chan)
ad80da658bbcaa Xuelin Shi 2015-03-03  107  {
ad80da658bbcaa Xuelin Shi 2015-03-03  108  	struct fsl_re_chan *re_chan;
ad80da658bbcaa Xuelin Shi 2015-03-03  109  	int avail;
ad80da658bbcaa Xuelin Shi 2015-03-03  110  	struct fsl_re_desc *desc, *_desc;
ad80da658bbcaa Xuelin Shi 2015-03-03  111  	unsigned long flags;
ad80da658bbcaa Xuelin Shi 2015-03-03  112  
ad80da658bbcaa Xuelin Shi 2015-03-03  113  	re_chan = container_of(chan, struct fsl_re_chan, chan);
ad80da658bbcaa Xuelin Shi 2015-03-03  114  
ad80da658bbcaa Xuelin Shi 2015-03-03  115  	spin_lock_irqsave(&re_chan->desc_lock, flags);
ad80da658bbcaa Xuelin Shi 2015-03-03 @116  	avail = FSL_RE_SLOT_AVAIL(
ad80da658bbcaa Xuelin Shi 2015-03-03  117  		in_be32(&re_chan->jrregs->inbring_slot_avail));
ad80da658bbcaa Xuelin Shi 2015-03-03  118  
ad80da658bbcaa Xuelin Shi 2015-03-03  119  	list_for_each_entry_safe(desc, _desc, &re_chan->submit_q, node) {
ad80da658bbcaa Xuelin Shi 2015-03-03  120  		if (!avail)
ad80da658bbcaa Xuelin Shi 2015-03-03  121  			break;
ad80da658bbcaa Xuelin Shi 2015-03-03  122  
ad80da658bbcaa Xuelin Shi 2015-03-03  123  		list_move_tail(&desc->node, &re_chan->active_q);
ad80da658bbcaa Xuelin Shi 2015-03-03  124  
ad80da658bbcaa Xuelin Shi 2015-03-03  125  		memcpy(&re_chan->inb_ring_virt_addr[re_chan->inb_count],
ad80da658bbcaa Xuelin Shi 2015-03-03  126  		       &desc->hwdesc, sizeof(struct fsl_re_hw_desc));
ad80da658bbcaa Xuelin Shi 2015-03-03  127  
ad80da658bbcaa Xuelin Shi 2015-03-03  128  		re_chan->inb_count = (re_chan->inb_count + 1) &
ad80da658bbcaa Xuelin Shi 2015-03-03  129  						FSL_RE_RING_SIZE_MASK;
ad80da658bbcaa Xuelin Shi 2015-03-03 @130  		out_be32(&re_chan->jrregs->inbring_add_job, FSL_RE_ADD_JOB(1));
ad80da658bbcaa Xuelin Shi 2015-03-03  131  		avail--;
ad80da658bbcaa Xuelin Shi 2015-03-03  132  	}
ad80da658bbcaa Xuelin Shi 2015-03-03  133  	spin_unlock_irqrestore(&re_chan->desc_lock, flags);
ad80da658bbcaa Xuelin Shi 2015-03-03  134  }
ad80da658bbcaa Xuelin Shi 2015-03-03  135  

:::::: The code at line 116 was first introduced by commit
:::::: ad80da658bbcaaac1d3617ea6cb0f4d5e16da422 dmaengine: Driver support for FSL RaidEngine device.

:::::: TO: Xuelin Shi <xuelin.shi@freescale.com>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
