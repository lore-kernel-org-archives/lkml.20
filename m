Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B0643CE7C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136616; cv=none; b=L2QzHE3txOU1EwG2eQgWCAWUQ4SLedtxKMTIHzba4h7XSRDYSa5moPpRaH1ogzmf9RL1WwwHvlACnJxNxP7wxuSV9qh4InhnJgaHqdS+yUzbqR/jePbAHOlA+75aoiXek9iTd534BwVAV7ulem2vkoN69HUJuwwKmuU+JtPmc0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136616; c=relaxed/simple;
	bh=YMVAfeeQhOY2uKe/ClHKZbK8mypQg6WfeJmkmGCHtjU=;
	h=Date:From:Cc:Subject:Message-ID; b=mF8/XD/LxQlup51MzCJAZgHgyrcyVB2kgUkeaAF/rxURe1m/Z3gcWgHcokOu8R8OeBpi1oBiFu6f9Wv9yB2uO1g4qNfFbCzEvRrkCCLy/v3NtIchXn2Bsmy3UbERMKp2XhuT0vACTdm7KVVhfthVcHz2Rd1jxNayizKNUiLSOF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XuD8ojM4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XuD8ojM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792136613; x=1823672613;
  h=date:from:cc:subject:message-id;
  bh=YMVAfeeQhOY2uKe/ClHKZbK8mypQg6WfeJmkmGCHtjU=;
  b=XuD8ojM4gJdj7+W9a/x2Ym7IXW7Wyq2i3Y6kuWkmu8EqR9a6Qu6xQcFy
   rhPn/RJmJvKRDWS1W85lXkMf2ln6xyWyGbVvSdNiAx7FFowXKu0G9TfZh
   u7NYU1K6S1PSQg7Ed0BJ+5OHvkq27XmiWhFkArhAQgP1+QAnP6lmnGx6K
   pkc4HpUUUAjjJ+2hyZsflPqfjBho9E3FikD1tOIrDUqcBEvOoDNLV055x
   bonTbeKI0Wp1arWFqWkRApR7eN9m9wF8SZ8G2qnU3Fii6CdkE5kQ23cm1
   98JZLd1vHrrGCH/e4QygJXQbZyjJBWJxudlSVmXz8IQeQy2z3V3v9eoBO
   Q==;
X-CSE-ConnectionGUID: /FCLqUQWQ5qOUDyxf+7dDg==
X-CSE-MsgGUID: DAInnIGiTvC0FBSSGQwarw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="795400"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="795400"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 00:43:32 -0700
X-CSE-ConnectionGUID: xRXnyCemTH+DULf1v6De3A==
X-CSE-MsgGUID: WG5r7D2HTlOoxdhC7zHV1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1956013"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 Oct 2026 00:43:31 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHcbA-00000000C7p-2Q0R;
	Fri, 16 Oct 2026 07:43:28 +0000
Date: Fri, 16 Oct 2026 09:43:03 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: drivers/gpu/drm/xe/xe_lrc.c:1110:undefined reference to
 `xe_configfs_get_ctx_restore_post_bb'
Message-ID: <202610160935.Qk4ZxBxY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Lucas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
commit: 6c6988c5e03df145e6c5cabc50d67b11f5aa2e56 drm/xe/lrc: Allow to add user commands on context switch
date:   1 year, 1 month ago
config: xtensa-randconfig-r2305-20261014 (https://download.01.org/0day-ci/archive/20261016/202610160935.Qk4ZxBxY-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610160935.Qk4ZxBxY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6c6988c5e03d ("drm/xe/lrc: Allow to add user commands on context switch")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610160935.Qk4ZxBxY-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: section .text VMA [00003000,01941e7b] overlaps section .data VMA [00000000,0032a4bf]
   xtensa-linux-ld: section .init.data VMA [0032a4c0,003337eb] overlaps section .text VMA [00003000,01941e7b]
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
>> drivers/gpu/drm/xe/xe_lrc.c:1110:(.text+0x6c4): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1116:(.text+0x704): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
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


vim +1110 drivers/gpu/drm/xe/xe_lrc.c

  1106	
  1107	static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
  1108							  struct xe_hw_engine *hwe,
  1109							  u32 *batch, size_t max_len)
> 1110	{
  1111		struct xe_device *xe = gt_to_xe(lrc->gt);
  1112		const u32 *user_batch;
  1113		u32 *cmd = batch;
  1114		u32 count;
  1115	
  1116		count = xe_configfs_get_ctx_restore_post_bb(to_pci_dev(xe->drm.dev),
  1117							    hwe->class, &user_batch);
  1118		if (!count)
  1119			return 0;
  1120	
  1121		if (count > max_len)
  1122			return -ENOSPC;
  1123	
  1124		/*
  1125		 * This should be used only for tests and validation. Taint the kernel
  1126		 * as anything could be submitted directly in context switches
  1127		 */
  1128		add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
  1129	
  1130		memcpy(cmd, user_batch, count * sizeof(u32));
  1131		cmd += count;
  1132	
  1133		return cmd - batch;
  1134	}
  1135	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
