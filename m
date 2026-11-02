Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623737;
	b=QEP1eq51zzq2Ko5EBWrFke0kDg7oygY/vV50CbU7EDIqLrTUfCDsAsy5BGyfJWtRFma2
	 FTfnxrqHcJpGEvTxhvVdNaOQvVSEZtwnSkhojSCh2MqjZcDyC+g06CFedgwf1Oax9LDJQ
	 HG4vVrmyXP0P5IoDfei1ATyCJmSYKhxs9wYunBlQFfEhGumJSmfMyv+ld5hSVBQItHf1V
	 X/zd6lxmcBIXSmGUjZ7w1AcfK+DpCIF1stcv8AuTNhfrAZ9heWE8zwNO9DqfjhR5CDXgI
	 5RnWPOfkwM24UD2F7v0dgKleILyNiN8zvAWpYePaXMAqvePlq9mrQToGlx+AghYpDvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623737;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IgnFBSs4gU/9OiVWohQgrsqEzzqGnaK11LfxQ+b/54A=;
	b=vEu0yunreRPt58d3p7lf35gQwkYs6j/6QMPZdbyoDSFSwbLuK61B0/wJIr4o3D77e9bG
	 gWtFnoYZUfIxeQ3YvibiACIGTfBztJsFGAW9JYE9aWhps91zLg8NcTVTu2eHHX9HPhZoF
	 fnY3enKqgrLxLK2cODm4MfNYnoPOLvhhTjMvbDoXVpI9k8G47jeMVBwEc7bNzTDHnum1i
	 uMpNjgXA+iom7qy4bgjSvABNAy+0QhYpyPu6Y453G5TlZ+WY/Ge1VOY6MfHKBTiwIENXB
	 pRSqVUh6kIp2AYpBPsWHb+8Bu40z0oidq0bolelEikyHgBPP6ZZqTaeSvpTg+q6tPHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y58dpbKh;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD367606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD367606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y58dpbKh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793623736; x=1825159736;
  h=date:from:to:cc:subject:message-id;
  bh=718d8Norezs3ZysX252UJaxohIlGAU+FbYcANbSaDuQ=;
  b=Y58dpbKh8hzKxbnh8ZXl+I3FAKRRW+j5DKX9VO4OmpDckdeVqQfeewPv
   4juKAIJolafYLFE+jxO5w1BAHHzWnqDGSntOZ8ryxTZHw0GbRrGDbtytt
   OnghUVVv39x7mBj+HZrLmmlofHmP5voIxCo0rMJlNyRPhNP9Ez0BFfamy
   AKRTCNnK8noORoMWA2L5Hm8mYEnw3Ij1ILMxL23Quk/Kq3NncqR6Gv0JJ
   DwcoyXbfH42nqZ61Is10ONyT+vgvdpG8BvMLzcAoqa8LEeOXnZArKpAeX
   nhxZNB53hKixTsJfV/U03ldXwwcD3Su6IvAEisfYiBLwoO7EFtp9auFxl
   A==;
X-CSE-ConnectionGUID: sukoxDbXQpelVYp7IHflRA==
X-CSE-MsgGUID: gkiMMM0uTrinPgVCTtwkHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2323887"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2323887"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 04:48:55 -0800
X-CSE-ConnectionGUID: 8hTd09PJQwuo/KyWCui7Fw==
X-CSE-MsgGUID: zYOIAzfoS26z8fTn0d0Zew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6432378"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 02 Nov 2026 04:48:53 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNrT0-000000008Yv-1eop;
	Mon, 02 Nov 2026 12:48:50 +0000
Date: Mon, 02 Nov 2026 13:48:41 +0100
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: drivers/gpu/drm/verisilicon/vs_bridge.c:325:9-16: WARNING:
 ERR_CAST can be used with bridge
Message-ID: <202611021314.XBaxacvs-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
commit: dbf21777caa8b8c88c12f7f036b01208fec0d55a drm: verisilicon: add a driver for Verisilicon display controllers
date:   9 months ago
config: loongarch-randconfig-r2111-20261102 (https://download.01.org/0day-ci/archive/20261102/202611021314.XBaxacvs-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3e5b45eed6c3ec25f4f1cc81ce0be10106a8f31f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for Verisilicon display controllers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611021314.XBaxacvs-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/verisilicon/vs_bridge.c:325:9-16: WARNING: ERR_CAST can be used with bridge
--
>> drivers/gpu/drm/verisilicon/vs_crtc.c:175:9-16: WARNING: ERR_CAST can be used with primary

vim +325 drivers/gpu/drm/verisilicon/vs_bridge.c

   288	
   289	struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
   290					 struct vs_crtc *crtc)
   291	{
   292		unsigned int output = crtc->id;
   293		struct vs_bridge *bridge;
   294		struct drm_bridge *next;
   295		enum vs_bridge_output_interface intf;
   296		const struct drm_bridge_funcs *bridge_funcs;
   297		int ret, enctype;
   298	
   299		intf = vs_bridge_detect_output_interface(drm_dev->dev->of_node,
   300							 output);
   301		if (intf == -ENODEV) {
   302			drm_dbg(drm_dev, "Skipping output %u\n", output);
   303			return NULL;
   304		}
   305	
   306		next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
   307					      output, intf);
   308		if (IS_ERR(next)) {
   309			ret = PTR_ERR(next);
   310			if (ret != -EPROBE_DEFER)
   311				drm_err(drm_dev,
   312					"Cannot get downstream bridge of output %u\n",
   313					output);
   314			return ERR_PTR(ret);
   315		}
   316	
   317		if (intf == VSDC_OUTPUT_INTERFACE_DPI)
   318			bridge_funcs = &vs_dpi_bridge_funcs;
   319		else
   320			bridge_funcs = &vs_dp_bridge_funcs;
   321	
   322		bridge = devm_drm_bridge_alloc(drm_dev->dev, struct vs_bridge, base,
   323					       bridge_funcs);
   324		if (IS_ERR(bridge))
 > 325			return ERR_PTR(PTR_ERR(bridge));

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
