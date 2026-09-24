Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3115233C198
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234444; cv=none; b=tlM0P9j0Q8OGmP1juOouBBNzwXwKOLjws3Gqd7VbQiL448/UqoxYLke59n+Lrtv9ld7fUNgJ8bIeD3N7lyxkj5qolUrXfkTV+FZqcKnxRLuiwFbnv3Dl0Tw9Xnl8EUutp36lYu8Yl5E7j5vc/7mlqdJzjKwhQBcMDmV74muqHYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234444; c=relaxed/simple;
	bh=syKkqyHC0EQE4cyeLCMiG9+iLPYq16MlR13uEynm0Js=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iUL3F76Hiu5gFhylaaHtbbG2Yg6j7zfdeVmC7r+048VOcHSGTzzxasMYjRjOUxSTQERyPboRfPZXfBKdPd3rEF2MFrI9yKRfM1VeFbrLv1X0+6rwjdoxO1ruJWkqW/MpKgnN3eYdhFlX6UdYUrT7tc/XjqbVE4m+Ta4wvdvTUxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRj6WwT3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRj6WwT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790234442; x=1821770442;
  h=date:from:to:cc:subject:message-id;
  bh=syKkqyHC0EQE4cyeLCMiG9+iLPYq16MlR13uEynm0Js=;
  b=cRj6WwT3VMtI9yCfE6+syDLW9UowWzP4+AOEFLyNpefA0lbvAYG4Z6UN
   OAqk6YdK8eEzraqpX4z2v/pVE/Owt0P038tXgoR7JTjmkkPETDWiCw1Bs
   eoRlvFU5rVo/ZpUGAAsPAVKP07gms4oYp5P5+V4e9rP+oNrVttGPIx4Ho
   xZl54ms1hg8RyMNHMbzRT/Q/aOGccLjpxvRDKhx9i5kk0HNYwBJKBLv73
   h+E0u94z5uiM/1Rox1/UTzJtSYwdoL7E/ep0vNsDsOBbqT7WbcJnzFW4o
   8pHDthmSFExOzeIjQ8cICKuHauPx5ygKGJb4weAOBw7N8ESzGkC06Gy9T
   g==;
X-CSE-ConnectionGUID: Efaqs9oOQxyWNBwtMDascw==
X-CSE-MsgGUID: 0pqyDKOcRE2NBldGRolEJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101652827"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="101652827"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 00:20:41 -0700
X-CSE-ConnectionGUID: l42Z0My5TKWlVtljf6mwpA==
X-CSE-MsgGUID: zqBJhn0JTDymRnPAPxh+7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="300212117"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Sep 2026 00:20:40 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9dkz-00000000IMM-379L;
	Thu, 24 Sep 2026 07:20:37 +0000
Date: Thu, 24 Sep 2026 15:19:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:cmpxchg2.2026.09.22a] BUILD REGRESSION
 54c282c15475ebfae4712fe3ab637c9d19c723d6
Message-ID: <202609241550.gIVMJW7c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git cmpxchg2.2026.09.22a
branch HEAD: 54c282c15475ebfae4712fe3ab637c9d19c723d6  xtensa: Emulate two-byte cmpxchg

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202609230743.rxxNILn7-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202609240539.AkulvjVe-lkp@intel.com

    arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_' [-Wunused-variable]
    arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_' [-Wunused-variable]
    arch/xtensa/include/asm/cmpxchg.h:88:58: error: pointer type mismatch in conditional expression [-Wincompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arc-randconfig-1001-20260924
|   |-- arch-arc-include-asm-cmpxchg.h:warning:unused-variable-_new_
|   `-- arch-arc-include-asm-cmpxchg.h:warning:unused-variable-_old_
`-- xtensa-randconfig-r2102-20260923
    `-- arch-xtensa-include-asm-cmpxchg.h:error:pointer-type-mismatch-in-conditional-expression

elapsed time: 2154m

configs tested: 250
configs skipped: 5

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20260923    gcc-8.5.0  cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260924    clang-24
arc                   randconfig-1001-20260924    clang-24
arc                  randconfig-r2101-20260923    gcc-8.5.0  cocci
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                       jornada720_defconfig    clang-24
arm                   randconfig-1000-20260924    clang-24
arm                   randconfig-1001-20260924    clang-24
arm                   randconfig-1002-20260924    clang-24
arm                   randconfig-1003-20260924    clang-24
arm                  randconfig-r2101-20260923    gcc-8.5.0  cocci
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260924    gcc-11.5.0
arm64                 randconfig-1001-20260924    gcc-11.5.0
arm64                 randconfig-1002-20260924    gcc-11.5.0
arm64                 randconfig-1003-20260924    gcc-11.5.0
arm64                randconfig-r1302-20260924    gcc-12.5.0 sparse
arm64                randconfig-r2106-20260923    gcc-15.2.0 cocci
arm64                randconfig-r2201-20260923    clang-24   smatch
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260924    gcc-11.5.0
csky                  randconfig-1001-20260924    gcc-11.5.0
csky                 randconfig-r1306-20260924    gcc-14     sparse
csky                 randconfig-r1309-20260924    gcc-14     sparse
csky                 randconfig-r2107-20260923    gcc-15.2.0 cocci
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260924    gcc-8.5.0
hexagon               randconfig-1001-20260924    gcc-8.5.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260924    gcc-14
i386        buildonly-randconfig-1001-20260924    gcc-14
i386        buildonly-randconfig-1002-20260924    gcc-14
i386        buildonly-randconfig-1003-20260924    gcc-14
i386        buildonly-randconfig-1004-20260924    gcc-14
i386        buildonly-randconfig-1005-20260924    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260924    gcc-12
i386                  randconfig-1001-20260924    gcc-12
i386                  randconfig-1002-20260924    gcc-12
i386                  randconfig-1003-20260924    gcc-12
i386                  randconfig-1004-20260924    gcc-12
i386                  randconfig-1005-20260924    gcc-12
i386                  randconfig-1006-20260924    gcc-12
i386                  randconfig-1007-20260924    clang-22
i386                  randconfig-1008-20260924    clang-22
i386                  randconfig-1009-20260924    clang-22
i386                  randconfig-1010-20260924    clang-22
i386                  randconfig-1011-20260924    clang-22
i386                  randconfig-1012-20260924    clang-22
i386                  randconfig-1013-20260924    clang-22
i386                  randconfig-1300-20260924    clang-22   sparse
i386                  randconfig-1301-20260924    clang-22   sparse
i386                  randconfig-1302-20260924    clang-22   sparse
i386                  randconfig-2100-20260923    clang-22   cocci
i386                  randconfig-2100-20260923    gcc-14     cocci
i386                  randconfig-2101-20260923    clang-22   cocci
i386                  randconfig-2102-20260923    clang-22   cocci
i386                  randconfig-2103-20260923    clang-22   cocci
i386                  randconfig-2103-20260923    gcc-14     cocci
i386                  randconfig-2200-20260923    gcc-12     smatch
i386                 randconfig-r1307-20260924    gcc-14     sparse
i386                 randconfig-r2100-20260923    gcc-8.5.0  cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260924    gcc-8.5.0
loongarch             randconfig-1001-20260924    gcc-8.5.0
loongarch            randconfig-r1308-20260924    gcc-14     sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                 randconfig-r2103-20260923    gcc-8.5.0  cocci
m68k                 randconfig-r2201-20260923    gcc-11.5.0 smatch
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2200-20260923    gcc-9.5.0  smatch
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                          cobalt_defconfig    clang-24
mips                            ip28_defconfig    clang-24
mips                 randconfig-r2104-20260923    gcc-15.2.0 cocci
mips                 randconfig-r2202-20260923    gcc-8.5.0  smatch
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260924    gcc-8.5.0
nios2                 randconfig-1001-20260924    gcc-8.5.0
nios2                randconfig-r2103-20260923    gcc-11.5.0 cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2106-20260923    gcc-16.1.0 cocci
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260924    gcc-8.5.0
parisc                randconfig-1001-20260924    gcc-8.5.0
parisc               randconfig-r2100-20260923    gcc-8.5.0  cocci
parisc               randconfig-r2103-20260923    gcc-14     cocci
parisc               randconfig-r2202-20260923    gcc-12.5.0 smatch
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc               randconfig-1000-20260924    gcc-8.5.0
powerpc               randconfig-1001-20260924    gcc-8.5.0
powerpc                         warp_defconfig    clang-24
powerpc64             randconfig-1000-20260924    gcc-8.5.0
powerpc64             randconfig-1001-20260924    gcc-8.5.0
powerpc64            randconfig-r2105-20260923    gcc-15.2.0 cocci
riscv                             alldefconfig    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260924    gcc-15.2.0
riscv                 randconfig-1001-20260924    gcc-15.2.0
riscv                 randconfig-2000-20260923    gcc-9.5.0
riscv                 randconfig-2001-20260923    gcc-8.5.0
riscv                 randconfig-2001-20260923    gcc-9.5.0
riscv                randconfig-r1300-20260924    gcc-12.5.0 sparse
riscv                randconfig-r1305-20260924    gcc-12.5.0 sparse
riscv                randconfig-r2107-20260923    gcc-16.1.0 cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    clang-24
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260924    gcc-15.2.0
s390                  randconfig-1001-20260924    gcc-15.2.0
s390                  randconfig-2000-20260923    clang-17
s390                  randconfig-2000-20260923    gcc-9.5.0
s390                  randconfig-2001-20260923    clang-24
s390                  randconfig-2001-20260923    gcc-9.5.0
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           r7780mp_defconfig    clang-24
sh                    randconfig-1000-20260924    gcc-15.2.0
sh                    randconfig-1001-20260924    gcc-15.2.0
sh                    randconfig-2000-20260923    gcc-12.5.0
sh                    randconfig-2000-20260923    gcc-9.5.0
sh                    randconfig-2001-20260923    gcc-14.3.0
sh                    randconfig-2001-20260923    gcc-9.5.0
sh                   randconfig-r2104-20260923    gcc-16.1.0 cocci
sh                            se7724_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260924    clang-17
sparc                 randconfig-1001-20260924    clang-17
sparc                 randconfig-2000-20260923    gcc-14.3.0
sparc                 randconfig-2001-20260923    gcc-14.3.0
sparc                randconfig-r1301-20260924    gcc-12.5.0 sparse
sparc                randconfig-r1303-20260924    gcc-12.5.0 sparse
sparc                randconfig-r2105-20260923    gcc-16.1.0 cocci
sparc                randconfig-r2200-20260923    gcc-8.5.0  smatch
sparc                randconfig-r2201-20260923    gcc-11.5.0 smatch
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260924    clang-17
sparc64               randconfig-1001-20260924    clang-17
sparc64               randconfig-2000-20260923    gcc-14.3.0
sparc64               randconfig-2001-20260923    gcc-14.3.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260924    clang-17
um                    randconfig-1001-20260924    clang-17
um                    randconfig-2000-20260923    gcc-14.3.0
um                    randconfig-2001-20260923    gcc-14.3.0
um                   randconfig-r1304-20260924    gcc-12.5.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20260924    clang-22
x86_64      buildonly-randconfig-1001-20260924    clang-22
x86_64      buildonly-randconfig-1002-20260924    clang-22
x86_64      buildonly-randconfig-1003-20260924    clang-22
x86_64      buildonly-randconfig-1004-20260924    clang-22
x86_64      buildonly-randconfig-1005-20260924    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260924    clang-22
x86_64                randconfig-1001-20260924    clang-22
x86_64                randconfig-1002-20260924    clang-22
x86_64                randconfig-1003-20260924    clang-22
x86_64                randconfig-1004-20260924    clang-22
x86_64                randconfig-1005-20260924    clang-22
x86_64                randconfig-1006-20260924    clang-22
x86_64                randconfig-1007-20260924    clang-22
x86_64                randconfig-1008-20260924    clang-22
x86_64                randconfig-1009-20260924    clang-22
x86_64                randconfig-1010-20260924    clang-22
x86_64                randconfig-1011-20260924    clang-22
x86_64                randconfig-1012-20260924    clang-22
x86_64                randconfig-1013-20260924    clang-22
x86_64                randconfig-1014-20260924    clang-22
x86_64                randconfig-1015-20260924    clang-22
x86_64                randconfig-1016-20260924    clang-22
x86_64                randconfig-1017-20260924    clang-22
x86_64                randconfig-1300-20260924    clang-22   sparse
x86_64                randconfig-1301-20260924    clang-22   sparse
x86_64                randconfig-1302-20260924    clang-22   sparse
x86_64                randconfig-2100-20260923    clang-22   cocci
x86_64                randconfig-2101-20260923    clang-22   cocci
x86_64                randconfig-2102-20260923    clang-22   cocci
x86_64                randconfig-2103-20260923    clang-22   cocci
x86_64                randconfig-2200-20260923    gcc-14     smatch
x86_64               randconfig-r2100-20260923    gcc-14     cocci
x86_64               randconfig-r2101-20260923    gcc-14     cocci
x86_64               randconfig-r2102-20260923    gcc-14     cocci
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
xtensa                randconfig-1000-20260924    clang-17
xtensa                randconfig-1001-20260924    clang-17
xtensa                randconfig-2000-20260923    gcc-14.3.0
xtensa                randconfig-2001-20260923    gcc-14.3.0
xtensa               randconfig-r2102-20260923    gcc-15.2.0 cocci

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
