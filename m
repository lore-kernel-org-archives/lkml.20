Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542072FE042
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569382; cv=none; b=NqMpI925mNLzfgb5P4k6DMDDWQUvtD0OUsjHTpJSdFPL4Z6Gl+bwiY4BvjDK/sscvCZJREtGb+hniHW70GkncQTLwkSFitIZ6JTrF3gTNMFX76dN+8w8eSbWlQx4Q1fKjaVh4cBhaN5jn30BHhUFwBdf0+UBPBaeO1vefFhOdwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569382; c=relaxed/simple;
	bh=kjWRhamImpHbxXD74A2C9YNqa1ANFrc2fJwOVhqxGEo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qEjr0FQvc7Y4acG4DgXcLCDN3FRLIxXw+/PoOhvCG9G4VYVAZlctjIlgL37IQ7EfqwJluGWaPVRK6OyFBbpQr0TMS79qHaew2oFIk/ezwLunU2CbN1SarFXmFTViCz89c2OfVLDUd+Lst+SvfwiQTiSOFenhMKA5FzZOMFiA3AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDi8fV6T; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDi8fV6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788569380; x=1820105380;
  h=date:from:to:cc:subject:message-id;
  bh=kjWRhamImpHbxXD74A2C9YNqa1ANFrc2fJwOVhqxGEo=;
  b=mDi8fV6TUZzOiddA26dU+KrRhcrFeRzvlXXMc6pld0bCRalL0Uyt0UTJ
   /dILGHed65Zfj+Gu1YPNqn8ffcHaHdPvfADklUVHyEzsviE1uhfOOiU6d
   jCy8jgcE7mi7VRDY/PvZDE0plmW1ypeuPmAZqWYvex2J6hzm4OwqaWdyA
   WIyDiSF05+jGEkMssXBfPIMo0bxHDVQ+oHO9Eq8iItsi93/t+VIR1BQxh
   Xcnrax0Wi8xpa6w0g0678jZvXxplNCBSMeI2jfLvwqSGwRSv851dqYXms
   VExhFOi6fCF/paptqUnIPmLDMlDlmxnVfCIGucTWlvz/TdVPWfcGL6UxH
   A==;
X-CSE-ConnectionGUID: +3eJjxtSSfupeFLMgpqy4Q==
X-CSE-MsgGUID: jtQfWjZBQ+Sg+0gnpjLYOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="100234661"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="100234661"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 17:49:39 -0700
X-CSE-ConnectionGUID: YTzc1OniT5uhzJ58xFORcg==
X-CSE-MsgGUID: v0jS/LjnRFywcpATuzhuKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="267607316"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Sep 2026 17:49:36 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2eb8-00000000AUg-17TJ;
	Sat, 05 Sep 2026 00:49:34 +0000
Date: Sat, 05 Sep 2026 08:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:391:41: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202609050833.rJ9c0SND-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   654ae5d73c05bd2943d65636ce6cd0aa46e62f18
commit: 1d8cfeb69daa863a70134b8ed6df8055c418a5b0 drm/amdgpu: Pack nested ucode_info struct
date:   5 weeks ago
config: i386-randconfig-063-20260904 (https://download.01.org/0day-ci/archive/20260905/202609050833.rJ9c0SND-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050833.rJ9c0SND-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1d8cfeb69daa ("drm/amdgpu: Pack nested ucode_info struct")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050833.rJ9c0SND-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:391:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *mqd_ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:391:41: sparse:     expected void volatile [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:391:41: sparse:     got void *mqd_ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:397:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *mqd_ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:397:41: sparse:     expected void volatile [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:397:41: sparse:     got void *mqd_ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1425:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1427:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1429:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1435:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1437:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1439:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1446:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1452:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1454:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1456:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1462:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1464:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1466:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1473:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1479:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1481:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1483:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1489:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1491:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1493:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1494:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1500:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1506:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1508:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1510:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1511:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1517:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1523:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1525:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1527:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1536:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2430:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *cleaner_shader_cpu_ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2430:38: sparse:     expected void volatile [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2430:38: sparse:     got void *cleaner_shader_cpu_ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2783:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2783:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2783:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2784:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2784:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2784:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2786:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2786:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2786:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2787:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2787:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2787:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2788:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2788:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2788:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2812:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2812:49: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2812:49: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2813:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2813:49: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2813:49: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2816:57: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2816:57: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2816:57: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2832:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2832:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2832:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2833:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2833:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2833:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2835:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2835:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2835:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2836:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2836:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2836:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:3015:25: sparse: sparse: cast to restricted __le32

vim +391 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

b9683c21f69b3d8 Alex Deucher 2017-06-07  380  
b5ded0313519e7f Alex Deucher 2026-05-19  381  static void amdgpu_gfx_mqd_reset_restore(struct amdgpu_ring *ring)
a3cc79650141670 Alex Deucher 2026-05-19  382  {
a3cc79650141670 Alex Deucher 2026-05-19  383  	struct amdgpu_device *adev = ring->adev;
a3cc79650141670 Alex Deucher 2026-05-19  384  	int mqd_idx, mqd_size;
a3cc79650141670 Alex Deucher 2026-05-19  385  
a3cc79650141670 Alex Deucher 2026-05-19  386  	/* restore mqd with the backup copy */
a3cc79650141670 Alex Deucher 2026-05-19  387  	if (ring->funcs->type == AMDGPU_RING_TYPE_COMPUTE) {
a3cc79650141670 Alex Deucher 2026-05-19  388  		mqd_idx = ring - &adev->gfx.compute_ring[0];
a3cc79650141670 Alex Deucher 2026-05-19  389  		mqd_size = adev->mqds[AMDGPU_HW_IP_COMPUTE].mqd_size;
a3cc79650141670 Alex Deucher 2026-05-19  390  		if (adev->gfx.mec.mqd_backup[mqd_idx])
a3cc79650141670 Alex Deucher 2026-05-19 @391  			memcpy_toio(ring->mqd_ptr, adev->gfx.mec.mqd_backup[mqd_idx], mqd_size);
a3cc79650141670 Alex Deucher 2026-05-19  392  	} else if (ring->funcs->type == AMDGPU_RING_TYPE_GFX) {
a3cc79650141670 Alex Deucher 2026-05-19  393  		mqd_size = adev->mqds[AMDGPU_HW_IP_GFX].mqd_size;
a3cc79650141670 Alex Deucher 2026-05-19  394  		mqd_idx = ring - &adev->gfx.gfx_ring[0];
a3cc79650141670 Alex Deucher 2026-05-19  395  
a3cc79650141670 Alex Deucher 2026-05-19  396  		if (adev->gfx.me.mqd_backup[mqd_idx])
a3cc79650141670 Alex Deucher 2026-05-19  397  			memcpy_toio(ring->mqd_ptr, adev->gfx.me.mqd_backup[mqd_idx], mqd_size);
a3cc79650141670 Alex Deucher 2026-05-19  398  	}
a3cc79650141670 Alex Deucher 2026-05-19  399  	/* reset the ring */
a3cc79650141670 Alex Deucher 2026-05-19  400  	ring->wptr = 0;
a3cc79650141670 Alex Deucher 2026-05-19  401  	atomic64_set((atomic64_t *)ring->wptr_cpu_addr, 0);
a3cc79650141670 Alex Deucher 2026-05-19  402  	amdgpu_ring_clear_ring(ring);
a3cc79650141670 Alex Deucher 2026-05-19  403  }
a3cc79650141670 Alex Deucher 2026-05-19  404  

:::::: The code at line 391 was first introduced by commit
:::::: a3cc79650141670f6db74f90e2d6c173144ace0a drm/amdgpu/gfx: add a helper for MQD restore

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
