Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793161937;
	b=A70slW65MTg5IcvA4Oke911i5FciEzQlrlwIIHBAH6iH+nfZDaKW7ECqEa2nEDhdkOxD
	 SR41IGqNL70Y0gem0zTQE1ylpyXmdGG0O2a4WuMGdv8wbhCpZheK/RY4WL3r+1YM/WT04
	 X+z2d6nMU7wbrjpKqljnx2sfdi9nYdyOVk2tdVbTFdgmu/rDtDSqt2taIuE8XMTUoobAO
	 5wbqQE6tsQXC6Tp4ig+HYla00lLqm2FBKsxf+dbxN3sp4+z+CSzVNprzvMQbupLJoWuJp
	 4sHG6uw1MXKKZs0bpjEofY5T4aEhw3ents5unwRZUnfnEeJcMmOv/MlGQxUHnMMah9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793161937;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=MWZvFpaspfzCpABUTJkFCFlgRlN2pqL2Q5/QPSYXuZo=;
	b=oZ+i2uuP9PSaWak64KdXIfZIOwPT4vcVakBk4mDd6E4e8OE83WIMEUn5oKzjf1WYOwjl
	 lWU0CR4D9F12OjTXqZ7HlA4A1T9b0FWETS6tl0PqEG3e2Qa2q8BVTMkjySZYYGFG3cXQP
	 Yyx5jm5r7//eJHfm9Z/EF62XGdxjr7jck1lEmkwDOTsai4VwkukokZKrAbtbb78B1S3ew
	 XWD0kItlUGbWWPbuXub2OYbTLv/wGIro3hJgiYWKpk2KTnL475ZQTTZrwOPFXXZO3eKWJ
	 KfBfsPMYxlWT8V/Z+EmWbKIV2VmyF9A+ap73FM3h+qoDNfyG2kw973elUp4PLfcyhZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Darz3A6f;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E5F606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31E5F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Darz3A6f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793161937; x=1824697937;
  h=date:from:to:cc:subject:message-id;
  bh=PuiyGvlI0DXP7gpoz5JPfr+gtJyWnbyFulbzJSDeJxU=;
  b=Darz3A6f1A633x6zOPGvT95Wuych9mKtNqTGORx9bJ5+5atQr3bZ+uIK
   XFXE+VXjIH0FYeAHPRzhC3u8wgoICqLVTCgt249Ym+UR38Xp3xOOBKsK9
   3plJGXwLHNc6SQQxshuujEwodlZjX0pKeKonhhW4r7YrMndRgveJDNYoy
   nwykxlyTft7oYVG3Uej2egzTb84sQrsclZcSLErl7NsVxZBkszfzo9Thc
   1KU/8MtOku8LoQkul/LY+VFlq1V3YcPeTfalInC0/lfS5ipQWdvht+wgA
   sVWPvFHvFDnPeXWdhFCTaDEmGHEcFU4JtJuR+ROE7nqapVOe72p0Hufh1
   A==;
X-CSE-ConnectionGUID: AJJ9ORI+TBCkSbBWAcE+KA==
X-CSE-MsgGUID: pQHrjPzGRGSAiITWYwWUJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1980007"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1980007"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 21:32:16 -0700
X-CSE-ConnectionGUID: GQsVnUezTiCf6m4dUEWlBw==
X-CSE-MsgGUID: otCp4Qu3RXeV/o52XCvCNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4862440"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Oct 2026 21:32:15 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLvKe-00000000YCr-2tpy;
	Wed, 28 Oct 2026 04:32:12 +0000
Date: Wed, 28 Oct 2026 12:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip:urgent] BUILD SUCCESS
 157bb1db9cb2534a1c9dd356a5827471379edfee
Message-ID: <202610281246.GOkDbodK-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 157bb1db9cb2534a1c9dd356a5827471379edfee  Merge branch into tip/master: 'x86/urgent'

elapsed time: 3199m

configs tested: 185
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                           axs101_defconfig    gcc-16.2.0
arc                       axs103_smp_defconfig    clang-17
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261026    clang-24
arc                   randconfig-1001-20261026    clang-24
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                          orion5x_defconfig    clang-17
arm                   randconfig-1000-20261026    clang-24
arm                   randconfig-1001-20261026    clang-24
arm                   randconfig-1002-20261026    clang-24
arm                   randconfig-1003-20261026    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261026    clang-24
arm64                 randconfig-1001-20261026    clang-24
arm64                 randconfig-1002-20261026    clang-24
arm64                 randconfig-1003-20261026    clang-24
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261026    clang-24
csky                  randconfig-1001-20261026    clang-24
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261026    clang-24
hexagon               randconfig-1001-20261026    clang-24
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261026    clang-22
i386        buildonly-randconfig-1001-20261026    clang-22
i386        buildonly-randconfig-1002-20261026    clang-22
i386        buildonly-randconfig-1003-20261026    clang-22
i386        buildonly-randconfig-1004-20261026    clang-22
i386        buildonly-randconfig-1005-20261026    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261026    gcc-14
i386                  randconfig-1001-20261026    gcc-14
i386                  randconfig-1002-20261026    gcc-14
i386                  randconfig-1003-20261026    gcc-14
i386                  randconfig-1004-20261026    gcc-14
i386                  randconfig-1005-20261026    gcc-14
i386                  randconfig-1006-20261026    gcc-14
i386                  randconfig-1007-20261026    clang-22
i386                  randconfig-1008-20261026    clang-22
i386                  randconfig-1009-20261026    clang-22
i386                  randconfig-1010-20261026    clang-22
i386                  randconfig-1011-20261026    clang-22
i386                  randconfig-1012-20261026    clang-22
i386                  randconfig-1013-20261026    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261026    clang-24
loongarch             randconfig-1001-20261026    clang-24
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                          apollo_defconfig    clang-17
m68k                                 defconfig    clang-24
m68k                        m5275evb_defconfig    clang-17
m68k                        m5329evb_defconfig    clang-17
microblaze                        alldefconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                         bcm47xx_defconfig    clang-17
mips                       loongson1_defconfig    gcc-16.2.0
mips                       maltaaprp_defconfig    clang-17
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261026    clang-24
nios2                 randconfig-1001-20261026    clang-24
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261026    gcc-14.4.0
parisc                randconfig-1001-20261026    gcc-14.4.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    gcc-16.2.0
powerpc                      ep8248e_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261026    gcc-14.4.0
powerpc               randconfig-1001-20261026    gcc-14.4.0
powerpc                     sam440ep_defconfig    clang-17
powerpc64             randconfig-1000-20261026    gcc-14.4.0
powerpc64             randconfig-1001-20261026    gcc-14.4.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261026    gcc-13.5.0
riscv                 randconfig-1001-20261026    gcc-13.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261026    gcc-13.5.0
s390                  randconfig-1001-20261026    gcc-13.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261026    gcc-13.5.0
sh                    randconfig-1001-20261026    gcc-13.5.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261026    gcc-14
sparc                 randconfig-1001-20261026    gcc-14
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261026    gcc-14
sparc64               randconfig-1001-20261026    gcc-14
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261026    gcc-14
um                    randconfig-1001-20261026    gcc-14
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261026    clang-22
x86_64      buildonly-randconfig-1001-20261026    clang-22
x86_64      buildonly-randconfig-1002-20261026    clang-22
x86_64      buildonly-randconfig-1003-20261026    clang-22
x86_64      buildonly-randconfig-1004-20261026    clang-22
x86_64      buildonly-randconfig-1005-20261026    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261026    clang-22
x86_64                randconfig-1001-20261026    clang-22
x86_64                randconfig-1002-20261026    clang-22
x86_64                randconfig-1003-20261026    clang-22
x86_64                randconfig-1004-20261026    clang-22
x86_64                randconfig-1005-20261026    clang-22
x86_64                randconfig-1006-20261026    gcc-14
x86_64                randconfig-1007-20261026    gcc-14
x86_64                randconfig-1008-20261026    gcc-14
x86_64                randconfig-1009-20261026    gcc-14
x86_64                randconfig-1010-20261026    gcc-14
x86_64                randconfig-1011-20261026    gcc-14
x86_64                randconfig-1012-20261026    gcc-14
x86_64                randconfig-1013-20261026    gcc-14
x86_64                randconfig-1014-20261026    gcc-14
x86_64                randconfig-1015-20261026    gcc-14
x86_64                randconfig-1016-20261026    gcc-14
x86_64                randconfig-1017-20261026    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261026    gcc-14
xtensa                randconfig-1001-20261026    gcc-14
xtensa                     xip_kc705_defconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
