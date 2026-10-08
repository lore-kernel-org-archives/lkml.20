Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A173A1E96
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791426955; cv=none; b=tIRNBgkbUsfk1E1HrAG1II3q0JPelq1xPqGohxdBUVNv7kLea1JnJDHfzMs80n9h1dgfpNVipguPOCZcPiYivGn+m3Q1FDrxd9BkbDclhvSyJrZNjMM0rqxidZStrw4Ovksgg8cC4Q7P9zE3X3oLFT3m4UAser3HXNtGrPn4EGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791426955; c=relaxed/simple;
	bh=tU+WoUv6CJSiEvFfrRrt02Fnj2xitmCJGZrULm8HrDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qpXdD3ruKWYmlw5rJjjAUmQfZUpgKWz/WhgvrEiYncNq3yaC5NfemqKxImGNDvzY+gO5cbR3rgwmc/tVlpgyinxWDKTVUpSdg0rlDDfQaP1pI26MEXmhrk6kB9zeKOx659WbF9B+J/Na9zDzGVqcleJwLbtYwXBP+i3JCebOHSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZDm1etR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZDm1etR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791426953; x=1822962953;
  h=date:from:to:cc:subject:message-id;
  bh=tU+WoUv6CJSiEvFfrRrt02Fnj2xitmCJGZrULm8HrDk=;
  b=LZDm1etR5piLZiRG334pploOZ9TECqYNFtT9ECji2LhZMNd1XLaLx1X9
   GqWy0JvrUhLQeWrygrRyDUg6dIwqjC718djQWgGgIffHfkkSMTwYbeUHz
   XudeYOJx0j7dBy6P9UFdOvm97cK7Idus6hOS0OYrZ9ve+Gw42Bn8EfV+A
   atwi0igF7pGKcMcSgOTV3OtL+gPh31df0TVI8FL6go0HZ1E+6Eo5dr5DQ
   Cp2wPGRWJaY0MyZKP1Mlqi4SUPd0JgtfQ9ajssS0EYsxPvoCoNpQA6jGJ
   KNj287DIErhzo8nTWr3bL3fZ5+dttUvc1s0cTcbZh9ogChrfAuBTpGX6J
   Q==;
X-CSE-ConnectionGUID: BaGKLFUJSzmUluU+1O0aLg==
X-CSE-MsgGUID: Yd/T+57YRn2d1RtzMZJO3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="197053"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="197053"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 19:35:52 -0700
X-CSE-ConnectionGUID: GtNRYXNvT/i83BunA/wyww==
X-CSE-MsgGUID: rqpYH6/dRLWeR3j797w4AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="338515"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Oct 2026 19:35:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEdz1-000000003rs-3qpj;
	Thu, 08 Oct 2026 02:35:47 +0000
Date: Thu, 08 Oct 2026 10:35:38 +0800
From: kernel test robot <lkp@intel.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: qcom-pdc.c:undefined reference to `qcom_scm_is_available'
Message-ID: <202610081014.uMTiuuH5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69f80fef3153299d9c72c53d1d71eef6354b6926
commit: ad01c2b2f29163ca0bbe1fd4f9343fbc5119c239 irqchip/qcom-pdc: Configure PDC to pass through mode
date:   3 months ago
config: arm64-randconfig-1000-20261008 (https://download.01.org/0day-ci/archive/20261008/202610081014.uMTiuuH5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610081014.uMTiuuH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ad01c2b2f291 ("irqchip/qcom-pdc: Configure PDC to pass through mode")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610081014.uMTiuuH5-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: aarch64-linux-ld: DWARF error: could not find abbrev number 1939
   drivers/irqchip/qcom-pdc.o: in function `qcom_pdc_probe':
>> qcom-pdc.c:(.text+0xba0): undefined reference to `qcom_scm_is_available'
>> qcom-pdc.c:(.text+0xba0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `qcom_scm_is_available'
>> aarch64-linux-ld: qcom-pdc.c:(.text+0xbb8): undefined reference to `qcom_scm_io_writel'
>> qcom-pdc.c:(.text+0xbb8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `qcom_scm_io_writel'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
