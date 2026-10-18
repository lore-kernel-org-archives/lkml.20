Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4542F43E076
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309961; cv=none; b=kOLXWudHkOMin5DacBw3J+vaKRXyUb/cHfvzKT1ED095vG5ovvD4wsF4lDvg8VKUrnDRGRGuwhXPbwvNAq4QRJkzpn5a3nzGSMU7qb2SgtTaOKXI2P4d/tDPPi0cBpwRiWbUwOPozH/PSJtSQ5KkGGzkeMqG2lOGyeIVTvHp40M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309961; c=relaxed/simple;
	bh=lWMJaBXkPiyLs8Pupi0iKQDf0Eu1t62STw2sp6XfNqM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=srw3GwI2cH1+a9/A35v7iE/TfFaE+dvkimQHXqB7pjwZ8j+RjFEPvm0yoNKYBuAAsR4JoOGhqgLVcbGa4btCRW4XnpfFb+sfaAaswOQnwtinUoFGhpERYlU2XfiLCBxEYufiNChksTa9dUfaxwyoVyqGyWLO2/gLLZ7nOfmXmaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGV/h/MV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGV/h/MV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309959; x=1823845959;
  h=date:from:to:cc:subject:message-id;
  bh=lWMJaBXkPiyLs8Pupi0iKQDf0Eu1t62STw2sp6XfNqM=;
  b=GGV/h/MVNKPOv7CJXGSv0gk25lCceaZAcguZNxmmaDA+jcydIFFGHKo7
   hoKoVTQKAhGzORV1xWvbRyJ8CfnfZ63msZjm3tvrb+oy9w0nP4cqV0i3/
   mX/e8UhPZXa8Ivgu3DF0tOz7Hu7HNqTajoVbXqOo9mfxU2EcR0mku4WUq
   NLuyoHdGw0j2XmjTHHQvW96SjI9/c2Nf29TjEI0unPUn18vtysHfO7GV1
   SZbgPZP59J1HN6/C7wvLybuJ6UuMFOlOs+zIjPLRW6UhbHlqRWqViRiwf
   OQ7Yq5cTAT/XmlzATsOj4wax5kgs43IyN6rsmiRGRlxpLAcvJV2+bEMtz
   g==;
X-CSE-ConnectionGUID: yeBahQU4Q/a5vCsGy+kTNQ==
X-CSE-MsgGUID: ldTIK4uNS+2t8roQ0WFhuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="908865"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="908865"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:37 -0700
X-CSE-ConnectionGUID: uJ158N/KS42QwuiPCR30mA==
X-CSE-MsgGUID: nNjKs6ZyRFmoLFWM1hkgvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4115560"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Oct 2026 00:52:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004y6-2kkx;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:50:46 +0200
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.c:906:undefined
 reference to `xe_configfs_primary_gt_allowed'
Message-ID: <202610180757.nt7JIKFm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
commit: 961a7582b159586aafee3cf2e81dec1d493d1715 drm/xe/sriov: Disable SR-IOV if primary GT is disabled via configfs
date:   1 year ago
config: xtensa-randconfig-r2305-20261014 (https://download.01.org/0day-ci/archive/20261018/202610180757.nt7JIKFm-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610180757.nt7JIKFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 961a7582b159 ("drm/xe/sriov: Disable SR-IOV if primary GT is disabled via configfs")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610180757.nt7JIKFm-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: section .text VMA [00003000,019563bb] overlaps section .data VMA [00000000,0032bb3b]
   xtensa-linux-ld: section .init.data VMA [0032bb40,0033526b] overlaps section .text VMA [00003000,019563bb]
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init':
   xe_guc.c:(.text+0x1854): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   xe_guc.c:(.text+0x1afa): undefined reference to `xe_configfs_get_psmi_enabled'
   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
   arch/xtensa/kernel/entry.S:1424:(.exception.text+0x1e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: make_task_dead
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engine_setup_default_lrc_state':
   drivers/gpu/drm/xe/xe_hw_engine.c:830:(.text+0x10cc): undefined reference to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   drivers/gpu/drm/xe/xe_hw_engine.c:814:(.text+0x1606): undefined reference to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_invalidate_state_cache_wa':
   drivers/gpu/drm/xe/xe_lrc.c:1116:(.text+0x6c4): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1122:(.text+0x704): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1145:(.text+0x784): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1151:(.text+0x7c4): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_write_ring':
   drivers/gpu/drm/xe/xe_lrc.c:1392:(.text+0x529c): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   drivers/gpu/drm/xe/xe_lrc.c:87:(.text+0x558c): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_probe_tile_count':
   drivers/gpu/drm/xe/xe_pci.c:759:(.text+0xb28): undefined reference to `xe_configfs_primary_gt_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.c:759:(.text+0xb78): undefined reference to `xe_configfs_media_gt_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_init':
   drivers/gpu/drm/xe/xe_pci.c:701:(.text+0xf54): undefined reference to `xe_configfs_primary_gt_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.c:731:(.text+0x108a): undefined reference to `xe_configfs_media_gt_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.c:906:(.text+0x1404): undefined reference to `xe_configfs_check_device'
>> xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.c:906:(.text+0x1490): undefined reference to `xe_configfs_primary_gt_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   drivers/gpu/drm/xe/xe_pci.c:912:(.text+0x158e): undefined reference to `xe_configfs_check_device'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.c:632:(.text+0x1857): undefined reference to `xe_configfs_primary_gt_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `psmi_debugfs_capture_addr_show':
   drivers/gpu/drm/xe/xe_psmi.c:260:(.text+0x884): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x8b2): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:289:(.text+0x944): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x968): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_not_sriov_vf':
   drivers/gpu/drm/xe/xe_rtp.c:371:(.text+0x1384): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_rtp.o:drivers/gpu/drm/xe/xe_rtp.c:372: more undefined references to `xe_configfs_get_psmi_enabled' follow
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_boot_enabled':
   drivers/gpu/drm/xe/xe_survivability_mode.c:285:(.text+0x55c): undefined reference to `xe_configfs_get_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   drivers/gpu/drm/xe/xe_survivability_mode.c:295:(.text+0x5d2): undefined reference to `xe_configfs_get_survivability_mode'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
