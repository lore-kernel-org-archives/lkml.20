Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034DF538D94
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656325; cv=none; b=Bn1wDU8sLU8GRA2cAqvl3sUHsFqD5eldWeJKzzI9fnh1F0B4w7AU5QHxFxYQvULpPIhumdK5O3p2F0Q0lvMo6s+A21bVS0DgXi2hkK69iurc88dq66gw2RHXm1X0m63JPith0vOUV1UfegJ1SynR3kR17rmbYNXGQ2cCkrNKVPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656325; c=relaxed/simple;
	bh=peJ9EWFfO2r1rwSg2M3ma2xakqIBQjz7J2kDgl8Kz2w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cI9o5UwOjVgpyDrdX+aJti4RaZiB+u9rYUmPwJQG4v0c8ub1ZZ6LbfrYzN4O7otK5Qs8uhM25xWV/Zmy3w6Zw6l9+ucSMxRj0/9IRzJtHUOsR0nNeg/SJPrtP13+Gj4M0yHlkrg9MbS+cL2v7EzWIQMAVZPMRTi1aw/8hnRC7WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mh0GXVRc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mh0GXVRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789656317; x=1821192317;
  h=date:from:to:cc:subject:message-id;
  bh=peJ9EWFfO2r1rwSg2M3ma2xakqIBQjz7J2kDgl8Kz2w=;
  b=Mh0GXVRcogSK9qSDMdrFRr67wMhvVUGvMztYk1ztH15+YFWOI/XfZVlV
   V3jx+Xw0q5KzBREE1SwgGPRL1DGv64XQd643MD4G+LqrnTWWNoNt1SAKX
   sEKOWGiKsxja7pCSjPfwLowxV9rOZKo8UvgfD8UxERrTqQu9NE5keKsxb
   SRgWU1WvdMFj9DLqCF9jNBg1e+FVpIaipULnj5wz9xhBbm/m1+X6t87Hs
   ZPzXpgaaeiQrFhT3Nez6zqNUA3Quxja3F8+fSKvfeggMRm3hUMpwmNgNV
   hnZhSm+DY/M9rUGSazilLfW46oYFWsWsjxK0lgfT4hFCI5t8MdtzeBxBU
   Q==;
X-CSE-ConnectionGUID: Y138OAGuTQif8+X27oorwg==
X-CSE-MsgGUID: gMZ0+jsmRRSKGNrHF99Rjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115621770"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115621770"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:45:12 -0700
X-CSE-ConnectionGUID: 0V4vrz8nSRCR51Hd0kT/mw==
X-CSE-MsgGUID: 8JPN3s7fT0qjJ5f7BTVS2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297333165"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Sep 2026 07:45:06 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7DMF-0000000080i-3VL7;
	Thu, 17 Sep 2026 14:45:03 +0000
Date: Thu, 17 Sep 2026 22:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:cleanups] BUILD SUCCESS
 c8beda268a6b21910d1325584ce1d45bce4f22f0
Message-ID: <202609172230.51YedI7b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cleanups
branch HEAD: c8beda268a6b21910d1325584ce1d45bce4f22f0  x86/mtrr: Fix kernel-doc notation of amd_set_mtrr()

elapsed time: m

configs tested: 201
configs skipped: 112

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r1306-20260917    clang-24   sparse
arc                                allnoconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260917    gcc-15.2.0
arc                   randconfig-1001-20260917    gcc-15.2.0
arc                  randconfig-r1302-20260917    gcc-8.5.0  sparse
arc                  randconfig-r1303-20260917    gcc-8.5.0  sparse
arc                  randconfig-r1305-20260917    gcc-8.5.0  sparse
arc                            tb10x_defconfig    gcc-16.1.0
arc                         vdk_hs38_defconfig    clang-24
arm                                allnoconfig    gcc-16.1.0
arm                        aspeed_g4_defconfig    gcc-16.1.0
arm                          assabet_defconfig    clang-24
arm                          at91_dt_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                        imx_v6_v7_defconfig    gcc-16.1.0
arm                          nhk8815_defconfig    clang-24
arm                          orion5x_defconfig    clang-24
arm                   randconfig-1000-20260917    gcc-15.2.0
arm                   randconfig-1001-20260917    gcc-15.2.0
arm                   randconfig-1002-20260917    gcc-15.2.0
arm                   randconfig-1003-20260917    gcc-15.2.0
arm                  randconfig-r1300-20260917    clang-24   sparse
arm                  randconfig-r1304-20260917    clang-24   sparse
arm                          s5pv210_defconfig    clang-24
arm64                             alldefconfig    gcc-16.1.0
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260917    gcc-11.5.0
arm64                 randconfig-1001-20260917    gcc-11.5.0
arm64                 randconfig-1002-20260917    gcc-11.5.0
arm64                 randconfig-1003-20260917    gcc-11.5.0
arm64                randconfig-r1306-20260917    clang-18   sparse
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260917    gcc-11.5.0
csky                  randconfig-1001-20260917    gcc-11.5.0
csky                 randconfig-r1308-20260917    clang-24   sparse
csky                 randconfig-r1309-20260917    clang-18   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260917    clang-24
hexagon               randconfig-1001-20260917    clang-24
hexagon              randconfig-r1301-20260917    gcc-8.5.0  sparse
hexagon              randconfig-r1304-20260917    gcc-8.5.0  sparse
hexagon              randconfig-r1305-20260917    clang-24   sparse
hexagon              randconfig-r1307-20260917    clang-18   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260917    gcc-13
i386        buildonly-randconfig-1001-20260917    gcc-13
i386        buildonly-randconfig-1002-20260917    gcc-13
i386        buildonly-randconfig-1003-20260917    gcc-13
i386        buildonly-randconfig-1004-20260917    gcc-13
i386        buildonly-randconfig-1005-20260917    gcc-13
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260917    clang-22
i386                  randconfig-1001-20260917    clang-22
i386                  randconfig-1002-20260917    clang-22
i386                  randconfig-1003-20260917    clang-22
i386                  randconfig-1004-20260917    clang-22
i386                  randconfig-1005-20260917    clang-22
i386                  randconfig-1006-20260917    clang-22
i386                  randconfig-1007-20260917    clang-22
i386                  randconfig-1008-20260917    clang-22
i386                  randconfig-1009-20260917    clang-22
i386                  randconfig-1010-20260917    clang-22
i386                  randconfig-1011-20260917    clang-22
i386                  randconfig-1012-20260917    clang-22
i386                  randconfig-1013-20260917    clang-22
i386                  randconfig-1300-20260917    gcc-14     sparse
i386                  randconfig-1301-20260917    gcc-14     sparse
i386                  randconfig-1302-20260917    gcc-14     sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260917    clang-24
loongarch             randconfig-1001-20260917    clang-24
loongarch            randconfig-r1307-20260917    clang-24   sparse
m68k                               allnoconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                         mvme147_defconfig    clang-24
m68k                           sun3x_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                           ath25_defconfig    clang-24
mips                          cobalt_defconfig    gcc-16.1.0
mips                            gcw0_defconfig    clang-24
mips                            ip27_defconfig    gcc-16.1.0
mips                         omega2p_defconfig    clang-24
mips                 randconfig-r1301-20260917    clang-24   sparse
mips                 randconfig-r1309-20260917    clang-24   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260917    clang-24
nios2                 randconfig-1001-20260917    clang-24
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r1300-20260917    gcc-8.5.0  sparse
openrisc             randconfig-r1308-20260917    clang-18   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260917    gcc-11.5.0
parisc                randconfig-1001-20260917    gcc-11.5.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                        ebony_defconfig    clang-24
powerpc                           g5_defconfig    clang-24
powerpc               randconfig-1000-20260917    gcc-11.5.0
powerpc               randconfig-1001-20260917    gcc-11.5.0
powerpc64             randconfig-1000-20260917    gcc-11.5.0
powerpc64             randconfig-1001-20260917    gcc-11.5.0
riscv                              allnoconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv              nommu_k210_sdcard_defconfig    clang-24
riscv                 randconfig-1000-20260917    clang-17
riscv                 randconfig-1001-20260917    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260917    clang-17
s390                  randconfig-1001-20260917    clang-17
s390                 randconfig-r1303-20260917    clang-24   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                   defconfig    gcc-14
sh                           lboxre2_defconfig    clang-24
sh                    randconfig-1000-20260917    clang-17
sh                    randconfig-1001-20260917    clang-17
sh                            se7750_defconfig    clang-24
sh                    sh7724_generic_defconfig    clang-24
sh                             shmin_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260917    clang-17
sparc                 randconfig-1001-20260917    clang-17
sparc                randconfig-r1302-20260917    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260917    clang-17
sparc64               randconfig-1001-20260917    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260917    clang-17
um                    randconfig-1001-20260917    clang-17
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260917    gcc-14
x86_64      buildonly-randconfig-1001-20260917    gcc-14
x86_64      buildonly-randconfig-1002-20260917    gcc-14
x86_64      buildonly-randconfig-1003-20260917    gcc-14
x86_64      buildonly-randconfig-1004-20260917    gcc-14
x86_64      buildonly-randconfig-1005-20260917    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260917    clang-22
x86_64                randconfig-1001-20260917    clang-22
x86_64                randconfig-1002-20260917    clang-22
x86_64                randconfig-1003-20260917    clang-22
x86_64                randconfig-1004-20260917    clang-22
x86_64                randconfig-1005-20260917    clang-22
x86_64                randconfig-1006-20260917    clang-22
x86_64                randconfig-1007-20260917    clang-22
x86_64                randconfig-1008-20260917    clang-22
x86_64                randconfig-1009-20260917    clang-22
x86_64                randconfig-1010-20260917    clang-22
x86_64                randconfig-1011-20260917    clang-22
x86_64                randconfig-1012-20260917    clang-22
x86_64                randconfig-1013-20260917    clang-22
x86_64                randconfig-1014-20260917    clang-22
x86_64                randconfig-1015-20260917    clang-22
x86_64                randconfig-1016-20260917    clang-22
x86_64                randconfig-1017-20260917    clang-22
x86_64                randconfig-1300-20260917    gcc-14     sparse
x86_64                randconfig-1301-20260917    gcc-14     sparse
x86_64                randconfig-1302-20260917    gcc-14     sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20260917    clang-17
xtensa                randconfig-1001-20260917    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
