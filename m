Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577B833D4E8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792022440; cv=none; b=ATnTAtjbZHND83QxwwVULUxQIcDp5ERu/Zvz21GwSNCPfMGaKiW8EvT2zrel1XooSOLmC7NMGcju2REt9jG8CSaUFDuJFsU4jaywvbR666C6iIxgR1H0B067c+vo3XmHrXmmCAItuZnIaA9fwE6JQLUBe8Bm0hPcAXFZYyItRJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792022440; c=relaxed/simple;
	bh=Hzyny1BbI3Y0cpYJ7LPBWERr/vPlV8+NOj57e1RF0dg=;
	h=Date:From:Cc:Subject:Message-ID; b=giN7+cpDeWned4PaeDl86DzAM1MfRu7DcFapBt3cVdFnOAGtiqn2WkSAe2pxm24M5UGdEo9ztqyafxCKUlMwI7IrHYfOX6xF5wk4Zg5M5El6I7dWC5HXFDgnHfb5ln/089qsg1LqKkLyzBDVQwTNM4hx2Bcz8Tty7a9b9AUcpSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C21j4QYw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C21j4QYw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792022439; x=1823558439;
  h=date:from:cc:subject:message-id;
  bh=Hzyny1BbI3Y0cpYJ7LPBWERr/vPlV8+NOj57e1RF0dg=;
  b=C21j4QYw+2WE6wawjEo8yD9vy8b9icfnzK+dYAj5OkNS2YA5shy4lTHU
   kYZdkj9NfuRolaDMIJ9yMWRRsLvbvXJyUJzFeh1J3AxYAvfmol4Aayg48
   ulIh2AlJIsrhfQMdP3pOfCY+dtOMfOo3XBSGIc3D7Ce01IYogLsqao9ga
   5F0tH2UsxFLdxFwN/6v4Us/0VwdQ9H95qtWbP4PHgRQj/v+BCRYuqxfHm
   VFCeItiz4AKqPH0e+zOZLJzAZfQkj6cTCoo70ESGf0NFLjwFKQ2iqq8lw
   CbQnUpkuaMDGg+TgbxMxL7k9Xtx7rZqExgKYOlVRjr/gYAWwnOYgqmRtn
   w==;
X-CSE-ConnectionGUID: 3faSwRtPRheZjOjso8Jqhw==
X-CSE-MsgGUID: QZ4g2aDDSF+ljVJFcwIV1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="804464"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="804464"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 17:00:38 -0700
X-CSE-ConnectionGUID: S9s5fe/vSV28cKt7GBm35Q==
X-CSE-MsgGUID: Bmn8jmLcTTaQ86OvLoXdBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3313224"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 14 Oct 2026 17:00:36 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH8ta-00000000BQB-2GdT;
	Thu, 15 Oct 2026 00:00:30 +0000
Date: Thu, 15 Oct 2026 02:00:18 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Riana Tauro <riana.tauro@intel.com>
Subject: drivers/gpu/drm/xe/xe_psmi.c:272:undefined reference to
 `xe_configfs_get_psmi_enabled'
Message-ID: <202610150105.Qrn2hmhO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0fcb05b72344f40806cbe810de8872f1698bf053
commit: afe902848b417da81f60b3d15cbae40a67286dbf drm/xe/configfs: Allow to enable PSMI
date:   1 year, 2 months ago
config: xtensa-randconfig-r2305-20261014 (https://download.01.org/0day-ci/archive/20261015/202610150105.Qrn2hmhO-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150105.Qrn2hmhO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: afe902848b41 ("drm/xe/configfs: Allow to enable PSMI")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150105.Qrn2hmhO-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: section .text VMA [00003000,0193c6fb] overlaps section .data VMA [00000000,0032a2ff]
   xtensa-linux-ld: section .init.data VMA [0032a300,0033362b] overlaps section .text VMA [00003000,0193c6fb]
   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
   arch/xtensa/kernel/entry.S:1424:(.exception.text+0x1e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: make_task_dead
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init':
   drivers/gpu/drm/xe/xe_guc.c:840:(.text+0x1b98): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   drivers/gpu/drm/xe/xe_guc.c:91:(.text+0x1e43): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engine_setup_default_lrc_state':
   drivers/gpu/drm/xe/xe_hw_engine.c:828:(.text+0x10cc): undefined reference to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x1606): undefined reference to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `psmi_debugfs_capture_addr_show':
>> drivers/gpu/drm/xe/xe_psmi.c:272:(.text+0x944): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x972): undefined reference to `xe_configfs_get_psmi_enabled'
>> xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:301:(.text+0xa04): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0xa28): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_not_sriov_vf':
>> drivers/gpu/drm/xe/xe_rtp.c:370:(.text+0x1404): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_rtp.o:drivers/gpu/drm/xe/xe_rtp.c:371: more undefined references to `xe_configfs_get_psmi_enabled' follow
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o:drivers/gpu/drm/xe/xe_survivability_mode.c:145:(.text+0x44): undefined reference to `xe_configfs_clear_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_fini':
   drivers/gpu/drm/xe/xe_survivability_mode.c:150:(.text+0x5a): undefined reference to `xe_configfs_clear_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_enabled':
   drivers/gpu/drm/xe/xe_survivability_mode.c:217:(.text+0x3d4): undefined reference to `xe_configfs_get_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:217:(.text+0x3ec): undefined reference to `xe_configfs_clear_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   drivers/gpu/drm/xe/xe_survivability_mode.c:227:(.text+0x453): undefined reference to `xe_configfs_get_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:232:(.text+0x496): undefined reference to `xe_configfs_clear_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:258:(.text+0x5a8): undefined reference to `xe_configfs_clear_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_enable':
   drivers/gpu/drm/xe/xe_survivability_mode.c:150:(.text+0x73f): undefined reference to `xe_configfs_clear_survivability_mode'


vim +272 drivers/gpu/drm/xe/xe_psmi.c

aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  260  
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  261  DEFINE_DEBUGFS_ATTRIBUTE(psmi_debugfs_capture_region_mask_fops,
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  262  			 psmi_debugfs_capture_region_mask_get,
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  263  			 psmi_debugfs_capture_region_mask_set,
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  264  			 "0x%llx\n");
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  265  
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  266  DEFINE_DEBUGFS_ATTRIBUTE(psmi_debugfs_capture_size_fops,
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  267  			 psmi_debugfs_capture_size_get,
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  268  			 psmi_debugfs_capture_size_set,
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  269  			 "%lld\n");
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  270  
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  271  void xe_psmi_debugfs_register(struct xe_device *xe)
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21 @272  {
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  273  	struct drm_minor *minor;
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  274  
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  275  	if (!psmi_enabled(xe))
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  276  		return;
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  277  
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  278  	minor = xe->drm.primary;
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  279  	if (!minor->debugfs_root)
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  280  		return;
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  281  
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  282  	debugfs_create_file("psmi_capture_addr",
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  283  			    0400, minor->debugfs_root, xe,
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  284  			    &psmi_debugfs_capture_addr_fops);
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  285  
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  286  	debugfs_create_file("psmi_capture_region_mask",
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  287  			    0600, minor->debugfs_root, xe,
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  288  			    &psmi_debugfs_capture_region_mask_fops);
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  289  
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  290  	debugfs_create_file("psmi_capture_size",
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  291  			    0600, minor->debugfs_root, xe,
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  292  			    &psmi_debugfs_capture_size_fops);
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  293  }
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  294  
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  295  static void psmi_fini(void *arg)
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  296  {
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  297  	psmi_cleanup(arg);
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  298  }
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  299  
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21  300  int xe_psmi_init(struct xe_device *xe)
aaa0c1f50a3d3fc Lucas De Marchi 2025-08-21 @301  {

:::::: The code at line 272 was first introduced by commit
:::::: aaa0c1f50a3d3fc1624360eaeb7fe69af62f7107 drm/xe/psmi: Add debugfs interface for PSMI

:::::: TO: Lucas De Marchi <lucas.demarchi@intel.com>
:::::: CC: Lucas De Marchi <lucas.demarchi@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
