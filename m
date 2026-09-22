Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ABB29ACCD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040404; cv=none; b=XN6Bf4YU63lly3o6mfzEqw21q3ucGHZPm5Z6FjxxDFKQX33T8tf47PUaKehVqaovB/G3ocNOSkfLLp3B8QSjy4jsNB6e/IDOh74359CreVhw1BJp9PCdZx24kYzftFfhoZ59Payh0Y8EZQVeivNawcfNr395N/v2lIfFDZYzSOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040404; c=relaxed/simple;
	bh=eG6/Dp2vhNQwPzMI2PuLBbW3YR7Bca+T29ePmeJTJhM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RdiWGLP+NVL67gJG2oXAropQ1s7DVSHvqosUPBhneci1e9nMUlLCIS8OegADkBdy7rFP8i9MT4pdLWDpaqZgrZop6l9HbyqfTQD36Eahw6M+Zfn4klKkz5HAEpXA4HctND5Rs72NfRNL0lTXvRxyInCrGF00YDh/Qjn1NdrCDWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RaGl4IBU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaGl4IBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790040403; x=1821576403;
  h=date:from:to:cc:subject:message-id;
  bh=eG6/Dp2vhNQwPzMI2PuLBbW3YR7Bca+T29ePmeJTJhM=;
  b=RaGl4IBU7G5nHbhRO+yNRkaXDZ7kRBtR2sGcnUv/whtuuQ7qvPmx6cnQ
   6jUrJgJAlSp9Ttggf7J6OIjvy5ENg9lu2hqUmi8XwEt+GsCszswvNfvfi
   IuT2xQR0nAwK6HrNxOkK1EVt7Rf0SYMu7NRbrpn2AAkVP26P69fnvs4Td
   mU5z/J6EXi8a27gDuRaGetTWv0ZML/lY+UCrPtzzadWd0cZ0Fm8wkwIA/
   vYhAQGp8gDxEUtJhkb7j8NQua8Hq1yjDoFtxPcd7zX9/JOVlBDK97hZTA
   4vMgDcOoz0Wlo3SFlOq1BlqoHlUV9DFgpJRY+zrXGM5QkSIeLt5PTQ8ZW
   A==;
X-CSE-ConnectionGUID: QFMYqf80TEyZqGHVHXUKfg==
X-CSE-MsgGUID: IYo9vp0+QPusb5iXMLbtpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="108101143"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="108101143"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 18:26:35 -0700
X-CSE-ConnectionGUID: KwxGtdtwQ86azhF8aBaAmw==
X-CSE-MsgGUID: sj0kDsmOTP+dAIbljuugiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="3892565"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 21 Sep 2026 18:26:32 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8pHB-00000000EjY-3cRu;
	Tue, 22 Sep 2026 01:26:29 +0000
Date: Tue, 22 Sep 2026 09:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: loongarch64-linux-gcc: error: unrecognized argument in
 option '-march=la32v1.0'
Message-ID: <202609220915.ct59FnOW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Huacai,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 3d9aba6618d115750729bba2d1f8af180bd7d3bd LoongArch: Adjust build infrastructure for 32BIT/64BIT
date:   5 months ago
config: loongarch-randconfig-r1301-20260922 (https://download.01.org/0day-ci/archive/20260922/202609220915.ct59FnOW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609220915.ct59FnOW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3d9aba6618d1 ("LoongArch: Adjust build infrastructure for 32BIT/64BIT")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609220915.ct59FnOW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: abi-default la464 la64v1.0 la64v1.1 la664 loongarch64 native; did you mean 'la64v1.0'?
>> loongarch64-linux-gcc: error: unrecognized argument in option '-mabi=ilp32s'
   loongarch64-linux-gcc: note: valid arguments to '-mabi=' are: lp64d lp64f lp64s
>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: abi-default la464 la64v1.0 la64v1.1 la664 loongarch64 native; did you mean 'la64v1.0'?
>> loongarch64-linux-gcc: error: unrecognized argument in option '-mabi=ilp32s'
   loongarch64-linux-gcc: note: valid arguments to '-mabi=' are: lp64d lp64f lp64s
   make[3]: *** [scripts/Makefile.build:289: scripts/mod/empty.o] Error 1 shuffle=2573320594
>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: abi-default la464 la64v1.0 la64v1.1 la664 loongarch64 native; did you mean 'la64v1.0'?
>> loongarch64-linux-gcc: error: unrecognized argument in option '-mabi=ilp32s'
   loongarch64-linux-gcc: note: valid arguments to '-mabi=' are: lp64d lp64f lp64s
   make[3]: *** [scripts/Makefile.build:184: scripts/mod/devicetable-offsets.s] Error 1 shuffle=2573320594
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1336: prepare0] Error 2 shuffle=2573320594
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2573320594
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2573320594
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
