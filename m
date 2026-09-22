Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718733EE1FD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077369; cv=none; b=upLmoMFGSmOovce95we9CCQftHanmYc7h5WKeBTr4cBvCMJYUdurUuuR8DzSUceWY/W5Xzbe2mI9C1hhGk/L1GsoSl98zIPnu/DF0gxOW5esJP6sB3xuDlyGL/J2Q7tsX+MYyEhWD0yk+qiB+wjT0QPZpq05/Z0kqlZdXfwWSKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077369; c=relaxed/simple;
	bh=If2//bBg4Ck30Qad0DQaZirlbW9ps4w+4UXx5K8A7vk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h2QaLTmrwO3ZkvnRwmolNiyYwjuGlrdC51MM/nxUfFWzswFywqIKE32DwZ/kPZlbQDUk6iHvDmrlwNuv3nfjOkQl9euKTQ1Z7Wqtcd10YQZEfP7Fm89dbr5Xl4lnym/Vs32oKLXxd6d3RwyJu/jLwgn73QmvOpnNukKbXn1oOFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cW1lHQ1r; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cW1lHQ1r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790077369; x=1821613369;
  h=date:from:to:cc:subject:message-id;
  bh=If2//bBg4Ck30Qad0DQaZirlbW9ps4w+4UXx5K8A7vk=;
  b=cW1lHQ1rIj/5CDm9wVTj70/U/innxfZ8I9lvX0tzFAtEbf063j1Zza4B
   d39zPLmxWEnrUL+oXmPsB1z6ALnjnKVcrBL1uBUKj+XjDVmj//WxUzxle
   v+Pp+eq/LV0rAIWt96v+2kOH7Ltgn3RjtzZAsxKlK2nTHkjGRKJPLF+ox
   Gbnh0dX/1QKBzq/XgsRhFa65rmmmjLwnaDCg7ONrFb3DfsgKEBpH58B4K
   WxM5E2KxL7cB3unlBk01A2FybjJdsmz1i15UHw0/BaBooPJJRxvaQGCB6
   WUtRiMAdujil07AeY0Ghu2W27BS5pKwE57sYRd1P1NwtR2pjJXuEQbN6y
   Q==;
X-CSE-ConnectionGUID: 7elhsm/KRo2rkW3Hxj/5OA==
X-CSE-MsgGUID: ckNY6hmpRKq4vvklujGr+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90539907"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="90539907"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 04:42:48 -0700
X-CSE-ConnectionGUID: q4BLRODcS/mulB/PYIqGyQ==
X-CSE-MsgGUID: DsZVp2nSSna8NwS8233DiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="269613117"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Sep 2026 04:42:46 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8ytX-00000000FRG-2Vmn;
	Tue, 22 Sep 2026 11:42:43 +0000
Date: Tue, 22 Sep 2026 19:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Bin <yebin10@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Theodore Ts'o" <tytso@mit.edu>, Jan Kara <jack@suse.cz>
Subject: fs/ext4/extents-test.c:59:3: sparse: sparse: symbol 'k_ctx'
 was not declared. Should it be static?
Message-ID: <202609221900.Pgwrcp41-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 9e1b14320b154094bb2c1bee6d8c6cb851fc3215 ext4: fix extents-test.c is not compiled when EXT4_KUNIT_TESTS=M
date:   6 months ago
config: x86_64-randconfig-1300-20260922 (https://download.01.org/0day-ci/archive/20260922/202609221900.Pgwrcp41-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221900.Pgwrcp41-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9e1b14320b15 ("ext4: fix extents-test.c is not compiled when EXT4_KUNIT_TESTS=M")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221900.Pgwrcp41-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ext4/extents-test.c:59:3: sparse: sparse: symbol 'k_ctx' was not declared. Should it be static?

vim +/k_ctx +59 fs/ext4/extents-test.c

cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  49  
cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  50  struct kunit_ctx {
cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  51  	/*
cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  52  	 * Ext4 inode which has only 1 unwrit extent
cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  53  	 */
cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  54  	struct ext4_inode_info *k_ei;
cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  55  	/*
cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  56  	 * Represents the underlying data area (used for zeroout testing)
cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  57  	 */
cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  58  	char *k_data;
cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23 @59  } k_ctx;
cb1e0c1d1fad5b Ojaswin Mujoo 2026-01-23  60  

:::::: The code at line 59 was first introduced by commit
:::::: cb1e0c1d1fad5bfad90d80c74ebdb53796d8a2db ext4: kunit tests for extent splitting and conversion

:::::: TO: Ojaswin Mujoo <ojaswin@linux.ibm.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
