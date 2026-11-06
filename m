Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966927;
	b=NZlDEZwaQf5eomIp4yWQIzDZif+w+/r92aLQPsDCy7Kk5to7Hxz+F91b4CeliHuUlEJP
	 2zTqokoptSr5IO208GRyViMtD0Z3aGcmebvGy+rjaUUqEBDqNy99HwuNG5xtRr/fOOqMg
	 cdZhuXXCqwydykHQ+XWZ93Gf0w6zhV3kHtdXmxwkf/ef9fL8QY3UDxu8ecDp4+8JMcKdI
	 fsx5i0CZXkTVrhWGLzNTGizCPMMPyRSGoIHwdae8mUyIfmuQ8TkVcL9FRkNgr1wW3czh7
	 XbYQYtXavpPiA5ijG6o70ShNCu7YA3criojlEK/kZv23L8PMrvSwmX9+/KH3R2hMtwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966927;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=MlXRyYwBoTAXp2tQGy95RIZk7QndDlvDdIgBmLp9pLw=;
	b=nYb+UYBbcsjb6LqXj3hprUhZc6q1ZcALJxzwPVe1NxdsAiqrQ2tdyZNI3AT7zMDmStEz
	 qV7mw74E9wKrAPRQMqCU4LraUoHKGG+I5psOjzZfQ9qIw9UpIOt5dbwrjskEKWGXqH7pf
	 IAtOKHgLK+le83Ok941ifbapiREaxxV6u0urLySzO+Pcz1Pzz87FhK7TFVoIRvpX4kefF
	 xtOJZcQJEYHFAeuVBPXYL+ZlpIPz5VWIMbS+ByioGphmVlXryiPhVcKq4dLEmirGCDFWg
	 RlKuYvm8mQMo2xkfczBeL1oVAXJJ1IatS1mGC6HQChZPrdb5RgGJu04L/HBfy727nRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oKVoBimX;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B6A606D814
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29B6A606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oKVoBimX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793966927; x=1825502927;
  h=date:from:to:cc:subject:message-id;
  bh=s45ac4JsesmUhWf8OzUcSiPVphE1c0O61NuIIbBDgiA=;
  b=oKVoBimXuVCBV9KSHz7kznh8Aofbu8d9CvXuroiDmlx+YjpVNid2skOq
   mVxJtz4KLziUbxbx5DKmtE4R9uR16BVP135Dz/hxGcAJ9SB3M7ZuG9rPQ
   6C+fwfEZ1/xQYNp5GbZOHSxMdOKfYRxktJ+WrknD1TWVV5P0Y0R4RY+Jh
   PMLlK3+wqRwY+id9SfBxqxKZLvhwVHMeRnAx8OVzSILt8GSxpNuhVGRhA
   PXRtZfBVwCAIqoKQP0qwCB8D6W77VuSYzBQfbunuoR52O+wb0xH6h03aF
   60iIJ5h1i8ClqQPpFPRQmDi0TfObOmY+c1mJ+RLI/Jb+kKa6miLKG0Ze/
   g==;
X-CSE-ConnectionGUID: 3mujrTrNRP29DedrEF+JrQ==
X-CSE-MsgGUID: 8tLJkERhQXCX5coviGuEmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2817186"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2817186"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:08:46 -0800
X-CSE-ConnectionGUID: ATp/hbA0R4a/mjbnCAID2Q==
X-CSE-MsgGUID: cMBgb3tYRtyR2rA0dhqKWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7255630"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2026 04:08:45 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPIkN-00000000AEz-0Foe;
	Fri, 06 Nov 2026 12:08:43 +0000
Date: Fri, 06 Nov 2026 13:08:32 +0100
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Zhiguo Niu <zhiguo.niu@unisoc.com>
Subject: fs/f2fs/cache.c:147:5-24: WARNING: atomic_dec_and_test
 variation before object free at line 148.
Message-ID: <202611061201.znvqT1oN-lkp@intel.com>
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
head:   f66469d9905b39d2c260a15d7d6db450f4db67c1
commit: 4e80250bcfbc689efc6fd4d1b4e9d581ac3a7ea1 f2fs: cache: implement metadata cache
date:   7 weeks ago
config: loongarch-randconfig-r2105-20261104 (https://download.01.org/0day-ci/archive/20261106/202611061201.znvqT1oN-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e2e3d6c39cfebec9eace23629a5a103df2c79ba6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4e80250bcfbc ("f2fs: cache: implement metadata cache")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061201.znvqT1oN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/f2fs/cache.c:147:5-24: WARNING: atomic_dec_and_test variation before object free at line 148.

vim +147 fs/f2fs/cache.c

   143	
   144	static bool f2fs_cache_put(struct f2fs_cached_block *entry)
   145	{
   146		WARN_ON_ONCE(!f2fs_cache_refcount(entry));
 > 147		if (atomic_dec_and_test(&entry->refcount)) {
 > 148			f2fs_free_cache(entry);
   149			return true;
   150		}
   151		return false;
   152	}
   153	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
