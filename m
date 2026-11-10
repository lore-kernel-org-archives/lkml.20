Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269989;
	b=MfhOb1Og14xLI0/p7+D+i7zeyr2tX2UkLseDMiSwtCP9fY9ShqAiwKJEVfmkXKStYEpf
	 fWx2cYYMNh/UAvFqvmnw59z5clNj+m7YwgxCTzYxH4g6DeN/lT0aQx04BkXZYjSLN2ukg
	 CU9+vy9p4IBt5Dhd9mGEpWV2OYbCMIU7LGuDdipnatqJAKD/NAtrBum/ndD0AW6w/N/Ug
	 DDrVxvg/JTLyxFDf33XTzsa5QH0iGym21Ek1BUSZRZimn0h4m1WqOkgxj5ownlbQtTli2
	 MUemWYqDWWe9iRqp0YzbA+B+/KogNon4G3hn+X51YOlGApWitLUUEQWj379eU66drXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269989;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8dDC07qa+q7kAJwNh1Tsnanm2P7CYuK8jLOqXmgdADs=;
	b=nS4iKMNdPk4Ke0ZHku/3YWa1n5hQHxmTvwTZt7LT/9mbFWbIRbkh9+0Ak2FsB72+C3Pn
	 8xNZDkrOImvtBlfG9Y1Qs0X3sTh/f4h16KSXDqDe7MhGLyg1S56ZjBGXXg6TKo/mB70/a
	 lmBtNmAmx/Y2OWN06O4rwiXFTboJ2fYyMI5spVS4PlaBmEjI6K48y/kVMNsRDXRofA4cl
	 Bnskn/OmlQCxYmz5Ox2jbr39QWIW0IOUjIBetzUn7JcmdnieUY/0RVA7htIDJp65dyqAP
	 MDVu39hGClx338LuELMFOPpWXnmvvIKu6HxqtaG5t+bjJKE3vh0BxTBG7ZLPMfHqHzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bo3pW5db;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6386606A336
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6386606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bo3pW5db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794269988; x=1825805988;
  h=date:from:to:cc:subject:message-id;
  bh=q9fyaQZrx3M+2hviKtRgErmeRyCRQll09J4zFkfmU6Y=;
  b=Bo3pW5dblXhCy7+Y+QljokNV16Fi6W0v2HgScZf9n6a4keXuDdryxcFu
   hBlTADH0p/Z3QvBiywJPSrALNNyiW6HveQ/VZWegGrj/GjeDibuZ8iSdM
   WqpEKGCjfBNYXEYdArapiN7h8+e3nPKh4liutbavd4Os+2kZWm7Pc73t6
   /G7iUrnz47DsB+62yJOvVMtPxfB7SknzwrEtUqa8L4GDGaZTNKf6VxlLz
   leQpOSF6FMBNKTPPbz2j3GMTBTFlu2o2ufxdvdY5GU9fhzS6ndgfe5Y3S
   yhZGV4DIy3ebbtrPY6uITOrsZiNWVJwu5G4I9u494kuq+SFacdmj8/JO3
   g==;
X-CSE-ConnectionGUID: x32hGDGqR5+ZGLPvtNs/vQ==
X-CSE-MsgGUID: LVpwGa84Saa4sGW9WLll3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2907255"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2907255"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 16:19:48 -0800
X-CSE-ConnectionGUID: KsMaEdmNTuuaBJGzOI/yaQ==
X-CSE-MsgGUID: yBcuEBp0Rc66LN0Pjg+tIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9857961"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 09 Nov 2026 16:19:46 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQZaR-00000000vbN-349n;
	Tue, 10 Nov 2026 00:19:43 +0000
Date: Tue, 10 Nov 2026 08:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:urgent] BUILD SUCCESS
 ea51d1a4c31fc8320c34f897dc5296a0bfc5c7ca
Message-ID: <20261110081904.WMK1RcLs-lkp@intel.com>
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
branch HEAD: ea51d1a4c31fc8320c34f897dc5296a0bfc5c7ca  x86/CPU/AMD: Don't print reset reason in VMs

elapsed time: 964m

configs tested: 273
configs skipped: 93

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261109    clang-24
arc                   randconfig-1000-20261110    gcc-10.5.0
arc                   randconfig-1001-20261109    clang-24
arc                   randconfig-1001-20261110    gcc-10.5.0
arc                            tb10x_defconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    gcc-16.2.0
arm                          axm55xx_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                           gemini_defconfig    clang-17
arm                       integrator_defconfig    clang-17
arm                          lpc32xx_defconfig    clang-17
arm                             mmp2_defconfig    gcc-16.2.0
arm                         multi_v7_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261109    clang-24
arm                   randconfig-1000-20261110    gcc-10.5.0
arm                   randconfig-1001-20261109    clang-24
arm                   randconfig-1001-20261110    gcc-10.5.0
arm                   randconfig-1002-20261109    clang-24
arm                   randconfig-1002-20261110    gcc-10.5.0
arm                   randconfig-1003-20261109    clang-24
arm                   randconfig-1003-20261110    gcc-10.5.0
arm                           sp7021_defconfig    gcc-16.2.0
arm                          vf610m4_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261109    gcc-13.5.0
arm64                 randconfig-1000-20261110    gcc-12.5.0
arm64                 randconfig-1001-20261109    gcc-13.5.0
arm64                 randconfig-1001-20261110    gcc-12.5.0
arm64                 randconfig-1002-20261109    gcc-13.5.0
arm64                 randconfig-1002-20261110    gcc-12.5.0
arm64                 randconfig-1003-20261109    gcc-13.5.0
arm64                 randconfig-1003-20261110    gcc-12.5.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261109    gcc-13.5.0
csky                  randconfig-1000-20261110    gcc-12.5.0
csky                  randconfig-1001-20261109    gcc-13.5.0
csky                  randconfig-1001-20261110    gcc-12.5.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261109    clang-19
hexagon               randconfig-1000-20261110    clang-17
hexagon               randconfig-1001-20261109    clang-19
hexagon               randconfig-1001-20261110    clang-17
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261109    clang-22
i386        buildonly-randconfig-1000-20261110    clang-22
i386        buildonly-randconfig-1001-20261109    clang-22
i386        buildonly-randconfig-1001-20261110    clang-22
i386        buildonly-randconfig-1002-20261109    clang-22
i386        buildonly-randconfig-1002-20261110    clang-22
i386        buildonly-randconfig-1003-20261109    clang-22
i386        buildonly-randconfig-1003-20261110    clang-22
i386        buildonly-randconfig-1004-20261109    clang-22
i386        buildonly-randconfig-1004-20261110    clang-22
i386        buildonly-randconfig-1005-20261109    clang-22
i386        buildonly-randconfig-1005-20261110    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261109    gcc-14
i386                  randconfig-1000-20261110    gcc-14
i386                  randconfig-1001-20261109    gcc-14
i386                  randconfig-1001-20261110    gcc-14
i386                  randconfig-1002-20261109    gcc-14
i386                  randconfig-1002-20261110    gcc-14
i386                  randconfig-1003-20261109    gcc-14
i386                  randconfig-1003-20261110    gcc-14
i386                  randconfig-1004-20261109    gcc-14
i386                  randconfig-1004-20261110    gcc-14
i386                  randconfig-1005-20261109    gcc-14
i386                  randconfig-1005-20261110    gcc-14
i386                  randconfig-1006-20261109    gcc-14
i386                  randconfig-1006-20261110    gcc-14
i386                  randconfig-1007-20261109    gcc-12
i386                  randconfig-1007-20261110    clang-22
i386                  randconfig-1008-20261109    gcc-12
i386                  randconfig-1008-20261110    clang-22
i386                  randconfig-1009-20261109    gcc-12
i386                  randconfig-1009-20261110    clang-22
i386                  randconfig-1010-20261109    gcc-12
i386                  randconfig-1010-20261110    clang-22
i386                  randconfig-1011-20261109    gcc-12
i386                  randconfig-1011-20261110    clang-22
i386                  randconfig-1012-20261109    gcc-12
i386                  randconfig-1012-20261110    clang-22
i386                  randconfig-1013-20261109    gcc-12
i386                  randconfig-1013-20261110    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261109    clang-19
loongarch             randconfig-1000-20261110    clang-17
loongarch             randconfig-1001-20261109    clang-19
loongarch             randconfig-1001-20261110    clang-17
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                       m54418evb_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                   decstation_64_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                            ip27_defconfig    clang-17
mips                            jazz_defconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                   maltasmvp_eva_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261109    clang-19
nios2                 randconfig-1000-20261110    clang-17
nios2                 randconfig-1001-20261109    clang-19
nios2                 randconfig-1001-20261110    clang-17
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261109    gcc-8.5.0
parisc                randconfig-1000-20261110    gcc-14.4.0
parisc                randconfig-1001-20261109    gcc-8.5.0
parisc                randconfig-1001-20261110    gcc-14.4.0
parisc64                          alldefconfig    gcc-16.2.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                           g5_defconfig    gcc-16.2.0
powerpc                     ge_imp3a_defconfig    gcc-16.2.0
powerpc                      kmeter1_defconfig    gcc-16.2.0
powerpc                      powernv_defconfig    clang-17
powerpc                      ppa8548_defconfig    clang-17
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261109    gcc-8.5.0
powerpc               randconfig-1000-20261110    gcc-14.4.0
powerpc               randconfig-1001-20261109    gcc-8.5.0
powerpc               randconfig-1001-20261110    gcc-14.4.0
powerpc                         warp_defconfig    clang-17
powerpc                         warp_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261109    gcc-8.5.0
powerpc64             randconfig-1000-20261110    gcc-14.4.0
powerpc64             randconfig-1001-20261109    gcc-8.5.0
powerpc64             randconfig-1001-20261110    gcc-14.4.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261109    gcc-8.5.0
riscv                 randconfig-1000-20261110    clang-24
riscv                 randconfig-1001-20261109    gcc-8.5.0
riscv                 randconfig-1001-20261110    clang-24
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261109    gcc-8.5.0
s390                  randconfig-1000-20261110    clang-24
s390                  randconfig-1001-20261109    gcc-8.5.0
s390                  randconfig-1001-20261110    clang-24
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261109    gcc-8.5.0
sh                    randconfig-1000-20261110    clang-24
sh                    randconfig-1001-20261109    gcc-8.5.0
sh                    randconfig-1001-20261110    clang-24
sh                            se7751_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261110    gcc-12.5.0
sparc                 randconfig-1001-20261110    gcc-12.5.0
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261110    gcc-12.5.0
sparc64               randconfig-1001-20261110    gcc-12.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-16.2.0
um                    randconfig-1000-20261110    gcc-12.5.0
um                    randconfig-1001-20261110    gcc-12.5.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261109    clang-22
x86_64      buildonly-randconfig-1000-20261110    gcc-14
x86_64      buildonly-randconfig-1001-20261109    clang-22
x86_64      buildonly-randconfig-1001-20261110    gcc-14
x86_64      buildonly-randconfig-1002-20261109    clang-22
x86_64      buildonly-randconfig-1002-20261110    gcc-14
x86_64      buildonly-randconfig-1003-20261109    clang-22
x86_64      buildonly-randconfig-1003-20261110    gcc-14
x86_64      buildonly-randconfig-1004-20261109    clang-22
x86_64      buildonly-randconfig-1004-20261110    gcc-14
x86_64      buildonly-randconfig-1005-20261109    clang-22
x86_64      buildonly-randconfig-1005-20261110    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261109    clang-22
x86_64                randconfig-1000-20261110    gcc-14
x86_64                randconfig-1001-20261109    clang-22
x86_64                randconfig-1001-20261110    gcc-14
x86_64                randconfig-1002-20261109    clang-22
x86_64                randconfig-1002-20261110    gcc-14
x86_64                randconfig-1003-20261109    clang-22
x86_64                randconfig-1003-20261110    gcc-14
x86_64                randconfig-1004-20261109    clang-22
x86_64                randconfig-1004-20261110    gcc-14
x86_64                randconfig-1005-20261109    clang-22
x86_64                randconfig-1005-20261110    gcc-14
x86_64                randconfig-1006-20261109    gcc-14
x86_64                randconfig-1006-20261110    gcc-14
x86_64                randconfig-1007-20261109    gcc-14
x86_64                randconfig-1007-20261110    gcc-14
x86_64                randconfig-1008-20261109    gcc-14
x86_64                randconfig-1008-20261110    gcc-14
x86_64                randconfig-1009-20261109    gcc-14
x86_64                randconfig-1009-20261110    gcc-14
x86_64                randconfig-1010-20261109    gcc-14
x86_64                randconfig-1010-20261110    gcc-14
x86_64                randconfig-1011-20261109    gcc-14
x86_64                randconfig-1011-20261110    gcc-14
x86_64                randconfig-1012-20261109    clang-22
x86_64                randconfig-1012-20261110    gcc-14
x86_64                randconfig-1013-20261109    clang-22
x86_64                randconfig-1013-20261110    gcc-14
x86_64                randconfig-1014-20261109    clang-22
x86_64                randconfig-1014-20261110    gcc-14
x86_64                randconfig-1015-20261109    clang-22
x86_64                randconfig-1015-20261110    gcc-14
x86_64                randconfig-1016-20261109    clang-22
x86_64                randconfig-1016-20261110    gcc-14
x86_64                randconfig-1017-20261109    clang-22
x86_64                randconfig-1017-20261110    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                        common_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261110    gcc-12.5.0
xtensa                randconfig-1001-20261110    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
