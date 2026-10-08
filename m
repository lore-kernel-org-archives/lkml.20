Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C2F2652B2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791428165; cv=none; b=H9E53RUNUu/7v/TgxouNaMWUgBfXE5qz60w38FYwyVojtBRT+rGxFMWsNjA0JfqPMpflZSxWWm+JI5ZDFI1pDAPJXRSaA2gyLmQEqraxPTmekKyKmigklZUOkXkaGfLPItdDcSvq5W8KxoaXJQ274c9NW0LzUahjxiFwwtzhCPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791428165; c=relaxed/simple;
	bh=+CfEwJuvqs3Nr6F6NVuuWpl2WRK4sMM68a0pkro+QiA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A0XANyXV6KPKc+u0EgF9xAufTJG25TDxCJ43Vd/FWhF43OHiPjOYSo2IgwfM83DvKTWL3yGOhG3jIOfiBv5SwOju6qPGY8YVFLxfTGLkZzvH13gwZQ2BnS8FluF4WKWLDOZUd8um20pHvHhFARZ8djAtBXOzHTFDeI3S7L3HjTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dw+HNzL+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dw+HNzL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791428164; x=1822964164;
  h=date:from:to:cc:subject:message-id;
  bh=+CfEwJuvqs3Nr6F6NVuuWpl2WRK4sMM68a0pkro+QiA=;
  b=Dw+HNzL+h8n6fCdNRgMyZPLXZqDFqZ6iBkhIhYURGHV0GSgIoP3J/iUB
   Ubqz3MAZt9JhaJ2LNUrXw24ZHQz302uIaAVaD6D5x6CWdWakth+uOjH6l
   tCg0ILgoLWZsu5fxiCA9oJPV+qx3dBaU0PRjsPMuczCrzlSOOycZpPbUH
   MrveYpMBVUZ1+VGdV2Mw8zl5X40aG4k+TcTFqzaL0B3/itbfAVM7bRUdJ
   byF0lgRxuGqSOL9r25TgFxeP+3EskYEKUfrei1u0USg5CaDsVb2uv4jje
   O08H/DKXDzlV0krESfL/uXMLfuM9ZdoAUiNQj4NSjfV9b99ohFIkBS8Ru
   g==;
X-CSE-ConnectionGUID: FSThfxJxT16gF6bEQly9/g==
X-CSE-MsgGUID: FECnOLDgRRq8pMD5RUSGjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="211804"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="211804"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 19:56:03 -0700
X-CSE-ConnectionGUID: noPpe104QZGHT1ujJ918IQ==
X-CSE-MsgGUID: mYHYBXVSQDGWKVx4zuBxfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="307078667"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Oct 2026 19:56:01 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEeIY-000000003tM-3Idx;
	Thu, 08 Oct 2026 02:55:58 +0000
Date: Thu, 08 Oct 2026 10:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev] BUILD SUCCESS
 4044db3b42c263c65bb5a0da4d8b1feffb37c676
Message-ID: <202610081010.fjSn6ZnK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
branch HEAD: 4044db3b42c263c65bb5a0da4d8b1feffb37c676  rcuscale: Consolidate per-writer arrays into struct writer_state

elapsed time: 1896m

configs tested: 356
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2202-20261007    gcc-8.5.0  smatch
alpha                randconfig-r2306-20261007    clang-24   sparse
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261007    clang-24
arc                   randconfig-1000-20261008    clang-18
arc                   randconfig-1001-20261007    clang-24
arc                   randconfig-1001-20261008    clang-18
arc                  randconfig-r2103-20261007    gcc-11.5.0 cocci
arc                         vdk_hs38_defconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                          bcm2835_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20261007    clang-24
arm                   randconfig-1000-20261008    clang-18
arm                   randconfig-1001-20261007    clang-24
arm                   randconfig-1001-20261008    clang-18
arm                   randconfig-1002-20261007    clang-24
arm                   randconfig-1002-20261008    clang-18
arm                   randconfig-1003-20261007    clang-24
arm                   randconfig-1003-20261008    clang-18
arm                  randconfig-r2104-20261007    gcc-8.5.0  cocci
arm                  randconfig-r2105-20261007    gcc-16.1.0 cocci
arm                  randconfig-r2304-20261007    clang-20   sparse
arm                  randconfig-r2306-20261007    gcc-14     sparse
arm                        versatile_defconfig    gcc-16.1.0
arm                          vf610m4_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261007    gcc-13.4.0
arm64                 randconfig-1000-20261008    gcc-10.5.0
arm64                 randconfig-1001-20261007    gcc-13.4.0
arm64                 randconfig-1001-20261008    gcc-10.5.0
arm64                 randconfig-1002-20261007    gcc-13.4.0
arm64                 randconfig-1002-20261008    gcc-10.5.0
arm64                 randconfig-1003-20261007    gcc-13.4.0
arm64                 randconfig-1003-20261008    gcc-10.5.0
arm64                randconfig-r2102-20261007    gcc-8.5.0  cocci
arm64                randconfig-r2106-20261007    clang-22   cocci
arm64                randconfig-r2106-20261007    gcc-16.1.0 cocci
arm64                randconfig-r2107-20261007    gcc-8.5.0  cocci
arm64                randconfig-r2305-20261007    clang-20   sparse
csky                              alldefconfig    gcc-16.1.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261007    gcc-13.4.0
csky                  randconfig-1000-20261008    gcc-10.5.0
csky                  randconfig-1001-20261007    gcc-13.4.0
csky                  randconfig-1001-20261008    gcc-10.5.0
csky                 randconfig-r2102-20261007    gcc-8.5.0  cocci
csky                 randconfig-r2104-20261007    gcc-16.1.0 cocci
csky                 randconfig-r2301-20261007    gcc-8.5.0  sparse
csky                 randconfig-r2308-20261007    gcc-14     sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261007    gcc-12.5.0
hexagon               randconfig-1000-20261008    gcc-16.1.0
hexagon               randconfig-1001-20261007    gcc-12.5.0
hexagon               randconfig-1001-20261008    gcc-16.1.0
hexagon              randconfig-r2101-20261007    gcc-8.5.0  cocci
hexagon              randconfig-r2103-20261007    gcc-8.5.0  cocci
hexagon              randconfig-r2106-20261007    gcc-8.5.0  cocci
hexagon              randconfig-r2107-20261007    clang-22   cocci
hexagon              randconfig-r2107-20261007    gcc-16.1.0 cocci
hexagon              randconfig-r2200-20261007    clang-24   smatch
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261007    gcc-14
i386        buildonly-randconfig-1000-20261008    clang-22
i386        buildonly-randconfig-1001-20261007    gcc-14
i386        buildonly-randconfig-1001-20261008    clang-22
i386        buildonly-randconfig-1002-20261007    gcc-14
i386        buildonly-randconfig-1002-20261008    clang-22
i386        buildonly-randconfig-1003-20261007    gcc-14
i386        buildonly-randconfig-1003-20261008    clang-22
i386        buildonly-randconfig-1004-20261007    gcc-14
i386        buildonly-randconfig-1004-20261008    clang-22
i386        buildonly-randconfig-1005-20261007    gcc-14
i386        buildonly-randconfig-1005-20261008    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261007    clang-22
i386                  randconfig-1000-20261008    gcc-14
i386                  randconfig-1001-20261007    clang-22
i386                  randconfig-1001-20261008    gcc-14
i386                  randconfig-1002-20261007    clang-22
i386                  randconfig-1002-20261008    gcc-14
i386                  randconfig-1003-20261007    clang-22
i386                  randconfig-1003-20261008    gcc-14
i386                  randconfig-1004-20261007    clang-22
i386                  randconfig-1004-20261008    gcc-14
i386                  randconfig-1005-20261007    clang-22
i386                  randconfig-1005-20261008    gcc-14
i386                  randconfig-1006-20261007    clang-22
i386                  randconfig-1006-20261008    gcc-14
i386                  randconfig-1007-20261007    gcc-14
i386                  randconfig-1007-20261008    clang-22
i386                  randconfig-1008-20261007    gcc-14
i386                  randconfig-1008-20261008    clang-22
i386                  randconfig-1009-20261007    gcc-14
i386                  randconfig-1009-20261008    clang-22
i386                  randconfig-1010-20261007    gcc-14
i386                  randconfig-1010-20261008    clang-22
i386                  randconfig-1011-20261007    gcc-14
i386                  randconfig-1011-20261008    clang-22
i386                  randconfig-1012-20261007    gcc-14
i386                  randconfig-1012-20261008    clang-22
i386                  randconfig-1013-20261007    gcc-14
i386                  randconfig-1013-20261008    clang-22
i386                  randconfig-2100-20261007    clang-22   cocci
i386                  randconfig-2101-20261007    clang-22   cocci
i386                  randconfig-2102-20261007    clang-22   cocci
i386                  randconfig-2103-20261007    clang-22   cocci
i386                  randconfig-2200-20261007    gcc-14     smatch
i386                  randconfig-2300-20261007    clang-22   sparse
i386                  randconfig-2301-20261007    clang-22   sparse
i386                  randconfig-2302-20261007    clang-22   sparse
i386                 randconfig-r2300-20261007    gcc-8.5.0  sparse
i386                 randconfig-r2302-20261007    clang-20   sparse
i386                 randconfig-r2307-20261007    gcc-13.4.0 sparse
i386                 randconfig-r2309-20261007    gcc-14     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261007    gcc-12.5.0
loongarch             randconfig-1000-20261008    gcc-16.1.0
loongarch             randconfig-1001-20261007    gcc-12.5.0
loongarch             randconfig-1001-20261008    gcc-16.1.0
loongarch            randconfig-r2305-20261007    gcc-8.5.0  sparse
loongarch            randconfig-r2307-20261007    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                         m5307c3_defconfig    clang-17
m68k                         mvme16x_defconfig    clang-17
m68k                 randconfig-r2100-20261007    gcc-11.5.0 cocci
m68k                 randconfig-r2303-20261007    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2306-20261007    gcc-13.4.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                       bmips_stb_defconfig    clang-17
mips                          cobalt_defconfig    gcc-16.1.0
mips                      cu1000-neo_defconfig    clang-17
mips                     maltaup_xpa_defconfig    gcc-16.1.0
mips                       pic32mzda_defconfig    gcc-16.1.0
mips                           rm200_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261007    gcc-12.5.0
nios2                 randconfig-1000-20261008    gcc-16.1.0
nios2                 randconfig-1001-20261007    gcc-12.5.0
nios2                 randconfig-1001-20261008    gcc-16.1.0
nios2                randconfig-r2101-20261007    gcc-11.5.0 cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2200-20261007    gcc-12.5.0 smatch
openrisc             randconfig-r2303-20261007    clang-20   sparse
openrisc             randconfig-r2309-20261007    gcc-13.4.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261007    gcc-15.2.0
parisc                randconfig-1000-20261008    gcc-8.5.0
parisc                randconfig-1001-20261007    gcc-15.2.0
parisc                randconfig-1001-20261008    gcc-8.5.0
parisc               randconfig-r2100-20261007    gcc-8.5.0  cocci
parisc               randconfig-r2201-20261007    gcc-8.5.0  smatch
parisc               randconfig-r2309-20261007    clang-24   sparse
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                     ge_imp3a_defconfig    gcc-16.1.0
powerpc                         icon_defconfig    gcc-16.1.0
powerpc                       katmai_defconfig    gcc-16.1.0
powerpc                  mpc836x_rdk_defconfig    clang-17
powerpc                   mpc885_ads_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261007    gcc-15.2.0
powerpc               randconfig-1000-20261008    gcc-8.5.0
powerpc               randconfig-1001-20261007    gcc-15.2.0
powerpc               randconfig-1001-20261008    gcc-8.5.0
powerpc              randconfig-r2101-20261007    gcc-8.5.0  cocci
powerpc              randconfig-r2308-20261007    gcc-13.4.0 sparse
powerpc                      skiroot_defconfig    gcc-16.1.0
powerpc64                         alldefconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261007    gcc-15.2.0
powerpc64             randconfig-1000-20261008    gcc-8.5.0
powerpc64             randconfig-1001-20261007    gcc-15.2.0
powerpc64             randconfig-1001-20261008    gcc-8.5.0
powerpc64            randconfig-r2200-20261007    clang-24   smatch
powerpc64            randconfig-r2202-20261007    gcc-10.5.0 smatch
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                     nommu_virt_defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261007    clang-24
riscv                 randconfig-1000-20261008    gcc-10.5.0
riscv                 randconfig-1001-20261007    clang-24
riscv                 randconfig-1001-20261008    gcc-10.5.0
riscv                 randconfig-2000-20261007    gcc-12.5.0
riscv                 randconfig-2001-20261007    gcc-12.5.0
riscv                randconfig-r2105-20261007    gcc-8.5.0  cocci
riscv                randconfig-r2201-20261007    clang-24   smatch
riscv                randconfig-r2304-20261007    gcc-8.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261007    clang-24
s390                  randconfig-1000-20261008    gcc-10.5.0
s390                  randconfig-1001-20261007    clang-24
s390                  randconfig-1001-20261008    gcc-10.5.0
s390                  randconfig-2000-20261007    gcc-12.5.0
s390                  randconfig-2001-20261007    gcc-12.5.0
s390                 randconfig-r2302-20261007    gcc-8.5.0  sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          apsh4a3a_defconfig    clang-17
sh                                   defconfig    gcc-14
sh                           polaris_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261007    clang-24
sh                    randconfig-1000-20261008    gcc-10.5.0
sh                    randconfig-1001-20261007    clang-24
sh                    randconfig-1001-20261008    gcc-10.5.0
sh                    randconfig-2000-20261007    gcc-12.5.0
sh                    randconfig-2001-20261007    gcc-12.5.0
sh                   randconfig-r2105-20261007    clang-22   cocci
sh                    sh7724_generic_defconfig    gcc-16.1.0
sh                               ul2_defconfig    gcc-16.1.0
sparc                             alldefconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261008    gcc-14
sparc                 randconfig-1001-20261008    gcc-14
sparc                 randconfig-2000-20261007    clang-24
sparc                 randconfig-2001-20261007    clang-24
sparc                randconfig-r2301-20261007    clang-20   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261008    gcc-14
sparc64               randconfig-1001-20261008    gcc-14
sparc64               randconfig-2000-20261007    clang-24
sparc64               randconfig-2001-20261007    clang-24
sparc64              randconfig-r2100-20261007    gcc-8.5.0  cocci
sparc64              randconfig-r2102-20261007    gcc-11.5.0 cocci
sparc64              randconfig-r2201-20261007    gcc-16.1.0 smatch
sparc64              randconfig-r2300-20261007    clang-20   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261008    gcc-14
um                    randconfig-1001-20261008    gcc-14
um                    randconfig-2000-20261007    clang-24
um                    randconfig-2001-20261007    clang-24
um                   randconfig-r2307-20261007    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261007    gcc-14
x86_64      buildonly-randconfig-1000-20261008    gcc-14
x86_64      buildonly-randconfig-1001-20261007    gcc-14
x86_64      buildonly-randconfig-1001-20261008    gcc-14
x86_64      buildonly-randconfig-1002-20261007    gcc-14
x86_64      buildonly-randconfig-1002-20261008    gcc-14
x86_64      buildonly-randconfig-1003-20261007    gcc-14
x86_64      buildonly-randconfig-1003-20261008    gcc-14
x86_64      buildonly-randconfig-1004-20261007    gcc-14
x86_64      buildonly-randconfig-1004-20261008    gcc-14
x86_64      buildonly-randconfig-1005-20261007    gcc-14
x86_64      buildonly-randconfig-1005-20261008    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261007    clang-22
x86_64                randconfig-1000-20261008    gcc-14
x86_64                randconfig-1001-20261007    clang-22
x86_64                randconfig-1001-20261008    gcc-14
x86_64                randconfig-1002-20261007    clang-22
x86_64                randconfig-1002-20261008    gcc-14
x86_64                randconfig-1003-20261007    clang-22
x86_64                randconfig-1003-20261008    gcc-14
x86_64                randconfig-1004-20261007    clang-22
x86_64                randconfig-1004-20261008    gcc-14
x86_64                randconfig-1005-20261007    clang-22
x86_64                randconfig-1005-20261008    gcc-14
x86_64                randconfig-1006-20261007    clang-22
x86_64                randconfig-1006-20261008    clang-22
x86_64                randconfig-1007-20261007    clang-22
x86_64                randconfig-1007-20261008    clang-22
x86_64                randconfig-1008-20261007    clang-22
x86_64                randconfig-1008-20261008    clang-22
x86_64                randconfig-1009-20261007    clang-22
x86_64                randconfig-1009-20261008    clang-22
x86_64                randconfig-1010-20261007    clang-22
x86_64                randconfig-1010-20261008    clang-22
x86_64                randconfig-1011-20261007    clang-22
x86_64                randconfig-1011-20261008    clang-22
x86_64                randconfig-1012-20261007    gcc-12
x86_64                randconfig-1012-20261008    clang-22
x86_64                randconfig-1013-20261007    gcc-12
x86_64                randconfig-1013-20261008    clang-22
x86_64                randconfig-1014-20261007    gcc-12
x86_64                randconfig-1014-20261008    clang-22
x86_64                randconfig-1015-20261007    gcc-12
x86_64                randconfig-1015-20261008    clang-22
x86_64                randconfig-1016-20261007    gcc-12
x86_64                randconfig-1016-20261008    clang-22
x86_64                randconfig-1017-20261007    gcc-12
x86_64                randconfig-1017-20261008    clang-22
x86_64                randconfig-2100-20261007    clang-22   cocci
x86_64                randconfig-2101-20261007    clang-22   cocci
x86_64                randconfig-2102-20261007    clang-22   cocci
x86_64                randconfig-2103-20261007    clang-22   cocci
x86_64                randconfig-2200-20261007    gcc-14     smatch
x86_64                randconfig-2300-20261007    clang-22   sparse
x86_64                randconfig-2301-20261007    clang-22   sparse
x86_64                randconfig-2302-20261007    clang-22   sparse
x86_64               randconfig-r2104-20261007    clang-22   cocci
x86_64               randconfig-r2308-20261007    clang-24   sparse
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
xtensa                randconfig-1000-20261008    gcc-14
xtensa                randconfig-1001-20261008    gcc-14
xtensa                randconfig-2000-20261007    clang-24
xtensa                randconfig-2001-20261007    clang-24
xtensa               randconfig-r2103-20261007    gcc-8.5.0  cocci

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
