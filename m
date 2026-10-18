Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBC23BFE3C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318432; cv=none; b=UOem4PnhuI1xiNSomyty6BbRVNq299KgXujZC9WYvI5xToDEsZfTiW1VhVGz1G28RMY9VgPSWgJ4sRqufv5avd9nOc3b6qDThmhg/LYcR7qrPloeDX1wRuGCP+ZUm4glRfltGcmsnIcUyZ0xVDakFXya3YMXB0E7zyy913EnEiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318432; c=relaxed/simple;
	bh=rrT/G7toOrd2jVQkGbEXS1h/jwA9m43wSqlwP1uStcE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ImmTH6En4Ow76cMrnGyAQOnHdgeUYa0Yx/yhnjMft78ExI1jZp4icIteMAlDN+UeGLWocO2ibc4T0iOOp7RV0ed1VgP8oQ7In9s6dqfxxrw/1yTXMKrml0ksLZSjgtfo2iM8UUPVCq3A8jIZ8YjRZKvImdwPJmAWY9kiuv/vnzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3PCPbsA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3PCPbsA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792318427; x=1823854427;
  h=date:from:to:cc:subject:message-id;
  bh=rrT/G7toOrd2jVQkGbEXS1h/jwA9m43wSqlwP1uStcE=;
  b=N3PCPbsA1h9SUBPAUlDKvmc4v3eV++2/RODPjLT8gnEytqvytNpotPvE
   HJOR0QAXD5DZPHp1K2K0oQn2ft3b98ibxqyzo0qqO2vMuUio+MEKqxafq
   OlrF6YonIC9Yf3XUz/+MHwSaUALp9pmPWm3jSE/c0WMSGgV5cjz3B7NbX
   196z+Siw05TUwXPqRyBMS8XD45saFiXm4pBcU4cjYOAH+iM//sg7vLgwW
   kcCUugXPCPplbZHhbZRixVO7JF9CyA3u0OK9IRH9uDP89wXDNaMZ9/+Ws
   FLySY497ltrlpb+jeYtoVSMyrzqejjuvT9G/Qsu3FGGPI0xEjO6jX7dPI
   g==;
X-CSE-ConnectionGUID: JUSGdT8ZTg++owI3KtjE+A==
X-CSE-MsgGUID: MpSMqHkIQLmPk5sxiOfRhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="1062997"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="1062997"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 03:13:46 -0700
X-CSE-ConnectionGUID: s13uAlxHQRWjSgm81gnPvA==
X-CSE-MsgGUID: UKBd1aG4RBO49+HoRlkE4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2291182"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Oct 2026 03:13:44 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xINtd-00000000KIk-47oX;
	Sun, 18 Oct 2026 10:13:41 +0000
Date: Sun, 18 Oct 2026 18:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq:drivers] BUILD SUCCESS
 9376df3496753563e3d7f7cb5d91525f9a6e9497
Message-ID: <202610181820.2r7r1u3Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
branch HEAD: 9376df3496753563e3d7f7cb5d91525f9a6e9497  irqchip/al-fic: Support per-child affinity via interrupt redirection

elapsed time: 2689m

configs tested: 431
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2304-20261016    gcc-11.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261017    gcc-10.5.0
arc                   randconfig-1000-20261018    gcc-8.5.0
arc                   randconfig-1001-20261017    gcc-10.5.0
arc                   randconfig-1001-20261018    gcc-8.5.0
arc                   randconfig-2000-20261015    gcc-15.2.0
arc                   randconfig-2000-20261016    gcc-8.5.0
arc                   randconfig-2001-20261015    gcc-15.2.0
arc                   randconfig-2001-20261016    gcc-8.5.0
arc                  randconfig-r2101-20261015    clang-18   cocci
arc                         vdk_hs38_defconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                       footbridge_defconfig    clang-24
arm                             mps2_defconfig    clang-24
arm                         multi_v5_defconfig    clang-24
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20261017    gcc-10.5.0
arm                   randconfig-1000-20261018    gcc-8.5.0
arm                   randconfig-1001-20261017    gcc-10.5.0
arm                   randconfig-1001-20261018    gcc-8.5.0
arm                   randconfig-1002-20261017    gcc-10.5.0
arm                   randconfig-1002-20261018    gcc-8.5.0
arm                   randconfig-1003-20261017    gcc-10.5.0
arm                   randconfig-1003-20261018    gcc-8.5.0
arm                   randconfig-2000-20261015    gcc-15.2.0
arm                   randconfig-2000-20261016    gcc-8.5.0
arm                   randconfig-2001-20261015    gcc-15.2.0
arm                   randconfig-2001-20261016    gcc-8.5.0
arm                  randconfig-r2110-20261016    gcc-8.5.0  cocci
arm                  randconfig-r2305-20261016    gcc-11.5.0 sparse
arm                         realview_defconfig    clang-24
arm                        spear13xx_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261017    clang-24
arm64                 randconfig-1000-20261018    gcc-14.3.0
arm64                 randconfig-1001-20261017    clang-24
arm64                 randconfig-1001-20261018    gcc-14.3.0
arm64                 randconfig-1002-20261017    clang-24
arm64                 randconfig-1002-20261018    gcc-14.3.0
arm64                 randconfig-1003-20261017    clang-24
arm64                 randconfig-1003-20261018    gcc-14.3.0
arm64                 randconfig-2000-20261015    gcc-16.1.0
arm64                 randconfig-2000-20261016    gcc-12.5.0
arm64                 randconfig-2001-20261015    gcc-16.1.0
arm64                 randconfig-2001-20261016    gcc-12.5.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261017    clang-24
csky                  randconfig-1000-20261018    gcc-14.3.0
csky                  randconfig-1001-20261017    clang-24
csky                  randconfig-1001-20261018    gcc-14.3.0
csky                  randconfig-2000-20261015    gcc-16.1.0
csky                  randconfig-2000-20261016    gcc-12.5.0
csky                  randconfig-2001-20261015    gcc-16.1.0
csky                  randconfig-2001-20261016    gcc-12.5.0
csky                 randconfig-r2103-20261016    gcc-16.1.0 cocci
csky                 randconfig-r2108-20261016    gcc-16.1.0 cocci
csky                 randconfig-r2109-20261016    gcc-16.1.0 cocci
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261017    clang-21
hexagon               randconfig-1000-20261018    clang-21
hexagon               randconfig-1001-20261017    clang-21
hexagon               randconfig-1001-20261018    clang-21
hexagon               randconfig-2000-20261015    gcc-16.1.0
hexagon               randconfig-2000-20261016    gcc-12.5.0
hexagon               randconfig-2001-20261015    gcc-16.1.0
hexagon               randconfig-2001-20261016    gcc-12.5.0
hexagon              randconfig-r2106-20261016    gcc-8.5.0  cocci
hexagon              randconfig-r2202-20261015    clang-24   smatch
hexagon              randconfig-r2305-20261015    gcc-16.1.0 sparse
hexagon              randconfig-r2306-20261015    clang-24   sparse
hexagon              randconfig-r2308-20261015    clang-24   sparse
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20261017    gcc-14
i386        buildonly-randconfig-1000-20261018    clang-22
i386        buildonly-randconfig-1001-20261017    gcc-14
i386        buildonly-randconfig-1001-20261018    clang-22
i386        buildonly-randconfig-1002-20261017    gcc-14
i386        buildonly-randconfig-1002-20261018    clang-22
i386        buildonly-randconfig-1003-20261017    gcc-14
i386        buildonly-randconfig-1003-20261018    clang-22
i386        buildonly-randconfig-1004-20261017    gcc-14
i386        buildonly-randconfig-1004-20261018    clang-22
i386        buildonly-randconfig-1005-20261017    gcc-14
i386        buildonly-randconfig-1005-20261018    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261017    clang-22
i386                  randconfig-1000-20261018    gcc-14
i386                  randconfig-1001-20261017    clang-22
i386                  randconfig-1001-20261018    gcc-14
i386                  randconfig-1002-20261017    clang-22
i386                  randconfig-1002-20261018    gcc-14
i386                  randconfig-1003-20261017    clang-22
i386                  randconfig-1003-20261018    gcc-14
i386                  randconfig-1004-20261017    clang-22
i386                  randconfig-1004-20261018    gcc-14
i386                  randconfig-1005-20261017    clang-22
i386                  randconfig-1005-20261018    gcc-14
i386                  randconfig-1006-20261017    clang-22
i386                  randconfig-1006-20261018    gcc-14
i386                  randconfig-1007-20261017    clang-22
i386                  randconfig-1007-20261018    gcc-14
i386                  randconfig-1008-20261017    clang-22
i386                  randconfig-1008-20261018    gcc-14
i386                  randconfig-1009-20261017    clang-22
i386                  randconfig-1009-20261018    gcc-14
i386                  randconfig-1010-20261017    clang-22
i386                  randconfig-1010-20261018    gcc-14
i386                  randconfig-1011-20261017    clang-22
i386                  randconfig-1011-20261018    gcc-14
i386                  randconfig-1012-20261017    clang-22
i386                  randconfig-1012-20261018    gcc-14
i386                  randconfig-1013-20261017    clang-22
i386                  randconfig-1013-20261018    gcc-14
i386                  randconfig-2000-20261015    gcc-15.2.0
i386                  randconfig-2000-20261016    gcc-8.5.0
i386                  randconfig-2001-20261015    gcc-15.2.0
i386                  randconfig-2001-20261016    gcc-8.5.0
i386                  randconfig-2100-20261015    gcc-14     cocci
i386                  randconfig-2100-20261016    clang-22   cocci
i386                  randconfig-2101-20261015    gcc-14     cocci
i386                  randconfig-2101-20261016    clang-22   cocci
i386                  randconfig-2102-20261015    gcc-14     cocci
i386                  randconfig-2102-20261016    clang-22   cocci
i386                  randconfig-2103-20261015    gcc-14     cocci
i386                  randconfig-2103-20261016    clang-22   cocci
i386                  randconfig-2104-20261015    gcc-14     cocci
i386                  randconfig-2104-20261016    clang-22   cocci
i386                  randconfig-2105-20261015    gcc-14     cocci
i386                  randconfig-2105-20261016    clang-22   cocci
i386                  randconfig-2200-20261015    clang-22   smatch
i386                  randconfig-2200-20261016    clang-22   smatch
i386                  randconfig-2300-20261015    gcc-14     sparse
i386                  randconfig-2300-20261016    clang-22   sparse
i386                  randconfig-2301-20261015    gcc-14     sparse
i386                  randconfig-2301-20261016    clang-22   sparse
i386                  randconfig-2302-20261015    gcc-14     sparse
i386                  randconfig-2302-20261016    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261017    clang-21
loongarch             randconfig-1000-20261018    clang-21
loongarch             randconfig-1001-20261017    clang-21
loongarch             randconfig-1001-20261018    clang-21
loongarch             randconfig-2000-20261015    gcc-8.5.0
loongarch             randconfig-2000-20261016    gcc-11.5.0
loongarch             randconfig-2001-20261015    gcc-8.5.0
loongarch             randconfig-2001-20261016    gcc-11.5.0
loongarch            randconfig-r2102-20261015    clang-18   cocci
loongarch            randconfig-r2300-20261015    gcc-16.1.0 sparse
loongarch            randconfig-r2301-20261016    gcc-11.5.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5475evb_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2100-20261015    clang-18   cocci
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
mips                       bmips_stb_defconfig    gcc-16.1.0
mips                            ip30_defconfig    clang-24
mips                            mtx1_defconfig    gcc-16.1.0
mips                 randconfig-r2200-20261016    clang-24   smatch
mips                        rbtx49xx_defconfig    clang-24
mips                    sb1250_swarm_defconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261017    clang-21
nios2                 randconfig-1000-20261018    clang-21
nios2                 randconfig-1001-20261017    clang-21
nios2                 randconfig-1001-20261018    clang-21
nios2                 randconfig-2000-20261015    gcc-8.5.0
nios2                 randconfig-2000-20261016    gcc-11.5.0
nios2                 randconfig-2001-20261015    gcc-8.5.0
nios2                 randconfig-2001-20261016    gcc-11.5.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2100-20261016    gcc-16.1.0 cocci
openrisc             randconfig-r2301-20261015    gcc-16.1.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261017    gcc-15.2.0
parisc                randconfig-1000-20261018    clang-24
parisc                randconfig-1001-20261017    gcc-15.2.0
parisc                randconfig-1001-20261018    clang-24
parisc                randconfig-2000-20261015    gcc-8.5.0
parisc                randconfig-2000-20261016    gcc-11.5.0
parisc                randconfig-2001-20261015    gcc-8.5.0
parisc                randconfig-2001-20261016    gcc-11.5.0
parisc               randconfig-r2202-20261016    gcc-8.5.0  smatch
parisc               randconfig-r2303-20261015    gcc-16.1.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       chrp32_defconfig    clang-24
powerpc                           g5_defconfig    clang-24
powerpc                      powernv_defconfig    clang-24
powerpc               randconfig-1000-20261017    gcc-15.2.0
powerpc               randconfig-1000-20261018    clang-24
powerpc               randconfig-1001-20261017    gcc-15.2.0
powerpc               randconfig-1001-20261018    clang-24
powerpc               randconfig-2000-20261015    clang-22
powerpc               randconfig-2001-20261015    clang-22
powerpc              randconfig-r2105-20261016    gcc-8.5.0  cocci
powerpc              randconfig-r2106-20261015    clang-24   cocci
powerpc              randconfig-r2108-20261015    clang-18   cocci
powerpc              randconfig-r2111-20261016    gcc-8.5.0  cocci
powerpc              randconfig-r2311-20261015    clang-24   sparse
powerpc                      redwood_defconfig    gcc-16.1.0
powerpc                      tqm8540_defconfig    clang-24
powerpc64             randconfig-1000-20261017    gcc-15.2.0
powerpc64             randconfig-1000-20261018    clang-24
powerpc64             randconfig-1001-20261017    gcc-15.2.0
powerpc64             randconfig-1001-20261018    clang-24
powerpc64             randconfig-2000-20261015    clang-22
powerpc64             randconfig-2001-20261015    clang-22
powerpc64            randconfig-r2101-20261016    gcc-16.1.0 cocci
powerpc64            randconfig-r2103-20261015    clang-18   cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261017    clang-19
riscv                 randconfig-1000-20261018    clang-17
riscv                 randconfig-1001-20261017    clang-19
riscv                 randconfig-1001-20261018    clang-17
riscv                 randconfig-2000-20261015    gcc-9.5.0
riscv                 randconfig-2000-20261016    gcc-16.1.0
riscv                 randconfig-2001-20261015    gcc-9.5.0
riscv                 randconfig-2001-20261016    gcc-16.1.0
riscv                randconfig-r2107-20261015    clang-24   cocci
riscv                randconfig-r2110-20261015    clang-24   cocci
riscv                randconfig-r2300-20261016    gcc-11.5.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261017    clang-19
s390                  randconfig-1000-20261018    clang-17
s390                  randconfig-1001-20261017    clang-19
s390                  randconfig-1001-20261018    clang-17
s390                  randconfig-2000-20261015    gcc-9.5.0
s390                  randconfig-2000-20261016    gcc-16.1.0
s390                  randconfig-2001-20261015    gcc-9.5.0
s390                  randconfig-2001-20261016    gcc-16.1.0
s390                 randconfig-r2105-20261015    clang-24   cocci
s390                 randconfig-r2201-20261015    gcc-8.5.0  smatch
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                  kfr2r09-romimage_defconfig    clang-24
sh                    randconfig-1000-20261017    clang-19
sh                    randconfig-1000-20261018    clang-17
sh                    randconfig-1001-20261017    clang-19
sh                    randconfig-1001-20261018    clang-17
sh                    randconfig-2000-20261015    gcc-9.5.0
sh                    randconfig-2000-20261016    gcc-16.1.0
sh                    randconfig-2001-20261015    gcc-9.5.0
sh                    randconfig-2001-20261016    gcc-16.1.0
sh                   randconfig-r2309-20261015    clang-24   sparse
sh                         sh7757lcr_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261017    gcc-15.2.0
sparc                 randconfig-1000-20261018    clang-24
sparc                 randconfig-1001-20261017    gcc-15.2.0
sparc                 randconfig-1001-20261018    clang-24
sparc                 randconfig-2000-20261015    gcc-15.2.0
sparc                 randconfig-2000-20261016    gcc-12.5.0
sparc                 randconfig-2001-20261015    gcc-15.2.0
sparc                 randconfig-2001-20261016    gcc-12.5.0
sparc                randconfig-r2102-20261016    gcc-16.1.0 cocci
sparc                randconfig-r2104-20261015    clang-24   cocci
sparc                randconfig-r2310-20261015    clang-24   sparse
sparc                        sparc32_defconfig    clang-24
sparc64                           alldefconfig    gcc-16.1.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261017    gcc-15.2.0
sparc64               randconfig-1000-20261018    clang-24
sparc64               randconfig-1001-20261017    gcc-15.2.0
sparc64               randconfig-1001-20261018    clang-24
sparc64               randconfig-2000-20261015    gcc-15.2.0
sparc64               randconfig-2000-20261016    gcc-12.5.0
sparc64               randconfig-2001-20261015    gcc-15.2.0
sparc64               randconfig-2001-20261016    gcc-12.5.0
sparc64              randconfig-r2104-20261016    gcc-8.5.0  cocci
sparc64              randconfig-r2111-20261015    clang-24   cocci
sparc64              randconfig-r2201-20261016    gcc-12.5.0 smatch
sparc64              randconfig-r2302-20261015    gcc-16.1.0 sparse
sparc64              randconfig-r2307-20261015    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261017    gcc-15.2.0
um                    randconfig-1000-20261018    clang-24
um                    randconfig-1001-20261017    gcc-15.2.0
um                    randconfig-1001-20261018    clang-24
um                    randconfig-2000-20261015    gcc-15.2.0
um                    randconfig-2000-20261016    gcc-12.5.0
um                    randconfig-2001-20261015    gcc-15.2.0
um                    randconfig-2001-20261016    gcc-12.5.0
um                   randconfig-r2107-20261016    gcc-8.5.0  cocci
um                   randconfig-r2109-20261015    clang-18   cocci
um                   randconfig-r2304-20261015    gcc-16.1.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261017    gcc-14
x86_64      buildonly-randconfig-1000-20261018    clang-22
x86_64      buildonly-randconfig-1001-20261017    gcc-14
x86_64      buildonly-randconfig-1001-20261018    clang-22
x86_64      buildonly-randconfig-1002-20261017    gcc-14
x86_64      buildonly-randconfig-1002-20261018    clang-22
x86_64      buildonly-randconfig-1003-20261017    gcc-14
x86_64      buildonly-randconfig-1003-20261018    clang-22
x86_64      buildonly-randconfig-1004-20261017    gcc-14
x86_64      buildonly-randconfig-1004-20261018    clang-22
x86_64      buildonly-randconfig-1005-20261017    gcc-14
x86_64      buildonly-randconfig-1005-20261018    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261017    gcc-14
x86_64                randconfig-1000-20261018    clang-22
x86_64                randconfig-1001-20261017    gcc-14
x86_64                randconfig-1001-20261018    clang-22
x86_64                randconfig-1002-20261017    gcc-14
x86_64                randconfig-1002-20261018    clang-22
x86_64                randconfig-1003-20261017    gcc-14
x86_64                randconfig-1003-20261018    clang-22
x86_64                randconfig-1004-20261017    gcc-14
x86_64                randconfig-1004-20261018    clang-22
x86_64                randconfig-1005-20261017    gcc-14
x86_64                randconfig-1005-20261018    clang-22
x86_64                randconfig-1006-20261017    clang-22
x86_64                randconfig-1006-20261018    clang-22
x86_64                randconfig-1007-20261017    clang-22
x86_64                randconfig-1007-20261018    clang-22
x86_64                randconfig-1008-20261017    clang-22
x86_64                randconfig-1008-20261018    clang-22
x86_64                randconfig-1009-20261017    clang-22
x86_64                randconfig-1009-20261018    clang-22
x86_64                randconfig-1010-20261017    clang-22
x86_64                randconfig-1010-20261018    clang-22
x86_64                randconfig-1011-20261017    clang-22
x86_64                randconfig-1011-20261018    clang-22
x86_64                randconfig-1012-20261017    clang-22
x86_64                randconfig-1012-20261018    gcc-14
x86_64                randconfig-1013-20261017    clang-22
x86_64                randconfig-1013-20261018    gcc-14
x86_64                randconfig-1014-20261017    clang-22
x86_64                randconfig-1014-20261018    gcc-14
x86_64                randconfig-1015-20261017    clang-22
x86_64                randconfig-1015-20261018    gcc-14
x86_64                randconfig-1016-20261017    clang-22
x86_64                randconfig-1016-20261018    gcc-14
x86_64                randconfig-1017-20261017    clang-22
x86_64                randconfig-1017-20261018    gcc-14
x86_64                randconfig-2000-20261015    clang-22
x86_64                randconfig-2001-20261015    clang-22
x86_64                randconfig-2100-20261015    clang-22   cocci
x86_64                randconfig-2100-20261016    clang-22   cocci
x86_64                randconfig-2101-20261015    clang-22   cocci
x86_64                randconfig-2101-20261016    clang-22   cocci
x86_64                randconfig-2102-20261015    clang-22   cocci
x86_64                randconfig-2102-20261016    clang-22   cocci
x86_64                randconfig-2103-20261015    clang-22   cocci
x86_64                randconfig-2103-20261016    clang-22   cocci
x86_64                randconfig-2104-20261015    clang-22   cocci
x86_64                randconfig-2104-20261016    clang-22   cocci
x86_64                randconfig-2105-20261015    clang-22   cocci
x86_64                randconfig-2105-20261016    clang-22   cocci
x86_64                randconfig-2200-20261015    clang-22   smatch
x86_64                randconfig-2200-20261016    gcc-14     smatch
x86_64                randconfig-2300-20261015    gcc-14     sparse
x86_64                randconfig-2300-20261016    clang-22   sparse
x86_64                randconfig-2301-20261015    gcc-14     sparse
x86_64                randconfig-2301-20261016    clang-22   sparse
x86_64                randconfig-2302-20261015    gcc-14     sparse
x86_64                randconfig-2302-20261016    clang-22   sparse
x86_64               randconfig-r2200-20261015    clang-22   smatch
x86_64               randconfig-r2303-20261016    gcc-11.5.0 sparse
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
xtensa                   cadence_csp_defconfig    clang-24
xtensa                randconfig-1000-20261017    gcc-15.2.0
xtensa                randconfig-1000-20261018    clang-24
xtensa                randconfig-1001-20261017    gcc-15.2.0
xtensa                randconfig-1001-20261018    clang-24
xtensa                randconfig-2000-20261015    gcc-15.2.0
xtensa                randconfig-2000-20261016    gcc-12.5.0
xtensa                randconfig-2001-20261015    gcc-15.2.0
xtensa                randconfig-2001-20261016    gcc-12.5.0
xtensa               randconfig-r2302-20261016    gcc-11.5.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
