Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4504E3F075E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792134133; cv=none; b=Y35V4+kDHCjBkCvDkF9bLCFFZVg/6uQyiZn8sRnAsNBGU8tuUf01X3guEBoDYj7+MruPWDCmotC6YNhRoW+79QVDzGR3Gx/AmlsR3qrxiP9s0on14h+os7PJlbA8O1+AX6lQp1aaf1SlNJwH6vxtr/yV6tH38I9FI7fIBGWb+Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792134133; c=relaxed/simple;
	bh=gSc7tjqAegDPTdtwmo3ZCoPF8OFeOb3yXLKSBW7wtZk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dQUreleOl6O+LjJ54Ei+G4tIyyXxHR7gHt+p39c0BHI1htRWl743TnT4kP3vETHmCm873gshZP+jBs16ChBcgO8YRQTGCZyFVsJVC35dqgoIRl90fUDpuMrPyZ9zMqtEuRog5sXKGT6E80IVTJLHuTU3KPFe+zpIu/zVvFaRyKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2SrFMBu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2SrFMBu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792134131; x=1823670131;
  h=date:from:to:cc:subject:message-id;
  bh=gSc7tjqAegDPTdtwmo3ZCoPF8OFeOb3yXLKSBW7wtZk=;
  b=K2SrFMBu1sNLJu0mAA+pyHKeLv5uG67ZRFlyj/FP4AOJkV8Es72KIxvs
   Gzlq0KVKYY7s0w+hNbBfWYj+PHCrKVrkQ1/NlfDFE7WmwAiZd9vWluZZM
   Ddgnwty1weD24D1s+5/7ARQ0NQwozD7K5YvVGqdNp5INtZEk6rv6gNAEB
   /b7s1TfX6yqAvdgADNP26Mo+ZlnpW7K38iCDkeV6tGMMAclf119VPT9cu
   syhOBh4Ty5x5oNek7sVXa/Xohg+MVRk3BWo3eQQWcvmFdJAnxluUbC+R8
   v5BGEmgDdd+1l96GS4lmcj//5hQz/01CDbiSy+7s0fXJvr9gsbSkbVp9X
   g==;
X-CSE-ConnectionGUID: wp2FIccjSuWbHHwPCQSG5Q==
X-CSE-MsgGUID: aPMbhk3+QkeEM2Fj7Mu46A==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="909975"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="909975"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 00:02:11 -0700
X-CSE-ConnectionGUID: ZCHtAb79RtKYILMxSf09Bw==
X-CSE-MsgGUID: V7SecRpoTV2uRQat76SciQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2225639"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 16 Oct 2026 00:02:09 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHbx9-00000000C7B-19PO;
	Fri, 16 Oct 2026 07:02:07 +0000
Date: Fri, 16 Oct 2026 09:02:06 +0200
From: kernel test robot <lkp@intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: ld.lld: error: undefined symbol: drm_dsc_pps_payload_pack
Message-ID: <202610160921.ZxhwcBFE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
commit: 75a5dbd1f4f71b1382dae973538af00178ba55a0 drm/panel: Add Novatek NT36536 panel driver
date:   3 months ago
config: powerpc64-randconfig-r2300-20261016 (https://download.01.org/0day-ci/archive/20261016/202610160921.ZxhwcBFE-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8a679464f19c426ef76aad9f4587b703dd3e584d)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610160921.ZxhwcBFE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 75a5dbd1f4f7 ("drm/panel: Add Novatek NT36536 panel driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610160921.ZxhwcBFE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_dsc_pps_payload_pack
   >>> referenced by panel-novatek-nt36536.c
   >>>               drivers/gpu/drm/panel/panel-novatek-nt36536.o:(novatek_prepare) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
