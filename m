Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8612545FFDE
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193472; cv=none; b=JXWaKbpsNQJ4r/nmZpPsGs5K11DKxN1veJYjCZBK6GvINWhid3BQhNe8yopCN5Vrbq3RmZ86fLxPU43IjOy+776J+QLf7evh5UaitaqzVbJR/nQIu+58wDMz5P3YPEsXiA0zhDEp4CIFsw3c6vuPvQi8sWz0mRWPcDTnpxlqeUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193472; c=relaxed/simple;
	bh=1U+akNFD1NSdekzYSGX1fQq0iw1c7ozCsSrNwbpQRGw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=svL+j414G0u3Ixxe4xz9r2PZheEynYtph++NfxZjo8lsNu40Sp4BqgjX0ZM3S2SQvpIJmxHEqQeGlPr0SiQ0EQdcCtztj1yRmdItT/KPV7cT7F2JIXsYOSB4eX/wm/J/a1CZaIqNf2jzyd5WdY6+oZkhWPI1e08yY5TGV62hc2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3A/c4nq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3A/c4nq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791193466; x=1822729466;
  h=date:from:to:cc:subject:message-id;
  bh=1U+akNFD1NSdekzYSGX1fQq0iw1c7ozCsSrNwbpQRGw=;
  b=H3A/c4nqbKAkg4spzqIvYn1H6468DzDElKTuCR5FYEuVxzTG6Ig0cDtR
   jAwXERpdyJcOEIp0HcyAXWG5zb3EE30MkeIDDD+QrU7TMWehKHt+x+nLZ
   +VzOw8a0SaLQ3efqL8ypKtcgV3gsn4xGUCURT4TgZc4HhwPshBa+Vkd3D
   fGOHw0A6bDcGU/q4f4N3U0t6qrk1q2k44MLx5xjRJTI2D4kX9B72Ky0/Y
   9ZoYSmPBAyCBxVNZYIDvWZHPIYEwpUi26axr0xh05INLed83wP4l0x7yd
   heDlN0Um3Yb2XimJ8jT3sDKrbuawpR5pI1df4S/jiwbHB1YzY48Z0dX5X
   w==;
X-CSE-ConnectionGUID: KqJesF9KR0y+Dr5qKtnd/w==
X-CSE-MsgGUID: D3lGMxoQTO6DReWBb4Cf8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91884094"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="91884094"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 02:44:17 -0700
X-CSE-ConnectionGUID: 7twUcTn+R3m+yF8YPigM8Q==
X-CSE-MsgGUID: 35UnMZgLRpuMb+fuP/tUxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="304726224"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 05 Oct 2026 02:44:16 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDfEz-0000000004r-38BL;
	Mon, 05 Oct 2026 09:44:13 +0000
Date: Mon, 05 Oct 2026 11:43:51 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Joerg Roedel <joerg.roedel@amd.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasant Hegde <vasant.hegde@amd.com>
Subject: include/linux/bitops.h:273:19: sparse: sparse: cast
 truncates bits from constant value (ffffffffff000 becomes fffff000)
Message-ID: <202610051147.aRijPI8c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
commit: aef5de756ea871ab44e3a1a87be6c944e6587c51 iommupt: Add the x86 64 bit page table format
date:   11 months ago
config: i386-randconfig-2300-20261005 (https://download.01.org/0day-ci/archive/20261005/202610051147.aRijPI8c-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051147.aRijPI8c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: aef5de756ea8 ("iommupt: Add the x86 64 bit page table format")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051147.aRijPI8c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_x86_64.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, drivers/iommu/generic_pt/fmt/iommu_template.h):
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)

vim +273 include/linux/bitops.h

c320592f3f2a1e6 Wolfram Sang       2025-01-07  261  
952043ac12a117d Steven Whitehouse  2009-04-23  262  /**
952043ac12a117d Steven Whitehouse  2009-04-23  263   * __ffs64 - find first set bit in a 64 bit word
952043ac12a117d Steven Whitehouse  2009-04-23  264   * @word: The 64 bit word
952043ac12a117d Steven Whitehouse  2009-04-23  265   *
4945cca232ce8bc Geert Uytterhoeven 2021-02-25  266   * On 64 bit arches this is a synonym for __ffs
952043ac12a117d Steven Whitehouse  2009-04-23  267   * The result is not defined if no bits are set, so check that @word
952043ac12a117d Steven Whitehouse  2009-04-23  268   * is non-zero before calling this.
952043ac12a117d Steven Whitehouse  2009-04-23  269   */
6606c8c7e818865 Kees Cook          2025-08-04  270  static inline __attribute_const__ unsigned int __ffs64(u64 word)
952043ac12a117d Steven Whitehouse  2009-04-23  271  {
952043ac12a117d Steven Whitehouse  2009-04-23  272  #if BITS_PER_LONG == 32
952043ac12a117d Steven Whitehouse  2009-04-23 @273  	if (((u32)word) == 0UL)
952043ac12a117d Steven Whitehouse  2009-04-23  274  		return __ffs((u32)(word >> 32)) + 32;
952043ac12a117d Steven Whitehouse  2009-04-23  275  #elif BITS_PER_LONG != 64
952043ac12a117d Steven Whitehouse  2009-04-23  276  #error BITS_PER_LONG not 32 or 64
952043ac12a117d Steven Whitehouse  2009-04-23  277  #endif
952043ac12a117d Steven Whitehouse  2009-04-23  278  	return __ffs((unsigned long)word);
952043ac12a117d Steven Whitehouse  2009-04-23  279  }
952043ac12a117d Steven Whitehouse  2009-04-23  280  

:::::: The code at line 273 was first introduced by commit
:::::: 952043ac12a117d8e94bddd9088338d7ad20ca7d bitops: Add __ffs64 bitop

:::::: TO: Steven Whitehouse <swhiteho@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
