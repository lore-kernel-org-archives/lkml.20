Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D22C272803
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 03:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788578338; cv=none; b=fn4py7r2mj6Oxd85RUGBIL11Hk6STBnxILEDn9GYk9HrdZgpmXm1rs2FqTLmwrtnTxD3Reeci/8svcumtzqQd9D0vkTnZr4ymaZ4TmttgOpmmPkz64ChkcyeRl1h/FHvHxYk89N0NnF8Kkr15jJ0yyGjCVWrljRRcB05GL+Zgq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788578338; c=relaxed/simple;
	bh=OCHZec8xzOkx0WgiU4MsVVE6VA6lzqFUeZWuYY+gOts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gBnoiXK7QdYcV71HJ+q//J3p4R9O3bNVa9K1reoGwKlET1ZToh2AohDA+JX1zdz8W+IAyUjiQ8gfOgQi1WB8K9sZH49PsYKhSgIf+9aG/IJuZJO+vnjmxepjBeLV6rxO7fZhfP1UCgndsgTFjjK1AQJMmpG/Q1X0i7DqR29Pt8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WmxAtGZZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WmxAtGZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788578337; x=1820114337;
  h=date:from:to:cc:subject:message-id;
  bh=OCHZec8xzOkx0WgiU4MsVVE6VA6lzqFUeZWuYY+gOts=;
  b=WmxAtGZZkuVsuBBnvgIkGNuhtJAerAgvCFytYd+Kh5UmN9AaRzAqGy1u
   02f/aSkJFVdcwym5Zc+Wl7tTeg1YfAXBIKdvzjNm+lUJ63hHaqn4l58I+
   IaBJ/pekuDzVLWo15g6UDtBCXdDKvIRIcthK6POAdVlz1keCoBx8OCxsN
   pzKi+6DqR2vIFcLyNmAO8CeNzHT/a7/2ktq4BPhvK+2+JlILm2Ti5Uuy7
   meWSdRt2KZNYrmPh6TtvoPHoTWIIsXX5XpEr6YepFuArf65NjVIcoWj6x
   ID3+UL1xxGRm+sPqu+rM3oG+rQ17Oq9VYI0vocTkWvfpQsj7xchD9wAzb
   Q==;
X-CSE-ConnectionGUID: l3swCjfQRAiQNGT4fgGhMw==
X-CSE-MsgGUID: K6+ObiTURmq3KfmiL1+PIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89134578"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="89134578"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 20:18:56 -0700
X-CSE-ConnectionGUID: JGVfVwjUTc+3Wu7ZMy/JbQ==
X-CSE-MsgGUID: HZaGHrTXRleP+uViY4bJRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="274353369"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Sep 2026 20:18:54 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2gvb-00000000Af9-3LIf;
	Sat, 05 Sep 2026 03:18:51 +0000
Date: Sat, 05 Sep 2026 11:17:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_dmub.c:191:25:
 sparse: sparse: cast to restricted __le32
Message-ID: <202609051130.28FOOCAW-lkp@intel.com>
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
config: alpha-randconfig-r131-20260904 (https://download.01.org/0day-ci/archive/20260905/202609051130.28FOOCAW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051130.28FOOCAW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1d8cfeb69daa ("drm/amdgpu: Pack nested ucode_info struct")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051130.28FOOCAW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_dmub.c:191:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_dmub.c:195:23: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_dmub.c:196:23: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_dmub.c:201:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_dmub.c:569:37: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_dmub.c:577:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_dmub.c:577:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_dmub.c:577:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_dmub.c:608:47: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_dmub.c:610:45: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_dmub.c:612:45: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_dmub.c:615:43: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_dmub.c:616:43: sparse: sparse: cast to restricted __le32

vim +191 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_dmub.c

4734e045f49d9b Alex Hung     2026-04-27  136  
4734e045f49d9b Alex Hung     2026-04-27  137  int dm_dmub_hw_init(struct amdgpu_device *adev)
4734e045f49d9b Alex Hung     2026-04-27  138  {
4734e045f49d9b Alex Hung     2026-04-27  139  	const struct dmcub_firmware_header_v1_0 *hdr;
4734e045f49d9b Alex Hung     2026-04-27  140  	struct dmub_srv *dmub_srv = adev->dm.dmub_srv;
4734e045f49d9b Alex Hung     2026-04-27  141  	struct dmub_srv_fb_info *fb_info = adev->dm.dmub_fb_info;
4734e045f49d9b Alex Hung     2026-04-27  142  	const struct firmware *dmub_fw = adev->dm.dmub_fw;
4734e045f49d9b Alex Hung     2026-04-27  143  	struct dc *dc = adev->dm.dc;
4734e045f49d9b Alex Hung     2026-04-27  144  	struct dmcu *dmcu = adev->dm.dc->res_pool->dmcu;
4734e045f49d9b Alex Hung     2026-04-27  145  	struct abm *abm = adev->dm.dc->res_pool->abm;
4734e045f49d9b Alex Hung     2026-04-27  146  	struct dc_context *ctx = adev->dm.dc->ctx;
4734e045f49d9b Alex Hung     2026-04-27  147  	struct dmub_srv_hw_params hw_params;
4734e045f49d9b Alex Hung     2026-04-27  148  	enum dmub_status status;
4734e045f49d9b Alex Hung     2026-04-27  149  	const unsigned char *fw_inst_const, *fw_bss_data;
5b69770e945caa Dillon Varone 2026-06-23  150  	u32 fw_inst_const_size, fw_bss_data_size;
4734e045f49d9b Alex Hung     2026-04-27  151  	bool has_hw_support;
4734e045f49d9b Alex Hung     2026-04-27  152  
4734e045f49d9b Alex Hung     2026-04-27  153  	if (!dmub_srv)
4734e045f49d9b Alex Hung     2026-04-27  154  		/* DMUB isn't supported on the ASIC. */
4734e045f49d9b Alex Hung     2026-04-27  155  		return 0;
4734e045f49d9b Alex Hung     2026-04-27  156  
4734e045f49d9b Alex Hung     2026-04-27  157  	if (!fb_info) {
4734e045f49d9b Alex Hung     2026-04-27  158  		drm_err(adev_to_drm(adev), "No framebuffer info for DMUB service.\n");
4734e045f49d9b Alex Hung     2026-04-27  159  		return -EINVAL;
4734e045f49d9b Alex Hung     2026-04-27  160  	}
4734e045f49d9b Alex Hung     2026-04-27  161  
4734e045f49d9b Alex Hung     2026-04-27  162  	if (!dmub_fw) {
4734e045f49d9b Alex Hung     2026-04-27  163  		/* Firmware required for DMUB support. */
4734e045f49d9b Alex Hung     2026-04-27  164  		drm_err(adev_to_drm(adev), "No firmware provided for DMUB.\n");
4734e045f49d9b Alex Hung     2026-04-27  165  		return -EINVAL;
4734e045f49d9b Alex Hung     2026-04-27  166  	}
4734e045f49d9b Alex Hung     2026-04-27  167  
4734e045f49d9b Alex Hung     2026-04-27  168  	/* initialize register offsets for ASICs with runtime initialization available */
4734e045f49d9b Alex Hung     2026-04-27  169  	if (dmub_srv->hw_funcs.init_reg_offsets)
4734e045f49d9b Alex Hung     2026-04-27  170  		dmub_srv->hw_funcs.init_reg_offsets(dmub_srv, ctx);
4734e045f49d9b Alex Hung     2026-04-27  171  
4734e045f49d9b Alex Hung     2026-04-27  172  	status = dmub_srv_has_hw_support(dmub_srv, &has_hw_support);
4734e045f49d9b Alex Hung     2026-04-27  173  	if (status != DMUB_STATUS_OK) {
4734e045f49d9b Alex Hung     2026-04-27  174  		drm_err(adev_to_drm(adev), "Error checking HW support for DMUB: %d\n", status);
4734e045f49d9b Alex Hung     2026-04-27  175  		return -EINVAL;
4734e045f49d9b Alex Hung     2026-04-27  176  	}
4734e045f49d9b Alex Hung     2026-04-27  177  
4734e045f49d9b Alex Hung     2026-04-27  178  	if (!has_hw_support) {
4734e045f49d9b Alex Hung     2026-04-27  179  		drm_info(adev_to_drm(adev), "DMUB unsupported on ASIC\n");
4734e045f49d9b Alex Hung     2026-04-27  180  		return 0;
4734e045f49d9b Alex Hung     2026-04-27  181  	}
4734e045f49d9b Alex Hung     2026-04-27  182  
4734e045f49d9b Alex Hung     2026-04-27  183  	/* Reset DMCUB if it was previously running - before we overwrite its memory. */
4734e045f49d9b Alex Hung     2026-04-27  184  	status = dmub_srv_hw_reset(dmub_srv);
4734e045f49d9b Alex Hung     2026-04-27  185  	if (status != DMUB_STATUS_OK)
4734e045f49d9b Alex Hung     2026-04-27  186  		drm_warn(adev_to_drm(adev), "Error resetting DMUB HW: %d\n", status);
4734e045f49d9b Alex Hung     2026-04-27  187  
4734e045f49d9b Alex Hung     2026-04-27  188  	hdr = (const struct dmcub_firmware_header_v1_0 *)dmub_fw->data;
4734e045f49d9b Alex Hung     2026-04-27  189  
4734e045f49d9b Alex Hung     2026-04-27  190  	fw_inst_const = dmub_fw->data +
4734e045f49d9b Alex Hung     2026-04-27 @191  			le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
4734e045f49d9b Alex Hung     2026-04-27  192  			PSP_HEADER_BYTES_256;
4734e045f49d9b Alex Hung     2026-04-27  193  
4734e045f49d9b Alex Hung     2026-04-27  194  	fw_bss_data = dmub_fw->data +
4734e045f49d9b Alex Hung     2026-04-27  195  		      le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
4734e045f49d9b Alex Hung     2026-04-27  196  		      le32_to_cpu(hdr->inst_const_bytes);
4734e045f49d9b Alex Hung     2026-04-27  197  
4734e045f49d9b Alex Hung     2026-04-27  198  	/* Copy firmware and bios info into FB memory. */
4734e045f49d9b Alex Hung     2026-04-27  199  	fw_inst_const_size = adev->dm.fw_inst_size;
4734e045f49d9b Alex Hung     2026-04-27  200  
4734e045f49d9b Alex Hung     2026-04-27  201  	fw_bss_data_size = le32_to_cpu(hdr->bss_data_bytes);
4734e045f49d9b Alex Hung     2026-04-27  202  
4734e045f49d9b Alex Hung     2026-04-27  203  	/* if adev->firmware.load_type == AMDGPU_FW_LOAD_PSP,
4734e045f49d9b Alex Hung     2026-04-27  204  	 * amdgpu_ucode_init_single_fw will load dmub firmware
4734e045f49d9b Alex Hung     2026-04-27  205  	 * fw_inst_const part to cw0; otherwise, the firmware back door load
4734e045f49d9b Alex Hung     2026-04-27  206  	 * will be done by dm_dmub_hw_init
4734e045f49d9b Alex Hung     2026-04-27  207  	 */
4734e045f49d9b Alex Hung     2026-04-27  208  	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
4734e045f49d9b Alex Hung     2026-04-27  209  		memcpy(fb_info->fb[DMUB_WINDOW_0_INST_CONST].cpu_addr, fw_inst_const,
4734e045f49d9b Alex Hung     2026-04-27  210  				fw_inst_const_size);
4734e045f49d9b Alex Hung     2026-04-27  211  	}
4734e045f49d9b Alex Hung     2026-04-27  212  
4734e045f49d9b Alex Hung     2026-04-27  213  	if (fw_bss_data_size)
4734e045f49d9b Alex Hung     2026-04-27  214  		memcpy(fb_info->fb[DMUB_WINDOW_2_BSS_DATA].cpu_addr,
4734e045f49d9b Alex Hung     2026-04-27  215  		       fw_bss_data, fw_bss_data_size);
4734e045f49d9b Alex Hung     2026-04-27  216  
4734e045f49d9b Alex Hung     2026-04-27  217  	/* Copy firmware bios info into FB memory. */
4734e045f49d9b Alex Hung     2026-04-27  218  	memcpy(fb_info->fb[DMUB_WINDOW_3_VBIOS].cpu_addr, adev->bios,
4734e045f49d9b Alex Hung     2026-04-27  219  	       adev->bios_size);
4734e045f49d9b Alex Hung     2026-04-27  220  
4734e045f49d9b Alex Hung     2026-04-27  221  	/* Reset regions that need to be reset. */
4734e045f49d9b Alex Hung     2026-04-27  222  	memset(fb_info->fb[DMUB_WINDOW_4_MAILBOX].cpu_addr, 0,
4734e045f49d9b Alex Hung     2026-04-27  223  	fb_info->fb[DMUB_WINDOW_4_MAILBOX].size);
4734e045f49d9b Alex Hung     2026-04-27  224  
4734e045f49d9b Alex Hung     2026-04-27  225  	memset(fb_info->fb[DMUB_WINDOW_5_TRACEBUFF].cpu_addr, 0,
4734e045f49d9b Alex Hung     2026-04-27  226  	       fb_info->fb[DMUB_WINDOW_5_TRACEBUFF].size);
4734e045f49d9b Alex Hung     2026-04-27  227  
4734e045f49d9b Alex Hung     2026-04-27  228  	memset(fb_info->fb[DMUB_WINDOW_6_FW_STATE].cpu_addr, 0,
4734e045f49d9b Alex Hung     2026-04-27  229  	       fb_info->fb[DMUB_WINDOW_6_FW_STATE].size);
4734e045f49d9b Alex Hung     2026-04-27  230  
4734e045f49d9b Alex Hung     2026-04-27  231  	memset(fb_info->fb[DMUB_WINDOW_SHARED_STATE].cpu_addr, 0,
4734e045f49d9b Alex Hung     2026-04-27  232  	       fb_info->fb[DMUB_WINDOW_SHARED_STATE].size);
4734e045f49d9b Alex Hung     2026-04-27  233  
4734e045f49d9b Alex Hung     2026-04-27  234  	/* Initialize hardware. */
4734e045f49d9b Alex Hung     2026-04-27  235  	memset(&hw_params, 0, sizeof(hw_params));
4734e045f49d9b Alex Hung     2026-04-27  236  	hw_params.soc_fb_info.fb_base = adev->gmc.fb_start;
4734e045f49d9b Alex Hung     2026-04-27  237  	hw_params.soc_fb_info.fb_offset = adev->vm_manager.vram_base_offset;
4734e045f49d9b Alex Hung     2026-04-27  238  
4734e045f49d9b Alex Hung     2026-04-27  239  	/* backdoor load firmware and trigger dmub running */
4734e045f49d9b Alex Hung     2026-04-27  240  	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP)
4734e045f49d9b Alex Hung     2026-04-27  241  		hw_params.load_inst_const = true;
4734e045f49d9b Alex Hung     2026-04-27  242  
4734e045f49d9b Alex Hung     2026-04-27  243  	if (dmcu)
4734e045f49d9b Alex Hung     2026-04-27  244  		hw_params.psp_version = dmcu->psp_version;
4734e045f49d9b Alex Hung     2026-04-27  245  
5b69770e945caa Dillon Varone 2026-06-23  246  	hw_params.fb_info = fb_info;
4734e045f49d9b Alex Hung     2026-04-27  247  
4734e045f49d9b Alex Hung     2026-04-27  248  	/* Enable usb4 dpia in the FW APU */
4734e045f49d9b Alex Hung     2026-04-27  249  	if (dc->caps.is_apu &&
4734e045f49d9b Alex Hung     2026-04-27  250  		dc->res_pool->usb4_dpia_count != 0 &&
4734e045f49d9b Alex Hung     2026-04-27  251  		!dc->debug.dpia_debug.bits.disable_dpia) {
4734e045f49d9b Alex Hung     2026-04-27  252  		hw_params.dpia_supported = true;
4734e045f49d9b Alex Hung     2026-04-27  253  		hw_params.disable_dpia = dc->debug.dpia_debug.bits.disable_dpia;
4734e045f49d9b Alex Hung     2026-04-27  254  		hw_params.dpia_hpd_int_enable_supported = false;
4734e045f49d9b Alex Hung     2026-04-27  255  		hw_params.enable_non_transparent_setconfig = dc->config.consolidated_dpia_dp_lt;
4734e045f49d9b Alex Hung     2026-04-27  256  		hw_params.disable_dpia_bw_allocation = !dc->config.usb4_bw_alloc_support;
4734e045f49d9b Alex Hung     2026-04-27  257  	}
4734e045f49d9b Alex Hung     2026-04-27  258  
4734e045f49d9b Alex Hung     2026-04-27  259  	switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
4734e045f49d9b Alex Hung     2026-04-27  260  	case IP_VERSION(3, 5, 0):
4734e045f49d9b Alex Hung     2026-04-27  261  	case IP_VERSION(3, 5, 1):
4734e045f49d9b Alex Hung     2026-04-27  262  	case IP_VERSION(3, 6, 0):
4734e045f49d9b Alex Hung     2026-04-27  263  	case IP_VERSION(4, 2, 0):
4734e045f49d9b Alex Hung     2026-04-27  264  	case IP_VERSION(4, 2, 1):
4734e045f49d9b Alex Hung     2026-04-27  265  		hw_params.ips_sequential_ono = adev->external_rev_id > 0x10;
4734e045f49d9b Alex Hung     2026-04-27  266  		hw_params.lower_hbr3_phy_ssc = true;
4734e045f49d9b Alex Hung     2026-04-27  267  		break;
4734e045f49d9b Alex Hung     2026-04-27  268  	default:
4734e045f49d9b Alex Hung     2026-04-27  269  		break;
4734e045f49d9b Alex Hung     2026-04-27  270  	}
4734e045f49d9b Alex Hung     2026-04-27  271  
4734e045f49d9b Alex Hung     2026-04-27  272  	status = dmub_srv_hw_init(dmub_srv, &hw_params);
4734e045f49d9b Alex Hung     2026-04-27  273  	if (status != DMUB_STATUS_OK) {
4734e045f49d9b Alex Hung     2026-04-27  274  		drm_err(adev_to_drm(adev), "Error initializing DMUB HW: %d\n", status);
4734e045f49d9b Alex Hung     2026-04-27  275  		return -EINVAL;
4734e045f49d9b Alex Hung     2026-04-27  276  	}
4734e045f49d9b Alex Hung     2026-04-27  277  
4734e045f49d9b Alex Hung     2026-04-27  278  	/* Wait for firmware load to finish. */
4734e045f49d9b Alex Hung     2026-04-27  279  	status = dmub_srv_wait_for_auto_load(dmub_srv, 100000);
4734e045f49d9b Alex Hung     2026-04-27  280  	if (status != DMUB_STATUS_OK)
4734e045f49d9b Alex Hung     2026-04-27  281  		drm_warn(adev_to_drm(adev), "Wait for DMUB auto-load failed: %d\n", status);
4734e045f49d9b Alex Hung     2026-04-27  282  
4734e045f49d9b Alex Hung     2026-04-27  283  	/* Init DMCU and ABM if available. */
4734e045f49d9b Alex Hung     2026-04-27  284  	if (dmcu && abm) {
4734e045f49d9b Alex Hung     2026-04-27  285  		dmcu->funcs->dmcu_init(dmcu);
4734e045f49d9b Alex Hung     2026-04-27  286  		abm->dmcu_is_running = dmcu->funcs->is_dmcu_initialized(dmcu);
4734e045f49d9b Alex Hung     2026-04-27  287  	}
4734e045f49d9b Alex Hung     2026-04-27  288  
4734e045f49d9b Alex Hung     2026-04-27  289  	if (!adev->dm.dc->ctx->dmub_srv)
4734e045f49d9b Alex Hung     2026-04-27  290  		adev->dm.dc->ctx->dmub_srv = dc_dmub_srv_create(adev->dm.dc, dmub_srv);
4734e045f49d9b Alex Hung     2026-04-27  291  	if (!adev->dm.dc->ctx->dmub_srv) {
4734e045f49d9b Alex Hung     2026-04-27  292  		drm_err(adev_to_drm(adev), "Couldn't allocate DC DMUB server!\n");
4734e045f49d9b Alex Hung     2026-04-27  293  		return -ENOMEM;
4734e045f49d9b Alex Hung     2026-04-27  294  	}
4734e045f49d9b Alex Hung     2026-04-27  295  
4734e045f49d9b Alex Hung     2026-04-27  296  	drm_info(adev_to_drm(adev), "DMUB hardware initialized: version=0x%08X\n",
4734e045f49d9b Alex Hung     2026-04-27  297  		 adev->dm.dmcub_fw_version);
4734e045f49d9b Alex Hung     2026-04-27  298  
4734e045f49d9b Alex Hung     2026-04-27  299  	/* Keeping sanity checks off if
4734e045f49d9b Alex Hung     2026-04-27  300  	 * DCN31 >= 4.0.59.0
4734e045f49d9b Alex Hung     2026-04-27  301  	 * DCN314 >= 8.0.16.0
4734e045f49d9b Alex Hung     2026-04-27  302  	 * Otherwise, turn on sanity checks
4734e045f49d9b Alex Hung     2026-04-27  303  	 */
4734e045f49d9b Alex Hung     2026-04-27  304  	switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
4734e045f49d9b Alex Hung     2026-04-27  305  	case IP_VERSION(3, 1, 2):
4734e045f49d9b Alex Hung     2026-04-27  306  	case IP_VERSION(3, 1, 3):
4734e045f49d9b Alex Hung     2026-04-27  307  		if (adev->dm.dmcub_fw_version &&
4734e045f49d9b Alex Hung     2026-04-27  308  		    adev->dm.dmcub_fw_version >= DMUB_FW_VERSION(4, 0, 0) &&
4734e045f49d9b Alex Hung     2026-04-27  309  		    adev->dm.dmcub_fw_version < DMUB_FW_VERSION(4, 0, 59))
4734e045f49d9b Alex Hung     2026-04-27  310  			adev->dm.dc->debug.sanity_checks = true;
4734e045f49d9b Alex Hung     2026-04-27  311  		break;
4734e045f49d9b Alex Hung     2026-04-27  312  	case IP_VERSION(3, 1, 4):
4734e045f49d9b Alex Hung     2026-04-27  313  		if (adev->dm.dmcub_fw_version &&
4734e045f49d9b Alex Hung     2026-04-27  314  		    adev->dm.dmcub_fw_version >= DMUB_FW_VERSION(4, 0, 0) &&
4734e045f49d9b Alex Hung     2026-04-27  315  		    adev->dm.dmcub_fw_version < DMUB_FW_VERSION(8, 0, 16))
4734e045f49d9b Alex Hung     2026-04-27  316  			adev->dm.dc->debug.sanity_checks = true;
4734e045f49d9b Alex Hung     2026-04-27  317  		break;
4734e045f49d9b Alex Hung     2026-04-27  318  	default:
4734e045f49d9b Alex Hung     2026-04-27  319  		break;
4734e045f49d9b Alex Hung     2026-04-27  320  	}
4734e045f49d9b Alex Hung     2026-04-27  321  
4734e045f49d9b Alex Hung     2026-04-27  322  	return 0;
4734e045f49d9b Alex Hung     2026-04-27  323  }
829e9b68eaf2f5 Alex Hung     2026-04-29  324  EXPORT_IF_KUNIT(dm_dmub_hw_init);
4734e045f49d9b Alex Hung     2026-04-27  325  

:::::: The code at line 191 was first introduced by commit
:::::: 4734e045f49d9bb801b4a3eef30d6ca7fba44280 drm/amd/display: Extract DMUB code to amdgpu_dm_dmub

:::::: TO: Alex Hung <alex.hung@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
