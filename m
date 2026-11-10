Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282738;
	b=WQBeK9BFZ2RytsUCZfoq6TiSMa6uGepRPMUHQcxQXcpBWxf91711H4+PGnWGLRz3RHaa
	 3Xe9XVKWx+c3V3welgIhvsp3LQxiwlbgTEiKC1JsIwbT52B/fn/x+eSMUE++7Xdd/AhjR
	 VX9Og1VQKhMSfGP5AAvF6RmsR5iT6PDoJKBzAc145ZaXlnte0bRlRAheEBsqUPKu07XMl
	 i44EllRA6z2qhQ78J6A+8+ADhvG+ZJ60WEDyRHP2WFcMQW6FrImcMfHBx4YgTO39rPU34
	 VYGCJnIUHgpbh3eYRBJgMoHe7+3dts3/iJ/l8UB78GN8CXfFLfvsGYLbSzS5XCe6Uzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282738;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=3UKWUdXBnwIp57G2hzA6kP5UKEKNURtzjC9JqqINLlE=;
	b=Lk5OYsIiBWCA+hQV0b+oHr44mYprkTCkb7UdBIWGA0DWUIiZuIiiWBeaCdVNXQiONW/n
	 Tx9rEhBKTd4jybpsZjMlNeMqpREc2BBsN0LJ6SdIN1ub3+H1PJEj5rp48X/WyWLutLLE1
	 hrxTnKboMVZvKbIDd+TNnKubd/Ms02rqCfSsesB17kWt/Z+BDPa6wKlVczHa2jGbewlrK
	 JYI2InVFUs6VFWGIHhNmZxBCylzDd1cezeiX5SWC3euPlxM4+Djlq62zqSF33d9av901P
	 K0S3r/JxKeR1cGLLwCiRH0/8tbbDOzL1Ph2f9jSEKjeDH0t0iqH5pI8Q+BlA+CSzosQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="QvJf/Yel";
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B6E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B6E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QvJf/Yel
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794282736; x=1825818736;
  h=date:from:to:cc:subject:message-id;
  bh=QkxeZo/mhT0/ffGoU0YMXvwt+UfHG/eMrjiwcKXN5Ws=;
  b=QvJf/YelUQ9p0BrzbtqMS/mKjEYeRXdKRBiecOtuYZ1ZjLNh5gxN8hHj
   j0quunAFNAcyLir6jlx7WDun6IrY2o6mnXrkovSjyZI6+LNwmpqvm9qkX
   F6+o1/IT3Et7B9k4P6KAA+hYDquyXEl9YjYDBXB+opJGKN2+wb/ChmiMh
   daRr2y9P0H5Bu5S4xnxFZBJMhSxAECQoCjjGtbKyE/220HVXLDawiHSmF
   5DIupmDp2EMhyZvhixV1UL4Q+dfllijTK7FZ0w0bTq7ZJ9YiZU7flgjOB
   +saeIuDwMI9CiHWbAoS8/Lx9atBKebdvj82Oqg5IvTFY5P+EkbNfFYENd
   A==;
X-CSE-ConnectionGUID: XCAdRCH+TNaAq8DJ4meOFg==
X-CSE-MsgGUID: gP2tQhN0QqewZImLVBdhxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3057936"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3057936"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 19:52:16 -0800
X-CSE-ConnectionGUID: jwUMyqDuQCCkuFYLB6cCHg==
X-CSE-MsgGUID: 5WJb7ocsR3C+Pf5hX9aMiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8367144"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Nov 2026 19:52:14 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQcu3-00000000vvr-05Yn;
	Tue, 10 Nov 2026 03:52:11 +0000
Date: Tue, 10 Nov 2026 11:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq:core] BUILD SUCCESS
 1aed0e209f0c3bb1f28d4d69c2fc23528d30981e
Message-ID: <20261110115115.5gO3JfDo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
branch HEAD: 1aed0e209f0c3bb1f28d4d69c2fc23528d30981e  genirq: Resend pending interrupts after handle_simple_irq()

elapsed time: 814m

configs tested: 403
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2200-20261110    gcc-9.5.0  smatch
alpha                randconfig-r2102-20261109    gcc-16.2.0 cocci
alpha                randconfig-r2302-20261109    gcc-11.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261110    gcc-10.5.0
arc                   randconfig-1001-20261110    gcc-10.5.0
arc                   randconfig-2000-20261109    gcc-8.5.0
arc                   randconfig-2001-20261109    gcc-13.5.0
arc                   randconfig-2001-20261109    gcc-8.5.0
arc                   randconfig-2002-20261109    gcc-13.5.0
arc                   randconfig-2002-20261109    gcc-8.5.0
arc                   randconfig-2003-20261109    gcc-13.5.0
arc                   randconfig-2003-20261109    gcc-8.5.0
arc                   randconfig-2004-20261109    gcc-13.5.0
arc                   randconfig-2004-20261109    gcc-8.5.0
arc                   randconfig-2005-20261109    gcc-13.5.0
arc                   randconfig-2005-20261109    gcc-8.5.0
arc                   randconfig-2200-20261109    gcc-13.5.0 smatch
arc                  randconfig-r2105-20261109    gcc-14.4.0 cocci
arc                  randconfig-r2109-20261109    gcc-10.5.0 cocci
arc                  randconfig-r2311-20261109    gcc-15.3.0 sparse
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
arm                          mv78xx0_defconfig    clang-24
arm                   randconfig-1000-20261110    gcc-10.5.0
arm                   randconfig-1001-20261110    gcc-10.5.0
arm                   randconfig-1002-20261110    gcc-10.5.0
arm                   randconfig-1003-20261110    gcc-10.5.0
arm                   randconfig-2000-20261109    gcc-10.5.0
arm                   randconfig-2001-20261109    gcc-10.5.0
arm                   randconfig-2002-20261109    gcc-10.5.0
arm                   randconfig-2200-20261109    clang-20   smatch
arm                  randconfig-r2103-20261109    clang-17   cocci
arm                  randconfig-r2105-20261109    gcc-8.5.0  cocci
arm                  randconfig-r2111-20261109    clang-17   cocci
arm                  randconfig-r2111-20261109    gcc-11.5.0 cocci
arm                  randconfig-r2300-20261109    clang-24   sparse
arm                  randconfig-r2309-20261109    gcc-13.5.0 sparse
arm                           sp7021_defconfig    gcc-16.2.0
arm                          vf610m4_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261110    gcc-12.5.0
arm64                 randconfig-1001-20261110    gcc-12.5.0
arm64                 randconfig-1002-20261110    gcc-12.5.0
arm64                 randconfig-1003-20261110    gcc-12.5.0
arm64                 randconfig-2000-20261109    gcc-10.5.0
arm64                 randconfig-2001-20261109    gcc-10.5.0
arm64                 randconfig-2002-20261109    gcc-10.5.0
arm64                 randconfig-2200-20261109    gcc-10.5.0 smatch
arm64                 randconfig-2200-20261110    clang-24   smatch
arm64                randconfig-r2101-20261109    gcc-16.2.0 cocci
arm64                randconfig-r2104-20261109    gcc-14.4.0 cocci
arm64                randconfig-r2107-20261109    clang-17   cocci
arm64                randconfig-r2305-20261109    clang-24   sparse
arm64                randconfig-r2310-20261109    gcc-13.5.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261110    gcc-12.5.0
csky                  randconfig-1001-20261110    gcc-12.5.0
csky                  randconfig-2000-20261109    clang-17
csky                  randconfig-2001-20261109    clang-17
csky                  randconfig-2200-20261109    gcc-16.2.0 smatch
csky                  randconfig-2200-20261110    gcc-16.2.0 smatch
csky                 randconfig-r2100-20261109    gcc-16.2.0 cocci
csky                 randconfig-r2107-20261109    gcc-11.5.0 cocci
csky                 randconfig-r2311-20261109    gcc-13.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261110    clang-17
hexagon               randconfig-1001-20261110    clang-17
hexagon               randconfig-2000-20261109    clang-17
hexagon               randconfig-2001-20261109    clang-17
hexagon               randconfig-2200-20261109    clang-17   smatch
hexagon               randconfig-2200-20261110    clang-24   smatch
hexagon              randconfig-r2100-20261109    clang-17   cocci
hexagon              randconfig-r2102-20261109    gcc-14.4.0 cocci
hexagon              randconfig-r2111-20261109    gcc-10.5.0 cocci
hexagon              randconfig-r2300-20261109    gcc-11.5.0 sparse
hexagon              randconfig-r2304-20261109    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261110    clang-22
i386        buildonly-randconfig-1001-20261110    clang-22
i386        buildonly-randconfig-1002-20261110    clang-22
i386        buildonly-randconfig-1003-20261110    clang-22
i386        buildonly-randconfig-1004-20261110    clang-22
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
i386                  randconfig-2000-20261109    clang-22
i386                  randconfig-2001-20261109    clang-22
i386                  randconfig-2002-20261109    clang-22
i386                  randconfig-2003-20261109    clang-22
i386                  randconfig-2004-20261109    clang-22
i386                  randconfig-2005-20261109    clang-22
i386                  randconfig-2100-20261109    gcc-14     cocci
i386                  randconfig-2101-20261109    gcc-14     cocci
i386                  randconfig-2102-20261109    gcc-14     cocci
i386                  randconfig-2103-20261109    gcc-14     cocci
i386                  randconfig-2104-20261109    gcc-14     cocci
i386                  randconfig-2105-20261109    gcc-14     cocci
i386                  randconfig-2200-20261109    clang-22   smatch
i386                 randconfig-r2110-20261109    clang-17   cocci
i386                 randconfig-r2305-20261109    gcc-11.5.0 sparse
i386                 randconfig-r2307-20261109    gcc-13.5.0 sparse
loongarch                         alldefconfig    clang-24
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261110    clang-17
loongarch             randconfig-1001-20261110    clang-17
loongarch             randconfig-2000-20261109    clang-18
loongarch             randconfig-2001-20261109    clang-18
loongarch             randconfig-2200-20261109    gcc-16.2.0 smatch
loongarch            randconfig-r2101-20261109    gcc-14.4.0 cocci
loongarch            randconfig-r2106-20261109    clang-17   cocci
loongarch            randconfig-r2107-20261109    gcc-10.5.0 cocci
loongarch            randconfig-r2303-20261109    clang-24   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5307c3_defconfig    clang-24
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                  randconfig-2200-20261109    gcc-12.5.0 smatch
m68k                         stmark2_defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2200-20261109    gcc-9.5.0  smatch
microblaze           randconfig-r2103-20261109    gcc-14.4.0 cocci
microblaze           randconfig-r2301-20261109    clang-24   sparse
microblaze           randconfig-r2306-20261109    clang-24   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                   decstation_64_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                             gpr_defconfig    clang-24
mips                            ip27_defconfig    clang-17
mips                            jazz_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261109    gcc-8.5.0
mips                  randconfig-2001-20261109    gcc-8.5.0
mips                  randconfig-2002-20261109    gcc-8.5.0
mips                  randconfig-2200-20261109    gcc-11.5.0 smatch
mips                 randconfig-r2101-20261109    clang-17   cocci
mips                 randconfig-r2110-20261109    gcc-11.5.0 cocci
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261110    clang-17
nios2                 randconfig-1001-20261110    clang-17
nios2                 randconfig-2000-20261109    clang-18
nios2                 randconfig-2001-20261109    clang-18
nios2                 randconfig-2200-20261109    gcc-11.5.0 smatch
nios2                randconfig-r2103-20261109    gcc-16.2.0 cocci
nios2                randconfig-r2104-20261109    gcc-16.2.0 cocci
nios2                randconfig-r2304-20261109    gcc-11.5.0 sparse
nios2                randconfig-r2307-20261109    gcc-15.3.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261109    gcc-8.5.0
openrisc              randconfig-2001-20261109    gcc-8.5.0
openrisc              randconfig-2002-20261109    gcc-8.5.0
openrisc              randconfig-2200-20261109    gcc-13.5.0 smatch
openrisc              randconfig-2200-20261110    gcc-9.5.0  smatch
openrisc             randconfig-r2108-20261109    gcc-10.5.0 cocci
openrisc             randconfig-r2303-20261109    gcc-11.5.0 sparse
openrisc             randconfig-r2306-20261109    gcc-15.3.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261110    gcc-14.4.0
parisc                randconfig-1001-20261110    gcc-14.4.0
parisc                randconfig-2000-20261109    clang-18
parisc                randconfig-2001-20261109    clang-18
parisc                randconfig-2200-20261109    gcc-15.3.0 smatch
parisc               randconfig-r2100-20261109    gcc-8.5.0  cocci
parisc               randconfig-r2301-20261109    gcc-11.5.0 sparse
parisc64                          alldefconfig    gcc-16.2.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                         cell_defconfig    clang-24
powerpc                     ge_imp3a_defconfig    gcc-16.2.0
powerpc                      powernv_defconfig    clang-17
powerpc                      ppa8548_defconfig    clang-17
powerpc               randconfig-1000-20261110    gcc-14.4.0
powerpc               randconfig-1001-20261110    gcc-14.4.0
powerpc               randconfig-2000-20261109    clang-24
powerpc               randconfig-2001-20261109    clang-24
powerpc               randconfig-2002-20261109    clang-24
powerpc               randconfig-2200-20261109    gcc-8.5.0  smatch
powerpc               randconfig-2200-20261110    clang-24   smatch
powerpc              randconfig-r2308-20261109    clang-24   sparse
powerpc                   storcenter_defconfig    clang-24
powerpc                         warp_defconfig    clang-17
powerpc                         warp_defconfig    clang-24
powerpc                         warp_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261110    gcc-14.4.0
powerpc64             randconfig-1001-20261110    gcc-14.4.0
powerpc64             randconfig-2000-20261109    clang-24
powerpc64             randconfig-2001-20261109    clang-24
powerpc64             randconfig-2002-20261109    clang-24
powerpc64             randconfig-2200-20261109    gcc-14.4.0 smatch
powerpc64            randconfig-r2310-20261109    gcc-15.3.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261110    clang-24
riscv                 randconfig-1001-20261110    clang-24
riscv                 randconfig-2000-20261109    gcc-14.4.0
riscv                 randconfig-2001-20261109    gcc-14.4.0
riscv                 randconfig-2002-20261109    gcc-14.4.0
riscv                 randconfig-2003-20261109    gcc-14.4.0
riscv                 randconfig-2004-20261109    gcc-14.4.0
riscv                 randconfig-2005-20261109    gcc-14.4.0
riscv                randconfig-r2102-20261109    gcc-8.5.0  cocci
riscv                randconfig-r2104-20261109    clang-17   cocci
riscv                randconfig-r2307-20261109    clang-24   sparse
riscv                randconfig-r2310-20261109    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261110    clang-24
s390                  randconfig-1001-20261110    clang-24
s390                  randconfig-2000-20261109    gcc-8.5.0
s390                  randconfig-2001-20261109    gcc-8.5.0
s390                  randconfig-2002-20261109    gcc-8.5.0
s390                  randconfig-2003-20261109    gcc-8.5.0
s390                  randconfig-2004-20261109    gcc-8.5.0
s390                  randconfig-2005-20261109    gcc-8.5.0
s390                  randconfig-2200-20261109    clang-24   smatch
s390                 randconfig-r2100-20261109    gcc-14.4.0 cocci
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261110    clang-24
sh                    randconfig-1001-20261110    clang-24
sh                    randconfig-2000-20261109    gcc-16.2.0
sh                    randconfig-2001-20261109    gcc-16.2.0
sh                    randconfig-2002-20261109    gcc-16.2.0
sh                    randconfig-2003-20261109    gcc-16.2.0
sh                    randconfig-2004-20261109    gcc-16.2.0
sh                    randconfig-2005-20261109    gcc-16.2.0
sh                    randconfig-2200-20261109    gcc-9.5.0  smatch
sh                   randconfig-r2106-20261109    gcc-11.5.0 cocci
sh                   randconfig-r2108-20261109    gcc-11.5.0 cocci
sh                            se7751_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261110    gcc-12.5.0
sparc                 randconfig-1001-20261110    gcc-12.5.0
sparc                 randconfig-2000-20261109    gcc-14
sparc                 randconfig-2001-20261109    gcc-14
sparc                randconfig-r2105-20261109    clang-17   cocci
sparc                randconfig-r2308-20261109    gcc-13.5.0 sparse
sparc                randconfig-r2311-20261109    clang-24   sparse
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261110    gcc-12.5.0
sparc64               randconfig-1001-20261110    gcc-12.5.0
sparc64               randconfig-2000-20261109    gcc-14
sparc64               randconfig-2001-20261109    gcc-14
sparc64               randconfig-2200-20261109    clang-24   smatch
sparc64               randconfig-2200-20261110    clang-24   smatch
sparc64              randconfig-r2103-20261109    gcc-8.5.0  cocci
sparc64              randconfig-r2108-20261109    clang-17   cocci
sparc64              randconfig-r2109-20261109    clang-17   cocci
sparc64              randconfig-r2109-20261109    gcc-11.5.0 cocci
sparc64              randconfig-r2306-20261109    gcc-13.5.0 sparse
sparc64              randconfig-r2309-20261109    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-16.2.0
um                    randconfig-1000-20261110    gcc-12.5.0
um                    randconfig-1001-20261110    gcc-12.5.0
um                    randconfig-2000-20261109    gcc-14
um                    randconfig-2001-20261109    gcc-14
um                    randconfig-2200-20261109    clang-24   smatch
um                   randconfig-r2101-20261109    gcc-8.5.0  cocci
um                   randconfig-r2302-20261109    clang-24   sparse
um                   randconfig-r2308-20261109    gcc-15.3.0 sparse
um                   randconfig-r2309-20261109    gcc-15.3.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261110    gcc-14
x86_64      buildonly-randconfig-1001-20261110    gcc-14
x86_64      buildonly-randconfig-1002-20261110    gcc-14
x86_64      buildonly-randconfig-1003-20261110    gcc-14
x86_64      buildonly-randconfig-1004-20261110    gcc-14
x86_64      buildonly-randconfig-1005-20261110    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261110    gcc-14
x86_64                randconfig-1001-20261110    gcc-14
x86_64                randconfig-1002-20261110    gcc-14
x86_64                randconfig-1003-20261110    gcc-14
x86_64                randconfig-1004-20261110    gcc-14
x86_64                randconfig-1005-20261110    gcc-14
x86_64                randconfig-1006-20261110    gcc-14
x86_64                randconfig-1007-20261110    gcc-14
x86_64                randconfig-1008-20261110    gcc-14
x86_64                randconfig-1009-20261110    gcc-14
x86_64                randconfig-1010-20261110    gcc-14
x86_64                randconfig-1011-20261110    gcc-14
x86_64                randconfig-1012-20261110    gcc-14
x86_64                randconfig-1013-20261110    gcc-14
x86_64                randconfig-1014-20261110    gcc-14
x86_64                randconfig-1015-20261110    gcc-14
x86_64                randconfig-1016-20261110    gcc-14
x86_64                randconfig-1017-20261110    gcc-14
x86_64                randconfig-2000-20261109    clang-22
x86_64                randconfig-2001-20261109    clang-22
x86_64                randconfig-2002-20261109    clang-22
x86_64                randconfig-2003-20261109    clang-22
x86_64                randconfig-2004-20261109    clang-22
x86_64                randconfig-2005-20261109    clang-22
x86_64                randconfig-2100-20261109    clang-22   cocci
x86_64                randconfig-2101-20261109    clang-22   cocci
x86_64                randconfig-2102-20261109    clang-22   cocci
x86_64                randconfig-2103-20261109    clang-22   cocci
x86_64                randconfig-2104-20261109    clang-22   cocci
x86_64                randconfig-2105-20261109    clang-22   cocci
x86_64                randconfig-2200-20261109    clang-22   smatch
x86_64               randconfig-r2102-20261109    clang-17   cocci
x86_64               randconfig-r2104-20261109    gcc-8.5.0  cocci
x86_64               randconfig-r2110-20261109    gcc-10.5.0 cocci
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
xtensa                        common_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261110    gcc-12.5.0
xtensa                randconfig-1001-20261110    gcc-12.5.0
xtensa                randconfig-2000-20261109    clang-17
xtensa                randconfig-2001-20261109    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
