Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4697299931
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788069304; cv=none; b=bfwCVY+p72c10OpR6vn28Pcjjr1fITzxBWKDRe8/Qx39naBRJJ9LOyBJ/oNTyLDN8j7l/ATgwfPVNJegaUGfKytK+jc0Q8ZnuF/NzA/yK5gimln+hEHH6JuUsHTv13UKPp9QUhJWsadA2T4xK1TylgRs5tOaCZLFiuBFmwVYr/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788069304; c=relaxed/simple;
	bh=zKPlg/4Cdb/+stRF/3BDKpiDjOLBmRt9+8CHfktQBpM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M8ntn+K7ZOCqBmimE4TbxPQUxe3NeeoZ8xkpiDaDB9KWbPXhSRNK4wvfUuW1Wi+WwjxCha8cMBmfzqyU7LbecKOXLbfvxkUWSvuQUXi20uvkUffV0lGHAZUjF/sLjqFLw7+/20dq3co8voqpv2NoRGq3eYepqcZ7l1UGUnvmTNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTOJXYhh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTOJXYhh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788069302; x=1819605302;
  h=date:from:to:cc:subject:message-id;
  bh=zKPlg/4Cdb/+stRF/3BDKpiDjOLBmRt9+8CHfktQBpM=;
  b=HTOJXYhhb8u/bSB2Kbxy75/6OdCh6nYMS+lhgL3x3AnTAh7im4aADKjb
   VeoHe8rC2N9nRZ4sjJJCWBR4heDvImXzMnAVQM4FGD0v3jgeGndUCEEeJ
   omjv37XWEmcOUHyGMSWOLTOtzpeNyngZlyBuk0OQ7yC8e35sLrsrNh7lj
   XE/zp8N0CNTxCM5/XCwamie0pq4ES8+gYBenDDWNmgdlNS+EXRD7edsTD
   jxh4QHWFmuU20iMPUGsEy36AGFzFC1mnPXVCWlncOKUusb80v+hDTJuik
   epl0Z3toV7wjOSYM56WDtnZ1bjCG5szlTmnkj/eu4FYSCJEpn/2zbIZAe
   A==;
X-CSE-ConnectionGUID: ccqIVXjrSVKvStleg+hKZA==
X-CSE-MsgGUID: epNLtxVDT9OYbuvFlbLdhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="92198579"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="92198579"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 22:55:02 -0700
X-CSE-ConnectionGUID: rLJGYA6KRMOaflHPJBAS1g==
X-CSE-MsgGUID: kbtT+5NIQ/2yLj4z7MiFEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="293320389"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Aug 2026 22:55:00 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0YVN-00000000Dc8-1Vn5;
	Sun, 30 Aug 2026 05:54:57 +0000
Date: Sun, 30 Aug 2026 13:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 652d8bb42a854ebf7cf5e719a515535a00ea1e30
Message-ID: <202608301313.Dj7epRbr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 652d8bb42a854ebf7cf5e719a515535a00ea1e30  Merge branch into tip/master: 'timers/urgent'

elapsed time: 750m

configs tested: 176
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
arc                   randconfig-001-20260830    gcc-15.2.0
arc                   randconfig-002-20260830    gcc-15.2.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-24
arm                                 defconfig    gcc-16.1.0
arm                           omap1_defconfig    clang-24
arm                   randconfig-001-20260830    gcc-15.2.0
arm                   randconfig-002-20260830    gcc-15.2.0
arm                   randconfig-003-20260830    gcc-15.2.0
arm                   randconfig-004-20260830    gcc-15.2.0
arm                          sp7021_defconfig    clang-24
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260830    gcc-16.1.0
arm64                 randconfig-002-20260830    gcc-16.1.0
arm64                 randconfig-003-20260830    gcc-16.1.0
arm64                 randconfig-004-20260830    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260830    gcc-16.1.0
csky                  randconfig-002-20260830    gcc-16.1.0
hexagon                          allmodconfig    clang-24
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260830    clang-22
i386        buildonly-randconfig-002-20260830    clang-22
i386        buildonly-randconfig-003-20260830    clang-22
i386        buildonly-randconfig-004-20260830    clang-22
i386        buildonly-randconfig-005-20260830    clang-22
i386        buildonly-randconfig-006-20260830    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260830    clang-22
i386                  randconfig-002-20260830    clang-22
i386                  randconfig-003-20260830    clang-22
i386                  randconfig-004-20260830    clang-22
i386                  randconfig-005-20260830    clang-22
i386                  randconfig-006-20260830    clang-22
i386                  randconfig-007-20260830    clang-22
i386                  randconfig-011-20260830    gcc-14
i386                  randconfig-012-20260830    gcc-14
i386                  randconfig-013-20260830    gcc-14
i386                  randconfig-014-20260830    gcc-14
i386                  randconfig-015-20260830    gcc-14
i386                  randconfig-016-20260830    gcc-14
i386                  randconfig-017-20260830    gcc-14
loongarch                        allmodconfig    clang-24
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-24
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-24
m68k                         apollo_defconfig    gcc-16.1.0
m68k                                defconfig    clang-24
m68k                          sun3x_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-24
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                     cu1830-neo_defconfig    gcc-16.1.0
mips                    maltaup_xpa_defconfig    gcc-16.1.0
mips                           xway_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-24
nios2                               defconfig    clang-24
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-24
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-24
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260830    gcc-13.4.0
parisc                randconfig-002-20260830    gcc-13.4.0
parisc64                            defconfig    clang-24
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-24
powerpc                    gamecube_defconfig    gcc-16.1.0
powerpc                     kmeter1_defconfig    clang-24
powerpc                 linkstation_defconfig    gcc-16.1.0
powerpc                     mpc5200_defconfig    clang-24
powerpc                     mpc83xx_defconfig    clang-24
powerpc               randconfig-001-20260830    gcc-13.4.0
powerpc               randconfig-002-20260830    gcc-13.4.0
powerpc64             randconfig-001-20260830    gcc-13.4.0
powerpc64             randconfig-002-20260830    gcc-13.4.0
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-24
riscv                            allyesconfig    clang-24
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260830    gcc-16.1.0
riscv                 randconfig-002-20260830    gcc-16.1.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-24
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260830    gcc-16.1.0
s390                  randconfig-002-20260830    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-24
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    gcc-16.1.0
sh                    randconfig-001-20260830    gcc-16.1.0
sh                    randconfig-002-20260830    gcc-16.1.0
sh                           se7705_defconfig    clang-24
sh                           se7722_defconfig    clang-24
sh                           sh2007_defconfig    clang-24
sparc                             allnoconfig    clang-24
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260830    gcc-14.3.0
sparc                 randconfig-002-20260830    gcc-14.3.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260830    gcc-14.3.0
sparc64               randconfig-002-20260830    gcc-14.3.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-24
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260830    gcc-14.3.0
um                    randconfig-002-20260830    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-24
x86_64                           allyesconfig    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260830    gcc-14
x86_64                randconfig-002-20260830    gcc-14
x86_64                randconfig-003-20260830    gcc-14
x86_64                randconfig-004-20260830    gcc-14
x86_64                randconfig-005-20260830    gcc-14
x86_64                randconfig-006-20260830    gcc-14
x86_64                randconfig-011-20260830    clang-22
x86_64                randconfig-012-20260830    clang-22
x86_64                randconfig-013-20260830    clang-22
x86_64                randconfig-014-20260830    clang-22
x86_64                randconfig-015-20260830    clang-22
x86_64                randconfig-016-20260830    clang-22
x86_64                randconfig-071-20260830    gcc-14
x86_64                randconfig-072-20260830    gcc-14
x86_64                randconfig-073-20260830    gcc-14
x86_64                randconfig-074-20260830    gcc-14
x86_64                randconfig-075-20260830    gcc-14
x86_64                randconfig-076-20260830    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-24
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260830    gcc-14.3.0
xtensa                randconfig-002-20260830    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
