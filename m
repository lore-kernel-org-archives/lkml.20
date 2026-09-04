Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB81D30D402
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788482066; cv=none; b=KhkMYQkd0NgenMe5hY1CltJWtzVxbYb0Efgmtkr92RACAyVb1oaiamwRmW+51jnIsbQOfiyQwEJpaJWRnoP6EtISBYW3Tttp+UjOp+G9Q9bLZRo7v5WgPEIvFev37vW2tRjxOIHayWqfXaNsQ4g2iISursdeQbffrLbm3DIB9hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788482066; c=relaxed/simple;
	bh=a4VTe6NE9NGlEJe3SJBZsmD34CWPoF3PWXmfEFo3IDY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I8qBh5qPiLbQYEfa7PVjfkfUuGLiq1UhEcZnJxHSlmkulFhCXchopddK09iqSJ/pMlJKlrMONmkL7qmDYs/EP39SzTfdoVKhTzHp7Kz38aWAMBPkQgJcqgDpAiTZYNwTXK0oeKesPBtBTej3x+0TTNuQCFrRpq8wvYZEVrHqMfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgUQkZOK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgUQkZOK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788482064; x=1820018064;
  h=date:from:to:cc:subject:message-id;
  bh=a4VTe6NE9NGlEJe3SJBZsmD34CWPoF3PWXmfEFo3IDY=;
  b=hgUQkZOKmeYti7vuaVyMeobTg0kqY2SZy8O5GF+4o2uYFnyqTftNJu2S
   U6TXpZkfUAWFid0IEhmSY4oPXk6E+9wVQbuHhTl/ejA6qFwSqRtOM9Te0
   RlY8Lf4FIGTwVoJhJBHlK6tPWxq3RHtITRZyQsNhMCAYc1HS8OxMLriWC
   f7Gwg2b2Af7pULK9G4qdetYEw4szl8xllZJAwGxk3TUu7NE4GGpxvuBFW
   hcmKxeCYnfQ5F049kuZV//NaqLlK59khKKSzgyYzCBknACm+1Bo4IfUvV
   QSQw7ERj83wWYujHCwRyCpxZ4NlmqDj8fpWlKRTPCn2qIcg/stdqcouTh
   w==;
X-CSE-ConnectionGUID: O8yoWQyeQyS13LVp3wWBZg==
X-CSE-MsgGUID: JXkPpxKyRp2WlaDJGFI1nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88826613"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88826613"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 17:34:23 -0700
X-CSE-ConnectionGUID: guwPD6aBT76swHkWZlFing==
X-CSE-MsgGUID: PicQbSSFTveewJqC1Fm+zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="267310691"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Sep 2026 17:34:21 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2Hsp-000000005Ww-08oK;
	Fri, 04 Sep 2026 00:34:19 +0000
Date: Fri, 04 Sep 2026 08:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: Lohita Mudimela <lohita.mudimela@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Martin Leung <martin.leung@amd.com>, James Lin <pinglei.lin@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:817
 mod_power_update_backlight_on_mode_change() warn: inconsistent indenting
Message-ID: <202609040849.tyd1k6g6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a500db7819c50db59e55f1b4fa1c3baa5a2616f3
commit: 254a47ce0c8a52ff78a60f92a13b56db69f69096 drm/amd/display: Separate ABM functions into dedicated power_abm.c file
date:   4 months ago
config: i386-randconfig-141-20260903 (https://download.01.org/0day-ci/archive/20260904/202609040849.tyd1k6g6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 254a47ce0c8a ("drm/amd/display: Separate ABM functions into dedicated power_abm.c file")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609040849.tyd1k6g6-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:817 mod_power_update_backlight_on_mode_change() warn: inconsistent indenting

vim +817 drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c

   807	
   808	void mod_power_update_backlight_on_mode_change(
   809	    struct core_power *core_power,
   810	    struct dc_link *link,
   811	    unsigned int panel_inst,
   812	    uint8_t aux_inst,
   813	    bool is_hdr)
   814	{
   815	    struct set_backlight_level_params backlight_level_params = { 0 };
   816	
 > 817			if (link->dpcd_sink_ext_caps.bits.hdr_aux_backlight_control == 1 ||
   818				link->dpcd_sink_ext_caps.bits.sdr_aux_backlight_control == 1)
   819				dc_link_set_backlight_level_nits(link, core_power->bl_state[panel_inst].isHDR,
   820					core_power->bl_state[panel_inst].backlight_millinit, 0);
   821	
   822			backlight_level_params.frame_ramp = 0;
   823	
   824			fill_backlight_level_params(core_power, &backlight_level_params, panel_inst, aux_inst,
   825				core_power->bl_state[panel_inst].backlight_pwm, link->backlight_control_type,
   826				core_power->bl_state[panel_inst].backlight_millinit, 0, is_hdr);
   827	
   828			dc_link_set_backlight_level(link, &backlight_level_params);
   829	}
   830	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
