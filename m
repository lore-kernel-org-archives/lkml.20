Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380DE509EF5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790380311; cv=none; b=jCSchYyGVDXh8JH1MDbSlsMwfw6caXFU8sx0SB020IRsRptkleOtlB9ylS5x7gGX+d7KpevMIiIemYGl3MxLzttSX432gQUKXoHX5sQbvsZTIJUtYrvrS1e8aUWGctmx3177PQdBiyUUQZUD91gQM4oEQwqgRGDWFSJp8suajPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790380311; c=relaxed/simple;
	bh=3QLNsaPkK3curOoC1ICtLFEmh0y4zwg0WbKg78hReDo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZWQXD/1rmXbg6fdESoWGS0B/P55k3DuxuFmvw8vOM6I58Q7lhDBvuyEN0g9ra8XyOR8S7+UjJXOGHeGYRvj+uep76yv90qnRUHhzXqhQ28k7BEGr5/pk+JezwOtOOGb8DJ2AnWCLPFf0qyM8Bijb1iUzRQoVVpa9+e5Hm8t7mzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VaSjW78O; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VaSjW78O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790380308; x=1821916308;
  h=date:from:to:cc:subject:message-id;
  bh=3QLNsaPkK3curOoC1ICtLFEmh0y4zwg0WbKg78hReDo=;
  b=VaSjW78Og7cLpH4/0AbrNDfvOFz0kBZA0k/xy3Tz+l6afndu1h8PvFHE
   keQWWY3b+C7ruFPZWCamwDrZCmohUaMIx5sSO1R7KD6cDBbXnCwXe8sMU
   ImAJtXJv5g+HMCet/DE/k+os1rENkprbTPiTIWc8J8A+3A0vFjz3hp8r6
   CRiHfsAq5yeYRH1bVKCkICJktuI/7UrZvgiFxBvEIkhYoYMdrI9+/KRbX
   /80Ub6Hj4U/KhTBD/mbxav4r821pZjlRxlRarME/vrdj57NtjtjxydGvZ
   Y1XXJHM+N2E4Hp0bYQfH7m5fPKY/OCPuaGAjh03C4Lnkriozn01se02PJ
   g==;
X-CSE-ConnectionGUID: 1l2qLeM0QYK6EhGg9ul4Dg==
X-CSE-MsgGUID: PuSV/7AWTdeqDwSDq2orqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="89938231"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="89938231"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 16:51:48 -0700
X-CSE-ConnectionGUID: 3H4GkYmxRW+bpMvRsqGLBg==
X-CSE-MsgGUID: OtmC+MdwSjWhesEr3AthSg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Sep 2026 16:51:46 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAFhf-00000000LLT-1jgc;
	Fri, 25 Sep 2026 23:51:43 +0000
Date: Sat, 26 Sep 2026 07:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jon Hunter <jonathanh@nvidia.com>
Subject: arch/xtensa/boot/boot-elf/bootstrap.S:68: Warning: value
 0x1a0003000 truncated to 0xa0003000
Message-ID: <202609260743.V1BFyc9T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Guenter,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5fc5768c7ca92895ccd1de94dc521e5a55ae7896
commit: 916aa36042db8ee230543ffe0d192f900e8b8c9f clocksource/drivers/timer-tegra186: Avoid 64-bit divide operation
date:   1 year ago
config: xtensa-randconfig-r1303-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260743.V1BFyc9T-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260743.V1BFyc9T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 916aa36042db ("clocksource/drivers/timer-tegra186: Avoid 64-bit divide operation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260743.V1BFyc9T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/xtensa/boot/boot-elf/bootstrap.S: Assembler messages:
   arch/xtensa/boot/boot-elf/bootstrap.S:58: Error: invalid register 'atomctl' for 'wsr' instruction
>> arch/xtensa/boot/boot-elf/bootstrap.S:68: Warning: value 0x1a0003000 truncated to 0xa0003000


vim +68 arch/xtensa/boot/boot-elf/bootstrap.S

e85e335f8ff615 Max Filippov 2012-12-03  60  
e85e335f8ff615 Max Filippov 2012-12-03  61  	rsil    a0, XCHAL_DEBUGLEVEL-1
e85e335f8ff615 Max Filippov 2012-12-03  62  	rsync
4bedea94545165 Chris Zankel 2005-06-23  63  reset:
037602705109ec Max Filippov 2018-12-05  64  #if defined(CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX) && \
037602705109ec Max Filippov 2018-12-05  65  	XCHAL_HAVE_PTP_MMU && XCHAL_HAVE_SPANNING_WAY
037602705109ec Max Filippov 2018-12-05  66  	movi	a0, CONFIG_KERNEL_LOAD_ADDRESS
037602705109ec Max Filippov 2018-12-05  67  #else
037602705109ec Max Filippov 2018-12-05 @68  	movi	a0, KERNELOFFSET

:::::: The code at line 68 was first introduced by commit
:::::: 037602705109ec2ab96340bea93ad87daa3ac046 xtensa: don't use l32r opcode directly

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
