Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046710;
	b=vKK9/GeeM7Y8A4eh5uDIPkr0AQHWC49yeLXODxENvOU6FDp+Rs5YsMKXb3QcRPG8iO9R
	 QD5DdNt1ITbA6q+njoqhPoEJSO4S4crcLTIaICPU8g+DkMG8/SUc+aAwZIWxJZE0io4Gv
	 ntNn+BIzwqr1O8C188E/4OWvowovJ7IrJIChPHcl6cp5jA24uiOrm2+QvZk+mGk9a3Spd
	 X5RVwp++Kth3hfBOb+xsMpskaPv8k3m0aqAZPGTLp4F5cLEw6+/FFXRNT3X492u92DeSj
	 qa89yW9hvDO+R+GrhLIAJg2S2M5ZrBZleo71hBf331XO2OKmq3By1Nzzt6UuN+mGQGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046710;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Ol+nBG0MV2XObxyRfBUcHk6Jv7bh3asMGaZeA+hOmFE=;
	b=H+upf5QcgSkBf32JopFjr0tHJpnkGpRnVJQERRLvBieKfAMaGVQMTmDI5M92/POn/saN
	 G92vCx5Np/AAR/dDvf63Gr9TZdj0+HJUQUugYc4rjFSDelHYM6CxR3mxSqJaX7ApcGosf
	 B6ip0HnuYRiSbHIqx1jHqCGct+KTrRfR9ASIR7AdmSIFrxhgshMb2YhL6IfhQU5KK52Io
	 Je1xZYncUORzqeCGYWGBQ+7xLvlTVC/verjBYFmg3opjAPB8j0ACwekAMmJPfywlh+ua1
	 589PD41HfEpMPyFC7aaXhFCYkVIGF3ChDya7CO+NjUb94gAasQ25lPNtOk50yYUHAwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S0m2FUlF;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2373A606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2373A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S0m2FUlF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794046709; x=1825582709;
  h=date:from:to:cc:subject:message-id;
  bh=alyjADV/Z5eWs6GHoGsX4bxspfs77ySNxSmUtg7jMXc=;
  b=S0m2FUlFKdmluvkOQF5ZkGWR7hsVsKE29FX7EkwAHLT4U1zMRaDPfOlz
   hKgFl4ezDBC56dY8jZXUwWZYiwADdJmMjRuyBGQq7g5abCdFMyFitAk9X
   TjgLPH9GlSInIjNYzezqBF8xtHcEPH+9+DDOSPc94Qx1HpVaNSPhirl4M
   K7Ne3tHqlb8j1KSysNSbKHAFZcL/TfRUzM3f70zq4gExvlqANK6jPpH0K
   UcIA+DtcGpFwekjm8Wh+vftIeUsdNK0kxcbn72xX0DHHnyxhboxShzFIc
   YlWEX+CzVsdLQHvRn+nbySDFGLNeM50l6xRvdfj2mcmIoW98mFMZNla+W
   Q==;
X-CSE-ConnectionGUID: XAH/boaOTYShLCDVZcqLnA==
X-CSE-MsgGUID: c9iKsItiR9StoLhpeQgcDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2874095"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2874095"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 02:18:26 -0800
X-CSE-ConnectionGUID: g94jKhGXQWK6FzR+GBkQTg==
X-CSE-MsgGUID: v4mOdxpHTZ6HR7NBWYEFOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7595755"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Nov 2026 02:18:24 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPdV8-00000000qhh-1Ars;
	Sat, 07 Nov 2026 10:18:22 +0000
Date: Sat, 07 Nov 2026 18:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:locking:core] BUILD SUCCESS
 8e7c6217be7f8c016975f5b0954f6736b9ac42cf
Message-ID: <20261107181733.D5WhAKQl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
branch HEAD: 8e7c6217be7f8c016975f5b0954f6736b9ac42cf  locking/osq: Use CPU number for 'next' pointer

elapsed time: 959m

configs tested: 463
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261106    gcc-8.5.0
alpha                 randconfig-2001-20261106    gcc-8.5.0
alpha                 randconfig-2200-20261106    gcc-14.4.0 smatch
alpha                randconfig-r2105-20261106    gcc-11.5.0 cocci
alpha                randconfig-r2106-20261106    gcc-14.4.0 cocci
alpha                randconfig-r2110-20261106    gcc-9.5.0  cocci
alpha                randconfig-r2306-20261106    gcc-9.5.0  sparse
alpha                randconfig-r2307-20261106    gcc-10.5.0 sparse
arc                               alldefconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                               allmodconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                             hsdk_defconfig    gcc-16.2.0
arc                         nsimosci_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261107    gcc-12.5.0
arc                   randconfig-1001-20261107    gcc-12.5.0
arc                   randconfig-2000-20261106    gcc-12.5.0
arc                   randconfig-2001-20261106    gcc-12.5.0
arc                   randconfig-2002-20261106    gcc-12.5.0
arc                   randconfig-2003-20261106    gcc-12.5.0
arc                   randconfig-2004-20261106    gcc-12.5.0
arc                   randconfig-2005-20261106    gcc-12.5.0
arc                   randconfig-2200-20261106    gcc-10.5.0 smatch
arc                  randconfig-r2103-20261106    clang-24   cocci
arc                  randconfig-r2111-20261106    gcc-16.2.0 cocci
arc                  randconfig-r2300-20261106    gcc-16.2.0 sparse
arc                  randconfig-r2306-20261106    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                            h3600_defconfig    gcc-16.2.0
arm                           ixp4xx_defconfig    gcc-16.2.0
arm                         multi_v7_defconfig    gcc-16.2.0
arm                         mvebu_v5_defconfig    gcc-16.2.0
arm                         neponset_defconfig    gcc-16.2.0
arm                           pxa910_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261107    gcc-12.5.0
arm                   randconfig-1001-20261107    gcc-12.5.0
arm                   randconfig-1002-20261107    gcc-12.5.0
arm                   randconfig-1003-20261107    gcc-12.5.0
arm                   randconfig-2000-20261106    gcc-9.5.0
arm                   randconfig-2001-20261106    gcc-9.5.0
arm                   randconfig-2002-20261106    gcc-9.5.0
arm                   randconfig-2200-20261106    clang-17   smatch
arm                  randconfig-r2104-20261106    clang-21   cocci
arm                  randconfig-r2106-20261106    gcc-10.5.0 cocci
arm                  randconfig-r2109-20261106    gcc-10.5.0 cocci
arm                  randconfig-r2109-20261106    gcc-16.2.0 cocci
arm                  randconfig-r2300-20261106    clang-24   sparse
arm                  randconfig-r2300-20261106    gcc-14     sparse
arm                              rpc_defconfig    gcc-16.2.0
arm                            spitz_defconfig    gcc-16.2.0
arm                          vf610m4_defconfig    clang-17
arm                     vt8500_v6_v7_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261107    gcc-11.5.0
arm64                 randconfig-1001-20261107    gcc-11.5.0
arm64                 randconfig-1002-20261107    gcc-11.5.0
arm64                 randconfig-1003-20261107    gcc-11.5.0
arm64                 randconfig-2000-20261106    gcc-9.5.0
arm64                 randconfig-2001-20261106    gcc-9.5.0
arm64                 randconfig-2002-20261106    gcc-9.5.0
arm64                 randconfig-2200-20261106    clang-24   smatch
arm64                randconfig-r2102-20261106    gcc-13.5.0 cocci
arm64                randconfig-r2304-20261106    gcc-14     sparse
arm64                randconfig-r2306-20261106    clang-17   sparse
arm64                randconfig-r2306-20261106    gcc-8.5.0  sparse
arm64                randconfig-r2310-20261106    gcc-13.5.0 sparse
arm64                randconfig-r2311-20261106    gcc-15.3.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261107    gcc-11.5.0
csky                  randconfig-1001-20261107    gcc-11.5.0
csky                  randconfig-2000-20261106    clang-24
csky                  randconfig-2001-20261106    clang-24
csky                  randconfig-2200-20261106    gcc-10.5.0 smatch
csky                 randconfig-r2102-20261106    clang-21   cocci
csky                 randconfig-r2107-20261106    gcc-16.2.0 cocci
csky                 randconfig-r2108-20261106    gcc-10.5.0 cocci
csky                 randconfig-r2108-20261106    gcc-16.2.0 cocci
csky                 randconfig-r2111-20261106    gcc-8.5.0  cocci
csky                 randconfig-r2301-20261106    clang-24   sparse
csky                 randconfig-r2311-20261106    gcc-9.5.0  sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261107    clang-18
hexagon               randconfig-1001-20261107    clang-18
hexagon               randconfig-2000-20261106    clang-24
hexagon               randconfig-2001-20261106    clang-24
hexagon               randconfig-2200-20261106    clang-24   smatch
hexagon              randconfig-r2102-20261106    clang-24   cocci
hexagon              randconfig-r2108-20261106    gcc-8.5.0  cocci
hexagon              randconfig-r2302-20261106    clang-24   sparse
hexagon              randconfig-r2303-20261106    gcc-16.2.0 sparse
hexagon              randconfig-r2308-20261106    clang-17   sparse
hexagon              randconfig-r2308-20261106    gcc-15.3.0 sparse
hexagon              randconfig-r2310-20261106    clang-17   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261107    gcc-14
i386        buildonly-randconfig-1001-20261107    gcc-14
i386        buildonly-randconfig-1002-20261107    gcc-14
i386        buildonly-randconfig-1003-20261107    gcc-14
i386        buildonly-randconfig-1004-20261107    gcc-14
i386        buildonly-randconfig-1005-20261107    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261107    clang-22
i386                  randconfig-1001-20261107    clang-22
i386                  randconfig-1002-20261107    clang-22
i386                  randconfig-1003-20261107    clang-22
i386                  randconfig-1004-20261107    clang-22
i386                  randconfig-1005-20261107    clang-22
i386                  randconfig-1006-20261107    clang-22
i386                  randconfig-1007-20261107    clang-22
i386                  randconfig-1008-20261107    clang-22
i386                  randconfig-1009-20261107    clang-22
i386                  randconfig-1010-20261107    clang-22
i386                  randconfig-1011-20261107    clang-22
i386                  randconfig-1012-20261107    clang-22
i386                  randconfig-1013-20261107    clang-22
i386                  randconfig-2000-20261106    gcc-14
i386                  randconfig-2001-20261106    gcc-14
i386                  randconfig-2002-20261106    gcc-14
i386                  randconfig-2003-20261106    gcc-14
i386                  randconfig-2004-20261106    gcc-14
i386                  randconfig-2005-20261106    gcc-14
i386                  randconfig-2100-20261106    clang-22   cocci
i386                  randconfig-2101-20261106    clang-22   cocci
i386                  randconfig-2102-20261106    clang-22   cocci
i386                  randconfig-2103-20261106    clang-22   cocci
i386                  randconfig-2104-20261106    clang-22   cocci
i386                  randconfig-2105-20261106    clang-22   cocci
i386                  randconfig-2300-20261106    clang-22   sparse
i386                  randconfig-2301-20261106    clang-22   sparse
i386                  randconfig-2302-20261106    clang-22   sparse
i386                 randconfig-r2111-20261106    gcc-9.5.0  cocci
i386                 randconfig-r2307-20261106    gcc-8.5.0  sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261107    clang-18
loongarch             randconfig-1001-20261107    clang-18
loongarch             randconfig-2000-20261106    clang-19
loongarch             randconfig-2001-20261106    clang-19
loongarch             randconfig-2200-20261106    clang-24   smatch
loongarch            randconfig-r2100-20261106    gcc-13.5.0 cocci
loongarch            randconfig-r2102-20261106    gcc-14     cocci
loongarch            randconfig-r2104-20261106    clang-24   cocci
loongarch            randconfig-r2106-20261106    gcc-16.2.0 cocci
loongarch            randconfig-r2110-20261106    gcc-8.5.0  cocci
loongarch            randconfig-r2302-20261106    gcc-16.2.0 sparse
loongarch            randconfig-r2304-20261106    clang-24   sparse
loongarch            randconfig-r2308-20261106    gcc-8.5.0  sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261106    gcc-8.5.0
m68k                  randconfig-2001-20261106    gcc-8.5.0
m68k                  randconfig-2200-20261106    gcc-11.5.0 smatch
m68k                 randconfig-r2101-20261106    gcc-11.5.0 cocci
m68k                 randconfig-r2305-20261106    gcc-16.2.0 sparse
m68k                 randconfig-r2308-20261106    gcc-8.5.0  sparse
m68k                 randconfig-r2309-20261106    gcc-13.5.0 sparse
m68k                 randconfig-r2311-20261106    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261106    gcc-8.5.0
microblaze            randconfig-2001-20261106    gcc-8.5.0
microblaze            randconfig-2200-20261106    gcc-14.4.0 smatch
microblaze           randconfig-r2309-20261106    clang-17   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    clang-17
mips                      decstation_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261106    gcc-8.5.0
mips                  randconfig-2001-20261106    gcc-8.5.0
mips                  randconfig-2002-20261106    gcc-8.5.0
mips                  randconfig-2200-20261106    clang-17   smatch
mips                 randconfig-r2104-20261106    gcc-11.5.0 cocci
mips                 randconfig-r2303-20261106    clang-24   sparse
mips                 randconfig-r2308-20261106    gcc-9.5.0  sparse
mips                 randconfig-r2309-20261106    gcc-10.5.0 sparse
mips                 randconfig-r2311-20261106    gcc-8.5.0  sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261107    clang-18
nios2                 randconfig-1001-20261107    clang-18
nios2                 randconfig-2000-20261106    clang-19
nios2                 randconfig-2001-20261106    clang-19
nios2                 randconfig-2200-20261106    gcc-10.5.0 smatch
nios2                randconfig-r2100-20261106    gcc-11.5.0 cocci
nios2                randconfig-r2101-20261106    clang-21   cocci
nios2                randconfig-r2107-20261106    gcc-8.5.0  cocci
nios2                randconfig-r2109-20261106    gcc-8.5.0  cocci
nios2                randconfig-r2307-20261106    gcc-8.5.0  sparse
nios2                randconfig-r2308-20261106    gcc-13.5.0 sparse
nios2                randconfig-r2309-20261106    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261106    gcc-8.5.0
openrisc              randconfig-2001-20261106    gcc-8.5.0
openrisc              randconfig-2002-20261106    gcc-8.5.0
openrisc              randconfig-2200-20261106    gcc-16.2.0 smatch
openrisc             randconfig-r2103-20261106    gcc-13.5.0 cocci
openrisc             randconfig-r2105-20261106    clang-24   cocci
openrisc             randconfig-r2106-20261106    gcc-8.5.0  cocci
openrisc             randconfig-r2107-20261106    gcc-9.5.0  cocci
openrisc             randconfig-r2310-20261106    gcc-10.5.0 sparse
openrisc                  simple_smp_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261107    clang-24
parisc                randconfig-1001-20261107    clang-24
parisc                randconfig-2000-20261106    clang-19
parisc                randconfig-2001-20261106    clang-19
parisc                randconfig-2200-20261106    gcc-12.5.0 smatch
parisc               randconfig-r2105-20261106    gcc-13.5.0 cocci
parisc               randconfig-r2106-20261106    gcc-9.5.0  cocci
parisc               randconfig-r2305-20261106    gcc-14     sparse
parisc               randconfig-r2307-20261106    gcc-8.5.0  sparse
parisc               randconfig-r2310-20261106    gcc-15.3.0 sparse
parisc               randconfig-r2310-20261106    gcc-8.5.0  sparse
parisc               randconfig-r2311-20261106    gcc-10.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    gcc-16.2.0
powerpc                     ge_imp3a_defconfig    clang-17
powerpc                       katmai_defconfig    gcc-16.2.0
powerpc                       mgcoge_defconfig    gcc-16.2.0
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc                      ppa8548_defconfig    clang-17
powerpc                      rainier_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261107    clang-24
powerpc               randconfig-1001-20261107    clang-24
powerpc               randconfig-2000-20261106    gcc-8.5.0
powerpc               randconfig-2001-20261106    gcc-8.5.0
powerpc               randconfig-2002-20261106    gcc-8.5.0
powerpc               randconfig-2200-20261106    clang-24   smatch
powerpc              randconfig-r2100-20261106    gcc-14     cocci
powerpc              randconfig-r2101-20261106    clang-24   cocci
powerpc              randconfig-r2109-20261106    gcc-14.4.0 cocci
powerpc              randconfig-r2109-20261106    gcc-9.5.0  cocci
powerpc              randconfig-r2301-20261106    gcc-14     sparse
powerpc              randconfig-r2301-20261106    gcc-16.2.0 sparse
powerpc              randconfig-r2308-20261106    gcc-8.5.0  sparse
powerpc                      tqm8555_defconfig    gcc-16.2.0
powerpc                      tqm8560_defconfig    clang-17
powerpc                         warp_defconfig    clang-17
powerpc64             randconfig-1000-20261107    clang-24
powerpc64             randconfig-1001-20261107    clang-24
powerpc64             randconfig-2000-20261106    gcc-8.5.0
powerpc64             randconfig-2001-20261106    gcc-8.5.0
powerpc64             randconfig-2002-20261106    gcc-8.5.0
powerpc64             randconfig-2200-20261106    gcc-8.5.0  smatch
powerpc64            randconfig-r2108-20261106    gcc-9.5.0  cocci
powerpc64            randconfig-r2110-20261106    gcc-10.5.0 cocci
powerpc64            randconfig-r2111-20261106    gcc-14.4.0 cocci
powerpc64            randconfig-r2303-20261106    gcc-14     sparse
powerpc64            randconfig-r2307-20261106    gcc-15.3.0 sparse
powerpc64            randconfig-r2311-20261106    gcc-8.5.0  sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                     nommu_k210_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261107    gcc-11.5.0
riscv                 randconfig-1001-20261107    gcc-11.5.0
riscv                 randconfig-2000-20261106    gcc-13.5.0
riscv                 randconfig-2001-20261106    gcc-13.5.0
riscv                 randconfig-2002-20261106    gcc-13.5.0
riscv                 randconfig-2003-20261106    gcc-13.5.0
riscv                 randconfig-2004-20261106    gcc-13.5.0
riscv                 randconfig-2005-20261106    gcc-13.5.0
riscv                 randconfig-2200-20261106    gcc-11.5.0 smatch
riscv                randconfig-r2102-20261106    gcc-11.5.0 cocci
riscv                randconfig-r2103-20261106    gcc-11.5.0 cocci
riscv                randconfig-r2105-20261106    clang-21   cocci
riscv                randconfig-r2109-20261106    gcc-10.5.0 cocci
riscv                randconfig-r2111-20261106    gcc-10.5.0 cocci
riscv                randconfig-r2306-20261106    gcc-13.5.0 sparse
riscv                randconfig-r2309-20261106    gcc-15.3.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261107    gcc-11.5.0
s390                  randconfig-1001-20261107    gcc-11.5.0
s390                  randconfig-2000-20261106    gcc-8.5.0
s390                  randconfig-2001-20261106    gcc-8.5.0
s390                  randconfig-2002-20261106    gcc-8.5.0
s390                  randconfig-2003-20261106    gcc-8.5.0
s390                  randconfig-2004-20261106    gcc-8.5.0
s390                  randconfig-2005-20261106    gcc-8.5.0
s390                  randconfig-2200-20261106    clang-18   smatch
s390                 randconfig-r2104-20261106    gcc-13.5.0 cocci
s390                 randconfig-r2104-20261106    gcc-14     cocci
s390                 randconfig-r2107-20261106    gcc-10.5.0 cocci
s390                 randconfig-r2307-20261106    clang-17   sparse
s390                 randconfig-r2310-20261106    gcc-9.5.0  sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           r7780mp_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261107    gcc-11.5.0
sh                    randconfig-1001-20261107    gcc-11.5.0
sh                    randconfig-2000-20261106    gcc-16.2.0
sh                    randconfig-2001-20261106    gcc-16.2.0
sh                    randconfig-2002-20261106    gcc-16.2.0
sh                    randconfig-2003-20261106    gcc-16.2.0
sh                    randconfig-2004-20261106    gcc-16.2.0
sh                    randconfig-2005-20261106    gcc-16.2.0
sh                    randconfig-2200-20261106    gcc-16.2.0 smatch
sh                   randconfig-r2100-20261106    clang-21   cocci
sh                   randconfig-r2103-20261106    clang-21   cocci
sh                   randconfig-r2110-20261106    gcc-16.2.0 cocci
sh                   randconfig-r2309-20261106    gcc-8.5.0  sparse
sh                   randconfig-r2310-20261106    gcc-8.5.0  sparse
sh                            se7712_defconfig    gcc-16.2.0
sh                            se7751_defconfig    gcc-16.2.0
sh                            sh2007_defconfig    gcc-16.2.0
sh                         sh7785lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261107    gcc-10.5.0
sparc                 randconfig-1001-20261107    gcc-10.5.0
sparc                 randconfig-2000-20261106    gcc-8.5.0
sparc                 randconfig-2001-20261106    gcc-8.5.0
sparc                 randconfig-2200-20261106    gcc-8.5.0  smatch
sparc                randconfig-r2101-20261106    gcc-13.5.0 cocci
sparc                randconfig-r2105-20261106    gcc-14     cocci
sparc                randconfig-r2107-20261106    gcc-14.4.0 cocci
sparc                randconfig-r2108-20261106    gcc-14.4.0 cocci
sparc                randconfig-r2111-20261106    gcc-10.5.0 cocci
sparc                randconfig-r2305-20261106    clang-24   sparse
sparc                randconfig-r2311-20261106    clang-17   sparse
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261107    gcc-10.5.0
sparc64               randconfig-1001-20261107    gcc-10.5.0
sparc64               randconfig-2000-20261106    gcc-8.5.0
sparc64               randconfig-2001-20261106    gcc-8.5.0
sparc64               randconfig-2200-20261106    gcc-8.5.0  smatch
sparc64              randconfig-r2304-20261106    gcc-16.2.0 sparse
sparc64              randconfig-r2306-20261106    gcc-15.3.0 sparse
sparc64              randconfig-r2307-20261106    gcc-13.5.0 sparse
sparc64              randconfig-r2308-20261106    gcc-10.5.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261107    gcc-10.5.0
um                    randconfig-1001-20261107    gcc-10.5.0
um                    randconfig-2000-20261106    gcc-8.5.0
um                    randconfig-2001-20261106    gcc-8.5.0
um                    randconfig-2200-20261106    gcc-13     smatch
um                   randconfig-r2100-20261106    clang-24   cocci
um                   randconfig-r2106-20261106    gcc-10.5.0 cocci
um                   randconfig-r2108-20261106    gcc-10.5.0 cocci
um                   randconfig-r2306-20261106    gcc-10.5.0 sparse
um                   randconfig-r2309-20261106    gcc-8.5.0  sparse
um                   randconfig-r2311-20261106    gcc-13.5.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    gcc-16.2.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261107    gcc-14
x86_64      buildonly-randconfig-1001-20261107    gcc-14
x86_64      buildonly-randconfig-1002-20261107    gcc-14
x86_64      buildonly-randconfig-1003-20261107    gcc-14
x86_64      buildonly-randconfig-1004-20261107    gcc-14
x86_64      buildonly-randconfig-1005-20261107    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261107    gcc-14
x86_64                randconfig-1001-20261107    gcc-14
x86_64                randconfig-1002-20261107    gcc-14
x86_64                randconfig-1003-20261107    gcc-14
x86_64                randconfig-1004-20261107    gcc-14
x86_64                randconfig-1005-20261107    gcc-14
x86_64                randconfig-1006-20261107    gcc-13
x86_64                randconfig-1007-20261107    gcc-13
x86_64                randconfig-1008-20261107    gcc-13
x86_64                randconfig-1009-20261107    gcc-13
x86_64                randconfig-1010-20261107    gcc-13
x86_64                randconfig-1011-20261107    gcc-13
x86_64                randconfig-1012-20261107    clang-22
x86_64                randconfig-1013-20261107    clang-22
x86_64                randconfig-1014-20261107    clang-22
x86_64                randconfig-1015-20261107    clang-22
x86_64                randconfig-1016-20261107    clang-22
x86_64                randconfig-1017-20261107    clang-22
x86_64                randconfig-2000-20261106    gcc-14
x86_64                randconfig-2001-20261106    gcc-14
x86_64                randconfig-2002-20261106    gcc-14
x86_64                randconfig-2003-20261106    gcc-14
x86_64                randconfig-2004-20261106    gcc-14
x86_64                randconfig-2005-20261106    gcc-14
x86_64                randconfig-2100-20261106    clang-22   cocci
x86_64                randconfig-2101-20261106    clang-22   cocci
x86_64                randconfig-2102-20261106    clang-22   cocci
x86_64                randconfig-2103-20261106    clang-22   cocci
x86_64                randconfig-2104-20261106    clang-22   cocci
x86_64                randconfig-2105-20261106    clang-22   cocci
x86_64                randconfig-2200-20261106    gcc-14     smatch
x86_64                randconfig-2300-20261106    clang-22   sparse
x86_64                randconfig-2301-20261106    clang-22   sparse
x86_64                randconfig-2302-20261106    clang-22   sparse
x86_64               randconfig-r2101-20261106    gcc-14     cocci
x86_64               randconfig-r2103-20261106    gcc-14     cocci
x86_64               randconfig-r2107-20261106    gcc-10.5.0 cocci
x86_64               randconfig-r2302-20261106    gcc-14     sparse
x86_64               randconfig-r2309-20261106    gcc-9.5.0  sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261107    gcc-10.5.0
xtensa                randconfig-1001-20261107    gcc-10.5.0
xtensa                randconfig-2000-20261106    clang-24
xtensa                randconfig-2001-20261106    clang-24
xtensa                randconfig-2200-20261106    gcc-8.5.0  smatch
xtensa               randconfig-r2110-20261106    gcc-14.4.0 cocci
xtensa               randconfig-r2306-20261106    gcc-8.5.0  sparse
xtensa               randconfig-r2307-20261106    gcc-9.5.0  sparse
xtensa               randconfig-r2310-20261106    gcc-8.5.0  sparse
xtensa                          virt_defconfig    gcc-16.2.0
xtensa                     xip_kc705_defconfig    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
