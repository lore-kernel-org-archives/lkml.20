Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F292A476CD4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765758; cv=none; b=rmolDfHm6LkSocAShm7D54i7Wac/2LOpcdF0SUvj+oFOmIz1AoyX1el5UCIDx7MA9gri8ohBUNbqlo7nYDcHrfU7fbZ3GjV6UpW2nDMUkXhFegpm5OdTzNaNbBtWjLlSUg5wYcCq9U4F19J1e/JzlnVYXcbj6KLAduQLPneDdU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765758; c=relaxed/simple;
	bh=PVFussZbsYlVLxgNpvhYQuR92VZFKCCQuM4dQfeSBM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eU9l77ZymjibQ72njw/5/hNFpaFMRFsyfqwxlKl5rK0DxOcMqvfxkWEBH8p51KKVFvQU0lVo/2bPAdN4mY32O1NK0nKI0XYE4zHcoElH3Dz96sNEIUkbT5+qZ37WBcNF2HXz/IPDoICoJBe+kzTyTh1qqSrYaHvzn4TpcS2KECE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAXAODIs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAXAODIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790765750; x=1822301750;
  h=date:from:to:cc:subject:message-id;
  bh=PVFussZbsYlVLxgNpvhYQuR92VZFKCCQuM4dQfeSBM8=;
  b=CAXAODIsLa1OVYhwWr68Bw/K4rMTPRRRaIpybT5yK3qNYDqOW9Fc92tj
   MBQJS2TBFk0TEbnfjfmuNmnqc5f2C74pgoLm4eYnTQZdAcoi+nuWlsCip
   Cm83RaA9gY+ifSBEv2fvdpP4eRNHz1PtIg5xigjCphaMkshJtcSfB3RxM
   lmakuZXT0t43Qpu7SZdtSJOkQ29tU57BPu0oajyinRxcG7UL+GGySfs82
   r/UA53Qo6Nuk84PWtMCv7WegEWnHiV+uek3IntUATFkNijJxLXhpgTv5G
   Jc5hobhxQ3JoDLm6nZcyMRPogxdEBoTT6h+RqIxKKSIVZsWQN/8AmIJYi
   w==;
X-CSE-ConnectionGUID: SPD+VJvZSXaxInItF3s5Fw==
X-CSE-MsgGUID: uIoJl3mEQD+AFMQDMP2dww==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90359681"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90359681"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 03:55:45 -0700
X-CSE-ConnectionGUID: 6O8aR3UjQ269np4LkYtL6w==
X-CSE-MsgGUID: dvBVNMbYQhqoXw+VPBK2Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="273749741"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 30 Sep 2026 03:55:43 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBryP-000000001pt-02z0;
	Wed, 30 Sep 2026 10:55:41 +0000
Date: Wed, 30 Sep 2026 12:55:07 +0200
From: kernel test robot <lkp@intel.com>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: drivers/gpu/drm/bridge/inno-hdmi.c:833:21: sparse: sparse:
 unsigned value that used to be signed checked against zero?
Message-ID: <202609301203.uv1O6huD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   551c722f40809618230001baccf219193e22fc5a
commit: 969325a2597ebc4cb001a92992f06f698ab2b467 drm/rockchip: inno-hdmi: Convert to drm bridge
date:   9 months ago
config: sparc-randconfig-r2301-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301203.uv1O6huD-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301203.uv1O6huD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 969325a2597e ("drm/rockchip: inno-hdmi: Convert to drm bridge")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301203.uv1O6huD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/inno-hdmi.c:833:21: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/gpu/drm/bridge/inno-hdmi.c:818:35: sparse: signed value source

vim +833 drivers/gpu/drm/bridge/inno-hdmi.c

412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang       2016-02-03  805  
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan         2025-10-16  806  static enum drm_mode_status inno_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan         2025-10-16  807  							const struct drm_display_info *info,
26d6fd81916e62 drivers/gpu/drm/rockchip/inno_hdmi.c Dmitry Baryshkov 2024-12-14  808  							const struct drm_display_mode *mode)
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  809  {
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan         2025-10-16  810  	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  811  	unsigned long mpixelclk, max_tolerance;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  812  	long rounded_refclk;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  813  
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  814  	/* No support for double-clock modes */
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  815  	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  816  		return MODE_BAD;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  817  
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  818  	mpixelclk = mode->clock * 1000;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  819  
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  820  	if (mpixelclk < INNO_HDMI_MIN_TMDS_CLOCK)
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  821  		return MODE_CLOCK_LOW;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  822  
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  823  	if (inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  824  		return MODE_CLOCK_HIGH;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  825  
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  826  	if (hdmi->refclk) {
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  827  		rounded_refclk = clk_round_rate(hdmi->refclk, mpixelclk);
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  828  		if (rounded_refclk < 0)
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  829  			return MODE_BAD;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  830  
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  831  		/* Vesa DMT standard mentions +/- 0.5% max tolerance */
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  832  		max_tolerance = mpixelclk / 200;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22 @833  		if (abs_diff((unsigned long)rounded_refclk, mpixelclk) > max_tolerance)
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  834  			return MODE_NOCLOCK;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  835  	}
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  836  
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  837  	return MODE_OK;
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  838  }
701029621d4141 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee         2023-12-22  839  

:::::: The code at line 833 was first introduced by commit
:::::: 701029621d4141d0c9f8b81a88a37b95ec84ce65 drm/rockchip: inno_hdmi: Add basic mode validation

:::::: TO: Alex Bee <knaerzche@gmail.com>
:::::: CC: Heiko Stuebner <heiko@sntech.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
