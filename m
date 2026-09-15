Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE2A4CC627
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499280; cv=none; b=hNjy8crh+8reXvo9WA9RUtdvlHfsaMbP/o2huAHR6TBA+qwZ5ap117108DpH8EPZfDDF94o/ODi8qDgL4hQNB0leq70GBXUGtjaZM3kMjmupSqmsB77hx3rSynBgbKAuz8mBSO54cM/9gtPvIEEShTlAbTMiLPMETe29X8GXYQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499280; c=relaxed/simple;
	bh=Yqk68G/VssP+1UxLmQWua0XWRtSkXC7l/kMMbfJBwjY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N57Ch6kvGYgp7lJbb8ggaWHRoPVzhWBCAHF5+lLrEAvJORHJw594DGnV8xaXtX4RRY8sG0vcFIi3Y+Eiqgn5KVsK6O6ENkbeCrBwDlxeoeJ+tP7zbhXJgkRyJA60XlyJ/hLHbtWyJxaztAW60uzHKNcWNnzEx9RWzuIXQlwAYY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCRG/qGm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCRG/qGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789499278; x=1821035278;
  h=date:from:to:cc:subject:message-id;
  bh=Yqk68G/VssP+1UxLmQWua0XWRtSkXC7l/kMMbfJBwjY=;
  b=SCRG/qGm1qqa/y94Qbc1RYRJzGIzDeh81Hjw+xGsxb3+0+zp4m0EiyRS
   pRH3nTCY8k0OHQLcuYJ8I2CdZ5YY1/uIqQU4BUkn1vaW5RqKeZmqbg31P
   jvUg/YFpejRh8MYpIwKUH/txxtoBQBVhxJlufB2dnx26t5xrvi2M/lMxZ
   VJhbwfV1x7Y0riiBNxqaf9VUuv2imCIpFuj6UwfGvAx+wNxp7qc36lnds
   p1v0mXs78JL1DSUnCcO4DBKZGq1NDQehE4y/D2/KFaX5BjMWBWYI6GjW3
   PNzU89w9Q/ZK/m7x2c3KllziCqKZJmDZM/crKV5KCCEh4XUHUycEEApeg
   w==;
X-CSE-ConnectionGUID: EIzeKBthRv2S/LcUvwOYGw==
X-CSE-MsgGUID: uxH69NWcRF2k2uU6U+owPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93574591"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93574591"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 12:07:57 -0700
X-CSE-ConnectionGUID: EKc1MNbRS7SdYyz2L3eQRA==
X-CSE-MsgGUID: OzrY1cgHQEijDGElJC49ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273072000"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Sep 2026 12:07:55 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6YVU-000000004xl-1Q64;
	Tue, 15 Sep 2026 19:07:52 +0000
Date: Wed, 16 Sep 2026 03:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Thomas Gleixner <tglx@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [tip:irq/drivers 3/22] ld.lld: error: undefined symbol:
 qcom_scm_is_available
Message-ID: <202609160249.tiuDbEzF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   0c65a1331928d0207c385f03fb5eba0cfecce0e6
commit: 1b852de05f74cfc96c58caad9df4cc1fa2dc7689 [3/22] irqchip/qcom: Enable compile testing for QCOM_PDC and QCOM_MPM
config: hexagon-randconfig-002-20260915 (https://download.01.org/0day-ci/archive/20260916/202609160249.tiuDbEzF-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 148ee2b266b73a49f1f31d0bd17d4818b91bee9f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160249.tiuDbEzF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160249.tiuDbEzF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: qcom_scm_is_available
   >>> referenced by qcom-pdc.c:717 (drivers/irqchip/qcom-pdc.c:717)
   >>>               drivers/irqchip/qcom-pdc.o:(qcom_pdc_probe) in archive vmlinux.a
   >>> referenced by qcom-pdc.c:717 (drivers/irqchip/qcom-pdc.c:717)
   >>>               drivers/irqchip/qcom-pdc.o:(qcom_pdc_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: qcom_scm_io_writel
   >>> referenced by qcom-pdc.c:722 (drivers/irqchip/qcom-pdc.c:722)
   >>>               drivers/irqchip/qcom-pdc.o:(qcom_pdc_probe) in archive vmlinux.a
   >>> referenced by qcom-pdc.c:722 (drivers/irqchip/qcom-pdc.c:722)
   >>>               drivers/irqchip/qcom-pdc.o:(qcom_pdc_probe) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
