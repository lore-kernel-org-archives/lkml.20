Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578784AB1AD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107160; cv=none; b=q3NdJZHDwwec8ra4K/bUQ8IdT0Uati8K9BVEt763HL+PWoMipmpSlS5KI6BYPb2/Lxxg/G+Esp8eZn+TImsHn25XBukPfRFuN+2kvZynC0SiRBpgHZ1hDbc3U5bxW7Lc04+wHs62LeAyPhy1/X2CUKWJw0uFTIkqfTaepuxh9NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107160; c=relaxed/simple;
	bh=28zEr8iH+t2B4GCKqddrfZccDG+MVOREujiEBjboFkw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kNdXuY/d7IYN78mfDdNv5TNJ+LLXGSuXPp9aE/YNBOVi3OZHZrKzzDLrWFNJ4w/j84iFu+b87559/u/5tqjpIl+sPH/QX97M1irMENM9eajortqZ7lDIgAgefEvCg4ptYdbZtSh4lHqFCitKKOs1dk0h07+FYIfqQYiI2rT2uTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QH1p0Zjm; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QH1p0Zjm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790107155; x=1821643155;
  h=date:from:to:cc:subject:message-id;
  bh=28zEr8iH+t2B4GCKqddrfZccDG+MVOREujiEBjboFkw=;
  b=QH1p0ZjmNYfqDxXMLUwiJIzEVhMUqvyegst0p8McxgDgz5t+iHIacLkP
   /WK7OrXPDPtqM1u3YVJHwQQq9vaJ3mSBR9pAGFpjxOX4vBXXkpCbjXTso
   LkGHgQcdpJicu2wGvnEhfLadsITJDTAfikhkeObEV+taLbBtPJDgiVkWn
   ZxHKhIJfViK9j+EHD448pRXtPIwQFqCSuXmn5RcjfNI+SgWE7dnKKKIjE
   Q1/FsinK4lnF5CMEs78vP1XZUFNT570aqBt6WotaUsnAgxherfFA2lkyH
   nulfvS0KeOkeZYIK59SDqYmwe/gBdvu7XO0t39KCKn4Lt70Nuik0sUDh1
   A==;
X-CSE-ConnectionGUID: Ma9zyZpzS1SKSKBpkJztBQ==
X-CSE-MsgGUID: 1nFRMzkgSm2JyqXmFkbiOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1250687"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="1250687"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 12:59:11 -0700
X-CSE-ConnectionGUID: Uc6lPBHxSciIdi8LOmdmvA==
X-CSE-MsgGUID: TLsZkg1eStOKjQ9sxqSJ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="281359528"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Sep 2026 12:59:09 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x96du-00000000G25-1er1;
	Tue, 22 Sep 2026 19:59:06 +0000
Date: Wed, 23 Sep 2026 03:58:42 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:962:17:
 sparse: sparse: incompatible types in conditional expression (different base
 types):
Message-ID: <202609230340.Go9OsvQc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: af3f2f5db2659a13c256d2fb096c473eb50412ef drm/amdgpu: Remove UML build exclusion from Kconfig
date:   4 months ago
config: um-randconfig-r1307-20260922 (https://download.01.org/0day-ci/archive/20260923/202609230340.Go9OsvQc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230340.Go9OsvQc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: af3f2f5db265 ("drm/amdgpu: Remove UML build exclusion from Kconfig")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230340.Go9OsvQc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:519:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:962:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:962:17: sparse:    void
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:962:17: sparse:    int
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1235:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1235:9: sparse:    void
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1235:9: sparse:    int
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1267:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1267:9: sparse:    void
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1267:9: sparse:    int
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1449:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1449:9: sparse:    void
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1449:9: sparse:    int
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:519:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1402:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1402:9: sparse:    void
   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1402:9: sparse:    int
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:519:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:427:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:427:13: sparse:    struct dma_fence [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:427:13: sparse:    struct dma_fence *
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:41:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:41:26: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:41:26: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:41:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:41:26: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:41:26: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:41:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:41:26: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:41:26: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:41:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:41:26: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:41:26: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:41:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:41:26: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:41:26: sparse:    struct dma_fence_ops const *

vim +962 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c

c6ce68e67659fd drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2021-03-19  905  
3138ab2c5b32ec drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Sunil Khatri  2024-09-26  906  static int smu_late_init(struct amdgpu_ip_block *ip_block)
bee71d26d22339 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Chengming Gui 2019-01-30  907  {
3138ab2c5b32ec drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Sunil Khatri  2024-09-26  908  	struct amdgpu_device *adev = ip_block->adev;
ebfc253335af81 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2021-11-22  909  	struct smu_context *smu = adev->powerplay.pp_handle;
02cf91c113eacd drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-04  910  	int ret = 0;
a254bfa2c5fbd4 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Chengming Gui 2019-05-08  911  
93a8024130e218 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Xiaojian Du   2020-11-12  912  	smu_set_fine_grain_gfx_freq_parameters(smu);
93a8024130e218 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Xiaojian Du   2020-11-12  913  
a254bfa2c5fbd4 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Chengming Gui 2019-05-08  914  	if (!smu->pm_enabled)
a254bfa2c5fbd4 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Chengming Gui 2019-05-08  915  		return 0;
51548c0fe3d348 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui     2019-07-24  916  
4bdd4d25ed0d31 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2020-09-01  917  	ret = smu_post_init(smu);
4bdd4d25ed0d31 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2020-09-01  918  	if (ret) {
4bdd4d25ed0d31 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2020-09-01  919  		dev_err(adev->dev, "Failed to post smu init!\n");
4bdd4d25ed0d31 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2020-09-01  920  		return ret;
4bdd4d25ed0d31 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2020-09-01  921  	}
4bdd4d25ed0d31 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2020-09-01  922  
572773992e31e0 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2023-05-11  923  	/*
572773992e31e0 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2023-05-11  924  	 * Explicitly notify PMFW the power mode the system in. Since
572773992e31e0 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2023-05-11  925  	 * the PMFW may boot the ASIC with a different mode.
572773992e31e0 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2023-05-11  926  	 * For those supporting ACDC switch via gpio, PMFW will
572773992e31e0 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2023-05-11  927  	 * handle the switch automatically. Driver involvement
572773992e31e0 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2023-05-11  928  	 * is unnecessary.
572773992e31e0 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2023-05-11  929  	 */
42ffb3c396b5a5 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Ma Jun        2024-01-17  930  	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
42ffb3c396b5a5 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Ma Jun        2024-01-17  931  	smu_set_ac_dc(smu);
572773992e31e0 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2023-05-11  932  
4e8303cf2c4dd2 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Lijo Lazar    2023-09-11  933  	if ((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 1)) ||
4e8303cf2c4dd2 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Lijo Lazar    2023-09-11  934  	    (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 3)))
c16e87d6f43184 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Aaron Liu     2021-01-25  935  		return 0;
c16e87d6f43184 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Aaron Liu     2021-01-25  936  
4215a11923362e drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Horace Chen   2021-02-25  937  	if (!amdgpu_sriov_vf(adev) || smu->od_enabled) {
02cf91c113eacd drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-04  938  		ret = smu_set_default_od_settings(smu);
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  939  		if (ret) {
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  940  			dev_err(adev->dev, "Failed to setup default OD settings!\n");
02cf91c113eacd drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-04  941  			return ret;
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  942  		}
4215a11923362e drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Horace Chen   2021-02-25  943  	}
02cf91c113eacd drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-04  944  
02cf91c113eacd drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-04  945  	ret = smu_populate_umd_state_clk(smu);
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  946  	if (ret) {
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  947  		dev_err(adev->dev, "Failed to populate UMD state clocks!\n");
02cf91c113eacd drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-04  948  		return ret;
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  949  	}
02cf91c113eacd drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-04  950  
488f211dab7d2f drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2021-05-19  951  	ret = smu_get_asic_power_limits(smu,
488f211dab7d2f drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2021-05-19  952  					&smu->current_power_limit,
488f211dab7d2f drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2021-05-19  953  					&smu->default_power_limit,
1958946858a62b drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Ma Jun        2023-10-12  954  					&smu->max_power_limit,
1958946858a62b drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Ma Jun        2023-10-12  955  					&smu->min_power_limit);
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  956  	if (ret) {
a141b4e3c722c1 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-08  957  		dev_err(adev->dev, "Failed to get asic power limits!\n");
02cf91c113eacd drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-04  958  		return ret;
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  959  	}
02cf91c113eacd drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-04  960  
5228cd65742abd drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Jiawei Gu     2021-05-13  961  	if (!amdgpu_sriov_vf(adev))
81a16241114ba4 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Kent Russell  2020-04-27 @962  		smu_get_unique_id(smu);
81a16241114ba4 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Kent Russell  2020-04-27  963  
337b57aecb3e11 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Alex Deucher  2020-08-26  964  	smu_get_fan_parameters(smu);
337b57aecb3e11 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Alex Deucher  2020-08-26  965  
ebfc253335af81 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2021-11-22  966  	smu_handle_task(smu,
bee71d26d22339 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Chengming Gui 2019-01-30  967  			smu->smu_dpm.dpm_level,
e0638c7abc4d3d drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2021-11-29  968  			AMD_PP_TASK_COMPLETE_INIT);
bee71d26d22339 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Chengming Gui 2019-01-30  969  
b874c6671b911f drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2022-01-19  970  	ret = smu_apply_default_config_table_settings(smu);
b874c6671b911f drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2022-01-19  971  	if (ret && (ret != -EOPNOTSUPP)) {
b874c6671b911f drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2022-01-19  972  		dev_err(adev->dev, "Failed to apply default DriverSmuConfig settings!\n");
b874c6671b911f drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2022-01-19  973  		return ret;
b874c6671b911f drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2022-01-19  974  	}
b874c6671b911f drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2022-01-19  975  
eb3b425166cbdb drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Arunpravin    2021-01-19  976  	smu_restore_dpm_user_profile(smu);
eb3b425166cbdb drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Arunpravin    2021-01-19  977  
bee71d26d22339 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Chengming Gui 2019-01-30  978  	return 0;
bee71d26d22339 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Chengming Gui 2019-01-30  979  }
bee71d26d22339 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Chengming Gui 2019-01-30  980  

:::::: The code at line 962 was first introduced by commit
:::::: 81a16241114ba4e0b188e517e5e8522951dfeb7b drm/amdgpu: Add unique_id and serial_number for Arcturus v3

:::::: TO: Kent Russell <kent.russell@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
