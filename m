Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309474;
	b=AaDPsGSUx1VcO+iwsRKqfRrTSgJ4HzXaAVAMD4IZysj3JXKCDeUIIv/TOnoo510Rp42J
	 V9d6nYjF+Tt97P6yiIP4TQWe6TqaccdG6URgFsyEZvENwEj+lczasT98wNy+eg6eKo35f
	 shiUc6HMUwdv4SUILxCWxcTPuK4TRxM/JINkiRSRittC+F+ttX7ylgTE9CVLcPBeaZaWK
	 ki8yX8WgyacMpiupQGyXlma4IMIzleu5Z6auuHJBz0TttSuGr/nsXakdVM3T+G2AqxpT9
	 FD+rX/YJ2D16A1oAlDJt/5DpsM6eL0ig/ns5l0gf9oFzbR73Kmgh0neyJ6u+ilivlrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309474;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZwchGItw2yByWLtLJdvTRxOFM7wKdqx//a4g7oheAfg=;
	b=pE75N7DVuJZvxg6I/HPc5ickdOw5DsL6P0t1zzW9wtHSR6UzV7sAfynl4tsEcq+4f4K8
	 rFSSHBe/0wza0snXnPnDin3SN5DM3NsAiy0tQMPoOESEysLPfmJyr4ofldJ6lSTRn0CMt
	 OUFE8SEsh5hQYtpyA/mYL6q00KOuwLzOOiptlyO5XcA4kzNtrPOYDIsy2Lylj8qm1uVv6
	 4gOyJofWU2WtVPWBlkFmh7sWrU3LnD7uoor7pQyjmDhW9c8DrfgcKQN2Q+m96OdDW63n8
	 0NIpT0DC53HFm/dTmvEycja9c6CfupsBaB55JAphoPY42H2HbyTDP2lMkd/KpgK+h2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HOU8aHzi;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053EB606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 053EB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HOU8aHzi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794309472; x=1825845472;
  h=date:from:to:cc:subject:message-id;
  bh=wlBEfzLNWNmh49wlsXOAuiQC7/s54NHtuOrSfl8dXeU=;
  b=HOU8aHzi/mlS/DRTYRyJX5OEhhk4B2u9TOzA+buhUOY6PD+iucPU4U+X
   lXFPBwt/YIeaWByA2IMSlPtY//bC5yC2vJszRxsIK2oz7iyUOe6kjri+v
   BC2WxldGLOxFNH66u3iUBOzAyv5ihsQYvY0iOv11buEOR5kNaavpe+vfy
   UYU/4qz/Vl9vjFsHxUoo6M9wm4mG16kHjGcnlNP5udrwn9JZXylWhu8kx
   cM+Ho57D+3Pk3Iae/pQvEhoe2L7IAHVMUWriE2k/6Cl8WNBfh64gOxmRM
   9XZnhnWw3aVULLUje+mluacuxQdlnRD5k2hw3f3QFxtzyleoTsCPUf0Z7
   w==;
X-CSE-ConnectionGUID: RhYKnf/4S2egr/tE+00FrQ==
X-CSE-MsgGUID: KEX6xuZhSOesOUfjqPhQBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3051105"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3051105"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 03:17:52 -0800
X-CSE-ConnectionGUID: N63mI0dRS2+64N/BDi28AQ==
X-CSE-MsgGUID: sfQKW1kqQy+aH9G3ON33Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8296543"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2026 03:17:49 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQjrH-00000000whj-3DB1;
	Tue, 10 Nov 2026 11:17:47 +0000
Date: Tue, 10 Nov 2026 19:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:non-rcu:next] BUILD SUCCESS
 44196faa3fd48cb6b4f4ac0d6d4fed884bcf1a17
Message-ID: <20261110191747.E0QGxNoO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git non-rcu/next
branch HEAD: 44196faa3fd48cb6b4f4ac0d6d4fed884bcf1a17  Merge branches 'hazptr.2026.11.09a' and 'nmi.2026.11.03a' into HEAD

elapsed time: 783m

configs tested: 355
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2200-20261110    gcc-9.5.0  smatch
alpha                randconfig-r2303-20261110    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261110    gcc-10.5.0
arc                   randconfig-1001-20261110    gcc-10.5.0
arc                   randconfig-2000-20261110    gcc-8.5.0
arc                   randconfig-2001-20261110    gcc-8.5.0
arc                   randconfig-2002-20261110    gcc-8.5.0
arc                   randconfig-2003-20261110    gcc-8.5.0
arc                   randconfig-2004-20261110    gcc-8.5.0
arc                   randconfig-2005-20261110    gcc-8.5.0
arc                   randconfig-2200-20261110    gcc-8.5.0  smatch
arc                  randconfig-r2300-20261110    clang-17   sparse
arc                  randconfig-r2301-20261110    clang-24   sparse
arc                  randconfig-r2302-20261110    clang-24   sparse
arc                  randconfig-r2307-20261110    clang-24   sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       jornada720_defconfig    clang-24
arm                          mv78xx0_defconfig    clang-24
arm                   randconfig-1000-20261110    gcc-10.5.0
arm                   randconfig-1001-20261110    gcc-10.5.0
arm                   randconfig-1002-20261110    gcc-10.5.0
arm                   randconfig-1003-20261110    gcc-10.5.0
arm                   randconfig-2000-20261110    clang-24
arm                   randconfig-2001-20261110    clang-24
arm                   randconfig-2002-20261110    clang-24
arm                   randconfig-2200-20261110    gcc-11.5.0 smatch
arm                  randconfig-r2101-20261110    gcc-12.5.0 cocci
arm                  randconfig-r2109-20261110    clang-24   cocci
arm                         shmobile_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261110    gcc-12.5.0
arm64                 randconfig-1001-20261110    gcc-12.5.0
arm64                 randconfig-1002-20261110    gcc-12.5.0
arm64                 randconfig-1003-20261110    gcc-12.5.0
arm64                 randconfig-2000-20261110    clang-24
arm64                 randconfig-2001-20261110    clang-24
arm64                 randconfig-2002-20261110    clang-24
arm64                 randconfig-2200-20261110    clang-24   smatch
arm64                randconfig-r2108-20261110    clang-24   cocci
arm64                randconfig-r2305-20261110    clang-17   sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261110    gcc-12.5.0
csky                  randconfig-1001-20261110    gcc-12.5.0
csky                  randconfig-2000-20261110    gcc-11.5.0
csky                  randconfig-2001-20261110    gcc-11.5.0
csky                  randconfig-2200-20261110    gcc-16.2.0 smatch
csky                 randconfig-r2101-20261110    gcc-14.4.0 cocci
csky                 randconfig-r2103-20261110    gcc-14.4.0 cocci
csky                 randconfig-r2108-20261110    clang-20   cocci
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261110    clang-17
hexagon               randconfig-1001-20261110    clang-17
hexagon               randconfig-2000-20261110    gcc-11.5.0
hexagon               randconfig-2001-20261110    gcc-11.5.0
hexagon               randconfig-2200-20261110    clang-24   smatch
hexagon              randconfig-r2104-20261110    gcc-12.5.0 cocci
hexagon              randconfig-r2308-20261110    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261110    clang-22
i386        buildonly-randconfig-1001-20261110    clang-22
i386        buildonly-randconfig-1002-20261110    clang-22
i386        buildonly-randconfig-1003-20261110    clang-22
i386        buildonly-randconfig-1004-20261110    clang-22
i386        buildonly-randconfig-1005-20261110    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1007-20261110    clang-22
i386                  randconfig-1008-20261110    clang-22
i386                  randconfig-1009-20261110    clang-22
i386                  randconfig-1010-20261110    clang-22
i386                  randconfig-1011-20261110    clang-22
i386                  randconfig-1012-20261110    clang-22
i386                  randconfig-1013-20261110    clang-22
i386                  randconfig-2000-20261110    clang-22
i386                  randconfig-2001-20261110    clang-22
i386                  randconfig-2002-20261110    clang-22
i386                  randconfig-2003-20261110    clang-22
i386                  randconfig-2004-20261110    clang-22
i386                  randconfig-2005-20261110    clang-22
i386                  randconfig-2100-20261110    gcc-14     cocci
i386                  randconfig-2101-20261110    gcc-14     cocci
i386                  randconfig-2102-20261110    gcc-14     cocci
i386                  randconfig-2103-20261110    gcc-14     cocci
i386                  randconfig-2104-20261110    gcc-14     cocci
i386                  randconfig-2105-20261110    gcc-14     cocci
i386                  randconfig-2200-20261110    gcc-13     smatch
i386                  randconfig-2300-20261110    clang-22   sparse
i386                  randconfig-2301-20261110    clang-22   sparse
i386                  randconfig-2302-20261110    clang-22   sparse
i386                 randconfig-r2105-20261110    clang-24   cocci
loongarch                         alldefconfig    clang-24
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261110    clang-17
loongarch             randconfig-1001-20261110    clang-17
loongarch             randconfig-2000-20261110    gcc-11.5.0
loongarch             randconfig-2001-20261110    gcc-11.5.0
loongarch             randconfig-2200-20261110    clang-24   smatch
loongarch            randconfig-r2111-20261110    clang-24   cocci
loongarch            randconfig-r2305-20261110    clang-24   sparse
loongarch            randconfig-r2310-20261110    gcc-11.5.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5307c3_defconfig    clang-24
m68k                  randconfig-2200-20261110    gcc-16.2.0 smatch
m68k                 randconfig-r2103-20261110    clang-24   cocci
m68k                 randconfig-r2311-20261110    clang-24   sparse
m68k                         stmark2_defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2200-20261110    gcc-8.5.0  smatch
microblaze           randconfig-r2100-20261110    gcc-14.4.0 cocci
microblaze           randconfig-r2101-20261110    clang-24   cocci
microblaze           randconfig-r2301-20261110    clang-17   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                           ath79_defconfig    clang-24
mips                            ci20_defconfig    clang-24
mips                      eyeq6lplus_defconfig    clang-24
mips                             gpr_defconfig    clang-24
mips                            jazz_defconfig    clang-24
mips                  randconfig-2000-20261110    gcc-16.2.0
mips                  randconfig-2001-20261110    gcc-16.2.0
mips                  randconfig-2002-20261110    gcc-16.2.0
mips                  randconfig-2200-20261110    clang-17   smatch
mips                 randconfig-r2102-20261110    gcc-12.5.0 cocci
mips                 randconfig-r2105-20261110    gcc-12.5.0 cocci
mips                 randconfig-r2107-20261110    clang-24   cocci
mips                 randconfig-r2111-20261110    clang-20   cocci
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261110    clang-17
nios2                 randconfig-1001-20261110    clang-17
nios2                 randconfig-2000-20261110    gcc-11.5.0
nios2                 randconfig-2001-20261110    gcc-11.5.0
nios2                 randconfig-2200-20261110    gcc-11.5.0 smatch
nios2                randconfig-r2104-20261110    gcc-14.4.0 cocci
nios2                randconfig-r2106-20261110    clang-20   cocci
nios2                randconfig-r2308-20261110    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261110    gcc-16.2.0
openrisc              randconfig-2001-20261110    gcc-16.2.0
openrisc              randconfig-2002-20261110    gcc-16.2.0
openrisc              randconfig-2200-20261110    gcc-9.5.0  smatch
openrisc             randconfig-r2309-20261110    gcc-11.5.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261110    gcc-14.4.0
parisc                randconfig-1001-20261110    gcc-14.4.0
parisc                randconfig-2000-20261110    gcc-11.5.0
parisc                randconfig-2001-20261110    gcc-11.5.0
parisc                randconfig-2200-20261110    gcc-15.3.0 smatch
parisc               randconfig-r2103-20261110    gcc-12.5.0 cocci
parisc               randconfig-r2304-20261110    clang-24   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                         cell_defconfig    clang-24
powerpc                       mgcoge_defconfig    clang-24
powerpc                      mpc5200_defconfig    clang-24
powerpc                  mpc836x_rdk_defconfig    clang-24
powerpc               randconfig-1000-20261110    gcc-14.4.0
powerpc               randconfig-1001-20261110    gcc-14.4.0
powerpc               randconfig-2000-20261110    gcc-10.5.0
powerpc               randconfig-2001-20261110    gcc-10.5.0
powerpc               randconfig-2002-20261110    gcc-10.5.0
powerpc               randconfig-2200-20261110    clang-24   smatch
powerpc              randconfig-r2102-20261110    gcc-14.4.0 cocci
powerpc              randconfig-r2304-20261110    clang-17   sparse
powerpc              randconfig-r2306-20261110    clang-24   sparse
powerpc              randconfig-r2307-20261110    gcc-11.5.0 sparse
powerpc                   storcenter_defconfig    clang-24
powerpc                         warp_defconfig    clang-24
powerpc64             randconfig-1000-20261110    gcc-14.4.0
powerpc64             randconfig-1001-20261110    gcc-14.4.0
powerpc64             randconfig-2000-20261110    gcc-10.5.0
powerpc64             randconfig-2001-20261110    gcc-10.5.0
powerpc64             randconfig-2002-20261110    gcc-10.5.0
powerpc64             randconfig-2200-20261110    clang-24   smatch
powerpc64            randconfig-r2107-20261110    clang-20   cocci
powerpc64            randconfig-r2310-20261110    clang-24   sparse
riscv                             alldefconfig    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                     nommu_k210_defconfig    clang-24
riscv                 randconfig-1000-20261110    clang-24
riscv                 randconfig-1001-20261110    clang-24
riscv                 randconfig-2000-20261110    gcc-12.5.0
riscv                 randconfig-2001-20261110    gcc-12.5.0
riscv                 randconfig-2002-20261110    gcc-12.5.0
riscv                 randconfig-2003-20261110    gcc-12.5.0
riscv                 randconfig-2004-20261110    gcc-12.5.0
riscv                 randconfig-2005-20261110    gcc-12.5.0
riscv                 randconfig-2200-20261110    gcc-8.5.0  smatch
riscv                randconfig-r2109-20261110    clang-20   cocci
riscv                randconfig-r2302-20261110    clang-17   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261110    clang-24
s390                  randconfig-1001-20261110    clang-24
s390                  randconfig-2000-20261110    clang-20
s390                  randconfig-2001-20261110    clang-20
s390                  randconfig-2002-20261110    clang-20
s390                  randconfig-2003-20261110    clang-20
s390                  randconfig-2004-20261110    clang-20
s390                  randconfig-2005-20261110    clang-20
s390                  randconfig-2200-20261110    clang-18   smatch
s390                 randconfig-r2102-20261110    clang-24   cocci
s390                 randconfig-r2110-20261110    clang-20   cocci
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261110    clang-24
sh                    randconfig-1001-20261110    clang-24
sh                    randconfig-2000-20261110    gcc-9.5.0
sh                    randconfig-2001-20261110    gcc-9.5.0
sh                    randconfig-2002-20261110    gcc-9.5.0
sh                    randconfig-2003-20261110    gcc-9.5.0
sh                    randconfig-2004-20261110    gcc-9.5.0
sh                    randconfig-2005-20261110    gcc-9.5.0
sh                    randconfig-2200-20261110    gcc-16.2.0 smatch
sh                   sh7785lcr_32bit_defconfig    clang-24
sh                             shmin_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261110    gcc-12.5.0
sparc                 randconfig-1001-20261110    gcc-12.5.0
sparc                 randconfig-2000-20261110    gcc-14
sparc                 randconfig-2001-20261110    gcc-14
sparc                 randconfig-2200-20261110    gcc-13.5.0 smatch
sparc                randconfig-r2311-20261110    gcc-11.5.0 sparse
sparc                        sparc64_defconfig    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261110    gcc-12.5.0
sparc64               randconfig-1001-20261110    gcc-12.5.0
sparc64               randconfig-2000-20261110    gcc-14
sparc64               randconfig-2001-20261110    gcc-14
sparc64               randconfig-2200-20261110    clang-24   smatch
sparc64              randconfig-r2104-20261110    clang-24   cocci
sparc64              randconfig-r2303-20261110    clang-17   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261110    gcc-12.5.0
um                    randconfig-1001-20261110    gcc-12.5.0
um                    randconfig-2000-20261110    gcc-14
um                    randconfig-2001-20261110    gcc-14
um                    randconfig-2200-20261110    gcc-14     smatch
um                   randconfig-r2100-20261110    clang-24   cocci
um                   randconfig-r2106-20261110    clang-24   cocci
um                   randconfig-r2110-20261110    clang-24   cocci
um                   randconfig-r2300-20261110    clang-24   sparse
um                   randconfig-r2306-20261110    gcc-11.5.0 sparse
um                   randconfig-r2309-20261110    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261110    gcc-14
x86_64      buildonly-randconfig-1001-20261110    gcc-14
x86_64      buildonly-randconfig-1002-20261110    gcc-14
x86_64      buildonly-randconfig-1003-20261110    gcc-14
x86_64      buildonly-randconfig-1004-20261110    gcc-14
x86_64      buildonly-randconfig-1005-20261110    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261110    gcc-14
x86_64                randconfig-1001-20261110    gcc-14
x86_64                randconfig-1002-20261110    gcc-14
x86_64                randconfig-1003-20261110    gcc-14
x86_64                randconfig-1004-20261110    gcc-14
x86_64                randconfig-1005-20261110    gcc-14
x86_64                randconfig-1006-20261110    gcc-14
x86_64                randconfig-1007-20261110    gcc-14
x86_64                randconfig-1008-20261110    gcc-14
x86_64                randconfig-1009-20261110    gcc-14
x86_64                randconfig-1010-20261110    gcc-14
x86_64                randconfig-1011-20261110    gcc-14
x86_64                randconfig-1012-20261110    gcc-14
x86_64                randconfig-1013-20261110    gcc-14
x86_64                randconfig-1014-20261110    gcc-14
x86_64                randconfig-1015-20261110    gcc-14
x86_64                randconfig-1016-20261110    gcc-14
x86_64                randconfig-1017-20261110    gcc-14
x86_64                randconfig-2000-20261110    clang-22
x86_64                randconfig-2001-20261110    clang-22
x86_64                randconfig-2002-20261110    clang-22
x86_64                randconfig-2003-20261110    clang-22
x86_64                randconfig-2004-20261110    clang-22
x86_64                randconfig-2005-20261110    clang-22
x86_64                randconfig-2100-20261110    clang-22   cocci
x86_64                randconfig-2101-20261110    clang-22   cocci
x86_64                randconfig-2102-20261110    clang-22   cocci
x86_64                randconfig-2103-20261110    clang-22   cocci
x86_64                randconfig-2104-20261110    clang-22   cocci
x86_64                randconfig-2105-20261110    clang-22   cocci
x86_64                randconfig-2200-20261110    gcc-14     smatch
x86_64                randconfig-2300-20261110    clang-22   sparse
x86_64                randconfig-2301-20261110    clang-22   sparse
x86_64                randconfig-2302-20261110    clang-22   sparse
x86_64               randconfig-r2100-20261110    gcc-12.5.0 cocci
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261110    gcc-12.5.0
xtensa                randconfig-1001-20261110    gcc-12.5.0
xtensa                randconfig-2000-20261110    gcc-11.5.0
xtensa                randconfig-2001-20261110    gcc-11.5.0
xtensa               randconfig-r2105-20261110    gcc-14.4.0 cocci

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
