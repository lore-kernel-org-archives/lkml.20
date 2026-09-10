Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006E84718CA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076355; cv=none; b=cWaDbKQ0dbAhgeJJiukoHK+vDa+hRVac214qJIxFdNdX1L5NjvunGXZ65yJ5oBsH9/j2183o5t5lnXPxDNElIgyauUGNpP3SSZLJxzbB0CrpvvDrFdJ83EY8Q5aZCJcpPLxMqCxIEN0+32uk8LA+NAXuBkABgmnjRycbHTaJ5zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076355; c=relaxed/simple;
	bh=IayyLRI5WzvNXFeFFOVv7BzXQfoJhh7IiQl/vObe6pM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fWzGxwMU96ad3o4Hr5cuNiq4nRyElBq68baEglqm92pLITDWNY+3JDV4+hZ2zyCsvQSEd9eBAArRkI/1EAz5QuOK8inJRW2iPLm3v96Jnw80twfxFmBWumLqTj8zkxsDoWwnDnJ6thcFCCIqx+btxrDYwgx9uwCM7OFdhvNU5Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyY/P2pp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyY/P2pp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789076353; x=1820612353;
  h=date:from:to:cc:subject:message-id;
  bh=IayyLRI5WzvNXFeFFOVv7BzXQfoJhh7IiQl/vObe6pM=;
  b=IyY/P2pp9BDGlD98PVF4FffF2IzLNtyo8l5w2kDkFO6+FkKI3iFx7rJu
   4vNh7/XtnR32Obf6tdb0aeNKvc6Ap88KFwHqKGiMUwprCyiW3vkqs4EuY
   2XgXNQRFRPf4jcVOmmW8PgCO5WKpTeEnZSMVYlA4awT2O6Vqp67qGhByt
   QUYlK1+A7morglbHSGcepZ1KpPJwlMlGSZ7WWpSyNt67bN7jihRlJdywh
   BULBS0NnY261ns9KyEdDvt75jV9gCLHy+yAJajjUTrEfqEUGXgS5228PP
   Nq1ZJOfEsIdZRDqQpYExLp/Ny44z3xcbUb6nH0pvW9UVnjXk9TzAw3IYC
   A==;
X-CSE-ConnectionGUID: PifNBIoTTbWlQr5DVViI7Q==
X-CSE-MsgGUID: uIZ8rXVzTiG9QKIAy92Zwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89569271"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89569271"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 14:39:12 -0700
X-CSE-ConnectionGUID: GRNq1U0IQr+dtCREYS7wJQ==
X-CSE-MsgGUID: 5wJwGzVTQRCgkoCzLYJcWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="276985744"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 10 Sep 2026 14:39:10 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4mTy-000000000Yx-41th;
	Thu, 10 Sep 2026 21:39:02 +0000
Date: Fri, 11 Sep 2026 05:38:44 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Subject: fs/f2fs/checkpoint.c:782:14: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202609110512.VUqyKAz1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: 9a9ee7408a1f8271bd1978baff2dd09457054ef4 f2fs: reduce memory footprint of ino management
date:   3 weeks ago
config: arm-randconfig-r133-20260911 (https://download.01.org/0day-ci/archive/20260911/202609110512.VUqyKAz1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110512.VUqyKAz1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9a9ee7408a1f ("f2fs: reduce memory footprint of ino management")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110512.VUqyKAz1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/f2fs/checkpoint.c:782:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   fs/f2fs/checkpoint.c:782:14: sparse:     expected void **slot
   fs/f2fs/checkpoint.c:782:14: sparse:     got void [noderef] __rcu **
   fs/f2fs/checkpoint.c:784:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/f2fs/checkpoint.c:784:57: sparse:     expected void [noderef] __rcu **slot
   fs/f2fs/checkpoint.c:784:57: sparse:     got void **slot
   fs/f2fs/checkpoint.c:789:64: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/f2fs/checkpoint.c:789:64: sparse:     expected void [noderef] __rcu **slot
   fs/f2fs/checkpoint.c:789:64: sparse:     got void **slot
   fs/f2fs/checkpoint.c:810:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   fs/f2fs/checkpoint.c:810:14: sparse:     expected void **slot
   fs/f2fs/checkpoint.c:810:14: sparse:     got void [noderef] __rcu **
   fs/f2fs/checkpoint.c:812:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/f2fs/checkpoint.c:812:57: sparse:     expected void [noderef] __rcu **slot
   fs/f2fs/checkpoint.c:812:57: sparse:     got void **slot
   fs/f2fs/checkpoint.c:819:64: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/f2fs/checkpoint.c:819:64: sparse:     expected void [noderef] __rcu **slot
   fs/f2fs/checkpoint.c:819:64: sparse:     got void **slot

vim +782 fs/f2fs/checkpoint.c

   768	
   769	static void __set_ino_bitmap(struct f2fs_sb_info *sbi, nid_t ino, int type)
   770	{
   771		struct inode_management *im = &sbi->im[type];
   772		unsigned long index = INO_SLOT_INDEX(ino);
   773		unsigned int ofs = INO_BIT_OFFSET(ino);
   774		void **slot, *entry;
   775		unsigned long bitmap = 0;
   776		int ret;
   777	
   778		ret = radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
   779		f2fs_bug_on(sbi, ret);
   780	
   781		spin_lock(&im->ino_lock);
 > 782		slot = radix_tree_lookup_slot(&im->ino_root, index);
   783		if (slot) {
   784			entry = radix_tree_deref_slot_protected(slot, &im->ino_lock);
   785			bitmap = xa_to_value(entry);
   786			if (!(bitmap & (1UL << ofs))) {
   787				bitmap |= (1UL << ofs);
   788				entry = xa_mk_value(bitmap);
   789				radix_tree_replace_slot(&im->ino_root, slot, entry);
   790			}
   791		} else {
   792			bitmap |= (1UL << ofs);
   793			entry = xa_mk_value(bitmap);
   794			if (unlikely(radix_tree_insert(&im->ino_root, index, entry)))
   795				f2fs_bug_on(sbi, 1);
   796		}
   797		spin_unlock(&im->ino_lock);
   798		radix_tree_preload_end();
   799	}
   800	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
