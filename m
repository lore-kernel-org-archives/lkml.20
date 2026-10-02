Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE29405F7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931526; cv=none; b=XAGzzO9ccxjJuhQPntxIE0/LLd7wqR+XWYroctWGtpImnpnzKjJMxx6c7OLGVhFr3fNVpyiJm37ugCoLx9G/eKFb3jnf+bCuprtbZ+proy1B3/CWwd4Z/k0p/czIhzXr3Xcr8myY8Gx+5QBwH21MCGkGIcHXgZqd8zBx9CSwDic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931526; c=relaxed/simple;
	bh=kUDXXBjGoeIvjbyr8vW96HYOJQKUgSjj+vttvXPAxpA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XxQeQnQbBkuwrDpXcIEwXFr/MOfjrnjfI4OyJVmDS/EGCjVz+MQMMl4xGemQAwMCqq9nwohccUN9kfLYzQNighFIluh/oKHopgLqVtgw6jQFkWEdI/Q5rHGT8XGGNkMr1mQcDQQRMX+Hfaga0vVdwzc73zHqFTPEqv/iFZRIpeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRQXL9Ak; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRQXL9Ak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790931524; x=1822467524;
  h=date:from:to:cc:subject:message-id;
  bh=kUDXXBjGoeIvjbyr8vW96HYOJQKUgSjj+vttvXPAxpA=;
  b=XRQXL9AkfJQLojfPTmJf7h63TBHfaIWsb8kCIRuDUB+BD4CPXQfHCKMs
   YN0gEROce2mAcqp1D0cbCqKuQ7t2SUfFwcPKG/i4B/PBe/l6xYTgcXmu/
   QzKdeX68ktcTJnsN4cIo1Ua4LlebC3VZTdHq0aXpvLkDETCspqA9t6vUl
   MEjDs7KRZWifsoSH90cDIqMhU0OE0Q/6cVDk86SeNYQKF0UZYYX5+4GTS
   b8BQN+f9JsiizU32jlKjpersxxpu+/j+IAWPdfXqor+lCyaFUA4RMSR2T
   3ua7EM7d/8b2bF2rbWqHkgNj9TdJfM79SH2CIR/lWEYctX3CXNde0Bf3/
   g==;
X-CSE-ConnectionGUID: XwxI4Sb3QSm3Gogz/JN1Qg==
X-CSE-MsgGUID: JdvK6hDCRBi0dKz1UxAqVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94408625"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="94408625"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:58:44 -0700
X-CSE-ConnectionGUID: ibJKogSIS3Ck9wzl0T7txQ==
X-CSE-MsgGUID: j6aljcfKROSWy2J01AVQEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275758085"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2026 01:58:42 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCZ6G-00000000SqG-0ks5;
	Fri, 02 Oct 2026 08:58:40 +0000
Date: Fri, 02 Oct 2026 16:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:mm] BUILD SUCCESS
 d92b5ac5aeba1ffc734576e30a5bca882722de76
Message-ID: <202610021630.VJFPgo56-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
branch HEAD: d92b5ac5aeba1ffc734576e30a5bca882722de76  x86/mm: Fix spurious warning on __add_pages() failure

elapsed time: 1074m

configs tested: 333
configs skipped: 128

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2307-20261001    gcc-16.1.0 sparse
alpha                randconfig-r2307-20261002    gcc-13.4.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261002    clang-17
arc                   randconfig-1001-20261002    clang-17
arc                  randconfig-r2101-20261001    gcc-13.4.0 cocci
arc                  randconfig-r2102-20261001    gcc-13.4.0 cocci
arc                  randconfig-r2308-20261001    gcc-16.1.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             dove_defconfig    gcc-16.1.0
arm                       integrator_defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261002    clang-17
arm                   randconfig-1001-20261002    clang-17
arm                   randconfig-1002-20261002    clang-17
arm                   randconfig-1003-20261002    clang-17
arm                  randconfig-r2103-20261001    gcc-8.5.0  cocci
arm                  randconfig-r2201-20261001    gcc-16.1.0 smatch
arm                          s3c6400_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261002    gcc-12.5.0
arm64                 randconfig-1001-20261002    gcc-12.5.0
arm64                 randconfig-1002-20261002    gcc-12.5.0
arm64                 randconfig-1003-20261002    gcc-12.5.0
arm64                randconfig-r2101-20261002    gcc-14     cocci
arm64                randconfig-r2104-20261002    clang-17   cocci
arm64                randconfig-r2300-20261001    gcc-9.5.0  sparse
arm64                randconfig-r2303-20261001    gcc-15.2.0 sparse
arm64                randconfig-r2303-20261001    gcc-9.5.0  sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261002    gcc-12.5.0
csky                  randconfig-1001-20261002    gcc-12.5.0
csky                 randconfig-r2105-20261001    clang-24   cocci
csky                 randconfig-r2107-20261002    gcc-14     cocci
csky                 randconfig-r2302-20261001    gcc-14     sparse
csky                 randconfig-r2305-20261001    gcc-9.5.0  sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261002    gcc-13.4.0
hexagon               randconfig-1001-20261002    gcc-13.4.0
hexagon              randconfig-r2104-20261001    clang-24   cocci
hexagon              randconfig-r2106-20261001    clang-24   cocci
hexagon              randconfig-r2202-20261002    clang-18   smatch
hexagon              randconfig-r2300-20261001    gcc-14     sparse
hexagon              randconfig-r2303-20261001    gcc-14     sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261002    clang-22
i386        buildonly-randconfig-1001-20261002    clang-22
i386        buildonly-randconfig-1002-20261002    clang-22
i386        buildonly-randconfig-1003-20261002    clang-22
i386        buildonly-randconfig-1004-20261002    clang-22
i386        buildonly-randconfig-1005-20261002    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261002    gcc-14
i386                  randconfig-1001-20261002    gcc-14
i386                  randconfig-1002-20261002    gcc-14
i386                  randconfig-1003-20261002    gcc-14
i386                  randconfig-1004-20261002    gcc-14
i386                  randconfig-1005-20261002    gcc-14
i386                  randconfig-1006-20261002    gcc-14
i386                  randconfig-1007-20261002    clang-22
i386                  randconfig-1008-20261002    clang-22
i386                  randconfig-1009-20261002    clang-22
i386                  randconfig-1010-20261002    clang-22
i386                  randconfig-1011-20261002    clang-22
i386                  randconfig-1012-20261002    clang-22
i386                  randconfig-1013-20261002    clang-22
i386                  randconfig-2100-20261001    gcc-14     cocci
i386                  randconfig-2100-20261002    gcc-14     cocci
i386                  randconfig-2101-20261001    gcc-14     cocci
i386                  randconfig-2101-20261002    gcc-14     cocci
i386                  randconfig-2102-20261001    gcc-14     cocci
i386                  randconfig-2102-20261002    gcc-14     cocci
i386                  randconfig-2103-20261001    gcc-14     cocci
i386                  randconfig-2103-20261002    gcc-14     cocci
i386                  randconfig-2200-20261001    clang-22   smatch
i386                  randconfig-2200-20261002    gcc-14     smatch
i386                  randconfig-2300-20261001    gcc-14     sparse
i386                  randconfig-2300-20261002    gcc-12     sparse
i386                  randconfig-2301-20261001    gcc-14     sparse
i386                  randconfig-2301-20261002    gcc-12     sparse
i386                  randconfig-2302-20261001    gcc-14     sparse
i386                  randconfig-2302-20261002    gcc-12     sparse
i386                 randconfig-r2103-20261001    gcc-9.5.0  cocci
i386                 randconfig-r2304-20261002    clang-22   sparse
i386                 randconfig-r2309-20261002    gcc-13.4.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261002    gcc-13.4.0
loongarch             randconfig-1001-20261002    gcc-13.4.0
loongarch            randconfig-r2102-20261001    gcc-8.5.0  cocci
loongarch            randconfig-r2104-20261001    gcc-14     cocci
loongarch            randconfig-r2107-20261001    gcc-14     cocci
loongarch            randconfig-r2201-20261001    clang-18   smatch
loongarch            randconfig-r2202-20261001    clang-21   smatch
loongarch            randconfig-r2305-20261001    gcc-15.2.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5272c3_defconfig    gcc-16.1.0
m68k                        m5275evb_defconfig    gcc-16.1.0
m68k                       m54418evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2100-20261002    gcc-14     cocci
m68k                 randconfig-r2105-20261002    clang-17   cocci
m68k                 randconfig-r2200-20261001    gcc-8.5.0  smatch
m68k                 randconfig-r2301-20261001    gcc-14     sparse
m68k                 randconfig-r2302-20261001    gcc-9.5.0  sparse
m68k                 randconfig-r2306-20261002    gcc-13.4.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2200-20261002    gcc-8.5.0  smatch
microblaze           randconfig-r2201-20261002    gcc-8.5.0  smatch
microblaze           randconfig-r2202-20261002    gcc-8.5.0  smatch
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
mips                            ip28_defconfig    gcc-16.1.0
mips                         maltaup_defconfig    gcc-16.1.0
mips                     maltaup_xpa_defconfig    gcc-16.1.0
mips                            mtx1_defconfig    gcc-16.1.0
mips                 randconfig-r2100-20261001    gcc-8.5.0  cocci
mips                 randconfig-r2102-20261001    gcc-9.5.0  cocci
mips                 randconfig-r2303-20261002    clang-22   sparse
nios2                          3c120_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261002    gcc-13.4.0
nios2                 randconfig-1001-20261002    gcc-13.4.0
nios2                randconfig-r2100-20261001    gcc-9.5.0  cocci
nios2                randconfig-r2101-20261001    gcc-9.5.0  cocci
openrisc                          alldefconfig    gcc-16.1.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2104-20261002    gcc-14     cocci
openrisc             randconfig-r2307-20261001    gcc-16.1.0 sparse
openrisc             randconfig-r2308-20261001    clang-20   sparse
openrisc             randconfig-r2308-20261002    gcc-13.4.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261002    gcc-14.3.0
parisc                randconfig-1001-20261002    gcc-14.3.0
parisc               randconfig-r2106-20261001    gcc-14     cocci
parisc               randconfig-r2107-20261001    clang-24   cocci
parisc               randconfig-r2200-20261001    gcc-8.5.0  smatch
parisc               randconfig-r2302-20261001    gcc-15.2.0 sparse
parisc               randconfig-r2304-20261001    gcc-15.2.0 sparse
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.1.0
powerpc                       katmai_defconfig    gcc-16.1.0
powerpc                       pcm030_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261002    gcc-14.3.0
powerpc               randconfig-1001-20261002    gcc-14.3.0
powerpc              randconfig-r2301-20261001    gcc-15.2.0 sparse
powerpc64             randconfig-1000-20261002    gcc-14.3.0
powerpc64             randconfig-1001-20261002    gcc-14.3.0
powerpc64            randconfig-r2306-20261001    gcc-16.1.0 sparse
powerpc64            randconfig-r2309-20261001    clang-20   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261002    clang-24
riscv                 randconfig-1001-20261002    clang-24
riscv                 randconfig-2000-20261001    gcc-10.5.0
riscv                 randconfig-2000-20261002    gcc-9.5.0
riscv                 randconfig-2001-20261001    gcc-10.5.0
riscv                 randconfig-2001-20261002    gcc-9.5.0
riscv                randconfig-r2103-20261002    gcc-14     cocci
riscv                randconfig-r2300-20261002    clang-22   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261002    clang-24
s390                  randconfig-1001-20261002    clang-24
s390                  randconfig-2000-20261001    gcc-10.5.0
s390                  randconfig-2000-20261002    gcc-9.5.0
s390                  randconfig-2001-20261001    gcc-10.5.0
s390                  randconfig-2001-20261002    gcc-9.5.0
s390                 randconfig-r2100-20261001    gcc-13.4.0 cocci
s390                 randconfig-r2106-20261002    clang-17   cocci
s390                 randconfig-r2306-20261001    clang-20   sparse
s390                 randconfig-r2308-20261001    gcc-16.1.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          apsh4a3a_defconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261002    clang-24
sh                    randconfig-1001-20261002    clang-24
sh                    randconfig-2000-20261001    gcc-10.5.0
sh                    randconfig-2000-20261002    gcc-9.5.0
sh                    randconfig-2001-20261001    gcc-10.5.0
sh                    randconfig-2001-20261002    gcc-9.5.0
sh                   randconfig-r2306-20261001    gcc-16.1.0 sparse
sh                           sdk7780_defconfig    gcc-16.1.0
sh                            se7780_defconfig    gcc-16.1.0
sh                             shmin_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261002    clang-24
sparc                 randconfig-1001-20261002    clang-24
sparc                 randconfig-2000-20261001    clang-24
sparc                 randconfig-2000-20261002    clang-24
sparc                 randconfig-2001-20261001    clang-24
sparc                 randconfig-2001-20261002    clang-24
sparc                randconfig-r2201-20261002    gcc-8.5.0  smatch
sparc                randconfig-r2301-20261002    clang-22   sparse
sparc                randconfig-r2309-20261001    gcc-16.1.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261002    clang-24
sparc64               randconfig-1001-20261002    clang-24
sparc64               randconfig-2000-20261001    clang-24
sparc64               randconfig-2000-20261002    clang-24
sparc64               randconfig-2001-20261001    clang-24
sparc64               randconfig-2001-20261002    clang-24
sparc64              randconfig-r2101-20261001    gcc-8.5.0  cocci
sparc64              randconfig-r2103-20261001    gcc-13.4.0 cocci
sparc64              randconfig-r2106-20261002    gcc-14     cocci
sparc64              randconfig-r2107-20261002    clang-17   cocci
sparc64              randconfig-r2301-20261001    gcc-9.5.0  sparse
sparc64              randconfig-r2304-20261001    gcc-14     sparse
sparc64              randconfig-r2305-20261002    clang-22   sparse
sparc64              randconfig-r2307-20261001    clang-20   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261002    clang-24
um                    randconfig-1001-20261002    clang-24
um                    randconfig-2000-20261001    clang-24
um                    randconfig-2000-20261002    clang-24
um                    randconfig-2001-20261001    clang-24
um                    randconfig-2001-20261002    clang-24
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261002    gcc-14
x86_64      buildonly-randconfig-1001-20261002    gcc-14
x86_64      buildonly-randconfig-1002-20261002    gcc-14
x86_64      buildonly-randconfig-1003-20261002    gcc-14
x86_64      buildonly-randconfig-1004-20261002    gcc-14
x86_64      buildonly-randconfig-1005-20261002    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261002    gcc-14
x86_64                randconfig-1001-20261002    gcc-14
x86_64                randconfig-1002-20261002    gcc-14
x86_64                randconfig-1003-20261002    gcc-14
x86_64                randconfig-1004-20261002    gcc-14
x86_64                randconfig-1005-20261002    gcc-14
x86_64                randconfig-1006-20261002    clang-22
x86_64                randconfig-1007-20261002    clang-22
x86_64                randconfig-1008-20261002    clang-22
x86_64                randconfig-1009-20261002    clang-22
x86_64                randconfig-1010-20261002    clang-22
x86_64                randconfig-1011-20261002    clang-22
x86_64                randconfig-1012-20261002    clang-22
x86_64                randconfig-1013-20261002    clang-22
x86_64                randconfig-1014-20261002    clang-22
x86_64                randconfig-1015-20261002    clang-22
x86_64                randconfig-1016-20261002    clang-22
x86_64                randconfig-1017-20261002    clang-22
x86_64                randconfig-2100-20261001    gcc-14     cocci
x86_64                randconfig-2100-20261002    gcc-14     cocci
x86_64                randconfig-2101-20261001    gcc-14     cocci
x86_64                randconfig-2101-20261002    gcc-14     cocci
x86_64                randconfig-2102-20261001    gcc-14     cocci
x86_64                randconfig-2102-20261002    gcc-14     cocci
x86_64                randconfig-2103-20261001    gcc-14     cocci
x86_64                randconfig-2103-20261002    gcc-14     cocci
x86_64                randconfig-2200-20261001    clang-22   smatch
x86_64                randconfig-2200-20261002    clang-22   smatch
x86_64                randconfig-2300-20261001    gcc-14     sparse
x86_64                randconfig-2300-20261002    gcc-12     sparse
x86_64                randconfig-2301-20261001    gcc-14     sparse
x86_64                randconfig-2301-20261002    gcc-12     sparse
x86_64                randconfig-2302-20261001    gcc-14     sparse
x86_64                randconfig-2302-20261002    gcc-12     sparse
x86_64               randconfig-r2102-20261002    gcc-14     cocci
x86_64               randconfig-r2105-20261001    gcc-14     cocci
x86_64               randconfig-r2105-20261002    gcc-14     cocci
x86_64               randconfig-r2202-20261001    clang-22   smatch
x86_64               randconfig-r2304-20261001    gcc-9.5.0  sparse
x86_64               randconfig-r2305-20261001    gcc-14     sparse
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
xtensa                randconfig-1000-20261002    clang-24
xtensa                randconfig-1001-20261002    clang-24
xtensa                randconfig-2000-20261001    clang-24
xtensa                randconfig-2000-20261002    clang-24
xtensa                randconfig-2001-20261001    clang-24
xtensa                randconfig-2001-20261002    clang-24
xtensa               randconfig-r2300-20261001    gcc-15.2.0 sparse
xtensa               randconfig-r2302-20261002    clang-22   sparse
xtensa               randconfig-r2309-20261001    gcc-16.1.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
