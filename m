Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110B34E0B94
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774460; cv=none; b=NhyrBEY6z4VdoqsHrNHB+hJZny9pRU4sDBKXQAOg3ulzqbL0pOfpuXkp+w20Ufzs9b8XBawIS2WWcnlKXhAOE5Km9DnKXtcww4urG07BMt2enYA3zy/7N06THA2raufQWBKyOFT3PheCsutphYq3tXJGAnKccIUU1ElLe09/hqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774460; c=relaxed/simple;
	bh=X+wBaMusRz8nk5ozw8kTeFgl8TR2HuU3A7JHiS4L24E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jMPArSMVY0PcYfowGvLvgsNUbggECKN+B0jo7v/8ZnpN+kjI+1H/0wnxoLetmPD3veeIqzuMbI+swLf1WO3HaNscnroOZ+8F+yDQKLvp5HJiNqb74kqojkdhIsCR6i/OBSVq1VdxknQrVKMpAJN9ldI4lag1uYbS63d+2Y/oI5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cknlClDy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cknlClDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790774446; x=1822310446;
  h=date:from:to:cc:subject:message-id;
  bh=X+wBaMusRz8nk5ozw8kTeFgl8TR2HuU3A7JHiS4L24E=;
  b=cknlClDy+b1fyZthRfQZi0oLuYzHcjZmLELTHCjuOGD/VhtsJHSdtNR9
   CsdgeaAnPs8F4v7N4AIg1ir100v7Kf3r+DY1w6LId8t4B0wl6AR4bvIER
   Rb+L2xwqzFc8r12eYrCUnxOdNCYpFkAOq2WW6NBriZskkP2BNJRFFldML
   l66pk0m9yjIeGN08X+gEkZJcFyuhpz8nUdMiS2qARsNPjRf1rANJwqOQ9
   s89GbN/sKBB9/psMr/XmVSLmnjvl4eJg5/NXvELtelywi6HzOgM1fyS/N
   hLfhUdUieUzt4PZxTjfUnWCnSz5q2R7zmehPGLoDQIOsXaBvEOaCwEz7N
   g==;
X-CSE-ConnectionGUID: ICxweRxSTxur2G1XAuHOmg==
X-CSE-MsgGUID: /Aw4Eq2hTdyi5ksNbqDNbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90276282"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90276282"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:20:44 -0700
X-CSE-ConnectionGUID: pDRMU+lZTh+7sKglM5ArnA==
X-CSE-MsgGUID: x0136h41T6ita6Un/IEPEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="313619430"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Sep 2026 06:20:42 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBuEh-00000000QfJ-3STW;
	Wed, 30 Sep 2026 13:20:39 +0000
Date: Wed, 30 Sep 2026 21:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 d6291d47c4895a58104e3f2bbcb39a24d0ff5a64
Message-ID: <202609302132.8wv49F5r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: d6291d47c4895a58104e3f2bbcb39a24d0ff5a64  Merge branch into tip/master: 'x86/tdx'

elapsed time: 945m

configs tested: 248
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2307-20260929    gcc-14.3.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260930    gcc-11.5.0
arc                   randconfig-1001-20260930    gcc-11.5.0
arc                  randconfig-r2301-20260929    clang-21   sparse
arc                  randconfig-r2302-20260929    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20260930    gcc-11.5.0
arm                   randconfig-1001-20260930    gcc-11.5.0
arm                   randconfig-1002-20260930    gcc-11.5.0
arm                   randconfig-1003-20260930    gcc-11.5.0
arm                  randconfig-r2103-20260929    gcc-15.2.0 cocci
arm                  randconfig-r2106-20260929    gcc-10.5.0 cocci
arm                  randconfig-r2202-20260929    clang-17   smatch
arm                  randconfig-r2305-20260929    gcc-8.5.0  sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260930    gcc-16.1.0
arm64                 randconfig-1001-20260930    gcc-16.1.0
arm64                 randconfig-1002-20260930    gcc-16.1.0
arm64                 randconfig-1003-20260930    gcc-16.1.0
arm64                randconfig-r2305-20260929    clang-21   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260930    gcc-16.1.0
csky                  randconfig-1001-20260930    gcc-16.1.0
csky                 randconfig-r2307-20260929    clang-22   sparse
csky                 randconfig-r2309-20260929    clang-22   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260930    clang-24
hexagon               randconfig-1001-20260930    clang-24
hexagon              randconfig-r2106-20260929    clang-24   cocci
hexagon              randconfig-r2201-20260929    clang-19   smatch
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20260930    gcc-14
i386        buildonly-randconfig-1001-20260930    gcc-14
i386        buildonly-randconfig-1002-20260930    gcc-14
i386        buildonly-randconfig-1003-20260930    gcc-14
i386        buildonly-randconfig-1004-20260930    gcc-14
i386        buildonly-randconfig-1005-20260930    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260930    gcc-14
i386                  randconfig-1001-20260930    gcc-14
i386                  randconfig-1002-20260930    gcc-14
i386                  randconfig-1003-20260930    gcc-14
i386                  randconfig-1004-20260930    gcc-14
i386                  randconfig-1005-20260930    gcc-14
i386                  randconfig-1006-20260930    gcc-14
i386                  randconfig-1007-20260930    clang-22
i386                  randconfig-1008-20260930    clang-22
i386                  randconfig-1009-20260930    clang-22
i386                  randconfig-1010-20260930    clang-22
i386                  randconfig-1011-20260930    clang-22
i386                  randconfig-1012-20260930    clang-22
i386                  randconfig-1013-20260930    clang-22
i386                  randconfig-2100-20260929    clang-22   cocci
i386                  randconfig-2101-20260929    clang-22   cocci
i386                  randconfig-2102-20260929    clang-22   cocci
i386                  randconfig-2103-20260929    clang-22   cocci
i386                  randconfig-2200-20260929    gcc-14     smatch
i386                  randconfig-2300-20260929    gcc-14     sparse
i386                  randconfig-2301-20260929    gcc-14     sparse
i386                  randconfig-2302-20260929    gcc-14     sparse
i386                 randconfig-r2102-20260929    gcc-16.1.0 cocci
i386                 randconfig-r2104-20260929    gcc-10.5.0 cocci
i386                 randconfig-r2306-20260929    gcc-14.3.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260930    clang-24
loongarch             randconfig-1001-20260930    clang-24
loongarch            randconfig-r2200-20260929    clang-24   smatch
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                        bvme6000_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    gcc-16.1.0
m68k                 randconfig-r2304-20260929    gcc-8.5.0  sparse
m68k                 randconfig-r2306-20260929    clang-22   sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2300-20260929    gcc-8.5.0  sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         bcm63xx_defconfig    gcc-16.1.0
mips                   cavium_octeon_defconfig    gcc-16.1.0
mips                      loongson2k_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260930    clang-24
nios2                 randconfig-1001-20260930    clang-24
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2103-20260929    gcc-16.1.0 cocci
openrisc             randconfig-r2104-20260929    clang-24   cocci
openrisc             randconfig-r2107-20260929    gcc-10.5.0 cocci
openrisc             randconfig-r2303-20260929    clang-21   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260930    gcc-8.5.0
parisc                randconfig-1001-20260930    gcc-8.5.0
parisc               randconfig-r2100-20260929    gcc-15.2.0 cocci
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc               randconfig-1000-20260930    gcc-8.5.0
powerpc               randconfig-1001-20260930    gcc-8.5.0
powerpc              randconfig-r2102-20260929    gcc-15.2.0 cocci
powerpc              randconfig-r2201-20260929    gcc-10.5.0 smatch
powerpc64             randconfig-1000-20260930    gcc-8.5.0
powerpc64             randconfig-1001-20260930    gcc-8.5.0
powerpc64            randconfig-r2100-20260929    gcc-16.1.0 cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260930    gcc-16.1.0
riscv                 randconfig-1001-20260930    gcc-16.1.0
riscv                 randconfig-2000-20260929    gcc-11.5.0
riscv                 randconfig-2001-20260929    gcc-11.5.0
riscv                randconfig-r2101-20260929    gcc-15.2.0 cocci
riscv                randconfig-r2202-20260929    clang-24   smatch
riscv                randconfig-r2304-20260929    clang-21   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260930    gcc-16.1.0
s390                  randconfig-1001-20260930    gcc-16.1.0
s390                  randconfig-2000-20260929    gcc-11.5.0
s390                  randconfig-2001-20260929    gcc-11.5.0
s390                 randconfig-r2101-20260929    gcc-16.1.0 cocci
s390                 randconfig-r2105-20260929    clang-24   cocci
s390                 randconfig-r2105-20260929    gcc-10.5.0 cocci
s390                 randconfig-r2309-20260929    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           r7780mp_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260930    gcc-16.1.0
sh                    randconfig-1001-20260930    gcc-16.1.0
sh                    randconfig-2000-20260929    gcc-11.5.0
sh                    randconfig-2001-20260929    gcc-11.5.0
sh                            se7619_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260930    clang-22
sparc                 randconfig-1001-20260930    clang-22
sparc                 randconfig-2000-20260929    gcc-12.5.0
sparc                 randconfig-2001-20260929    gcc-12.5.0
sparc                randconfig-r2200-20260929    gcc-8.5.0  smatch
sparc                randconfig-r2301-20260929    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260930    clang-22
sparc64               randconfig-1001-20260930    clang-22
sparc64               randconfig-2000-20260929    gcc-12.5.0
sparc64               randconfig-2001-20260929    gcc-12.5.0
sparc64              randconfig-r2303-20260929    gcc-8.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260930    clang-22
um                    randconfig-1001-20260930    clang-22
um                    randconfig-2000-20260929    gcc-12.5.0
um                    randconfig-2001-20260929    gcc-12.5.0
um                   randconfig-r2107-20260929    clang-24   cocci
um                   randconfig-r2302-20260929    clang-21   sparse
um                            x86_64_defconfig    gcc-14
um                            x86_64_defconfig    gcc-16.1.0
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20260930    clang-22
x86_64      buildonly-randconfig-1001-20260930    clang-22
x86_64      buildonly-randconfig-1002-20260930    clang-22
x86_64      buildonly-randconfig-1003-20260930    clang-22
x86_64      buildonly-randconfig-1004-20260930    clang-22
x86_64      buildonly-randconfig-1005-20260930    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260930    gcc-14
x86_64                randconfig-1001-20260930    gcc-14
x86_64                randconfig-1002-20260930    gcc-14
x86_64                randconfig-1003-20260930    gcc-14
x86_64                randconfig-1004-20260930    gcc-14
x86_64                randconfig-1005-20260930    gcc-14
x86_64                randconfig-1006-20260930    gcc-14
x86_64                randconfig-1007-20260930    gcc-14
x86_64                randconfig-1008-20260930    gcc-14
x86_64                randconfig-1009-20260930    gcc-14
x86_64                randconfig-1010-20260930    gcc-14
x86_64                randconfig-1011-20260930    gcc-14
x86_64                randconfig-1012-20260930    clang-22
x86_64                randconfig-1013-20260930    clang-22
x86_64                randconfig-1014-20260930    clang-22
x86_64                randconfig-1015-20260930    clang-22
x86_64                randconfig-1016-20260930    clang-22
x86_64                randconfig-1017-20260930    clang-22
x86_64                randconfig-2100-20260929    clang-22   cocci
x86_64                randconfig-2101-20260929    clang-22   cocci
x86_64                randconfig-2102-20260929    clang-22   cocci
x86_64                randconfig-2103-20260929    clang-22   cocci
x86_64                randconfig-2200-20260929    clang-22   smatch
x86_64                randconfig-2300-20260929    gcc-14     sparse
x86_64                randconfig-2301-20260929    gcc-14     sparse
x86_64                randconfig-2302-20260929    gcc-14     sparse
x86_64               randconfig-r2300-20260929    clang-21   sparse
x86_64               randconfig-r2308-20260929    clang-22   sparse
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
xtensa                randconfig-1000-20260930    clang-22
xtensa                randconfig-1001-20260930    clang-22
xtensa                randconfig-2000-20260929    gcc-12.5.0
xtensa                randconfig-2001-20260929    gcc-12.5.0
xtensa               randconfig-r2308-20260929    gcc-14.3.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
