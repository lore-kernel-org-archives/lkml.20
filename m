Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DED451071
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931526; cv=none; b=U0Nff9DAlk6av+W69hK5XwRO8i4v9N7Gdi2r/qPWoo/9CsyX1dNrurFtLoNDEU/ZQHlsElWPacg+ga1FuKaa9Slnhs9isV9h/5M9FKbKJBozAdtiMFZiBIla3OkfuVKZAAoVqzrwm9S8pkOuqDc17zT8hIZ8iPNb3NFfj1Ewp3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931526; c=relaxed/simple;
	bh=tRo2eRCOI3ZEc8XSazV4JtjK9tViDEuWPcmVM6/d7RE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mok0qZuk2Xf1y5+/FjB0NmpFRypQfJ8ZFjWbtAqvWtd0e5SuYeXvWLrNGbcMuvhRGrIVG2/inAFp1U+US6virBdNdPduJLxvy4wbOBwQhOEFllGWtse4Cu3NqD/KkSem46M2FPF4JYHeUm4TQ8dncNzbsY5iki9L3Tgy/bPAkI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLrWKPN7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLrWKPN7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790931524; x=1822467524;
  h=date:from:to:cc:subject:message-id;
  bh=tRo2eRCOI3ZEc8XSazV4JtjK9tViDEuWPcmVM6/d7RE=;
  b=DLrWKPN7Iq/Jp2L1lAKsZR5344bTUFUQBnT5u4wq49SZV8sDA6tPp34b
   JC/IOYHDhHMUqmifD+qdjcKXrKfIwK9bjanMZseyG6whZU0fwMK68owhJ
   8eSqeDdPprEh5I77s6STq1dHs9oQjpcgHpRIVwHQ+oDn7EryBXBy3PP7S
   P4knx221CQ63/8qLEokqqn3THzGAuTBoi9lC8o11t8zQQzVMREX194rnz
   4n4lrtfOXOh1lEpHMd1k7Zg30d8ii7/sgvE6hLgJla1oNvvF//gwY4Wyo
   JD0aNdH0JRXCxSaNfWQ0vTB3QfdRwbmZY0/bI6FFtbK7+5ubJN8iyz+/D
   Q==;
X-CSE-ConnectionGUID: rYPfww8xTn+GqSEqmETilA==
X-CSE-MsgGUID: 6YCoeO4gQDqPNoITV6VUUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94184772"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="94184772"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:58:43 -0700
X-CSE-ConnectionGUID: pyfwTU1eRYysrGs8vFWrhg==
X-CSE-MsgGUID: b8GLpEIBRBaGAWWK52Eyjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="302459484"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Oct 2026 01:58:42 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCZ6G-00000000SqE-0ey9;
	Fri, 02 Oct 2026 08:58:40 +0000
Date: Fri, 02 Oct 2026 16:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:cleanups] BUILD SUCCESS
 2c6a75adb15f8fbeb7a8cc6b1f35beb21db20762
Message-ID: <202610021602.Fz3YbVWT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cleanups
branch HEAD: 2c6a75adb15f8fbeb7a8cc6b1f35beb21db20762  x86/um: Remove unused <asm/required-features.h> header

elapsed time: 1074m

configs tested: 283
configs skipped: 128

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20260930    gcc-9.5.0  cocci
alpha                randconfig-r2103-20260930    gcc-9.5.0  cocci
alpha                randconfig-r2201-20260930    gcc-8.5.0  smatch
alpha                randconfig-r2301-20260930    clang-17   sparse
alpha                randconfig-r2307-20260930    gcc-10.5.0 sparse
alpha                randconfig-r2308-20260930    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261002    clang-17
arc                   randconfig-1001-20261002    clang-17
arc                  randconfig-r2202-20260930    gcc-16.1.0 smatch
arc                  randconfig-r2303-20260930    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             dove_defconfig    gcc-16.1.0
arm                       integrator_defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261002    clang-17
arm                   randconfig-1001-20261002    clang-17
arm                   randconfig-1002-20261002    clang-17
arm                   randconfig-1003-20261002    clang-17
arm                  randconfig-r2200-20260930    clang-17   smatch
arm                  randconfig-r2300-20260930    clang-17   sparse
arm                          s3c6400_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261002    gcc-12.5.0
arm64                 randconfig-1001-20261002    gcc-12.5.0
arm64                 randconfig-1002-20261002    gcc-12.5.0
arm64                 randconfig-1003-20261002    gcc-12.5.0
arm64                randconfig-r2104-20260930    gcc-16.1.0 cocci
arm64                randconfig-r2200-20260930    gcc-12.5.0 smatch
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261002    gcc-12.5.0
csky                  randconfig-1001-20261002    gcc-12.5.0
csky                 randconfig-r2104-20260930    clang-24   cocci
csky                 randconfig-r2106-20260930    gcc-16.1.0 cocci
csky                 randconfig-r2200-20260930    gcc-14.3.0 smatch
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261002    gcc-13.4.0
hexagon               randconfig-1001-20261002    gcc-13.4.0
hexagon              randconfig-r2106-20260930    clang-24   cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261002    clang-22
i386        buildonly-randconfig-1001-20261002    clang-22
i386        buildonly-randconfig-1002-20261002    clang-22
i386        buildonly-randconfig-1003-20261002    clang-22
i386        buildonly-randconfig-1004-20261002    clang-22
i386        buildonly-randconfig-1005-20261002    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261002    gcc-14
i386                  randconfig-1001-20261002    gcc-14
i386                  randconfig-1002-20261002    gcc-14
i386                  randconfig-1003-20261002    gcc-14
i386                  randconfig-1004-20261002    gcc-14
i386                  randconfig-1005-20261002    gcc-14
i386                  randconfig-1006-20261002    gcc-14
i386                  randconfig-1007-20261002    clang-22
i386                  randconfig-1008-20261002    clang-22
i386                  randconfig-1009-20261002    clang-22
i386                  randconfig-1010-20261002    clang-22
i386                  randconfig-1011-20261002    clang-22
i386                  randconfig-1012-20261002    clang-22
i386                  randconfig-1013-20261002    clang-22
i386                  randconfig-2100-20260930    clang-22   cocci
i386                  randconfig-2101-20260930    clang-22   cocci
i386                  randconfig-2102-20260930    clang-22   cocci
i386                  randconfig-2103-20260930    clang-22   cocci
i386                  randconfig-2200-20260930    gcc-14     smatch
i386                  randconfig-2300-20260930    gcc-13     sparse
i386                  randconfig-2301-20260930    gcc-13     sparse
i386                  randconfig-2302-20260930    gcc-13     sparse
i386                 randconfig-r2100-20260930    clang-17   cocci
i386                 randconfig-r2304-20260930    gcc-8.5.0  sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261002    gcc-13.4.0
loongarch             randconfig-1001-20261002    gcc-13.4.0
loongarch            randconfig-r2300-20260930    gcc-8.5.0  sparse
loongarch            randconfig-r2303-20260930    gcc-8.5.0  sparse
loongarch            randconfig-r2308-20260930    gcc-10.5.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5272c3_defconfig    gcc-16.1.0
m68k                        m5275evb_defconfig    gcc-16.1.0
m68k                       m54418evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2202-20260930    gcc-15.2.0 smatch
m68k                 randconfig-r2308-20260930    gcc-8.5.0  sparse
m68k                 randconfig-r2309-20260930    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2107-20260930    gcc-16.1.0 cocci
microblaze           randconfig-r2304-20260930    clang-17   sparse
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
mips                            ip28_defconfig    gcc-16.1.0
mips                         maltaup_defconfig    gcc-16.1.0
mips                     maltaup_xpa_defconfig    gcc-16.1.0
mips                            mtx1_defconfig    gcc-16.1.0
mips                 randconfig-r2102-20260930    clang-17   cocci
mips                 randconfig-r2103-20260930    clang-17   cocci
mips                 randconfig-r2303-20260930    clang-17   sparse
mips                 randconfig-r2309-20260930    gcc-10.5.0 sparse
nios2                          3c120_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261002    gcc-13.4.0
nios2                 randconfig-1001-20261002    gcc-13.4.0
nios2                randconfig-r2309-20260930    gcc-8.5.0  sparse
openrisc                          alldefconfig    gcc-16.1.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20260930    gcc-9.5.0  cocci
openrisc             randconfig-r2102-20260930    gcc-9.5.0  cocci
openrisc             randconfig-r2104-20260930    gcc-9.5.0  cocci
openrisc             randconfig-r2301-20260930    gcc-8.5.0  sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261002    gcc-14.3.0
parisc                randconfig-1001-20261002    gcc-14.3.0
parisc               randconfig-r2105-20260930    gcc-9.5.0  cocci
parisc               randconfig-r2106-20260930    gcc-9.5.0  cocci
parisc               randconfig-r2300-20260930    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.1.0
powerpc                       katmai_defconfig    gcc-16.1.0
powerpc                       pcm030_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261002    gcc-14.3.0
powerpc               randconfig-1001-20261002    gcc-14.3.0
powerpc              randconfig-r2101-20260930    clang-17   cocci
powerpc              randconfig-r2305-20260930    gcc-8.5.0  sparse
powerpc              randconfig-r2306-20260930    gcc-10.5.0 sparse
powerpc              randconfig-r2306-20260930    gcc-8.5.0  sparse
powerpc64             randconfig-1000-20261002    gcc-14.3.0
powerpc64             randconfig-1001-20261002    gcc-14.3.0
powerpc64            randconfig-r2100-20260930    clang-20   cocci
powerpc64            randconfig-r2304-20260930    gcc-8.5.0  sparse
powerpc64            randconfig-r2307-20260930    gcc-8.5.0  sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261002    clang-24
riscv                 randconfig-1001-20261002    clang-24
riscv                 randconfig-2000-20260930    gcc-14.3.0
riscv                 randconfig-2001-20260930    gcc-14.3.0
riscv                randconfig-r2103-20260930    clang-20   cocci
riscv                randconfig-r2201-20260930    clang-17   smatch
riscv                randconfig-r2305-20260930    clang-17   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261002    clang-24
s390                  randconfig-1001-20261002    clang-24
s390                  randconfig-2000-20260930    gcc-14.3.0
s390                  randconfig-2001-20260930    gcc-14.3.0
s390                 randconfig-r2101-20260930    clang-20   cocci
s390                 randconfig-r2105-20260930    clang-24   cocci
s390                 randconfig-r2105-20260930    gcc-16.1.0 cocci
s390                 randconfig-r2107-20260930    clang-24   cocci
s390                 randconfig-r2202-20260930    clang-18   smatch
s390                 randconfig-r2306-20260930    gcc-8.5.0  sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          apsh4a3a_defconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261002    clang-24
sh                    randconfig-1001-20261002    clang-24
sh                    randconfig-2000-20260930    gcc-14.3.0
sh                    randconfig-2001-20260930    gcc-14.3.0
sh                   randconfig-r2302-20260930    clang-17   sparse
sh                   randconfig-r2302-20260930    gcc-8.5.0  sparse
sh                           sdk7780_defconfig    gcc-16.1.0
sh                            se7780_defconfig    gcc-16.1.0
sh                             shmin_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261002    clang-24
sparc                 randconfig-1001-20261002    clang-24
sparc                 randconfig-2000-20260930    gcc-10.5.0
sparc                 randconfig-2001-20260930    gcc-10.5.0
sparc                randconfig-r2102-20260930    clang-20   cocci
sparc                randconfig-r2301-20260930    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261002    clang-24
sparc64               randconfig-1001-20261002    clang-24
sparc64               randconfig-2000-20260930    gcc-10.5.0
sparc64               randconfig-2001-20260930    gcc-10.5.0
sparc64              randconfig-r2107-20260930    gcc-9.5.0  cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261002    clang-24
um                    randconfig-1001-20261002    clang-24
um                    randconfig-2000-20260930    gcc-10.5.0
um                    randconfig-2001-20260930    gcc-10.5.0
um                   randconfig-r2302-20260930    gcc-8.5.0  sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261002    gcc-14
x86_64      buildonly-randconfig-1001-20261002    gcc-14
x86_64      buildonly-randconfig-1002-20261002    gcc-14
x86_64      buildonly-randconfig-1003-20261002    gcc-14
x86_64      buildonly-randconfig-1004-20261002    gcc-14
x86_64      buildonly-randconfig-1005-20261002    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261002    gcc-14
x86_64                randconfig-1001-20261002    gcc-14
x86_64                randconfig-1002-20261002    gcc-14
x86_64                randconfig-1003-20261002    gcc-14
x86_64                randconfig-1004-20261002    gcc-14
x86_64                randconfig-1005-20261002    gcc-14
x86_64                randconfig-1006-20261002    clang-22
x86_64                randconfig-1007-20261002    clang-22
x86_64                randconfig-1008-20261002    clang-22
x86_64                randconfig-1009-20261002    clang-22
x86_64                randconfig-1010-20261002    clang-22
x86_64                randconfig-1011-20261002    clang-22
x86_64                randconfig-1012-20261002    clang-22
x86_64                randconfig-1013-20261002    clang-22
x86_64                randconfig-1014-20261002    clang-22
x86_64                randconfig-1015-20261002    clang-22
x86_64                randconfig-1016-20261002    clang-22
x86_64                randconfig-1017-20261002    clang-22
x86_64                randconfig-2100-20260930    clang-22   cocci
x86_64                randconfig-2101-20260930    clang-22   cocci
x86_64                randconfig-2102-20260930    clang-22   cocci
x86_64                randconfig-2103-20260930    clang-22   cocci
x86_64                randconfig-2200-20260930    gcc-14     smatch
x86_64                randconfig-2300-20260930    gcc-13     sparse
x86_64                randconfig-2301-20260930    gcc-13     sparse
x86_64                randconfig-2302-20260930    gcc-13     sparse
x86_64               randconfig-r2305-20260930    gcc-8.5.0  sparse
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
xtensa                randconfig-1000-20261002    clang-24
xtensa                randconfig-1001-20261002    clang-24
xtensa                randconfig-2000-20260930    gcc-10.5.0
xtensa                randconfig-2001-20260930    gcc-10.5.0
xtensa               randconfig-r2201-20260930    gcc-10.5.0 smatch
xtensa               randconfig-r2307-20260930    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
