Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9E338DC69
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081375; cv=none; b=m1Ke6eQf/UbTYMh0ZUr1BPg5z5a/iXjnDxNWwYdy8CJ7dOKH5YLkdZoSZfUPQDzVT/BZl3E+8udwmQ4865LatTfHmhBdxwjZAmXjW/YevP30UfpeOAbwAOgiS97bAe3bXBLJ1NIhottHbeNApgadI1emsxwf0gxA8xzSqXBT9G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081375; c=relaxed/simple;
	bh=UiKCpNNDPxBiylH8SJQwwy71axpEE4hwP5Y0TH7qv68=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h2pQHlClfSLw1ywY2KE1XdPJl7X/8I/PW/m/F9rKnIvVCsytQyc11kNIoMY7mhqahWzveLaHTSLUyEbWwqt0YJ3TbrixxxUHBKexv6UWmjd+E3U7mfeiyMCN5SUdQsZi51xgEz3nSOrsNXJXK/gYyglaZR10xpWoCI1VjAGpw/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNQRA/L+; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNQRA/L+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790081375; x=1821617375;
  h=date:from:to:cc:subject:message-id;
  bh=UiKCpNNDPxBiylH8SJQwwy71axpEE4hwP5Y0TH7qv68=;
  b=DNQRA/L+LUYS5HcUiCr25WwXkTqGDwthujPSq5zRUgZjEh7lmTMFV3Tf
   AmX4UdBYNL+RAU+I61Va7BkzQv4hdh3ELnDG2OlHOfnn+JeEF7TkvDcwC
   rS/YAA4jUV1OK0FCZkmAvI4tBqaONCJmr0Drs7QQCWtUB7cndLZEUSabq
   kGd3byVIUlU/j+m/u5gbojV/hB/x+OIuSBXpAirgHYYJh/J8t2jdnZkvt
   Lagt8PM2MNAvRJ6sIv/qWxgtelAd8SShlmY7YrKF4XepzuAQuVnXPtpgA
   PPNdtjhYoTE8U7/2WAiPQn5H3Rta9zmId842U72hnTreBihZ6zo6W1JW3
   A==;
X-CSE-ConnectionGUID: y4G4ObR7SAuL07Rb8HbqUw==
X-CSE-MsgGUID: lEUs1WLDQ4eKbYreZj7alQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1181928"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1181928"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:49:26 -0700
X-CSE-ConnectionGUID: +J0CxiKnTCeaWtvYmC5hTQ==
X-CSE-MsgGUID: 8fgHG1OaRMuh1ZpHv8pTAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="273298061"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Sep 2026 05:49:24 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8zvx-00000000FVc-37au;
	Tue, 22 Sep 2026 12:49:17 +0000
Date: Tue, 22 Sep 2026 20:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Joerg Roedel <joerg.roedel@amd.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: include/linux/bitops.h:273:19: sparse: sparse: cast
 truncates bits from constant value (fffffffffff000 becomes fffff000)
Message-ID: <202609222053.KvZzOstg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: e71e00127110dedc6a9e746178282b4dac97ed96 iommupt: Add the RISC-V page table format
date:   6 months ago
config: arm-randconfig-r1309-20260922 (https://download.01.org/0day-ci/archive/20260922/202609222053.KvZzOstg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5dc57157f12f0ff676e823d9b4d98b45c07e5df2)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609222053.KvZzOstg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e71e00127110 ("iommupt: Add the RISC-V page table format")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609222053.KvZzOstg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_riscv64.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, drivers/iommu/generic_pt/fmt/iommu_template.h):
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:37: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:37: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)

vim +273 include/linux/bitops.h

c320592f3f2a1e Wolfram Sang       2025-01-07  261  
952043ac12a117 Steven Whitehouse  2009-04-23  262  /**
952043ac12a117 Steven Whitehouse  2009-04-23  263   * __ffs64 - find first set bit in a 64 bit word
952043ac12a117 Steven Whitehouse  2009-04-23  264   * @word: The 64 bit word
952043ac12a117 Steven Whitehouse  2009-04-23  265   *
4945cca232ce8b Geert Uytterhoeven 2021-02-25  266   * On 64 bit arches this is a synonym for __ffs
952043ac12a117 Steven Whitehouse  2009-04-23  267   * The result is not defined if no bits are set, so check that @word
952043ac12a117 Steven Whitehouse  2009-04-23  268   * is non-zero before calling this.
952043ac12a117 Steven Whitehouse  2009-04-23  269   */
6606c8c7e81886 Kees Cook          2025-08-04  270  static inline __attribute_const__ unsigned int __ffs64(u64 word)
952043ac12a117 Steven Whitehouse  2009-04-23  271  {
952043ac12a117 Steven Whitehouse  2009-04-23  272  #if BITS_PER_LONG == 32
952043ac12a117 Steven Whitehouse  2009-04-23 @273  	if (((u32)word) == 0UL)
952043ac12a117 Steven Whitehouse  2009-04-23  274  		return __ffs((u32)(word >> 32)) + 32;
952043ac12a117 Steven Whitehouse  2009-04-23  275  #elif BITS_PER_LONG != 64
952043ac12a117 Steven Whitehouse  2009-04-23  276  #error BITS_PER_LONG not 32 or 64
952043ac12a117 Steven Whitehouse  2009-04-23  277  #endif
952043ac12a117 Steven Whitehouse  2009-04-23  278  	return __ffs((unsigned long)word);
952043ac12a117 Steven Whitehouse  2009-04-23  279  }
952043ac12a117 Steven Whitehouse  2009-04-23  280  

:::::: The code at line 273 was first introduced by commit
:::::: 952043ac12a117d8e94bddd9088338d7ad20ca7d bitops: Add __ffs64 bitop

:::::: TO: Steven Whitehouse <swhiteho@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
