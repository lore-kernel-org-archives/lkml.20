Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56031407CD3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791399134; cv=none; b=Rrp7VOi2OaOQmscZSBuPlndu+V8+Iegy6xWPNTuUnbv9EuWcyZYG4N3R+nARN1x4UysBVHxp/VBBZ/m3T8stOV8eDFx4kTeR5EciUJBkoPP5fIn5DXyTxQH8cwBPNjlovdhlHfBctR0s7YDkNN1GWWcaQ3oGPfVFr5NmMmQBRsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791399134; c=relaxed/simple;
	bh=Aczl2Kn56t2w5o8v8jj3PV4XKlgV4w0VSTuUcFGh+fw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lthBdGqZwn6h8WrtqNIr/Lo0vaRC9E/NwyhCWhEdlNJB4TDUSa+uvgzBEvT2zmAEjPH8b4DIZPGNQq56M+XF+HPYMZI0BGDLuDahlfkdAk4GvVBLPhoKo5+c1sXHRgjErnYVQCCiSVy32jiQp4Sx9+87wES0PX9kaxVn93HDEvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NndcHA68; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NndcHA68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791399133; x=1822935133;
  h=date:from:to:cc:subject:message-id;
  bh=Aczl2Kn56t2w5o8v8jj3PV4XKlgV4w0VSTuUcFGh+fw=;
  b=NndcHA68rtudUkDQUBWjISWjkdjAY2IAzNa7czb4Pyt+7zmm3hKjEPhx
   pWSZSjLjk0NXIPOLRAOxy1ZTuDWCrMC5lp5xtXlQWsO+Kon1ESPk86JA2
   nP3kz+1zSRZRRjMxaAHYZf+LJLKnsK5CpXx0dbYRob6OxmFm/579gHdCx
   Lq6cqDjjHmJKYD4677SUmA4UkHaeH+R9PAePttV6cg+x93rw0bMD1Ro4Y
   lYpCuI89DQZaQZ2piAUBrNAbsN00Q/3Jrv+3xMAsbgllDTJtRkmXnAR6r
   QsmSwD0hT5rCHWtWH0dRYu4kY5AdPl1Bc2o/YFht+nHj7Ri+NQbamFmtR
   w==;
X-CSE-ConnectionGUID: HGRfsV6MQ6+QM9+hJ0HN0A==
X-CSE-MsgGUID: zPjt3Ay4RM6mOm3I3oVXJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="54773"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="54773"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 11:52:12 -0700
X-CSE-ConnectionGUID: ZtZr6X9NRJGrpr4kmkQ5Xw==
X-CSE-MsgGUID: XQOKsrmSQw+j8AbsWvzRrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="1604944"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 07 Oct 2026 11:52:11 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEWkK-000000003pt-3xIA;
	Wed, 07 Oct 2026 18:52:08 +0000
Date: Wed, 07 Oct 2026 20:51:50 +0200
From: kernel test robot <lkp@intel.com>
To: Josh Law <objecting@objecting.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: include/linux/decompress/mm.h:(.text.get_bits+0x58):
 undefined reference to `__ashldi3'
Message-ID: <202610072038.5a9xpYG7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7b63ef2d55f24519e7e9e5f4d15dbea03f126e40
commit: d4dba3b9c03a326cfa73833d6b166aeb442f82b5 lib: decompress_bunzip2: fix 32-bit shift undefined behavior
date:   6 months ago
config: mips-randconfig-r2308-20261007 (https://download.01.org/0day-ci/archive/20261007/202610072038.5a9xpYG7-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072038.5a9xpYG7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d4dba3b9c03a ("lib: decompress_bunzip2: fix 32-bit shift undefined behavior")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610072038.5a9xpYG7-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: mips-linux-ld: arch/mips/boot/compressed/decompress.o: unable to get decompressed section .debug_info
   arch/mips/boot/compressed/decompress.o: in function `get_bits':
>> include/linux/decompress/mm.h:(.text.get_bits+0x58): undefined reference to `__ashldi3'
>> mips-linux-ld: include/linux/decompress/mm.h:(.text.get_bits+0xf0): undefined reference to `__ashldi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
