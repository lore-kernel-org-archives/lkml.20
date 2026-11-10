Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309359;
	b=h3JLf/4jxjqdWqmTwhMegwE8TW66SACydN1R5+jhDHCe//5HFi3Kjzfw/rONTSHFIRwN
	 CuhlJxQpE8eMP/+GDlnkYORLoyJnpct0gSZDaRokcdEjNqyldR3RISxqTAlXwEZaOjxXI
	 goYA1nMEo0QGgTg16vpOUJuPUkRb9CCYNFxsr+oI/C/Vyz4/b1hX/tpFxkJbEnDK+IVD4
	 4T2Z4mRCEt+SqfwBpoPJ7QCyudAu/eurXJ58FRnITWXDc4OUTApwPfML07FWvJyMto58L
	 M0MDkg1qe/Wc3SV2UEDL0AHprEXYS3Zow1b3/t7xOb/pt2aLEmYhaHaTVb05u1BJBmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309359;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=h8NiLGP5nnaNsqUD07+WETwm7B99x85UxovbOw5brcI=;
	b=FJM10LsIYYeDXuvz1iVJO64xo6qbImpPiErTIxIvHr8J59XsimvQrr1SFEd7pbDYNqOm
	 ssr5Ped0+j4ghxgpMVaqrNZelTLa2JleutVWGb5R+7voGo2OCk3TAzEHOPXFXW8I5gnKY
	 wpVrsVzC/YMmbchThwbvZLiFd+XcNLj21wtNlE7IaSNHfQUxr+BFcH9Gm7C8Y/SnntHrg
	 3V39lc7h/2Wida6J54vhoWBfGFYspOxQ52TJinnMDG7RRqfsLrYvfaslvu8uQ/okSjwID
	 kcA7QL+HYBBN5fuw12Tlu4q/hLM9D5qJiH1In8JzcPmaSUuWqhpXrLKQxs5AL1EAwtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="e/mh1b+b";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B9B606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67B9B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e/mh1b+b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794309358; x=1825845358;
  h=date:from:to:cc:subject:message-id;
  bh=baquaYof/4HlEBMqxpU5A107PVBVXTJGLcoPe5e3Sl4=;
  b=e/mh1b+bzl0e6zIjZItfHwoR8rY5vyUrNtRJ+FJ9p1HMGfRFgHJryjIg
   GuDOFiPEKIUZSp3U9JnmyXXyHjN7iotbADnjVTWzpn/1zoe41u9s6ls5d
   LoYSDO0ZaF7tAxzBVdhb5eHwZQtaSzx4B3h+gRC2x9sfSVWTcmgKUxe8c
   iOH/baykd3VN4fN8Qztf1BZVurpsO/vm3bVut5VB6u4dpKi63NDkzoPxm
   HBpAc7lDSgmvgSXFcZARrUCSpXXFFpweMHWtXE4qV650gAXMAROFtJQ7A
   VueeJdJxvr9j9kOiralltuiNwwYYD7vkZFzBxnIA1R419sjuic6qjNg8K
   w==;
X-CSE-ConnectionGUID: S7C2XobVQ+mZh3W9VFbwWQ==
X-CSE-MsgGUID: AqtoeYtJQw+J1CmRPsJddQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3041130"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3041130"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 03:15:51 -0800
X-CSE-ConnectionGUID: rPsRr+K2RHK0zxnflzlppA==
X-CSE-MsgGUID: 5Mwnf7uSQw6r65/Un4qRgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8128256"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2026 03:15:50 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQjpL-00000000whE-1p6Q;
	Tue, 10 Nov 2026 11:15:47 +0000
Date: Tue, 10 Nov 2026 19:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:cache] BUILD SUCCESS
 2a93af75384b7e95d62c5a9a39e13573e2170ec5
Message-ID: <20261110191452.HmpAW6Pw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cache
branch HEAD: 2a93af75384b7e95d62c5a9a39e13573e2170ec5  fs/resctrl: Drop unnecessary parameter from resctrl_io_alloc_parse_line()

elapsed time: 832m

configs tested: 333
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2200-20261110    gcc-9.5.0  smatch
alpha                randconfig-r2310-20261110    gcc-10.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261110    gcc-10.5.0
arc                   randconfig-1001-20261110    gcc-10.5.0
arc                   randconfig-2000-20261110    gcc-8.5.0
arc                   randconfig-2001-20261110    gcc-8.5.0
arc                   randconfig-2002-20261110    gcc-8.5.0
arc                   randconfig-2003-20261110    gcc-8.5.0
arc                   randconfig-2004-20261110    gcc-8.5.0
arc                   randconfig-2005-20261110    gcc-8.5.0
arc                   randconfig-2200-20261110    gcc-8.5.0  smatch
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    clang-24
arm                          axm55xx_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                       jornada720_defconfig    clang-24
arm                             mmp2_defconfig    gcc-16.2.0
arm                          mv78xx0_defconfig    clang-24
arm                   randconfig-1000-20261110    gcc-10.5.0
arm                   randconfig-1001-20261110    gcc-10.5.0
arm                   randconfig-1002-20261110    gcc-10.5.0
arm                   randconfig-1003-20261110    gcc-10.5.0
arm                   randconfig-2000-20261110    clang-24
arm                   randconfig-2001-20261110    clang-24
arm                   randconfig-2002-20261110    clang-24
arm                   randconfig-2200-20261110    gcc-11.5.0 smatch
arm                  randconfig-r2102-20261110    gcc-14.4.0 cocci
arm                         shmobile_defconfig    clang-24
arm                           sp7021_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261110    gcc-12.5.0
arm64                 randconfig-1001-20261110    gcc-12.5.0
arm64                 randconfig-1002-20261110    gcc-12.5.0
arm64                 randconfig-1003-20261110    gcc-12.5.0
arm64                 randconfig-2000-20261110    clang-24
arm64                 randconfig-2001-20261110    clang-24
arm64                 randconfig-2002-20261110    clang-24
arm64                 randconfig-2200-20261110    clang-24   smatch
arm64                randconfig-r2100-20261110    gcc-14.4.0 cocci
arm64                randconfig-r2110-20261110    clang-19   cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261110    gcc-12.5.0
csky                  randconfig-1001-20261110    gcc-12.5.0
csky                  randconfig-2000-20261110    gcc-11.5.0
csky                  randconfig-2001-20261110    gcc-11.5.0
csky                  randconfig-2200-20261110    gcc-16.2.0 smatch
csky                 randconfig-r2108-20261110    clang-19   cocci
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261110    clang-17
hexagon               randconfig-1001-20261110    clang-17
hexagon               randconfig-2000-20261110    gcc-11.5.0
hexagon               randconfig-2001-20261110    gcc-11.5.0
hexagon               randconfig-2200-20261110    clang-24   smatch
hexagon              randconfig-r2111-20261110    gcc-10.5.0 cocci
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
i386                  randconfig-1000-20261110    gcc-14
i386                  randconfig-1001-20261110    gcc-14
i386                  randconfig-1002-20261110    gcc-14
i386                  randconfig-1003-20261110    gcc-14
i386                  randconfig-1004-20261110    gcc-14
i386                  randconfig-1005-20261110    gcc-14
i386                  randconfig-1006-20261110    gcc-14
i386                  randconfig-1007-20261110    clang-22
i386                  randconfig-1008-20261110    clang-22
i386                  randconfig-1009-20261110    clang-22
i386                  randconfig-1010-20261110    clang-22
i386                  randconfig-1011-20261110    clang-22
i386                  randconfig-1012-20261110    clang-22
i386                  randconfig-1013-20261110    clang-22
i386                  randconfig-2000-20261110    clang-22
i386                  randconfig-2001-20261110    clang-22
i386                  randconfig-2002-20261110    clang-22
i386                  randconfig-2003-20261110    clang-22
i386                  randconfig-2004-20261110    clang-22
i386                  randconfig-2005-20261110    clang-22
i386                  randconfig-2200-20261110    gcc-13     smatch
i386                 randconfig-r2101-20261110    gcc-16.2.0 cocci
i386                 randconfig-r2311-20261110    gcc-10.5.0 sparse
loongarch                         alldefconfig    clang-24
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261110    clang-17
loongarch             randconfig-1001-20261110    clang-17
loongarch             randconfig-2000-20261110    gcc-11.5.0
loongarch             randconfig-2001-20261110    gcc-11.5.0
loongarch             randconfig-2200-20261110    clang-24   smatch
loongarch            randconfig-r2107-20261110    clang-19   cocci
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5307c3_defconfig    clang-24
m68k                  randconfig-2200-20261110    gcc-16.2.0 smatch
m68k                 randconfig-r2111-20261110    clang-19   cocci
m68k                         stmark2_defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2200-20261110    gcc-8.5.0  smatch
microblaze           randconfig-r2105-20261110    gcc-16.2.0 cocci
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                           ath79_defconfig    clang-24
mips                            ci20_defconfig    clang-24
mips                      eyeq6lplus_defconfig    clang-24
mips                             gpr_defconfig    clang-24
mips                            jazz_defconfig    clang-24
mips                  randconfig-2000-20261110    gcc-16.2.0
mips                  randconfig-2001-20261110    gcc-16.2.0
mips                  randconfig-2002-20261110    gcc-16.2.0
mips                  randconfig-2200-20261110    clang-17   smatch
mips                 randconfig-r2103-20261110    gcc-14.4.0 cocci
mips                 randconfig-r2110-20261110    gcc-10.5.0 cocci
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261110    clang-17
nios2                 randconfig-1001-20261110    clang-17
nios2                 randconfig-2000-20261110    gcc-11.5.0
nios2                 randconfig-2001-20261110    gcc-11.5.0
nios2                 randconfig-2200-20261110    gcc-11.5.0 smatch
nios2                randconfig-r2101-20261110    gcc-14.4.0 cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261110    gcc-16.2.0
openrisc              randconfig-2001-20261110    gcc-16.2.0
openrisc              randconfig-2002-20261110    gcc-16.2.0
openrisc              randconfig-2200-20261110    gcc-9.5.0  smatch
openrisc             randconfig-r2107-20261110    gcc-10.5.0 cocci
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261110    gcc-14.4.0
parisc                randconfig-1001-20261110    gcc-14.4.0
parisc                randconfig-2000-20261110    gcc-11.5.0
parisc                randconfig-2001-20261110    gcc-11.5.0
parisc                randconfig-2200-20261110    gcc-15.3.0 smatch
parisc64                          alldefconfig    gcc-16.2.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                         cell_defconfig    clang-24
powerpc                     ge_imp3a_defconfig    gcc-16.2.0
powerpc                       mgcoge_defconfig    clang-24
powerpc                      mpc5200_defconfig    clang-24
powerpc                  mpc836x_rdk_defconfig    clang-24
powerpc               randconfig-1000-20261110    gcc-14.4.0
powerpc               randconfig-1001-20261110    gcc-14.4.0
powerpc               randconfig-2000-20261110    gcc-10.5.0
powerpc               randconfig-2001-20261110    gcc-10.5.0
powerpc               randconfig-2002-20261110    gcc-10.5.0
powerpc               randconfig-2200-20261110    clang-24   smatch
powerpc              randconfig-r2309-20261110    gcc-10.5.0 sparse
powerpc                   storcenter_defconfig    clang-24
powerpc                         warp_defconfig    clang-24
powerpc                         warp_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261110    gcc-14.4.0
powerpc64             randconfig-1001-20261110    gcc-14.4.0
powerpc64             randconfig-2000-20261110    gcc-10.5.0
powerpc64             randconfig-2001-20261110    gcc-10.5.0
powerpc64             randconfig-2002-20261110    gcc-10.5.0
powerpc64            randconfig-r2102-20261110    gcc-16.2.0 cocci
riscv                             alldefconfig    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                     nommu_k210_defconfig    clang-24
riscv                 randconfig-1000-20261110    clang-24
riscv                 randconfig-1001-20261110    clang-24
riscv                 randconfig-2000-20261110    gcc-12.5.0
riscv                 randconfig-2001-20261110    gcc-12.5.0
riscv                 randconfig-2002-20261110    gcc-12.5.0
riscv                 randconfig-2003-20261110    gcc-12.5.0
riscv                 randconfig-2004-20261110    gcc-12.5.0
riscv                 randconfig-2005-20261110    gcc-12.5.0
riscv                 randconfig-2200-20261110    gcc-8.5.0  smatch
riscv                randconfig-r2104-20261110    gcc-14.4.0 cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261110    clang-24
s390                  randconfig-1001-20261110    clang-24
s390                  randconfig-2000-20261110    clang-20
s390                  randconfig-2001-20261110    clang-20
s390                  randconfig-2002-20261110    clang-20
s390                  randconfig-2003-20261110    clang-20
s390                  randconfig-2004-20261110    clang-20
s390                  randconfig-2005-20261110    clang-20
s390                  randconfig-2200-20261110    clang-18   smatch
s390                 randconfig-r2100-20261110    gcc-16.2.0 cocci
s390                 randconfig-r2106-20261110    clang-19   cocci
s390                 randconfig-r2307-20261110    gcc-10.5.0 sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261110    clang-24
sh                    randconfig-1001-20261110    clang-24
sh                    randconfig-2000-20261110    gcc-9.5.0
sh                    randconfig-2001-20261110    gcc-9.5.0
sh                    randconfig-2002-20261110    gcc-9.5.0
sh                    randconfig-2003-20261110    gcc-9.5.0
sh                    randconfig-2004-20261110    gcc-9.5.0
sh                    randconfig-2005-20261110    gcc-9.5.0
sh                    randconfig-2200-20261110    gcc-16.2.0 smatch
sh                   randconfig-r2103-20261110    gcc-16.2.0 cocci
sh                   randconfig-r2104-20261110    gcc-16.2.0 cocci
sh                   randconfig-r2106-20261110    gcc-10.5.0 cocci
sh                   randconfig-r2109-20261110    gcc-10.5.0 cocci
sh                   sh7785lcr_32bit_defconfig    clang-24
sh                             shmin_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261110    gcc-12.5.0
sparc                 randconfig-1001-20261110    gcc-12.5.0
sparc                 randconfig-2000-20261110    gcc-14
sparc                 randconfig-2001-20261110    gcc-14
sparc                 randconfig-2200-20261110    gcc-13.5.0 smatch
sparc                randconfig-r2109-20261110    clang-19   cocci
sparc                        sparc32_defconfig    gcc-16.2.0
sparc                        sparc64_defconfig    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261110    gcc-12.5.0
sparc64               randconfig-1001-20261110    gcc-12.5.0
sparc64               randconfig-2000-20261110    gcc-14
sparc64               randconfig-2001-20261110    gcc-14
sparc64               randconfig-2200-20261110    clang-24   smatch
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261110    gcc-12.5.0
um                    randconfig-1001-20261110    gcc-12.5.0
um                    randconfig-2000-20261110    gcc-14
um                    randconfig-2001-20261110    gcc-14
um                    randconfig-2200-20261110    gcc-14     smatch
um                   randconfig-r2306-20261110    gcc-10.5.0 sparse
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
x86_64                randconfig-2000-20261110    clang-22
x86_64                randconfig-2001-20261110    clang-22
x86_64                randconfig-2002-20261110    clang-22
x86_64                randconfig-2003-20261110    clang-22
x86_64                randconfig-2004-20261110    clang-22
x86_64                randconfig-2005-20261110    clang-22
x86_64                randconfig-2100-20261110    clang-22   cocci
x86_64                randconfig-2101-20261110    clang-22   cocci
x86_64                randconfig-2102-20261110    clang-22   cocci
x86_64                randconfig-2103-20261110    clang-22   cocci
x86_64                randconfig-2104-20261110    clang-22   cocci
x86_64                randconfig-2105-20261110    clang-22   cocci
x86_64                randconfig-2200-20261110    gcc-14     smatch
x86_64               randconfig-r2308-20261110    gcc-10.5.0 sparse
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
xtensa                randconfig-2000-20261110    gcc-11.5.0
xtensa                randconfig-2001-20261110    gcc-11.5.0
xtensa               randconfig-r2105-20261110    gcc-14.4.0 cocci
xtensa               randconfig-r2108-20261110    gcc-10.5.0 cocci

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
