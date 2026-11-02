Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638182;
	b=M4v28ZKdFaOTZvj3inyGdWudVUaqgC9cU7q896cQGqLtB4s0Gm+Y6dqeJwrV0HWB0uUO
	 J2etehlevM6q4F5YNMVMdHSegWZXpr/SiqMXLhtG9EX/RDdSwL/LYeme9QQ9/H130CWA6
	 l4j+GcGFWGfbl1sh3kf8vWMydRkMIPviL74VUzKGA63tZv6gKkaWX6rWl4oGg5xzUVhZ+
	 lhyd1TAy6eU7ciJeWjxjaJTx41Vjqn3u/pB+yQgEF72HLnLAd7/PtvUDq9Od2Gv0Pz7OZ
	 pNhjA3PhMXsS2/9EV6Xh29jbCSS7XQIXdsZCbfSa5RhHn3PiRcYIybPjeXUEsEapz2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638182;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wur5qMkSLPRT0S7FQ2gPEBdHLSdZzxJDxv05Dno2puU=;
	b=s8gFojd7uwrXIbBS75o29WAixicl5o7UCajWkp5ysUpfFh0a54ezDvH0JNbqDItOOCw+
	 RbSXCBAPzM3LOpE2YJK5t+UQ2QePen/4bLwRGMB0hfowWZ4bMoaJQc5DclCXM7JCgaFCO
	 qrykR6wTCRsfLrsbOvG7Kq2z0zABr8WjZ92295BBhqqmjluH7dknYZ8myHVWkynmaBIpz
	 7LTCU00h2l5lXPS5MAX5MbT16rCRwX8TgLl/zwJcHG+7ks5JCddP0hY5ksr3sHSD/GEa4
	 VhpdCFin+81bMrCnKExohJbUw1y7EVolZLOgWqYXnRibs7o5mBKJehxHw0ocAvTtktA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BGQ7sXz3;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8EA6072C6B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8EA6072C6B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BGQ7sXz3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793638182; x=1825174182;
  h=date:from:to:cc:subject:message-id;
  bh=9MMAu0uyqlFy6nERFtod9EDatWnJdwuQ94QL2hgUDd8=;
  b=BGQ7sXz3GiebnrpF44f3Uu3e4oEV8Q3iHLq5TIXWpknkTjNPV/vDWruB
   71b6F42LfiTKWAdHdS+uGZYbngotijR3XcPGYJ1/fd0mLC6pBDQgJkXaW
   8FSSzFlTAfZR1u8aN4QAx7owS6IfJ1E/dZrL/+etLkZv37UU0vOsZA1JJ
   8M/AMzfIIsF1uLQWO8jPVRLGRdRr2gaTfE3bf/33vp8rfdu6ZbcyuiW8X
   DxeqlZ5MdSJniMFVzx9WswwyLJ8gtid1erlhl6qyyC4jSL+rWk56O5wig
   dG8x+gsYFKK8fkGtpbyvWfJKYV6/rw1UlpX9lW1c4IMv9e5cQYtdmzc4e
   w==;
X-CSE-ConnectionGUID: dux5hVgDR2eAg/jeDn3MZw==
X-CSE-MsgGUID: Be++Fd2PQpSGo4MwwxrOsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2217997"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2217997"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 08:49:40 -0800
X-CSE-ConnectionGUID: wQ3Hjg5/SKGx7iYP4TwgYQ==
X-CSE-MsgGUID: sF3tNj6vQsGoA8+bgLA0fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6269021"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Nov 2026 08:49:39 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNvE0-00000000hQ2-38Sf;
	Mon, 02 Nov 2026 16:49:36 +0000
Date: Tue, 03 Nov 2026 00:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 f96ebf32b3135db4c9eeb868e4cb98e5dfe79ac0
Message-ID: <20261103004919.zIyPLMEY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: f96ebf32b3135db4c9eeb868e4cb98e5dfe79ac0  Merge branch into tip/master: 'x86/misc'

elapsed time: 1973m

configs tested: 158
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                      haps_hs_smp_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261102    gcc-10.5.0
arc                   randconfig-1001-20261102    gcc-10.5.0
arm                                allnoconfig    gcc-16.2.0
arm                          bcm2835_defconfig    gcc-16.2.0
arm                           collie_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                       integrator_defconfig    gcc-16.2.0
arm                              mxs_defconfig    clang-24
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20261102    gcc-10.5.0
arm                   randconfig-1001-20261102    gcc-10.5.0
arm                   randconfig-1002-20261102    gcc-10.5.0
arm                   randconfig-1003-20261102    gcc-10.5.0
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261102    clang-24
arm64                 randconfig-1001-20261102    clang-24
arm64                 randconfig-1002-20261102    clang-24
arm64                 randconfig-1003-20261102    clang-24
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261102    clang-24
csky                  randconfig-1001-20261102    clang-24
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261102    clang-19
hexagon               randconfig-1001-20261102    clang-19
i386                               allnoconfig    gcc-16.2.0
i386        buildonly-randconfig-1000-20261102    clang-22
i386        buildonly-randconfig-1001-20261102    clang-22
i386        buildonly-randconfig-1002-20261102    clang-22
i386        buildonly-randconfig-1003-20261102    clang-22
i386        buildonly-randconfig-1004-20261102    clang-22
i386        buildonly-randconfig-1005-20261102    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261102    gcc-14
i386                  randconfig-1001-20261102    gcc-14
i386                  randconfig-1002-20261102    gcc-14
i386                  randconfig-1003-20261102    gcc-14
i386                  randconfig-1004-20261102    gcc-14
i386                  randconfig-1005-20261102    gcc-14
i386                  randconfig-1006-20261102    gcc-14
i386                  randconfig-1007-20261102    clang-22
i386                  randconfig-1008-20261102    clang-22
i386                  randconfig-1009-20261102    clang-22
i386                  randconfig-1010-20261102    clang-22
i386                  randconfig-1011-20261102    clang-22
i386                  randconfig-1012-20261102    clang-22
i386                  randconfig-1013-20261102    clang-22
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261102    clang-19
loongarch             randconfig-1001-20261102    clang-19
m68k                               allnoconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                               allnoconfig    gcc-16.2.0
mips                      cu1830-neo_defconfig    gcc-16.2.0
mips                      decstation_defconfig    clang-24
mips                      eyeq6lplus_defconfig    clang-24
mips                            ip22_defconfig    clang-24
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261102    clang-19
nios2                 randconfig-1001-20261102    clang-19
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261102    clang-17
parisc                randconfig-1001-20261102    clang-17
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    gcc-16.2.0
powerpc                  canyonlands_defconfig    clang-24
powerpc                    lite5200b_defconfig    gcc-16.2.0
powerpc                      mpc512x_defconfig    clang-24
powerpc               randconfig-1000-20261102    clang-17
powerpc               randconfig-1001-20261102    clang-17
powerpc64             randconfig-1000-20261102    clang-17
powerpc64             randconfig-1001-20261102    clang-17
riscv                              allnoconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261102    clang-21
riscv                 randconfig-1001-20261102    clang-21
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261102    clang-21
s390                  randconfig-1001-20261102    clang-21
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261102    clang-21
sh                    randconfig-1001-20261102    clang-21
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261102    gcc-15.3.0
sparc                 randconfig-1001-20261102    gcc-15.3.0
sparc                        sparc64_defconfig    clang-24
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261102    gcc-15.3.0
sparc64               randconfig-1001-20261102    gcc-15.3.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261102    gcc-15.3.0
um                    randconfig-1001-20261102    gcc-15.3.0
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261102    gcc-14
x86_64      buildonly-randconfig-1001-20261102    gcc-14
x86_64      buildonly-randconfig-1002-20261102    gcc-14
x86_64      buildonly-randconfig-1003-20261102    gcc-14
x86_64      buildonly-randconfig-1004-20261102    gcc-14
x86_64      buildonly-randconfig-1005-20261102    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261102    clang-22
x86_64                randconfig-1001-20261102    clang-22
x86_64                randconfig-1002-20261102    clang-22
x86_64                randconfig-1003-20261102    clang-22
x86_64                randconfig-1004-20261102    clang-22
x86_64                randconfig-1005-20261102    clang-22
x86_64                randconfig-1006-20261102    gcc-14
x86_64                randconfig-1007-20261102    gcc-14
x86_64                randconfig-1008-20261102    gcc-14
x86_64                randconfig-1009-20261102    gcc-14
x86_64                randconfig-1010-20261102    gcc-14
x86_64                randconfig-1011-20261102    gcc-14
x86_64                randconfig-1012-20261102    gcc-12
x86_64                randconfig-1013-20261102    gcc-12
x86_64                randconfig-1014-20261102    gcc-12
x86_64                randconfig-1015-20261102    gcc-12
x86_64                randconfig-1016-20261102    gcc-12
x86_64                randconfig-1017-20261102    gcc-12
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
xtensa                             allnoconfig    clang-24
xtensa                randconfig-1000-20261102    gcc-15.3.0
xtensa                randconfig-1001-20261102    gcc-15.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
