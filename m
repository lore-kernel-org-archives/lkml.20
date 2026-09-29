Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0553C392825
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790712223; cv=none; b=kYrmYGWBvJgYKus6Z7OgtXDpK1ajXmzTqzKdlL1OLyWFModdk6SLmssTWxOrg54lP0p4Y4G81Pmec/BNUPAMCutCjs/TTa/a0szk4JM57qdEOxnpXlI7tD8eGLmdp3MD4ctrCoV+pvxX0auGDGsmgvCIuw5rRaOpGlu7p53pRps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790712223; c=relaxed/simple;
	bh=TGDx3E0+Ws1yBPR+prTXJB7/rxgcEsMqlcpX/C0GfCI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TIc2FVu78HAc/vuS7ucEzUqmiUxzT9GH2fidJJsRObERnLEf6x2HHaa7oSnl45+jg2zAed55EeUEVl35mT34yP4aUU1I8Y6Il3TQQNnOPMFEsAc1ChtFCmphnyqmZy7UkGVdGZ7Ar7oXM8kpsGV4XLajZFUp8iDevOW2pBKh2AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOvJvkPa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOvJvkPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790712221; x=1822248221;
  h=date:from:to:cc:subject:message-id;
  bh=TGDx3E0+Ws1yBPR+prTXJB7/rxgcEsMqlcpX/C0GfCI=;
  b=lOvJvkPaefpE39/mQTCTdrH/Y3inehvJWY//PhPF0k2I8c7K1mojJRme
   eQDZefG2nBJhO2pBtsNnjI60+6a02ht1dU5EWVYPXAKwQbkA8ZUqydC4t
   ZxYbsOfrvSoK0s2NS0kIOwoTDozaCcf7JGU/KUQdI/1NtduhhlDC0jdB6
   uoTRiFZ7cTYBDUn1NkgtvZI70kKx31O5vfKgZiLVBF8346i2QCqsCex5F
   cmMIGYyzEEeyKVUg3J3/HiN5vwSxxpNLsBwdH+f5NB1hfmptrscFATkfK
   XDD1WsUwMAGkxbEMSjM01xGl8LcdLSCrFKE6nL+nM86LAFui/TqaiqQfP
   w==;
X-CSE-ConnectionGUID: 9Cj6lSpPSQu8v57oxq9Dxg==
X-CSE-MsgGUID: jFXhLpNuSyGCTFRynu8tJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="100772612"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="100772612"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 13:03:41 -0700
X-CSE-ConnectionGUID: Kr7i09fuQy6LfoolILee8g==
X-CSE-MsgGUID: ial/VZU7SSWq8LCxHj5aLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="280224514"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 29 Sep 2026 13:03:38 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBe35-000000001XX-1obc;
	Tue, 29 Sep 2026 20:03:35 +0000
Date: Tue, 29 Sep 2026 22:03:17 +0200
From: kernel test robot <lkp@intel.com>
To: Roman Li <Roman.Li@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn42/dcn42_clk_mgr.c:1114
 dcn42_clk_mgr_construct() warn: inconsistent indenting
Message-ID: <202609292214.6e3hq3xI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6f8319e3e9a44dd537d17f41565a8453c560a581
commit: 6b2dd7d37badd8bf076875397f9f39b494258ca7 drm/amd/display: Enable dcn42 DC
date:   7 months ago
config: i386-randconfig-r2201-20260923 (https://download.01.org/0day-ci/archive/20260929/202609292214.6e3hq3xI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6b2dd7d37bad ("drm/amd/display: Enable dcn42 DC")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609292214.6e3hq3xI-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn42/dcn42_clk_mgr.c:1114 dcn42_clk_mgr_construct() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn42/dcn42_hwseq.c:1060 dcn42_optimize_bandwidth() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn42/dcn42_hwseq.c:279 dcn42_init_hw() error: we previously assumed 'dc->res_pool->funcs->update_bw_bounding_box' could be null (see line 274)
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn42/dcn42_hwseq.c:560 dcn42_program_rmcm_luts() warn: inconsistent indenting

vim +1114 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn42/dcn42_clk_mgr.c

bd096a56da7cad Roman Li 2026-02-02  1077  
bd096a56da7cad Roman Li 2026-02-02  1078  void dcn42_clk_mgr_construct(
bd096a56da7cad Roman Li 2026-02-02  1079  		struct dc_context *ctx,
bd096a56da7cad Roman Li 2026-02-02  1080  		struct clk_mgr_dcn42 *clk_mgr,
bd096a56da7cad Roman Li 2026-02-02  1081  		struct pp_smu_funcs *pp_smu,
bd096a56da7cad Roman Li 2026-02-02  1082  		struct dccg *dccg)
bd096a56da7cad Roman Li 2026-02-02  1083  {
bd096a56da7cad Roman Li 2026-02-02  1084  	clk_mgr->base.base.ctx = ctx;
bd096a56da7cad Roman Li 2026-02-02  1085  	clk_mgr->base.base.funcs = &dcn42_funcs;
bd096a56da7cad Roman Li 2026-02-02  1086  	clk_mgr->base.regs = &clk_mgr_regs_dcn42;
bd096a56da7cad Roman Li 2026-02-02  1087  	clk_mgr->base.clk_mgr_shift = &clk_mgr_shift_dcn42;
bd096a56da7cad Roman Li 2026-02-02  1088  	clk_mgr->base.clk_mgr_mask = &clk_mgr_mask_dcn42;
bd096a56da7cad Roman Li 2026-02-02  1089  
bd096a56da7cad Roman Li 2026-02-02  1090  	clk_mgr->base.pp_smu = pp_smu;
bd096a56da7cad Roman Li 2026-02-02  1091  
bd096a56da7cad Roman Li 2026-02-02  1092  	clk_mgr->base.dccg = dccg;
bd096a56da7cad Roman Li 2026-02-02  1093  	clk_mgr->base.dfs_bypass_disp_clk = 0;
bd096a56da7cad Roman Li 2026-02-02  1094  
bd096a56da7cad Roman Li 2026-02-02  1095  	clk_mgr->base.dprefclk_ss_percentage = 0;
bd096a56da7cad Roman Li 2026-02-02  1096  	clk_mgr->base.dprefclk_ss_divider = 1000;
bd096a56da7cad Roman Li 2026-02-02  1097  	clk_mgr->base.ss_on_dprefclk = false;
bd096a56da7cad Roman Li 2026-02-02  1098  	clk_mgr->base.dfs_ref_freq_khz = 48000; /*sync with pmfw*/
bd096a56da7cad Roman Li 2026-02-02  1099  
bd096a56da7cad Roman Li 2026-02-02  1100  	clk_mgr->smu_wm_set.wm_set = (struct dcn42_watermarks *)dm_helpers_allocate_gpu_mem(
bd096a56da7cad Roman Li 2026-02-02  1101  				clk_mgr->base.base.ctx,
bd096a56da7cad Roman Li 2026-02-02  1102  				DC_MEM_ALLOC_TYPE_GART,
bd096a56da7cad Roman Li 2026-02-02  1103  				sizeof(struct dcn42_watermarks),
bd096a56da7cad Roman Li 2026-02-02  1104  				&clk_mgr->smu_wm_set.mc_address.quad_part);
bd096a56da7cad Roman Li 2026-02-02  1105  
bd096a56da7cad Roman Li 2026-02-02  1106  	ASSERT(clk_mgr->smu_wm_set.wm_set);
bd096a56da7cad Roman Li 2026-02-02  1107  
bd096a56da7cad Roman Li 2026-02-02  1108  	/* Changed from DCN3.2_clock_frequency doc to match
bd096a56da7cad Roman Li 2026-02-02  1109  	 * dcn32_dump_clk_registers from 4 * dentist_vco_freq_khz /
bd096a56da7cad Roman Li 2026-02-02  1110  	 * dprefclk DID divider
bd096a56da7cad Roman Li 2026-02-02  1111  	 */
bd096a56da7cad Roman Li 2026-02-02  1112  	clk_mgr->base.base.dprefclk_khz = 600000;
bd096a56da7cad Roman Li 2026-02-02  1113  
bd096a56da7cad Roman Li 2026-02-02 @1114  		clk_mgr->base.smu_present = false;
bd096a56da7cad Roman Li 2026-02-02  1115  
bd096a56da7cad Roman Li 2026-02-02  1116  		if (ctx->dc_bios->integrated_info) {
bd096a56da7cad Roman Li 2026-02-02  1117  			clk_mgr->base.base.dentist_vco_freq_khz = ctx->dc_bios->integrated_info->dentist_vco_freq;
bd096a56da7cad Roman Li 2026-02-02  1118  
bd096a56da7cad Roman Li 2026-02-02  1119  			if (ctx->dc_bios->integrated_info->memory_type == LpDdr5MemType)
bd096a56da7cad Roman Li 2026-02-02  1120  				dcn42_bw_params.wm_table = lpddr5_wm_table;
bd096a56da7cad Roman Li 2026-02-02  1121  			else
bd096a56da7cad Roman Li 2026-02-02  1122  				dcn42_bw_params.wm_table = ddr5_wm_table;
bd096a56da7cad Roman Li 2026-02-02  1123  			dcn42_bw_params.vram_type = ctx->dc_bios->integrated_info->memory_type;
bd096a56da7cad Roman Li 2026-02-02  1124  			dcn42_bw_params.dram_channel_width_bytes = ctx->dc_bios->integrated_info->memory_type == 0x22 ? 8 : 4;
bd096a56da7cad Roman Li 2026-02-02  1125  			dcn42_bw_params.num_channels = ctx->dc_bios->integrated_info->ma_channel_number ? ctx->dc_bios->integrated_info->ma_channel_number : 4;
bd096a56da7cad Roman Li 2026-02-02  1126  		}
bd096a56da7cad Roman Li 2026-02-02  1127  		/* in case we don't get a value from the BIOS, use default */
bd096a56da7cad Roman Li 2026-02-02  1128  		if (clk_mgr->base.base.dentist_vco_freq_khz == 0)
bd096a56da7cad Roman Li 2026-02-02  1129  			clk_mgr->base.base.dentist_vco_freq_khz = 3000000; /* 3000MHz */
bd096a56da7cad Roman Li 2026-02-02  1130  
bd096a56da7cad Roman Li 2026-02-02  1131  		/* Saved clocks configured at boot for debug purposes */
bd096a56da7cad Roman Li 2026-02-02  1132  		dcn42_dump_clk_registers(&clk_mgr->base.base.boot_snapshot, clk_mgr);
bd096a56da7cad Roman Li 2026-02-02  1133  
bd096a56da7cad Roman Li 2026-02-02  1134  	if (clk_mgr->base.smu_present)
bd096a56da7cad Roman Li 2026-02-02  1135  		clk_mgr->base.base.dprefclk_khz = dcn42_smu_get_dprefclk(&clk_mgr->base);
bd096a56da7cad Roman Li 2026-02-02  1136  	clk_mgr->base.base.clks.ref_dtbclk_khz = 600000;
bd096a56da7cad Roman Li 2026-02-02  1137  	dce_clock_read_ss_info(&clk_mgr->base);
bd096a56da7cad Roman Li 2026-02-02  1138  	/*when clk src is from FCH, it could have ss, same clock src as DPREF clk*/
bd096a56da7cad Roman Li 2026-02-02  1139  
bd096a56da7cad Roman Li 2026-02-02  1140  	dcn42_read_ss_info_from_lut(&clk_mgr->base);
bd096a56da7cad Roman Li 2026-02-02  1141  
bd096a56da7cad Roman Li 2026-02-02  1142  	clk_mgr->base.base.bw_params = &dcn42_bw_params;
bd096a56da7cad Roman Li 2026-02-02  1143  }
bd096a56da7cad Roman Li 2026-02-02  1144  

:::::: The code at line 1114 was first introduced by commit
:::::: bd096a56da7cad1c93c0138a64478b43f5a94736 drm/amd/display: Add dcn42 DC resources

:::::: TO: Roman Li <Roman.Li@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
