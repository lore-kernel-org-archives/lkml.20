Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A05140E5F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723168; cv=none; b=DCpYNDECNxub1MpL26mzDao7QgjUbOaBxckbPQhdKT94mNvORp4urq+bWYIeKA5YQPm+R4M8PLQCo+tZUk9oGJP+TVZUGZbAWLhOANLuTLLjGjyIz6dRm61PZuhbVkO8QX28VUazGPDUerops+JIKhF71arn4nIAVEl4UX8Xlmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723168; c=relaxed/simple;
	bh=R8hAAlegx6UffeP1Xf92VgD7Vi/juSqg/vMso1fU5kM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pnPtoK+SA3t2hxHRJpRfKiDMvaWMYtpGRYWDvwiRQUqKJPaqAdftZg8r7LCHLoxiio3JBbOwYmufs1juNbUJcrHLmZIcb0NUr0O6TXdkeUa+Onm4Gl1PxaMRtcI4D6LKGBnq/oHoxjSw7WfA1sgzcwIjP7M0RJBiNR1uq+4gywE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKnLiBq/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKnLiBq/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789723165; x=1821259165;
  h=date:from:to:cc:subject:message-id;
  bh=R8hAAlegx6UffeP1Xf92VgD7Vi/juSqg/vMso1fU5kM=;
  b=XKnLiBq//tox2yzbciBQLaJLalkyUS1Rxc+yEpU+e1WQVYzxj5ovdR7C
   acs8HXe1qsubZCCZXsmsTSjkF1trWjZ0+/aiez8dHE0KsEAc1jWP6jAB9
   tmB6EIojpy3cixD9PG154OV/YaL9nbnBTI/SV5fCoIqSLKmCUunB8ZdRf
   jPEC6s5xNopm94LoxCKxpCv32Vc+rFX5l+l9xDZkUOlckcaPKseYFw66l
   OdujEByaDoEzZc3rEnIdc5/e/2gnCBeyYKM+WkOatVjXdWl6mSHO+sJlt
   excuPvlkheoo6SowSgy/PaDXqSClxkQvpXggBdC0UfDUgbv2AmJV3y3+T
   A==;
X-CSE-ConnectionGUID: 7G3NvVg2QcO1gH4KUbFv0Q==
X-CSE-MsgGUID: cN/O4xp9TMKhsSpkf1Sfyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90082602"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90082602"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 02:19:23 -0700
X-CSE-ConnectionGUID: cOcfDiXNQQiEZAE3huPRkw==
X-CSE-MsgGUID: SdxKPgXfSniekMyLSCRSpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268050782"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Sep 2026 02:19:22 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7UkV-000000009VF-1MZo;
	Fri, 18 Sep 2026 09:19:15 +0000
Date: Fri, 18 Sep 2026 17:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 9d957098a0d4c4bda17534c491d1aa6083f4a780
Message-ID: <202609181737.YI39NDCV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 9d957098a0d4c4bda17534c491d1aa6083f4a780  Merge branch into tip/master: 'x86/tdx'

elapsed time: m

configs tested: 364
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2201-20260916    gcc-8.5.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260917    gcc-15.2.0
arc                   randconfig-1000-20260918    gcc-16.1.0
arc                   randconfig-1001-20260917    gcc-15.2.0
arc                   randconfig-1001-20260918    gcc-16.1.0
arc                  randconfig-r1300-20260918    gcc-14     sparse
arc                  randconfig-r1300-20260918    gcc-16.1.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                           gemini_defconfig    gcc-16.1.0
arm                           moxart_defconfig    gcc-16.1.0
arm                         mvebu_v5_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260917    gcc-15.2.0
arm                   randconfig-1000-20260918    gcc-16.1.0
arm                   randconfig-1001-20260917    gcc-15.2.0
arm                   randconfig-1001-20260918    gcc-16.1.0
arm                   randconfig-1002-20260917    gcc-15.2.0
arm                   randconfig-1002-20260918    gcc-16.1.0
arm                   randconfig-1003-20260917    gcc-15.2.0
arm                   randconfig-1003-20260918    gcc-16.1.0
arm                  randconfig-r1303-20260918    gcc-16.1.0 sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260917    gcc-11.5.0
arm64                 randconfig-1000-20260918    gcc-16.1.0
arm64                 randconfig-1001-20260917    gcc-11.5.0
arm64                 randconfig-1001-20260918    gcc-16.1.0
arm64                 randconfig-1002-20260917    gcc-11.5.0
arm64                 randconfig-1002-20260918    gcc-16.1.0
arm64                 randconfig-1003-20260917    gcc-11.5.0
arm64                 randconfig-1003-20260918    gcc-16.1.0
arm64                randconfig-r2103-20260916    gcc-10.5.0
arm64                randconfig-r2107-20260917    clang-24
arm64                randconfig-r2202-20260917    gcc-16.1.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260917    gcc-11.5.0
csky                  randconfig-1000-20260918    gcc-16.1.0
csky                  randconfig-1001-20260917    gcc-11.5.0
csky                  randconfig-1001-20260918    gcc-16.1.0
csky                 randconfig-r2106-20260916    gcc-10.5.0
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260917    clang-24
hexagon               randconfig-1000-20260918    gcc-16.1.0
hexagon               randconfig-1001-20260917    clang-24
hexagon               randconfig-1001-20260918    gcc-16.1.0
i386                              alldefconfig    gcc-16.1.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260917    gcc-13
i386        buildonly-randconfig-1000-20260918    gcc-14
i386        buildonly-randconfig-1001-20260917    gcc-13
i386        buildonly-randconfig-1001-20260918    gcc-14
i386        buildonly-randconfig-1002-20260917    gcc-13
i386        buildonly-randconfig-1002-20260918    gcc-14
i386        buildonly-randconfig-1003-20260917    gcc-13
i386        buildonly-randconfig-1003-20260918    gcc-14
i386        buildonly-randconfig-1004-20260917    gcc-13
i386        buildonly-randconfig-1004-20260918    gcc-14
i386        buildonly-randconfig-1005-20260917    gcc-13
i386        buildonly-randconfig-1005-20260918    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260917    clang-22
i386                  randconfig-1000-20260918    gcc-12
i386                  randconfig-1001-20260917    clang-22
i386                  randconfig-1001-20260918    gcc-12
i386                  randconfig-1002-20260917    clang-22
i386                  randconfig-1002-20260918    gcc-12
i386                  randconfig-1003-20260917    clang-22
i386                  randconfig-1003-20260918    gcc-12
i386                  randconfig-1004-20260917    clang-22
i386                  randconfig-1004-20260918    gcc-12
i386                  randconfig-1005-20260917    clang-22
i386                  randconfig-1005-20260918    gcc-12
i386                  randconfig-1006-20260917    clang-22
i386                  randconfig-1006-20260918    gcc-12
i386                  randconfig-1007-20260917    clang-22
i386                  randconfig-1007-20260918    clang-22
i386                  randconfig-1008-20260917    clang-22
i386                  randconfig-1008-20260918    clang-22
i386                  randconfig-1009-20260917    clang-22
i386                  randconfig-1009-20260918    clang-22
i386                  randconfig-1010-20260917    clang-22
i386                  randconfig-1010-20260918    clang-22
i386                  randconfig-1011-20260917    clang-22
i386                  randconfig-1011-20260918    clang-22
i386                  randconfig-1012-20260917    clang-22
i386                  randconfig-1012-20260918    clang-22
i386                  randconfig-1013-20260917    clang-22
i386                  randconfig-1013-20260918    clang-22
i386                  randconfig-1300-20260917    gcc-14     sparse
i386                  randconfig-1300-20260918    clang-22   sparse
i386                  randconfig-1301-20260917    gcc-14     sparse
i386                  randconfig-1301-20260918    clang-22   sparse
i386                  randconfig-1302-20260917    gcc-14     sparse
i386                  randconfig-1302-20260918    clang-22   sparse
i386                  randconfig-2100-20260917    gcc-14
i386                  randconfig-2101-20260916    gcc-14
i386                  randconfig-2101-20260917    gcc-14
i386                  randconfig-2102-20260917    gcc-14
i386                  randconfig-2103-20260917    gcc-14
i386                  randconfig-2200-20260917    clang-22
i386                 randconfig-r1301-20260918    gcc-14     sparse
i386                 randconfig-r2104-20260917    clang-24
i386                 randconfig-r2202-20260916    gcc-14
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260917    clang-24
loongarch             randconfig-1000-20260918    gcc-16.1.0
loongarch             randconfig-1001-20260917    clang-24
loongarch             randconfig-1001-20260918    gcc-16.1.0
loongarch            randconfig-r1302-20260918    gcc-14     sparse
loongarch            randconfig-r1308-20260918    gcc-8.5.0  sparse
loongarch            randconfig-r1309-20260918    gcc-11.5.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                          amcore_defconfig    gcc-16.1.0
m68k                          apollo_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                         m5272c3_defconfig    gcc-16.1.0
m68k                         mvme147_defconfig    gcc-16.1.0
m68k                 randconfig-r1309-20260918    gcc-8.5.0  sparse
m68k                 randconfig-r2104-20260916    gcc-11.5.0
m68k                 randconfig-r2201-20260917    gcc-13.4.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze                       mmu_defconfig    gcc-16.1.0
microblaze           randconfig-r1302-20260918    gcc-16.1.0 sparse
microblaze           randconfig-r1304-20260918    gcc-16.1.0 sparse
microblaze           randconfig-r1308-20260918    gcc-11.5.0 sparse
microblaze           randconfig-r2102-20260917    gcc-10.5.0
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ci20_defconfig    gcc-16.1.0
mips                 randconfig-r1307-20260918    gcc-11.5.0 sparse
mips                 randconfig-r2103-20260917    gcc-10.5.0
mips                 randconfig-r2107-20260916    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260917    clang-24
nios2                 randconfig-1000-20260918    gcc-16.1.0
nios2                 randconfig-1001-20260917    clang-24
nios2                 randconfig-1001-20260918    gcc-16.1.0
nios2                randconfig-r1306-20260918    gcc-11.5.0 sparse
nios2                randconfig-r2101-20260917    gcc-10.5.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc                   or1klitex_defconfig    gcc-16.1.0
openrisc                     or1ksim_defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260917    gcc-11.5.0
parisc                randconfig-1000-20260918    gcc-8.5.0
parisc                randconfig-1001-20260917    gcc-11.5.0
parisc                randconfig-1001-20260918    gcc-8.5.0
parisc               randconfig-r1305-20260918    gcc-16.1.0 sparse
parisc               randconfig-r1306-20260917    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       ep88xc_defconfig    gcc-16.1.0
powerpc                      kmeter1_defconfig    gcc-16.1.0
powerpc                      mpc5200_defconfig    gcc-16.1.0
powerpc                        ppc64_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260917    gcc-11.5.0
powerpc               randconfig-1000-20260918    gcc-8.5.0
powerpc               randconfig-1001-20260917    gcc-11.5.0
powerpc               randconfig-1001-20260918    gcc-8.5.0
powerpc                   storcenter_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260917    gcc-11.5.0
powerpc64             randconfig-1000-20260918    gcc-8.5.0
powerpc64             randconfig-1001-20260917    gcc-11.5.0
powerpc64             randconfig-1001-20260918    gcc-8.5.0
powerpc64            randconfig-r1304-20260918    gcc-14     sparse
powerpc64            randconfig-r2100-20260916    clang-22
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260917    clang-17
riscv                 randconfig-1000-20260918    clang-24
riscv                 randconfig-1001-20260917    clang-17
riscv                 randconfig-1001-20260918    clang-24
riscv                 randconfig-2000-20260917    gcc-14.3.0
riscv                 randconfig-2001-20260917    gcc-14.3.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260917    clang-17
s390                  randconfig-1000-20260918    clang-24
s390                  randconfig-1001-20260917    clang-17
s390                  randconfig-1001-20260918    clang-24
s390                  randconfig-2000-20260917    gcc-14.3.0
s390                  randconfig-2001-20260917    gcc-14.3.0
s390                 randconfig-r2106-20260917    clang-24
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20260917    clang-17
sh                    randconfig-1000-20260918    clang-24
sh                    randconfig-1001-20260917    clang-17
sh                    randconfig-1001-20260918    clang-24
sh                    randconfig-2000-20260917    gcc-14.3.0
sh                    randconfig-2001-20260917    gcc-14.3.0
sh                   randconfig-r1307-20260918    gcc-8.5.0  sparse
sh                           rsk7269_defconfig    gcc-16.1.0
sh                      sh7710voipgw_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260917    clang-17
sparc                 randconfig-1000-20260918    gcc-14
sparc                 randconfig-1001-20260917    clang-17
sparc                 randconfig-1001-20260918    gcc-14
sparc                 randconfig-2000-20260917    clang-17
sparc                 randconfig-2001-20260917    clang-17
sparc                randconfig-r1306-20260918    gcc-8.5.0  sparse
sparc                randconfig-r1308-20260917    gcc-8.5.0  sparse
sparc                randconfig-r2102-20260916    gcc-8.5.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260917    clang-17
sparc64               randconfig-1000-20260918    gcc-14
sparc64               randconfig-1001-20260917    clang-17
sparc64               randconfig-1001-20260918    gcc-14
sparc64               randconfig-2000-20260917    clang-17
sparc64               randconfig-2001-20260917    clang-17
sparc64              randconfig-r1301-20260918    gcc-16.1.0 sparse
sparc64              randconfig-r1305-20260918    gcc-14     sparse
sparc64              randconfig-r1309-20260917    gcc-8.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260917    clang-17
um                    randconfig-1000-20260918    gcc-14
um                    randconfig-1001-20260917    clang-17
um                    randconfig-1001-20260918    gcc-14
um                    randconfig-2000-20260917    clang-17
um                    randconfig-2001-20260917    clang-17
um                   randconfig-r2200-20260916    clang-24
um                   randconfig-r2200-20260917    clang-24
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260917    gcc-14
x86_64      buildonly-randconfig-1000-20260918    clang-22
x86_64      buildonly-randconfig-1001-20260917    gcc-14
x86_64      buildonly-randconfig-1001-20260918    clang-22
x86_64      buildonly-randconfig-1002-20260917    gcc-14
x86_64      buildonly-randconfig-1002-20260918    clang-22
x86_64      buildonly-randconfig-1003-20260917    gcc-14
x86_64      buildonly-randconfig-1003-20260918    clang-22
x86_64      buildonly-randconfig-1004-20260917    gcc-14
x86_64      buildonly-randconfig-1004-20260918    clang-22
x86_64      buildonly-randconfig-1005-20260917    gcc-14
x86_64      buildonly-randconfig-1005-20260918    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260917    clang-22
x86_64                randconfig-1000-20260918    clang-22
x86_64                randconfig-1001-20260917    clang-22
x86_64                randconfig-1001-20260918    clang-22
x86_64                randconfig-1002-20260917    clang-22
x86_64                randconfig-1002-20260918    clang-22
x86_64                randconfig-1003-20260917    clang-22
x86_64                randconfig-1003-20260918    clang-22
x86_64                randconfig-1004-20260917    clang-22
x86_64                randconfig-1004-20260918    clang-22
x86_64                randconfig-1005-20260917    clang-22
x86_64                randconfig-1005-20260918    clang-22
x86_64                randconfig-1006-20260917    clang-22
x86_64                randconfig-1006-20260918    gcc-14
x86_64                randconfig-1007-20260917    clang-22
x86_64                randconfig-1007-20260918    gcc-14
x86_64                randconfig-1008-20260917    clang-22
x86_64                randconfig-1008-20260918    gcc-14
x86_64                randconfig-1009-20260917    clang-22
x86_64                randconfig-1009-20260918    gcc-14
x86_64                randconfig-1010-20260917    clang-22
x86_64                randconfig-1010-20260918    gcc-14
x86_64                randconfig-1011-20260917    clang-22
x86_64                randconfig-1011-20260918    gcc-14
x86_64                randconfig-1012-20260917    clang-22
x86_64                randconfig-1012-20260918    clang-22
x86_64                randconfig-1013-20260917    clang-22
x86_64                randconfig-1013-20260918    clang-22
x86_64                randconfig-1014-20260917    clang-22
x86_64                randconfig-1014-20260918    clang-22
x86_64                randconfig-1015-20260917    clang-22
x86_64                randconfig-1015-20260918    clang-22
x86_64                randconfig-1016-20260917    clang-22
x86_64                randconfig-1016-20260918    clang-22
x86_64                randconfig-1017-20260917    clang-22
x86_64                randconfig-1017-20260918    clang-22
x86_64                randconfig-1300-20260917    gcc-14     sparse
x86_64                randconfig-1300-20260918    clang-22   sparse
x86_64                randconfig-1301-20260917    gcc-14     sparse
x86_64                randconfig-1301-20260918    clang-22   sparse
x86_64                randconfig-1302-20260917    gcc-14     sparse
x86_64                randconfig-1302-20260918    clang-22   sparse
x86_64                randconfig-2100-20260916    gcc-14
x86_64                randconfig-2100-20260917    gcc-13
x86_64                randconfig-2101-20260916    clang-22
x86_64                randconfig-2101-20260917    gcc-13
x86_64                randconfig-2102-20260916    gcc-14
x86_64                randconfig-2102-20260917    gcc-13
x86_64                randconfig-2103-20260916    clang-22
x86_64                randconfig-2103-20260917    gcc-13
x86_64                randconfig-2200-20260916    clang-22
x86_64                randconfig-2200-20260917    gcc-14
x86_64               randconfig-r1303-20260918    gcc-14     sparse
x86_64               randconfig-r2105-20260917    clang-24
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
xtensa                            alldefconfig    gcc-16.1.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                 generic_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-1000-20260917    clang-17
xtensa                randconfig-1000-20260918    gcc-14
xtensa                randconfig-1001-20260917    clang-17
xtensa                randconfig-1001-20260918    gcc-14
xtensa                randconfig-2000-20260917    clang-17
xtensa                randconfig-2001-20260917    clang-17
xtensa               randconfig-r1307-20260917    gcc-8.5.0  sparse
xtensa               randconfig-r2100-20260917    gcc-10.5.0
xtensa               randconfig-r2101-20260916    gcc-10.5.0
xtensa               randconfig-r2105-20260916    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
