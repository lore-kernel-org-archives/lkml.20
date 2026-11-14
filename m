Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794622462;
	b=BB1XJ4dJDDe18KZgdr9iXsAyPIbm9NoE2KmO69+HTsb0Odku95XGj2TLoscDozizXQj7
	 uDryvr7Gyfet9YZSWpt/C4QAerv4QHOerpDl+6jNxHiNJ8Z8YnyaI3grKI7zCAlMzjC47
	 wmvwsyFZw1Z8A7jzXbPIsi4Lh1gdxUiv+1z4Qix5BL+BSZauUiKDBSl8/NIxbAMDBGVjv
	 kQb31yFCi7dTD2OjTPfiznXijioPsKpEvSbWpFCAUHE2lHJN1eLpAh7xmUBDuyPuvbcam
	 JmM3FHCcOg8Vl/jgu/1rYxaxjI3OJUgsK66ImTxEkbwNo7pu96q0aDE79mWnZC0LuJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622462;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ArVympu90SvA/qcp4anjV2YreH/elKCh1SnvfYM63Qw=;
	b=zz8sJ3jLLuR6CEdggnepd4sDQtvbnu+uC27/mjxaPq2eGi0HhP5Gzuxc/EiIiHFpJhU+
	 nNvhU3trTorrpWpv1nXel0i8T9R36t6VRl1DX2MnST8ra11q+mA6+8Sy6RZwcPxOnOXJ5
	 FNWy5Cndt/7pT3PSL+onQpIb4Z50ZKU58le4HDNy6W2ZLy+nJ+XTbT4hP1lxIePCap7Nv
	 GdtNUWTmyGgsrrZqYbbgQ/mbmbyi5J/3B1a4ZuIDTu5BaZBk0uRz3MzCqD580nOppmE80
	 peFu2HaIl3a5ddRQgrVBrps4iH0dFlC6CBvENy9pAIm9QjxdVtelvGmiyES17yrPUxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jU+xhIR9;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDC9606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FDC9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jU+xhIR9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794622462; x=1826158462;
  h=date:from:to:cc:subject:message-id;
  bh=f4CM/hNLneZTAk+93C3Xc0ZRIQNIJilKnK7tfyEHDic=;
  b=jU+xhIR9Pyy5ivZB33VCZWQBLDOnb6d31Rg1btxWo7yeRCSobgkILEX7
   3QqsEfua0bIhQbt+q5KP4w22bbldRua9JMxxXkt0tKiu+1mCLW2qulmqz
   zzY6MlbWSyg55SKCKRbS9Lduex+V+DbzNLJ4DU9kX6UsatT35lE1+7gcd
   UKfaP+8pgI+5FZB9a1m6zxBKZsxAvIWh+rZy7WP3Qekg6ku7oVs2ny/JN
   ha7xZoaVbiaseN5BaAzzVc8z62ez1iL5OLcHHOj+LiS3Cb3kcH3AlACRB
   KHDk+Ak44/y7lIKXziz9KKrVxCg5GuXLx8w34QgNIFNyOG93x4Ff6rmIj
   A==;
X-CSE-ConnectionGUID: 7dDNyCnHRWO2HUWedzVy/Q==
X-CSE-MsgGUID: 4jsTpG5aREaSwY/TBxHDbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3438808"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3438808"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 18:14:21 -0800
X-CSE-ConnectionGUID: xRnLClEZSCC4RCkOjD53ow==
X-CSE-MsgGUID: b5IepXsSTvaESkEZBEnbfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9149261"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2026 18:14:19 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS3HU-000000014jM-47xs;
	Sat, 14 Nov 2026 02:14:16 +0000
Date: Sat, 14 Nov 2026 10:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:urgent] BUILD SUCCESS
 3b4c98b47ba7c3c57bcf54fb85f54a854622041c
Message-ID: <20261114101405.jYaYF4vI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 3b4c98b47ba7c3c57bcf54fb85f54a854622041c  x86/video: Preserve the default VGA fallback for legacy modes

elapsed time: 1163m

configs tested: 281
configs skipped: 97

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                               allmodconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                             hsdk_defconfig    clang-24
arc                   randconfig-1000-20261113    gcc-10.5.0
arc                   randconfig-1000-20261114    clang-24
arc                   randconfig-1001-20261113    gcc-10.5.0
arc                   randconfig-1001-20261114    clang-24
arc                         vdk_hs38_defconfig    gcc-16.2.0
arm                               alldefconfig    clang-24
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                               allyesconfig    gcc-16.2.0
arm                      am200epdkit_defconfig    gcc-16.2.0
arm                        aspeed_g5_defconfig    clang-24
arm                          assabet_defconfig    gcc-16.2.0
arm                          bcm2835_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                           moxart_defconfig    clang-24
arm                             mps2_defconfig    clang-24
arm                         multi_v5_defconfig    clang-24
arm                          mv78xx0_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261113    gcc-10.5.0
arm                   randconfig-1000-20261114    clang-24
arm                   randconfig-1001-20261113    gcc-10.5.0
arm                   randconfig-1001-20261114    clang-24
arm                   randconfig-1002-20261113    gcc-10.5.0
arm                   randconfig-1002-20261114    clang-24
arm                   randconfig-1003-20261113    gcc-10.5.0
arm                   randconfig-1003-20261114    clang-24
arm                            sama7_defconfig    gcc-16.2.0
arm                            stm32_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261113    gcc-15.3.0
arm64                 randconfig-1000-20261114    gcc-16.2.0
arm64                 randconfig-1001-20261113    gcc-15.3.0
arm64                 randconfig-1001-20261114    gcc-16.2.0
arm64                 randconfig-1002-20261113    gcc-15.3.0
arm64                 randconfig-1002-20261114    gcc-16.2.0
arm64                 randconfig-1003-20261113    gcc-15.3.0
arm64                 randconfig-1003-20261114    gcc-16.2.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261113    gcc-15.3.0
csky                  randconfig-1000-20261114    gcc-16.2.0
csky                  randconfig-1001-20261113    gcc-15.3.0
csky                  randconfig-1001-20261114    gcc-16.2.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261114    clang-24
hexagon               randconfig-1001-20261114    clang-24
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261113    clang-22
i386        buildonly-randconfig-1001-20261113    clang-22
i386        buildonly-randconfig-1002-20261113    clang-22
i386        buildonly-randconfig-1003-20261113    clang-22
i386        buildonly-randconfig-1004-20261113    clang-22
i386        buildonly-randconfig-1005-20261113    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261113    clang-22
i386                  randconfig-1001-20261113    clang-22
i386                  randconfig-1002-20261113    clang-22
i386                  randconfig-1003-20261113    clang-22
i386                  randconfig-1004-20261113    clang-22
i386                  randconfig-1005-20261113    clang-22
i386                  randconfig-1006-20261113    clang-22
i386                  randconfig-1007-20261113    clang-22
i386                  randconfig-1007-20261114    clang-22
i386                  randconfig-1008-20261113    clang-22
i386                  randconfig-1008-20261114    clang-22
i386                  randconfig-1009-20261113    clang-22
i386                  randconfig-1009-20261114    clang-22
i386                  randconfig-1010-20261113    clang-22
i386                  randconfig-1010-20261114    clang-22
i386                  randconfig-1011-20261113    clang-22
i386                  randconfig-1011-20261114    clang-22
i386                  randconfig-1012-20261113    clang-22
i386                  randconfig-1012-20261114    clang-22
i386                  randconfig-1013-20261113    clang-22
i386                  randconfig-1013-20261114    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261114    clang-24
loongarch             randconfig-1001-20261114    clang-24
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                          amcore_defconfig    clang-24
m68k                          amcore_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                         m5407c3_defconfig    clang-24
m68k                        m5475evb_defconfig    gcc-16.2.0
m68k                          nettel_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                           ath79_defconfig    gcc-16.2.0
mips                         bcm63xx_defconfig    gcc-16.2.0
mips                   decstation_64_defconfig    gcc-16.2.0
mips                            gcw0_defconfig    clang-24
mips                            ip27_defconfig    gcc-16.2.0
mips                            jazz_defconfig    clang-24
mips                       malta_kvm_defconfig    gcc-16.2.0
mips                       pic32mzda_defconfig    gcc-16.2.0
mips                         qi_lb60_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261114    clang-24
nios2                 randconfig-1001-20261114    clang-24
openrisc                          alldefconfig    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc                   or1klitex_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261114    gcc-8.5.0
parisc                randconfig-1001-20261114    gcc-8.5.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    clang-24
powerpc                       cm5200_defconfig    clang-24
powerpc                        eiger_defconfig    gcc-16.2.0
powerpc                       ep88xc_defconfig    gcc-16.2.0
powerpc                   iss476-smp_defconfig    clang-24
powerpc                      mpc5200_defconfig    clang-24
powerpc                  mpc8313_rdb_defconfig    gcc-16.2.0
powerpc                     mvme5100_defconfig    clang-24
powerpc                       pcm030_defconfig    gcc-16.2.0
powerpc                       ppc6xx_defconfig    clang-24
powerpc               randconfig-1000-20261114    gcc-8.5.0
powerpc               randconfig-1001-20261114    gcc-8.5.0
powerpc                   storcenter_defconfig    clang-24
powerpc                   storcenter_defconfig    gcc-16.2.0
powerpc                      stx_gp3_defconfig    gcc-16.2.0
powerpc                       tqm8xx_defconfig    gcc-16.2.0
powerpc                  xes_mpc85xx_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261114    gcc-8.5.0
powerpc64             randconfig-1001-20261114    gcc-8.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261113    gcc-12.5.0
riscv                 randconfig-1000-20261114    gcc-15.3.0
riscv                 randconfig-1001-20261113    gcc-12.5.0
riscv                 randconfig-1001-20261114    gcc-15.3.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261113    gcc-12.5.0
s390                  randconfig-1000-20261114    gcc-15.3.0
s390                  randconfig-1001-20261113    gcc-12.5.0
s390                  randconfig-1001-20261114    gcc-15.3.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7705_defconfig    gcc-16.2.0
sh                                j2_defconfig    clang-24
sh                      magicpanelr2_defconfig    clang-24
sh                           r7780mp_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261113    gcc-12.5.0
sh                    randconfig-1000-20261114    gcc-15.3.0
sh                    randconfig-1001-20261113    gcc-12.5.0
sh                    randconfig-1001-20261114    gcc-15.3.0
sh                    rts7751r2dplus_defconfig    gcc-16.2.0
sh                            se7619_defconfig    gcc-16.2.0
sparc                             alldefconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261113    gcc-8.5.0
sparc                 randconfig-1000-20261114    gcc-12.5.0
sparc                 randconfig-1001-20261113    gcc-8.5.0
sparc                 randconfig-1001-20261114    gcc-12.5.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261113    gcc-8.5.0
sparc64               randconfig-1000-20261114    gcc-12.5.0
sparc64               randconfig-1001-20261113    gcc-8.5.0
sparc64               randconfig-1001-20261114    gcc-12.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261113    gcc-8.5.0
um                    randconfig-1000-20261114    gcc-12.5.0
um                    randconfig-1001-20261113    gcc-8.5.0
um                    randconfig-1001-20261114    gcc-12.5.0
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261113    clang-22
x86_64      buildonly-randconfig-1000-20261114    gcc-14
x86_64      buildonly-randconfig-1001-20261113    clang-22
x86_64      buildonly-randconfig-1001-20261114    gcc-14
x86_64      buildonly-randconfig-1002-20261113    clang-22
x86_64      buildonly-randconfig-1002-20261114    gcc-14
x86_64      buildonly-randconfig-1003-20261113    clang-22
x86_64      buildonly-randconfig-1003-20261114    gcc-14
x86_64      buildonly-randconfig-1004-20261113    clang-22
x86_64      buildonly-randconfig-1004-20261114    gcc-14
x86_64      buildonly-randconfig-1005-20261113    clang-22
x86_64      buildonly-randconfig-1005-20261114    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261113    clang-22
x86_64                randconfig-1000-20261114    gcc-14
x86_64                randconfig-1001-20261113    clang-22
x86_64                randconfig-1001-20261114    gcc-14
x86_64                randconfig-1002-20261113    clang-22
x86_64                randconfig-1002-20261114    gcc-14
x86_64                randconfig-1003-20261113    clang-22
x86_64                randconfig-1003-20261114    gcc-14
x86_64                randconfig-1004-20261113    clang-22
x86_64                randconfig-1004-20261114    gcc-14
x86_64                randconfig-1005-20261113    clang-22
x86_64                randconfig-1005-20261114    gcc-14
x86_64                randconfig-1006-20261113    clang-22
x86_64                randconfig-1006-20261114    gcc-14
x86_64                randconfig-1007-20261113    clang-22
x86_64                randconfig-1007-20261114    gcc-14
x86_64                randconfig-1008-20261113    clang-22
x86_64                randconfig-1008-20261114    gcc-14
x86_64                randconfig-1009-20261113    clang-22
x86_64                randconfig-1009-20261114    gcc-14
x86_64                randconfig-1010-20261113    clang-22
x86_64                randconfig-1010-20261114    gcc-14
x86_64                randconfig-1011-20261113    clang-22
x86_64                randconfig-1011-20261114    gcc-14
x86_64                randconfig-1012-20261113    gcc-14
x86_64                randconfig-1012-20261114    clang-22
x86_64                randconfig-1013-20261113    gcc-14
x86_64                randconfig-1013-20261114    clang-22
x86_64                randconfig-1014-20261113    gcc-14
x86_64                randconfig-1014-20261114    clang-22
x86_64                randconfig-1015-20261113    gcc-14
x86_64                randconfig-1015-20261114    clang-22
x86_64                randconfig-1016-20261113    gcc-14
x86_64                randconfig-1016-20261114    clang-22
x86_64                randconfig-1017-20261113    gcc-14
x86_64                randconfig-1017-20261114    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                            allyesconfig    gcc-11.5.0
xtensa                           iss_defconfig    clang-24
xtensa                randconfig-1000-20261113    gcc-8.5.0
xtensa                randconfig-1000-20261114    gcc-12.5.0
xtensa                randconfig-1001-20261113    gcc-8.5.0
xtensa                randconfig-1001-20261114    gcc-12.5.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
