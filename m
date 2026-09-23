Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A163932D1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131547; cv=none; b=Yru/OH8BO/3LbdCt2yX9Xqpj8hfNSQRMFfd4YQwDVIKPCOs4AcvGTZjyJY5VE6X3Wp49TT1wBstSdUKa3Quz6e0MVA34YPOTLbrmCqx+Z5XcPHS5exCOOvTdwmMrBmglXodJ0PLNNsECTgeTVcTCgEkwvW4gX56ICEKsjMTAnIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131547; c=relaxed/simple;
	bh=VB2sm3BJX28kmZNcy4GN9OrMANnr3pFTUCkQwngc07g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YKNkv+Ie4GEOUDCZv3Q3cLBubZsp3p19Y8X0c19LzRwe1xLt6yRW85DL2nd53+OIY7JXqFPiJ/5xTbkaBD0wwltL3O2Uxa6zczZ4+NBJzOYkwS2DEFJSw8G9bhn0KXwHn0Uj2vG+L0xP+qAYpmrgYV9oFTR/A5i2yvFfMUhk6hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvGSvnfd; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvGSvnfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790131542; x=1821667542;
  h=date:from:to:cc:subject:message-id;
  bh=VB2sm3BJX28kmZNcy4GN9OrMANnr3pFTUCkQwngc07g=;
  b=FvGSvnfdOl6LCqOqkzIApwbrcfSWhJJnB0TU2CsDvYpccPcY7CZx7X7C
   4ZhlrAJv1dnvQ+WxDDQ0o+Y1Ir6Ms2sraFpYttv4s4UwTWbZTfc/91yF1
   K1qcn38TuCUjC3QTeagr6hvhpRJ1KF5OMuujUxk5W1FXdfn7XLdr5H/G1
   8P8ysFvbuauFoUrvHCzBngGw74yHx92ZpHBWkieQXDYolr5pcjQ4aGUno
   RbdGdH4VcYrTtYWTjSWn7GNZXD/KRBAlQnnHKWMAdXqVG1x8jSFJv7VEe
   xjz12LIWLhpMvY+6XQF+BdUq3aZKKZrbc27FZc+qo1NSDTf/nYS+/ceMt
   A==;
X-CSE-ConnectionGUID: RVNQRSC0RlmHlmvMpILJcQ==
X-CSE-MsgGUID: nHCP1dYNRdGYe+SnAas7RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1300362"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="1300362"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 19:45:38 -0700
X-CSE-ConnectionGUID: PXUab6xIR+CcpC/ntomfwQ==
X-CSE-MsgGUID: ko7eKGFFS5Cp9ar9VQRXaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="4425921"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 22 Sep 2026 19:45:36 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Cz6-000000000RD-21XK;
	Wed, 23 Sep 2026 02:45:24 +0000
Date: Wed, 23 Sep 2026 04:45:20 +0200
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>
Subject: mm/zswap.c:58:12: warning: variable 'zswap_pool_limit_hit'
 set but not used
Message-ID: <202609230402.t5SIdVPp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: f5caeb3689ea2d8a8c0790d9eea68b63e8f15496 xfs: XFS_ONLINE_SCRUB_STATS should depend on DEBUG_FS
date:   11 months ago
config: sparc64-randconfig-r2107-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230402.t5SIdVPp-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 4b99afb361a8cfd45fc17aebc637688661e9e472)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230402.t5SIdVPp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f5caeb3689ea ("xfs: XFS_ONLINE_SCRUB_STATS should depend on DEBUG_FS")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230402.t5SIdVPp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/zswap.c:58:12: warning: variable 'zswap_pool_limit_hit' set but not used [-Wunused-but-set-global]
      58 | static u64 zswap_pool_limit_hit;
         |            ^
>> mm/zswap.c:60:12: warning: variable 'zswap_written_back_pages' set but not used [-Wunused-but-set-global]
      60 | static u64 zswap_written_back_pages;
         |            ^
>> mm/zswap.c:62:12: warning: variable 'zswap_reject_reclaim_fail' set but not used [-Wunused-but-set-global]
      62 | static u64 zswap_reject_reclaim_fail;
         |            ^
>> mm/zswap.c:64:12: warning: variable 'zswap_reject_compress_fail' set but not used [-Wunused-but-set-global]
      64 | static u64 zswap_reject_compress_fail;
         |            ^
>> mm/zswap.c:66:12: warning: variable 'zswap_reject_compress_poor' set but not used [-Wunused-but-set-global]
      66 | static u64 zswap_reject_compress_poor;
         |            ^
>> mm/zswap.c:68:12: warning: variable 'zswap_decompress_fail' set but not used [-Wunused-but-set-global]
      68 | static u64 zswap_decompress_fail;
         |            ^
>> mm/zswap.c:70:12: warning: variable 'zswap_reject_alloc_fail' set but not used [-Wunused-but-set-global]
      70 | static u64 zswap_reject_alloc_fail;
         |            ^
>> mm/zswap.c:72:12: warning: variable 'zswap_reject_kmemcache_fail' set but not used [-Wunused-but-set-global]
      72 | static u64 zswap_reject_kmemcache_fail;
         |            ^
   8 warnings generated.


vim +/zswap_pool_limit_hit +58 mm/zswap.c

2b2811178e8555 Seth Jennings 2013-07-10  56  
2b2811178e8555 Seth Jennings 2013-07-10  57  /* Pool limit was hit (see zswap_max_pool_percent) */
2b2811178e8555 Seth Jennings 2013-07-10 @58  static u64 zswap_pool_limit_hit;
2b2811178e8555 Seth Jennings 2013-07-10  59  /* Pages written back when pool limit was reached */
2b2811178e8555 Seth Jennings 2013-07-10 @60  static u64 zswap_written_back_pages;
2b2811178e8555 Seth Jennings 2013-07-10  61  /* Store failed due to a reclaim failure after pool limit was reached */
2b2811178e8555 Seth Jennings 2013-07-10 @62  static u64 zswap_reject_reclaim_fail;
cb61dad80fdc6a Nhat Pham     2023-10-24  63  /* Store failed due to compression algorithm failure */
cb61dad80fdc6a Nhat Pham     2023-10-24 @64  static u64 zswap_reject_compress_fail;
2b2811178e8555 Seth Jennings 2013-07-10  65  /* Compressed page was too big for the allocator to (optimally) store */
2b2811178e8555 Seth Jennings 2013-07-10 @66  static u64 zswap_reject_compress_poor;
ff22f9299d7b2c Nhat Pham     2025-03-06  67  /* Load or writeback failed due to decompression failure */
ff22f9299d7b2c Nhat Pham     2025-03-06 @68  static u64 zswap_decompress_fail;
2b2811178e8555 Seth Jennings 2013-07-10  69  /* Store failed because underlying allocator could not get memory */
2b2811178e8555 Seth Jennings 2013-07-10 @70  static u64 zswap_reject_alloc_fail;
2b2811178e8555 Seth Jennings 2013-07-10  71  /* Store failed because the entry metadata could not be allocated (rare) */
2b2811178e8555 Seth Jennings 2013-07-10 @72  static u64 zswap_reject_kmemcache_fail;
2b2811178e8555 Seth Jennings 2013-07-10  73  

:::::: The code at line 58 was first introduced by commit
:::::: 2b2811178e85553405b86e3fe78357b9b95889ce zswap: add to mm/

:::::: TO: Seth Jennings <sjenning@linux.vnet.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
