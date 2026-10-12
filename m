Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD9832B126
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802421; cv=none; b=a+G7yjx33IxINO1BD1ylSF9Uy80VRs6uoyKeq4HYWSHKDKKzq5OCXAS4KRl76r6+ZEXmMXcGJdOSaYWORXgJjzwWxZdI6PiVOVBfWI71a3txBXZN+IDqzEJrpxun1d88Y7tnnk9nWA5tvWh9UUSK9uP8e+gvNCb4MX3Ilh18xOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802421; c=relaxed/simple;
	bh=yyYk9dWB0Ax6CpB8wgR/OawgUAIpOWqHXleYpKIqKeE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=riXkjWwbI4UnPf/bcNuISnZRVqx+BFMzWVh4sQ3tK3jJ1rZWtkK5d8nzejm/rFLyubAjKj3T2iXFkzNfiqSJEAwlV75RYf2dEpeR0jdUcq21mjWya5YLJsWGnKpmPSDficyLxgoVqaMQc5/vzTDcVTw72xEVhm7qgGv0WHLUt1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1JqjX4B; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1JqjX4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791802418; x=1823338418;
  h=date:from:to:cc:subject:message-id;
  bh=yyYk9dWB0Ax6CpB8wgR/OawgUAIpOWqHXleYpKIqKeE=;
  b=W1JqjX4BiPINdI0FHFcdB26vMzGPhoaZ0X9F4OngpA4CNOWlo4EC2RnQ
   yp2Cd54wsk5cWBa+BXJXHOhOOAskHsEWAdXBeIhIEnousOEr1M5vTs25Y
   w5iqULC0RwwQHN/GZkNvqABHURn3fBCeaOG+TWahK9lxS3w0ujxrv1CtF
   ThxW8Hgo+gsNO5sznmuTJMnvApsNrqdvc178T7IlUDE73Ux+uI61dA+aQ
   uZYIA+Gn1wKh4ykra+WNttSgn6v2z9xn2zlXLMw+Kvwm/909xaMZJO8he
   kE88RnqRx1GGelONHk+OlW2lUVnL1Qlk3bu1z/hpZc+qHda1jDZEla+e+
   g==;
X-CSE-ConnectionGUID: 9L5orbxMT8uDkxBf7SH4hg==
X-CSE-MsgGUID: wYLCm49fT42LlWZi2YqJsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="499101"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="499101"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 03:53:38 -0700
X-CSE-ConnectionGUID: mAzPoaj4ToKH/OkqjUmVpA==
X-CSE-MsgGUID: MPPy5uZKRcqpOngH5H5dFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1058752"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Oct 2026 03:53:36 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGDev-00000000BMA-3qFe;
	Mon, 12 Oct 2026 10:53:33 +0000
Date: Mon, 12 Oct 2026 18:52:39 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip:urgent] BUILD SUCCESS
 2f149e464062e13636a3b6dece46282978ce6013
Message-ID: <202610121836.y3XCPegw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 2f149e464062e13636a3b6dece46282978ce6013  Merge branch into tip/master: 'x86/urgent'

elapsed time: 854m

configs tested: 407
configs skipped: 142

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2101-20261011    gcc-14.3.0 cocci
alpha                randconfig-r2103-20261011    gcc-8.5.0  cocci
alpha                randconfig-r2106-20261011    clang-24   cocci
alpha                randconfig-r2107-20261011    gcc-11.5.0 cocci
alpha                randconfig-r2202-20261011    gcc-16.1.0 smatch
alpha                randconfig-r2304-20261011    clang-24   sparse
alpha                randconfig-r2304-20261011    gcc-14.3.0 sparse
alpha                randconfig-r2304-20261011    gcc-16.1.0 sparse
alpha                randconfig-r2305-20261011    clang-24   sparse
arc                                allnoconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261012    gcc-8.5.0
arc                   randconfig-1001-20261012    gcc-8.5.0
arc                   randconfig-2000-20261011    gcc-8.5.0
arc                   randconfig-2001-20261011    gcc-8.5.0
arc                  randconfig-r2102-20261011    gcc-14.3.0 cocci
arc                  randconfig-r2105-20261011    gcc-11.5.0 cocci
arc                  randconfig-r2109-20261011    gcc-16.1.0 cocci
arc                  randconfig-r2201-20261011    gcc-8.5.0  smatch
arc                  randconfig-r2306-20261011    gcc-8.5.0  sparse
arc                  randconfig-r2309-20261011    gcc-13     sparse
arc                  randconfig-r2311-20261011    clang-24   sparse
arm                                allnoconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20261012    gcc-8.5.0
arm                   randconfig-1001-20261012    gcc-8.5.0
arm                   randconfig-1002-20261012    gcc-8.5.0
arm                   randconfig-1003-20261012    gcc-8.5.0
arm                   randconfig-2000-20261011    gcc-8.5.0
arm                   randconfig-2001-20261011    gcc-8.5.0
arm                  randconfig-r2200-20261011    gcc-11.5.0 smatch
arm                  randconfig-r2300-20261011    clang-17   sparse
arm                  randconfig-r2303-20261011    gcc-8.5.0  sparse
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261012    clang-24
arm64                 randconfig-1001-20261012    clang-24
arm64                 randconfig-1002-20261012    clang-24
arm64                 randconfig-1003-20261012    clang-24
arm64                 randconfig-2000-20261011    gcc-16.1.0
arm64                 randconfig-2001-20261011    gcc-16.1.0
arm64                randconfig-r2100-20261011    clang-21   cocci
arm64                randconfig-r2100-20261011    gcc-16.1.0 cocci
arm64                randconfig-r2106-20261011    clang-22   cocci
arm64                randconfig-r2110-20261011    clang-22   cocci
arm64                randconfig-r2111-20261011    clang-24   cocci
arm64                randconfig-r2303-20261011    clang-17   sparse
arm64                randconfig-r2303-20261011    gcc-8.5.0  sparse
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261012    clang-24
csky                  randconfig-1001-20261012    clang-24
csky                  randconfig-2000-20261011    gcc-16.1.0
csky                  randconfig-2001-20261011    gcc-16.1.0
csky                 randconfig-r2105-20261011    clang-24   cocci
csky                 randconfig-r2106-20261011    clang-22   cocci
csky                 randconfig-r2108-20261011    gcc-8.5.0  cocci
csky                 randconfig-r2201-20261011    gcc-11.5.0 smatch
csky                 randconfig-r2202-20261011    gcc-9.5.0  smatch
csky                 randconfig-r2301-20261011    gcc-8.5.0  sparse
csky                 randconfig-r2307-20261011    gcc-11.5.0 sparse
csky                 randconfig-r2309-20261011    clang-17   sparse
csky                 randconfig-r2309-20261011    gcc-8.5.0  sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261012    clang-17
hexagon               randconfig-1001-20261012    clang-17
hexagon               randconfig-2000-20261011    gcc-16.1.0
hexagon               randconfig-2001-20261011    gcc-16.1.0
hexagon              randconfig-r2100-20261011    clang-24   cocci
hexagon              randconfig-r2104-20261011    clang-24   cocci
hexagon              randconfig-r2108-20261011    clang-21   cocci
hexagon              randconfig-r2111-20261011    clang-24   cocci
hexagon              randconfig-r2308-20261011    clang-24   sparse
hexagon              randconfig-r2309-20261011    clang-24   sparse
hexagon              randconfig-r2310-20261011    clang-24   sparse
hexagon              randconfig-r2311-20261011    clang-17   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261012    clang-22
i386        buildonly-randconfig-1001-20261012    clang-22
i386        buildonly-randconfig-1002-20261012    clang-22
i386        buildonly-randconfig-1003-20261012    clang-22
i386        buildonly-randconfig-1004-20261012    clang-22
i386        buildonly-randconfig-1005-20261012    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261012    gcc-14
i386                  randconfig-1001-20261012    gcc-14
i386                  randconfig-1002-20261012    gcc-14
i386                  randconfig-1003-20261012    gcc-14
i386                  randconfig-1004-20261012    gcc-14
i386                  randconfig-1005-20261012    gcc-14
i386                  randconfig-1006-20261012    gcc-14
i386                  randconfig-1007-20261012    clang-22
i386                  randconfig-1008-20261012    clang-22
i386                  randconfig-1009-20261012    clang-22
i386                  randconfig-1010-20261012    clang-22
i386                  randconfig-1011-20261012    clang-22
i386                  randconfig-1012-20261012    clang-22
i386                  randconfig-1013-20261012    clang-22
i386                  randconfig-2000-20261011    gcc-8.5.0
i386                  randconfig-2001-20261011    gcc-8.5.0
i386                  randconfig-2100-20261011    gcc-14     cocci
i386                  randconfig-2101-20261011    gcc-14     cocci
i386                  randconfig-2102-20261011    gcc-14     cocci
i386                  randconfig-2103-20261011    gcc-14     cocci
i386                  randconfig-2104-20261011    gcc-14     cocci
i386                  randconfig-2105-20261011    gcc-14     cocci
i386                  randconfig-2200-20261011    clang-22   smatch
i386                  randconfig-2300-20261011    gcc-14     sparse
i386                  randconfig-2301-20261011    gcc-14     sparse
i386                  randconfig-2302-20261011    gcc-14     sparse
i386                 randconfig-r2110-20261011    gcc-11.5.0 cocci
i386                 randconfig-r2111-20261011    clang-22   cocci
i386                 randconfig-r2200-20261011    clang-22   smatch
i386                 randconfig-r2201-20261011    clang-22   smatch
i386                 randconfig-r2300-20261011    gcc-8.5.0  sparse
i386                 randconfig-r2302-20261011    gcc-14.3.0 sparse
i386                 randconfig-r2302-20261011    gcc-8.5.0  sparse
i386                 randconfig-r2311-20261011    gcc-11.5.0 sparse
i386                 randconfig-r2311-20261011    gcc-13     sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261012    clang-17
loongarch             randconfig-1001-20261012    clang-17
loongarch             randconfig-2000-20261011    gcc-8.5.0
loongarch             randconfig-2001-20261011    gcc-8.5.0
loongarch            randconfig-r2308-20261011    clang-24   sparse
m68k                               allnoconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2310-20261011    clang-24   sparse
m68k                 randconfig-r2310-20261011    gcc-13     sparse
m68k                 randconfig-r2310-20261011    gcc-8.5.0  sparse
m68k                 randconfig-r2311-20261011    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2105-20261011    clang-24   cocci
microblaze           randconfig-r2107-20261011    clang-22   cocci
microblaze           randconfig-r2108-20261011    clang-24   cocci
microblaze           randconfig-r2306-20261011    clang-24   sparse
microblaze           randconfig-r2307-20261011    gcc-11.5.0 sparse
microblaze           randconfig-r2308-20261011    gcc-8.5.0  sparse
microblaze           randconfig-r2309-20261011    clang-24   sparse
mips                               allnoconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
mips                 randconfig-r2102-20261011    clang-24   cocci
mips                 randconfig-r2103-20261011    gcc-16.1.0 cocci
mips                 randconfig-r2106-20261011    clang-24   cocci
mips                 randconfig-r2107-20261011    clang-24   cocci
mips                 randconfig-r2109-20261011    gcc-12.5.0 cocci
mips                 randconfig-r2202-20261011    gcc-15.2.0 smatch
mips                 randconfig-r2302-20261011    clang-17   sparse
mips                 randconfig-r2305-20261011    gcc-8.5.0  sparse
mips                 randconfig-r2306-20261011    gcc-11.5.0 sparse
mips                 randconfig-r2306-20261011    gcc-13     sparse
mips                 randconfig-r2307-20261011    gcc-8.5.0  sparse
mips                 randconfig-r2308-20261011    gcc-11.5.0 sparse
nios2                          10m50_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261012    clang-17
nios2                 randconfig-1001-20261012    clang-17
nios2                 randconfig-2000-20261011    gcc-8.5.0
nios2                 randconfig-2001-20261011    gcc-8.5.0
nios2                randconfig-r2104-20261011    gcc-9.5.0  cocci
nios2                randconfig-r2105-20261011    clang-24   cocci
nios2                randconfig-r2105-20261011    gcc-9.5.0  cocci
nios2                randconfig-r2107-20261011    clang-24   cocci
nios2                randconfig-r2200-20261011    gcc-8.5.0  smatch
nios2                randconfig-r2202-20261011    gcc-8.5.0  smatch
nios2                randconfig-r2301-20261011    gcc-16.1.0 sparse
nios2                randconfig-r2304-20261011    clang-17   sparse
nios2                randconfig-r2307-20261011    clang-17   sparse
nios2                randconfig-r2307-20261011    clang-24   sparse
nios2                randconfig-r2308-20261011    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2104-20261011    clang-22   cocci
openrisc             randconfig-r2105-20261011    clang-22   cocci
openrisc             randconfig-r2110-20261011    gcc-9.5.0  cocci
openrisc             randconfig-r2300-20261011    gcc-16.1.0 sparse
openrisc             randconfig-r2300-20261011    gcc-8.5.0  sparse
openrisc             randconfig-r2305-20261011    gcc-14.3.0 sparse
openrisc             randconfig-r2306-20261011    clang-17   sparse
openrisc             randconfig-r2306-20261011    gcc-8.5.0  sparse
openrisc             randconfig-r2310-20261011    gcc-11.5.0 sparse
parisc                             allnoconfig    clang-24
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261012    gcc-8.5.0
parisc                randconfig-1001-20261012    gcc-8.5.0
parisc                randconfig-2000-20261011    gcc-8.5.0
parisc                randconfig-2001-20261011    gcc-8.5.0
parisc               randconfig-r2100-20261011    gcc-8.5.0  cocci
parisc               randconfig-r2104-20261011    clang-22   cocci
parisc               randconfig-r2108-20261011    gcc-12.5.0 cocci
parisc               randconfig-r2110-20261011    clang-24   cocci
parisc               randconfig-r2201-20261011    gcc-11.5.0 smatch
parisc               randconfig-r2311-20261011    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    gcc-16.1.0
powerpc                       ep88xc_defconfig    gcc-16.1.0
powerpc                    motionpro_defconfig    gcc-16.1.0
powerpc                  mpc837x_rdb_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261012    gcc-8.5.0
powerpc               randconfig-1001-20261012    gcc-8.5.0
powerpc               randconfig-2000-20261011    clang-22
powerpc               randconfig-2001-20261011    clang-22
powerpc              randconfig-r2101-20261011    gcc-8.5.0  cocci
powerpc              randconfig-r2102-20261011    gcc-12.5.0 cocci
powerpc              randconfig-r2109-20261011    gcc-14.3.0 cocci
powerpc              randconfig-r2111-20261011    clang-24   cocci
powerpc              randconfig-r2306-20261011    clang-24   sparse
powerpc              randconfig-r2308-20261011    gcc-8.5.0  sparse
powerpc              randconfig-r2311-20261011    clang-24   sparse
powerpc              randconfig-r2311-20261011    gcc-11.5.0 sparse
powerpc64             randconfig-1000-20261012    gcc-8.5.0
powerpc64             randconfig-1001-20261012    gcc-8.5.0
powerpc64             randconfig-2000-20261011    clang-22
powerpc64             randconfig-2001-20261011    clang-22
powerpc64            randconfig-r2100-20261011    gcc-8.5.0  cocci
powerpc64            randconfig-r2101-20261011    gcc-16.1.0 cocci
powerpc64            randconfig-r2109-20261011    clang-21   cocci
powerpc64            randconfig-r2110-20261011    clang-22   cocci
powerpc64            randconfig-r2302-20261011    clang-24   sparse
powerpc64            randconfig-r2304-20261011    gcc-8.5.0  sparse
riscv                              allnoconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261012    clang-24
riscv                 randconfig-1001-20261012    clang-24
riscv                 randconfig-2000-20261011    gcc-13.4.0
riscv                 randconfig-2001-20261011    gcc-13.4.0
riscv                randconfig-r2107-20261011    clang-24   cocci
riscv                randconfig-r2110-20261011    clang-24   cocci
riscv                randconfig-r2301-20261011    clang-24   sparse
riscv                randconfig-r2305-20261011    gcc-8.5.0  sparse
s390                               allnoconfig    clang-24
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261012    clang-24
s390                  randconfig-1001-20261012    clang-24
s390                  randconfig-2000-20261011    gcc-13.4.0
s390                  randconfig-2001-20261011    gcc-13.4.0
s390                 randconfig-r2101-20261011    clang-24   cocci
s390                 randconfig-r2103-20261011    gcc-14.3.0 cocci
s390                 randconfig-r2308-20261011    clang-17   sparse
s390                 randconfig-r2310-20261011    gcc-8.5.0  sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261012    clang-24
sh                    randconfig-1001-20261012    clang-24
sh                    randconfig-2000-20261011    gcc-13.4.0
sh                    randconfig-2001-20261011    gcc-13.4.0
sh                   randconfig-r2100-20261011    gcc-14.3.0 cocci
sh                   randconfig-r2106-20261011    clang-24   cocci
sh                   randconfig-r2106-20261011    gcc-11.5.0 cocci
sh                   randconfig-r2108-20261011    gcc-16.1.0 cocci
sh                   randconfig-r2200-20261011    gcc-12.5.0 smatch
sh                   randconfig-r2301-20261011    gcc-8.5.0  sparse
sh                   randconfig-r2303-20261011    clang-24   sparse
sh                   randconfig-r2303-20261011    gcc-16.1.0 sparse
sh                   randconfig-r2304-20261011    gcc-8.5.0  sparse
sh                   randconfig-r2305-20261011    clang-17   sparse
sh                           rsk7201_defconfig    gcc-16.1.0
sh                           rsk7203_defconfig    gcc-16.1.0
sh                           sdk7780_defconfig    gcc-16.1.0
sparc                             alldefconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261012    clang-20
sparc                 randconfig-1001-20261012    clang-20
sparc                 randconfig-2000-20261011    gcc-8.5.0
sparc                 randconfig-2001-20261011    gcc-8.5.0
sparc                randconfig-r2101-20261011    gcc-12.5.0 cocci
sparc                randconfig-r2103-20261011    clang-24   cocci
sparc                randconfig-r2103-20261011    gcc-12.5.0 cocci
sparc                randconfig-r2105-20261011    clang-24   cocci
sparc                randconfig-r2106-20261011    gcc-9.5.0  cocci
sparc                randconfig-r2107-20261011    clang-24   cocci
sparc                randconfig-r2111-20261011    clang-24   cocci
sparc                randconfig-r2200-20261011    gcc-8.5.0  smatch
sparc                randconfig-r2201-20261011    gcc-14.3.0 smatch
sparc                randconfig-r2300-20261011    clang-24   sparse
sparc                randconfig-r2307-20261011    clang-24   sparse
sparc                randconfig-r2308-20261011    gcc-13     sparse
sparc                randconfig-r2309-20261011    gcc-11.5.0 sparse
sparc                randconfig-r2309-20261011    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261012    clang-20
sparc64               randconfig-1001-20261012    clang-20
sparc64               randconfig-2000-20261011    gcc-8.5.0
sparc64               randconfig-2001-20261011    gcc-8.5.0
sparc64              randconfig-r2100-20261011    gcc-12.5.0 cocci
sparc64              randconfig-r2102-20261011    clang-21   cocci
sparc64              randconfig-r2103-20261011    clang-21   cocci
sparc64              randconfig-r2104-20261011    clang-24   cocci
sparc64              randconfig-r2108-20261011    gcc-14.3.0 cocci
sparc64              randconfig-r2109-20261011    gcc-8.5.0  cocci
sparc64              randconfig-r2111-20261011    clang-22   cocci
sparc64              randconfig-r2301-20261011    clang-17   sparse
sparc64              randconfig-r2302-20261011    gcc-8.5.0  sparse
sparc64              randconfig-r2305-20261011    gcc-16.1.0 sparse
sparc64              randconfig-r2307-20261011    gcc-8.5.0  sparse
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261012    clang-20
um                    randconfig-1001-20261012    clang-20
um                    randconfig-2000-20261011    gcc-8.5.0
um                    randconfig-2001-20261011    gcc-8.5.0
um                   randconfig-r2101-20261011    clang-21   cocci
um                   randconfig-r2101-20261011    gcc-8.5.0  cocci
um                   randconfig-r2102-20261011    gcc-16.1.0 cocci
um                   randconfig-r2200-20261011    gcc-14     smatch
um                   randconfig-r2202-20261011    gcc-14     smatch
um                   randconfig-r2301-20261011    gcc-14.3.0 sparse
um                   randconfig-r2302-20261011    gcc-16.1.0 sparse
um                   randconfig-r2303-20261011    gcc-14.3.0 sparse
um                   randconfig-r2306-20261011    gcc-11.5.0 sparse
um                   randconfig-r2310-20261011    clang-17   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261012    clang-22
x86_64      buildonly-randconfig-1001-20261012    clang-22
x86_64      buildonly-randconfig-1002-20261012    clang-22
x86_64      buildonly-randconfig-1003-20261012    clang-22
x86_64      buildonly-randconfig-1004-20261012    clang-22
x86_64      buildonly-randconfig-1005-20261012    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261012    clang-22
x86_64                randconfig-1001-20261012    clang-22
x86_64                randconfig-1002-20261012    clang-22
x86_64                randconfig-1003-20261012    clang-22
x86_64                randconfig-1004-20261012    clang-22
x86_64                randconfig-1005-20261012    clang-22
x86_64                randconfig-1006-20261012    clang-22
x86_64                randconfig-1007-20261012    clang-22
x86_64                randconfig-1008-20261012    clang-22
x86_64                randconfig-1009-20261012    clang-22
x86_64                randconfig-1010-20261012    clang-22
x86_64                randconfig-1011-20261012    clang-22
x86_64                randconfig-1012-20261012    gcc-14
x86_64                randconfig-1013-20261012    gcc-14
x86_64                randconfig-1014-20261012    gcc-14
x86_64                randconfig-1015-20261012    gcc-14
x86_64                randconfig-1016-20261012    gcc-14
x86_64                randconfig-1017-20261012    gcc-14
x86_64                randconfig-2000-20261011    clang-22
x86_64                randconfig-2001-20261011    clang-22
x86_64                randconfig-2100-20261011    gcc-14     cocci
x86_64                randconfig-2101-20261011    gcc-14     cocci
x86_64                randconfig-2102-20261011    gcc-14     cocci
x86_64                randconfig-2103-20261011    gcc-14     cocci
x86_64                randconfig-2104-20261011    gcc-14     cocci
x86_64                randconfig-2105-20261011    gcc-14     cocci
x86_64                randconfig-2200-20261011    clang-22   smatch
x86_64                randconfig-2300-20261011    gcc-14     sparse
x86_64                randconfig-2301-20261011    gcc-14     sparse
x86_64                randconfig-2302-20261011    gcc-14     sparse
x86_64               randconfig-r2104-20261011    gcc-11.5.0 cocci
x86_64               randconfig-r2107-20261011    clang-22   cocci
x86_64               randconfig-r2108-20261011    gcc-8.5.0  cocci
x86_64               randconfig-r2109-20261011    clang-24   cocci
x86_64               randconfig-r2109-20261011    gcc-8.5.0  cocci
x86_64               randconfig-r2110-20261011    clang-24   cocci
x86_64               randconfig-r2111-20261011    gcc-11.5.0 cocci
x86_64               randconfig-r2300-20261011    gcc-14.3.0 sparse
x86_64               randconfig-r2307-20261011    gcc-13     sparse
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
xtensa                randconfig-1000-20261012    clang-20
xtensa                randconfig-1001-20261012    clang-20
xtensa                randconfig-2000-20261011    gcc-8.5.0
xtensa                randconfig-2001-20261011    gcc-8.5.0
xtensa               randconfig-r2102-20261011    gcc-8.5.0  cocci
xtensa               randconfig-r2103-20261011    gcc-8.5.0  cocci
xtensa               randconfig-r2104-20261011    clang-24   cocci
xtensa               randconfig-r2105-20261011    clang-22   cocci
xtensa               randconfig-r2107-20261011    gcc-9.5.0  cocci
xtensa               randconfig-r2110-20261011    clang-24   cocci
xtensa               randconfig-r2111-20261011    gcc-9.5.0  cocci
xtensa               randconfig-r2309-20261011    gcc-11.5.0 sparse
xtensa                     xip_kc705_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
