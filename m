Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54993655E9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790818295; cv=none; b=MnxV5MK8qNjKWiafACwRXeayZxoeGgNuF6hTJ4L2M357BDbiMvOAS6ZR7tZ7eWfPOvDhdlJkN3QAPblnzDYjbI4u1Z3G1XSJG6Ba5PuUakcvc0ik7NN1Afs1ern89I7v2j4wPA4z00iF4qkEgwcFe7VUd8Y/nRLJY/uXnevO47w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790818295; c=relaxed/simple;
	bh=2XiydE1hS4nSPewT54+aL0AQW6tDF7XkL1seasLzlNM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CRqjfVQGvNww7uUGV/uVA7BlOxcT9cElTBm1BjVE67VlapBhbUqHe1MWguOFlFmEXIXvu2AGaU5HAvz5MmSjMFWSzisdm5QNIGQdIoZgt7TETIWRZRHoiNBppj1EyznIg7bvUi10PwN/9au4q40aw8PAWVDsfGyMR6YqEPHSCzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gaj86p5n; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gaj86p5n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790818290; x=1822354290;
  h=date:from:to:cc:subject:message-id;
  bh=2XiydE1hS4nSPewT54+aL0AQW6tDF7XkL1seasLzlNM=;
  b=Gaj86p5nTibg8KsBfr39LROCpHcqnr4qEYExQIvInbVgc5pqBBZkYCj9
   3H5DCk0S7tQjTCDmnHIKAOS5e5jZkdoikrrCO67RXVfnyJGtF3/t5DHkY
   jKVkSpKhRZ5PwXRgD5TFtpoLNyXPqkawS2eLVH86oS44sCy33zebz/XCF
   M4NLEm1EEFE5ekKVbH/RWPg6KcazX+QCQ2jrSlivjqeQ2IKcno0szWCwU
   Spsi3dvx0wlMMKVjvFy2z9ylxjlJXBpd+rkLEpKbV0RqkWbWt9otqt3rf
   Bii3EAI+X/Lt/t0kzJgdPnvQb0al2cVVfYqYXdEx1AUyRGAyDs+KG50nV
   Q==;
X-CSE-ConnectionGUID: JdfN0CiuRqqVF0+H8ETxnA==
X-CSE-MsgGUID: hh2zBowkQo2v9qs9C5MhCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="107949709"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="107949709"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 18:31:28 -0700
X-CSE-ConnectionGUID: +ZTjbVpsRCi1gbQbowfZdA==
X-CSE-MsgGUID: vOeAK7rMQUKbzvpZiI8aBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="275393801"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 30 Sep 2026 18:31:26 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC5ds-000000002Ah-2shv;
	Thu, 01 Oct 2026 01:31:24 +0000
Date: Thu, 01 Oct 2026 03:31:21 +0200
From: kernel test robot <lkp@intel.com>
To: Matthew Stewart <matthew.stewart2@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Ray Wu <ray.wu@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn42b/dcn42b_clk_mgr.c:444
 dcn42b_clk_mgr_construct() warn: inconsistent indenting
Message-ID: <202610010325.LdJTKRbZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   551c722f40809618230001baccf219193e22fc5a
commit: 0a5e0416e191571de9362b769feb31b3e87a705e drm/amd/display: Add DCN42B code to DC
date:   4 months ago
config: i386-randconfig-r2201-20260923 (https://download.01.org/0day-ci/archive/20261001/202610010325.LdJTKRbZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0a5e0416e191 ("drm/amd/display: Add DCN42B code to DC")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610010325.LdJTKRbZ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn42b/dcn42b_clk_mgr.c:444 dcn42b_clk_mgr_construct() warn: inconsistent indenting

vim +444 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn42b/dcn42b_clk_mgr.c

a3d3758b2ee159 Matthew Stewart 2026-05-17  414  
a3d3758b2ee159 Matthew Stewart 2026-05-17  415  void dcn42b_clk_mgr_construct(
a3d3758b2ee159 Matthew Stewart 2026-05-17  416  		struct dc_context *ctx,
a3d3758b2ee159 Matthew Stewart 2026-05-17  417  		struct clk_mgr_dcn42 *clk_mgr,
a3d3758b2ee159 Matthew Stewart 2026-05-17  418  		struct pp_smu_funcs *pp_smu,
a3d3758b2ee159 Matthew Stewart 2026-05-17  419  		struct dccg *dccg)
a3d3758b2ee159 Matthew Stewart 2026-05-17  420  {
a3d3758b2ee159 Matthew Stewart 2026-05-17  421  	clk_mgr->base.base.ctx = ctx;
a3d3758b2ee159 Matthew Stewart 2026-05-17  422  	clk_mgr->base.base.funcs = &dcn42b_funcs;
a3d3758b2ee159 Matthew Stewart 2026-05-17  423  	clk_mgr->base.regs = &clk_mgr_regs_dcn42b;
a3d3758b2ee159 Matthew Stewart 2026-05-17  424  	clk_mgr->base.clk_mgr_shift = &clk_mgr_shift_dcn42b;
a3d3758b2ee159 Matthew Stewart 2026-05-17  425  	clk_mgr->base.clk_mgr_mask = &clk_mgr_mask_dcn42b;
a3d3758b2ee159 Matthew Stewart 2026-05-17  426  
a3d3758b2ee159 Matthew Stewart 2026-05-17  427  	clk_mgr->base.pp_smu = pp_smu;
a3d3758b2ee159 Matthew Stewart 2026-05-17  428  
a3d3758b2ee159 Matthew Stewart 2026-05-17  429  	clk_mgr->base.dccg = dccg;
a3d3758b2ee159 Matthew Stewart 2026-05-17  430  	clk_mgr->base.dfs_bypass_disp_clk = 0;
a3d3758b2ee159 Matthew Stewart 2026-05-17  431  
a3d3758b2ee159 Matthew Stewart 2026-05-17  432  	clk_mgr->base.dprefclk_ss_percentage = 0;
a3d3758b2ee159 Matthew Stewart 2026-05-17  433  	clk_mgr->base.dprefclk_ss_divider = 1000;
a3d3758b2ee159 Matthew Stewart 2026-05-17  434  	clk_mgr->base.ss_on_dprefclk = false;
a3d3758b2ee159 Matthew Stewart 2026-05-17  435  	clk_mgr->base.dfs_ref_freq_khz = 48000; /*sync with pmfw*/
a3d3758b2ee159 Matthew Stewart 2026-05-17  436  	clk_mgr->base.base.clks.ref_dtbclk_khz = 0;
a3d3758b2ee159 Matthew Stewart 2026-05-17  437  
a3d3758b2ee159 Matthew Stewart 2026-05-17  438  	/* Changed from DCN3.2_clock_frequency doc to match
a3d3758b2ee159 Matthew Stewart 2026-05-17  439  	 * dcn32_dump_clk_registers from 4 * dentist_vco_freq_khz /
a3d3758b2ee159 Matthew Stewart 2026-05-17  440  	 * dprefclk DID divider
a3d3758b2ee159 Matthew Stewart 2026-05-17  441  	 */
a3d3758b2ee159 Matthew Stewart 2026-05-17  442  	clk_mgr->base.base.dprefclk_khz = 600000;
a3d3758b2ee159 Matthew Stewart 2026-05-17  443  
a3d3758b2ee159 Matthew Stewart 2026-05-17 @444  		clk_mgr->base.smu_present = false;

:::::: The code at line 444 was first introduced by commit
:::::: a3d3758b2ee159a0985bc2f973a892200c2ab62b drm/amd/display: Add DCN42B DC resource files

:::::: TO: Matthew Stewart <matthew.stewart2@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
