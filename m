Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4741E1DF0
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789175020; cv=none; b=d/bDA0W3oVkNZ/U63wc3UqEC/2lRJM0PYC/QylYve7QwRCwzoOQIbOLlN7woXNvDUuuYLVd8T/Ze+h/qW9RyFHk4SuEYRNqnJtSYYbbkg9whUV2D/rNxYncTdUtKMCSkJaiCUxTiO8uzx0WjCuPyyM3x83f6wNDCICpTzz5cEMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789175020; c=relaxed/simple;
	bh=5fRUb6HjBa79och68Pc05gbuvSLe85uLyo2SC0AhrLI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l+DMUAu8cruiMmRoMExGRxz+snyObet3zySkjo2cQKhTuaIXh0d3UKDWRk6rabP908JZCd+wIDL3xr/wgOlcVobQ7MyNdldH8uLeDiqX5tfKubuAVbT9K1kOq3CKTRZphvEK6ljmimE5UUS3VxJf1gkKQAeJgrXceedf4q/mxNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbfzioHi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbfzioHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789175018; x=1820711018;
  h=date:from:to:cc:subject:message-id;
  bh=5fRUb6HjBa79och68Pc05gbuvSLe85uLyo2SC0AhrLI=;
  b=fbfzioHi69LW1hHIulOEMPL9szqz7NjxZkAp28PtqWcob8Tqm/WXl2Mc
   AdsuCtr4zGWWGQIbjXzTGtqqVnREZfHFNXURx0FvRKPD8zKG0NVjL2SBZ
   OH1UhOmcDaQlORE7TmAUWT/iwL16SZdzwTPxa86lyLZwA+CGeSZXLnXBf
   zSH5+MtoMODz3DJdoy/0fA1GsnimapfR3JJ3P6Nyuia9gd4TCULLKzT2J
   XuZAHN4/ej/NoiDULHH0F4VZsEmdJzUZVe6Hqhe9vkNkoX/iI5tEhPAiN
   hi9Y09lZSI2SJjQTWkD/Q9u2AkCPnsf9O2WeSTYW4Vgaj1SY5fYJ2v1Op
   Q==;
X-CSE-ConnectionGUID: BLGlU0bBSVG3xwHutQ2d3w==
X-CSE-MsgGUID: RHaOTzFvROGjsRZVHkE4dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89650892"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89650892"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 18:03:38 -0700
X-CSE-ConnectionGUID: z3WBQoPYSl29aILGGcd23A==
X-CSE-MsgGUID: gekKPoytRmCeHAH4A4s/xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="295562823"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Sep 2026 18:03:36 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5C9N-000000002TO-2mNx;
	Sat, 12 Sep 2026 01:03:27 +0000
Date: Sat, 12 Sep 2026 09:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:non-rcu:next] BUILD SUCCESS
 d60bdc990308754af31c1860fffadf3de8c00025
Message-ID: <202609120934.YOC3QLjF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git non-rcu/next
branch HEAD: d60bdc990308754af31c1860fffadf3de8c00025  Merge branches 'csd-lock.2026.09.03a', 'hazptr.2026.09.03a' and 'hrtimer_sleeper.2026.09.03a' into HEAD

elapsed time: 1478m

configs tested: 247
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-24
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-24
arc                          axs103_defconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260911    clang-24
arc                   randconfig-002-20260911    clang-24
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-24
arm                       aspeed_g5_defconfig    gcc-16.1.0
arm                        clps711x_defconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                          pxa3xx_defconfig    gcc-16.1.0
arm                   randconfig-001-20260911    clang-24
arm                   randconfig-002-20260911    clang-24
arm                   randconfig-003-20260911    clang-24
arm                   randconfig-004-20260911    clang-24
arm                           sama7_defconfig    gcc-16.1.0
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
hexagon               randconfig-001-20260911    gcc-12.5.0
hexagon               randconfig-001-20260912    clang-24
hexagon               randconfig-002-20260911    gcc-12.5.0
hexagon               randconfig-002-20260912    clang-24
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260911    clang-22
i386        buildonly-randconfig-001-20260912    gcc-14
i386        buildonly-randconfig-002-20260911    clang-22
i386        buildonly-randconfig-002-20260912    gcc-14
i386        buildonly-randconfig-003-20260911    clang-22
i386        buildonly-randconfig-003-20260912    gcc-14
i386        buildonly-randconfig-004-20260911    clang-22
i386        buildonly-randconfig-004-20260912    gcc-14
i386        buildonly-randconfig-005-20260911    clang-22
i386        buildonly-randconfig-005-20260912    gcc-14
i386        buildonly-randconfig-006-20260911    clang-22
i386        buildonly-randconfig-006-20260912    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260911    clang-22
i386                  randconfig-002-20260911    clang-22
i386                  randconfig-003-20260911    clang-22
i386                  randconfig-004-20260911    clang-22
i386                  randconfig-005-20260911    clang-22
i386                  randconfig-006-20260911    clang-22
i386                  randconfig-007-20260911    clang-22
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
loongarch             randconfig-001-20260911    gcc-12.5.0
loongarch             randconfig-001-20260912    clang-24
loongarch             randconfig-002-20260911    gcc-12.5.0
loongarch             randconfig-002-20260912    clang-24
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-24
m68k                                defconfig    clang-24
m68k                       m5235evb_defconfig    gcc-16.1.0
m68k                       m5275evb_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-24
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                     decstation_defconfig    gcc-16.1.0
mips                      fuloong2e_defconfig    gcc-16.1.0
mips                      loongson1_defconfig    gcc-16.1.0
mips                      loongson3_defconfig    gcc-16.1.0
mips                       rbtx49xx_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-24
nios2                               defconfig    clang-24
nios2                 randconfig-001-20260911    gcc-12.5.0
nios2                 randconfig-001-20260912    clang-24
nios2                 randconfig-002-20260911    gcc-12.5.0
nios2                 randconfig-002-20260912    clang-24
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-24
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-24
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260911    gcc-8.5.0
parisc                randconfig-001-20260912    clang-24
parisc                randconfig-002-20260911    gcc-8.5.0
parisc                randconfig-002-20260912    clang-24
parisc64                         alldefconfig    gcc-16.1.0
parisc64                            defconfig    clang-24
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-24
powerpc                    amigaone_defconfig    gcc-16.1.0
powerpc                   lite5200b_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260911    gcc-8.5.0
powerpc               randconfig-001-20260912    clang-24
powerpc               randconfig-002-20260911    gcc-8.5.0
powerpc               randconfig-002-20260912    clang-24
powerpc                  storcenter_defconfig    gcc-16.1.0
powerpc                      tqm8xx_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260911    gcc-8.5.0
powerpc64             randconfig-001-20260912    clang-24
powerpc64             randconfig-002-20260911    gcc-8.5.0
powerpc64             randconfig-002-20260912    clang-24
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-24
riscv                            allyesconfig    clang-24
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260911    gcc-16.1.0
riscv                 randconfig-001-20260912    gcc-11.5.0
riscv                 randconfig-002-20260911    gcc-16.1.0
riscv                 randconfig-002-20260912    gcc-11.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                          debug_defconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260911    gcc-16.1.0
s390                  randconfig-001-20260912    gcc-11.5.0
s390                  randconfig-002-20260911    gcc-16.1.0
s390                  randconfig-002-20260912    gcc-11.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-24
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260911    gcc-16.1.0
sh                    randconfig-001-20260912    gcc-11.5.0
sh                    randconfig-002-20260911    gcc-16.1.0
sh                    randconfig-002-20260912    gcc-11.5.0
sh                      rts7751r2d1_defconfig    gcc-16.1.0
sh                   rts7751r2dplus_defconfig    gcc-16.1.0
sh                           se7206_defconfig    gcc-16.1.0
sh                           se7722_defconfig    gcc-16.1.0
sh                             shx3_defconfig    gcc-16.1.0
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
x86_64                randconfig-012-20260911    gcc-14
x86_64                randconfig-013-20260911    gcc-14
x86_64                randconfig-014-20260911    gcc-14
x86_64                randconfig-015-20260911    gcc-14
x86_64                randconfig-016-20260911    gcc-14
x86_64                randconfig-071-20260911    gcc-14
x86_64                randconfig-071-20260912    gcc-14
x86_64                randconfig-072-20260911    gcc-14
x86_64                randconfig-072-20260912    gcc-14
x86_64                randconfig-073-20260911    gcc-14
x86_64                randconfig-073-20260912    gcc-14
x86_64                randconfig-074-20260911    gcc-14
x86_64                randconfig-074-20260912    gcc-14
x86_64                randconfig-075-20260911    gcc-14
x86_64                randconfig-075-20260912    gcc-14
x86_64                randconfig-076-20260911    gcc-14
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
