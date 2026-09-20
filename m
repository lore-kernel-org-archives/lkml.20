Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE073932D5
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896303; cv=none; b=GRz9j6gBXdPzyLt9bQxJ4Fo91hlxSYPMFDDcWCQXYJHHqNDOUn7R8eM2NU+uHjt2ldMuEygpi/O/mrho1T8P5T3OTgk3ZqMDw4orNZPVm8tmFCSzY9sGJWe6nggafX5Z+OPgcQz9glCdK2S3WffTZoNilrQCewX8i1o43yhYRko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896303; c=relaxed/simple;
	bh=PI6otOpH25mLtd+yCK9nITg5ays8EVaRZEfJmZO2bzk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jjcNXRgzTkULINjTaWC6ulaT3lSmQzdzJWv8T739yORC4hrGPGfS2wN8jpfNuOohp9meKuZIrmp1WoI194xSsgzSSQpdEVlu1L+dxnxEDSDaV4stOKk44oGh9m+8nHhQhwLC9pU78/mg5OA5OFDC09ORinsn/uM83LVm5vN340w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yy4MB5cF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yy4MB5cF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789896302; x=1821432302;
  h=date:from:to:cc:subject:message-id;
  bh=PI6otOpH25mLtd+yCK9nITg5ays8EVaRZEfJmZO2bzk=;
  b=Yy4MB5cFsd3uQVaCKDP/v+Xh6ArXI91SQB82bj5EaVa35M2JLytpMtMG
   2zCx8OmlnZT70SwXl2uRzStleg3jYF9N4vaC9//UGHT456bP5OkPoMbdf
   vtvDCA+yk0j7Tfm6tLV5kMmH3NTvhRKjeDIWS4Iw+LXEHmTREvWNqA/cF
   mOV1zJbu4M8vRuBvebpcPZQCFnfyQGEHdepkcdfhWBVN3oIvBmTW+FeF8
   hd/Fzix4gnSvJ4XVtmzUlX9dOeJx3ws5CkmvpW4prMcQdK+Q7chbK79VB
   G6FvLRJsCmZAfep8LWCcH4K5Nokn82YkQOKjKJmoJ3sQErdOyQRCDjrpr
   Q==;
X-CSE-ConnectionGUID: DjWQEj40TCSaH9cTXV/G4w==
X-CSE-MsgGUID: k+dOhpiUR5WooctPs+sz/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="115933111"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="115933111"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 02:25:01 -0700
X-CSE-ConnectionGUID: L7WgcNtpRrOOvM9IYncRzA==
X-CSE-MsgGUID: HKF8sAjAR86Kjua9u/e+QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="277020719"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Sep 2026 02:25:00 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8Dn7-00000000CDu-2oRu;
	Sun, 20 Sep 2026 09:24:57 +0000
Date: Sun, 20 Sep 2026 17:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched:urgent] BUILD SUCCESS
 fe3c73d7bc769e7afc252f867a3421fe168b898d
Message-ID: <202609201741.NLli0TP7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/urgent
branch HEAD: fe3c73d7bc769e7afc252f867a3421fe168b898d  sched/core: Avoid false migration warning for proxy donors

elapsed time: 1100m

configs tested: 178
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260920    gcc-8.5.0
arc                   randconfig-1001-20260920    gcc-8.5.0
arm                                allnoconfig    clang-17
arm                               allyesconfig    gcc-16.1.0
arm                        aspeed_g5_defconfig    gcc-16.1.0
arm                         clps711x_defconfig    clang-24
arm                                  defconfig    clang-24
arm                             mmp2_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260920    gcc-10.5.0
arm                   randconfig-1001-20260920    gcc-12.5.0
arm                   randconfig-1002-20260920    clang-20
arm                   randconfig-1003-20260920    gcc-16.1.0
arm                  randconfig-r1304-20260920    gcc-10.5.0 sparse
arm                  randconfig-r1309-20260920    clang-24   sparse
arm                         spear3xx_defconfig    clang-24
arm                            spitz_defconfig    gcc-16.1.0
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260920    gcc-15.2.0
arm64                 randconfig-1001-20260920    clang-24
arm64                 randconfig-1002-20260920    gcc-8.5.0
arm64                 randconfig-1003-20260920    clang-24
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260920    gcc-12.5.0
csky                  randconfig-1001-20260920    gcc-14.3.0
csky                 randconfig-r1308-20260920    gcc-16.1.0 sparse
hexagon                           alldefconfig    clang-19
hexagon                           allmodconfig    clang-24
hexagon                            allnoconfig    clang-24
hexagon                              defconfig    clang-24
hexagon               randconfig-1000-20260920    clang-17
hexagon               randconfig-1001-20260920    clang-19
hexagon              randconfig-r1306-20260920    clang-24   sparse
i386                              allmodconfig    gcc-14
i386                               allnoconfig    gcc-14
i386        buildonly-randconfig-1000-20260920    clang-22
i386        buildonly-randconfig-1001-20260920    clang-22
i386        buildonly-randconfig-1002-20260920    clang-22
i386        buildonly-randconfig-1003-20260920    gcc-14
i386        buildonly-randconfig-1004-20260920    clang-22
i386        buildonly-randconfig-1005-20260920    clang-22
i386                                 defconfig    clang-22
i386                  randconfig-1000-20260920    clang-22
i386                  randconfig-1001-20260920    gcc-14
i386                  randconfig-1002-20260920    gcc-14
i386                  randconfig-1003-20260920    clang-22
i386                  randconfig-1004-20260920    gcc-14
i386                  randconfig-1005-20260920    gcc-14
i386                  randconfig-1006-20260920    clang-22
i386                  randconfig-1007-20260920    gcc-12
i386                  randconfig-1008-20260920    gcc-14
i386                  randconfig-1009-20260920    clang-22
i386                  randconfig-1010-20260920    clang-22
i386                  randconfig-1011-20260920    gcc-14
i386                  randconfig-1012-20260920    gcc-14
i386                  randconfig-1013-20260920    clang-22
i386                  randconfig-1300-20260920    clang-22   sparse
i386                  randconfig-1301-20260920    clang-22   sparse
i386                  randconfig-1302-20260920    clang-22   sparse
i386                 randconfig-r1303-20260920    gcc-14     sparse
loongarch                          allnoconfig    clang-20
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260919    clang-24
loongarch             randconfig-1000-20260920    gcc-16.1.0
loongarch             randconfig-1001-20260920    gcc-16.1.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                                 defconfig    gcc-16.1.0
m68k                        m5275evb_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    gcc-16.1.0
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    gcc-11.5.0
nios2                                defconfig    gcc-11.5.0
nios2                 randconfig-1000-20260920    gcc-8.5.0
nios2                 randconfig-1001-20260920    gcc-8.5.0
openrisc                          allmodconfig    gcc-16.1.0
openrisc                           allnoconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    gcc-16.1.0
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260920    gcc-14.3.0
parisc                randconfig-1001-20260920    gcc-8.5.0
parisc64                             defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    gcc-16.1.0
powerpc                       ep88xc_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260920    gcc-8.5.0
powerpc               randconfig-1001-20260920    clang-24
powerpc64             randconfig-1000-20260920    clang-24
powerpc64             randconfig-1001-20260920    clang-22
powerpc64            randconfig-r1307-20260920    clang-17   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    gcc-16.1.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-24
riscv                 randconfig-1000-20260920    gcc-13.4.0
riscv                 randconfig-1001-20260920    gcc-15.2.0
riscv                randconfig-r1301-20260920    gcc-11.5.0 sparse
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    clang-18
s390                  randconfig-1000-20260920    gcc-8.5.0
s390                  randconfig-1001-20260920    clang-20
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    gcc-16.1.0
sh                                allyesconfig    gcc-16.1.0
sh                                   defconfig    gcc-16.1.0
sh                    randconfig-1000-20260920    gcc-16.1.0
sh                    randconfig-1001-20260920    gcc-10.5.0
sh                   randconfig-r1300-20260920    gcc-16.1.0 sparse
sparc                              allnoconfig    gcc-16.1.0
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260920    gcc-12.5.0
sparc                 randconfig-1001-20260920    gcc-14.3.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    clang-24
sparc64               randconfig-1000-20260920    gcc-13.4.0
sparc64               randconfig-1001-20260920    clang-24
um                                 allnoconfig    clang-17
um                                allyesconfig    gcc-14
um                                   defconfig    clang-24
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260920    clang-21
um                    randconfig-1001-20260920    clang-17
um                   randconfig-r1302-20260920    gcc-14     sparse
um                   randconfig-r1305-20260920    gcc-14     sparse
um                            x86_64_defconfig    clang-24
x86_64                             allnoconfig    clang-22
x86_64      buildonly-randconfig-1000-20260920    gcc-14
x86_64      buildonly-randconfig-1001-20260920    gcc-14
x86_64      buildonly-randconfig-1002-20260920    gcc-14
x86_64      buildonly-randconfig-1003-20260920    clang-22
x86_64      buildonly-randconfig-1004-20260920    clang-22
x86_64      buildonly-randconfig-1005-20260920    gcc-14
x86_64                               defconfig    gcc-14
x86_64                randconfig-1000-20260920    clang-22
x86_64                randconfig-1001-20260920    gcc-14
x86_64                randconfig-1002-20260920    clang-22
x86_64                randconfig-1003-20260920    gcc-14
x86_64                randconfig-1004-20260920    gcc-14
x86_64                randconfig-1005-20260920    clang-22
x86_64                randconfig-1006-20260920    gcc-14
x86_64                randconfig-1007-20260920    gcc-14
x86_64                randconfig-1008-20260920    gcc-14
x86_64                randconfig-1009-20260919    gcc-14
x86_64                randconfig-1009-20260920    gcc-14
x86_64                randconfig-1010-20260920    gcc-14
x86_64                randconfig-1011-20260920    gcc-14
x86_64                randconfig-1012-20260920    clang-22
x86_64                randconfig-1013-20260920    gcc-14
x86_64                randconfig-1014-20260920    gcc-14
x86_64                randconfig-1015-20260920    clang-22
x86_64                randconfig-1016-20260920    clang-22
x86_64                randconfig-1017-20260920    clang-22
x86_64                randconfig-1300-20260920    clang-22   sparse
x86_64                randconfig-1301-20260920    clang-22   sparse
x86_64                randconfig-1302-20260920    gcc-14     sparse
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    gcc-16.1.0
xtensa                            allyesconfig    gcc-16.1.0
xtensa                randconfig-1000-20260920    gcc-10.5.0
xtensa                randconfig-1001-20260920    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
