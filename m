Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBBD3BFAF7
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789204514; cv=none; b=Rkjv78CQJIW8mgeIdXM83qSVcmlOLcXJQUYUxh4tRIfxEeNR26KXi2JHWO247sAfO0goxMK9c+tlcBXg/ouS51DE4eNywbr+FeY80XramGw/+gXJKsiNYUoNJwyfVzDOF8HdoQX5J7+uQLh1LSAO7Ct3TReDdgyJ1oombO6hORQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789204514; c=relaxed/simple;
	bh=Fh/bBgJyBwaSTe9nnuTQMdOkcFhC3tAOkvAZyeumstU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qn3mBO/d5IsNyFnf+btNTHN+JKlGOc0xtuy3HuIfKC2BVLPB6VShp7P7JQrJJ4KfGtuWjTbZPyCziFqtNQWDOvtu4JGyqAXNaWTT5T4xOCQgNjbVYlalnYjE3jhBUQBT9h+fsU9WlnGGMhr2sDuIJ7cBNw7mv8uPS6ay0ugjT60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxu1+1ii; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxu1+1ii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789204512; x=1820740512;
  h=date:from:to:cc:subject:message-id;
  bh=Fh/bBgJyBwaSTe9nnuTQMdOkcFhC3tAOkvAZyeumstU=;
  b=lxu1+1ii+BYUD88Wbdn74bC/8oHPB4B7xjwLWpxLYLbDG+PUybspVunF
   +Un5pR/UUuEwz3tipYe1WwjwyZaLSXdsYBPVsf81kYOBdGxuTZjv+3hLm
   kXh9dUJGdYpFjtLQbrr9O9q8ekzJv3f6WQidNM2/PagrMYrUGoY4I2qCI
   r9bupGFDxDONVIW+zPe20ILIml/KOU4cNBwKgcFaczvTIvhRXxs7x5fll
   RtQO38v9/B+GAagaDoPjGjzeOtjPXdpBRegezuHBFtbF1WQn/znql8yNT
   rYTKL5R2bg2uZup84tMJSYCwxMIItA06yIHesFKt1SetsfIwFg2g7dbAC
   g==;
X-CSE-ConnectionGUID: NBfDx/khQtCI9/06FwxSuQ==
X-CSE-MsgGUID: CmcldPpYSuOt/2i4Soec6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="93521269"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="93521269"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 02:15:12 -0700
X-CSE-ConnectionGUID: 16GSCu38S+q/kUkeCA0IlQ==
X-CSE-MsgGUID: JN5mAdrbQh6U/deDsoE0Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="295638575"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Sep 2026 02:15:10 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5JpD-000000002oN-3HTj;
	Sat, 12 Sep 2026 09:15:07 +0000
Date: Sat, 12 Sep 2026 17:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 3d4279fce2cfb39dfa3477dd4fa5d484e98bfcd2
Message-ID: <202609121713.0PDHHxxs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 3d4279fce2cfb39dfa3477dd4fa5d484e98bfcd2  Merge branch into tip/master: 'x86/tdx'

elapsed time: 1482m

configs tested: 199
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
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260912    clang-17
arc                   randconfig-002-20260912    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-24
arm                         at91_dt_defconfig    clang-17
arm                                 defconfig    gcc-16.1.0
arm                            hisi_defconfig    clang-24
arm                      jornada720_defconfig    clang-24
arm                            mps2_defconfig    clang-24
arm                        mvebu_v7_defconfig    clang-24
arm                           omap1_defconfig    clang-17
arm                           omap1_defconfig    clang-24
arm                   randconfig-001-20260912    clang-17
arm                   randconfig-002-20260912    clang-17
arm                   randconfig-003-20260912    clang-17
arm                   randconfig-004-20260912    clang-17
arm                         s5pv210_defconfig    clang-17
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260912    gcc-15.2.0
arm64                 randconfig-002-20260912    gcc-15.2.0
arm64                 randconfig-003-20260912    gcc-15.2.0
arm64                 randconfig-004-20260912    gcc-15.2.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260912    gcc-15.2.0
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
i386                  randconfig-011-20260912    gcc-14
i386                  randconfig-012-20260912    gcc-14
i386                  randconfig-013-20260912    gcc-14
i386                  randconfig-014-20260912    gcc-14
i386                  randconfig-015-20260912    gcc-14
i386                  randconfig-016-20260912    gcc-14
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
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                  cavium_octeon_defconfig    clang-24
mips                     decstation_defconfig    gcc-16.1.0
mips                      fuloong2e_defconfig    gcc-16.1.0
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
powerpc                      arches_defconfig    clang-17
powerpc                   lite5200b_defconfig    gcc-16.1.0
powerpc                      mgcoge_defconfig    clang-17
powerpc                 mpc837x_rdb_defconfig    clang-17
powerpc                     mpc83xx_defconfig    clang-24
powerpc                      pasemi_defconfig    clang-17
powerpc                         ps3_defconfig    clang-17
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
sh                 kfr2r09-romimage_defconfig    clang-24
sh                    randconfig-001-20260912    gcc-11.5.0
sh                    randconfig-002-20260912    gcc-11.5.0
sh                      rts7751r2d1_defconfig    clang-24
sh                           se7206_defconfig    gcc-16.1.0
sh                           se7751_defconfig    clang-24
sparc                             allnoconfig    clang-24
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260912    gcc-14.3.0
sparc                 randconfig-002-20260912    gcc-14.3.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260912    gcc-14.3.0
sparc64               randconfig-002-20260912    gcc-14.3.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-24
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260912    gcc-14.3.0
um                    randconfig-002-20260912    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           alldefconfig    clang-24
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-24
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260912    gcc-14
x86_64      buildonly-randconfig-002-20260912    gcc-14
x86_64      buildonly-randconfig-003-20260912    gcc-14
x86_64      buildonly-randconfig-004-20260912    gcc-14
x86_64      buildonly-randconfig-005-20260912    gcc-14
x86_64      buildonly-randconfig-006-20260912    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260912    clang-22
x86_64                randconfig-002-20260912    clang-22
x86_64                randconfig-003-20260912    clang-22
x86_64                randconfig-004-20260912    clang-22
x86_64                randconfig-005-20260912    clang-22
x86_64                randconfig-006-20260912    clang-22
x86_64                randconfig-011-20260912    gcc-14
x86_64                randconfig-012-20260912    gcc-14
x86_64                randconfig-013-20260912    gcc-14
x86_64                randconfig-014-20260912    gcc-14
x86_64                randconfig-015-20260912    gcc-14
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
xtensa                randconfig-001-20260912    gcc-14.3.0
xtensa                randconfig-002-20260912    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
