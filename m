Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196230;
	b=DRDYIgF/mWOfGjJeuRB2vnzdrhmxD6crIEmmBit1McPIksX3Z2RgZehb4bD41llvys93
	 9ZhRbTEoPeneJVb11WkCokFy4SS/YHe/s9coHCyGxgxLy1G/KyS6G4WKVLAMTEFYhaE/E
	 Y596LAfpdVyGccdlT+BPoGfnbCx4PeKK3Fwla3oNoLUdnUx/Q03T7Qtoq3z3ObW5HDbHt
	 GZ7x9RuJJQaTtnIq1HxLfUtXVToN+9EwA66C2rpUTkGpK+NzWVvovBTTDe7Qh1bOiwWOS
	 EHFJE1lV+Cy0RL60yAwIJy9w5Sl8yu6EV6gUqdUf33Be71t3ezmgsV6qrcBb8ruAKlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196230;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ehT+64+bV/zqbei34X2bLRBbve69g0JDYdM9idHr38s=;
	b=sxpF+taxra6kDbmqAfcVBw5R8sOD9bcErjq8qOfL9McHaXxNbjrXYEHbAVLcfg/FCTEx
	 pBGJdAiPmV8ffsRuR8eBOooLhcJEH+w+Kq9p8lbnjGEJ94CoKW3U4bQPE74EG6Amg27lq
	 1lHc990at0/jRNNe7a9AAqQVvacQwI9eFjxBJwFyOOHfokcJNgxGcmO854Q3kjqpVct+i
	 r1jrc+F6ErmgwEFBY27NgnHApxIzEf9LOkzWVni2ylTrWKrWHIIZSm29nJdxnkyZsUBha
	 PfeOae1bbnbyHIgS0SkB3QvzHNZGK5L+SD+DYx+/dZIIrZ2w66TbTg10zJ5CqR89Caw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WzRj00ua;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7226E606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7226E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WzRj00ua
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794196227; x=1825732227;
  h=date:from:to:cc:subject:message-id;
  bh=BIsVCppk7MeQ2ulqI1Dss8lDOQzQzR0i+jUNmCh9NIE=;
  b=WzRj00uayr0ybmYIrc/4WAi98uMJ+aYKbkSOW2QoADfToHOkHu4MVCq3
   QrhMUbVW9zxIUgt+uzSXp0QbunLDv/nr65efk8ekzUNSwpoGb2tuLp7o5
   UUo6CGoVh7V/MHNHubhUuQpEUJ03TsSd3dViuYEsVNh9NhJxja0AZ1iEt
   EVAFi/hpqKv4Uo8d0n0t/XN+bTpwmBuNBgsWJeNfj6kcWsqqm8eF49pHl
   HgsjHm9obKhZlqOB3NvmNAlxr6AXMAiIvQOvG9gS3s6qzHh7UwOTRhLv4
   KBVU8RvSOGkoF2OZXU/ePvKpdm2qkI49SdyrFZJ+XIs0fpl6ZqlqKJFKK
   A==;
X-CSE-ConnectionGUID: QfdxiP8EQY6+As0pxihzmg==
X-CSE-MsgGUID: DyrVr8RnThmipcWTBp/K/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3017646"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3017646"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 19:50:27 -0800
X-CSE-ConnectionGUID: CAQfD11xRLGB4itwhwf2Ng==
X-CSE-MsgGUID: 8BOkLrbmTw2jP4f3cZ9jFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8108438"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Nov 2026 19:50:26 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQGOk-00000000tqJ-3xhP;
	Mon, 09 Nov 2026 03:50:22 +0000
Date: Mon, 09 Nov 2026 11:49:57 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:core:rseq] BUILD SUCCESS
 9ad0f2d93caf9b1b70c3f239e72b241313caa21f
Message-ID: <20261109114957.e1dNMN2B-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/rseq
branch HEAD: 9ad0f2d93caf9b1b70c3f239e72b241313caa21f  selftests/rseq: Select only implemented architecture variants

elapsed time: 871m

configs tested: 276
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                           axs103_defconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261109    clang-24
arc                   randconfig-1001-20261109    clang-24
arc                         vdk_hs38_defconfig    clang-24
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    clang-17
arm                                  defconfig    gcc-16.2.0
arm                         mvebu_v7_defconfig    gcc-16.2.0
arm                          orion5x_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261109    clang-24
arm                   randconfig-1001-20261109    clang-24
arm                   randconfig-1002-20261109    clang-24
arm                   randconfig-1003-20261109    clang-24
arm                         shmobile_defconfig    clang-17
arm                           sp7021_defconfig    gcc-16.2.0
arm                         vexpress_defconfig    clang-19
arm                         vexpress_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261109    gcc-13.5.0
arm64                 randconfig-1001-20261109    gcc-13.5.0
arm64                 randconfig-1002-20261109    gcc-13.5.0
arm64                 randconfig-1003-20261109    gcc-13.5.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261109    gcc-13.5.0
csky                  randconfig-1001-20261109    gcc-13.5.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261109    clang-19
hexagon               randconfig-1001-20261109    clang-19
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261108    clang-22
i386        buildonly-randconfig-1000-20261109    clang-22
i386        buildonly-randconfig-1001-20261108    clang-22
i386        buildonly-randconfig-1001-20261109    clang-22
i386        buildonly-randconfig-1002-20261108    clang-22
i386        buildonly-randconfig-1002-20261109    clang-22
i386        buildonly-randconfig-1003-20261108    clang-22
i386        buildonly-randconfig-1003-20261109    clang-22
i386        buildonly-randconfig-1004-20261108    clang-22
i386        buildonly-randconfig-1004-20261109    clang-22
i386        buildonly-randconfig-1005-20261108    clang-22
i386        buildonly-randconfig-1005-20261109    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261109    gcc-14
i386                  randconfig-1001-20261109    gcc-14
i386                  randconfig-1002-20261109    gcc-14
i386                  randconfig-1003-20261109    gcc-14
i386                  randconfig-1004-20261109    gcc-14
i386                  randconfig-1005-20261109    gcc-14
i386                  randconfig-1006-20261109    gcc-14
i386                  randconfig-1007-20261108    clang-22
i386                  randconfig-1007-20261109    gcc-12
i386                  randconfig-1008-20261108    clang-22
i386                  randconfig-1008-20261109    gcc-12
i386                  randconfig-1009-20261108    clang-22
i386                  randconfig-1009-20261109    gcc-12
i386                  randconfig-1010-20261108    clang-22
i386                  randconfig-1010-20261109    gcc-12
i386                  randconfig-1011-20261108    clang-22
i386                  randconfig-1011-20261109    gcc-12
i386                  randconfig-1012-20261108    clang-22
i386                  randconfig-1012-20261109    gcc-12
i386                  randconfig-1013-20261108    clang-22
i386                  randconfig-1013-20261109    gcc-12
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261109    clang-19
loongarch             randconfig-1001-20261109    clang-19
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    clang-19
m68k                        m5235evb_defconfig    gcc-16.2.0
m68k                        m5475evb_defconfig    gcc-16.2.0
m68k                           multi_defconfig    clang-19
m68k                         mvme16x_defconfig    clang-17
m68k                          nettel_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                         bcm47xx_defconfig    gcc-16.2.0
mips                         bcm63xx_defconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    gcc-16.2.0
mips                      cu1000-neo_defconfig    gcc-16.2.0
mips                           eyeq5_defconfig    clang-17
mips                       fuloong2e_defconfig    gcc-16.2.0
mips                            gcw0_defconfig    gcc-16.2.0
mips                             gpr_defconfig    clang-24
mips                            ip28_defconfig    gcc-16.2.0
mips                        lemote2f_defconfig    gcc-16.2.0
mips                       loongson3_defconfig    gcc-16.2.0
mips                           rb532_defconfig    clang-17
mips                            xway_defconfig    clang-19
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261109    clang-19
nios2                 randconfig-1001-20261109    clang-19
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261108    clang-24
parisc                randconfig-1000-20261109    gcc-8.5.0
parisc                randconfig-1001-20261108    clang-24
parisc                randconfig-1001-20261109    gcc-8.5.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    gcc-16.2.0
powerpc                    bluestone_defconfig    clang-19
powerpc                       ep88xc_defconfig    clang-24
powerpc                  mpc8315_rdb_defconfig    gcc-16.2.0
powerpc                   mpc866_ads_defconfig    clang-17
powerpc                       ppc44x_defconfig    clang-19
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261108    clang-24
powerpc               randconfig-1000-20261109    gcc-8.5.0
powerpc               randconfig-1001-20261108    clang-24
powerpc               randconfig-1001-20261109    gcc-8.5.0
powerpc                      skiroot_defconfig    gcc-16.2.0
powerpc                      stx_gp3_defconfig    clang-19
powerpc                      stx_gp3_defconfig    clang-24
powerpc                      taishan_defconfig    clang-24
powerpc                       tqm8xx_defconfig    clang-24
powerpc64             randconfig-1000-20261108    clang-24
powerpc64             randconfig-1000-20261109    gcc-8.5.0
powerpc64             randconfig-1001-20261108    clang-24
powerpc64             randconfig-1001-20261109    gcc-8.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                                defconfig    gcc-16.2.0
riscv              nommu_k210_sdcard_defconfig    clang-19
riscv                 randconfig-1000-20261108    gcc-12.5.0
riscv                 randconfig-1000-20261109    gcc-8.5.0
riscv                 randconfig-1001-20261109    gcc-8.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261108    gcc-12.5.0
s390                  randconfig-1000-20261109    gcc-8.5.0
s390                  randconfig-1001-20261108    gcc-12.5.0
s390                  randconfig-1001-20261109    gcc-8.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                 ecovec24-romimage_defconfig    gcc-16.2.0
sh                              espt_defconfig    gcc-16.2.0
sh                             migor_defconfig    gcc-16.2.0
sh                           r7780mp_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261108    gcc-12.5.0
sh                    randconfig-1000-20261109    gcc-8.5.0
sh                    randconfig-1001-20261108    gcc-12.5.0
sh                    randconfig-1001-20261109    gcc-8.5.0
sh                           sdk7786_defconfig    gcc-16.2.0
sh                    secureedge5410_defconfig    gcc-16.2.0
sh                         sh7763rdp_defconfig    gcc-16.2.0
sh                   sh7785lcr_32bit_defconfig    clang-24
sh                              shx3_defconfig    clang-17
sh                             titan_defconfig    gcc-16.2.0
sh                               ul2_defconfig    clang-17
sh                           urquell_defconfig    gcc-16.2.0
sparc                             alldefconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261108    gcc-8.5.0
sparc                 randconfig-1000-20261109    gcc-8.5.0
sparc                 randconfig-1001-20261108    gcc-8.5.0
sparc                 randconfig-1001-20261109    gcc-8.5.0
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261108    gcc-8.5.0
sparc64               randconfig-1000-20261109    gcc-8.5.0
sparc64               randconfig-1001-20261108    gcc-8.5.0
sparc64               randconfig-1001-20261109    gcc-8.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261108    gcc-8.5.0
um                    randconfig-1000-20261109    gcc-8.5.0
um                    randconfig-1001-20261108    gcc-8.5.0
um                    randconfig-1001-20261109    gcc-8.5.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261108    gcc-14
x86_64      buildonly-randconfig-1000-20261109    clang-22
x86_64      buildonly-randconfig-1001-20261108    gcc-14
x86_64      buildonly-randconfig-1001-20261109    clang-22
x86_64      buildonly-randconfig-1002-20261108    gcc-14
x86_64      buildonly-randconfig-1002-20261109    clang-22
x86_64      buildonly-randconfig-1003-20261108    gcc-14
x86_64      buildonly-randconfig-1003-20261109    clang-22
x86_64      buildonly-randconfig-1004-20261108    gcc-14
x86_64      buildonly-randconfig-1004-20261109    clang-22
x86_64      buildonly-randconfig-1005-20261108    gcc-14
x86_64      buildonly-randconfig-1005-20261109    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261108    gcc-14
x86_64                randconfig-1000-20261109    clang-22
x86_64                randconfig-1001-20261108    gcc-14
x86_64                randconfig-1001-20261109    clang-22
x86_64                randconfig-1002-20261108    gcc-14
x86_64                randconfig-1002-20261109    clang-22
x86_64                randconfig-1003-20261108    gcc-14
x86_64                randconfig-1003-20261109    clang-22
x86_64                randconfig-1004-20261108    gcc-14
x86_64                randconfig-1004-20261109    clang-22
x86_64                randconfig-1005-20261108    gcc-14
x86_64                randconfig-1005-20261109    clang-22
x86_64                randconfig-1006-20261108    clang-22
x86_64                randconfig-1006-20261109    gcc-14
x86_64                randconfig-1007-20261108    clang-22
x86_64                randconfig-1007-20261109    gcc-14
x86_64                randconfig-1008-20261108    clang-22
x86_64                randconfig-1008-20261109    gcc-14
x86_64                randconfig-1009-20261108    clang-22
x86_64                randconfig-1009-20261109    gcc-14
x86_64                randconfig-1010-20261108    clang-22
x86_64                randconfig-1010-20261109    gcc-14
x86_64                randconfig-1011-20261108    clang-22
x86_64                randconfig-1011-20261109    gcc-14
x86_64                randconfig-1012-20261109    clang-22
x86_64                randconfig-1013-20261109    clang-22
x86_64                randconfig-1014-20261109    clang-22
x86_64                randconfig-1015-20261109    clang-22
x86_64                randconfig-1016-20261109    clang-22
x86_64                randconfig-1017-20261109    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                           iss_defconfig    clang-24
xtensa                randconfig-1000-20261108    gcc-8.5.0
xtensa                randconfig-1000-20261109    gcc-8.5.0
xtensa                randconfig-1001-20261108    gcc-8.5.0
xtensa                randconfig-1001-20261109    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
