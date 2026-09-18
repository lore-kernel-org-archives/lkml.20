Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6260E3D300E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700044; cv=none; b=QWhWFKyCbP2vCFJOtF4fQtOzG/zVGQX7rlSsDgcruup6gyo+zRS/PGk9djt4lQv05atiEwebfk/endqpiX9ruL5oAYkFmPvUQBDQ8iea+iSaA9mP9t5r76eMR0iFmddEoArQWUcna+wqqDkmPvwcpw0uW45BqNF1i58CVVrV1yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700044; c=relaxed/simple;
	bh=/UX8ZmEQnH8EqOiIKE7Z5WAxMATgJMUKVfNeyfd6Ujo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oC3Gxozp1EX9CWJ/e3Vv//r7oa/aO7XdOrpVyGWFFPSFuAijpDQYBTii/cgGrgSuskzh5q2hKqF3O7VgZiRRPnsMoC9Jc/8LWrvDfvD71u6oa0BG/qY7KZEhvaeiZhakx6JzjpgMuPQaceheeG/exAFdIxIORMCdT9JXc0DEcTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gCjwF2LW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCjwF2LW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789700039; x=1821236039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/UX8ZmEQnH8EqOiIKE7Z5WAxMATgJMUKVfNeyfd6Ujo=;
  b=gCjwF2LW4F7x1byVZ3h0iI01HkHOgrsggOSma6BNcMqqbWW8ICWpiYAo
   uiZOisJGOb29/Sbe9DzVeUtsV0+er/3NCp1s0WyWbOKwmzXC34SPXoZy4
   2LgQNm/AdFi7Yba5rxQeFFg7ZUkxoSNgkVxvTx1lb2PNY9xKFf57NPdll
   jMC8l6dDrPMQ9TyVufXQYsh7ATAo3vMHs0DEYIdjTlkS0BehVvkuxVEb5
   TmzZMXHz8LaWDklfMHjg7Q55lP/41/0+s1kR5m380oAEGLgKi245DMb/T
   mklrafUwvxuSN5gqeMPxlgX+Ga/giTa9flfR35wonR34ixWSmzabXVfjD
   Q==;
X-CSE-ConnectionGUID: yesE6TzfSEO8PhywExT15Q==
X-CSE-MsgGUID: lL1JEOL+QhqA0ry9RtOuDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90042848"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90042848"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 19:53:56 -0700
X-CSE-ConnectionGUID: sCP42L+oSTKgd75DmuHK7A==
X-CSE-MsgGUID: uQU1abiJQ6m+0aqMRvJ32g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2363142"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 17 Sep 2026 19:53:55 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7OjY-00000000994-1fsf;
	Fri, 18 Sep 2026 02:53:52 +0000
Date: Fri, 18 Sep 2026 10:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: drivers/gpu/drm/imagination/pvr_ccb.c:584:17: sparse:
 sparse: incompatible types in comparison expression (different address
 spaces):
Message-ID: <202609181026.bSBKMAwH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: f4cc3ab824d6772a48ca9d9c74ac623b3309985d dma-buf: protected fence ops by RCU v8
date:   7 months ago
config: arm64-randconfig-r1302-20260917 (https://download.01.org/0day-ci/archive/20260918/202609181026.bSBKMAwH-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609181026.bSBKMAwH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f4cc3ab824d6 ("dma-buf: protected fence ops by RCU v8")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609181026.bSBKMAwH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/imagination/pvr_ccb.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h):
   drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
   drivers/gpu/drm/imagination/pvr_ccb.c:562:22: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/imagination/pvr_ccb.c:562:22: sparse: sparse: got ,
   drivers/gpu/drm/imagination/pvr_ccb.c:562:22: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/imagination/pvr_ccb.c:562:22: sparse: sparse: got ,
   drivers/gpu/drm/imagination/pvr_ccb.c:562:22: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/imagination/pvr_ccb.c:562:22: sparse: sparse: got ,
   drivers/gpu/drm/imagination/pvr_ccb.c:562:22: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/imagination/pvr_ccb.c:562:22: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/imagination/pvr_ccb.c:562:22: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/imagination/pvr_ccb.c:562:22: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/imagination/pvr_ccb.c:562:22: sparse: sparse: undefined identifier '_res'
>> drivers/gpu/drm/imagination/pvr_ccb.c:584:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/imagination/pvr_ccb.c:584:17: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/imagination/pvr_ccb.c:584:17: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/imagination/pvr_queue.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_cccb.h):
   drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
   drivers/gpu/drm/imagination/pvr_queue.c:252:17: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/imagination/pvr_queue.c:252:17: sparse: sparse: got ,
   drivers/gpu/drm/imagination/pvr_queue.c:252:17: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/imagination/pvr_queue.c:252:17: sparse: sparse: got ,
   drivers/gpu/drm/imagination/pvr_queue.c:252:17: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/imagination/pvr_queue.c:252:17: sparse: sparse: got ,
   drivers/gpu/drm/imagination/pvr_queue.c:1269:17: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/imagination/pvr_queue.c:1269:17: sparse: sparse: got ,
   drivers/gpu/drm/imagination/pvr_queue.c:1269:17: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/imagination/pvr_queue.c:1269:17: sparse: sparse: got ,
   drivers/gpu/drm/imagination/pvr_queue.c:1269:17: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/imagination/pvr_queue.c:1269:17: sparse: sparse: got ,
>> drivers/gpu/drm/imagination/pvr_queue.c:197:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/imagination/pvr_queue.c:197:25: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/imagination/pvr_queue.c:197:25: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/imagination/pvr_queue.c:223:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/imagination/pvr_queue.c:223:13: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/imagination/pvr_queue.c:223:13: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/imagination/pvr_queue.c:252:17: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/imagination/pvr_queue.c:252:17: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/imagination/pvr_queue.c:252:17: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/imagination/pvr_queue.c:252:17: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/imagination/pvr_queue.c:252:17: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/imagination/pvr_queue.c:902:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/imagination/pvr_queue.c:902:25: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/imagination/pvr_queue.c:902:25: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/imagination/pvr_queue.c:1269:17: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/imagination/pvr_queue.c:1269:17: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/imagination/pvr_queue.c:1269:17: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/imagination/pvr_queue.c:1269:17: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/imagination/pvr_queue.c:1269:17: sparse: sparse: undefined identifier '_res'

vim +584 drivers/gpu/drm/imagination/pvr_ccb.c

cc1aeedb98ad34 Sarah Walker 2023-11-22  568  
cc1aeedb98ad34 Sarah Walker 2023-11-22  569  /**
cc1aeedb98ad34 Sarah Walker 2023-11-22  570   * pvr_kccb_fence_put() - Drop a KCCB fence reference
cc1aeedb98ad34 Sarah Walker 2023-11-22  571   * @fence: The fence to drop the reference on.
cc1aeedb98ad34 Sarah Walker 2023-11-22  572   *
cc1aeedb98ad34 Sarah Walker 2023-11-22  573   * If the fence hasn't been initialized yet, dma_fence_free() is called. This
cc1aeedb98ad34 Sarah Walker 2023-11-22  574   * way we have a single function taking care of both cases.
cc1aeedb98ad34 Sarah Walker 2023-11-22  575   */
cc1aeedb98ad34 Sarah Walker 2023-11-22  576  void pvr_kccb_fence_put(struct dma_fence *fence)
cc1aeedb98ad34 Sarah Walker 2023-11-22  577  {
cc1aeedb98ad34 Sarah Walker 2023-11-22  578  	if (!fence)
cc1aeedb98ad34 Sarah Walker 2023-11-22  579  		return;
cc1aeedb98ad34 Sarah Walker 2023-11-22  580  
cc1aeedb98ad34 Sarah Walker 2023-11-22  581  	if (!fence->ops) {
cc1aeedb98ad34 Sarah Walker 2023-11-22  582  		dma_fence_free(fence);
cc1aeedb98ad34 Sarah Walker 2023-11-22  583  	} else {
cc1aeedb98ad34 Sarah Walker 2023-11-22 @584  		WARN_ON(fence->ops != &pvr_kccb_fence_ops);
cc1aeedb98ad34 Sarah Walker 2023-11-22  585  		dma_fence_put(fence);
cc1aeedb98ad34 Sarah Walker 2023-11-22  586  	}
cc1aeedb98ad34 Sarah Walker 2023-11-22  587  }
cc1aeedb98ad34 Sarah Walker 2023-11-22  588  

:::::: The code at line 584 was first introduced by commit
:::::: cc1aeedb98ad347c06ff59e991b2f94dfb4c565d drm/imagination: Implement firmware infrastructure and META FW support

:::::: TO: Sarah Walker <sarah.walker@imgtec.com>
:::::: CC: Maxime Ripard <mripard@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
