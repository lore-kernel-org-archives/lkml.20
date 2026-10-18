Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450913A8FEE
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309959; cv=none; b=ckmXTk141emHM0901YtDB7R0fIgP9yS0FPzpp2mzi2/e+W6YzIopUmrd2uQ3il5CuQ6qJ7TK3CbzQipAEgPhkr7NzQZGFe3Nk076duZtDKPLs45ZvaodhlIHsBzQWSFb/fEcXZs9vtyKCJt1JHyFBAJQy//YVCf33pw1Fp7e4xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309959; c=relaxed/simple;
	bh=jOjltlJUt6ytuQE6PB3StTm3i7Cihmt6VfhYP5n+vNg=;
	h=Date:From:Cc:Subject:Message-ID; b=RVZJ+gv1noQzZnaRauKQ5paDR6QglI+o8D0Ehsz4l4Cges9XrDY5cvOZ6TzJRFG+6Q0Cj16im5485nbpYX9d/Qs4OtMs/xHL9QZ3AQjCrfl8OGOsjYUosdxwPDS8I4fJ53erBJ0ndBYyO50JHL+JXy8PeTsFxfR3RDHHhke7bmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOzg1TVb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOzg1TVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309957; x=1823845957;
  h=date:from:cc:subject:message-id;
  bh=jOjltlJUt6ytuQE6PB3StTm3i7Cihmt6VfhYP5n+vNg=;
  b=bOzg1TVbdHQD6eCYfEWusKU/nPJ2vpJSYCyqlKBdsPC4lOpMRnkaQ68+
   E96dR0Y7/l3LRA0ReTwd9ZhFSdkGjlDk7pteM/eNcmLKjDaYQrJujwvQ5
   Vu3Db9Jznh3Eke/zSJva6Zb3TgeOhMkQ0NrbvEj2FH/nmhcd+J9mr2dr+
   QH64KGDkJbYS4652SSXAK3mXPUiU+cXIfMUSOxeSlbAf5DXCupvYcnyIP
   9hqG964WpLFQjlsnoZc/HJy8tiVPe7nqxR73oxZ8VavuGAui/L0tQ/kOB
   FnbflEFvDV0xWQr3Y+KT/3H586ehhGJvG8Si/3jZ7a8rbSx+h5xqferjp
   w==;
X-CSE-ConnectionGUID: veyjUdbcR3Ce+PdvQnpQ6Q==
X-CSE-MsgGUID: TPRP+OApTrO+fQAo4tZeeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="908856"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="908856"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:37 -0700
X-CSE-ConnectionGUID: 2VhYRTNoRPejXfJaAPA/tA==
X-CSE-MsgGUID: 4wqd639AQZGikhdNzrMo1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4115556"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Oct 2026 00:52:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004y3-2dNU;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:43:35 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1145:undefined
 reference to `xe_configfs_get_ctx_restore_mid_bb'
Message-ID: <202610162335.FEwMdGY9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
commit: 7a4756b2fd0431f109b07b904a7442f00838abf9 drm/xe/lrc: Allow to add user commands mid context switch
date:   1 year, 1 month ago
config: xtensa-randconfig-r2305-20261014 (https://download.01.org/0day-ci/archive/20261016/202610162335.FEwMdGY9-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610162335.FEwMdGY9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7a4756b2fd04 ("drm/xe/lrc: Allow to add user commands mid context switch")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610162335.FEwMdGY9-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: section .text VMA [00003000,01941ebb] overlaps section .data VMA [00000000,0032a4bf]
   xtensa-linux-ld: section .init.data VMA [0032a4c0,003337eb] overlaps section .text VMA [00003000,01941ebb]
   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
   arch/xtensa/kernel/entry.S:1424:(.exception.text+0x1e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: make_task_dead
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init':
   drivers/gpu/drm/xe/xe_guc.c:827:(.text+0x1cd4): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   drivers/gpu/drm/xe/xe_guc.c:90:(.text+0x1f76): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engine_setup_default_lrc_state':
   drivers/gpu/drm/xe/xe_hw_engine.c:828:(.text+0x10cc): undefined reference to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x160a): undefined reference to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_invalidate_state_cache_wa':
   drivers/gpu/drm/xe/xe_lrc.c:1116:(.text+0x6c4): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1122:(.text+0x704): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
>> xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1145:(.text+0x784): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
>> drivers/gpu/drm/xe/xe_lrc.c:1151:(.text+0x7c4): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_write_ring':
   drivers/gpu/drm/xe/xe_lrc.c:1387:(.text+0x539c): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   drivers/gpu/drm/xe/xe_lrc.c:87:(.text+0x5680): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_init':
   drivers/gpu/drm/xe/xe_pci.c:822:(.text+0x1284): undefined reference to `xe_configfs_check_device'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   drivers/gpu/drm/xe/xe_pci.c:828:(.text+0x13f6): undefined reference to `xe_configfs_check_device'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `psmi_debugfs_capture_addr_show':
   drivers/gpu/drm/xe/xe_psmi.c:260:(.text+0x904): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x932): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:289:(.text+0x9c4): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x9e8): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_not_sriov_vf':
   drivers/gpu/drm/xe/xe_rtp.c:370:(.text+0x1404): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_rtp.o:drivers/gpu/drm/xe/xe_rtp.c:371: more undefined references to `xe_configfs_get_psmi_enabled' follow
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_boot_enabled':
   drivers/gpu/drm/xe/xe_survivability_mode.c:285:(.text+0x55c): undefined reference to `xe_configfs_get_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   drivers/gpu/drm/xe/xe_survivability_mode.c:295:(.text+0x5d2): undefined reference to `xe_configfs_get_survivability_mode'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
