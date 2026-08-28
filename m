Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D25448CE6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917476; cv=none; b=I/M76HdsQBuDUGhoJIYmhZMHJkH0yMnc6PMPdil1mwEKZY7brBLaMoiOxvr2426pLUKyrbezpsHO+u7G6PA758G3Az5jLd4Xs+Weasyt53PhT0AVfwnVSBswqhztBgq15FamiuaxHHCSR+SvA7jppvEFD2s122gJozA75eXhm3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917476; c=relaxed/simple;
	bh=jUOgm8EeJcnSkTBkLPS0Jjpj/1dOyY+Z4K1Uqy7sR2I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oEoULN3UmAxnbdLD/QawAdkiG2oF/gDCgHANCl2MpzOu6NdjDJ1g5UudK6jNzLcHj5E9TU86clewEJ7FsHfgINNmYfAYwS+9ZBlajHXiIasW9vvCXoqXQlJXy+gtDZekihRglGQQhMBx29lRHsx/tLfnx2+FyVVzhD9qRwZ1AKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZozmEGtH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZozmEGtH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787917454; x=1819453454;
  h=date:from:to:cc:subject:message-id;
  bh=jUOgm8EeJcnSkTBkLPS0Jjpj/1dOyY+Z4K1Uqy7sR2I=;
  b=ZozmEGtHsT93b1C97XXAhLUOjedEZY7ZJyiCQyouJUqUf44vjmg/SPjL
   dNIfA01vHiB+jo45gNf0jhBNJarflIBqxeSU4uMIU6P8nv+cEreQq30sy
   OogltpT+rZ2MwfBYGL+eXgGZstinNAPLv4h1IxWoac/qt7US+M9fOY8VL
   di9EkEPBtT71RkJwkhkCRRzyFGB8TJ3ukpKMfSdmTCRDzYBUoTTCD8tCJ
   dUmEmjUnT6n5ZAa4YV0Fpuuf1RsdNJlNlXAEIhayAE0uWojQ5ib+Yb+u+
   gz9hnyp8+goj07IDy0M1mDmffI87OwlYpElJuqtqsP+RcvkFV0HwyHBTS
   A==;
X-CSE-ConnectionGUID: n6BlwPC9QCGmHl27Amf4lw==
X-CSE-MsgGUID: L/sKQxUdT62kp+C7pQGZgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99938597"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="99938597"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 04:44:11 -0700
X-CSE-ConnectionGUID: NBRD4/O9Rpac30rymcQRjw==
X-CSE-MsgGUID: 9qwi2gQyQI2GUD+BAhUQvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="265530373"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Aug 2026 04:44:09 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzv0A-00000000Azl-3kNF;
	Fri, 28 Aug 2026 11:44:06 +0000
Date: Fri, 28 Aug 2026 19:43:50 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 d2f36b6e31d423d9331596b1095267157c433ae8
Message-ID: <202608281935.ezCp1ihN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: d2f36b6e31d423d9331596b1095267157c433ae8  Merge branch into tip/master: 'timers/urgent'

elapsed time: 1434m

configs tested: 260
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-14
arc                              allmodconfig    clang-24
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-14
arc                              allyesconfig    clang-24
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-16.1.0
arc                   randconfig-001-20260828    clang-17
arc                   randconfig-001-20260828    gcc-16.1.0
arc                            randconfig-002    gcc-16.1.0
arc                   randconfig-002-20260828    clang-17
arc                   randconfig-002-20260828    gcc-16.1.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-14
arm                              allyesconfig    clang-24
arm                              allyesconfig    gcc-16.1.0
arm                       aspeed_g5_defconfig    gcc-16.1.0
arm                         axm55xx_defconfig    gcc-16.1.0
arm                          collie_defconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                            mmp2_defconfig    gcc-16.1.0
arm                       multi_v4t_defconfig    gcc-16.1.0
arm                        mvebu_v5_defconfig    gcc-16.1.0
arm                        neponset_defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260828    clang-17
arm                   randconfig-001-20260828    gcc-16.1.0
arm                            randconfig-002    gcc-16.1.0
arm                   randconfig-002-20260828    clang-17
arm                   randconfig-002-20260828    gcc-16.1.0
arm                            randconfig-003    gcc-16.1.0
arm                   randconfig-003-20260828    clang-17
arm                   randconfig-003-20260828    gcc-16.1.0
arm                            randconfig-004    gcc-16.1.0
arm                   randconfig-004-20260828    clang-17
arm                   randconfig-004-20260828    gcc-16.1.0
arm                       spear13xx_defconfig    gcc-16.1.0
arm                       versatile_defconfig    gcc-16.1.0
arm                         vf610m4_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-14
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-24
arm64                 randconfig-001-20260828    clang-14
arm64                 randconfig-001-20260828    clang-24
arm64                          randconfig-002    clang-24
arm64                 randconfig-002-20260828    clang-14
arm64                 randconfig-002-20260828    clang-24
arm64                          randconfig-003    clang-24
arm64                 randconfig-003-20260828    clang-14
arm64                 randconfig-003-20260828    clang-24
arm64                          randconfig-004    clang-24
arm64                 randconfig-004-20260828    clang-14
arm64                 randconfig-004-20260828    clang-24
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-24
csky                  randconfig-001-20260828    clang-14
csky                  randconfig-001-20260828    clang-24
csky                           randconfig-002    clang-24
csky                  randconfig-002-20260828    clang-14
csky                  randconfig-002-20260828    clang-24
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260828    clang-18
hexagon               randconfig-002-20260828    clang-18
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260828    clang-22
i386        buildonly-randconfig-002-20260828    clang-22
i386        buildonly-randconfig-003-20260828    clang-22
i386        buildonly-randconfig-004-20260828    clang-22
i386        buildonly-randconfig-005-20260828    clang-22
i386        buildonly-randconfig-006-20260828    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260828    gcc-14
i386                  randconfig-002-20260828    gcc-14
i386                  randconfig-003-20260828    gcc-14
i386                  randconfig-004-20260828    gcc-14
i386                  randconfig-005-20260828    gcc-14
i386                  randconfig-006-20260828    gcc-14
i386                  randconfig-007-20260828    gcc-14
i386                  randconfig-011-20260828    gcc-14
i386                  randconfig-012-20260828    gcc-14
i386                  randconfig-013-20260828    gcc-14
i386                  randconfig-014-20260828    gcc-14
i386                  randconfig-015-20260828    gcc-14
i386                  randconfig-016-20260828    gcc-14
i386                  randconfig-017-20260828    gcc-14
loongarch                        allmodconfig    clang-14
loongarch                        allmodconfig    clang-24
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-14
loongarch                           defconfig    clang-24
loongarch                loongson32_defconfig    gcc-16.1.0
loongarch             randconfig-001-20260828    clang-18
loongarch             randconfig-002-20260828    clang-18
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-14
m68k                             allyesconfig    clang-24
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-14
m68k                                defconfig    clang-24
m68k                          multi_defconfig    gcc-16.1.0
microblaze                       alldefconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-14
microblaze                          defconfig    clang-24
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                     decstation_defconfig    gcc-16.1.0
mips                     loongson2k_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-14
nios2                             allnoconfig    clang-24
nios2                               defconfig    clang-14
nios2                               defconfig    clang-24
nios2                 randconfig-001-20260828    clang-18
nios2                 randconfig-002-20260828    clang-18
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-14
openrisc                          allnoconfig    clang-24
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-14
parisc                            allnoconfig    clang-24
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-9.5.0
parisc                randconfig-001-20260828    gcc-9.5.0
parisc                         randconfig-002    gcc-9.5.0
parisc                randconfig-002-20260828    gcc-9.5.0
parisc64                            defconfig    clang-14
parisc64                            defconfig    clang-24
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-14
powerpc                           allnoconfig    clang-24
powerpc                 canyonlands_defconfig    gcc-16.1.0
powerpc                       holly_defconfig    gcc-16.1.0
powerpc                  iss476-smp_defconfig    gcc-16.1.0
powerpc                   lite5200b_defconfig    gcc-16.1.0
powerpc                     mpc5200_defconfig    gcc-16.1.0
powerpc                     powernv_defconfig    gcc-16.1.0
powerpc                        randconfig-001    gcc-9.5.0
powerpc               randconfig-001-20260828    gcc-9.5.0
powerpc                        randconfig-002    gcc-9.5.0
powerpc               randconfig-002-20260828    gcc-9.5.0
powerpc                        warp_defconfig    gcc-16.1.0
powerpc                         wii_defconfig    gcc-16.1.0
powerpc64                      randconfig-001    gcc-9.5.0
powerpc64             randconfig-001-20260828    gcc-9.5.0
powerpc64                      randconfig-002    gcc-9.5.0
powerpc64             randconfig-002-20260828    gcc-9.5.0
riscv                            allmodconfig    clang-14
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-14
riscv                             allnoconfig    clang-24
riscv                            allyesconfig    clang-14
riscv                            allyesconfig    clang-24
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260828    clang-17
riscv                 randconfig-002-20260828    clang-17
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-14
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260828    clang-17
s390                  randconfig-002-20260828    clang-17
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-14
sh                                allnoconfig    clang-24
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260828    clang-17
sh                    randconfig-002-20260828    clang-17
sh                   rts7751r2dplus_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-14
sparc                             allnoconfig    clang-24
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260828    gcc-9.5.0
sparc                 randconfig-002-20260828    gcc-9.5.0
sparc                       sparc64_defconfig    gcc-16.1.0
sparc64                          alldefconfig    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260828    gcc-9.5.0
sparc64               randconfig-002-20260828    gcc-9.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-14
um                                allnoconfig    clang-24
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260828    gcc-9.5.0
um                    randconfig-002-20260828    gcc-9.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-14
x86_64                            allnoconfig    clang-24
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    gcc-14
x86_64      buildonly-randconfig-001-20260828    gcc-14
x86_64               buildonly-randconfig-002    gcc-14
x86_64      buildonly-randconfig-002-20260828    gcc-14
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260828    gcc-14
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260828    gcc-14
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260828    gcc-14
x86_64               buildonly-randconfig-006    gcc-14
x86_64      buildonly-randconfig-006-20260828    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260828    gcc-14
x86_64                randconfig-002-20260828    gcc-14
x86_64                randconfig-003-20260828    gcc-14
x86_64                randconfig-004-20260828    gcc-14
x86_64                randconfig-005-20260828    gcc-14
x86_64                randconfig-006-20260828    gcc-14
x86_64                randconfig-011-20260828    clang-22
x86_64                randconfig-012-20260828    clang-22
x86_64                randconfig-013-20260828    clang-22
x86_64                randconfig-014-20260828    clang-22
x86_64                randconfig-015-20260828    clang-22
x86_64                randconfig-016-20260828    clang-22
x86_64                randconfig-071-20260828    clang-22
x86_64                randconfig-072-20260828    clang-22
x86_64                randconfig-073-20260828    clang-22
x86_64                randconfig-074-20260828    clang-22
x86_64                randconfig-075-20260828    clang-22
x86_64                randconfig-076-20260828    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-14
xtensa                            allnoconfig    clang-24
xtensa                           allyesconfig    clang-20
xtensa                  audio_kc705_defconfig    gcc-16.1.0
xtensa                  cadence_csp_defconfig    gcc-16.1.0
xtensa                          iss_defconfig    gcc-16.1.0
xtensa                randconfig-001-20260828    gcc-9.5.0
xtensa                randconfig-002-20260828    gcc-9.5.0
xtensa                    smp_lx200_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
