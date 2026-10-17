Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85E73932FC
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792203242; cv=none; b=BFeF+qZYrMK/wxpjw1kkTaEbEUJ2uSLCpq1IxcEpY9xb0oyII//ErUGPJL7VEVONkmmFt74crHa8GxwHcNt+AeNmCECAEzmiYE6ZuvJ30ogwpHmjU2/JYeFKzlc+SFikIF31AJqcmeaogDPd6a+VGN20huYbko7lMhVmDK71ABs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792203242; c=relaxed/simple;
	bh=Ns6XtzSMqoAfW3UliB8/zYuXi1fZL09U4+1srdfnHSw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cUUL5HPkwhLa5Y2velfGps04vD7+gUxdQRrQ1Kv29fY2rTs967QLGcvXz5A0U7GrWtU52CNZrFNq90utFUm/jqUOBvQd5WINNPy+5IJkOcXu0oZq+caJaQ8qZaP0z/QPS/2g3B6rlNBjlnFzR3EkhINORCo88/920bOJInLtbDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVpuf8N4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVpuf8N4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792203238; x=1823739238;
  h=date:from:to:cc:subject:message-id;
  bh=Ns6XtzSMqoAfW3UliB8/zYuXi1fZL09U4+1srdfnHSw=;
  b=KVpuf8N4BRJEP8K+eMCuR1H7feT4/7hiv0L3SzB802kfeigXDTCPyD52
   y8KEolzxnpzlCcdZ3aA0B2Ntr6VHHBPzMT/xdxWmxBNh8NI5zJFcvVxg8
   xzbqD6qwMkcEJ/90cLeJiv4vVyD3/wzAxpk0RgRkhHtu/25IOMmFO7F47
   D/jnbtMLZ7rjvqwmPoaChgLZ79hqIkrZon6XJUOhDtFua+QsJPILOmtlj
   4R0pYubnpVnwuXliptATNmNIrDSTsd2gdNNaPRxg1mY6VErvTeGHrAiDC
   ER/fy/sK6FsXpXjURNUefX/JjXu95p9WeOYhEsOvdGrPdGs6RT+HLkCsd
   g==;
X-CSE-ConnectionGUID: J1KI+/ysS8iMT12BNqp5Ig==
X-CSE-MsgGUID: GVxUIHt1TaGvA9ic0t8TOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="868609"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="868609"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 19:13:58 -0700
X-CSE-ConnectionGUID: Z6FzSphWRRyRszt7V6eixA==
X-CSE-MsgGUID: 8toO1umyQyCOh7e3jVzO5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2145888"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Oct 2026 19:13:55 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHtvl-00000000IxE-2W3P;
	Sat, 17 Oct 2026 02:13:53 +0000
Date: Sat, 17 Oct 2026 10:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2026.10.13a] BUILD SUCCESS
 d4a0af70d4a8af3b6251fc8513dfbf47834ea7b9
Message-ID: <202610171015.3UfSEjjT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.10.13a
branch HEAD: d4a0af70d4a8af3b6251fc8513dfbf47834ea7b9  sched/core: Call wakeup_preempt() for queued tasks during class change

elapsed time: 4820m

configs tested: 412
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             alldefconfig    gcc-16.1.0
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20261015    gcc-9.5.0  cocci
alpha                randconfig-r2103-20261015    gcc-9.5.0  cocci
alpha                randconfig-r2104-20261015    gcc-16.1.0 cocci
alpha                randconfig-r2109-20261014    gcc-13.4.0 cocci
alpha                randconfig-r2308-20261015    clang-22   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                             hsdk_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261016    clang-24
arc                   randconfig-1001-20261016    clang-24
arc                   randconfig-2000-20261014    gcc-10.5.0
arc                   randconfig-2000-20261015    gcc-15.2.0
arc                   randconfig-2001-20261014    gcc-10.5.0
arc                   randconfig-2001-20261015    gcc-15.2.0
arc                  randconfig-r2101-20261015    clang-18   cocci
arc                  randconfig-r2107-20261015    gcc-16.1.0 cocci
arc                  randconfig-r2306-20261014    gcc-8.5.0  sparse
arc                  randconfig-r2307-20261014    gcc-8.5.0  sparse
arc                  randconfig-r2307-20261015    clang-24   sparse
arc                  randconfig-r2310-20261015    clang-24   sparse
arc                         vdk_hs38_defconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20261016    clang-24
arm                   randconfig-1001-20261016    clang-24
arm                   randconfig-1002-20261016    clang-24
arm                   randconfig-1003-20261016    clang-24
arm                   randconfig-2000-20261014    gcc-10.5.0
arm                   randconfig-2000-20261015    gcc-15.2.0
arm                   randconfig-2001-20261014    gcc-10.5.0
arm                   randconfig-2001-20261015    gcc-15.2.0
arm                  randconfig-r2202-20261015    gcc-8.5.0  smatch
arm                  randconfig-r2309-20261015    clang-22   sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261016    gcc-8.5.0
arm64                 randconfig-1001-20261016    gcc-8.5.0
arm64                 randconfig-1002-20261016    gcc-8.5.0
arm64                 randconfig-1003-20261016    gcc-8.5.0
arm64                 randconfig-2000-20261014    gcc-16.1.0
arm64                 randconfig-2000-20261015    gcc-16.1.0
arm64                 randconfig-2001-20261014    gcc-16.1.0
arm64                 randconfig-2001-20261015    gcc-16.1.0
arm64                randconfig-r2100-20261014    gcc-13.4.0 cocci
arm64                randconfig-r2201-20261014    clang-24   smatch
arm64                randconfig-r2311-20261015    clang-24   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261016    gcc-8.5.0
csky                  randconfig-1001-20261016    gcc-8.5.0
csky                  randconfig-2000-20261014    gcc-16.1.0
csky                  randconfig-2000-20261015    gcc-16.1.0
csky                  randconfig-2001-20261014    gcc-16.1.0
csky                  randconfig-2001-20261015    gcc-16.1.0
csky                 randconfig-r2108-20261014    gcc-13.4.0 cocci
csky                 randconfig-r2109-20261015    gcc-9.5.0  cocci
csky                 randconfig-r2110-20261015    gcc-16.1.0 cocci
csky                 randconfig-r2300-20261015    clang-17   sparse
csky                 randconfig-r2303-20261015    clang-24   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261016    clang-17
hexagon               randconfig-1001-20261016    clang-17
hexagon               randconfig-2000-20261014    gcc-16.1.0
hexagon               randconfig-2000-20261015    gcc-16.1.0
hexagon               randconfig-2001-20261014    gcc-16.1.0
hexagon               randconfig-2001-20261015    gcc-16.1.0
hexagon              randconfig-r2200-20261015    clang-24   smatch
hexagon              randconfig-r2202-20261015    clang-24   smatch
hexagon              randconfig-r2302-20261015    clang-24   sparse
hexagon              randconfig-r2305-20261015    clang-17   sparse
hexagon              randconfig-r2305-20261015    gcc-16.1.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261016    clang-22
i386        buildonly-randconfig-1001-20261016    clang-22
i386        buildonly-randconfig-1002-20261016    clang-22
i386        buildonly-randconfig-1003-20261016    clang-22
i386        buildonly-randconfig-1004-20261016    clang-22
i386        buildonly-randconfig-1005-20261016    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261016    gcc-13
i386                  randconfig-1000-20261017    clang-22
i386                  randconfig-1001-20261016    gcc-13
i386                  randconfig-1001-20261017    clang-22
i386                  randconfig-1002-20261016    gcc-13
i386                  randconfig-1002-20261017    clang-22
i386                  randconfig-1003-20261016    gcc-13
i386                  randconfig-1003-20261017    clang-22
i386                  randconfig-1004-20261016    gcc-13
i386                  randconfig-1004-20261017    clang-22
i386                  randconfig-1005-20261016    gcc-13
i386                  randconfig-1005-20261017    clang-22
i386                  randconfig-1006-20261016    gcc-13
i386                  randconfig-1006-20261017    clang-22
i386                  randconfig-1007-20261016    clang-22
i386                  randconfig-1008-20261016    clang-22
i386                  randconfig-1009-20261016    clang-22
i386                  randconfig-1010-20261016    clang-22
i386                  randconfig-1011-20261016    clang-22
i386                  randconfig-1012-20261016    clang-22
i386                  randconfig-1013-20261016    clang-22
i386                  randconfig-2000-20261014    gcc-10.5.0
i386                  randconfig-2000-20261015    gcc-15.2.0
i386                  randconfig-2001-20261014    gcc-10.5.0
i386                  randconfig-2001-20261015    gcc-15.2.0
i386                  randconfig-2100-20261014    gcc-13     cocci
i386                  randconfig-2100-20261015    gcc-14     cocci
i386                  randconfig-2101-20261014    gcc-13     cocci
i386                  randconfig-2101-20261015    gcc-14     cocci
i386                  randconfig-2102-20261014    gcc-13     cocci
i386                  randconfig-2102-20261015    gcc-14     cocci
i386                  randconfig-2103-20261014    gcc-13     cocci
i386                  randconfig-2103-20261015    gcc-14     cocci
i386                  randconfig-2104-20261014    gcc-13     cocci
i386                  randconfig-2104-20261015    gcc-14     cocci
i386                  randconfig-2105-20261014    gcc-13     cocci
i386                  randconfig-2105-20261015    gcc-14     cocci
i386                  randconfig-2200-20261014    clang-22   smatch
i386                  randconfig-2200-20261015    clang-22   smatch
i386                  randconfig-2300-20261014    clang-22   sparse
i386                  randconfig-2300-20261015    gcc-14     sparse
i386                  randconfig-2301-20261014    clang-22   sparse
i386                  randconfig-2301-20261015    gcc-14     sparse
i386                  randconfig-2302-20261014    clang-22   sparse
i386                  randconfig-2302-20261015    gcc-14     sparse
i386                 randconfig-r2300-20261014    gcc-13.4.0 sparse
i386                 randconfig-r2305-20261014    gcc-8.5.0  sparse
i386                 randconfig-r2308-20261015    clang-24   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261016    clang-17
loongarch             randconfig-1001-20261016    clang-17
loongarch             randconfig-2000-20261014    gcc-8.5.0
loongarch             randconfig-2000-20261015    gcc-8.5.0
loongarch             randconfig-2001-20261014    gcc-8.5.0
loongarch             randconfig-2001-20261015    gcc-8.5.0
loongarch            randconfig-r2102-20261015    clang-18   cocci
loongarch            randconfig-r2105-20261015    gcc-16.1.0 cocci
loongarch            randconfig-r2300-20261015    gcc-16.1.0 sparse
loongarch            randconfig-r2302-20261014    gcc-8.5.0  sparse
loongarch            randconfig-r2303-20261014    gcc-13.4.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                 randconfig-r2103-20261014    gcc-13.4.0 cocci
m68k                 randconfig-r2306-20261015    clang-24   sparse
m68k                 randconfig-r2307-20261015    clang-22   sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2100-20261015    clang-18   cocci
microblaze           randconfig-r2200-20261015    gcc-8.5.0  smatch
microblaze           randconfig-r2301-20261015    clang-17   sparse
microblaze           randconfig-r2306-20261015    clang-22   sparse
microblaze           randconfig-r2309-20261015    clang-24   sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
mips                         maltaup_defconfig    gcc-16.1.0
mips                 randconfig-r2101-20261014    gcc-13.4.0 cocci
mips                 randconfig-r2303-20261014    gcc-8.5.0  sparse
mips                 randconfig-r2304-20261014    gcc-13.4.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261016    clang-17
nios2                 randconfig-1001-20261016    clang-17
nios2                 randconfig-2000-20261014    gcc-8.5.0
nios2                 randconfig-2000-20261015    gcc-8.5.0
nios2                 randconfig-2001-20261014    gcc-8.5.0
nios2                 randconfig-2001-20261015    gcc-8.5.0
nios2                randconfig-r2302-20261014    gcc-13.4.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2300-20261015    clang-24   sparse
openrisc             randconfig-r2301-20261015    gcc-16.1.0 sparse
openrisc                  simple_smp_defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261016    clang-17
parisc                randconfig-1001-20261016    clang-17
parisc                randconfig-2000-20261014    gcc-8.5.0
parisc                randconfig-2000-20261015    gcc-8.5.0
parisc                randconfig-2001-20261014    gcc-8.5.0
parisc                randconfig-2001-20261015    gcc-8.5.0
parisc               randconfig-r2303-20261015    clang-17   sparse
parisc               randconfig-r2303-20261015    gcc-16.1.0 sparse
parisc               randconfig-r2304-20261015    clang-24   sparse
parisc               randconfig-r2311-20261015    clang-22   sparse
parisc64                             defconfig    clang-24
powerpc                      akebono_defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    gcc-16.1.0
powerpc                      mpc5200_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261016    clang-17
powerpc               randconfig-1001-20261016    clang-17
powerpc               randconfig-2000-20261015    clang-22
powerpc               randconfig-2001-20261015    clang-22
powerpc              randconfig-r2106-20261015    clang-24   cocci
powerpc              randconfig-r2108-20261015    clang-18   cocci
powerpc              randconfig-r2200-20261015    clang-24   smatch
powerpc              randconfig-r2308-20261014    gcc-8.5.0  sparse
powerpc              randconfig-r2310-20261014    gcc-8.5.0  sparse
powerpc                   storcenter_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261016    clang-17
powerpc64             randconfig-1001-20261016    clang-17
powerpc64             randconfig-2000-20261015    clang-22
powerpc64             randconfig-2001-20261015    clang-22
powerpc64            randconfig-r2103-20261015    clang-18   cocci
powerpc64            randconfig-r2304-20261014    gcc-8.5.0  sparse
powerpc64            randconfig-r2305-20261015    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261016    clang-24
riscv                 randconfig-1001-20261016    clang-24
riscv                 randconfig-2000-20261014    gcc-16.1.0
riscv                 randconfig-2000-20261015    gcc-9.5.0
riscv                 randconfig-2001-20261014    gcc-16.1.0
riscv                 randconfig-2001-20261015    gcc-9.5.0
riscv                randconfig-r2107-20261015    clang-24   cocci
riscv                randconfig-r2110-20261015    clang-24   cocci
riscv                randconfig-r2301-20261015    clang-24   sparse
riscv                randconfig-r2302-20261015    clang-17   sparse
riscv                randconfig-r2310-20261015    clang-22   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261016    clang-24
s390                  randconfig-1001-20261016    clang-24
s390                  randconfig-2000-20261014    gcc-16.1.0
s390                  randconfig-2000-20261015    gcc-9.5.0
s390                  randconfig-2001-20261014    gcc-16.1.0
s390                  randconfig-2001-20261015    gcc-9.5.0
s390                 randconfig-r2102-20261015    gcc-9.5.0  cocci
s390                 randconfig-r2105-20261015    clang-24   cocci
s390                 randconfig-r2201-20261015    gcc-8.5.0  smatch
s390                 randconfig-r2304-20261015    clang-17   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261016    clang-24
sh                    randconfig-1001-20261016    clang-24
sh                    randconfig-2000-20261014    gcc-16.1.0
sh                    randconfig-2000-20261015    gcc-9.5.0
sh                    randconfig-2001-20261014    gcc-16.1.0
sh                    randconfig-2001-20261015    gcc-9.5.0
sh                   randconfig-r2106-20261015    gcc-16.1.0 cocci
sh                   randconfig-r2108-20261015    gcc-9.5.0  cocci
sh                   randconfig-r2201-20261015    gcc-10.5.0 smatch
sh                   randconfig-r2309-20261014    gcc-8.5.0  sparse
sh                   randconfig-r2311-20261014    gcc-8.5.0  sparse
sh                           rsk7203_defconfig    gcc-16.1.0
sh                            se7343_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261016    clang-24
sparc                 randconfig-1000-20261017    gcc-15.2.0
sparc                 randconfig-1001-20261016    clang-24
sparc                 randconfig-1001-20261017    gcc-15.2.0
sparc                 randconfig-2000-20261014    gcc-14.3.0
sparc                 randconfig-2000-20261015    gcc-15.2.0
sparc                 randconfig-2001-20261014    gcc-14.3.0
sparc                 randconfig-2001-20261015    gcc-15.2.0
sparc                randconfig-r2104-20261015    clang-24   cocci
sparc                randconfig-r2300-20261014    gcc-8.5.0  sparse
sparc                randconfig-r2301-20261014    gcc-13.4.0 sparse
sparc                        sparc64_defconfig    gcc-16.1.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261016    clang-24
sparc64               randconfig-1000-20261017    gcc-15.2.0
sparc64               randconfig-1001-20261016    clang-24
sparc64               randconfig-1001-20261017    gcc-15.2.0
sparc64               randconfig-2000-20261014    gcc-14.3.0
sparc64               randconfig-2000-20261015    gcc-15.2.0
sparc64               randconfig-2001-20261014    gcc-14.3.0
sparc64               randconfig-2001-20261015    gcc-15.2.0
sparc64              randconfig-r2101-20261015    gcc-9.5.0  cocci
sparc64              randconfig-r2102-20261014    gcc-13.4.0 cocci
sparc64              randconfig-r2111-20261015    clang-24   cocci
sparc64              randconfig-r2202-20261014    clang-22   smatch
sparc64              randconfig-r2301-20261014    gcc-8.5.0  sparse
sparc64              randconfig-r2302-20261015    gcc-16.1.0 sparse
sparc64              randconfig-r2305-20261014    gcc-13.4.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261016    clang-24
um                    randconfig-1000-20261017    gcc-15.2.0
um                    randconfig-1001-20261016    clang-24
um                    randconfig-1001-20261017    gcc-15.2.0
um                    randconfig-2000-20261014    gcc-14.3.0
um                    randconfig-2000-20261015    gcc-15.2.0
um                    randconfig-2001-20261014    gcc-14.3.0
um                    randconfig-2001-20261015    gcc-15.2.0
um                   randconfig-r2109-20261015    clang-18   cocci
um                   randconfig-r2200-20261014    clang-17   smatch
um                   randconfig-r2304-20261015    gcc-16.1.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261016    gcc-14
x86_64      buildonly-randconfig-1000-20261017    gcc-14
x86_64      buildonly-randconfig-1001-20261016    gcc-14
x86_64      buildonly-randconfig-1001-20261017    gcc-14
x86_64      buildonly-randconfig-1002-20261016    gcc-14
x86_64      buildonly-randconfig-1002-20261017    gcc-14
x86_64      buildonly-randconfig-1003-20261016    gcc-14
x86_64      buildonly-randconfig-1003-20261017    gcc-14
x86_64      buildonly-randconfig-1004-20261016    gcc-14
x86_64      buildonly-randconfig-1004-20261017    gcc-14
x86_64      buildonly-randconfig-1005-20261016    gcc-14
x86_64      buildonly-randconfig-1005-20261017    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261016    clang-22
x86_64                randconfig-1000-20261017    gcc-14
x86_64                randconfig-1001-20261016    clang-22
x86_64                randconfig-1001-20261017    gcc-14
x86_64                randconfig-1002-20261016    clang-22
x86_64                randconfig-1002-20261017    gcc-14
x86_64                randconfig-1003-20261016    clang-22
x86_64                randconfig-1003-20261017    gcc-14
x86_64                randconfig-1004-20261016    clang-22
x86_64                randconfig-1004-20261017    gcc-14
x86_64                randconfig-1005-20261016    clang-22
x86_64                randconfig-1005-20261017    gcc-14
x86_64                randconfig-1006-20261016    clang-22
x86_64                randconfig-1007-20261016    clang-22
x86_64                randconfig-1008-20261016    clang-22
x86_64                randconfig-1009-20261016    clang-22
x86_64                randconfig-1010-20261016    clang-22
x86_64                randconfig-1011-20261016    clang-22
x86_64                randconfig-1012-20261016    clang-22
x86_64                randconfig-1013-20261016    clang-22
x86_64                randconfig-1014-20261016    clang-22
x86_64                randconfig-1015-20261016    clang-22
x86_64                randconfig-1016-20261016    clang-22
x86_64                randconfig-1017-20261016    clang-22
x86_64                randconfig-2000-20261015    clang-22
x86_64                randconfig-2001-20261015    clang-22
x86_64                randconfig-2100-20261014    clang-22   cocci
x86_64                randconfig-2100-20261015    clang-22   cocci
x86_64                randconfig-2101-20261014    clang-22   cocci
x86_64                randconfig-2101-20261015    clang-22   cocci
x86_64                randconfig-2102-20261014    clang-22   cocci
x86_64                randconfig-2102-20261015    clang-22   cocci
x86_64                randconfig-2103-20261014    clang-22   cocci
x86_64                randconfig-2103-20261015    clang-22   cocci
x86_64                randconfig-2104-20261014    clang-22   cocci
x86_64                randconfig-2104-20261015    clang-22   cocci
x86_64                randconfig-2105-20261014    clang-22   cocci
x86_64                randconfig-2105-20261015    clang-22   cocci
x86_64                randconfig-2200-20261014    clang-22   smatch
x86_64                randconfig-2200-20261015    clang-22   smatch
x86_64                randconfig-2300-20261014    clang-22   sparse
x86_64                randconfig-2300-20261015    gcc-14     sparse
x86_64                randconfig-2301-20261014    clang-22   sparse
x86_64                randconfig-2301-20261015    gcc-14     sparse
x86_64                randconfig-2302-20261014    clang-22   sparse
x86_64                randconfig-2302-20261015    gcc-14     sparse
x86_64               randconfig-r2200-20261015    clang-22   smatch
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
xtensa                 generic_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-1000-20261016    clang-24
xtensa                randconfig-1000-20261017    gcc-15.2.0
xtensa                randconfig-1001-20261016    clang-24
xtensa                randconfig-1001-20261017    gcc-15.2.0
xtensa                randconfig-2000-20261014    gcc-14.3.0
xtensa                randconfig-2000-20261015    gcc-15.2.0
xtensa                randconfig-2001-20261014    gcc-14.3.0
xtensa                randconfig-2001-20261015    gcc-15.2.0
xtensa               randconfig-r2111-20261015    gcc-16.1.0 cocci
xtensa               randconfig-r2202-20261015    gcc-11.5.0 smatch

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
