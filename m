Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08DF3DF002
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282358; cv=none; b=oSnpeEVmQNErOhOTEJi0j+sZWL40+EoNEIDlq/rXnxX8yii9cKYsRDwJ8EaFVvCJQDvjhf7ZgUpmqX9v28q9JVA+SGn+np3sxxFQahht4Uc3M3yojDBWSMqbzbo5CbxsJX257GnKg67aXvuT20JgMqDFCdEFZx4u2v2RPcM18+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282358; c=relaxed/simple;
	bh=IROdtTh8guSDAJWS/fGoHWEyHU/Rvez6AR3CwfAHovk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pe30DLRYlgPYAxuxICO8sF/9l0w5eKjI/zvVlynwNU7CeCSz2s38pCqlMfK8jxhwaDnoapxAMbwrWzwru7FKyPKjzXlD0yXWSQOxjv/jUBZZY4mOoCJQTQLAF0n3GcIp3Q/S1ChGOPO1H3xl39EBCf2f1aoZRYAdk+OUyBF4soA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gW+xU4wG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gW+xU4wG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790282356; x=1821818356;
  h=date:from:to:cc:subject:message-id;
  bh=IROdtTh8guSDAJWS/fGoHWEyHU/Rvez6AR3CwfAHovk=;
  b=gW+xU4wG8AGv0pUNcXeIFpim0E8fsOjhsYtriBD6SRwQ4Wg5xx/CFVeg
   No1FQ+rxRV0O6oGRgJcLG8Psz9xJNADX/W5zW0a6NpTE0XpQ+IzD7KptH
   y0y9Y0SGM3R+WYLqrM/4cWqFIUHUnB9IXdqusWD2UuaxVNS9xdVmm7jXr
   O4RXDel1P0ujscibfLaW7iYu49VAPhtP3BV1PSimw4s89j3RPWCPND86I
   OsRMaUh7zbN5S62maV8wWqt5d7GGT0Nj43M4kmtYfPlovmh8np4YExjzw
   jmssUOYxtSEKD/H+g17zfCq00smC7yZWDlwoix+20ZCXhw0kyH1FtnJz1
   w==;
X-CSE-ConnectionGUID: 5T757boeQYO/iNpH7PSBxw==
X-CSE-MsgGUID: feSsIYkhTD+msawz0laEIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90026931"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90026931"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 13:39:15 -0700
X-CSE-ConnectionGUID: 2aL7XG3GQHG/7clptS7Mmg==
X-CSE-MsgGUID: VWwOi3FDTiynvR+6Xy4e8w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Sep 2026 13:39:14 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9qDn-00000000Ja6-2BXM;
	Thu, 24 Sep 2026 20:39:11 +0000
Date: Fri, 25 Sep 2026 04:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:cleanups] BUILD SUCCESS
 975809caf4b0e07330110b56ca2d8a3fa7e16ff5
Message-ID: <202609250422.2IFMtEGp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cleanups
branch HEAD: 975809caf4b0e07330110b56ca2d8a3fa7e16ff5  x86/asm/string_64: Remove unused linux/jump_label.h include

elapsed time: 3741m

configs tested: 237
configs skipped: 146

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r1304-20260924    gcc-16.1.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                      haps_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260924    clang-24
arc                   randconfig-1001-20260924    clang-24
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20260924    clang-24
arm                   randconfig-1001-20260924    clang-24
arm                   randconfig-1002-20260924    clang-24
arm                   randconfig-1003-20260924    clang-24
arm                  randconfig-r1305-20260924    gcc-16.1.0 sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260924    gcc-11.5.0
arm64                 randconfig-1001-20260924    gcc-11.5.0
arm64                 randconfig-1002-20260924    gcc-11.5.0
arm64                 randconfig-1003-20260924    gcc-11.5.0
arm64                randconfig-r1302-20260924    gcc-16.1.0 sparse
arm64                randconfig-r1307-20260924    gcc-11.5.0 sparse
arm64                randconfig-r2106-20260923    gcc-15.2.0 cocci
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260924    gcc-11.5.0
csky                  randconfig-1001-20260924    gcc-11.5.0
csky                 randconfig-r1300-20260924    gcc-16.1.0 sparse
csky                 randconfig-r2107-20260923    gcc-15.2.0 cocci
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260924    gcc-8.5.0
hexagon               randconfig-1001-20260924    gcc-8.5.0
hexagon              randconfig-r1301-20260924    gcc-16.1.0 sparse
i386                              allmodconfig    gcc-14
i386                               allnoconfig    gcc-14
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20260924    gcc-14
i386        buildonly-randconfig-1001-20260924    gcc-14
i386        buildonly-randconfig-1002-20260924    gcc-14
i386        buildonly-randconfig-1003-20260924    gcc-14
i386        buildonly-randconfig-1004-20260924    gcc-14
i386        buildonly-randconfig-1005-20260924    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260924    gcc-12
i386                  randconfig-1001-20260924    gcc-12
i386                  randconfig-1002-20260924    gcc-12
i386                  randconfig-1003-20260924    gcc-12
i386                  randconfig-1004-20260924    gcc-12
i386                  randconfig-1005-20260924    gcc-12
i386                  randconfig-1006-20260924    gcc-12
i386                  randconfig-1007-20260924    clang-22
i386                  randconfig-1008-20260924    clang-22
i386                  randconfig-1009-20260924    clang-22
i386                  randconfig-1010-20260924    clang-22
i386                  randconfig-1011-20260924    clang-22
i386                  randconfig-1012-20260924    clang-22
i386                  randconfig-1013-20260924    clang-22
i386                  randconfig-1300-20260924    clang-22   sparse
i386                  randconfig-1300-20260924    gcc-14     sparse
i386                  randconfig-1301-20260924    clang-22   sparse
i386                  randconfig-1301-20260924    gcc-14     sparse
i386                  randconfig-1302-20260924    clang-22   sparse
i386                  randconfig-2100-20260919    clang-22   cocci
i386                  randconfig-2100-20260923    clang-22   cocci
i386                  randconfig-2101-20260919    clang-22   cocci
i386                  randconfig-2101-20260923    clang-22   cocci
i386                  randconfig-2102-20260919    clang-22   cocci
i386                  randconfig-2102-20260923    clang-22   cocci
i386                  randconfig-2103-20260919    clang-22   cocci
i386                  randconfig-2103-20260923    clang-22   cocci
i386                  randconfig-2200-20260919    clang-22   smatch
i386                  randconfig-2200-20260923    gcc-12     smatch
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260924    gcc-8.5.0
loongarch             randconfig-1001-20260924    gcc-8.5.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.1.0
m68k                         m5307c3_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
mips                 randconfig-r1309-20260924    gcc-11.5.0 sparse
mips                 randconfig-r2104-20260923    gcc-15.2.0 cocci
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260924    gcc-8.5.0
nios2                 randconfig-1001-20260924    gcc-8.5.0
nios2                randconfig-r1303-20260924    gcc-16.1.0 sparse
nios2                randconfig-r1306-20260924    gcc-11.5.0 sparse
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260924    gcc-8.5.0
parisc                randconfig-1001-20260924    gcc-8.5.0
parisc               randconfig-r2103-20260923    gcc-14     cocci
parisc               randconfig-r2202-20260923    gcc-12.5.0 smatch
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                       mgcoge_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260924    gcc-8.5.0
powerpc               randconfig-1001-20260924    gcc-8.5.0
powerpc64             randconfig-1000-20260924    gcc-8.5.0
powerpc64             randconfig-1001-20260924    gcc-8.5.0
powerpc64            randconfig-r2105-20260923    gcc-15.2.0 cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260924    gcc-15.2.0
riscv                 randconfig-1001-20260924    gcc-15.2.0
riscv                 randconfig-2000-20260923    gcc-9.5.0
riscv                 randconfig-2001-20260923    gcc-9.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260924    gcc-15.2.0
s390                  randconfig-1001-20260924    gcc-15.2.0
s390                  randconfig-2000-20260923    gcc-9.5.0
s390                  randconfig-2001-20260923    gcc-9.5.0
s390                 randconfig-r1308-20260924    gcc-11.5.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20260924    gcc-15.2.0
sh                    randconfig-1001-20260924    gcc-15.2.0
sh                    randconfig-2000-20260923    gcc-9.5.0
sh                    randconfig-2001-20260923    gcc-9.5.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260924    clang-17
sparc                 randconfig-1001-20260924    clang-17
sparc                 randconfig-2000-20260923    gcc-14.3.0
sparc                 randconfig-2001-20260923    gcc-14.3.0
sparc                randconfig-r2200-20260923    gcc-8.5.0  smatch
sparc                randconfig-r2201-20260923    gcc-11.5.0 smatch
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260924    clang-17
sparc64               randconfig-1001-20260924    clang-17
sparc64               randconfig-2000-20260923    gcc-14.3.0
sparc64               randconfig-2001-20260923    gcc-14.3.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260924    clang-17
um                    randconfig-1001-20260924    clang-17
um                    randconfig-2000-20260923    gcc-14.3.0
um                    randconfig-2001-20260923    gcc-14.3.0
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20260924    clang-22
x86_64      buildonly-randconfig-1001-20260924    clang-22
x86_64      buildonly-randconfig-1002-20260924    clang-22
x86_64      buildonly-randconfig-1003-20260924    clang-22
x86_64      buildonly-randconfig-1004-20260924    clang-22
x86_64      buildonly-randconfig-1005-20260924    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260924    clang-22
x86_64                randconfig-1001-20260924    clang-22
x86_64                randconfig-1002-20260924    clang-22
x86_64                randconfig-1003-20260924    clang-22
x86_64                randconfig-1004-20260924    clang-22
x86_64                randconfig-1005-20260924    clang-22
x86_64                randconfig-1006-20260924    clang-22
x86_64                randconfig-1007-20260924    clang-22
x86_64                randconfig-1008-20260924    clang-22
x86_64                randconfig-1009-20260924    clang-22
x86_64                randconfig-1010-20260924    clang-22
x86_64                randconfig-1011-20260924    clang-22
x86_64                randconfig-1012-20260924    clang-22
x86_64                randconfig-1013-20260924    clang-22
x86_64                randconfig-1014-20260924    clang-22
x86_64                randconfig-1015-20260924    clang-22
x86_64                randconfig-1015-20260924    gcc-14
x86_64                randconfig-1016-20260924    clang-22
x86_64                randconfig-1016-20260924    gcc-14
x86_64                randconfig-1017-20260924    clang-22
x86_64                randconfig-1017-20260924    gcc-14
x86_64                randconfig-1300-20260924    clang-22   sparse
x86_64                randconfig-1300-20260924    gcc-14     sparse
x86_64                randconfig-1301-20260924    clang-22   sparse
x86_64                randconfig-1302-20260924    clang-22   sparse
x86_64                randconfig-2100-20260919    gcc-14     cocci
x86_64                randconfig-2100-20260923    clang-22   cocci
x86_64                randconfig-2101-20260919    clang-22   cocci
x86_64                randconfig-2101-20260923    clang-22   cocci
x86_64                randconfig-2102-20260919    clang-22   cocci
x86_64                randconfig-2102-20260923    clang-22   cocci
x86_64                randconfig-2103-20260919    clang-22   cocci
x86_64                randconfig-2103-20260923    clang-22   cocci
x86_64                randconfig-2200-20260919    clang-22   smatch
x86_64                randconfig-2200-20260923    gcc-14     smatch
x86_64               randconfig-r2100-20260923    gcc-14     cocci
x86_64               randconfig-r2101-20260923    gcc-14     cocci
x86_64               randconfig-r2102-20260923    gcc-14     cocci
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
xtensa                            alldefconfig    gcc-16.1.0
xtensa                             allnoconfig    clang-24
xtensa                randconfig-1000-20260924    clang-17
xtensa                randconfig-1001-20260924    clang-17
xtensa                randconfig-2000-20260923    gcc-14.3.0
xtensa                randconfig-2001-20260923    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
