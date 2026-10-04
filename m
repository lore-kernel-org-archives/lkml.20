Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364213B9DA5
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094920; cv=none; b=icq/l0tFCidEveWw9bTVku2YiJXcW5eCHp9zemRifPUdcLL84qkY6g1WMChyR0h5CcfrDm3P4gBLN6kKZI/HFyA+PL+aTC9JX3HhzCAfBiOAMOZuNwlpA1WxYoxrf19ltnyeedQ/nSqpe8FXSQnHSV7e40aSBjlF9x/t0uVhZUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094920; c=relaxed/simple;
	bh=0k8EKLdPFJRCEdlp/HesWzuL4s47+DWTwsIqw8qCfbI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kDrwQQODqeaVJkUxWv88T9ei5AcfT3YZKZIOYR8zJWnadkKq0JT+fRayg/d0k/kOIH3fW1GH4JOHCXeUNazraX/S4NvJ/HER3BeSQYYIbquMBS1vx2KrIzXwjjrYPt6BdE0rC/cl1sRXt3h2pnXsX5rq7NBwCCv7ddI/7D9m++Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+Y1UWC5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+Y1UWC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791094918; x=1822630918;
  h=date:from:to:cc:subject:message-id;
  bh=0k8EKLdPFJRCEdlp/HesWzuL4s47+DWTwsIqw8qCfbI=;
  b=A+Y1UWC5IZ/Q1IrvI0sJ5JIWbQtLaVGjGDGPZsI5FXQYkfY72FlBxP8r
   X5AhICJIWtD7YWSwIyYCoAx1ob1mW0CeZmwKFbnyj9HDN/I8zRxIAfiGw
   SrHhjJsNGVVXvpRKrgdMpkEEvY7ywhKkhhUmrN5gKa/PB1OdLkaUzr0pZ
   1BbdCgo7Df+4KAu45L805If9rAWdsHCfAUqLCkYEydkcC7zMIi0wyJTvv
   VPtq67YFYDX8vQDsZCk3PecDsLN5X84kbiCmqeV5poFmC1INR0X/khSHs
   zrITvZpWq4tBCp8gTRXR5PV/o0zq3UjLF1Ezso+lygYaDGZ+DbpvHf8c7
   g==;
X-CSE-ConnectionGUID: IugNo0orTPywQ/BEdCmpEw==
X-CSE-MsgGUID: r6xaA6e9TZS23rWgjdNUPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="103170080"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="103170080"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 23:21:55 -0700
X-CSE-ConnectionGUID: yiiWhaLOQ+WZSNdA8sbnkA==
X-CSE-MsgGUID: p/TQJeVLQ2SO2HwgPThH0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="279841310"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Oct 2026 23:21:54 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDFbb-00000000UXj-2r9S;
	Sun, 04 Oct 2026 06:21:51 +0000
Date: Sun, 04 Oct 2026 14:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip:urgent] BUILD SUCCESS
 254979e0c666240a3afc2f8092a329ca0a161a50
Message-ID: <202610041424.ZSxLTrMA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 254979e0c666240a3afc2f8092a329ca0a161a50  Merge branch into tip/master: 'x86/mm'

elapsed time: 1485m

configs tested: 372
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20261002    gcc-16.1.0 cocci
alpha                randconfig-r2202-20261002    gcc-10.5.0 smatch
alpha                randconfig-r2301-20261002    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                  nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261004    clang-22
arc                   randconfig-1001-20261004    clang-22
arc                  randconfig-r2100-20261002    gcc-16.1.0 cocci
arc                  randconfig-r2103-20261003    gcc-11.5.0 cocci
arc                  randconfig-r2300-20261002    clang-24   sparse
arc                  randconfig-r2300-20261002    gcc-14     sparse
arc                  randconfig-r2301-20261003    gcc-14     sparse
arc                  randconfig-r2305-20261002    clang-24   sparse
arc                  randconfig-r2306-20261002    gcc-16.1.0 sparse
arc                  randconfig-r2309-20261002    clang-20   sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             qcom_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261004    clang-22
arm                   randconfig-1001-20261004    clang-22
arm                   randconfig-1002-20261004    clang-22
arm                   randconfig-1003-20261004    clang-22
arm                  randconfig-r2104-20261003    gcc-15.2.0 cocci
arm                  randconfig-r2106-20261002    clang-24   cocci
arm                  randconfig-r2106-20261002    gcc-16.1.0 cocci
arm                  randconfig-r2202-20261002    clang-24   smatch
arm                  randconfig-r2309-20261003    gcc-8.5.0  sparse
arm                          s3c6400_defconfig    gcc-16.1.0
arm                     vt8500_v6_v7_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261004    gcc-16.1.0
arm64                 randconfig-1001-20261004    gcc-16.1.0
arm64                 randconfig-1002-20261004    gcc-16.1.0
arm64                 randconfig-1003-20261004    gcc-16.1.0
arm64                randconfig-r2101-20261002    gcc-8.5.0  cocci
arm64                randconfig-r2102-20261002    clang-24   cocci
arm64                randconfig-r2103-20261002    clang-24   cocci
arm64                randconfig-r2105-20261002    gcc-14.3.0 cocci
arm64                randconfig-r2107-20261002    clang-24   cocci
arm64                randconfig-r2200-20261003    gcc-16.1.0 smatch
arm64                randconfig-r2300-20261003    gcc-9.5.0  sparse
arm64                randconfig-r2307-20261003    gcc-8.5.0  sparse
arm64                randconfig-r2309-20261002    gcc-16.1.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261004    gcc-16.1.0
csky                  randconfig-1001-20261004    gcc-16.1.0
csky                 randconfig-r2106-20261003    gcc-15.2.0 cocci
csky                 randconfig-r2301-20261002    gcc-16.1.0 sparse
csky                 randconfig-r2309-20261002    gcc-14.3.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261004    gcc-16.1.0
hexagon               randconfig-1001-20261004    gcc-16.1.0
hexagon              randconfig-r2100-20261003    gcc-11.5.0 cocci
hexagon              randconfig-r2103-20261002    gcc-16.1.0 cocci
hexagon              randconfig-r2202-20261002    clang-18   smatch
hexagon              randconfig-r2302-20261002    gcc-16.1.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261004    clang-22
i386        buildonly-randconfig-1001-20261004    clang-22
i386        buildonly-randconfig-1002-20261004    clang-22
i386        buildonly-randconfig-1003-20261004    clang-22
i386        buildonly-randconfig-1004-20261004    clang-22
i386        buildonly-randconfig-1005-20261004    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261004    gcc-14
i386                  randconfig-1001-20261004    gcc-14
i386                  randconfig-1002-20261004    gcc-14
i386                  randconfig-1003-20261004    gcc-14
i386                  randconfig-1004-20261004    gcc-14
i386                  randconfig-1005-20261004    gcc-14
i386                  randconfig-1006-20261004    gcc-14
i386                  randconfig-1007-20261004    clang-22
i386                  randconfig-1008-20261004    clang-22
i386                  randconfig-1009-20261004    clang-22
i386                  randconfig-1010-20261004    clang-22
i386                  randconfig-1011-20261004    clang-22
i386                  randconfig-1012-20261004    clang-22
i386                  randconfig-1013-20261004    clang-22
i386                  randconfig-2100-20261002    gcc-14     cocci
i386                  randconfig-2100-20261003    gcc-14     cocci
i386                  randconfig-2101-20261002    gcc-14     cocci
i386                  randconfig-2101-20261003    gcc-14     cocci
i386                  randconfig-2102-20261002    gcc-14     cocci
i386                  randconfig-2102-20261003    gcc-14     cocci
i386                  randconfig-2103-20261002    gcc-14     cocci
i386                  randconfig-2103-20261003    gcc-14     cocci
i386                  randconfig-2200-20261002    gcc-14     smatch
i386                  randconfig-2200-20261003    gcc-14     smatch
i386                  randconfig-2300-20261002    gcc-12     sparse
i386                  randconfig-2300-20261003    clang-22   sparse
i386                  randconfig-2301-20261002    gcc-12     sparse
i386                  randconfig-2301-20261003    clang-22   sparse
i386                  randconfig-2302-20261002    gcc-12     sparse
i386                  randconfig-2302-20261003    clang-22   sparse
i386                 randconfig-r2104-20261002    gcc-14.3.0 cocci
i386                 randconfig-r2107-20261003    clang-21   cocci
i386                 randconfig-r2201-20261002    gcc-14     smatch
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261004    gcc-16.1.0
loongarch             randconfig-1001-20261004    gcc-16.1.0
loongarch            randconfig-r2200-20261002    gcc-16.1.0 smatch
loongarch            randconfig-r2202-20261002    gcc-16.1.0 smatch
loongarch            randconfig-r2301-20261002    clang-24   sparse
loongarch            randconfig-r2303-20261002    clang-24   sparse
loongarch            randconfig-r2304-20261002    clang-24   sparse
loongarch            randconfig-r2305-20261002    gcc-14     sparse
loongarch            randconfig-r2307-20261003    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                          apollo_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                 randconfig-r2101-20261003    gcc-12.5.0 cocci
m68k                 randconfig-r2103-20261002    clang-17   cocci
m68k                 randconfig-r2103-20261003    gcc-12.5.0 cocci
m68k                 randconfig-r2106-20261002    gcc-12.5.0 cocci
m68k                 randconfig-r2201-20261003    gcc-9.5.0  smatch
m68k                 randconfig-r2202-20261003    gcc-11.5.0 smatch
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2304-20261002    gcc-8.5.0  sparse
microblaze           randconfig-r2305-20261003    gcc-9.5.0  sparse
microblaze           randconfig-r2307-20261002    gcc-16.1.0 sparse
microblaze           randconfig-r2308-20261002    clang-22   sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           eyeq6_defconfig    gcc-16.1.0
mips                            ip32_defconfig    gcc-16.1.0
mips                 malta_qemu_32r6_defconfig    gcc-16.1.0
mips                 randconfig-r2106-20261002    gcc-14.3.0 cocci
mips                 randconfig-r2200-20261003    clang-24   smatch
mips                 randconfig-r2300-20261003    gcc-14     sparse
mips                 randconfig-r2303-20261002    gcc-8.5.0  sparse
mips                 randconfig-r2303-20261003    gcc-9.5.0  sparse
mips                 randconfig-r2308-20261003    gcc-8.5.0  sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261004    gcc-16.1.0
nios2                 randconfig-1001-20261004    gcc-16.1.0
nios2                randconfig-r2100-20261002    gcc-8.5.0  cocci
nios2                randconfig-r2101-20261002    clang-17   cocci
nios2                randconfig-r2300-20261002    gcc-8.5.0  sparse
nios2                randconfig-r2306-20261003    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2302-20261003    gcc-9.5.0  sparse
openrisc             randconfig-r2303-20261002    gcc-16.1.0 sparse
openrisc             randconfig-r2308-20261002    gcc-14.3.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                 generic-32bit_defconfig    gcc-16.1.0
parisc                randconfig-1000-20261004    gcc-12.5.0
parisc                randconfig-1001-20261004    gcc-12.5.0
parisc               randconfig-r2102-20261003    gcc-12.5.0 cocci
parisc               randconfig-r2104-20261002    gcc-16.1.0 cocci
parisc               randconfig-r2107-20261002    gcc-12.5.0 cocci
parisc               randconfig-r2307-20261002    clang-22   sparse
parisc64                          alldefconfig    gcc-16.1.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                      kmeter1_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261004    gcc-12.5.0
powerpc               randconfig-1001-20261004    gcc-12.5.0
powerpc              randconfig-r2102-20261002    clang-17   cocci
powerpc              randconfig-r2104-20261002    clang-24   cocci
powerpc              randconfig-r2104-20261003    clang-21   cocci
powerpc              randconfig-r2303-20261002    gcc-14     sparse
powerpc64             randconfig-1000-20261004    gcc-12.5.0
powerpc64             randconfig-1001-20261004    gcc-12.5.0
powerpc64            randconfig-r2100-20261002    clang-24   cocci
powerpc64            randconfig-r2107-20261002    gcc-14.3.0 cocci
powerpc64            randconfig-r2201-20261002    clang-24   smatch
powerpc64            randconfig-r2302-20261002    gcc-8.5.0  sparse
powerpc64            randconfig-r2302-20261003    gcc-14     sparse
powerpc64            randconfig-r2305-20261002    gcc-16.1.0 sparse
powerpc64            randconfig-r2309-20261002    clang-22   sparse
powerpc64            randconfig-r2309-20261003    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261004    gcc-11.5.0
riscv                 randconfig-1001-20261004    gcc-11.5.0
riscv                 randconfig-2000-20261002    gcc-9.5.0
riscv                 randconfig-2000-20261003    gcc-16.1.0
riscv                 randconfig-2001-20261002    gcc-9.5.0
riscv                 randconfig-2001-20261003    gcc-16.1.0
riscv                randconfig-r2101-20261002    clang-24   cocci
riscv                randconfig-r2102-20261003    gcc-11.5.0 cocci
riscv                randconfig-r2301-20261003    gcc-9.5.0  sparse
riscv                randconfig-r2302-20261002    clang-24   sparse
riscv                randconfig-r2306-20261002    gcc-14.3.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261004    gcc-11.5.0
s390                  randconfig-1001-20261004    gcc-11.5.0
s390                  randconfig-2000-20261002    gcc-9.5.0
s390                  randconfig-2000-20261003    gcc-16.1.0
s390                  randconfig-2001-20261002    gcc-9.5.0
s390                  randconfig-2001-20261003    gcc-16.1.0
s390                 randconfig-r2100-20261002    clang-17   cocci
s390                 randconfig-r2100-20261003    gcc-12.5.0 cocci
s390                 randconfig-r2305-20261003    gcc-14     sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261004    gcc-11.5.0
sh                    randconfig-1001-20261004    gcc-11.5.0
sh                    randconfig-2000-20261002    gcc-9.5.0
sh                    randconfig-2000-20261003    gcc-16.1.0
sh                    randconfig-2001-20261002    gcc-9.5.0
sh                    randconfig-2001-20261003    gcc-16.1.0
sh                   randconfig-r2201-20261002    gcc-12.5.0 smatch
sh                   randconfig-r2304-20261003    gcc-9.5.0  sparse
sh                   randconfig-r2306-20261003    clang-24   sparse
sh                            se7724_defconfig    gcc-16.1.0
sh                      sh7710voipgw_defconfig    gcc-16.1.0
sh                         sh7785lcr_defconfig    gcc-16.1.0
sparc                             alldefconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261004    gcc-14
sparc                 randconfig-1001-20261004    gcc-14
sparc                 randconfig-2000-20261002    clang-24
sparc                 randconfig-2000-20261003    gcc-14
sparc                 randconfig-2001-20261002    clang-24
sparc                 randconfig-2001-20261003    gcc-14
sparc                randconfig-r2101-20261003    gcc-11.5.0 cocci
sparc                randconfig-r2102-20261002    gcc-8.5.0  cocci
sparc                randconfig-r2103-20261002    gcc-8.5.0  cocci
sparc                randconfig-r2107-20261002    gcc-16.1.0 cocci
sparc                randconfig-r2201-20261002    gcc-8.5.0  smatch
sparc                randconfig-r2305-20261002    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261004    gcc-14
sparc64               randconfig-1001-20261004    gcc-14
sparc64               randconfig-2000-20261002    clang-24
sparc64               randconfig-2000-20261003    gcc-14
sparc64               randconfig-2001-20261002    clang-24
sparc64               randconfig-2001-20261003    gcc-14
sparc64              randconfig-r2104-20261002    gcc-12.5.0 cocci
sparc64              randconfig-r2105-20261002    clang-24   cocci
sparc64              randconfig-r2105-20261002    gcc-12.5.0 cocci
sparc64              randconfig-r2105-20261002    gcc-16.1.0 cocci
sparc64              randconfig-r2106-20261003    clang-21   cocci
sparc64              randconfig-r2200-20261002    gcc-15.2.0 smatch
sparc64              randconfig-r2302-20261002    gcc-14     sparse
sparc64              randconfig-r2304-20261002    gcc-16.1.0 sparse
sparc64              randconfig-r2306-20261002    clang-20   sparse
sparc64              randconfig-r2308-20261002    clang-20   sparse
sparc64              randconfig-r2308-20261002    gcc-16.1.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261004    gcc-14
um                    randconfig-1001-20261004    gcc-14
um                    randconfig-2000-20261002    clang-24
um                    randconfig-2000-20261003    gcc-14
um                    randconfig-2001-20261002    clang-24
um                    randconfig-2001-20261003    gcc-14
um                   randconfig-r2105-20261003    clang-21   cocci
um                   randconfig-r2200-20261002    gcc-14     smatch
um                   randconfig-r2301-20261002    gcc-14     sparse
um                   randconfig-r2304-20261003    gcc-14     sparse
um                   randconfig-r2307-20261002    gcc-14.3.0 sparse
um                   randconfig-r2308-20261003    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261004    gcc-14
x86_64      buildonly-randconfig-1001-20261004    gcc-14
x86_64      buildonly-randconfig-1002-20261004    gcc-14
x86_64      buildonly-randconfig-1003-20261004    gcc-14
x86_64      buildonly-randconfig-1004-20261004    gcc-14
x86_64      buildonly-randconfig-1005-20261004    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261004    gcc-14
x86_64                randconfig-1001-20261004    gcc-14
x86_64                randconfig-1002-20261004    gcc-14
x86_64                randconfig-1003-20261004    gcc-14
x86_64                randconfig-1004-20261004    gcc-14
x86_64                randconfig-1005-20261004    gcc-14
x86_64                randconfig-1006-20261004    clang-22
x86_64                randconfig-1007-20261004    clang-22
x86_64                randconfig-1008-20261004    clang-22
x86_64                randconfig-1009-20261004    clang-22
x86_64                randconfig-1010-20261004    clang-22
x86_64                randconfig-1011-20261004    clang-22
x86_64                randconfig-1012-20261004    gcc-13
x86_64                randconfig-1013-20261004    gcc-13
x86_64                randconfig-1014-20261004    gcc-13
x86_64                randconfig-1015-20261004    gcc-13
x86_64                randconfig-1016-20261004    gcc-13
x86_64                randconfig-1017-20261004    gcc-13
x86_64                randconfig-2100-20261002    gcc-14     cocci
x86_64                randconfig-2100-20261003    clang-22   cocci
x86_64                randconfig-2101-20261002    gcc-14     cocci
x86_64                randconfig-2101-20261003    clang-22   cocci
x86_64                randconfig-2102-20261002    gcc-14     cocci
x86_64                randconfig-2102-20261003    clang-22   cocci
x86_64                randconfig-2103-20261002    gcc-14     cocci
x86_64                randconfig-2103-20261003    clang-22   cocci
x86_64                randconfig-2200-20261002    clang-22   smatch
x86_64                randconfig-2200-20261003    gcc-14     smatch
x86_64                randconfig-2300-20261002    gcc-12     sparse
x86_64                randconfig-2300-20261003    clang-22   sparse
x86_64                randconfig-2301-20261002    gcc-12     sparse
x86_64                randconfig-2301-20261003    clang-22   sparse
x86_64                randconfig-2302-20261002    gcc-12     sparse
x86_64                randconfig-2302-20261003    clang-22   sparse
x86_64               randconfig-r2101-20261002    gcc-16.1.0 cocci
x86_64               randconfig-r2201-20261003    clang-22   smatch
x86_64               randconfig-r2303-20261003    gcc-14     sparse
x86_64               randconfig-r2306-20261002    clang-22   sparse
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
xtensa                randconfig-1000-20261004    gcc-14
xtensa                randconfig-1001-20261004    gcc-14
xtensa                randconfig-2000-20261002    clang-24
xtensa                randconfig-2000-20261003    gcc-14
xtensa                randconfig-2001-20261002    clang-24
xtensa                randconfig-2001-20261003    gcc-14
xtensa               randconfig-r2105-20261003    gcc-15.2.0 cocci
xtensa               randconfig-r2107-20261003    gcc-15.2.0 cocci
xtensa               randconfig-r2300-20261002    gcc-16.1.0 sparse
xtensa               randconfig-r2304-20261002    gcc-14     sparse
xtensa               randconfig-r2307-20261002    clang-20   sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
