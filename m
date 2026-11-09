Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196892;
	b=yKeM8g8kfIbWRpXc2tRnHxL6qDA23XFwWJK9Vtpz8HW5wTijkZ5P16efks6TUVZaziXo
	 qS1k/0/nSrkyDaa8fpcUX993Ug2WqCIyLcY2hOxdF5HazVUw/qXk0+aUXuLiQCEtKX+nX
	 vViH2XAPumOdpFTRinTczBMzykniUVH1B+Kb2r5JAW9lFgYIva0qGzUTvDVHf8aQGgHZc
	 cCM75bjaylZeu+TySaGsdkBxhw3dbWic11CiX+xHWhItvoFBVnr+tOJyEX9xw+Rl4x6CG
	 nAkLMtH62l/Z4YWQLvM0gnxr0xWaKhlKbUlm9YEhHkG+9B3k0XBcIncVRdT56PuSDYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196892;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=a2NzN9yjrHCfa9B74z/qCUIpnO2VL3dHbGFVF3v86FA=;
	b=jir568Qf0TQpcbNXcIBrumqQUZssvcXImCxNBSnUvNk/hpTCwG/qJGVzqY45kz8FZ8B0
	 6y+e/1hHA/xE6dz6kIOhxyMpl8aflXwgBc1aiJBcu3v3xoOzrCq4kD3a3H8gJuciDxO5X
	 sKKEu9O8GP1E/7FiKWLPkXvfD0k+4CuNd0O07MlowfEYcM3DLNLRC0OM9EUXKuw8wryjD
	 4jBwb5p2v9T8RMQOFrd+5/U8WdBpwnUGqr2YCzn7MTjhlvfwdUeG7hKjiEJxGT9N5DmJ5
	 +xMpmtVos79fHckdhdGuqoNX0P3VUG6iYRuL/RjCm0VxL9Dq31/wfbkO7rRHQfLQcrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hOWP8YEL;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320C2606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 320C2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hOWP8YEL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794196891; x=1825732891;
  h=date:from:to:cc:subject:message-id;
  bh=spolpPc11znRgSn4r994mU1Ibcc2chxJmtWBM91E4f8=;
  b=hOWP8YELFXZ5W/bCUX0FwhtTNLjNaPimU6mgtNJUNKvoCIbpKvJhlewc
   nW0uW1oUOm58kivTbggRQPmIiyKNR3Iky6dYu2GGMN7Luswf6TTkxY72N
   xOA0/xVm1hM3MZRXX2xfeBecu3YMgNOgbTVeIPnEu+E5hTMHoozI5v6uK
   rlkc2rKiaod8h3xmOSluIkP5ok8t9HNblYs3B7ZsGPrnY+RBsgmwB2gW2
   BtZS/S0FiuJwW3sTD0dec7UTTsnG6LM7lnXQJZkkMgGpLRXWKBZIzj3Aw
   w0DKoAqifG3uuR69Dbe1FEsK961NQY/vhPM2dHR2EDjtUIkpm5Aq5DqVR
   g==;
X-CSE-ConnectionGUID: fKYjwWnFSNOnJuTKKf2mrQ==
X-CSE-MsgGUID: wPB/RBT2TPug6gDdfckA6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3018120"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3018120"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 20:01:28 -0800
X-CSE-ConnectionGUID: TloUAS+6RdmM0pWsNB+zjw==
X-CSE-MsgGUID: m62cxPDPQ9+2W0zQtJHPlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7635856"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Nov 2026 20:01:26 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQGZQ-00000000trB-0uGY;
	Mon, 09 Nov 2026 04:01:24 +0000
Date: Mon, 09 Nov 2026 12:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 bf99bda3f290163a455643a3c02a8ea5cc5249c8
Message-ID: <20261109120038.dA0ysM4g-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: bf99bda3f290163a455643a3c02a8ea5cc5249c8  Merge branch into tip/master: 'x86/misc'

elapsed time: 831m

configs tested: 211
configs skipped: 2

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
arm                                  defconfig    gcc-16.2.0
arm                         mvebu_v7_defconfig    gcc-16.2.0
arm                          orion5x_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261109    clang-24
arm                   randconfig-1001-20261109    clang-24
arm                   randconfig-1002-20261109    clang-24
arm                   randconfig-1003-20261109    clang-24
arm                           sp7021_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261109    clang-19
hexagon               randconfig-1001-20261109    clang-19
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261109    clang-22
i386        buildonly-randconfig-1001-20261109    clang-22
i386        buildonly-randconfig-1002-20261109    clang-22
i386        buildonly-randconfig-1003-20261109    clang-22
i386        buildonly-randconfig-1004-20261109    clang-22
i386        buildonly-randconfig-1005-20261109    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261109    gcc-14
i386                  randconfig-1001-20261109    gcc-14
i386                  randconfig-1002-20261109    gcc-14
i386                  randconfig-1003-20261109    gcc-14
i386                  randconfig-1004-20261109    gcc-14
i386                  randconfig-1005-20261109    gcc-14
i386                  randconfig-1006-20261109    gcc-14
i386                  randconfig-1007-20261109    gcc-12
i386                  randconfig-1008-20261109    gcc-12
i386                  randconfig-1009-20261109    gcc-12
i386                  randconfig-1010-20261109    gcc-12
i386                  randconfig-1011-20261109    gcc-12
i386                  randconfig-1012-20261109    gcc-12
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
m68k                        m5235evb_defconfig    gcc-16.2.0
m68k                        m5475evb_defconfig    gcc-16.2.0
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
mips                       fuloong2e_defconfig    gcc-16.2.0
mips                            gcw0_defconfig    gcc-16.2.0
mips                             gpr_defconfig    clang-24
mips                            ip28_defconfig    gcc-16.2.0
mips                       loongson3_defconfig    gcc-16.2.0
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
parisc                randconfig-1000-20261109    gcc-8.5.0
parisc                randconfig-1001-20261109    gcc-8.5.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    gcc-16.2.0
powerpc                       ep88xc_defconfig    clang-24
powerpc                  mpc8315_rdb_defconfig    gcc-16.2.0
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261109    gcc-8.5.0
powerpc               randconfig-1001-20261109    gcc-8.5.0
powerpc                      skiroot_defconfig    gcc-16.2.0
powerpc                      stx_gp3_defconfig    clang-24
powerpc                      taishan_defconfig    clang-24
powerpc                       tqm8xx_defconfig    clang-24
powerpc64             randconfig-1000-20261109    gcc-8.5.0
powerpc64             randconfig-1001-20261109    gcc-8.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261109    gcc-8.5.0
riscv                 randconfig-1001-20261109    gcc-8.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261109    gcc-8.5.0
s390                  randconfig-1001-20261109    gcc-8.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                 ecovec24-romimage_defconfig    gcc-16.2.0
sh                             migor_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261109    gcc-8.5.0
sh                    randconfig-1001-20261109    gcc-8.5.0
sh                           sdk7786_defconfig    gcc-16.2.0
sh                    secureedge5410_defconfig    gcc-16.2.0
sh                   sh7785lcr_32bit_defconfig    clang-24
sh                             titan_defconfig    gcc-16.2.0
sh                           urquell_defconfig    gcc-16.2.0
sparc                             alldefconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261109    gcc-8.5.0
sparc                 randconfig-1001-20261109    gcc-8.5.0
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261109    gcc-8.5.0
sparc64               randconfig-1001-20261109    gcc-8.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261109    gcc-8.5.0
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
x86_64                randconfig-1006-20261109    gcc-14
x86_64                randconfig-1007-20261109    gcc-14
x86_64                randconfig-1008-20261109    gcc-14
x86_64                randconfig-1009-20261109    gcc-14
x86_64                randconfig-1010-20261109    gcc-14
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
xtensa                randconfig-1000-20261109    gcc-8.5.0
xtensa                randconfig-1001-20261109    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
