Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF4A369D53
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631963; cv=none; b=jne14TjGs9Ib1MLn8W8I9iDgtfZsBx8JGvnJd9CCDXkOnQvf98m55Ip2yO7FfZFpJKDhLQ4sBZp3lEdVAcEeaqCGkzJtX0sge93FQHQ+Xsq3Hl03r4Bj7HIP+L5Ji7dF4kuQBfm7dhQntpQlr0QcxK8+yPdH80oiNNBIierNltk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631963; c=relaxed/simple;
	bh=r165ipTM1WPICGRRTyn+Mrnh4eSJMrbSxWgQlcTtx3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rEIN1ScTg4O0twzzTZgtFaEK9qj0rPV9CYrrxTj4daWICyrlsG6CW37bGFV+BdgWorSebAa/BR3LVzOr4EuO6jATd36XmNef0ru5TcXHOZCf5nLYHJw5yOm+eZcHDp8NEvshP+60KtujEW2ZKxAW0yKd4uWIaTWJAFCV62N0PKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3RAZ6hx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3RAZ6hx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790631960; x=1822167960;
  h=date:from:to:cc:subject:message-id;
  bh=r165ipTM1WPICGRRTyn+Mrnh4eSJMrbSxWgQlcTtx3A=;
  b=C3RAZ6hxRt+r79lV4JenRJPjsus0Wqh259YYaF2nhfCvPwyyieUU93Gg
   8D4gsy/YALpav1a+8L3oZWthgSrQJ1g9rgZOgiGlZnE1c7Vi6IzqFcDrJ
   2Ogdq3mqHHlekmTFXKUYsmTeT4+iN6D5giFPBGmTy3BBXRYRSaMVrXFRF
   S0v2old8+BuNRoxyklHqRQmR7MKj+vh8o677O+AcfuzoeY+dlMv6/BmXC
   rg16prxWF/a8XqOWKQ3tcn+EeixixejJXrdzPQhg94+NpVnYblvlfaMw7
   LGZrsC1OGz3yl5ahQhrDdgd55Zuly4t2nplw1zKNm6dOS/8d8KamSHkGe
   A==;
X-CSE-ConnectionGUID: EQJu3nrNRpCAWK4GZJZtpw==
X-CSE-MsgGUID: 2n9BI2KcTdKvdtnxN/dEMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101866242"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="101866242"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:45:55 -0700
X-CSE-ConnectionGUID: CfJ0bYl0T4Ob1XQ5KfnyUw==
X-CSE-MsgGUID: OwLT4jmVRriuF3AcQTPm4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="273788357"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2026 14:45:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBJAV-00000000OYf-0Dne;
	Mon, 28 Sep 2026 21:45:51 +0000
Date: Tue, 29 Sep 2026 05:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip:urgent] BUILD SUCCESS
 e04ada8d8bc1fbb9a20f3923271104f68e6c2e78
Message-ID: <202609290502.rmNOFQKm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: e04ada8d8bc1fbb9a20f3923271104f68e6c2e78  Merge branch into tip/master: 'x86/mm'

elapsed time: 1315m

configs tested: 274
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2202-20260927    gcc-9.5.0  smatch
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                          haps_hs_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260928    clang-24
arc                   randconfig-1000-20260929    clang-17
arc                   randconfig-1001-20260928    clang-24
arc                   randconfig-1001-20260929    clang-17
arc                  randconfig-r2200-20260927    gcc-8.5.0  smatch
arc                     vdk_hs38_smp_defconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                            h3600_defconfig    gcc-16.1.0
arm                          lpc32xx_defconfig    gcc-16.1.0
arm                             mmp2_defconfig    gcc-16.1.0
arm                         multi_v5_defconfig    gcc-16.1.0
arm                          mv78xx0_defconfig    gcc-16.1.0
arm                         mvebu_v5_defconfig    clang-24
arm                         neponset_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260928    clang-24
arm                   randconfig-1000-20260929    clang-17
arm                   randconfig-1001-20260928    clang-24
arm                   randconfig-1001-20260929    clang-17
arm                   randconfig-1002-20260928    clang-24
arm                   randconfig-1002-20260929    clang-17
arm                   randconfig-1003-20260928    clang-24
arm                   randconfig-1003-20260929    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260928    gcc-15.2.0
arm64                 randconfig-1000-20260929    clang-24
arm64                 randconfig-1001-20260928    gcc-15.2.0
arm64                 randconfig-1001-20260929    clang-24
arm64                 randconfig-1002-20260928    gcc-15.2.0
arm64                 randconfig-1002-20260929    clang-24
arm64                 randconfig-1003-20260928    gcc-15.2.0
arm64                 randconfig-1003-20260929    clang-24
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260928    gcc-15.2.0
csky                  randconfig-1000-20260929    clang-24
csky                  randconfig-1001-20260928    gcc-15.2.0
csky                  randconfig-1001-20260929    clang-24
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260928    gcc-8.5.0
hexagon               randconfig-1001-20260928    gcc-8.5.0
hexagon              randconfig-r2102-20260927    clang-24   cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260928    clang-22
i386        buildonly-randconfig-1001-20260928    clang-22
i386        buildonly-randconfig-1002-20260928    clang-22
i386        buildonly-randconfig-1003-20260928    clang-22
i386        buildonly-randconfig-1004-20260928    clang-22
i386        buildonly-randconfig-1005-20260928    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260928    gcc-14
i386                  randconfig-1001-20260928    gcc-14
i386                  randconfig-1002-20260928    gcc-14
i386                  randconfig-1003-20260928    gcc-14
i386                  randconfig-1004-20260928    gcc-14
i386                  randconfig-1005-20260928    gcc-14
i386                  randconfig-1006-20260928    gcc-14
i386                  randconfig-1007-20260928    clang-22
i386                  randconfig-1008-20260928    clang-22
i386                  randconfig-1009-20260928    clang-22
i386                  randconfig-1010-20260928    clang-22
i386                  randconfig-1011-20260928    clang-22
i386                  randconfig-1012-20260928    clang-22
i386                  randconfig-1013-20260928    clang-22
i386                  randconfig-2100-20260927    clang-22   cocci
i386                  randconfig-2101-20260927    clang-22   cocci
i386                  randconfig-2102-20260927    clang-22   cocci
i386                  randconfig-2103-20260927    clang-22   cocci
i386                  randconfig-2200-20260927    clang-22   smatch
i386                  randconfig-2300-20260927    clang-22   sparse
i386                  randconfig-2301-20260927    clang-22   sparse
i386                  randconfig-2302-20260927    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260928    gcc-8.5.0
loongarch             randconfig-1001-20260928    gcc-8.5.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2306-20260927    gcc-14.3.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                       bmips_stb_defconfig    gcc-16.1.0
mips                       fuloong2e_defconfig    gcc-16.1.0
mips                       loongson3_defconfig    gcc-16.1.0
mips                     maltaup_xpa_defconfig    gcc-16.1.0
mips                         omega2p_defconfig    gcc-16.1.0
mips                 randconfig-r2100-20260927    gcc-15.2.0 cocci
mips                         vocore2_defconfig    gcc-16.1.0
nios2                          3c120_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260928    gcc-8.5.0
nios2                 randconfig-1001-20260928    gcc-8.5.0
nios2                randconfig-r2307-20260927    gcc-9.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2106-20260927    gcc-16.1.0 cocci
parisc                            alldefconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260928    clang-24
parisc                randconfig-1000-20260929    gcc-8.5.0
parisc                randconfig-1001-20260928    clang-24
parisc                randconfig-1001-20260929    gcc-8.5.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       bamboo_defconfig    clang-24
powerpc                         cell_defconfig    gcc-16.1.0
powerpc                    currituck_defconfig    gcc-16.1.0
powerpc                  linkstation_defconfig    clang-24
powerpc                  mpc834x_itx_defconfig    clang-24
powerpc                       ppc6xx_defconfig    gcc-16.1.0
powerpc                      rainier_defconfig    clang-24
powerpc               randconfig-1000-20260928    clang-24
powerpc               randconfig-1000-20260929    gcc-8.5.0
powerpc               randconfig-1001-20260928    clang-24
powerpc               randconfig-1001-20260929    gcc-8.5.0
powerpc              randconfig-r2107-20260927    clang-18   cocci
powerpc              randconfig-r2201-20260927    clang-24   smatch
powerpc                      redwood_defconfig    gcc-16.1.0
powerpc                          wii_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260928    clang-24
powerpc64             randconfig-1000-20260929    gcc-8.5.0
powerpc64             randconfig-1001-20260928    clang-24
powerpc64             randconfig-1001-20260929    gcc-8.5.0
powerpc64            randconfig-r2103-20260927    gcc-11.5.0 cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260928    clang-24
riscv                 randconfig-1000-20260929    clang-24
riscv                 randconfig-1001-20260928    clang-24
riscv                 randconfig-1001-20260929    clang-24
riscv                 randconfig-2000-20260927    clang-24
riscv                 randconfig-2001-20260927    gcc-11.5.0
s390                              alldefconfig    gcc-16.1.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260928    clang-24
s390                  randconfig-1000-20260929    clang-24
s390                  randconfig-1001-20260928    clang-24
s390                  randconfig-1001-20260929    clang-24
s390                  randconfig-2000-20260927    clang-24
s390                  randconfig-2001-20260927    gcc-15.2.0
s390                        zfcpdump_defconfig    clang-24
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    clang-24
sh                         edosk7705_defconfig    gcc-16.1.0
sh                             hp6xx_defconfig    gcc-16.1.0
sh                           lboxre2_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260928    clang-24
sh                    randconfig-1000-20260929    clang-24
sh                    randconfig-1001-20260928    clang-24
sh                    randconfig-1001-20260929    clang-24
sh                    randconfig-2000-20260927    gcc-12.5.0
sh                    randconfig-2001-20260927    gcc-14.3.0
sh                   randconfig-r2105-20260927    gcc-10.5.0 cocci
sh                   randconfig-r2308-20260927    gcc-14.3.0 sparse
sh                    rts7751r2dplus_defconfig    gcc-16.1.0
sh                            se7206_defconfig    gcc-16.1.0
sh                            se7712_defconfig    gcc-16.1.0
sh                    sh7770_generic_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260928    clang-17
sparc                 randconfig-1001-20260928    clang-17
sparc                 randconfig-2000-20260927    gcc-16.1.0
sparc                 randconfig-2001-20260927    gcc-16.1.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260928    clang-17
sparc64               randconfig-1001-20260928    clang-17
sparc64               randconfig-2000-20260927    clang-24
sparc64               randconfig-2001-20260927    clang-20
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260928    clang-17
um                    randconfig-1001-20260928    clang-17
um                    randconfig-2000-20260927    gcc-14
um                    randconfig-2001-20260927    clang-22
um                   randconfig-r2104-20260927    gcc-14     cocci
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    gcc-16.1.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260928    gcc-14
x86_64      buildonly-randconfig-1001-20260928    gcc-14
x86_64      buildonly-randconfig-1002-20260928    gcc-14
x86_64      buildonly-randconfig-1003-20260928    gcc-14
x86_64      buildonly-randconfig-1004-20260928    gcc-14
x86_64      buildonly-randconfig-1005-20260928    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260928    gcc-14
x86_64                randconfig-1001-20260928    gcc-14
x86_64                randconfig-1002-20260928    gcc-14
x86_64                randconfig-1003-20260928    gcc-14
x86_64                randconfig-1004-20260928    gcc-14
x86_64                randconfig-1005-20260928    gcc-14
x86_64                randconfig-1006-20260928    gcc-14
x86_64                randconfig-1007-20260928    gcc-14
x86_64                randconfig-1008-20260928    gcc-14
x86_64                randconfig-1009-20260928    gcc-14
x86_64                randconfig-1010-20260928    gcc-14
x86_64                randconfig-1011-20260928    gcc-14
x86_64                randconfig-1012-20260928    clang-22
x86_64                randconfig-1013-20260928    clang-22
x86_64                randconfig-1014-20260928    clang-22
x86_64                randconfig-1015-20260928    clang-22
x86_64                randconfig-1016-20260928    clang-22
x86_64                randconfig-1017-20260928    clang-22
x86_64                randconfig-2100-20260927    clang-22   cocci
x86_64                randconfig-2101-20260927    clang-22   cocci
x86_64                randconfig-2102-20260927    gcc-14     cocci
x86_64                randconfig-2103-20260927    clang-22   cocci
x86_64                randconfig-2200-20260927    gcc-14     smatch
x86_64                randconfig-2300-20260927    gcc-14     sparse
x86_64                randconfig-2301-20260927    gcc-14     sparse
x86_64                randconfig-2302-20260927    gcc-13     sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20260928    clang-17
xtensa                randconfig-1001-20260928    clang-17
xtensa                randconfig-2000-20260927    gcc-8.5.0
xtensa                randconfig-2001-20260927    gcc-16.1.0
xtensa               randconfig-r2101-20260927    gcc-8.5.0  cocci

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
