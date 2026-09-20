Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4710454704D
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789867115; cv=none; b=qzabuHQrREY6LvjMWji6ewyKV+/dY+QbcWvIqy6aX6FaoUjEfCdY5Qv4ZRI1d4o7aVnfxdJaOKutJXQohJ9hXz1Tels7pTy+oJoS0pLoOqRrCCPN/aLulZ2ZH9dUzkQwQPNbz4rM1LitJ3Jb/6xvCTBrduULYh+jIODR3f5igDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789867115; c=relaxed/simple;
	bh=31Fhi4y6Jo1QtSpf1tdo8dTV+jizqiMBx+iSmWe0Ai4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eNbzUNbdofDpbSDYSEfzvztdhpfMjArUoqfnxdL30CZd5nVZgeEqowyxHX66+n0nh1zg+S315odoDXXUnXZIh5WavVGg8qExEAJeKZrCJ6NU5gHgEmCN0ArQssPNLQAWoFI7kUFij/CXRwaH9r4Y7Wc2XuJoEYt/5mPJC7pBkTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbATqjLX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbATqjLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789867112; x=1821403112;
  h=date:from:to:cc:subject:message-id;
  bh=31Fhi4y6Jo1QtSpf1tdo8dTV+jizqiMBx+iSmWe0Ai4=;
  b=EbATqjLXscQp7pA6Ml2OhogFKv9SHD0sPwDH4DiNBUwisaCoAZoPwE35
   2LgmwCnA/UKchwyCtVcTVoInR8iO9Wf9fNKmU5CmZ6eSLqY0P+naF01Th
   PKVYrimYeHy5lkh4QkF40yeFVqjS4vMBmPRu4T9CtzcaBW9S7H3YnCIum
   VU+bCp//rtSXuWz7oBHlTMr1GWw/vEeEs7EhkNZdRt8/tkCqMeQrBF7SD
   EWYDz5Oo+Mrpj9fzkpSQadE1rBLO29ks+C6JV+dYvC5Xc96bVJd4PuTU8
   DdPw9lrRpJl4XNSH1JA8FUXi8HBsRe3ZNcJJzrZa/MlTMDqMrrr2sDMQV
   A==;
X-CSE-ConnectionGUID: j3tDQhMcQC6mqSPN1eFftg==
X-CSE-MsgGUID: 5hBVsH5RRne4IowBqKFdRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="101043277"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="101043277"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 18:18:32 -0700
X-CSE-ConnectionGUID: bPDiJqtkRTCSQgTU3AqR+g==
X-CSE-MsgGUID: lgqr13fOQsKuHH5uF+CbQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="271617461"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2026 18:18:29 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x86CJ-00000000Bgl-0FY8;
	Sun, 20 Sep 2026 01:18:27 +0000
Date: Sun, 20 Sep 2026 09:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:899:64: sparse:
 sparse: cast truncates bits from constant value (44 becomes 4)
Message-ID: <202609200900.j9ZUwk42-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: af3f2f5db2659a13c256d2fb096c473eb50412ef drm/amdgpu: Remove UML build exclusion from Kconfig
date:   4 months ago
config: um-randconfig-r1303-20260920 (https://download.01.org/0day-ci/archive/20260920/202609200900.j9ZUwk42-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609200900.j9ZUwk42-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: af3f2f5db265 ("drm/amdgpu: Remove UML build exclusion from Kconfig")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609200900.j9ZUwk42-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:899:64: sparse: sparse: cast truncates bits from constant value (44 becomes 4)

vim +899 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c

85f4bc0c333ceed Alvin Lee           2022-05-02  871  
85f4bc0c333ceed Alvin Lee           2022-05-02  872  /**
6be153dc8c88409 Rodrigo Siqueira    2022-10-20  873   * dc_dmub_setup_subvp_dmub_command - Populate the DMCUB SubVP command
85f4bc0c333ceed Alvin Lee           2022-05-02  874   *
6be153dc8c88409 Rodrigo Siqueira    2022-10-20  875   * @dc: [in] current dc state
6be153dc8c88409 Rodrigo Siqueira    2022-10-20  876   * @context: [in] new dc state
01543dcf99bdaba Arthur Grillo       2023-02-13  877   * @enable: [in] if true enables the pipes population
85f4bc0c333ceed Alvin Lee           2022-05-02  878   *
6be153dc8c88409 Rodrigo Siqueira    2022-10-20  879   * This function loops through each pipe and populates the DMUB SubVP CMD info
6be153dc8c88409 Rodrigo Siqueira    2022-10-20  880   * based on the pipe (e.g. SubVP, VBLANK).
85f4bc0c333ceed Alvin Lee           2022-05-02  881   */
85f4bc0c333ceed Alvin Lee           2022-05-02  882  void dc_dmub_setup_subvp_dmub_command(struct dc *dc,
85f4bc0c333ceed Alvin Lee           2022-05-02  883  		struct dc_state *context,
85f4bc0c333ceed Alvin Lee           2022-05-02  884  		bool enable)
85f4bc0c333ceed Alvin Lee           2022-05-02  885  {
85f4bc0c333ceed Alvin Lee           2022-05-02  886  	uint8_t cmd_pipe_index = 0;
46791d147d3ab32 Tiezhu Yang         2025-10-16  887  	uint32_t i;
85f4bc0c333ceed Alvin Lee           2022-05-02  888  	uint8_t subvp_count = 0;
85f4bc0c333ceed Alvin Lee           2022-05-02  889  	union dmub_rb_cmd cmd;
85f4bc0c333ceed Alvin Lee           2022-05-02  890  	struct pipe_ctx *subvp_pipes[2];
85f4bc0c333ceed Alvin Lee           2022-05-02  891  	uint32_t wm_val_refclk = 0;
09a4ec5da92c849 Dillon Varone       2023-11-17  892  	enum mall_stream_type pipe_mall_type;
85f4bc0c333ceed Alvin Lee           2022-05-02  893  
85f4bc0c333ceed Alvin Lee           2022-05-02  894  	memset(&cmd, 0, sizeof(cmd));
85f4bc0c333ceed Alvin Lee           2022-05-02  895  	// FW command for SUBVP
85f4bc0c333ceed Alvin Lee           2022-05-02  896  	cmd.fw_assisted_mclk_switch_v2.header.type = DMUB_CMD__FW_ASSISTED_MCLK_SWITCH;
85f4bc0c333ceed Alvin Lee           2022-05-02  897  	cmd.fw_assisted_mclk_switch_v2.header.sub_type = DMUB_CMD__HANDLE_SUBVP_CMD;
85f4bc0c333ceed Alvin Lee           2022-05-02  898  	cmd.fw_assisted_mclk_switch_v2.header.payload_bytes =
85f4bc0c333ceed Alvin Lee           2022-05-02 @899  			sizeof(cmd.fw_assisted_mclk_switch_v2) - sizeof(cmd.fw_assisted_mclk_switch_v2.header);
85f4bc0c333ceed Alvin Lee           2022-05-02  900  
85f4bc0c333ceed Alvin Lee           2022-05-02  901  	for (i = 0; i < dc->res_pool->pipe_count; i++) {
85f4bc0c333ceed Alvin Lee           2022-05-02  902  		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
85f4bc0c333ceed Alvin Lee           2022-05-02  903  
b0d6de32e30c635 Alvin Lee           2022-09-01  904  		/* For SubVP pipe count, only count the top most (ODM / MPC) pipe
b0d6de32e30c635 Alvin Lee           2022-09-01  905  		 */
53f3288079460ec Wenjing Liu         2023-07-28  906  		if (resource_is_pipe_type(pipe, OTG_MASTER) &&
53f3288079460ec Wenjing Liu         2023-07-28  907  				resource_is_pipe_type(pipe, DPP_PIPE) &&
09a4ec5da92c849 Dillon Varone       2023-11-17  908  				dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_MAIN)
85f4bc0c333ceed Alvin Lee           2022-05-02  909  			subvp_pipes[subvp_count++] = pipe;
85f4bc0c333ceed Alvin Lee           2022-05-02  910  	}
85f4bc0c333ceed Alvin Lee           2022-05-02  911  
85f4bc0c333ceed Alvin Lee           2022-05-02  912  	if (enable) {
85f4bc0c333ceed Alvin Lee           2022-05-02  913  		// For each pipe that is a "main" SUBVP pipe, fill in pipe data for DMUB SUBVP cmd
46791d147d3ab32 Tiezhu Yang         2025-10-16  914  		for (i = 0; i < dc->res_pool->pipe_count; i++) {
85f4bc0c333ceed Alvin Lee           2022-05-02  915  			struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
09a4ec5da92c849 Dillon Varone       2023-11-17  916  			pipe_mall_type = dc_state_get_pipe_subvp_type(context, pipe);
85f4bc0c333ceed Alvin Lee           2022-05-02  917  
85f4bc0c333ceed Alvin Lee           2022-05-02  918  			if (!pipe->stream)
85f4bc0c333ceed Alvin Lee           2022-05-02  919  				continue;
85f4bc0c333ceed Alvin Lee           2022-05-02  920  
b0d6de32e30c635 Alvin Lee           2022-09-01  921  			/* When populating subvp cmd info, only pass in the top most (ODM / MPC) pipe.
b0d6de32e30c635 Alvin Lee           2022-09-01  922  			 * Any ODM or MPC splits being used in SubVP will be handled internally in
b0d6de32e30c635 Alvin Lee           2022-09-01  923  			 * populate_subvp_cmd_pipe_info
b0d6de32e30c635 Alvin Lee           2022-09-01  924  			 */
53f3288079460ec Wenjing Liu         2023-07-28  925  			if (resource_is_pipe_type(pipe, OTG_MASTER) &&
53f3288079460ec Wenjing Liu         2023-07-28  926  					resource_is_pipe_type(pipe, DPP_PIPE) &&
09a4ec5da92c849 Dillon Varone       2023-11-17  927  					pipe_mall_type == SUBVP_MAIN) {
85f4bc0c333ceed Alvin Lee           2022-05-02  928  				populate_subvp_cmd_pipe_info(dc, context, &cmd, pipe, cmd_pipe_index++);
53f3288079460ec Wenjing Liu         2023-07-28  929  			} else if (resource_is_pipe_type(pipe, OTG_MASTER) &&
53f3288079460ec Wenjing Liu         2023-07-28  930  					resource_is_pipe_type(pipe, DPP_PIPE) &&
09a4ec5da92c849 Dillon Varone       2023-11-17  931  					pipe_mall_type == SUBVP_NONE) {
85f4bc0c333ceed Alvin Lee           2022-05-02  932  				// Don't need to check for ActiveDRAMClockChangeMargin < 0, not valid in cases where
85f4bc0c333ceed Alvin Lee           2022-05-02  933  				// we run through DML without calculating "natural" P-state support
85f4bc0c333ceed Alvin Lee           2022-05-02  934  				populate_subvp_cmd_vblank_pipe_info(dc, context, &cmd, pipe, cmd_pipe_index++);
85f4bc0c333ceed Alvin Lee           2022-05-02  935  
85f4bc0c333ceed Alvin Lee           2022-05-02  936  			}
85f4bc0c333ceed Alvin Lee           2022-05-02  937  		}
85f4bc0c333ceed Alvin Lee           2022-05-02  938  		if (subvp_count == 2) {
85f4bc0c333ceed Alvin Lee           2022-05-02  939  			update_subvp_prefetch_end_to_mall_start(dc, context, &cmd, subvp_pipes);
85f4bc0c333ceed Alvin Lee           2022-05-02  940  		}
f4cdbb5d5405783 Gaghik Khachatrian  2026-03-31  941  		cmd.fw_assisted_mclk_switch_v2.config_data.pstate_allow_width_us = (uint8_t)dc->caps.subvp_pstate_allow_width_us;
f4cdbb5d5405783 Gaghik Khachatrian  2026-03-31  942  		cmd.fw_assisted_mclk_switch_v2.config_data.vertical_int_margin_us = (uint8_t)dc->caps.subvp_vertical_int_margin_us;
85f4bc0c333ceed Alvin Lee           2022-05-02  943  
85f4bc0c333ceed Alvin Lee           2022-05-02  944  		// Store the original watermark value for this SubVP config so we can lower it when the
85f4bc0c333ceed Alvin Lee           2022-05-02  945  		// MCLK switch starts
85f4bc0c333ceed Alvin Lee           2022-05-02  946  		wm_val_refclk = context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns *
9799702360d51a7 Alvin Lee           2022-06-29  947  				(dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000) / 1000;
85f4bc0c333ceed Alvin Lee           2022-05-02  948  
f4cdbb5d5405783 Gaghik Khachatrian  2026-03-31  949  		cmd.fw_assisted_mclk_switch_v2.config_data.watermark_a_cache = (uint16_t)(wm_val_refclk < 0xFFFF ? wm_val_refclk : 0xFFFF);
85f4bc0c333ceed Alvin Lee           2022-05-02  950  	}
e97cc04fe0fb33e Josip Pavic         2023-02-15  951  
8892780834ae294 Nicholas Kazlauskas 2023-12-04  952  	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
85f4bc0c333ceed Alvin Lee           2022-05-02  953  }
85f4bc0c333ceed Alvin Lee           2022-05-02  954  

:::::: The code at line 899 was first introduced by commit
:::::: 85f4bc0c333ceed24cbc9f69a2a77fab1ae3d4d1 drm/amd/display: Add SubVP required code

:::::: TO: Alvin Lee <Alvin.Lee2@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
