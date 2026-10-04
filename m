Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC5A31B10B
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 23:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791155204; cv=none; b=tB6faE4LACJg9pMJnYimDAZqvpuz3sGBWbQiKtJbIE+o1HroMptiojjpdtjrsW/F5rGJNp4S9izO3rZk4pzRzwIB3aPxVXeTNmrXoiKVNqGE+WqiWzRWaa7DhKW6EPzxWHGvLzJ9eWDL1Ey/ANiCyEkpD/8rYvmUtTrUlWOuMag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791155204; c=relaxed/simple;
	bh=ZwwLW/hSu+cpxA0AOSpaT3hE1naYs/OsqV0gORiNBWQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kDgJH9nRfk6U70iRixp0Ut09GABtlFuwBa6M04MCpnr8Z99SwRnHrko4lXdeReh+uTtUylzs9KF5TsCD3iBiFD3Uc+qEwDeDNBwtVaQ11nUn+VThHuviuNjBsMueXmllYRjUeo0LvU5XLzb09yrEPt1Y5tub9C7yjnnXzfEZCP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4rxwE63; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4rxwE63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791155202; x=1822691202;
  h=date:from:to:cc:subject:message-id;
  bh=ZwwLW/hSu+cpxA0AOSpaT3hE1naYs/OsqV0gORiNBWQ=;
  b=T4rxwE63SNc0UWu5RxfnuNkQMotCrAjEX0s3UCSSMVVNBWzFaJXjRUrs
   0KbWWAmPYi0bob9MtnF6FrzWaLXhZ+VtM9+zhNDrtjlcf3SauPTEyXZX3
   lJrwroH2xVZKBd45kehvyKQmXb3PPnP7emU5x5XnXSpRhEX/FlVh8jzVa
   AvG4bM1EwfXe4NrHMzgn8k35dzC+6GeUrmYoZBHwGdU4yJ5vf15+JTPVm
   jl8n3K+h+vxG01Khb0+Km56y3Wo1ufP1lTiS25tIEZ3iEFk9bAZd8asST
   e0A4QewsPKenpnNU5QhZNDUamh7WrNM4K8MkbrPPPcmEaHzhoEcg2frLm
   Q==;
X-CSE-ConnectionGUID: 090DX5aiSzmsCGY8NTzESA==
X-CSE-MsgGUID: 0ToYTT6bSROHoSJrBLAHCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="101152073"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="101152073"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 16:06:42 -0700
X-CSE-ConnectionGUID: 7/oX86oLRzSSdC8UXGmb6A==
X-CSE-MsgGUID: Tr518mbKSR+c2JNxHpwS8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="275315811"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Oct 2026 16:06:40 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDVHx-00000000V8d-3BVS;
	Sun, 04 Oct 2026 23:06:37 +0000
Date: Mon, 05 Oct 2026 07:05:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2026.09.30a] BUILD SUCCESS
 d0523e9834b34e9e8093e95dfa2606a6aa8b7403
Message-ID: <202610050734.UTS0T2FC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.09.30a
branch HEAD: d0523e9834b34e9e8093e95dfa2606a6aa8b7403  doc: Document additional RCU task-stall dump information

elapsed time: 2496m

configs tested: 338
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2305-20261002    gcc-16.1.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261004    clang-22
arc                   randconfig-1000-20261005    gcc-8.5.0
arc                   randconfig-1001-20261004    clang-22
arc                   randconfig-1001-20261005    gcc-8.5.0
arc                  randconfig-r2103-20261003    gcc-11.5.0 cocci
arc                  randconfig-r2301-20261003    gcc-14     sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    clang-21
arm                                  defconfig    gcc-16.1.0
arm                          orion5x_defconfig    clang-21
arm                   randconfig-1000-20261004    clang-22
arm                   randconfig-1000-20261005    gcc-8.5.0
arm                   randconfig-1001-20261004    clang-22
arm                   randconfig-1001-20261005    gcc-8.5.0
arm                   randconfig-1002-20261004    clang-22
arm                   randconfig-1002-20261005    gcc-8.5.0
arm                   randconfig-1003-20261004    clang-22
arm                   randconfig-1003-20261005    gcc-8.5.0
arm                  randconfig-r2101-20261002    gcc-8.5.0  cocci
arm                  randconfig-r2104-20261002    clang-21   cocci
arm                  randconfig-r2104-20261003    gcc-15.2.0 cocci
arm                  randconfig-r2106-20261002    clang-17   cocci
arm                  randconfig-r2200-20261002    gcc-8.5.0  smatch
arm                  randconfig-r2202-20261002    clang-24   smatch
arm                  randconfig-r2300-20261002    gcc-12.5.0 sparse
arm                  randconfig-r2306-20261002    gcc-16.1.0 sparse
arm                  randconfig-r2307-20261002    gcc-8.5.0  sparse
arm                          s3c6400_defconfig    clang-21
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261004    gcc-16.1.0
arm64                 randconfig-1001-20261004    gcc-16.1.0
arm64                 randconfig-1002-20261004    gcc-16.1.0
arm64                 randconfig-1003-20261004    gcc-16.1.0
arm64                randconfig-r2104-20261002    clang-17   cocci
arm64                randconfig-r2200-20261003    gcc-16.1.0 smatch
arm64                randconfig-r2201-20261002    gcc-15.2.0 smatch
arm64                randconfig-r2308-20261002    gcc-8.5.0  sparse
arm64                randconfig-r2309-20261002    gcc-16.1.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261004    gcc-16.1.0
csky                  randconfig-1001-20261004    gcc-16.1.0
csky                 randconfig-r2106-20261003    gcc-15.2.0 cocci
csky                 randconfig-r2201-20261002    gcc-9.5.0  smatch
hexagon                           alldefconfig    clang-21
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261004    gcc-16.1.0
hexagon               randconfig-1001-20261004    gcc-16.1.0
hexagon              randconfig-r2100-20261003    gcc-11.5.0 cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261004    clang-22
i386        buildonly-randconfig-1001-20261004    clang-22
i386        buildonly-randconfig-1002-20261004    clang-22
i386        buildonly-randconfig-1003-20261004    clang-22
i386        buildonly-randconfig-1004-20261004    clang-22
i386        buildonly-randconfig-1005-20261004    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261004    gcc-14
i386                  randconfig-1001-20261004    gcc-14
i386                  randconfig-1002-20261004    gcc-14
i386                  randconfig-1003-20261004    gcc-14
i386                  randconfig-1004-20261004    gcc-14
i386                  randconfig-1005-20261004    gcc-14
i386                  randconfig-1006-20261004    gcc-14
i386                  randconfig-1007-20261004    clang-22
i386                  randconfig-1008-20261004    clang-22
i386                  randconfig-1009-20261004    clang-22
i386                  randconfig-1010-20261004    clang-22
i386                  randconfig-1011-20261004    clang-22
i386                  randconfig-1012-20261004    clang-22
i386                  randconfig-1013-20261004    clang-22
i386                  randconfig-2100-20261002    gcc-14     cocci
i386                  randconfig-2100-20261003    gcc-14     cocci
i386                  randconfig-2101-20261002    gcc-14     cocci
i386                  randconfig-2101-20261003    gcc-14     cocci
i386                  randconfig-2102-20261002    gcc-14     cocci
i386                  randconfig-2102-20261003    gcc-14     cocci
i386                  randconfig-2103-20261002    gcc-14     cocci
i386                  randconfig-2103-20261003    gcc-14     cocci
i386                  randconfig-2200-20261002    gcc-14     smatch
i386                  randconfig-2300-20261002    gcc-12     sparse
i386                  randconfig-2300-20261003    clang-22   sparse
i386                  randconfig-2300-20261004    clang-22   sparse
i386                  randconfig-2301-20261002    gcc-12     sparse
i386                  randconfig-2301-20261003    clang-22   sparse
i386                  randconfig-2301-20261004    clang-22   sparse
i386                  randconfig-2302-20261002    gcc-12     sparse
i386                  randconfig-2302-20261003    clang-22   sparse
i386                  randconfig-2302-20261004    clang-22   sparse
i386                 randconfig-r2308-20261002    gcc-12.5.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261004    gcc-16.1.0
loongarch             randconfig-1001-20261004    gcc-16.1.0
loongarch            randconfig-r2303-20261002    gcc-12.5.0 sparse
loongarch            randconfig-r2307-20261003    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                 randconfig-r2100-20261002    gcc-16.1.0 cocci
m68k                 randconfig-r2302-20261002    gcc-16.1.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2102-20261002    clang-22   cocci
microblaze           randconfig-r2102-20261002    gcc-8.5.0  cocci
microblaze           randconfig-r2200-20261002    gcc-8.5.0  smatch
microblaze           randconfig-r2202-20261002    gcc-8.5.0  smatch
microblaze           randconfig-r2303-20261002    gcc-16.1.0 sparse
microblaze           randconfig-r2306-20261002    gcc-12.5.0 sparse
microblaze           randconfig-r2307-20261002    gcc-16.1.0 sparse
microblaze           randconfig-r2309-20261002    gcc-8.5.0  sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                 randconfig-r2104-20261002    clang-17   cocci
mips                 randconfig-r2105-20261002    clang-17   cocci
mips                 randconfig-r2201-20261002    gcc-15.2.0 smatch
mips                 randconfig-r2300-20261002    gcc-11.5.0 sparse
mips                 randconfig-r2300-20261003    gcc-14     sparse
mips                 randconfig-r2303-20261002    gcc-11.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261004    gcc-16.1.0
nios2                 randconfig-1001-20261004    gcc-16.1.0
nios2                randconfig-r2105-20261002    clang-17   cocci
nios2                randconfig-r2302-20261002    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2105-20261002    clang-21   cocci
openrisc             randconfig-r2200-20261002    gcc-9.5.0  smatch
openrisc             randconfig-r2305-20261002    gcc-11.5.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261004    gcc-12.5.0
parisc                randconfig-1001-20261004    gcc-12.5.0
parisc               randconfig-r2100-20261002    gcc-8.5.0  cocci
parisc               randconfig-r2304-20261002    gcc-16.1.0 sparse
parisc               randconfig-r2306-20261002    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                      mpc512x_defconfig    clang-21
powerpc               randconfig-1000-20261004    gcc-12.5.0
powerpc               randconfig-1001-20261004    gcc-12.5.0
powerpc              randconfig-r2106-20261002    clang-17   cocci
powerpc              randconfig-r2107-20261002    clang-17   cocci
powerpc64             randconfig-1000-20261004    gcc-12.5.0
powerpc64             randconfig-1001-20261004    gcc-12.5.0
powerpc64            randconfig-r2100-20261002    clang-22   cocci
powerpc64            randconfig-r2102-20261002    gcc-16.1.0 cocci
powerpc64            randconfig-r2302-20261003    gcc-14     sparse
powerpc64            randconfig-r2309-20261003    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261004    gcc-11.5.0
riscv                 randconfig-1000-20261005    clang-17
riscv                 randconfig-1001-20261004    gcc-11.5.0
riscv                 randconfig-1001-20261005    clang-17
riscv                 randconfig-2000-20261002    gcc-9.5.0
riscv                 randconfig-2000-20261003    gcc-16.1.0
riscv                 randconfig-2001-20261002    gcc-9.5.0
riscv                 randconfig-2001-20261003    gcc-16.1.0
riscv                randconfig-r2102-20261003    gcc-11.5.0 cocci
riscv                randconfig-r2103-20261002    clang-22   cocci
riscv                randconfig-r2300-20261002    gcc-16.1.0 sparse
riscv                randconfig-r2309-20261002    gcc-12.5.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261004    gcc-11.5.0
s390                  randconfig-1000-20261005    clang-17
s390                  randconfig-1001-20261004    gcc-11.5.0
s390                  randconfig-1001-20261005    clang-17
s390                  randconfig-2000-20261002    gcc-9.5.0
s390                  randconfig-2000-20261003    gcc-16.1.0
s390                  randconfig-2001-20261002    gcc-9.5.0
s390                  randconfig-2001-20261003    gcc-16.1.0
s390                 randconfig-r2101-20261002    clang-22   cocci
s390                 randconfig-r2101-20261002    gcc-16.1.0 cocci
s390                 randconfig-r2103-20261002    gcc-16.1.0 cocci
s390                 randconfig-r2302-20261002    gcc-12.5.0 sparse
s390                 randconfig-r2305-20261003    gcc-14     sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                                j2_defconfig    clang-21
sh                    randconfig-1000-20261004    gcc-11.5.0
sh                    randconfig-1000-20261005    clang-17
sh                    randconfig-1001-20261004    gcc-11.5.0
sh                    randconfig-1001-20261005    clang-17
sh                    randconfig-2000-20261002    gcc-9.5.0
sh                    randconfig-2000-20261003    gcc-16.1.0
sh                    randconfig-2001-20261002    gcc-9.5.0
sh                    randconfig-2001-20261003    gcc-16.1.0
sh                   randconfig-r2107-20261002    clang-17   cocci
sh                   randconfig-r2301-20261002    gcc-12.5.0 sparse
sh                   randconfig-r2306-20261003    clang-24   sparse
sh                   randconfig-r2307-20261002    gcc-12.5.0 sparse
sh                           sdk7786_defconfig    clang-21
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261004    gcc-14
sparc                 randconfig-1001-20261004    gcc-14
sparc                 randconfig-2000-20261002    clang-24
sparc                 randconfig-2000-20261003    gcc-14
sparc                 randconfig-2001-20261002    clang-24
sparc                 randconfig-2001-20261003    gcc-14
sparc                randconfig-r2101-20261003    gcc-11.5.0 cocci
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261004    gcc-14
sparc64               randconfig-1001-20261004    gcc-14
sparc64               randconfig-2000-20261002    clang-24
sparc64               randconfig-2000-20261003    gcc-14
sparc64               randconfig-2001-20261002    clang-24
sparc64               randconfig-2001-20261003    gcc-14
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261004    gcc-14
um                    randconfig-1001-20261004    gcc-14
um                    randconfig-2000-20261002    clang-24
um                    randconfig-2000-20261003    gcc-14
um                    randconfig-2001-20261002    clang-24
um                    randconfig-2001-20261003    gcc-14
um                   randconfig-r2103-20261002    gcc-8.5.0  cocci
um                   randconfig-r2107-20261002    clang-21   cocci
um                   randconfig-r2304-20261002    gcc-11.5.0 sparse
um                   randconfig-r2304-20261002    gcc-12.5.0 sparse
um                   randconfig-r2304-20261003    gcc-14     sparse
um                   randconfig-r2305-20261002    gcc-12.5.0 sparse
um                   randconfig-r2308-20261002    gcc-16.1.0 sparse
um                   randconfig-r2308-20261003    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261004    gcc-14
x86_64      buildonly-randconfig-1001-20261004    gcc-14
x86_64      buildonly-randconfig-1002-20261004    gcc-14
x86_64      buildonly-randconfig-1003-20261004    gcc-14
x86_64      buildonly-randconfig-1004-20261004    gcc-14
x86_64      buildonly-randconfig-1005-20261004    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261004    gcc-14
x86_64                randconfig-1001-20261004    gcc-14
x86_64                randconfig-1002-20261004    gcc-14
x86_64                randconfig-1003-20261004    gcc-14
x86_64                randconfig-1004-20261004    gcc-14
x86_64                randconfig-1005-20261004    gcc-14
x86_64                randconfig-1006-20261004    clang-22
x86_64                randconfig-1007-20261004    clang-22
x86_64                randconfig-1008-20261004    clang-22
x86_64                randconfig-1009-20261004    clang-22
x86_64                randconfig-1010-20261004    clang-22
x86_64                randconfig-1011-20261004    clang-22
x86_64                randconfig-1012-20261004    gcc-13
x86_64                randconfig-1013-20261004    gcc-13
x86_64                randconfig-1014-20261004    gcc-13
x86_64                randconfig-1015-20261004    gcc-13
x86_64                randconfig-1016-20261004    gcc-13
x86_64                randconfig-1017-20261004    gcc-13
x86_64                randconfig-2100-20261002    gcc-14     cocci
x86_64                randconfig-2100-20261003    clang-22   cocci
x86_64                randconfig-2101-20261002    gcc-14     cocci
x86_64                randconfig-2101-20261003    clang-22   cocci
x86_64                randconfig-2102-20261002    gcc-14     cocci
x86_64                randconfig-2102-20261003    clang-22   cocci
x86_64                randconfig-2103-20261002    gcc-14     cocci
x86_64                randconfig-2103-20261003    clang-22   cocci
x86_64                randconfig-2200-20261002    clang-22   smatch
x86_64                randconfig-2200-20261003    gcc-14     smatch
x86_64                randconfig-2300-20261002    gcc-12     sparse
x86_64                randconfig-2300-20261003    clang-22   sparse
x86_64                randconfig-2300-20261004    clang-22   sparse
x86_64                randconfig-2301-20261002    gcc-12     sparse
x86_64                randconfig-2301-20261003    clang-22   sparse
x86_64                randconfig-2301-20261004    clang-22   sparse
x86_64                randconfig-2302-20261002    gcc-12     sparse
x86_64                randconfig-2302-20261003    clang-22   sparse
x86_64                randconfig-2302-20261004    clang-22   sparse
x86_64               randconfig-r2106-20261002    clang-21   cocci
x86_64               randconfig-r2201-20261003    clang-22   smatch
x86_64               randconfig-r2301-20261002    gcc-11.5.0 sparse
x86_64               randconfig-r2301-20261002    gcc-16.1.0 sparse
x86_64               randconfig-r2303-20261003    gcc-14     sparse
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
xtensa                        common_defconfig    clang-21
xtensa                randconfig-1000-20261004    gcc-14
xtensa                randconfig-1001-20261004    gcc-14
xtensa                randconfig-2000-20261002    clang-24
xtensa                randconfig-2000-20261003    gcc-14
xtensa                randconfig-2001-20261002    clang-24
xtensa                randconfig-2001-20261003    gcc-14
xtensa               randconfig-r2105-20261003    gcc-15.2.0 cocci
xtensa               randconfig-r2107-20261003    gcc-15.2.0 cocci
xtensa               randconfig-r2202-20261002    gcc-9.5.0  smatch

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
