Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E2E541459
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080581; cv=none; b=hcE3fkrF4byfVLRWFsu3xLBO8tWfeoRMD0Okz+CfECjfi3lklVD67NWdog108CX4vb5Tmb6ooDFLb5MAySj8e2Z0rkWVd9mZnySg1ozxY6GZet8rgGVwZ0kVAzUrFKqRQES4O2wQ5pq/xm9sEFwvVqjt13v3qO9omZuztg29pzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080581; c=relaxed/simple;
	bh=GoGkE5EBBcF0xNkn44j81SKlA+0e0NfoylLHnBMjWV4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S4ZKyRfa9iG2hqVMLTUnfv9wNIM1H4VSXz4upNsGtH3nDHPfvyavCb0JkUH0HOylrwb03E5seQ6yww3lSIN8sjKMev0zsjeDXn+0hyIGubhmM4kAsFel4SzLxEiae3/lv+wg+1Ejrh0d9T4CK2yvdRSjmB91hcZ8kn+yzSvjPpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/4mHOHs; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/4mHOHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790080578; x=1821616578;
  h=date:from:to:cc:subject:message-id;
  bh=GoGkE5EBBcF0xNkn44j81SKlA+0e0NfoylLHnBMjWV4=;
  b=W/4mHOHs1xN6MvMWn6tyHD+hbudl+YsdkVj7cSu0bYaqjHXAQniMptW0
   rB4SZc/s9do9A9267V/E3I+6eS2X30Z+Mo+lOrlt8Rdxzi2QLEOzgd6Nj
   ky5WQU4g6b4Fd8D3TLY2qWDhQzLn3Daz3v3qB0e4EWFOYZE4m9nLgvUku
   nSkamVec7FqC25DZjXL9TroPfy0fAlw+hx00cPfchREM+jGVwcWB8ZQUT
   i1mMtwKRecqB3j5jPHcEQVe6FSXFtACwkeWae/EI+q6TFcA2/ObYCr3Oh
   pf84t+nm7nG/xegAsY7+1FkCNlq7/zBM1wsQo9nlGVvfOpFNoR5OxwMzu
   w==;
X-CSE-ConnectionGUID: BRkQAtWzRMSCE1V7PNGHaQ==
X-CSE-MsgGUID: iiz3bwkKRh+BRY8OK2j+Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1186022"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1186022"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:36:18 -0700
X-CSE-ConnectionGUID: DAFzLh9JS5ifA1zLBMTK0A==
X-CSE-MsgGUID: oxCaRQBKTBClQ4vug5w94w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="269628019"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Sep 2026 05:36:15 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8zjJ-00000000FUc-0hV0;
	Tue, 22 Sep 2026 12:36:13 +0000
Date: Tue, 22 Sep 2026 20:36:07 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Christoph Hellwig <hch@lst.de>
Subject: arch/nios2/include/asm/checksum.h:30:24: sparse: sparse:
 restricted __wsum degrades to integer
Message-ID: <202609222053.5gjiJjtb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 203247c5cb972af5d46bdb7d41ef40078048810b blk-integrity: support arbitrary buffer alignment
date:   6 months ago
config: nios2-randconfig-r1305-20260922 (https://download.01.org/0day-ci/archive/20260922/202609222053.5gjiJjtb-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609222053.5gjiJjtb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 203247c5cb97 ("blk-integrity: support arbitrary buffer alignment")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609222053.5gjiJjtb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/t10-pi.c: note: in included file (through include/net/checksum.h):
>> arch/nios2/include/asm/checksum.h:30:24: sparse: sparse: restricted __wsum degrades to integer
   block/t10-pi.c: note: in included file (through include/uapi/linux/swab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, ...):
   arch/nios2/include/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini

vim +30 arch/nios2/include/asm/checksum.h

eea9507a69d637 Ley Foon Tan 2014-11-06  17  
eea9507a69d637 Ley Foon Tan 2014-11-06  18  /*
eea9507a69d637 Ley Foon Tan 2014-11-06  19   * Fold a partial checksum
eea9507a69d637 Ley Foon Tan 2014-11-06  20   */
eea9507a69d637 Ley Foon Tan 2014-11-06  21  static inline __sum16 csum_fold(__wsum sum)
eea9507a69d637 Ley Foon Tan 2014-11-06  22  {
eea9507a69d637 Ley Foon Tan 2014-11-06  23  	__asm__ __volatile__(
eea9507a69d637 Ley Foon Tan 2014-11-06  24  		"add	%0, %1, %0\n"
eea9507a69d637 Ley Foon Tan 2014-11-06  25  		"cmpltu	r8, %0, %1\n"
eea9507a69d637 Ley Foon Tan 2014-11-06  26  		"srli	%0, %0, 16\n"
eea9507a69d637 Ley Foon Tan 2014-11-06  27  		"add	%0, %0, r8\n"
eea9507a69d637 Ley Foon Tan 2014-11-06  28  		"nor	%0, %0, %0\n"
eea9507a69d637 Ley Foon Tan 2014-11-06  29  		: "=r" (sum)
eea9507a69d637 Ley Foon Tan 2014-11-06 @30  		: "r" (sum << 16), "0" (sum)
eea9507a69d637 Ley Foon Tan 2014-11-06  31  		: "r8");
eea9507a69d637 Ley Foon Tan 2014-11-06  32  	return (__force __sum16) sum;
eea9507a69d637 Ley Foon Tan 2014-11-06  33  }
eea9507a69d637 Ley Foon Tan 2014-11-06  34  

:::::: The code at line 30 was first introduced by commit
:::::: eea9507a69d637d52705de8703b168bf6bfe5643 nios2: Library functions

:::::: TO: Ley Foon Tan <lftan@altera.com>
:::::: CC: Ley Foon Tan <lftan@altera.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
