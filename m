Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258309;
	b=SjiL4ZaEhO6J7yalDzWikjeHFyEHZFkWjR5PBCaCVWXLWBkkIx8YuXsfv1BGaUOTxYUZ
	 N1Vgyz2V5yy35iPGwpqtmznKcO8TusgiKQko/Skn9reEdy7X+O3yRHGYGmZcbQlk8Xsq8
	 ENKATpA3sqaboGVxSVee83qHqUwCgR37jP5HTOhEngLNtgzHFtek4Pj/rQ+gpBICY0ZXN
	 yMnBows+VywYqEE0I/3UK6nQvw0q4ZWXaY/Db6bDKpeWbXg8LcdkkiwaEsvQtry1Sn1h6
	 BJx/oQtEFokRJEH1m738UQu03nFyB2PEFlr0rK3YFmPwgzMO0glPKy+I0jMxfK8ZeRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258309;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OvnqSKKFfqGiTA7pvAKaQ0tATAwKl6k/zulfLBZSjRA=;
	b=ooygZgf34g+byQsHIdgXNVYOklkCXMkMjgytijnssdyrLJpe9nvQycMdtBRmGVDKdwmq
	 00arkb8PdQlhjyk/P1KWfadJ/UqzYNm82FOavGepuwpqSiVysbYrZoKEHXNsCrf8fwSsV
	 DphYxQPSq4T/3bf2mRwgGeTKc+f7POi6/NEGcPA3Hgz3eHfUU8Ykj86sq0/WT05DFMquS
	 wTjAZWuHfSyxwtEdfON80dfDD5zKJY0TKBDwYejvuST6A276NgMUSfGrpZuPCyqKVDIhs
	 vVcBx5Zx0nuGMfQMi4+Lzmv7AEqKaAZKrIHpojjaNoXJZKFaLipqfgLH1kX802JaI4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dLbTySwQ;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F35A606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F35A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dLbTySwQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794258309; x=1825794309;
  h=date:from:to:cc:subject:message-id;
  bh=xgw2XI9o478E3k7DCKwyAy5ontBSmbz7p2qYxta8h7E=;
  b=dLbTySwQB4oee8aLlgNiNqSP0puBs8BIQohm0AVyj1MAajPKCf438Mbm
   JBEhbzE9zwmx1lq89EODU3K+vUpzS0R3Yq3FZPzbpDcvMW636FrGrWpp4
   fE1r8JjplA88EJiq82/DGgap2hWiuV3e5JPqc73mrBzw4qfuM9Wwi73YG
   PPph3lJYDGeVATeoDvRs1vC/Si1O3bkkT4ADuK8bVmZyiloHaf83pxv17
   m4KJ0aC+6cYn14u5Nk3BrKbsLmLB27PcD2LysKm7Qo7w1BWud2pEUv5li
   yLjOTFlOeTEzXfZE6pvjfU3xtgMFdjImDFaJv4e7NeWSHyWX2oIIYQBeV
   g==;
X-CSE-ConnectionGUID: 71eX55afS4CQJfujuqRZyw==
X-CSE-MsgGUID: bjf7E7pIRrSa9TBy/S1asQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2890756"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2890756"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 13:05:08 -0800
X-CSE-ConnectionGUID: Ots2+Ju4R5Cs92yX5yQl1Q==
X-CSE-MsgGUID: fAfMA+kYTeajcSK0V44GpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7959788"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Nov 2026 13:05:06 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQWY4-00000000vKJ-1OdI;
	Mon, 09 Nov 2026 21:05:04 +0000
Date: Tue, 10 Nov 2026 05:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:sev] BUILD SUCCESS
 641890fe65068455c73f45288bc6f5e435650dd6
Message-ID: <20261110050416.Ss5eRFjH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/sev
branch HEAD: 641890fe65068455c73f45288bc6f5e435650dd6  x86/sev: Fix kmemleak false positive for the RMP segment descriptors

elapsed time: 800m

configs tested: 285
configs skipped: 200

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                randconfig-r2103-20261109    gcc-8.5.0  cocci
alpha                randconfig-r2109-20261109    gcc-16.2.0 cocci
alpha                randconfig-r2300-20261109    clang-22   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261109    clang-24
arc                   randconfig-1001-20261109    clang-24
arc                   randconfig-2000-20261109    gcc-8.5.0
arc                   randconfig-2001-20261109    gcc-8.5.0
arc                   randconfig-2002-20261109    gcc-8.5.0
arc                   randconfig-2003-20261109    gcc-8.5.0
arc                   randconfig-2004-20261109    gcc-8.5.0
arc                   randconfig-2005-20261109    gcc-8.5.0
arc                   randconfig-2200-20261109    gcc-13.5.0 smatch
arc                            tb10x_defconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                   randconfig-1000-20261109    clang-24
arm                   randconfig-1001-20261109    clang-24
arm                   randconfig-1002-20261109    clang-24
arm                   randconfig-1003-20261109    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261109    gcc-13.5.0
arm64                 randconfig-1001-20261109    gcc-13.5.0
arm64                 randconfig-1002-20261109    gcc-13.5.0
arm64                 randconfig-1003-20261109    gcc-13.5.0
arm64                 randconfig-2200-20261109    gcc-10.5.0 smatch
arm64                randconfig-r2303-20261109    gcc-13.5.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261109    gcc-13.5.0
csky                  randconfig-1001-20261109    gcc-13.5.0
csky                  randconfig-2000-20261109    clang-17
csky                  randconfig-2001-20261109    clang-17
csky                  randconfig-2200-20261109    gcc-16.2.0 smatch
csky                 randconfig-r2301-20261109    clang-22   sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261109    clang-19
hexagon               randconfig-1000-20261110    clang-17
hexagon               randconfig-1001-20261109    clang-19
hexagon               randconfig-1001-20261110    clang-17
hexagon               randconfig-2000-20261109    clang-17
hexagon               randconfig-2001-20261109    clang-17
hexagon              randconfig-r2110-20261109    gcc-16.2.0 cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261109    clang-22
i386        buildonly-randconfig-1001-20261109    clang-22
i386        buildonly-randconfig-1002-20261109    clang-22
i386        buildonly-randconfig-1003-20261109    clang-22
i386        buildonly-randconfig-1004-20261109    clang-22
i386        buildonly-randconfig-1005-20261109    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261109    gcc-14
i386                  randconfig-1001-20261109    gcc-14
i386                  randconfig-1002-20261109    gcc-14
i386                  randconfig-1003-20261109    gcc-14
i386                  randconfig-1004-20261109    gcc-14
i386                  randconfig-1005-20261109    gcc-14
i386                  randconfig-1006-20261109    gcc-14
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
i386                  randconfig-2200-20261109    clang-22   smatch
i386                 randconfig-r2304-20261109    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261109    clang-19
loongarch             randconfig-1000-20261110    clang-17
loongarch             randconfig-1001-20261109    clang-19
loongarch             randconfig-1001-20261110    clang-17
loongarch             randconfig-2200-20261109    gcc-16.2.0 smatch
loongarch            randconfig-r2106-20261109    gcc-16.2.0 cocci
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                       m54418evb_defconfig    gcc-16.2.0
m68k                  randconfig-2200-20261109    gcc-12.5.0 smatch
m68k                 randconfig-r2101-20261109    gcc-8.5.0  cocci
m68k                 randconfig-r2300-20261109    gcc-13.5.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2200-20261109    gcc-9.5.0  smatch
microblaze           randconfig-r2111-20261109    gcc-16.2.0 cocci
microblaze           randconfig-r2301-20261109    gcc-13.5.0 sparse
microblaze           randconfig-r2302-20261109    clang-22   sparse
microblaze           randconfig-r2311-20261109    clang-17   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                   maltasmvp_eva_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261109    gcc-8.5.0
mips                  randconfig-2001-20261109    gcc-8.5.0
mips                  randconfig-2002-20261109    gcc-8.5.0
mips                  randconfig-2200-20261109    gcc-11.5.0 smatch
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261109    clang-19
nios2                 randconfig-1000-20261110    clang-17
nios2                 randconfig-1001-20261109    clang-19
nios2                 randconfig-1001-20261110    clang-17
nios2                 randconfig-2200-20261109    gcc-11.5.0 smatch
nios2                randconfig-r2105-20261109    gcc-8.5.0  cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261109    gcc-8.5.0
openrisc              randconfig-2001-20261109    gcc-8.5.0
openrisc              randconfig-2002-20261109    gcc-8.5.0
openrisc              randconfig-2200-20261109    gcc-13.5.0 smatch
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261109    gcc-8.5.0
parisc                randconfig-1001-20261109    gcc-8.5.0
parisc                randconfig-2200-20261109    gcc-15.3.0 smatch
parisc               randconfig-r2100-20261109    gcc-8.5.0  cocci
parisc               randconfig-r2307-20261109    clang-17   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                           g5_defconfig    gcc-16.2.0
powerpc                      kmeter1_defconfig    gcc-16.2.0
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261109    gcc-8.5.0
powerpc               randconfig-1001-20261109    gcc-8.5.0
powerpc               randconfig-2000-20261109    clang-24
powerpc               randconfig-2001-20261109    clang-24
powerpc               randconfig-2002-20261109    clang-24
powerpc               randconfig-2200-20261109    gcc-8.5.0  smatch
powerpc              randconfig-r2102-20261109    gcc-8.5.0  cocci
powerpc              randconfig-r2305-20261109    clang-22   sparse
powerpc64             randconfig-1000-20261109    gcc-8.5.0
powerpc64             randconfig-1001-20261109    gcc-8.5.0
powerpc64             randconfig-2000-20261109    clang-24
powerpc64             randconfig-2001-20261109    clang-24
powerpc64             randconfig-2002-20261109    clang-24
powerpc64             randconfig-2200-20261109    gcc-14.4.0 smatch
powerpc64            randconfig-r2308-20261109    clang-17   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261109    gcc-8.5.0
riscv                 randconfig-1001-20261109    gcc-8.5.0
riscv                 randconfig-2000-20261109    gcc-14.4.0
riscv                 randconfig-2001-20261109    gcc-14.4.0
riscv                 randconfig-2002-20261109    gcc-14.4.0
riscv                 randconfig-2003-20261109    gcc-14.4.0
riscv                 randconfig-2004-20261109    gcc-14.4.0
riscv                 randconfig-2005-20261109    gcc-14.4.0
riscv                randconfig-r2303-20261109    clang-22   sparse
riscv                randconfig-r2306-20261109    clang-17   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261109    gcc-8.5.0
s390                  randconfig-1001-20261109    gcc-8.5.0
s390                  randconfig-2000-20261109    gcc-8.5.0
s390                  randconfig-2001-20261109    gcc-8.5.0
s390                  randconfig-2002-20261109    gcc-8.5.0
s390                  randconfig-2003-20261109    gcc-8.5.0
s390                  randconfig-2004-20261109    gcc-8.5.0
s390                  randconfig-2005-20261109    gcc-8.5.0
s390                  randconfig-2200-20261109    clang-24   smatch
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261109    gcc-8.5.0
sh                    randconfig-1001-20261109    gcc-8.5.0
sh                   randconfig-r2309-20261109    clang-17   sparse
sh                         sh7757lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261109    gcc-8.5.0
sparc                 randconfig-1000-20261110    gcc-12.5.0
sparc                 randconfig-1001-20261109    gcc-8.5.0
sparc                 randconfig-1001-20261110    gcc-12.5.0
sparc                randconfig-r2302-20261109    gcc-13.5.0 sparse
sparc                randconfig-r2304-20261109    gcc-13.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261109    gcc-8.5.0
sparc64               randconfig-1000-20261110    gcc-12.5.0
sparc64               randconfig-1001-20261109    gcc-8.5.0
sparc64               randconfig-1001-20261110    gcc-12.5.0
sparc64               randconfig-2200-20261109    clang-24   smatch
sparc64              randconfig-r2107-20261109    gcc-16.2.0 cocci
sparc64              randconfig-r2108-20261109    gcc-16.2.0 cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261109    gcc-8.5.0
um                    randconfig-1000-20261110    gcc-12.5.0
um                    randconfig-1001-20261109    gcc-8.5.0
um                    randconfig-1001-20261110    gcc-12.5.0
um                    randconfig-2200-20261109    clang-24   smatch
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261109    clang-22
x86_64      buildonly-randconfig-1000-20261110    gcc-14
x86_64      buildonly-randconfig-1001-20261109    clang-22
x86_64      buildonly-randconfig-1001-20261110    gcc-14
x86_64      buildonly-randconfig-1002-20261109    clang-22
x86_64      buildonly-randconfig-1002-20261110    gcc-14
x86_64      buildonly-randconfig-1003-20261109    clang-22
x86_64      buildonly-randconfig-1003-20261110    gcc-14
x86_64      buildonly-randconfig-1004-20261109    clang-22
x86_64      buildonly-randconfig-1004-20261110    gcc-14
x86_64      buildonly-randconfig-1005-20261109    clang-22
x86_64      buildonly-randconfig-1005-20261110    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261109    clang-22
x86_64                randconfig-1001-20261109    clang-22
x86_64                randconfig-1002-20261109    clang-22
x86_64                randconfig-1003-20261109    clang-22
x86_64                randconfig-1004-20261109    clang-22
x86_64                randconfig-1005-20261109    clang-22
x86_64                randconfig-1006-20261109    gcc-14
x86_64                randconfig-1007-20261109    gcc-14
x86_64                randconfig-1008-20261109    gcc-14
x86_64                randconfig-1009-20261109    gcc-14
x86_64                randconfig-1010-20261109    gcc-14
x86_64                randconfig-1011-20261109    gcc-14
x86_64                randconfig-1012-20261109    clang-22
x86_64                randconfig-1013-20261109    clang-22
x86_64                randconfig-1014-20261109    clang-22
x86_64                randconfig-1015-20261109    clang-22
x86_64                randconfig-1016-20261109    clang-22
x86_64                randconfig-1017-20261109    clang-22
x86_64                randconfig-2200-20261109    clang-22   smatch
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261109    gcc-8.5.0
xtensa                randconfig-1000-20261110    gcc-12.5.0
xtensa                randconfig-1001-20261109    gcc-8.5.0
xtensa                randconfig-1001-20261110    gcc-12.5.0
xtensa                randconfig-2000-20261109    clang-17
xtensa                randconfig-2001-20261109    clang-17
xtensa               randconfig-r2104-20261109    gcc-8.5.0  cocci
xtensa               randconfig-r2305-20261109    gcc-13.5.0 sparse
xtensa               randconfig-r2310-20261109    clang-17   sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
