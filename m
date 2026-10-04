Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212EC21FF29
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117884; cv=none; b=a9+W7WGWANZ60m+06BT0507utsSGbmdh0aiHqV9BPMSU6L0kdDXYuErJcFDu4v9EfTxD9g8CT6vTJFbN16S7jJVI8drnteC5jeLrmn7JxrepR2UMOwfdgeLvjkWKUMxWG6r55HVOId8sJadBBSnTg8Iu6dW2xIISjqhx8dEYYhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117884; c=relaxed/simple;
	bh=CaOw1Kn8ccjsEEWRNcfhugw/0KMg3PPbmxW42Os3ofk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BSK+SamdMwn0Dfq5fzWP++HGRhFQglhcwrPc3r52TgTl0bjak4b/TlqbqiA0UGdhxZ8ExR23PrxtzhLGB+3KNABjbosOQS/ZB8cbp01C5dALureFG26jtVcC6qQ0SMB1//iWbTHTbl0Zpc9wzj737kVtb4ch+sbIDNLPiHdpt1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2JKtmu/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2JKtmu/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791117883; x=1822653883;
  h=date:from:to:cc:subject:message-id;
  bh=CaOw1Kn8ccjsEEWRNcfhugw/0KMg3PPbmxW42Os3ofk=;
  b=S2JKtmu/pR3RHQOuh3TYfRtV2il7RxAtq3WHLHR+hKBwDYVCdB77FMeK
   u3+Ssq5dhv5FIC+EUpaV7EPnh2+NENRMTUlNjiUQ8paRseK6az/13Dh53
   oQdWAQsktLNSPHaXALqsBtu7nJN1mQI1bSfgBpDdBFoicpouMPJwbiTVn
   QLfx/gmB0FLMycsUdPWHllpi5zE+lJ0mQEpXB8xFIvC2HeKQJDYgKHol1
   GIyDQWG9QR+1IuTW67fcddQFrGLT4cxlDhvt0dtK9O4sET0oYCSMVeTIt
   uf52Wa+Yg1+URu1ho8nZVzFJgSB+ceQAiEiq6f1TitJfBmTqQ+wk5FdP8
   g==;
X-CSE-ConnectionGUID: nPbpg+GrRYWGZQ+bqcenXA==
X-CSE-MsgGUID: iYHXmfbiTHmpuBjnLAbZSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="108186401"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="108186401"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 05:44:42 -0700
X-CSE-ConnectionGUID: 6e4Pj9kmQXGCMMw7yHpfOA==
X-CSE-MsgGUID: fPT6gja+RpOU9AwSpTZnMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="275780094"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 04 Oct 2026 05:44:41 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDLa2-000000000IB-3wYu;
	Sun, 04 Oct 2026 12:44:38 +0000
Date: Sun, 04 Oct 2026 14:44:03 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
Subject: fbmon.c:undefined reference to `sysfb_primary_display'
Message-ID: <202610041430.YMCQIZYX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6addb4f385570ebc11c4eb499a4f1c149f313e84
commit: c5a8f13f1e476c90f4bc184a58751d3e7ff88f2b efi: Support EDID information
date:   10 months ago
config: loongarch-randconfig-r2300-20261003 (https://download.01.org/0day-ci/archive/20261004/202610041430.YMCQIZYX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041430.YMCQIZYX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c5a8f13f1e47 ("efi: Support EDID information")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610041430.YMCQIZYX-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/video/fbdev/core/fbmon.o: in function `fb_firmware_edid':
>> fbmon.c:(.text+0x1458): undefined reference to `sysfb_primary_display'
>> loongarch64-linux-ld: fbmon.c:(.text+0x145c): undefined reference to `sysfb_primary_display'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
