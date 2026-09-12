Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8FA2C3251
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 04:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789186251; cv=none; b=FLYHCuGcLC8i8onJFYwPf3Tm0Meqd6f6PwjZg0G9uBVY8uTwbB8PQUi4jue41IfI6dcRL98BO/PIeK8eTYcdGeaxDdXuo8bYj6s6zpjahHZzftoAxNkRmlIBd+/omhGH/x4Gf9e0EgP7qt26LehkQQpv8qAZ7WcUAJnqQlsOoyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789186251; c=relaxed/simple;
	bh=BaeI6uPa3i7I/O9A9vfdYLrGsAdRoWevil7UIaJSC44=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ItD8oxRzRahlWKUTe5ocQD+Ph25jQYWV81aJE/TyYGKH0G4rRQkZ+cod96IzdFTurF4MlzFT6yXwlow9b5DBA94dGgwgz8nkwnLbBb9HjNOsxQ8+lNgU5SOPxO3Uy4FYn20Um2p+RmGwh1gyOZcY0g9dRHjSPAO8panYUMvOnFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sp8QuuzA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sp8QuuzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789186250; x=1820722250;
  h=date:from:to:cc:subject:message-id;
  bh=BaeI6uPa3i7I/O9A9vfdYLrGsAdRoWevil7UIaJSC44=;
  b=Sp8QuuzABKXd3UDvEiPjkVC39v7IjJHpm2uruhA7prIpM/DUbzLl/ruS
   NY8qs6BFvqSymqpiOTbE+KTpV2UWF4oO11vKZoWMZrsDxaMu/JGxhr4AV
   z8h7LKVIXae7NICyxNwCOd08VO+fD82Zy03FRO/hC0g5QQqsm2XzRpvGR
   Q2POHiWjhKyoOUO5RSz+7rNGt62+Uciy54eIGLLoXOZ8zyN+Qa37JAYJ4
   ULtI6J8h/yxwXiBT9djv2k4i0YfylB5gNMtM5jqCwJn5GPxOfBkl0uYND
   ZNz+CJ8teDh/cG4z6O9+OEahwyXHMlHjGG/CER+m4a4+D66v+QXXSCCFF
   A==;
X-CSE-ConnectionGUID: jqRf5ZIxTuWElH1iFTeDRg==
X-CSE-MsgGUID: a8KUoiwBRj+x+pKwA3LvNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="88785627"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="88785627"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 21:10:49 -0700
X-CSE-ConnectionGUID: hxlo6Gc0S+27ABEcu7lkrA==
X-CSE-MsgGUID: EMMM8JQ+SkS8glGBOGzllA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="272609969"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 11 Sep 2026 21:10:48 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5F4a-000000002ci-3Apg;
	Sat, 12 Sep 2026 04:10:42 +0000
Date: Sat, 12 Sep 2026 12:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers:urgent] BUILD SUCCESS
 c5dcb3aadc18d7b82ba64790721b005d18193d35
Message-ID: <202609121209.QLw6xt9L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
branch HEAD: c5dcb3aadc18d7b82ba64790721b005d18193d35  hrtimer: Use hard expiry when updating timers on the same base

elapsed time: 1175m

configs tested: 222
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-24
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-24
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260912    clang-17
arc                   randconfig-002-20260912    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-24
arm                                 defconfig    gcc-16.1.0
arm                            mps2_defconfig    clang-24
arm                   randconfig-001-20260912    clang-17
arm                   randconfig-002-20260912    clang-17
arm                   randconfig-003-20260912    clang-17
arm                   randconfig-004-20260912    clang-17
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260911    gcc-16.1.0
arm64                 randconfig-001-20260912    gcc-15.2.0
arm64                 randconfig-002-20260911    gcc-16.1.0
arm64                 randconfig-002-20260912    gcc-15.2.0
arm64                 randconfig-003-20260911    gcc-16.1.0
arm64                 randconfig-003-20260912    gcc-15.2.0
arm64                 randconfig-004-20260911    gcc-16.1.0
arm64                 randconfig-004-20260912    gcc-15.2.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260911    gcc-16.1.0
csky                  randconfig-001-20260912    gcc-15.2.0
csky                  randconfig-002-20260911    gcc-16.1.0
csky                  randconfig-002-20260912    gcc-15.2.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260912    clang-24
hexagon               randconfig-002-20260912    clang-24
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260912    gcc-14
i386        buildonly-randconfig-002-20260912    gcc-14
i386        buildonly-randconfig-003-20260912    gcc-14
i386        buildonly-randconfig-004-20260912    gcc-14
i386        buildonly-randconfig-005-20260912    gcc-14
i386        buildonly-randconfig-006-20260912    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260912    gcc-14
i386                  randconfig-002-20260912    gcc-14
i386                  randconfig-003-20260912    gcc-14
i386                  randconfig-004-20260912    gcc-14
i386                  randconfig-005-20260912    gcc-14
i386                  randconfig-006-20260912    gcc-14
i386                  randconfig-007-20260912    gcc-14
i386                  randconfig-011-20260911    clang-22
i386                  randconfig-011-20260912    gcc-14
i386                  randconfig-012-20260911    clang-22
i386                  randconfig-012-20260912    gcc-14
i386                  randconfig-013-20260911    clang-22
i386                  randconfig-013-20260912    gcc-14
i386                  randconfig-014-20260911    clang-22
i386                  randconfig-014-20260912    gcc-14
i386                  randconfig-015-20260911    clang-22
i386                  randconfig-015-20260912    gcc-14
i386                  randconfig-016-20260911    clang-22
i386                  randconfig-016-20260912    gcc-14
i386                  randconfig-017-20260911    clang-22
i386                  randconfig-017-20260912    gcc-14
loongarch                        allmodconfig    clang-24
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-24
loongarch             randconfig-001-20260912    clang-24
loongarch             randconfig-002-20260912    clang-24
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-24
m68k                                defconfig    clang-24
m68k                       m5235evb_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-24
microblaze                      mmu_defconfig    clang-24
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                     decstation_defconfig    clang-24
mips                     decstation_defconfig    gcc-16.1.0
mips                      fuloong2e_defconfig    gcc-16.1.0
mips                           gcw0_defconfig    clang-24
mips                           jazz_defconfig    clang-24
mips                       rbtx49xx_defconfig    clang-24
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-24
nios2                               defconfig    clang-24
nios2                 randconfig-001-20260912    clang-24
nios2                 randconfig-002-20260912    clang-24
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-24
openrisc                            defconfig    gcc-16.1.0
openrisc                 simple_smp_defconfig    clang-24
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-24
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                generic-64bit_defconfig    clang-24
parisc                randconfig-001-20260912    clang-24
parisc                randconfig-002-20260912    clang-24
parisc64                         alldefconfig    gcc-16.1.0
parisc64                            defconfig    clang-24
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-24
powerpc                    amigaone_defconfig    gcc-16.1.0
powerpc                        icon_defconfig    clang-24
powerpc                   lite5200b_defconfig    gcc-16.1.0
powerpc                     mpc5200_defconfig    clang-24
powerpc                     rainier_defconfig    clang-24
powerpc               randconfig-001-20260912    clang-24
powerpc               randconfig-002-20260912    clang-24
powerpc                  storcenter_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260912    clang-24
powerpc64             randconfig-002-20260912    clang-24
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-24
riscv                            allyesconfig    clang-24
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260912    gcc-11.5.0
riscv                 randconfig-002-20260912    gcc-11.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260912    gcc-11.5.0
s390                  randconfig-002-20260912    gcc-11.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-24
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260912    gcc-11.5.0
sh                    randconfig-002-20260912    gcc-11.5.0
sh                      rts7751r2d1_defconfig    clang-24
sh                           se7206_defconfig    gcc-16.1.0
sh                           se7751_defconfig    clang-24
sparc                             allnoconfig    clang-24
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260911    gcc-13.4.0
sparc                 randconfig-001-20260912    gcc-14.3.0
sparc                 randconfig-002-20260911    gcc-13.4.0
sparc                 randconfig-002-20260912    gcc-14.3.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260911    gcc-13.4.0
sparc64               randconfig-001-20260912    gcc-14.3.0
sparc64               randconfig-002-20260911    gcc-13.4.0
sparc64               randconfig-002-20260912    gcc-14.3.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-24
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260911    gcc-13.4.0
um                    randconfig-001-20260912    gcc-14.3.0
um                    randconfig-002-20260911    gcc-13.4.0
um                    randconfig-002-20260912    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           alldefconfig    clang-24
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-24
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260911    gcc-14
x86_64      buildonly-randconfig-001-20260912    gcc-14
x86_64      buildonly-randconfig-002-20260911    gcc-14
x86_64      buildonly-randconfig-002-20260912    gcc-14
x86_64      buildonly-randconfig-003-20260911    gcc-14
x86_64      buildonly-randconfig-003-20260912    gcc-14
x86_64      buildonly-randconfig-004-20260911    gcc-14
x86_64      buildonly-randconfig-004-20260912    gcc-14
x86_64      buildonly-randconfig-005-20260911    gcc-14
x86_64      buildonly-randconfig-005-20260912    gcc-14
x86_64      buildonly-randconfig-006-20260911    gcc-14
x86_64      buildonly-randconfig-006-20260912    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260911    clang-22
x86_64                randconfig-002-20260911    clang-22
x86_64                randconfig-003-20260911    clang-22
x86_64                randconfig-004-20260911    clang-22
x86_64                randconfig-005-20260911    clang-22
x86_64                randconfig-006-20260911    clang-22
x86_64                randconfig-011-20260911    gcc-14
x86_64                randconfig-011-20260912    gcc-14
x86_64                randconfig-012-20260911    gcc-14
x86_64                randconfig-012-20260912    gcc-14
x86_64                randconfig-013-20260911    gcc-14
x86_64                randconfig-013-20260912    gcc-14
x86_64                randconfig-014-20260911    gcc-14
x86_64                randconfig-014-20260912    gcc-14
x86_64                randconfig-015-20260911    gcc-14
x86_64                randconfig-015-20260912    gcc-14
x86_64                randconfig-016-20260911    gcc-14
x86_64                randconfig-016-20260912    gcc-14
x86_64                randconfig-071-20260912    gcc-14
x86_64                randconfig-072-20260912    gcc-14
x86_64                randconfig-073-20260912    gcc-14
x86_64                randconfig-074-20260912    gcc-14
x86_64                randconfig-075-20260912    gcc-14
x86_64                randconfig-076-20260912    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-24
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260911    gcc-13.4.0
xtensa                randconfig-001-20260912    gcc-14.3.0
xtensa                randconfig-002-20260911    gcc-13.4.0
xtensa                randconfig-002-20260912    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
