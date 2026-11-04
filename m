Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775282;
	b=Bo07LXNStAZihyzh83jrLzXuzopvGpX8+nBeaP19hog1vtspWebRE32NT4yBR382Wbra
	 2BBrsoS533X3dKaycfc4yyzznhEtcWDeajpvSMC8wqCvqK/v7ns7jNQ2QxpH+K0kn0oHc
	 WUXJY2y107puEOT3jrlaF2cDAMhX3CXAEQPY3bV1xkX4EPR2Vq/FSRXTMbdSnGTEZQSjC
	 ZX4foyaVwMyZkUzjU2sI4VUDBzgGOBYIL+H/D8BRP5FHPc4mIYiuoi7f+F+0ny0iT9TQp
	 pWOfA+a7dmVxhf7btbNZjHibWKNK2/iAC18iipKy7EYYygaw3kdkPeBXqSIYuZbQ1hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775282;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+P0zeX8oTeoH6WHkTWY2OUf3Qv9TFcNKYEead3ADe84=;
	b=dST+HEGaMhp147+D3qPC0W5yj0nCH25NU6GxaCOjC7sStI7wdDkHnE8xTOKN5i9f1cMG
	 34H0LMnqy+0FM+QhXFjHrRPM6yHww042T/Mewcr9U7yRqmCczjXOrehFMJCFBJSgLHY7E
	 wu2boTBmNUZcLr3bC0wezq1mFZwO3jEBjehGaaypM2L3mGnx1d5iJ5KaKGqNr8eQDYJI/
	 XZkkuhUhohtvFIVIIpA0X/2s+Atkz6waYXguHyrNceO8TMdSroVSaLam+BAsizbJlUIJ5
	 2HsZXPPeaAiJmZEzbYFm7NjuKmb4J1Po6vUmyHq2FtvxMoF6cf0ROElDhmnmYJwW01A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XNeH2AVO;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4B1606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D4B1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XNeH2AVO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793775281; x=1825311281;
  h=date:from:to:cc:subject:message-id;
  bh=FreZeJsfbC7Y5ksILiVMdtnTBv7RUmkuvrYo2WtuT6I=;
  b=XNeH2AVOZ+7PBwXAXt1QZzYuagZ9KgPSb/WkXxKgtVWhdJ+fan0Kqmf4
   VKWtI+hS5INP78rz0YWcv8tj2JNNpBnHAB3KcDemZOs8U7fD8Ghblw0WV
   sFqq2rXect4fNkKFPpY4kmJoF4/GNZJzLSqJfCG3PB0HrWnDo2RixMwiz
   OR/4meY7/DntbWZz3eJ3kX1GQVog5k2fh3Y5GvmIjntIY++kERAWJVc1J
   1muwAXckHqflmg5ow7dVe8SYO0nF8NRHGB6vuB2ciVtaUXqkq+uvYev1s
   jXvLMbELjSXgn2sU0PvxTpCCbdnlGOxz+Wvp/mRM7gV5kpRtdjPx0ZbwE
   g==;
X-CSE-ConnectionGUID: ML/f5Jy8TMSnN6IWvkznbA==
X-CSE-MsgGUID: CnAJFdPFRa69nDuJ0AXO7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2421221"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2421221"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 22:54:41 -0800
X-CSE-ConnectionGUID: 1Aq44VtbQ+m9hhyy8ZIqVA==
X-CSE-MsgGUID: QxeA4nVvQbSsjwIspJEjvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6774341"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Nov 2026 22:54:38 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOUtI-00000000jtB-1IHa;
	Wed, 04 Nov 2026 06:54:36 +0000
Date: Wed, 04 Nov 2026 14:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c:32:
 undefined reference to `sdca_device_quirk_match'
Message-ID: <202611041412.3SElN2PG-lkp@intel.com>
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
head:   cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
commit: 677507a5303a6716d9e0bbf3a8ba8c0f27391ab2 ASoC: SDCA: allow building without ACPI
date:   5 weeks ago
config: arm-randconfig-1003-20261104 (https://download.01.org/0day-ci/archive/20261104/202611041412.3SElN2PG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611041412.3SElN2PG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 677507a5303a ("ASoC: SDCA: allow building without ACPI")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611041412.3SElN2PG-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: sound/soc/intel/common/soc-acpi-intel-sdca-quirks.o: in function `snd_soc_acpi_intel_sdca_is_device_rt712_vb':
>> sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c:32: undefined reference to `sdca_device_quirk_match'


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
