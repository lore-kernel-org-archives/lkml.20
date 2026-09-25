Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BAC346ACE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362076; cv=none; b=QqO4fFRuZeQEZex2PXkHn6L0DztlYd4EDa4cpicTwzv6/qQOLatvFzcx5j3SsbJIzgUXefcsAXf4nWYTsv8eCLRZ86WFarXUIXVJ+g7jYDh9dbQfGi+VC+jodakNrws2D+sSAsDSe8XEdUZWkqX0xwVamMxb3oMf18QOs0DX9PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362076; c=relaxed/simple;
	bh=6T52rp5ukzRR2GsNjNCH1utdZH04ZNIgq3pXxHOiEf0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=al1W99by8eeRItq+kpjGH7kf/DfzOQFohPSoHwTZ5Qw/V7xw1uP3Njxj9s/HqZ9vTdv++Q9ThL/FmQDerJUQcQZ0kKGsvmrk7NjDEYZxlv2bUcEkMc0qIIboZKyZjhuSIrx9BH7hfPCTfnOldwUA32MDsLO8beMC4WQ1G+KxMxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USI0ye9Q; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USI0ye9Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790362073; x=1821898073;
  h=date:from:to:cc:subject:message-id;
  bh=6T52rp5ukzRR2GsNjNCH1utdZH04ZNIgq3pXxHOiEf0=;
  b=USI0ye9QEq0l8xlwMYx+PTPd7a8r5bZ5aeFLmRL5YRQ64Oz8YitH0Z5k
   SfOWudChoDacU1ef0GvAG6qWm2Lnb51ll9DFkEiiVVT1Gc5G0dtn3w84m
   Mku1Pgzt1oTkq8u0r00oMyOTaHiyYd0lg0cPZD+F6TygTR03UEVxbF/LB
   YEynZrQrAf+mqeMWRzgH41VXVLoYNq4iutnstc6sLdLrtwhWEaPPUYRd1
   n8NJPM2PJy7OUilW0dakvJqB6YEjmUIYNbAkLm5pjo6dQC9hYhJVxQ0L9
   H2S2aPvfcO9rvDFBx6YEwSnTisD7WaXZ2PQGnSV0jhZwXDNpsV1575cxJ
   Q==;
X-CSE-ConnectionGUID: j/U1Rdp2TJeKxDSvHOTYWw==
X-CSE-MsgGUID: 1MMvXSdtTZe0TrLlMkTtPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90193958"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90193958"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 11:47:52 -0700
X-CSE-ConnectionGUID: uORyzrslRsCLOJNwHusmcg==
X-CSE-MsgGUID: l8kCTN5ZQWSCpVkKkLTC1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="300677882"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Sep 2026 11:47:51 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAAxY-00000000L3K-41z0;
	Fri, 25 Sep 2026 18:47:48 +0000
Date: Sat, 26 Sep 2026 02:47:25 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:urgent] BUILD SUCCESS
 b8d1d5b63a8ef532038eebd9d97d406860385668
Message-ID: <202609260222.SNjAzEzS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: b8d1d5b63a8ef532038eebd9d97d406860385668  x86/mce: Fix hardware debug register corruption on task migration

elapsed time: 1593m

configs tested: 176
configs skipped: 122

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r1302-20260925    clang-18   sparse
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260925    clang-24
arc                   randconfig-1001-20260925    clang-24
arc                  randconfig-r1309-20260925    clang-22   sparse
arm                                allnoconfig    gcc-16.1.0
arm                        aspeed_g4_defconfig    gcc-16.1.0
arm                          axm55xx_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                        omap2plus_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260925    clang-24
arm                   randconfig-1001-20260925    clang-24
arm                   randconfig-1002-20260925    clang-24
arm                   randconfig-1003-20260925    clang-24
arm                         spear3xx_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260925    clang-24
arm64                 randconfig-1001-20260925    clang-24
arm64                 randconfig-1002-20260925    clang-24
arm64                 randconfig-1003-20260925    clang-24
arm64                randconfig-r1303-20260925    clang-18   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260925    clang-24
csky                  randconfig-1001-20260925    clang-24
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260925    gcc-9.5.0
hexagon               randconfig-1001-20260925    gcc-9.5.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260925    clang-22
i386        buildonly-randconfig-1001-20260925    clang-22
i386        buildonly-randconfig-1002-20260925    clang-22
i386        buildonly-randconfig-1003-20260925    clang-22
i386        buildonly-randconfig-1004-20260925    clang-22
i386        buildonly-randconfig-1005-20260925    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260925    clang-22
i386                  randconfig-1001-20260925    clang-22
i386                  randconfig-1002-20260925    clang-22
i386                  randconfig-1003-20260925    clang-22
i386                  randconfig-1004-20260925    clang-22
i386                  randconfig-1005-20260925    clang-22
i386                  randconfig-1006-20260925    clang-22
i386                  randconfig-1007-20260925    gcc-12
i386                  randconfig-1008-20260925    gcc-12
i386                  randconfig-1009-20260925    gcc-12
i386                  randconfig-1010-20260925    gcc-12
i386                  randconfig-1011-20260925    gcc-12
i386                  randconfig-1012-20260925    gcc-12
i386                  randconfig-1013-20260925    gcc-12
i386                  randconfig-1300-20260925    clang-22   sparse
i386                  randconfig-1301-20260925    clang-22   sparse
i386                  randconfig-1302-20260925    clang-22   sparse
i386                  randconfig-2200-20260924    clang-22   smatch
i386                 randconfig-r1307-20260925    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch             randconfig-1000-20260925    gcc-9.5.0
loongarch             randconfig-1001-20260925    gcc-9.5.0
loongarch            randconfig-r1305-20260925    clang-18   sparse
loongarch            randconfig-r1306-20260925    clang-22   sparse
loongarch            randconfig-r1308-20260925    clang-22   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                      cu1000-neo_defconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
nios2                              allnoconfig    clang-24
nios2                 randconfig-1000-20260925    gcc-9.5.0
nios2                 randconfig-1001-20260925    gcc-9.5.0
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260925    clang-24
parisc                randconfig-1001-20260925    clang-24
parisc               randconfig-r1300-20260925    clang-18   sparse
powerpc                            allnoconfig    clang-24
powerpc                      rainier_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260925    clang-24
powerpc               randconfig-1001-20260925    clang-24
powerpc64             randconfig-1000-20260925    clang-24
powerpc64             randconfig-1001-20260925    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260925    clang-24
riscv                 randconfig-1001-20260925    clang-24
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260925    clang-24
s390                  randconfig-1001-20260925    clang-24
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20260925    clang-24
sh                    randconfig-1001-20260925    clang-24
sh                    rts7751r2dplus_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260925    gcc-12
sparc                 randconfig-1001-20260925    gcc-12
sparc                randconfig-r1301-20260925    clang-18   sparse
sparc                randconfig-r1304-20260925    clang-18   sparse
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260925    gcc-12
sparc64               randconfig-1001-20260925    gcc-12
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260925    gcc-12
um                    randconfig-1001-20260925    gcc-12
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260925    clang-22
x86_64      buildonly-randconfig-1001-20260925    clang-22
x86_64      buildonly-randconfig-1002-20260925    clang-22
x86_64      buildonly-randconfig-1003-20260925    clang-22
x86_64      buildonly-randconfig-1004-20260925    clang-22
x86_64      buildonly-randconfig-1005-20260925    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260925    gcc-14
x86_64                randconfig-1001-20260925    gcc-14
x86_64                randconfig-1002-20260925    gcc-14
x86_64                randconfig-1003-20260925    gcc-14
x86_64                randconfig-1004-20260925    gcc-14
x86_64                randconfig-1005-20260925    gcc-14
x86_64                randconfig-1006-20260925    clang-22
x86_64                randconfig-1007-20260925    clang-22
x86_64                randconfig-1008-20260925    clang-22
x86_64                randconfig-1009-20260925    clang-22
x86_64                randconfig-1010-20260925    clang-22
x86_64                randconfig-1011-20260925    clang-22
x86_64                randconfig-1012-20260925    clang-22
x86_64                randconfig-1013-20260925    clang-22
x86_64                randconfig-1014-20260925    clang-22
x86_64                randconfig-1015-20260925    clang-22
x86_64                randconfig-1016-20260925    clang-22
x86_64                randconfig-1017-20260925    clang-22
x86_64                randconfig-1300-20260925    clang-22   sparse
x86_64                randconfig-1301-20260925    clang-22   sparse
x86_64                randconfig-1302-20260925    clang-22   sparse
x86_64                randconfig-2200-20260924    clang-22   smatch
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                randconfig-1000-20260925    gcc-12
xtensa                randconfig-1001-20260925    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
