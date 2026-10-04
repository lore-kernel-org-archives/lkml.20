Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3BD42A178
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791115814; cv=none; b=sTNGhbATFwiY7vyH/Q7ALKHb9LngSkSX42dVzodjkOnVBSTq39yV701qr0A8rWbiFZgkt9+Sh+1p+fLzr+HsFi5v/eBLxn0TXYgp5TlFiDsmD2SNTeR85gLPLn1UevJIStzwY9Xa1HmHYoyB2I4OUoEh/c5R5/H7AyOQTqKoTp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791115814; c=relaxed/simple;
	bh=UevHM3l/DOgHVgaQ9LcOSeM6RnNaAVhBKaACfaah8cI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CCeJ7pMm2kJl+onFPNKvbfM1jYOFvanYytagsfsz8hTsTp2rAIA106wX9RNw8f6jtVDuJClzNttgL5FrYPbN7e2NKe5nnBUPovEkwLUeJCwA3KqZn03N2WnVo66gMmgZESaVHzxUUaROHgdmqRxM4iYDYJisM554G4lDQct1nGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7AFBTdj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7AFBTdj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791115810; x=1822651810;
  h=date:from:to:cc:subject:message-id;
  bh=UevHM3l/DOgHVgaQ9LcOSeM6RnNaAVhBKaACfaah8cI=;
  b=G7AFBTdjU2HWztnaJbtMGzp3d/sbFQUFBFZVLC6yn5P4kpSnpB5YFzsH
   BepbKm+iITJldEy2o6wSqKd6NwMOwBv8DiANx28QJ2ld0YSn2BxKUFi/h
   Aydzwdo8sgxAZuGhY0QK4Fb2sO3OBjayE9rVqMTayD3NUWjhdFGw3J244
   0Mf1kuVtE+22hKTpnFCaDRizXgJ1ut6tfSYop528rwgI/SUDYjefEDDyQ
   BAlzQH9wCZdwtznEGmWdcAf2pbxqwpuJzr2f+gcc476aE1DFAP3+fIO0I
   pZKn8RtgFirwd6SH5PnwpYpQdTbUq1W6aoO6pB/fr1NIW3ZMaRPI9W2Xh
   Q==;
X-CSE-ConnectionGUID: Dwbur3kSQNqUhKT8UUqFRA==
X-CSE-MsgGUID: FIlkKAxxTBO2MiLNJVo4+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="95621208"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="95621208"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 05:10:09 -0700
X-CSE-ConnectionGUID: Pbd7E4K2QS6/OXCj6N8d1w==
X-CSE-MsgGUID: OqsbhyM+Tq+ZQLbPDvFZPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="678110"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 04 Oct 2026 05:10:07 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDL2b-00000000UjJ-27AA;
	Sun, 04 Oct 2026 12:10:05 +0000
Date: Sun, 04 Oct 2026 20:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:tdx] BUILD SUCCESS
 5b8212d45d99b77c84e3ad305a295e9e65d5ef20
Message-ID: <202610042025.M1OWe0l4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/tdx
branch HEAD: 5b8212d45d99b77c84e3ad305a295e9e65d5ef20  virt: tdx-guest: Make the Quote buffer size dynamic

elapsed time: 1833m

configs tested: 312
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2303-20261003    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261004    clang-22
arc                   randconfig-1001-20261004    clang-22
arc                  randconfig-r2105-20261003    gcc-8.5.0  cocci
arc                  randconfig-r2106-20261003    gcc-8.5.0  cocci
arc                  randconfig-r2200-20261003    gcc-12.5.0 smatch
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    clang-21
arm                                  defconfig    gcc-16.1.0
arm                          orion5x_defconfig    clang-21
arm                             qcom_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261004    clang-22
arm                   randconfig-1001-20261004    clang-22
arm                   randconfig-1002-20261004    clang-22
arm                   randconfig-1003-20261004    clang-22
arm                  randconfig-r2202-20261002    clang-24   smatch
arm                  randconfig-r2301-20261003    gcc-8.5.0  sparse
arm                          s3c6400_defconfig    clang-21
arm                          s3c6400_defconfig    gcc-16.1.0
arm                     vt8500_v6_v7_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261004    gcc-16.1.0
arm64                 randconfig-1001-20261004    gcc-16.1.0
arm64                 randconfig-1002-20261004    gcc-16.1.0
arm64                 randconfig-1003-20261004    gcc-16.1.0
arm64                randconfig-r2106-20261003    clang-19   cocci
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261004    gcc-16.1.0
csky                  randconfig-1001-20261004    gcc-16.1.0
csky                 randconfig-r2303-20261003    gcc-16.1.0 sparse
hexagon                           alldefconfig    clang-21
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261004    gcc-16.1.0
hexagon               randconfig-1001-20261004    gcc-16.1.0
hexagon              randconfig-r2100-20261003    gcc-8.5.0  cocci
hexagon              randconfig-r2105-20261003    clang-19   cocci
hexagon              randconfig-r2107-20261003    clang-19   cocci
hexagon              randconfig-r2307-20261003    gcc-16.1.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261004    clang-22
i386        buildonly-randconfig-1001-20261004    clang-22
i386        buildonly-randconfig-1002-20261004    clang-22
i386        buildonly-randconfig-1003-20261004    clang-22
i386        buildonly-randconfig-1004-20261004    clang-22
i386        buildonly-randconfig-1005-20261004    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261004    gcc-14
i386                  randconfig-1001-20261004    gcc-14
i386                  randconfig-1002-20261004    gcc-14
i386                  randconfig-1003-20261004    gcc-14
i386                  randconfig-1004-20261004    gcc-14
i386                  randconfig-1005-20261004    gcc-14
i386                  randconfig-1006-20261004    gcc-14
i386                  randconfig-1007-20261004    clang-22
i386                  randconfig-1008-20261004    clang-22
i386                  randconfig-1009-20261004    clang-22
i386                  randconfig-1010-20261004    clang-22
i386                  randconfig-1011-20261004    clang-22
i386                  randconfig-1012-20261004    clang-22
i386                  randconfig-1013-20261004    clang-22
i386                  randconfig-2100-20261002    gcc-14     cocci
i386                  randconfig-2100-20261003    gcc-14     cocci
i386                  randconfig-2101-20261002    clang-22   cocci
i386                  randconfig-2101-20261003    gcc-14     cocci
i386                  randconfig-2102-20261002    gcc-14     cocci
i386                  randconfig-2102-20261003    gcc-14     cocci
i386                  randconfig-2103-20261002    gcc-14     cocci
i386                  randconfig-2103-20261003    gcc-14     cocci
i386                  randconfig-2200-20261003    gcc-14     smatch
i386                  randconfig-2300-20261002    clang-22   sparse
i386                  randconfig-2300-20261003    clang-22   sparse
i386                  randconfig-2301-20261002    gcc-14     sparse
i386                  randconfig-2301-20261003    clang-22   sparse
i386                  randconfig-2301-20261003    gcc-14     sparse
i386                  randconfig-2302-20261002    gcc-14     sparse
i386                  randconfig-2302-20261003    clang-22   sparse
i386                  randconfig-2302-20261003    gcc-14     sparse
i386                 randconfig-r2302-20261003    gcc-16.1.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261004    gcc-16.1.0
loongarch             randconfig-1001-20261004    gcc-16.1.0
loongarch            randconfig-r2102-20261003    gcc-16.1.0 cocci
loongarch            randconfig-r2105-20261002    gcc-16.1.0 cocci
loongarch            randconfig-r2300-20261003    gcc-16.1.0 sparse
loongarch            randconfig-r2302-20261003    clang-24   sparse
loongarch            randconfig-r2307-20261002    clang-18   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                          apollo_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                 randconfig-r2200-20261002    gcc-14.3.0 smatch
m68k                 randconfig-r2306-20261003    gcc-16.1.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2201-20261003    gcc-13.4.0 smatch
microblaze           randconfig-r2301-20261003    gcc-16.1.0 sparse
microblaze           randconfig-r2301-20261003    gcc-8.5.0  sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                 randconfig-r2102-20261003    gcc-8.5.0  cocci
mips                 randconfig-r2104-20261002    clang-17   cocci
mips                 randconfig-r2107-20261002    gcc-8.5.0  cocci
mips                 randconfig-r2107-20261003    gcc-8.5.0  cocci
mips                 randconfig-r2309-20261003    gcc-16.1.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261004    gcc-16.1.0
nios2                 randconfig-1001-20261004    gcc-16.1.0
nios2                randconfig-r2304-20261003    gcc-8.5.0  sparse
nios2                randconfig-r2305-20261003    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2300-20261003    gcc-8.5.0  sparse
openrisc             randconfig-r2302-20261003    gcc-16.1.0 sparse
openrisc             randconfig-r2307-20261003    gcc-14     sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261004    gcc-12.5.0
parisc                randconfig-1001-20261004    gcc-12.5.0
parisc               randconfig-r2101-20261003    gcc-8.5.0  cocci
parisc               randconfig-r2104-20261003    gcc-8.5.0  cocci
parisc               randconfig-r2201-20261002    gcc-9.5.0  smatch
parisc               randconfig-r2202-20261003    gcc-14.3.0 smatch
parisc               randconfig-r2304-20261003    gcc-8.5.0  sparse
parisc               randconfig-r2305-20261003    gcc-8.5.0  sparse
parisc               randconfig-r2308-20261003    gcc-14     sparse
parisc               randconfig-r2309-20261002    gcc-10.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                      kmeter1_defconfig    gcc-16.1.0
powerpc                      mpc512x_defconfig    clang-21
powerpc               randconfig-1000-20261004    gcc-12.5.0
powerpc               randconfig-1001-20261004    gcc-12.5.0
powerpc              randconfig-r2106-20261002    clang-21   cocci
powerpc              randconfig-r2303-20261003    clang-20   sparse
powerpc64             randconfig-1000-20261004    gcc-12.5.0
powerpc64             randconfig-1001-20261004    gcc-12.5.0
powerpc64            randconfig-r2305-20261003    clang-17   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261004    gcc-11.5.0
riscv                 randconfig-1001-20261004    gcc-11.5.0
riscv                 randconfig-2000-20261003    clang-17
riscv                 randconfig-2000-20261003    gcc-16.1.0
riscv                 randconfig-2001-20261003    gcc-16.1.0
riscv                 randconfig-2001-20261003    gcc-9.5.0
riscv                randconfig-r2100-20261003    clang-17   cocci
riscv                randconfig-r2201-20261003    clang-24   smatch
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261004    gcc-11.5.0
s390                  randconfig-1001-20261004    gcc-11.5.0
s390                  randconfig-2000-20261003    clang-24
s390                  randconfig-2000-20261003    gcc-16.1.0
s390                  randconfig-2001-20261003    gcc-13.4.0
s390                  randconfig-2001-20261003    gcc-16.1.0
s390                 randconfig-r2103-20261003    gcc-8.5.0  cocci
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                                j2_defconfig    clang-21
sh                    randconfig-1000-20261004    gcc-11.5.0
sh                    randconfig-1001-20261004    gcc-11.5.0
sh                    randconfig-2000-20261003    gcc-16.1.0
sh                    randconfig-2001-20261003    gcc-16.1.0
sh                   randconfig-r2101-20261003    gcc-8.5.0  cocci
sh                   randconfig-r2306-20261003    gcc-14     sparse
sh                           sdk7786_defconfig    clang-21
sh                         sh7785lcr_defconfig    gcc-16.1.0
sparc                             alldefconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261004    gcc-14
sparc                 randconfig-1001-20261004    gcc-14
sparc                 randconfig-2000-20261002    gcc-15.2.0
sparc                 randconfig-2000-20261003    gcc-14
sparc                 randconfig-2001-20261002    gcc-8.5.0
sparc                 randconfig-2001-20261003    gcc-14
sparc                randconfig-r2103-20261003    gcc-12.5.0 cocci
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261004    gcc-14
sparc64               randconfig-1001-20261004    gcc-14
sparc64               randconfig-2000-20261002    gcc-8.5.0
sparc64               randconfig-2000-20261003    gcc-14
sparc64               randconfig-2001-20261002    clang-24
sparc64               randconfig-2001-20261003    gcc-14
sparc64              randconfig-r2100-20261003    gcc-8.5.0  cocci
sparc64              randconfig-r2300-20261003    gcc-13.4.0 sparse
sparc64              randconfig-r2302-20261003    gcc-8.5.0  sparse
sparc64              randconfig-r2303-20261003    gcc-11.5.0 sparse
sparc64              randconfig-r2304-20261003    gcc-16.1.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261004    gcc-14
um                    randconfig-1001-20261004    gcc-14
um                    randconfig-2000-20261002    clang-24
um                    randconfig-2000-20261003    gcc-14
um                    randconfig-2001-20261002    clang-24
um                    randconfig-2001-20261003    gcc-14
um                   randconfig-r2102-20261003    gcc-8.5.0  cocci
um                   randconfig-r2104-20261003    clang-19   cocci
um                   randconfig-r2308-20261002    clang-17   sparse
um                   randconfig-r2308-20261003    gcc-16.1.0 sparse
um                   randconfig-r2309-20261003    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261004    gcc-14
x86_64      buildonly-randconfig-1001-20261004    gcc-14
x86_64      buildonly-randconfig-1002-20261004    gcc-14
x86_64      buildonly-randconfig-1003-20261004    gcc-14
x86_64      buildonly-randconfig-1004-20261004    gcc-14
x86_64      buildonly-randconfig-1005-20261004    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261004    gcc-14
x86_64                randconfig-1001-20261004    gcc-14
x86_64                randconfig-1002-20261004    gcc-14
x86_64                randconfig-1003-20261004    gcc-14
x86_64                randconfig-1004-20261004    gcc-14
x86_64                randconfig-1005-20261004    gcc-14
x86_64                randconfig-1006-20261004    clang-22
x86_64                randconfig-1007-20261004    clang-22
x86_64                randconfig-1008-20261004    clang-22
x86_64                randconfig-1009-20261004    clang-22
x86_64                randconfig-1010-20261004    clang-22
x86_64                randconfig-1011-20261004    clang-22
x86_64                randconfig-1012-20261004    gcc-13
x86_64                randconfig-1013-20261004    gcc-13
x86_64                randconfig-1014-20261004    gcc-13
x86_64                randconfig-1015-20261004    gcc-13
x86_64                randconfig-1016-20261004    gcc-13
x86_64                randconfig-1017-20261004    gcc-13
x86_64                randconfig-2100-20261003    clang-22   cocci
x86_64                randconfig-2101-20261003    clang-22   cocci
x86_64                randconfig-2102-20261003    clang-22   cocci
x86_64                randconfig-2102-20261003    gcc-14     cocci
x86_64                randconfig-2103-20261003    clang-22   cocci
x86_64                randconfig-2103-20261003    gcc-13     cocci
x86_64                randconfig-2200-20261003    gcc-14     smatch
x86_64                randconfig-2300-20261002    gcc-14     sparse
x86_64                randconfig-2300-20261003    clang-22   sparse
x86_64                randconfig-2300-20261003    gcc-14     sparse
x86_64                randconfig-2301-20261002    gcc-14     sparse
x86_64                randconfig-2301-20261003    clang-22   sparse
x86_64                randconfig-2301-20261003    gcc-14     sparse
x86_64                randconfig-2302-20261002    gcc-12     sparse
x86_64                randconfig-2302-20261003    clang-22   sparse
x86_64               randconfig-r2101-20261003    gcc-14     cocci
x86_64               randconfig-r2306-20261002    clang-22   sparse
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
xtensa                        common_defconfig    clang-21
xtensa                randconfig-1000-20261004    gcc-14
xtensa                randconfig-1001-20261004    gcc-14
xtensa                randconfig-2000-20261002    gcc-13.4.0
xtensa                randconfig-2000-20261003    gcc-14
xtensa                randconfig-2001-20261002    gcc-11.5.0
xtensa                randconfig-2001-20261003    gcc-14
xtensa               randconfig-r2200-20261003    gcc-8.5.0  smatch
xtensa               randconfig-r2202-20261003    gcc-8.5.0  smatch
xtensa               randconfig-r2301-20261003    gcc-8.5.0  sparse
xtensa               randconfig-r2305-20261003    gcc-16.1.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
