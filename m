Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E74547059
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790539368; cv=none; b=RAiVLWY2T4d/IU5BEKhmf3iqoCShDaH71nmtZKEi/cALuBiAdnNjcnpnZYZrB4VQGIiRfbNZDJNgCJffHQidZ79rq77yRuGKkWKWJA53NS7qje/ipYtqgD28N2qbPJVGgxIPB9g0HNs2PdGve3PC64FwksODKZqmK0m06Aa6ImU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790539368; c=relaxed/simple;
	bh=TQ2cA79fH3HVP6ucT/peFmrAOpaTIOy3Yhn/EbsXy40=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N/2R2yrgR523si1rUPhjkWNGjGQlnxTViamT/5AVz5MKYzpkdWLeLUEfvzTZwihhHKOfLDA0Nb8U9eHkX05khEDAlR2bVrtZKz6qNvb8XgBtniv0U9i5pwLgpdN6Nsi/60dC+Dy/+UFTdOKft17mrsc9pXFFNZbvQA4eIbbrJsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShyZ31UX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShyZ31UX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790539366; x=1822075366;
  h=date:from:to:cc:subject:message-id;
  bh=TQ2cA79fH3HVP6ucT/peFmrAOpaTIOy3Yhn/EbsXy40=;
  b=ShyZ31UXCGs5ezqxgLxSXv+x/PhBKkZcsfGdoM3a+ncVm/iZt0s1XqdV
   gWwUTGWKMLkNLT+NXRbI5kMp1BZRUccDoiK9i7Yo1Jvk2YNofP+jP57aV
   6w0S+VLotpG/qfenQRMVzWkHhWN0TKKJYxqNEy5YmnhrVENZ+/qoRsrPj
   IdMHl/qUB6AJpGYu+OuH3Ioo6s8wV7SmVAxL12Rq9bKn0L71YzSnEtiBr
   uxajQuCKhj97XV+KEA1ZkogSguSwas4b+xImPqeIJkY8T/HjHqersSJtk
   25Y+qUlzSPSKJf3UxPfmx3Xe8VWJa7dmnIEXm3xRyp/36Cq2XBA/cAjBJ
   A==;
X-CSE-ConnectionGUID: wtrkHUIHTS2OVwoUWfSboQ==
X-CSE-MsgGUID: g3ALjAt4TE6m57dFgg3yYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90199662"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="90199662"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 13:02:45 -0700
X-CSE-ConnectionGUID: G2nqOoY0SaK5Nyy+JMdZrQ==
X-CSE-MsgGUID: VJY+lBVuRc+D1cPT6WU/jQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Sep 2026 13:02:43 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAv57-00000000N86-1alM;
	Sun, 27 Sep 2026 20:02:41 +0000
Date: Mon, 28 Sep 2026 04:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:fpu] BUILD SUCCESS
 67639ee98521c1592190c5c67047067a9c3a3fd5
Message-ID: <202609280410.RNOmimGO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/fpu
branch HEAD: 67639ee98521c1592190c5c67047067a9c3a3fd5  x86/fpu: Remove unnecessary checks for X86_FEATURE_FPU

elapsed time: 2182m

configs tested: 229
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                           axs103_defconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                  nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260927    gcc-11.5.0
arc                   randconfig-1000-20260928    clang-24
arc                   randconfig-1001-20260927    gcc-11.5.0
arc                   randconfig-1001-20260928    clang-24
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                       jornada720_defconfig    clang-24
arm                   randconfig-1000-20260927    gcc-11.5.0
arm                   randconfig-1000-20260928    clang-24
arm                   randconfig-1001-20260927    gcc-11.5.0
arm                   randconfig-1001-20260928    clang-24
arm                   randconfig-1002-20260927    gcc-11.5.0
arm                   randconfig-1002-20260928    clang-24
arm                   randconfig-1003-20260927    gcc-11.5.0
arm                   randconfig-1003-20260928    clang-24
arm                           sp7021_defconfig    gcc-11.5.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260927    clang-17
arm64                 randconfig-1001-20260927    clang-17
arm64                 randconfig-1002-20260927    clang-17
arm64                 randconfig-1003-20260927    clang-17
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260927    clang-17
csky                  randconfig-1001-20260927    clang-17
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260927    gcc-11.5.0
hexagon               randconfig-1000-20260928    gcc-8.5.0
hexagon               randconfig-1001-20260927    gcc-11.5.0
hexagon               randconfig-1001-20260928    gcc-8.5.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260927    clang-22
i386        buildonly-randconfig-1001-20260927    clang-22
i386        buildonly-randconfig-1002-20260927    clang-22
i386        buildonly-randconfig-1003-20260927    clang-22
i386        buildonly-randconfig-1004-20260927    clang-22
i386        buildonly-randconfig-1005-20260927    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260927    clang-22
i386                  randconfig-1001-20260927    clang-22
i386                  randconfig-1002-20260927    clang-22
i386                  randconfig-1003-20260927    clang-22
i386                  randconfig-1004-20260927    clang-22
i386                  randconfig-1005-20260927    clang-22
i386                  randconfig-1006-20260927    clang-22
i386                  randconfig-1007-20260927    gcc-14
i386                  randconfig-1008-20260927    gcc-14
i386                  randconfig-1009-20260927    gcc-14
i386                  randconfig-1010-20260927    gcc-14
i386                  randconfig-1011-20260927    gcc-14
i386                  randconfig-1012-20260927    gcc-14
i386                  randconfig-1013-20260927    gcc-14
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260927    gcc-11.5.0
loongarch             randconfig-1000-20260928    gcc-8.5.0
loongarch             randconfig-1001-20260927    gcc-11.5.0
loongarch             randconfig-1001-20260928    gcc-8.5.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    gcc-11.5.0
m68k                         m5407c3_defconfig    clang-24
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         bcm47xx_defconfig    gcc-11.5.0
mips                   cavium_octeon_defconfig    gcc-16.1.0
mips                            ip22_defconfig    clang-24
mips                        lemote2f_defconfig    gcc-16.1.0
mips                 malta_qemu_32r6_defconfig    clang-24
nios2                             alldefconfig    gcc-11.5.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260927    gcc-11.5.0
nios2                 randconfig-1000-20260928    gcc-8.5.0
nios2                 randconfig-1001-20260927    gcc-11.5.0
nios2                 randconfig-1001-20260928    gcc-8.5.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260927    clang-24
parisc                randconfig-1000-20260928    clang-24
parisc                randconfig-1001-20260927    clang-24
parisc                randconfig-1001-20260928    clang-24
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                   iss476-smp_defconfig    clang-24
powerpc               randconfig-1000-20260927    clang-24
powerpc               randconfig-1000-20260928    clang-24
powerpc               randconfig-1001-20260927    clang-24
powerpc               randconfig-1001-20260928    clang-24
powerpc                      taishan_defconfig    clang-24
powerpc                      tqm8541_defconfig    gcc-11.5.0
powerpc                      tqm8541_defconfig    gcc-16.1.0
powerpc                      tqm8548_defconfig    gcc-11.5.0
powerpc                      tqm8555_defconfig    gcc-11.5.0
powerpc                      tqm8560_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260927    clang-24
powerpc64             randconfig-1000-20260928    clang-24
powerpc64             randconfig-1001-20260927    clang-24
powerpc64             randconfig-1001-20260928    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260927    gcc-16.1.0
riscv                 randconfig-1000-20260928    clang-24
riscv                 randconfig-1001-20260927    gcc-16.1.0
riscv                 randconfig-1001-20260928    clang-24
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                           debug_defconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260927    gcc-16.1.0
s390                  randconfig-1000-20260928    clang-24
s390                  randconfig-1001-20260927    gcc-16.1.0
s390                  randconfig-1001-20260928    clang-24
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                             migor_defconfig    clang-24
sh                           polaris_defconfig    gcc-16.1.0
sh                           r7780mp_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260927    gcc-16.1.0
sh                    randconfig-1000-20260928    clang-24
sh                    randconfig-1001-20260927    gcc-16.1.0
sh                    randconfig-1001-20260928    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260927    clang-24
sparc                 randconfig-1000-20260928    clang-17
sparc                 randconfig-1001-20260927    clang-24
sparc                 randconfig-1001-20260928    clang-17
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260927    clang-24
sparc64               randconfig-1000-20260928    clang-17
sparc64               randconfig-1001-20260927    clang-24
sparc64               randconfig-1001-20260928    clang-17
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260927    clang-24
um                    randconfig-1000-20260928    clang-17
um                    randconfig-1001-20260927    clang-24
um                    randconfig-1001-20260928    clang-17
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260927    gcc-14
x86_64      buildonly-randconfig-1001-20260927    gcc-14
x86_64      buildonly-randconfig-1002-20260927    gcc-14
x86_64      buildonly-randconfig-1003-20260927    gcc-14
x86_64      buildonly-randconfig-1004-20260927    gcc-14
x86_64      buildonly-randconfig-1005-20260927    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260927    clang-22
x86_64                randconfig-1000-20260928    gcc-14
x86_64                randconfig-1001-20260927    clang-22
x86_64                randconfig-1001-20260928    gcc-14
x86_64                randconfig-1002-20260927    clang-22
x86_64                randconfig-1002-20260928    gcc-14
x86_64                randconfig-1003-20260927    clang-22
x86_64                randconfig-1003-20260928    gcc-14
x86_64                randconfig-1004-20260927    clang-22
x86_64                randconfig-1004-20260928    gcc-14
x86_64                randconfig-1005-20260927    clang-22
x86_64                randconfig-1005-20260928    gcc-14
x86_64                randconfig-1006-20260927    clang-22
x86_64                randconfig-1007-20260927    clang-22
x86_64                randconfig-1008-20260927    clang-22
x86_64                randconfig-1009-20260927    clang-22
x86_64                randconfig-1010-20260927    clang-22
x86_64                randconfig-1011-20260927    clang-22
x86_64                randconfig-1012-20260927    clang-22
x86_64                randconfig-1013-20260927    clang-22
x86_64                randconfig-1014-20260927    clang-22
x86_64                randconfig-1015-20260927    clang-22
x86_64                randconfig-1016-20260927    clang-22
x86_64                randconfig-1017-20260927    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20260927    clang-24
xtensa                randconfig-1000-20260928    clang-17
xtensa                randconfig-1001-20260927    clang-24
xtensa                randconfig-1001-20260928    clang-17
xtensa                     smp_lx200_defconfig    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
