Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBF630F94B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882935; cv=none; b=IfkbP1ztKTdyiygzw0PF+00MUM9YZ053EnM1Ti9lE+82hjC0c1YrVXJhWPqgUAfh4QYMQM23VqR2tALp+tCVGxAgadZV5/cNz+hx+qxpdvsnCufQ3Sl3pkqoLZKfMJyJsZi0GWi0OY2JuDq7HNUrgFY8oKAe23O57XlulUoAC2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882935; c=relaxed/simple;
	bh=N/OmfWRr5BE9ZeYSOHIER3Ln1V2uJkn8sX1qLpmL44c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XvJ1s3I5BFR8HCEed0pqmDB4H4FuiIDWXBTuDsYuAW27BY7OThXFuzd3Zp55xR5b26gbmq0+SIDPuyf9oMZk4UY/7AfCEZ8LSGo0V73jN4UI7B0/4BYnqaDTILTNqMATU1VZNbxl3k6hFKqiQxSfUaxyfLCw6VjpI7RYwItOiN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJjLaIpz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJjLaIpz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787882934; x=1819418934;
  h=date:from:to:cc:subject:message-id;
  bh=N/OmfWRr5BE9ZeYSOHIER3Ln1V2uJkn8sX1qLpmL44c=;
  b=ZJjLaIpzhgSB40GeE5JC4s9nAAJVfxPFnHjwAu5c/VnxUoS7YgNg3SPq
   jY00V7bmX5gypToBVw7duI+SY7AD8YfdB87XBegNCh7rX3jT31tsG7KRY
   t4bWg8zyvwmXHVGMGYSwmVVx+ya9xuyffgXhFUoJwdsm3qjhIXNK+7dT5
   SHrYCzcQbPJ7cgAgHSdVO/nLCIh9/g0WjTmD4zFovkuIvCsf5SgHzXWNr
   GXuYAMuS5j7Ra1Fpae5LDp4f6loLabTQQluEweIj5LrAOi6qW9YXgdRX5
   bDizMxC9OO9JsBdxIYHx6zxbD9DIKYhtaXlxaJcsjpU7yZo4lShYHOJRk
   A==;
X-CSE-ConnectionGUID: rnBB8BeiSJ2e2n87YHDRFw==
X-CSE-MsgGUID: Lmq4LJFjRGGhUZmN8yLsBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="92250595"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="92250595"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 19:08:53 -0700
X-CSE-ConnectionGUID: qcfXairKQWKZgRwa0CMb0g==
X-CSE-MsgGUID: /ND5x58xQiW7+seelD6E5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="271557334"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Aug 2026 19:08:51 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzm1Q-00000000AGD-2tEG;
	Fri, 28 Aug 2026 02:08:48 +0000
Date: Fri, 28 Aug 2026 10:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>
Subject: sound/soc/sdca/sdca_hid.c:133:undefined reference to
 `hid_destroy_device'
Message-ID: <202608281034.4X4V9tcq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   73e3f0710014fe6d4ed98cfc02292f6121db7558
commit: df1fd5d8ab403c264b364abe187ce94b2fa7b96f ASoC: SDCA: Add missing destroy for HID device
date:   3 weeks ago
config: x86_64-buildonly-randconfig-004-20260825 (https://download.01.org/0day-ci/archive/20260828/202608281034.4X4V9tcq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260828/202608281034.4X4V9tcq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: df1fd5d8ab40 ("ASoC: SDCA: Add missing destroy for HID device")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608281034.4X4V9tcq-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `rt766_sdca_destroy_hid_device':
   sound/soc/codecs/rt766-sdca.c:198:(.text+0x1b37dbf): undefined reference to `hid_destroy_device'
   ld: vmlinux.o: in function `rt766_sdca_btn_detect':
   sound/soc/codecs/rt766-sdca.c:89:(.text+0x1b39eaa): undefined reference to `hid_input_report'
   ld: vmlinux.o: in function `sdca_destroy_hid_device':
>> sound/soc/sdca/sdca_hid.c:133:(.text+0x1ccf77c): undefined reference to `hid_destroy_device'
   ld: vmlinux.o: in function `sdwhid_parse':
   sound/soc/sdca/sdca_hid.c:38:(.text+0x1ccf7fd): undefined reference to `hid_parse_report'
   ld: vmlinux.o: in function `sdca_add_hid_device':
   sound/soc/sdca/sdca_hid.c:96:(.text+0x1ccf864): undefined reference to `hid_allocate_device'
   ld: sound/soc/sdca/sdca_hid.c:112:(.text+0x1ccf974): undefined reference to `hid_add_device'
   ld: sound/soc/sdca/sdca_hid.c:115:(.text+0x1ccf9a2): undefined reference to `hid_destroy_device'
   ld: vmlinux.o: in function `sdca_hid_process_report':
   sound/soc/sdca/sdca_hid.c:170:(.text+0x1ccfba2): undefined reference to `hid_input_report'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_SDCA_HID
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SDCA [=y] && (HID [=n]=y [=y] || HID [=n]=SND_SOC_SDCA [=y])
   Selected by [y]:
   - SND_SOC_RT766_SDCA_SDW [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SOUNDWIRE [=y] && SND_SOC_SDCA [=y]


vim +133 sound/soc/sdca/sdca_hid.c

   124	
   125	/**
   126	 * sdca_destroy_hid_device - destroy the HID device
   127	 * @interrupt: Pointer to the SDCA interrupt information structure.
   128	 */
   129	void sdca_destroy_hid_device(struct sdca_interrupt *interrupt)
   130	{
   131		struct hid_device *hid = interrupt->priv;
   132	
 > 133		hid_destroy_device(hid);
   134	}
   135	EXPORT_SYMBOL_NS(sdca_destroy_hid_device, "SND_SOC_SDCA");
   136	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
