Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2904963B2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537666; cv=none; b=sof02UntNiKwgorzqo9IotjlPN+fkndBmyZJVac/SE1NSbpJis3v5R1o8yFT8VK0kwulEDRGwwvj50uj5kTD/tQcfUiw63/AdMtKax7/FBGX9EmJdRkJuNOzmkfQe8M6HCzcpXmGITW2qjgSRtNRM1h6f06dzj5vycRTM7du8j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537666; c=relaxed/simple;
	bh=l7CtVc+wfvhf7erW+fiIVKKkfMjU3GeKOdPNA1NyYE4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o8Qw3RzQsdL8kcHHbJ3tYGnt2loIBcxQs+2CuWQeqpT4yHZnM7bCqxBZC4c1JA+kkyFdKbbAvLAMReLgsewAFmlChXVZN+FfWOb4+zyL04id7DILJE03wD+TFVedmI8cxb9fpRVyJqF8DrD7zBGN/j0cw5XNF59BrZYo/HpkPO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHkV4MCY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHkV4MCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791537664; x=1823073664;
  h=date:from:to:cc:subject:message-id;
  bh=l7CtVc+wfvhf7erW+fiIVKKkfMjU3GeKOdPNA1NyYE4=;
  b=kHkV4MCYogyZUqDksHYfSKBbdru98plXjAC/DazXUm/VBZ3OBFr3qEzX
   dTnF4HoEJCFhTk/kiHqgcMdMtacq6dFXKLTJ+/oJ54FcxoqBg5Uro//hJ
   Q7lbXPT6qVj11/Ey1sqo/LbKwreP10sGJzayVhPGbcvbTW+UmpcOcshlR
   jXji08CymI19QLGN1xsCyufzipDilq8V36e0gUOIxj1Y5bnRxTV8WSR5R
   IYadNZl8HAKU+ioszPJEfrFDk7h0ddkO1E/kUX0l8Qv1lCShyqVicsSEO
   JfBB3Nnra+qBF7dHlGWTHUpbQFBNQJ1yw7Aroa8ARwFMicQ6h2O2Ge/g2
   g==;
X-CSE-ConnectionGUID: uQyz6edfTZOosZmftFmxew==
X-CSE-MsgGUID: 3DHIRJl9QjiIkvc13z4VeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="227493"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="227493"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:21:01 -0700
X-CSE-ConnectionGUID: BgCyvPnWTliZ9CMVnSX/8A==
X-CSE-MsgGUID: dDgH2u4BTiKw3b7LANx4rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="231888"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Oct 2026 02:20:59 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF6me-000000005Xd-44qh;
	Fri, 09 Oct 2026 09:20:56 +0000
Date: Fri, 09 Oct 2026 17:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip:urgent] BUILD SUCCESS
 3daee811941009ed41edd3490447549119f70b44
Message-ID: <202610091749.dcfXewq7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 3daee811941009ed41edd3490447549119f70b44  Merge branch into tip/master: 'x86/urgent'

elapsed time: 1219m

configs tested: 383
configs skipped: 139

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20261008    gcc-9.5.0  cocci
alpha                randconfig-r2102-20261008    clang-22   cocci
alpha                randconfig-r2102-20261008    gcc-12.5.0 cocci
alpha                randconfig-r2104-20261008    gcc-14     cocci
alpha                randconfig-r2105-20261007    gcc-9.5.0  cocci
alpha                randconfig-r2107-20261008    gcc-8.5.0  cocci
alpha                randconfig-r2202-20261007    gcc-8.5.0  smatch
alpha                randconfig-r2304-20261007    clang-24   sparse
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261009    gcc-10.5.0
arc                   randconfig-1001-20261009    gcc-10.5.0
arc                  randconfig-r2104-20261008    gcc-8.5.0  cocci
arc                  randconfig-r2300-20261008    clang-24   sparse
arc                  randconfig-r2304-20261008    clang-24   sparse
arm                                allnoconfig    gcc-16.1.0
arm                          bcm2835_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             mmp2_defconfig    gcc-16.1.0
arm                             mps2_defconfig    clang-24
arm                   randconfig-1000-20261009    gcc-10.5.0
arm                   randconfig-1001-20261009    gcc-10.5.0
arm                   randconfig-1002-20261009    gcc-10.5.0
arm                   randconfig-1003-20261009    gcc-10.5.0
arm                  randconfig-r2101-20261008    gcc-8.5.0  cocci
arm                  randconfig-r2104-20261008    gcc-16.1.0 cocci
arm                  randconfig-r2107-20261008    gcc-14     cocci
arm                  randconfig-r2107-20261008    gcc-16.1.0 cocci
arm                  randconfig-r2202-20261007    gcc-12.5.0 smatch
arm                  randconfig-r2300-20261007    gcc-14.3.0 sparse
arm                  randconfig-r2300-20261008    gcc-10.5.0 sparse
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261009    gcc-15.2.0
arm64                 randconfig-1001-20261009    gcc-15.2.0
arm64                 randconfig-1002-20261009    gcc-15.2.0
arm64                 randconfig-1003-20261009    gcc-15.2.0
arm64                randconfig-r2304-20261008    gcc-10.5.0 sparse
arm64                randconfig-r2306-20261007    gcc-14     sparse
arm64                randconfig-r2307-20261008    clang-24   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261009    gcc-15.2.0
csky                  randconfig-1001-20261009    gcc-15.2.0
csky                 randconfig-r2106-20261007    gcc-9.5.0  cocci
csky                 randconfig-r2301-20261008    gcc-10.5.0 sparse
csky                 randconfig-r2307-20261008    gcc-8.5.0  sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261008    gcc-16.1.0
hexagon               randconfig-1000-20261009    clang-18
hexagon               randconfig-1001-20261008    gcc-16.1.0
hexagon               randconfig-1001-20261009    clang-18
hexagon              randconfig-r2201-20261008    clang-24   smatch
hexagon              randconfig-r2305-20261008    gcc-13.4.0 sparse
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20261009    clang-22
i386        buildonly-randconfig-1001-20261009    clang-22
i386        buildonly-randconfig-1002-20261009    clang-22
i386        buildonly-randconfig-1003-20261009    clang-22
i386        buildonly-randconfig-1004-20261009    clang-22
i386        buildonly-randconfig-1005-20261009    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261008    gcc-14
i386                  randconfig-1000-20261009    clang-22
i386                  randconfig-1001-20261008    gcc-14
i386                  randconfig-1001-20261009    clang-22
i386                  randconfig-1002-20261008    gcc-14
i386                  randconfig-1002-20261009    clang-22
i386                  randconfig-1003-20261008    gcc-14
i386                  randconfig-1003-20261009    clang-22
i386                  randconfig-1004-20261008    gcc-14
i386                  randconfig-1004-20261009    clang-22
i386                  randconfig-1005-20261008    gcc-14
i386                  randconfig-1005-20261009    clang-22
i386                  randconfig-1006-20261008    gcc-14
i386                  randconfig-1006-20261009    clang-22
i386                  randconfig-1007-20261008    clang-22
i386                  randconfig-1007-20261009    clang-22
i386                  randconfig-1008-20261008    clang-22
i386                  randconfig-1008-20261009    clang-22
i386                  randconfig-1009-20261008    clang-22
i386                  randconfig-1009-20261009    clang-22
i386                  randconfig-1010-20261008    clang-22
i386                  randconfig-1010-20261009    clang-22
i386                  randconfig-1011-20261008    clang-22
i386                  randconfig-1011-20261009    clang-22
i386                  randconfig-1012-20261008    clang-22
i386                  randconfig-1012-20261009    clang-22
i386                  randconfig-1013-20261008    clang-22
i386                  randconfig-1013-20261009    clang-22
i386                  randconfig-2100-20261007    clang-22   cocci
i386                  randconfig-2100-20261008    clang-22   cocci
i386                  randconfig-2101-20261007    clang-22   cocci
i386                  randconfig-2101-20261008    clang-22   cocci
i386                  randconfig-2102-20261007    clang-22   cocci
i386                  randconfig-2102-20261008    clang-22   cocci
i386                  randconfig-2103-20261007    clang-22   cocci
i386                  randconfig-2103-20261008    clang-22   cocci
i386                  randconfig-2200-20261007    gcc-14     smatch
i386                  randconfig-2200-20261008    clang-22   smatch
i386                  randconfig-2300-20261007    clang-22   sparse
i386                  randconfig-2300-20261008    clang-22   sparse
i386                  randconfig-2301-20261007    clang-22   sparse
i386                  randconfig-2301-20261008    clang-22   sparse
i386                  randconfig-2302-20261007    clang-22   sparse
i386                  randconfig-2302-20261008    clang-22   sparse
i386                 randconfig-r2101-20261008    clang-22   cocci
i386                 randconfig-r2304-20261008    gcc-13.4.0 sparse
i386                 randconfig-r2309-20261007    gcc-14     sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261008    gcc-16.1.0
loongarch             randconfig-1000-20261009    clang-18
loongarch             randconfig-1001-20261008    gcc-16.1.0
loongarch             randconfig-1001-20261009    clang-18
loongarch            randconfig-r2100-20261008    gcc-12.5.0 cocci
loongarch            randconfig-r2101-20261008    gcc-9.5.0  cocci
loongarch            randconfig-r2106-20261008    gcc-14     cocci
loongarch            randconfig-r2307-20261008    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    clang-24
m68k                 randconfig-r2105-20261008    gcc-8.5.0  cocci
m68k                 randconfig-r2200-20261008    gcc-16.1.0 smatch
m68k                 randconfig-r2202-20261008    gcc-8.5.0  smatch
m68k                 randconfig-r2300-20261008    gcc-13.4.0 sparse
m68k                 randconfig-r2301-20261008    gcc-13.4.0 sparse
m68k                 randconfig-r2302-20261007    clang-24   sparse
m68k                 randconfig-r2305-20261007    gcc-14.3.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2105-20261007    gcc-9.5.0  cocci
microblaze           randconfig-r2304-20261007    gcc-14.3.0 sparse
microblaze           randconfig-r2305-20261008    gcc-10.5.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         bcm63xx_defconfig    clang-24
mips                       maltasmvp_defconfig    gcc-16.1.0
mips                 randconfig-r2107-20261008    gcc-16.1.0 cocci
mips                 randconfig-r2300-20261008    gcc-13.4.0 sparse
mips                 randconfig-r2306-20261008    clang-24   sparse
nios2                             alldefconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261008    gcc-16.1.0
nios2                 randconfig-1000-20261009    clang-18
nios2                 randconfig-1001-20261008    gcc-16.1.0
nios2                 randconfig-1001-20261009    clang-18
nios2                randconfig-r2100-20261008    clang-24   cocci
nios2                randconfig-r2102-20261008    gcc-9.5.0  cocci
nios2                randconfig-r2103-20261008    gcc-12.5.0 cocci
nios2                randconfig-r2202-20261008    gcc-8.5.0  smatch
nios2                randconfig-r2301-20261007    gcc-14.3.0 sparse
nios2                randconfig-r2301-20261008    clang-24   sparse
nios2                randconfig-r2302-20261008    gcc-10.5.0 sparse
nios2                randconfig-r2305-20261007    clang-24   sparse
nios2                randconfig-r2306-20261008    gcc-8.5.0  sparse
nios2                randconfig-r2307-20261007    gcc-14     sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc                   or1klitex_defconfig    gcc-16.1.0
openrisc             randconfig-r2104-20261007    gcc-9.5.0  cocci
openrisc             randconfig-r2104-20261008    gcc-16.1.0 cocci
openrisc             randconfig-r2202-20261008    gcc-15.2.0 smatch
openrisc             randconfig-r2301-20261007    clang-24   sparse
openrisc             randconfig-r2305-20261008    clang-24   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261009    gcc-8.5.0
parisc                randconfig-1001-20261009    gcc-8.5.0
parisc               randconfig-r2301-20261008    gcc-13.4.0 sparse
parisc               randconfig-r2302-20261007    gcc-14.3.0 sparse
parisc               randconfig-r2305-20261008    gcc-13.4.0 sparse
parisc               randconfig-r2309-20261008    clang-24   sparse
parisc64                          alldefconfig    gcc-16.1.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       chrp32_defconfig    clang-24
powerpc                        holly_defconfig    clang-24
powerpc                        ppc64_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261009    gcc-8.5.0
powerpc               randconfig-1001-20261009    gcc-8.5.0
powerpc              randconfig-r2105-20261008    gcc-16.1.0 cocci
powerpc64             randconfig-1000-20261009    gcc-8.5.0
powerpc64             randconfig-1001-20261009    gcc-8.5.0
powerpc64            randconfig-r2103-20261008    clang-22   cocci
powerpc64            randconfig-r2201-20261007    clang-24   smatch
powerpc64            randconfig-r2300-20261007    clang-24   sparse
powerpc64            randconfig-r2303-20261008    clang-24   sparse
powerpc64            randconfig-r2308-20261007    gcc-14     sparse
riscv                              allnoconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261009    gcc-16.1.0
riscv                 randconfig-1001-20261009    gcc-16.1.0
riscv                 randconfig-2000-20261007    gcc-12.5.0
riscv                 randconfig-2000-20261008    gcc-11.5.0
riscv                 randconfig-2001-20261007    gcc-12.5.0
riscv                 randconfig-2001-20261008    gcc-11.5.0
riscv                randconfig-r2101-20261008    clang-24   cocci
riscv                randconfig-r2103-20261008    gcc-8.5.0  cocci
riscv                randconfig-r2104-20261007    gcc-9.5.0  cocci
riscv                randconfig-r2201-20261007    clang-24   smatch
riscv                randconfig-r2307-20261008    clang-24   sparse
riscv                randconfig-r2308-20261008    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261009    gcc-16.1.0
s390                  randconfig-1001-20261009    gcc-16.1.0
s390                  randconfig-2000-20261007    gcc-12.5.0
s390                  randconfig-2000-20261008    gcc-11.5.0
s390                  randconfig-2001-20261007    gcc-12.5.0
s390                  randconfig-2001-20261008    gcc-11.5.0
s390                 randconfig-r2201-20261008    gcc-11.5.0 smatch
s390                 randconfig-r2202-20261008    clang-17   smatch
s390                 randconfig-r2302-20261008    clang-24   sparse
s390                 randconfig-r2304-20261008    gcc-13.4.0 sparse
s390                 randconfig-r2309-20261008    clang-24   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                  kfr2r09-romimage_defconfig    clang-24
sh                      magicpanelr2_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261009    gcc-16.1.0
sh                    randconfig-1001-20261009    gcc-16.1.0
sh                    randconfig-2000-20261007    gcc-12.5.0
sh                    randconfig-2000-20261008    gcc-11.5.0
sh                    randconfig-2001-20261007    gcc-12.5.0
sh                    randconfig-2001-20261008    gcc-11.5.0
sh                   randconfig-r2200-20261008    gcc-16.1.0 smatch
sh                   randconfig-r2302-20261008    gcc-13.4.0 sparse
sh                   randconfig-r2306-20261008    clang-24   sparse
sh                   randconfig-r2308-20261008    clang-24   sparse
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261009    clang-18
sparc                 randconfig-1001-20261009    clang-18
sparc                 randconfig-2000-20261007    clang-24
sparc                 randconfig-2000-20261008    gcc-14
sparc                 randconfig-2001-20261007    clang-24
sparc                 randconfig-2001-20261008    gcc-14
sparc                randconfig-r2102-20261008    clang-24   cocci
sparc                randconfig-r2103-20261008    clang-24   cocci
sparc                randconfig-r2106-20261008    gcc-16.1.0 cocci
sparc                randconfig-r2303-20261007    clang-24   sparse
sparc                randconfig-r2303-20261008    gcc-13.4.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261009    clang-18
sparc64               randconfig-1001-20261009    clang-18
sparc64               randconfig-2000-20261007    clang-24
sparc64               randconfig-2000-20261008    gcc-14
sparc64               randconfig-2001-20261007    clang-24
sparc64               randconfig-2001-20261008    gcc-14
sparc64              randconfig-r2100-20261008    clang-22   cocci
sparc64              randconfig-r2100-20261008    gcc-8.5.0  cocci
sparc64              randconfig-r2102-20261008    gcc-8.5.0  cocci
sparc64              randconfig-r2106-20261007    gcc-9.5.0  cocci
sparc64              randconfig-r2106-20261008    gcc-16.1.0 cocci
sparc64              randconfig-r2107-20261007    gcc-9.5.0  cocci
sparc64              randconfig-r2302-20261008    gcc-13.4.0 sparse
sparc64              randconfig-r2308-20261008    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261009    clang-18
um                    randconfig-1001-20261009    clang-18
um                    randconfig-2000-20261007    clang-24
um                    randconfig-2000-20261008    gcc-14
um                    randconfig-2001-20261007    clang-24
um                    randconfig-2001-20261008    gcc-14
um                   randconfig-r2101-20261008    gcc-12.5.0 cocci
um                   randconfig-r2105-20261008    gcc-14     cocci
um                   randconfig-r2105-20261008    gcc-16.1.0 cocci
um                   randconfig-r2107-20261007    gcc-9.5.0  cocci
um                   randconfig-r2200-20261008    clang-17   smatch
um                   randconfig-r2201-20261008    clang-24   smatch
um                   randconfig-r2303-20261007    gcc-14.3.0 sparse
um                   randconfig-r2306-20261008    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261009    clang-22
x86_64      buildonly-randconfig-1001-20261009    clang-22
x86_64      buildonly-randconfig-1002-20261009    clang-22
x86_64      buildonly-randconfig-1003-20261009    clang-22
x86_64      buildonly-randconfig-1004-20261009    clang-22
x86_64      buildonly-randconfig-1005-20261009    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261008    gcc-14
x86_64                randconfig-1000-20261009    gcc-14
x86_64                randconfig-1001-20261008    gcc-14
x86_64                randconfig-1001-20261009    gcc-14
x86_64                randconfig-1002-20261008    gcc-14
x86_64                randconfig-1002-20261009    gcc-14
x86_64                randconfig-1003-20261008    gcc-14
x86_64                randconfig-1003-20261009    gcc-14
x86_64                randconfig-1004-20261008    gcc-14
x86_64                randconfig-1004-20261009    gcc-14
x86_64                randconfig-1005-20261008    gcc-14
x86_64                randconfig-1005-20261009    gcc-14
x86_64                randconfig-1006-20261008    clang-22
x86_64                randconfig-1007-20261008    clang-22
x86_64                randconfig-1008-20261008    clang-22
x86_64                randconfig-1009-20261008    clang-22
x86_64                randconfig-1010-20261008    clang-22
x86_64                randconfig-1011-20261008    clang-22
x86_64                randconfig-1012-20261008    clang-22
x86_64                randconfig-1012-20261009    gcc-14
x86_64                randconfig-1013-20261008    clang-22
x86_64                randconfig-1013-20261009    gcc-14
x86_64                randconfig-1014-20261008    clang-22
x86_64                randconfig-1014-20261009    gcc-14
x86_64                randconfig-1015-20261008    clang-22
x86_64                randconfig-1015-20261009    gcc-14
x86_64                randconfig-1016-20261008    clang-22
x86_64                randconfig-1016-20261009    gcc-14
x86_64                randconfig-1017-20261008    clang-22
x86_64                randconfig-1017-20261009    gcc-14
x86_64                randconfig-2100-20261007    clang-22   cocci
x86_64                randconfig-2100-20261008    clang-22   cocci
x86_64                randconfig-2101-20261007    clang-22   cocci
x86_64                randconfig-2101-20261008    clang-22   cocci
x86_64                randconfig-2102-20261007    clang-22   cocci
x86_64                randconfig-2102-20261008    clang-22   cocci
x86_64                randconfig-2103-20261007    clang-22   cocci
x86_64                randconfig-2103-20261008    clang-22   cocci
x86_64                randconfig-2200-20261007    gcc-14     smatch
x86_64                randconfig-2200-20261008    gcc-14     smatch
x86_64                randconfig-2300-20261007    clang-22   sparse
x86_64                randconfig-2300-20261008    clang-22   sparse
x86_64                randconfig-2301-20261007    clang-22   sparse
x86_64                randconfig-2301-20261008    clang-22   sparse
x86_64                randconfig-2302-20261007    clang-22   sparse
x86_64                randconfig-2302-20261008    clang-22   sparse
x86_64               randconfig-r2103-20261008    gcc-9.5.0  cocci
x86_64               randconfig-r2303-20261008    gcc-10.5.0 sparse
x86_64               randconfig-r2309-20261008    gcc-8.5.0  sparse
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
xtensa                   audio_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-1000-20261009    clang-18
xtensa                randconfig-1001-20261009    clang-18
xtensa                randconfig-2000-20261007    clang-24
xtensa                randconfig-2000-20261008    gcc-14
xtensa                randconfig-2001-20261007    clang-24
xtensa                randconfig-2001-20261008    gcc-14
xtensa               randconfig-r2106-20261008    gcc-8.5.0  cocci
xtensa               randconfig-r2200-20261008    gcc-8.5.0  smatch
xtensa               randconfig-r2201-20261008    gcc-13.4.0 smatch
xtensa               randconfig-r2308-20261008    gcc-8.5.0  sparse
xtensa               randconfig-r2309-20261008    clang-24   sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
