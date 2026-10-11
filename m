Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EA7225A38
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791685380; cv=none; b=sfCpqZEVdjqfoa+c9N6bmPyLDbTiiLdVmts51XuF0VuYW29V0jDNr2DkDPiM4RDL2sn8STn9HFlChIY3dV3n/5QHZzwDvBB+/p8xPybQVn5XG+4NmN18WOeSnq4RbgvEJrxrGxmE6xKiHt2fcusVh4Q7uDuzwRMXk0w1v/Gs4mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791685380; c=relaxed/simple;
	bh=Tuujw0J02MpGzSVrcEZBclbX+//0Lxd6V3tHDagps5c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sY00o3uoAmwKKP3lBTlBe6mPjlcaIV2gPStZgt9iDl6th6GbCirot35DVZB3JIlqRTwyfu5jrDS+dwbM978jjNO8HJ/kZD91jhwqh5EKIcvCPbiPrsOJrmpJMBzqE3XcHrKT6vXmYqMnREpyviHU2bIL0pwinsY/fboUmHE+GPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChUEIaVh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChUEIaVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791685379; x=1823221379;
  h=date:from:to:cc:subject:message-id;
  bh=Tuujw0J02MpGzSVrcEZBclbX+//0Lxd6V3tHDagps5c=;
  b=ChUEIaVhRa2tZ+y0FrGHE1lVNi1oCouVVhrXHmNaNZPpaRICUSTp0JB7
   dXxZTOReutbWodhx0Fia7cQnyllEpsECQp9KI3U5DY6MJHD9MMM4GCQk4
   qYRXj8ORkPJRSwSZCF5aryH2AXsb3cL1vWFKA8mA/VjmDaHo9VSGV13Q2
   D+bg0HmMVsQJZnaBRis2T9POiCJJ4CxubrBjhEFLVmoaxf7KzMYkgkX62
   eBtcwGFgRRTJ6t9k4Cuuugztn/bI/EFXbbtf2OjLoeIhCJtk2+KKcgeuH
   Hr/OMXW28ityddRBki/rPX1e8X0/WrXiLm2gs43cHIrZ1p4I0c9Le1r/s
   Q==;
X-CSE-ConnectionGUID: G51ARAjMRC2eidjM2RTyXQ==
X-CSE-MsgGUID: wwsRvdkSQ5OFCUfNiwUcUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="317069"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="317069"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 19:22:58 -0700
X-CSE-ConnectionGUID: fI8AcLStSaaNuD1Pi+qOHw==
X-CSE-MsgGUID: Td/CGN8oRv2m3yHKzzJaig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="930328"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Oct 2026 19:22:56 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFjDC-00000000AFu-0t2H;
	Sun, 11 Oct 2026 02:22:54 +0000
Date: Sun, 11 Oct 2026 10:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:cache] BUILD SUCCESS
 2c10b3fa5bdf61e344bc522e6c2e00d870ce7ab8
Message-ID: <202610111046.R0sRTMYx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cache
branch HEAD: 2c10b3fa5bdf61e344bc522e6c2e00d870ce7ab8  fs/resctrl: Ensure default group reports tasks on monitor-only systems

elapsed time: 1306m

configs tested: 345
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20261010    gcc-12.5.0 cocci
alpha                randconfig-r2104-20261010    gcc-16.1.0 cocci
alpha                randconfig-r2107-20261010    gcc-8.5.0  cocci
alpha                randconfig-r2303-20261010    gcc-16.1.0 sparse
alpha                randconfig-r2305-20261010    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261010    gcc-8.5.0
arc                   randconfig-1001-20261010    gcc-8.5.0
arc                   randconfig-2000-20261010    gcc-8.5.0
arc                   randconfig-2001-20261010    gcc-8.5.0
arc                  randconfig-r2103-20261010    clang-24   cocci
arc                  randconfig-r2104-20261010    gcc-8.5.0  cocci
arc                  randconfig-r2107-20261010    gcc-8.5.0  cocci
arc                  randconfig-r2202-20261010    gcc-8.5.0  smatch
arc                  randconfig-r2307-20261010    clang-22   sparse
arc                  randconfig-r2308-20261010    gcc-13.4.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20261010    gcc-8.5.0
arm                   randconfig-1001-20261010    gcc-8.5.0
arm                   randconfig-1002-20261010    gcc-8.5.0
arm                   randconfig-1003-20261010    gcc-8.5.0
arm                   randconfig-2000-20261010    gcc-8.5.0
arm                   randconfig-2001-20261010    gcc-8.5.0
arm                  randconfig-r2105-20261010    gcc-16.1.0 cocci
arm                  randconfig-r2105-20261010    gcc-8.5.0  cocci
arm                  randconfig-r2303-20261010    gcc-8.5.0  sparse
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261010    gcc-10.5.0
arm64                 randconfig-1001-20261010    gcc-10.5.0
arm64                 randconfig-1002-20261010    gcc-10.5.0
arm64                 randconfig-1003-20261010    gcc-10.5.0
arm64                 randconfig-2000-20261010    gcc-16.1.0
arm64                 randconfig-2001-20261010    gcc-16.1.0
arm64                randconfig-r2100-20261010    clang-24   cocci
arm64                randconfig-r2101-20261010    clang-22   cocci
arm64                randconfig-r2101-20261010    gcc-10.5.0 cocci
arm64                randconfig-r2107-20261010    gcc-16.1.0 cocci
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261010    gcc-10.5.0
csky                  randconfig-1001-20261010    gcc-10.5.0
csky                  randconfig-2000-20261010    gcc-16.1.0
csky                  randconfig-2001-20261010    gcc-16.1.0
csky                 randconfig-r2104-20261010    gcc-12     cocci
csky                 randconfig-r2109-20261010    gcc-16.1.0 cocci
csky                 randconfig-r2111-20261010    gcc-16.1.0 cocci
csky                 randconfig-r2300-20261010    gcc-16.1.0 sparse
csky                 randconfig-r2306-20261010    clang-24   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261010    clang-17
hexagon               randconfig-1001-20261010    clang-17
hexagon               randconfig-2000-20261010    gcc-16.1.0
hexagon               randconfig-2001-20261010    gcc-16.1.0
hexagon              randconfig-r2103-20261010    gcc-16.1.0 cocci
hexagon              randconfig-r2104-20261010    gcc-16.1.0 cocci
hexagon              randconfig-r2106-20261010    gcc-8.5.0  cocci
hexagon              randconfig-r2110-20261010    gcc-12     cocci
hexagon              randconfig-r2306-20261010    gcc-16.1.0 sparse
hexagon              randconfig-r2310-20261010    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261010    gcc-14
i386        buildonly-randconfig-1001-20261010    gcc-14
i386        buildonly-randconfig-1002-20261010    gcc-14
i386        buildonly-randconfig-1003-20261010    gcc-14
i386        buildonly-randconfig-1004-20261010    gcc-14
i386        buildonly-randconfig-1005-20261010    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261010    clang-22
i386                  randconfig-1001-20261010    clang-22
i386                  randconfig-1002-20261010    clang-22
i386                  randconfig-1003-20261010    clang-22
i386                  randconfig-1004-20261010    clang-22
i386                  randconfig-1005-20261010    clang-22
i386                  randconfig-1006-20261010    clang-22
i386                  randconfig-1007-20261010    gcc-14
i386                  randconfig-1008-20261010    gcc-14
i386                  randconfig-1009-20261010    gcc-14
i386                  randconfig-1010-20261010    gcc-14
i386                  randconfig-1011-20261010    gcc-14
i386                  randconfig-1012-20261010    gcc-14
i386                  randconfig-1013-20261010    gcc-14
i386                  randconfig-2000-20261010    gcc-8.5.0
i386                  randconfig-2001-20261010    gcc-8.5.0
i386                  randconfig-2100-20261010    clang-22   cocci
i386                  randconfig-2100-20261010    gcc-13     cocci
i386                  randconfig-2101-20261010    clang-22   cocci
i386                  randconfig-2101-20261010    gcc-13     cocci
i386                  randconfig-2102-20261010    clang-22   cocci
i386                  randconfig-2102-20261010    gcc-13     cocci
i386                  randconfig-2103-20261010    clang-22   cocci
i386                  randconfig-2103-20261010    gcc-13     cocci
i386                  randconfig-2104-20261010    gcc-13     cocci
i386                  randconfig-2105-20261010    gcc-13     cocci
i386                  randconfig-2200-20261010    gcc-12     smatch
i386                  randconfig-2300-20261010    gcc-14     sparse
i386                  randconfig-2301-20261010    gcc-14     sparse
i386                  randconfig-2302-20261010    gcc-14     sparse
i386                 randconfig-r2102-20261010    gcc-16.1.0 cocci
i386                 randconfig-r2103-20261010    gcc-12.5.0 cocci
i386                 randconfig-r2201-20261010    clang-22   smatch
i386                 randconfig-r2301-20261010    gcc-8.5.0  sparse
i386                 randconfig-r2305-20261010    gcc-8.5.0  sparse
i386                 randconfig-r2308-20261010    gcc-16.1.0 sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch             randconfig-1000-20261010    clang-17
loongarch             randconfig-1001-20261010    clang-17
loongarch             randconfig-2000-20261010    gcc-8.5.0
loongarch             randconfig-2001-20261010    gcc-8.5.0
loongarch            randconfig-r2105-20261010    gcc-8.5.0  cocci
loongarch            randconfig-r2108-20261010    gcc-12.5.0 cocci
loongarch            randconfig-r2304-20261010    gcc-8.5.0  sparse
loongarch            randconfig-r2309-20261010    gcc-16.1.0 sparse
loongarch            randconfig-r2311-20261010    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                          amcore_defconfig    gcc-16.1.0
m68k                        m5249evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2100-20261010    gcc-12.5.0 cocci
m68k                 randconfig-r2110-20261010    gcc-16.1.0 cocci
m68k                 randconfig-r2200-20261010    gcc-9.5.0  smatch
m68k                 randconfig-r2303-20261010    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze           randconfig-r2103-20261010    gcc-10.5.0 cocci
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                      eyeq6lplus_defconfig    gcc-16.1.0
mips                            ip22_defconfig    gcc-16.1.0
mips                 randconfig-r2100-20261010    gcc-10.5.0 cocci
mips                 randconfig-r2105-20261010    gcc-8.5.0  cocci
mips                 randconfig-r2106-20261010    gcc-8.5.0  cocci
mips                 randconfig-r2107-20261010    gcc-8.5.0  cocci
mips                 randconfig-r2200-20261010    gcc-14.3.0 smatch
mips                 randconfig-r2301-20261010    gcc-8.5.0  sparse
mips                 randconfig-r2309-20261010    clang-24   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                 randconfig-1000-20261010    clang-17
nios2                 randconfig-1001-20261010    clang-17
nios2                 randconfig-2000-20261010    gcc-8.5.0
nios2                 randconfig-2001-20261010    gcc-8.5.0
nios2                randconfig-r2101-20261010    gcc-16.1.0 cocci
nios2                randconfig-r2106-20261010    gcc-16.1.0 cocci
nios2                randconfig-r2106-20261010    gcc-8.5.0  cocci
nios2                randconfig-r2306-20261010    clang-22   sparse
nios2                randconfig-r2306-20261010    gcc-13.4.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc                   or1klitex_defconfig    gcc-16.1.0
openrisc             randconfig-r2102-20261010    clang-22   cocci
openrisc             randconfig-r2201-20261010    gcc-16.1.0 smatch
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                 generic-64bit_defconfig    gcc-16.1.0
parisc                randconfig-2000-20261010    gcc-8.5.0
parisc                randconfig-2001-20261010    gcc-8.5.0
parisc               randconfig-r2200-20261010    gcc-16.1.0 smatch
parisc               randconfig-r2307-20261010    clang-24   sparse
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                        ebony_defconfig    gcc-16.1.0
powerpc               randconfig-2000-20261010    gcc-14
powerpc               randconfig-2001-20261010    gcc-14
powerpc              randconfig-r2100-20261010    clang-22   cocci
powerpc              randconfig-r2106-20261010    gcc-12     cocci
powerpc              randconfig-r2201-20261010    gcc-16.1.0 smatch
powerpc              randconfig-r2202-20261010    clang-17   smatch
powerpc              randconfig-r2301-20261010    gcc-16.1.0 sparse
powerpc              randconfig-r2302-20261010    gcc-8.5.0  sparse
powerpc              randconfig-r2309-20261010    clang-24   sparse
powerpc                       tqm8xx_defconfig    gcc-16.1.0
powerpc64             randconfig-2000-20261010    gcc-14
powerpc64             randconfig-2001-20261010    gcc-14
powerpc64            randconfig-r2307-20261010    gcc-13.4.0 sparse
powerpc64            randconfig-r2309-20261010    clang-22   sparse
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261010    clang-19
riscv                 randconfig-1001-20261010    clang-19
riscv                 randconfig-2000-20261010    gcc-16.1.0
riscv                 randconfig-2001-20261010    gcc-16.1.0
riscv                randconfig-r2107-20261010    gcc-16.1.0 cocci
riscv                randconfig-r2110-20261010    gcc-16.1.0 cocci
riscv                randconfig-r2300-20261010    gcc-8.5.0  sparse
riscv                randconfig-r2304-20261010    gcc-8.5.0  sparse
riscv                randconfig-r2306-20261010    clang-24   sparse
riscv                randconfig-r2308-20261010    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261010    clang-19
s390                  randconfig-1001-20261010    clang-19
s390                  randconfig-2000-20261010    gcc-16.1.0
s390                  randconfig-2001-20261010    gcc-16.1.0
s390                 randconfig-r2102-20261010    gcc-10.5.0 cocci
s390                 randconfig-r2300-20261010    gcc-8.5.0  sparse
s390                 randconfig-r2305-20261010    gcc-16.1.0 sparse
s390                 randconfig-r2307-20261010    gcc-16.1.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261010    clang-19
sh                    randconfig-1001-20261010    clang-19
sh                    randconfig-2000-20261010    gcc-16.1.0
sh                    randconfig-2001-20261010    gcc-16.1.0
sh                   randconfig-r2101-20261010    gcc-12.5.0 cocci
sh                   randconfig-r2102-20261010    gcc-12.5.0 cocci
sh                   randconfig-r2105-20261010    gcc-12     cocci
sh                   randconfig-r2105-20261010    gcc-16.1.0 cocci
sh                   randconfig-r2108-20261010    gcc-16.1.0 cocci
sh                   randconfig-r2111-20261010    gcc-16.1.0 cocci
sh                   randconfig-r2200-20261010    gcc-9.5.0  smatch
sh                   randconfig-r2201-20261010    gcc-15.2.0 smatch
sh                   randconfig-r2202-20261010    gcc-9.5.0  smatch
sh                   randconfig-r2310-20261010    clang-24   sparse
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261010    gcc-16.1.0
sparc                 randconfig-1001-20261010    gcc-16.1.0
sparc                 randconfig-2000-20261010    gcc-16.1.0
sparc                 randconfig-2001-20261010    gcc-16.1.0
sparc                randconfig-r2100-20261010    gcc-12.5.0 cocci
sparc                randconfig-r2102-20261010    clang-24   cocci
sparc                randconfig-r2109-20261010    gcc-12.5.0 cocci
sparc                randconfig-r2200-20261010    gcc-16.1.0 smatch
sparc                randconfig-r2304-20261010    gcc-16.1.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261010    gcc-16.1.0
sparc64               randconfig-1001-20261010    gcc-16.1.0
sparc64               randconfig-2000-20261010    gcc-16.1.0
sparc64               randconfig-2001-20261010    gcc-16.1.0
sparc64              randconfig-r2100-20261010    gcc-16.1.0 cocci
sparc64              randconfig-r2101-20261010    clang-24   cocci
sparc64              randconfig-r2302-20261010    gcc-8.5.0  sparse
sparc64              randconfig-r2308-20261010    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261010    gcc-16.1.0
um                    randconfig-1001-20261010    gcc-16.1.0
um                    randconfig-2000-20261010    gcc-16.1.0
um                    randconfig-2001-20261010    gcc-16.1.0
um                   randconfig-r2106-20261010    gcc-16.1.0 cocci
um                   randconfig-r2107-20261010    gcc-12     cocci
um                   randconfig-r2201-20261010    clang-17   smatch
um                   randconfig-r2202-20261010    clang-17   smatch
um                   randconfig-r2309-20261010    gcc-13.4.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261010    clang-22
x86_64      buildonly-randconfig-1001-20261010    clang-22
x86_64      buildonly-randconfig-1002-20261010    clang-22
x86_64      buildonly-randconfig-1003-20261010    clang-22
x86_64      buildonly-randconfig-1004-20261010    clang-22
x86_64      buildonly-randconfig-1005-20261010    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261010    gcc-14
x86_64                randconfig-1001-20261010    gcc-14
x86_64                randconfig-1002-20261010    gcc-14
x86_64                randconfig-1003-20261010    gcc-14
x86_64                randconfig-1004-20261010    gcc-14
x86_64                randconfig-1005-20261010    gcc-14
x86_64                randconfig-1006-20261010    clang-22
x86_64                randconfig-1007-20261010    clang-22
x86_64                randconfig-1008-20261010    clang-22
x86_64                randconfig-1009-20261010    clang-22
x86_64                randconfig-1010-20261010    clang-22
x86_64                randconfig-1011-20261010    clang-22
x86_64                randconfig-1012-20261010    clang-22
x86_64                randconfig-1013-20261010    clang-22
x86_64                randconfig-1014-20261010    clang-22
x86_64                randconfig-1015-20261010    clang-22
x86_64                randconfig-1016-20261010    clang-22
x86_64                randconfig-1017-20261010    clang-22
x86_64                randconfig-2000-20261010    gcc-14
x86_64                randconfig-2001-20261010    gcc-14
x86_64                randconfig-2100-20261010    clang-22   cocci
x86_64                randconfig-2101-20261010    clang-22   cocci
x86_64                randconfig-2102-20261010    clang-22   cocci
x86_64                randconfig-2103-20261010    clang-22   cocci
x86_64                randconfig-2104-20261010    clang-22   cocci
x86_64                randconfig-2105-20261010    clang-22   cocci
x86_64                randconfig-2200-20261010    gcc-14     smatch
x86_64                randconfig-2300-20261010    gcc-14     sparse
x86_64                randconfig-2301-20261010    gcc-14     sparse
x86_64                randconfig-2302-20261010    gcc-14     sparse
x86_64               randconfig-r2103-20261010    clang-22   cocci
x86_64               randconfig-r2104-20261010    gcc-8.5.0  cocci
x86_64               randconfig-r2111-20261010    gcc-12     cocci
x86_64               randconfig-r2302-20261010    gcc-8.5.0  sparse
x86_64               randconfig-r2305-20261010    gcc-8.5.0  sparse
x86_64               randconfig-r2308-20261010    clang-22   sparse
x86_64               randconfig-r2311-20261010    clang-24   sparse
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
xtensa                randconfig-1000-20261010    gcc-16.1.0
xtensa                randconfig-1001-20261010    gcc-16.1.0
xtensa                randconfig-2000-20261010    gcc-16.1.0
xtensa                randconfig-2001-20261010    gcc-16.1.0
xtensa               randconfig-r2101-20261010    gcc-12.5.0 cocci
xtensa               randconfig-r2104-20261010    gcc-8.5.0  cocci
xtensa               randconfig-r2202-20261010    gcc-8.5.0  smatch
xtensa               randconfig-r2300-20261010    gcc-8.5.0  sparse
xtensa               randconfig-r2301-20261010    gcc-8.5.0  sparse
xtensa               randconfig-r2302-20261010    gcc-16.1.0 sparse
xtensa               randconfig-r2307-20261010    clang-24   sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
