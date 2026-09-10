Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9143546CC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789079694; cv=none; b=IfUrtoPdCCR0hMKsU8KoaIMHqoe4GPqKoeqXYvS9e7ZCbnRo3uIoU3UtbAe/1vJSq3uI+tjYdrgMpEjfs4dlwEtWbAcMU+XvbZQ6M8HzJyYhs32TyT3UjOW+WDmoD6tfnnelyFTm5sonknrQd5z09sCjzEWm/XZ6/XUKX6L8S80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789079694; c=relaxed/simple;
	bh=7+m5N5xjVH9TONhsbTSYey7qwKa630jnY1TPVJH25X8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m5J8izoeVS1ha+d9uS9/ubiVRl+xCiP7pgcZwSXqmiXdV9tS/AWinnBPaDviN/VsHkLyH7dbF68dGDZB8p+1YAL90ZsF3eXvVlerofc/aL1uVYUBuwf2ZV3IuW9hzW1H0jugFScBw3MtzvQqE4KUGDcAThU+cxASeSQnz/bdEYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvOlR6Si; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvOlR6Si"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789079692; x=1820615692;
  h=date:from:to:cc:subject:message-id;
  bh=7+m5N5xjVH9TONhsbTSYey7qwKa630jnY1TPVJH25X8=;
  b=SvOlR6SiMp6GeHjaDAVACpfG1NhfMJLlqhDOpj3r/c0DmaIT9je8aUgW
   EPMVhSyiJBFEFBuj+afnibUcb6gGWxPAW6zRxVZ03iplS6s18R8zAPr4A
   OnKbqxhHYyZFANe/gZoQz0m6sXEajFP6yjKQj8HsIKuEWtGbto1wVdj2w
   T4k4+yWGWAd9LnyZncKdIq1BMVFFjG3XXat2Sj/UCxcDyHfiJokIkew0t
   a1qXLFU/bAatzXoUXXoTnGIpkDxcX5oQBOPla3Yk4ARrMCW5IQkxveSrJ
   eQzO4ycK52Wzlf8k/V3gyrt+CFPnhnXPEatTDzOUhcSZVL+U68Imbe3kO
   Q==;
X-CSE-ConnectionGUID: k5JPfTWzQY64Jadl59hoqQ==
X-CSE-MsgGUID: avVZ3Q6PRrKdjFRz0Kd0XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89572694"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89572694"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 15:34:52 -0700
X-CSE-ConnectionGUID: YrU8PXGHTxyVmmMJU6b6yA==
X-CSE-MsgGUID: mwO3Tn5WSD2qK2FR7KUwew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="268472879"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 10 Sep 2026 15:34:50 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4nLt-000000000cM-2uIa;
	Thu, 10 Sep 2026 22:34:43 +0000
Date: Fri, 11 Sep 2026 06:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: drivers/mmc/host/mxcmmc.c:545:24: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202609110632.72NLMuJo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Mikko,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: 7cd8db0fb0b2bf309163d56fec585c0f9e0964d1 mmc: add COMPILE_TEST to multiple drivers
date:   12 months ago
config: powerpc-randconfig-r132-20260910 (https://download.01.org/0day-ci/archive/20260911/202609110632.72NLMuJo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110632.72NLMuJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7cd8db0fb0b2 ("mmc: add COMPILE_TEST to multiple drivers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110632.72NLMuJo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mmc/host/mxcmmc.c:545:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/mmc/host/mxcmmc.c:545:24: sparse:     expected unsigned int [usertype]
   drivers/mmc/host/mxcmmc.c:545:24: sparse:     got restricted __le32 [usertype]
   drivers/mmc/host/mxcmmc.c:557:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] tmp @@     got restricted __le32 [usertype] @@
   drivers/mmc/host/mxcmmc.c:557:21: sparse:     expected unsigned int [usertype] tmp
   drivers/mmc/host/mxcmmc.c:557:21: sparse:     got restricted __le32 [usertype]
   drivers/mmc/host/mxcmmc.c:572:37: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/mmc/host/mxcmmc.c:572:37: sparse:     expected unsigned int [usertype] val
   drivers/mmc/host/mxcmmc.c:572:37: sparse:     got restricted __le32 [usertype]
   drivers/mmc/host/mxcmmc.c:585:37: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/mmc/host/mxcmmc.c:585:37: sparse:     expected unsigned int [usertype] val
   drivers/mmc/host/mxcmmc.c:585:37: sparse:     got restricted __le32 [usertype]

vim +545 drivers/mmc/host/mxcmmc.c

d96be879ff4697 Sascha Hauer       2009-01-06  535  
12658af54f2ed1 Linus Walleij      2024-01-27  536  static int mxcmci_pull(struct mxcmci_host *host, u32 *buf, int bytes)
d96be879ff4697 Sascha Hauer       2009-01-06  537  {
d96be879ff4697 Sascha Hauer       2009-01-06  538  	unsigned int stat;
d96be879ff4697 Sascha Hauer       2009-01-06  539  
d96be879ff4697 Sascha Hauer       2009-01-06  540  	while (bytes > 3) {
d96be879ff4697 Sascha Hauer       2009-01-06  541  		stat = mxcmci_poll_status(host,
d96be879ff4697 Sascha Hauer       2009-01-06  542  				STATUS_BUF_READ_RDY | STATUS_READ_OP_DONE);
d96be879ff4697 Sascha Hauer       2009-01-06  543  		if (stat)
d96be879ff4697 Sascha Hauer       2009-01-06  544  			return stat;
c7ceab02543f8a Anatolij Gustschin 2013-04-08 @545  		*buf++ = cpu_to_le32(mxcmci_readl(host, MMC_REG_BUFFER_ACCESS));
d96be879ff4697 Sascha Hauer       2009-01-06  546  		bytes -= 4;
d96be879ff4697 Sascha Hauer       2009-01-06  547  	}
d96be879ff4697 Sascha Hauer       2009-01-06  548  
d96be879ff4697 Sascha Hauer       2009-01-06  549  	if (bytes) {
d96be879ff4697 Sascha Hauer       2009-01-06  550  		u8 *b = (u8 *)buf;
d96be879ff4697 Sascha Hauer       2009-01-06  551  		u32 tmp;
d96be879ff4697 Sascha Hauer       2009-01-06  552  
d96be879ff4697 Sascha Hauer       2009-01-06  553  		stat = mxcmci_poll_status(host,
d96be879ff4697 Sascha Hauer       2009-01-06  554  				STATUS_BUF_READ_RDY | STATUS_READ_OP_DONE);
d96be879ff4697 Sascha Hauer       2009-01-06  555  		if (stat)
d96be879ff4697 Sascha Hauer       2009-01-06  556  			return stat;
c7ceab02543f8a Anatolij Gustschin 2013-04-08  557  		tmp = cpu_to_le32(mxcmci_readl(host, MMC_REG_BUFFER_ACCESS));
d96be879ff4697 Sascha Hauer       2009-01-06  558  		memcpy(b, &tmp, bytes);
d96be879ff4697 Sascha Hauer       2009-01-06  559  	}
d96be879ff4697 Sascha Hauer       2009-01-06  560  
d96be879ff4697 Sascha Hauer       2009-01-06  561  	return 0;
d96be879ff4697 Sascha Hauer       2009-01-06  562  }
d96be879ff4697 Sascha Hauer       2009-01-06  563  

:::::: The code at line 545 was first introduced by commit
:::::: c7ceab02543f8a03b4df3d4465b089c8117a5e09 mmc: mxcmmc: add mpc512x SDHC support

:::::: TO: Anatolij Gustschin <agust@denx.de>
:::::: CC: Chris Ball <cjb@laptop.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
