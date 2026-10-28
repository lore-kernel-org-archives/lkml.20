Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171165;
	b=EhHw54Kf5j2YfvfOlACLiU2EfuGGHpDJ1PrMtZlUT1SSuZZahe6HGjCyxUBBq8W/uXey
	 zO1o+pdo7yVDMEace7E6KdHgWvSe4ljCv/cVqOZXVOiDdWUFiXHnl90eIjwb4cL/MVJPK
	 rydcyyqTZ7kzH2rFoTKPDDszD7Iu27+W9DX8sYSftqTJnRRmWJ/xXF0agBojYdgMLiB1i
	 DC6zgJmzIvFVd42kJ8baas5Iezo/ZInUez9ClI66GpYngyZMYSZm75PeD/UmqNiWuUX++
	 JzIJM3mRsCXjejc4pQITWu671kRjlsVku9OM7BC+4zZjNgxPzprKtwB9+ZZUel1uZMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171165;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=X1BWIgKPQjv36nBKAuHyxditU6QDj7xpkNtmtFRj0hU=;
	b=YbcTgUl6NTiKWGLu8KfVWKPiJLfDulhGHBxjxuypkXQa1tSe+l8eksTS1nSSSuohE9Sv
	 eFJ9R81N9QcLUw3xpBPe3snVDDueDPR/drDq6Pses80OibhSbtluHXO4SCf/DoP4+slYm
	 pOlgU1WsSua8FQyy7saxMRXn8kfkyHrehrZUqtz5/1yF3PYJWYPKSfd9f4FLYDFqrbBeX
	 oVBe8pbel32n5MkRvzRN0AMAU6V53SYUX0WuFHEPoDBlPWmQycGy6dtjqKj5hzkM785N9
	 Vw0bWz5MIgB4rR11tj3k2ql2M0ZK8iLMWCtccPa2Zy+UmGDemu93JgegCwD3J2lAPdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ViwLRKlE;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A697606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A697606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ViwLRKlE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793171164; x=1824707164;
  h=date:from:to:cc:subject:message-id;
  bh=iba00pboqi58Vu+jRUOdUXb8EoY//0Y8TUWzdcckfzQ=;
  b=ViwLRKlESsBr9Q4nm7vPiJh+EdxFEmRUyXdWKlZ1zERqO6MOAch8LOQJ
   sUr8jCUgNXJsQpwMdgt+/ZrrxZc8kzdAYzOOlIab4636uTCGM03GwsMh8
   NkytjkJkJlJCiIfBOZ8Q/aI0FrH3MQgngl9W7ZSe7pAHETZiHyV3u8AyM
   SJkucnjH/7dB6l75Q9nPVJU3klb9wrnc83+iLtgShxfsxLxsmhofSwPU9
   QuOfgFc0viOh/T7O+l4IbHFTGiU9pC1ETWRDN3b+2yfCQu3SH4yHSEOzw
   UjvmecwyeoRqq7nDhlJFRZMm/fi/xLr4teSBnG54cZEl97Wx1Sic+qYJz
   w==;
X-CSE-ConnectionGUID: QS+h5ph3Qruih1AwNSdv5Q==
X-CSE-MsgGUID: Q2GOOUjwRcOkNuLrZQdbdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1913914"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1913914"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 00:06:03 -0700
X-CSE-ConnectionGUID: +bUomEvBSyeBOGS93bjobQ==
X-CSE-MsgGUID: p0xyxPQERrmU5yBJyDMoEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4805836"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2026 00:06:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLxjT-00000000YPk-0Aze;
	Wed, 28 Oct 2026 07:05:59 +0000
Date: Wed, 28 Oct 2026 15:05:17 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 e00da09bdd675b5f9b3eb2ef2c2c3625a70f7835
Message-ID: <202610281514.kUdpN2si-lkp@intel.com>
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
branch HEAD: e00da09bdd675b5f9b3eb2ef2c2c3625a70f7835  Merge branch into tip/master: 'x86/misc'

elapsed time: 488m

configs tested: 163
configs skipped: 3

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
arc                   randconfig-1000-20261028    gcc-8.5.0
arc                   randconfig-1001-20261028    gcc-8.5.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                   randconfig-1000-20261028    gcc-8.5.0
arm                   randconfig-1001-20261028    gcc-8.5.0
arm                   randconfig-1002-20261028    gcc-8.5.0
arm                   randconfig-1003-20261028    gcc-8.5.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261028    clang-17
hexagon               randconfig-1001-20261028    clang-17
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261028    clang-22
i386        buildonly-randconfig-1001-20261028    clang-22
i386        buildonly-randconfig-1002-20261028    clang-22
i386        buildonly-randconfig-1003-20261028    clang-22
i386        buildonly-randconfig-1004-20261028    clang-22
i386        buildonly-randconfig-1005-20261028    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261028    gcc-14
i386                  randconfig-1001-20261028    gcc-14
i386                  randconfig-1002-20261028    gcc-14
i386                  randconfig-1003-20261028    gcc-14
i386                  randconfig-1004-20261028    gcc-14
i386                  randconfig-1005-20261028    gcc-14
i386                  randconfig-1006-20261028    gcc-14
i386                  randconfig-1007-20261028    clang-22
i386                  randconfig-1008-20261028    clang-22
i386                  randconfig-1009-20261028    clang-22
i386                  randconfig-1010-20261028    clang-22
i386                  randconfig-1011-20261028    clang-22
i386                  randconfig-1012-20261028    clang-22
i386                  randconfig-1013-20261028    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261028    clang-17
loongarch             randconfig-1001-20261028    clang-17
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261028    clang-17
nios2                 randconfig-1001-20261028    clang-17
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc                        virt_defconfig    clang-24
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261028    clang-19
parisc                randconfig-1001-20261028    clang-19
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       bamboo_defconfig    clang-24
powerpc                       cm5200_defconfig    clang-24
powerpc                       ppc64e_defconfig    clang-24
powerpc               randconfig-1000-20261028    clang-19
powerpc               randconfig-1001-20261028    clang-19
powerpc                     sam440ep_defconfig    clang-24
powerpc64             randconfig-1000-20261028    clang-19
powerpc64             randconfig-1001-20261028    clang-19
riscv                             alldefconfig    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                  kfr2r09-romimage_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261028    gcc-12
sparc                 randconfig-1001-20261028    gcc-12
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261028    gcc-12
sparc64               randconfig-1001-20261028    gcc-12
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261028    gcc-12
um                    randconfig-1001-20261028    gcc-12
um                            x86_64_defconfig    clang-24
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261028    clang-22
x86_64      buildonly-randconfig-1001-20261028    clang-22
x86_64      buildonly-randconfig-1002-20261028    clang-22
x86_64      buildonly-randconfig-1003-20261028    clang-22
x86_64      buildonly-randconfig-1004-20261028    clang-22
x86_64      buildonly-randconfig-1005-20261028    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261028    clang-22
x86_64                randconfig-1001-20261028    clang-22
x86_64                randconfig-1002-20261028    clang-22
x86_64                randconfig-1003-20261028    clang-22
x86_64                randconfig-1004-20261028    clang-22
x86_64                randconfig-1005-20261028    clang-22
x86_64                randconfig-1006-20261028    gcc-14
x86_64                randconfig-1007-20261028    gcc-14
x86_64                randconfig-1008-20261028    gcc-14
x86_64                randconfig-1009-20261028    gcc-14
x86_64                randconfig-1010-20261028    gcc-14
x86_64                randconfig-1011-20261028    gcc-14
x86_64                randconfig-1012-20261028    gcc-12
x86_64                randconfig-1013-20261028    gcc-12
x86_64                randconfig-1014-20261028    gcc-12
x86_64                randconfig-1015-20261028    gcc-12
x86_64                randconfig-1016-20261028    gcc-12
x86_64                randconfig-1017-20261028    gcc-12
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261028    gcc-12
xtensa                randconfig-1001-20261028    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
