Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05061A08AF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791428106; cv=none; b=QbivO5Nyr3bLjy5o6tR5aEbKKXWQBQwH/QGc6hZU5qBqQE8eHTiaQA0BxDY/hD1orl0hbdhS1o8PENtTvd2fZY3jLo9SenPN7Zd8T6IdIwUtnWZpBmHVKrgA7Pfn+MiMJSSXvJTTCZ4B13BegFbQF0sCdKMUD+ksh4Ctn7mbxGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791428106; c=relaxed/simple;
	bh=/G+oekZjObxLCJtT1uKLkfN0sVmsfa4mIZc0UzyPIgY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hzw2/8ba+HBjOG1TUjGNli1DXYYV773Zby2tmXveDsyZWvKtHr7jEyluiBsFzXI9c7uBrPjigby+sAqyMSXzNno62ZrF0nHBWivGu5H6VNgCguEhWUXUZqUfoVxuR2o9/DtIPvm8N0ziCo01pZOv5oqQSjw/3DSlBY9NNcaAsZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hi1L/zg0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hi1L/zg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791428104; x=1822964104;
  h=date:from:to:cc:subject:message-id;
  bh=/G+oekZjObxLCJtT1uKLkfN0sVmsfa4mIZc0UzyPIgY=;
  b=Hi1L/zg03nm9Kc4owPO8QUVfXIsy+GEkmtZzx2JJ03vsUW0D80o2M/Wb
   rQb2o8r4lYj71KzuusoMdq3QJGUDm5Lkqd68S2Ga9WTdIsZSdhmknv6Ia
   kpyv3316M5lRkklIbj/lVm09gE/LQZojMttsMVTmkznNUAEPcG+eVZuWb
   sE781DoEKVOdgaPDlWrYAfT0EySWdp54+9oZLJaoufXrCQAIeFLWTpmyR
   Wj2k00bMRuzNQbSWGM7eb8i2bTYdyy4ZGE5JYeZLxZ3Y3XndbNGp7nEDg
   refUPqzoiCC9R82wP/1ZkRnYbJ3ghhEfr6b6coQhQU3cnYYucXnd2ZcAL
   A==;
X-CSE-ConnectionGUID: d0Wo1DYMTBa11SvYCrVQUw==
X-CSE-MsgGUID: wxM4TN7NSI+u7TT1UCJiNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="202410"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="202410"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 19:55:03 -0700
X-CSE-ConnectionGUID: aB3bj/2/QyGGXJ5yAXJhMw==
X-CSE-MsgGUID: hadCHYb6QKuWD1AlOchr6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="307078302"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Oct 2026 19:55:01 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEeHa-000000003tI-2rET;
	Thu, 08 Oct 2026 02:54:58 +0000
Date: Thu, 08 Oct 2026 10:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2026.10.01a] BUILD SUCCESS
 1b8c25bd122cdd9642142b6ccd0e8ed46733e04d
Message-ID: <202610081047.AnGiFoMg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.10.01a
branch HEAD: 1b8c25bd122cdd9642142b6ccd0e8ed46733e04d  fixup! sh: Emulate two-byte cmpxchg

elapsed time: 1900m

configs tested: 358
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2202-20261007    gcc-8.5.0  smatch
alpha                randconfig-r2306-20261007    clang-24   sparse
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261007    clang-24
arc                   randconfig-1000-20261008    clang-18
arc                   randconfig-1001-20261007    clang-24
arc                   randconfig-1001-20261008    clang-18
arc                  randconfig-r2103-20261007    gcc-11.5.0 cocci
arc                         vdk_hs38_defconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                          bcm2835_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20261007    clang-24
arm                   randconfig-1000-20261008    clang-18
arm                   randconfig-1001-20261007    clang-24
arm                   randconfig-1001-20261008    clang-18
arm                   randconfig-1002-20261007    clang-24
arm                   randconfig-1002-20261008    clang-18
arm                   randconfig-1003-20261007    clang-24
arm                   randconfig-1003-20261008    clang-18
arm                  randconfig-r2104-20261007    gcc-8.5.0  cocci
arm                  randconfig-r2105-20261007    gcc-16.1.0 cocci
arm                  randconfig-r2304-20261007    clang-20   sparse
arm                  randconfig-r2306-20261007    gcc-14     sparse
arm                        versatile_defconfig    gcc-16.1.0
arm                          vf610m4_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261007    gcc-13.4.0
arm64                 randconfig-1000-20261008    gcc-10.5.0
arm64                 randconfig-1001-20261007    gcc-13.4.0
arm64                 randconfig-1001-20261008    gcc-10.5.0
arm64                 randconfig-1002-20261007    gcc-13.4.0
arm64                 randconfig-1002-20261008    gcc-10.5.0
arm64                 randconfig-1003-20261007    gcc-13.4.0
arm64                 randconfig-1003-20261008    gcc-10.5.0
arm64                randconfig-r2102-20261007    gcc-8.5.0  cocci
arm64                randconfig-r2106-20261007    clang-22   cocci
arm64                randconfig-r2106-20261007    gcc-16.1.0 cocci
arm64                randconfig-r2107-20261007    gcc-8.5.0  cocci
arm64                randconfig-r2305-20261007    clang-20   sparse
csky                              alldefconfig    gcc-16.1.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261007    gcc-13.4.0
csky                  randconfig-1000-20261008    gcc-10.5.0
csky                  randconfig-1001-20261007    gcc-13.4.0
csky                  randconfig-1001-20261008    gcc-10.5.0
csky                 randconfig-r2102-20261007    gcc-8.5.0  cocci
csky                 randconfig-r2104-20261007    gcc-16.1.0 cocci
csky                 randconfig-r2301-20261007    gcc-8.5.0  sparse
csky                 randconfig-r2308-20261007    gcc-14     sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261007    gcc-12.5.0
hexagon               randconfig-1000-20261008    gcc-16.1.0
hexagon               randconfig-1001-20261007    gcc-12.5.0
hexagon               randconfig-1001-20261008    gcc-16.1.0
hexagon              randconfig-r2101-20261007    gcc-8.5.0  cocci
hexagon              randconfig-r2103-20261007    gcc-8.5.0  cocci
hexagon              randconfig-r2106-20261007    gcc-8.5.0  cocci
hexagon              randconfig-r2107-20261007    clang-22   cocci
hexagon              randconfig-r2107-20261007    gcc-16.1.0 cocci
hexagon              randconfig-r2200-20261007    clang-24   smatch
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261007    gcc-14
i386        buildonly-randconfig-1000-20261008    clang-22
i386        buildonly-randconfig-1001-20261007    gcc-14
i386        buildonly-randconfig-1001-20261008    clang-22
i386        buildonly-randconfig-1002-20261007    gcc-14
i386        buildonly-randconfig-1002-20261008    clang-22
i386        buildonly-randconfig-1003-20261007    gcc-14
i386        buildonly-randconfig-1003-20261008    clang-22
i386        buildonly-randconfig-1004-20261007    gcc-14
i386        buildonly-randconfig-1004-20261008    clang-22
i386        buildonly-randconfig-1005-20261007    gcc-14
i386        buildonly-randconfig-1005-20261008    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261007    clang-22
i386                  randconfig-1000-20261008    gcc-14
i386                  randconfig-1001-20261007    clang-22
i386                  randconfig-1001-20261008    gcc-14
i386                  randconfig-1002-20261007    clang-22
i386                  randconfig-1002-20261008    gcc-14
i386                  randconfig-1003-20261007    clang-22
i386                  randconfig-1003-20261008    gcc-14
i386                  randconfig-1004-20261007    clang-22
i386                  randconfig-1004-20261008    gcc-14
i386                  randconfig-1005-20261007    clang-22
i386                  randconfig-1005-20261008    gcc-14
i386                  randconfig-1006-20261007    clang-22
i386                  randconfig-1006-20261008    gcc-14
i386                  randconfig-1007-20261007    gcc-14
i386                  randconfig-1007-20261008    clang-22
i386                  randconfig-1008-20261007    gcc-14
i386                  randconfig-1008-20261008    clang-22
i386                  randconfig-1009-20261007    gcc-14
i386                  randconfig-1009-20261008    clang-22
i386                  randconfig-1010-20261007    gcc-14
i386                  randconfig-1010-20261008    clang-22
i386                  randconfig-1011-20261007    gcc-14
i386                  randconfig-1011-20261008    clang-22
i386                  randconfig-1012-20261007    gcc-14
i386                  randconfig-1012-20261008    clang-22
i386                  randconfig-1013-20261007    gcc-14
i386                  randconfig-1013-20261008    clang-22
i386                  randconfig-2100-20261007    clang-22   cocci
i386                  randconfig-2101-20261007    clang-22   cocci
i386                  randconfig-2102-20261007    clang-22   cocci
i386                  randconfig-2103-20261007    clang-22   cocci
i386                  randconfig-2200-20261007    gcc-14     smatch
i386                  randconfig-2300-20261007    clang-22   sparse
i386                  randconfig-2301-20261007    clang-22   sparse
i386                  randconfig-2302-20261007    clang-22   sparse
i386                 randconfig-r2300-20261007    gcc-8.5.0  sparse
i386                 randconfig-r2302-20261007    clang-20   sparse
i386                 randconfig-r2307-20261007    gcc-13.4.0 sparse
i386                 randconfig-r2309-20261007    gcc-14     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261007    gcc-12.5.0
loongarch             randconfig-1000-20261008    gcc-16.1.0
loongarch             randconfig-1001-20261007    gcc-12.5.0
loongarch             randconfig-1001-20261008    gcc-16.1.0
loongarch            randconfig-r2305-20261007    gcc-8.5.0  sparse
loongarch            randconfig-r2307-20261007    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                         m5307c3_defconfig    clang-17
m68k                         mvme16x_defconfig    clang-17
m68k                 randconfig-r2100-20261007    gcc-11.5.0 cocci
m68k                 randconfig-r2303-20261007    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2306-20261007    gcc-13.4.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                       bmips_stb_defconfig    clang-17
mips                          cobalt_defconfig    gcc-16.1.0
mips                      cu1000-neo_defconfig    clang-17
mips                     maltaup_xpa_defconfig    gcc-16.1.0
mips                       pic32mzda_defconfig    gcc-16.1.0
mips                 randconfig-r2202-20261007    clang-17   smatch
mips                           rm200_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261007    gcc-12.5.0
nios2                 randconfig-1000-20261008    gcc-16.1.0
nios2                 randconfig-1001-20261007    gcc-12.5.0
nios2                 randconfig-1001-20261008    gcc-16.1.0
nios2                randconfig-r2101-20261007    gcc-11.5.0 cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2200-20261007    gcc-12.5.0 smatch
openrisc             randconfig-r2303-20261007    clang-20   sparse
openrisc             randconfig-r2309-20261007    gcc-13.4.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261007    gcc-15.2.0
parisc                randconfig-1000-20261008    gcc-8.5.0
parisc                randconfig-1001-20261007    gcc-15.2.0
parisc                randconfig-1001-20261008    gcc-8.5.0
parisc               randconfig-r2100-20261007    gcc-8.5.0  cocci
parisc               randconfig-r2201-20261007    gcc-8.5.0  smatch
parisc               randconfig-r2309-20261007    clang-24   sparse
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                     ge_imp3a_defconfig    gcc-16.1.0
powerpc                         icon_defconfig    gcc-16.1.0
powerpc                       katmai_defconfig    gcc-16.1.0
powerpc                  mpc836x_rdk_defconfig    clang-17
powerpc                   mpc885_ads_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261007    gcc-15.2.0
powerpc               randconfig-1000-20261008    gcc-8.5.0
powerpc               randconfig-1001-20261007    gcc-15.2.0
powerpc               randconfig-1001-20261008    gcc-8.5.0
powerpc              randconfig-r2101-20261007    gcc-8.5.0  cocci
powerpc              randconfig-r2308-20261007    gcc-13.4.0 sparse
powerpc                      skiroot_defconfig    gcc-16.1.0
powerpc64                         alldefconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261007    gcc-15.2.0
powerpc64             randconfig-1000-20261008    gcc-8.5.0
powerpc64             randconfig-1001-20261007    gcc-15.2.0
powerpc64             randconfig-1001-20261008    gcc-8.5.0
powerpc64            randconfig-r2200-20261007    clang-24   smatch
powerpc64            randconfig-r2202-20261007    gcc-10.5.0 smatch
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                     nommu_virt_defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261007    clang-24
riscv                 randconfig-1000-20261008    gcc-10.5.0
riscv                 randconfig-1001-20261007    clang-24
riscv                 randconfig-1001-20261008    gcc-10.5.0
riscv                 randconfig-2000-20261007    gcc-12.5.0
riscv                 randconfig-2001-20261007    gcc-12.5.0
riscv                randconfig-r2105-20261007    gcc-8.5.0  cocci
riscv                randconfig-r2201-20261007    clang-24   smatch
riscv                randconfig-r2304-20261007    gcc-8.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261007    clang-24
s390                  randconfig-1000-20261008    gcc-10.5.0
s390                  randconfig-1001-20261007    clang-24
s390                  randconfig-1001-20261008    gcc-10.5.0
s390                  randconfig-2000-20261007    gcc-12.5.0
s390                  randconfig-2001-20261007    gcc-12.5.0
s390                 randconfig-r2302-20261007    gcc-8.5.0  sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          apsh4a3a_defconfig    clang-17
sh                                   defconfig    gcc-14
sh                           polaris_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261007    clang-24
sh                    randconfig-1000-20261008    gcc-10.5.0
sh                    randconfig-1001-20261007    clang-24
sh                    randconfig-1001-20261008    gcc-10.5.0
sh                    randconfig-2000-20261007    gcc-12.5.0
sh                    randconfig-2001-20261007    gcc-12.5.0
sh                   randconfig-r2105-20261007    clang-22   cocci
sh                    sh7724_generic_defconfig    gcc-16.1.0
sh                               ul2_defconfig    gcc-16.1.0
sparc                             alldefconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261008    gcc-14
sparc                 randconfig-1001-20261008    gcc-14
sparc                 randconfig-2000-20261007    clang-24
sparc                 randconfig-2001-20261007    clang-24
sparc                randconfig-r2301-20261007    clang-20   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261008    gcc-14
sparc64               randconfig-1001-20261008    gcc-14
sparc64               randconfig-2000-20261007    clang-24
sparc64               randconfig-2001-20261007    clang-24
sparc64              randconfig-r2100-20261007    gcc-8.5.0  cocci
sparc64              randconfig-r2102-20261007    gcc-11.5.0 cocci
sparc64              randconfig-r2200-20261007    clang-21   smatch
sparc64              randconfig-r2201-20261007    gcc-16.1.0 smatch
sparc64              randconfig-r2300-20261007    clang-20   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261008    gcc-14
um                    randconfig-1001-20261008    gcc-14
um                    randconfig-2000-20261007    clang-24
um                    randconfig-2001-20261007    clang-24
um                   randconfig-r2307-20261007    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261007    gcc-14
x86_64      buildonly-randconfig-1000-20261008    gcc-14
x86_64      buildonly-randconfig-1001-20261007    gcc-14
x86_64      buildonly-randconfig-1001-20261008    gcc-14
x86_64      buildonly-randconfig-1002-20261007    gcc-14
x86_64      buildonly-randconfig-1002-20261008    gcc-14
x86_64      buildonly-randconfig-1003-20261007    gcc-14
x86_64      buildonly-randconfig-1003-20261008    gcc-14
x86_64      buildonly-randconfig-1004-20261007    gcc-14
x86_64      buildonly-randconfig-1004-20261008    gcc-14
x86_64      buildonly-randconfig-1005-20261007    gcc-14
x86_64      buildonly-randconfig-1005-20261008    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261007    clang-22
x86_64                randconfig-1000-20261008    gcc-14
x86_64                randconfig-1001-20261007    clang-22
x86_64                randconfig-1001-20261008    gcc-14
x86_64                randconfig-1002-20261007    clang-22
x86_64                randconfig-1002-20261008    gcc-14
x86_64                randconfig-1003-20261007    clang-22
x86_64                randconfig-1003-20261008    gcc-14
x86_64                randconfig-1004-20261007    clang-22
x86_64                randconfig-1004-20261008    gcc-14
x86_64                randconfig-1005-20261007    clang-22
x86_64                randconfig-1005-20261008    gcc-14
x86_64                randconfig-1006-20261007    clang-22
x86_64                randconfig-1006-20261008    clang-22
x86_64                randconfig-1007-20261007    clang-22
x86_64                randconfig-1007-20261008    clang-22
x86_64                randconfig-1008-20261007    clang-22
x86_64                randconfig-1008-20261008    clang-22
x86_64                randconfig-1009-20261007    clang-22
x86_64                randconfig-1009-20261008    clang-22
x86_64                randconfig-1010-20261007    clang-22
x86_64                randconfig-1010-20261008    clang-22
x86_64                randconfig-1011-20261007    clang-22
x86_64                randconfig-1011-20261008    clang-22
x86_64                randconfig-1012-20261007    gcc-12
x86_64                randconfig-1012-20261008    clang-22
x86_64                randconfig-1013-20261007    gcc-12
x86_64                randconfig-1013-20261008    clang-22
x86_64                randconfig-1014-20261007    gcc-12
x86_64                randconfig-1014-20261008    clang-22
x86_64                randconfig-1015-20261007    gcc-12
x86_64                randconfig-1015-20261008    clang-22
x86_64                randconfig-1016-20261007    gcc-12
x86_64                randconfig-1016-20261008    clang-22
x86_64                randconfig-1017-20261007    gcc-12
x86_64                randconfig-1017-20261008    clang-22
x86_64                randconfig-2100-20261007    clang-22   cocci
x86_64                randconfig-2101-20261007    clang-22   cocci
x86_64                randconfig-2102-20261007    clang-22   cocci
x86_64                randconfig-2103-20261007    clang-22   cocci
x86_64                randconfig-2200-20261007    gcc-14     smatch
x86_64                randconfig-2300-20261007    clang-22   sparse
x86_64                randconfig-2301-20261007    clang-22   sparse
x86_64                randconfig-2302-20261007    clang-22   sparse
x86_64               randconfig-r2104-20261007    clang-22   cocci
x86_64               randconfig-r2308-20261007    clang-24   sparse
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
xtensa                randconfig-1000-20261008    gcc-14
xtensa                randconfig-1001-20261008    gcc-14
xtensa                randconfig-2000-20261007    clang-24
xtensa                randconfig-2001-20261007    clang-24
xtensa               randconfig-r2103-20261007    gcc-8.5.0  cocci

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
