Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912750;
	b=DG3KMLXZyXf2Q74dEA+hfJFszYkpBFe2G7glzMplnyAlUSNDSIzC2/cc0m8eOG4Nvrfc
	 Y0/mzNVaVrclPZJJvnLfY6TTUU4OTOL3eaLl79UrL0SNGrDfvt4IcsX5Y3bSqWuleiuL1
	 1Z8QnQplVDL+erfcvN8R47t8pXgKnop3FsjY4Javrtz0DzM4kiXiFTZlnhSULhqpKJV5u
	 rjCcYGhbwBWphaOOZobX6w6Sg9UHjeJwyI9kAT29R9/VDbf7Ji2xwjzkv1Rb5XFR93fjj
	 KNZDgnuRlQY5U7ndeDnnNnP2V4dFKoMY8gkI2jKBbbQ6NN3sI5Gl8XorUUQX6tha+fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912750;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6w5xHwVIXD+vU1DZpZH2h2vaeHf2Dtv+rnAF51hNn9g=;
	b=3XF63lQqslhqw86mWj4gBL3HSsqQC+9h2uJQ2iS6G4fpO7iKqELlZjKPaUyhgzNPtA6A
	 rFD2B23VUMv7JfjYgDrvdXEnPN6l2m5cLQqNwwQgWUb0TZDoMH/oLzcuyXag6xr/aIU9I
	 sP+njY5bwZD5P2QKjg67Ir/d0j5m2KjkPJwCEUg4PLxOnOhwoOceSAfMB9Xe7tTyaGduw
	 YYINwIBZBgbJXaXmZYrf/qHcbyn3uOFCuwmxnLQsQXOcRjveXmapWWGIxdgrDwamQK6b7
	 5IW3ocfu4HhS0P3yjVEXlKkkYReOHBZJmVfUzZ+6GDxTyo2cZ9PMOlQBwutvgXwOaGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=anCXPjWF;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A92E606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A92E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=anCXPjWF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793912750; x=1825448750;
  h=date:from:to:cc:subject:message-id;
  bh=RugayR+mHlClEJwgj/N7nylF/yH+BTk4OcwA8v4kDh4=;
  b=anCXPjWFsxJ82F1e/Ia3LQIjpSDI6mY+MRpurIdedfs8gPtxjeBMZJ1d
   kGIe2PxhbX1CJYUoPmjqGUSRvPRzAy9E7D1NL0Z6qzy/mLIM7wzRQUVe9
   WzzBkJzgHFtbeW6xLjrJYruchIcQ72kYQG2qB28BzlIDTPNteCOr0lw0y
   hr/5w41AtAFnxJePExGOtpAc0hIc4jVh+LWs4hmlZ/TcTfUMtlrcFGMLr
   ipwORUQiTdr+X35kfPxmhfG5xEm1YdwFFySSu9A5NZw5t2ydtOA6vgcEx
   LNMPfzzsyjX2xFhqiXL5wSzL5K4ifWcmnWD+ON1d6G1puSriIotmRh+oC
   Q==;
X-CSE-ConnectionGUID: AbWdEVPzRa+0AHrWd5AERA==
X-CSE-MsgGUID: a5X3Wem8T0SpP8+n9BQwBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2714586"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2714586"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 13:05:49 -0800
X-CSE-ConnectionGUID: O3RTbBZTQvOC3EcszJVM+A==
X-CSE-MsgGUID: ZeXk+jNtT2GBJ3G58al61g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7016922"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 05 Nov 2026 13:05:47 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP4eV-000000009np-0gV0;
	Thu, 05 Nov 2026 21:05:43 +0000
Date: Thu, 05 Nov 2026 22:05:00 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jocelyn Falempe <jfalempe@redhat.com>
Subject: drivers/gpu/drm/drm_panic_helper.c:685
 drm_panic_helper_get_qr_code() warn: unsigned '0' is never less than zero.
Message-ID: <202611052207.nCXae3NM-lkp@intel.com>
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
head:   05441d697f7f9a927264f4058cbbc6a03dfcac9d
commit: 5c3d323984fd140108d527a920de8553ff6504b1 drm/panic: Move panic display code into helper library
date:   7 weeks ago
config: um-randconfig-2200-20261104 (https://download.01.org/0day-ci/archive/20261105/202611052207.nCXae3NM-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e2e3d6c39cfebec9eace23629a5a103df2c79ba6)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5c3d323984fd ("drm/panic: Move panic display code into helper library")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611052207.nCXae3NM-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_panic_helper.c:685 drm_panic_helper_get_qr_code() warn: unsigned '0' is never less than zero.

vim +/0 +685 drivers/gpu/drm/drm_panic_helper.c

   682	
   683	static int drm_panic_helper_get_qr_code(u8 **qr_image, unsigned int qr_version)
   684	{
 > 685		if (strlen(CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL) > 0)
   686			return drm_panic_helper_get_qr_code_url(qr_image, qr_version);
   687		else
   688			return drm_panic_helper_get_qr_code_raw(qr_image, qr_version);
   689	}
   690	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
