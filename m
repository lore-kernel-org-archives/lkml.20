Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664681;
	b=5QxPoTQn6O9A7CJ0EfrWZIY6SS8jF+wbrfIKz+5tqvmxmK1H5k5DQa4YdEtjo/SX51SR
	 UPtdXABlNWfFbSYqSttxq9SDHoek0ysM2tn8JG84jsTwT8JZEM8nfvfgz6/DKUau8BOpE
	 ZWi0blrGmkp/7S8dmYOSs5d1Y0j32Mh8h9mpfNfE6323pM3yxeOdWnSU9g3vmEJOr/X4S
	 J78AcqGQU5BXzkW/+HdU1U+HCxLrNIAM112cHN3yLoiA7AM6D9X0a/Zk7/Nv3Wbx+9wrZ
	 txdTOiGdxaG9ESNtkN8RhqeYbGXYxC8zGuSu79wBDOD8qEqD7Pg6PCzxCimPu0Y/PvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664681;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+J33MejvzPeu10OjppsxcsQ9dwmr+e4MlaFR6deRaNI=;
	b=pu6bVg0mnYxKUv8jngMbZwzWbgQxJeC7PsIeiXuAdss4IP/OyFrQC/Sg3FxIgxhwP37X
	 AaVbC964W+ZUmt+Ao/4rvm97LqAjajcI2wqgey56WL/S7MmTn0gfe34V40/6KKyVuHH96
	 Z0ON0a5zTzJOfUktEc1HwcVsYTHKCwv9QiCZLVKi5eALG6Qdtfja9/1McdDwqdL0K1oNL
	 9UMY/M5QsWpcD9oUFxffgBZsDNLIKkd4W1A4dS1e/qrFIMrnEmqvxfowP8BhyDCpRGvXa
	 wQysXftuZW43Rys/gWgHvK7iK+MdYZ4r/dy1Gkvfpt2Nu8XEt8Omy8O+OmD/WoOY5zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YkKmI0K5;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF89A606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF89A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YkKmI0K5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793664680; x=1825200680;
  h=date:from:to:cc:subject:message-id;
  bh=+tmcLmudEcqXomkMy1bN91BP62V7gVDwKsT4eZ0Uof0=;
  b=YkKmI0K5Qa2GDPI3xNnXLywpfhLpGTn+5oIVLQx9dgeL84qTKQTtjSDj
   Nk6ij5tUADSI3uXXTKgMLM4FCux+2dZeGJy3RvKhC7rvXQYaUtX4RlAQl
   e0N7i/AtEESCoUJRgb4Q5+u66XnwBjwW25yR04ULJw/51YGOSKyFjl76i
   uHU+mZ7oDx8/Pj+KOHuP51cYhxb7Xn5qTOH3+EUjYLklNyVqAEVdjKSFo
   TayqIZSyfvhiVDDYgC5XOF+PjPKZajAJuTqjf5qYBl9oQLcVexnyJ66U0
   4p0e4OocK9GJwq5L4eqApgkHBT+46aOMhg6nkSzl0BqOABN4GBNctzrZe
   Q==;
X-CSE-ConnectionGUID: 20T1nejVTP6a3w8UgjTW/g==
X-CSE-MsgGUID: N6vGZwBiRp+9y9Smo9BalQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2255733"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2255733"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 16:11:20 -0800
X-CSE-ConnectionGUID: 43p0/6YiSPuNWXcR8kWghA==
X-CSE-MsgGUID: C7uG5cK8Qfev+lCHgqY23g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6105117"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 02 Nov 2026 16:11:17 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xO27O-000000008m7-3twY;
	Tue, 03 Nov 2026 00:11:14 +0000
Date: Tue, 03 Nov 2026 01:10:46 +0100
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: 
 sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c:32:undefined reference to
 `sdca_device_quirk_match'
Message-ID: <202611030010.WaPDRv2X-lkp@intel.com>
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
commit: 677507a5303a6716d9e0bbf3a8ba8c0f27391ab2 ASoC: SDCA: allow building without ACPI
date:   5 weeks ago
config: s390-randconfig-r2300-20261102 (https://download.01.org/0day-ci/archive/20261103/202611030010.WaPDRv2X-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611030010.WaPDRv2X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 677507a5303a ("ASoC: SDCA: allow building without ACPI")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611030010.WaPDRv2X-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: sound/soc/intel/common/soc-acpi-intel-sdca-quirks.o: in function `snd_soc_acpi_intel_sdca_is_device_rt712_vb':
>> sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c:32:(.text+0xa6): undefined reference to `sdca_device_quirk_match'


vim +32 sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c

5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  14  
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  15  /*
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  16   * Pretend machine quirk. The argument type is not the traditional
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  17   * 'struct snd_soc_acpi_mach' pointer but instead the sdw_intel_ctx
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  18   * which contains the peripheral information required for the
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  19   * SoundWire/SDCA filter on the SMART_MIC setup and interface
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  20   * revision. When the return value is false, the entry in the
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  21   * 'snd_soc_acpi_mach' table needs to be skipped.
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  22   */
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  23  bool snd_soc_acpi_intel_sdca_is_device_rt712_vb(void *arg)
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  24  {
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  25  	struct sdw_intel_ctx *ctx = arg;
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  26  	int i;
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  27  
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  28  	if (!ctx)
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  29  		return false;
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  30  
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  31  	for (i = 0; i < ctx->peripherals->num_peripherals; i++) {
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16 @32  		if (sdca_device_quirk_match(ctx->peripherals->array[i],
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  33  					    SDCA_QUIRKS_RT712_VB))
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  34  			return true;
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  35  	}
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  36  
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  37  	return false;
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  38  }
cdd30ebb1b9f36 Peter Zijlstra       2024-12-02  39  EXPORT_SYMBOL_NS(snd_soc_acpi_intel_sdca_is_device_rt712_vb, "SND_SOC_ACPI_INTEL_SDCA_QUIRKS");
5703ab86ff7bf0 Pierre-Louis Bossart 2024-10-16  40  

:::::: The code at line 32 was first introduced by commit
:::::: 5703ab86ff7bf079aa1ddf7a65b9727d0249383a ASoC: Intel: soc-acpi: add is_device_rt712_vb() helper

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
