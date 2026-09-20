Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1FA349AE0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789869576; cv=none; b=uA5QKmGaJAhRKEFdBLxeM5cfrm15BCtRM3/WeGhIVx2Yi11xB6jVXpyrF/DThnSMHaSQZhIL24+NWGBFoLdHuckntsDdxElpBR/slyfMOC0Ta2n9daIidY9sF4W/g/LTKwC1aeOtt6Zp8e/1BqKwf01xLCz3QnzwG0/IzWsb/bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789869576; c=relaxed/simple;
	bh=hf57nU2IKLNYT2iWd4N6whKu1w+R/cX/2kHTursD6Ng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=toAOzDSEb0uht8jPRMGSIIEZ01jF4xeRMx2fjL0G3Zg1WNNLF+X0EIZvpmlU3hK8Go0h/4z5j+pD92ptJQ79QbskN7GRwxRyqDAndAV+agbqPhc0lESriwdU689/wcn45L2sTvdGKV2VQWgXUg2n7fp8vx+tUvzQynWJJKgt5rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtpoV/fa; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtpoV/fa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789869574; x=1821405574;
  h=date:from:to:cc:subject:message-id;
  bh=hf57nU2IKLNYT2iWd4N6whKu1w+R/cX/2kHTursD6Ng=;
  b=XtpoV/famKDOzbwiKJvws35CEiLnz/vt5cJOfanGBc1VslU4t89pTLUL
   zymhiI3ApiB1FQW1S/5wKw/uY4zZKeqdZWmXx0U7Nobx+hkLNDOcvan3q
   jCscW+7iijnDh+TPBGRZrSuXgcSUL9+JwCA/1RRdoMEZ6QDiePELCZVev
   f/Uxhr9v7nO1d+oCMnov1P+MK6l8V0VxRKMXDUTkU9tATJdDLwzMAdA+k
   J7dBGfLq3DdKnb3uRQbBTtSRrwjRtSDUhOqJAURM+3G33ATuIzVw062kn
   6cvxIQeHHBOXyyeDAi6a79Sm8TYvYC5R1rUqQjopATdD4SldfPuOz9W5v
   Q==;
X-CSE-ConnectionGUID: Sr4vcxVVSYCR5XBChCCLUQ==
X-CSE-MsgGUID: LleW7Vy9QGGcxRJMaRrnXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="89309178"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="89309178"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 18:59:33 -0700
X-CSE-ConnectionGUID: 7CUouOUCR2qCNEpvUu/MdA==
X-CSE-MsgGUID: szFQNtwFTmWFWXdbN0xmFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="280173282"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Sep 2026 18:59:32 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x86q1-00000000Bhz-2XRf;
	Sun, 20 Sep 2026 01:59:29 +0000
Date: Sun, 20 Sep 2026 09:59:01 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:platform] BUILD SUCCESS
 fc21598c6477874a7c5451863a10ef63f49ec1e2
Message-ID: <202609200957.4AvI6ba9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/platform
branch HEAD: fc21598c6477874a7c5451863a10ef63f49ec1e2  x86/platform: Remove Technology Systems 5500 board

elapsed time: 655m

configs tested: 186
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r1300-20260920    gcc-10.5.0 sparse
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260920    gcc-8.5.0
arc                   randconfig-1001-20260920    gcc-8.5.0
arm                                allnoconfig    clang-17
arm                               allyesconfig    gcc-16.1.0
arm                          bcm2835_defconfig    clang-17
arm                                  defconfig    clang-24
arm                            h3600_defconfig    gcc-16.1.0
arm                            imxrt_defconfig    clang-24
arm                   randconfig-1000-20260920    gcc-10.5.0
arm                   randconfig-1001-20260920    gcc-12.5.0
arm                   randconfig-1002-20260920    clang-20
arm                   randconfig-1003-20260920    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260920    gcc-15.2.0
arm64                 randconfig-1001-20260920    clang-24
arm64                 randconfig-1002-20260920    gcc-8.5.0
arm64                 randconfig-1003-20260920    clang-24
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260920    gcc-12.5.0
csky                  randconfig-1001-20260920    gcc-14.3.0
csky                 randconfig-r1304-20260920    gcc-15.2.0 sparse
hexagon                           allmodconfig    clang-24
hexagon                            allnoconfig    clang-24
hexagon                              defconfig    clang-24
hexagon               randconfig-1000-20260919    clang-17
hexagon               randconfig-1001-20260919    clang-18
hexagon              randconfig-r1306-20260920    clang-24   sparse
i386                              allmodconfig    gcc-14
i386                               allnoconfig    gcc-14
i386                              allyesconfig    gcc-14
i386        buildonly-randconfig-1000-20260920    clang-22
i386        buildonly-randconfig-1001-20260920    clang-22
i386        buildonly-randconfig-1002-20260920    clang-22
i386        buildonly-randconfig-1003-20260920    gcc-14
i386        buildonly-randconfig-1004-20260920    clang-22
i386        buildonly-randconfig-1005-20260920    clang-22
i386                                 defconfig    clang-22
i386                  randconfig-1000-20260920    clang-22
i386                  randconfig-1001-20260920    gcc-14
i386                  randconfig-1002-20260920    gcc-14
i386                  randconfig-1003-20260920    clang-22
i386                  randconfig-1004-20260920    gcc-14
i386                  randconfig-1005-20260920    gcc-14
i386                  randconfig-1006-20260920    clang-22
i386                  randconfig-1007-20260919    clang-22
i386                  randconfig-1007-20260920    gcc-12
i386                  randconfig-1008-20260919    clang-22
i386                  randconfig-1008-20260920    gcc-14
i386                  randconfig-1009-20260919    gcc-14
i386                  randconfig-1009-20260920    clang-22
i386                  randconfig-1010-20260919    clang-22
i386                  randconfig-1010-20260920    clang-22
i386                  randconfig-1011-20260920    gcc-14
i386                  randconfig-1012-20260919    gcc-14
i386                  randconfig-1012-20260920    gcc-14
i386                  randconfig-1013-20260919    gcc-14
i386                  randconfig-1013-20260920    clang-22
i386                  randconfig-1300-20260920    clang-22   sparse
loongarch                         allmodconfig    clang-19
loongarch                          allnoconfig    clang-20
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260919    clang-24
loongarch             randconfig-1001-20260919    clang-18
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                          amcore_defconfig    gcc-16.1.0
m68k                                 defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    gcc-16.1.0
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                       bmips_stb_defconfig    clang-17
mips                   maltasmvp_eva_defconfig    gcc-16.1.0
mips                            mtx1_defconfig    clang-19
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    gcc-11.5.0
nios2                                defconfig    gcc-11.5.0
nios2                 randconfig-1000-20260919    gcc-8.5.0
nios2                 randconfig-1001-20260919    gcc-11.5.0
openrisc                          alldefconfig    gcc-16.1.0
openrisc                          allmodconfig    gcc-16.1.0
openrisc                           allnoconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r1303-20260920    gcc-16.1.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    gcc-16.1.0
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260920    gcc-14.3.0
parisc                randconfig-1001-20260920    gcc-8.5.0
parisc               randconfig-r1301-20260920    gcc-9.5.0  sparse
parisc               randconfig-r1307-20260920    gcc-13.4.0 sparse
parisc64                             defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    gcc-16.1.0
powerpc                       ep88xc_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260920    gcc-8.5.0
powerpc               randconfig-1001-20260920    clang-24
powerpc64             randconfig-1000-20260920    clang-24
powerpc64             randconfig-1001-20260920    clang-22
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    gcc-16.1.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-24
riscv                 randconfig-1000-20260919    clang-24
riscv                 randconfig-1000-20260920    gcc-13.4.0
riscv                 randconfig-1001-20260919    clang-17
riscv                 randconfig-1001-20260920    gcc-15.2.0
s390                              allmodconfig    clang-24
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    clang-18
s390                  randconfig-1000-20260919    clang-24
s390                  randconfig-1000-20260920    gcc-8.5.0
s390                  randconfig-1001-20260920    clang-20
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    gcc-16.1.0
sh                                allyesconfig    gcc-16.1.0
sh                                   defconfig    gcc-16.1.0
sh                           r7780mp_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260919    gcc-15.2.0
sh                    randconfig-1000-20260920    gcc-16.1.0
sh                    randconfig-1001-20260919    gcc-9.5.0
sh                    randconfig-1001-20260920    gcc-10.5.0
sh                   randconfig-r1309-20260920    gcc-12.5.0 sparse
sparc                              allnoconfig    gcc-16.1.0
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260919    gcc-11.5.0
sparc                 randconfig-1001-20260919    gcc-16.1.0
sparc                randconfig-r1302-20260920    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    clang-24
sparc64               randconfig-1000-20260919    clang-20
sparc64               randconfig-1001-20260919    clang-22
sparc64              randconfig-r1305-20260920    gcc-13.4.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-17
um                                allyesconfig    gcc-14
um                                   defconfig    clang-24
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260919    clang-24
um                    randconfig-1001-20260919    gcc-12
um                   randconfig-r1308-20260920    clang-24   sparse
um                            x86_64_defconfig    clang-24
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-22
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260920    gcc-14
x86_64      buildonly-randconfig-1001-20260920    gcc-14
x86_64      buildonly-randconfig-1002-20260920    gcc-14
x86_64      buildonly-randconfig-1003-20260920    clang-22
x86_64      buildonly-randconfig-1004-20260920    clang-22
x86_64      buildonly-randconfig-1005-20260920    gcc-14
x86_64                               defconfig    gcc-14
x86_64                randconfig-1006-20260920    gcc-14
x86_64                randconfig-1007-20260920    gcc-14
x86_64                randconfig-1010-20260920    gcc-14
x86_64                randconfig-1011-20260920    gcc-14
x86_64                randconfig-1012-20260919    gcc-14
x86_64                randconfig-1012-20260920    clang-22
x86_64                randconfig-1013-20260919    gcc-14
x86_64                randconfig-1013-20260920    gcc-14
x86_64                randconfig-1014-20260920    gcc-14
x86_64                randconfig-1015-20260920    clang-22
x86_64                randconfig-1016-20260920    clang-22
x86_64                randconfig-1017-20260920    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    gcc-16.1.0
xtensa                            allyesconfig    gcc-16.1.0
xtensa                randconfig-1000-20260919    gcc-13.4.0
xtensa                randconfig-1001-20260919    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
