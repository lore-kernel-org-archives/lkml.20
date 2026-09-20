Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B137F3CA491
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789883550; cv=none; b=E9TyZPHemr+AmEMlGGHOsAA89r2eikCS8h0BEixKXhGgqWThe7LYnbvp4qh8vT6kM03a7nG/4q+ig66MPP4kjfDiMBPr0dDxeH+z1ajfvYRbayQgTAVXj3C4QovmwbbIAvJHhFDEx/pqgaLGdpiJnmACp3KW6AcQBfgo+YHck/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789883550; c=relaxed/simple;
	bh=q4gtrwrD+bzQZXy3NtdI9yDBTwG5YWsYHD7aWcU1f+E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rreKFISOz0LDb4f9T06hfOwaAtmAGjvMvXxynLS9HBiQ2fvljqlxNtKWG3UY5BhCbYqBSi7vOl20ILCq2PRgSRUbIKA7pMY62WyWXRmntUC1bRP0m3XLCss0HgIuvcxJy93WQIDLZkuHZbccxfNTMgbLnmSEay4KbJ4xpyIjQYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XIi5pNlQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XIi5pNlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789883548; x=1821419548;
  h=date:from:to:cc:subject:message-id;
  bh=q4gtrwrD+bzQZXy3NtdI9yDBTwG5YWsYHD7aWcU1f+E=;
  b=XIi5pNlQ1Wy5JB/5OC+A9YKEMoyg4neyxyKtFBGPnphe7Dzka6QERENg
   WNMMJKdyz7SPZWrk721ECG7bLGYPzYIWIcCD4byzcv0qrO9yphlOeA2wV
   7gh/dwjt+uJxYAyQLVmVKQ9MrIg7TY0pZ7I9HIdUH0P5iCzq9rDnQojBs
   UR+RmgMGXyg+WrZwZIAT03NX3NXv84n81Y1HIZkBIjkLEnKrr5DDGXF+W
   iJuq7A7RrpEuYXSJ++vP8ZRZLLOHdILexoNnoaklkW+sN6BjHs73ukrxQ
   8amE/HBbNR4BvxfPAq3n9vs1puJPcG/fnJtHijgswauBJSh7lbFA2IweU
   Q==;
X-CSE-ConnectionGUID: OHVdMdg4RQaRsarQW4YCLg==
X-CSE-MsgGUID: MiZmM2OVRhymsG+nCFwuUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="101741048"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="101741048"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 22:52:27 -0700
X-CSE-ConnectionGUID: qg71+7qTRRqr0uwJlfIf9A==
X-CSE-MsgGUID: VAZqB1oqTg6aLuMga1OPXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="271313781"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2026 22:52:25 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8ATP-00000000Bzn-1btZ;
	Sun, 20 Sep 2026 05:52:23 +0000
Date: Sun, 20 Sep 2026 13:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:cache] BUILD SUCCESS
 a3f5e6eba41885dcffb635b54d6c4a18aa579cd5
Message-ID: <202609201317.332Lhl2a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cache
branch HEAD: a3f5e6eba41885dcffb635b54d6c4a18aa579cd5  fs/resctrl: Simplify pseudo_lock_measure_trigger()

elapsed time: 887m

configs tested: 183
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2106-20260918    gcc-9.5.0
alpha                randconfig-r2202-20260918    gcc-16.1.0
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260920    gcc-8.5.0
arc                   randconfig-1001-20260920    gcc-8.5.0
arm                                allnoconfig    clang-17
arm                               allyesconfig    gcc-16.1.0
arm                                  defconfig    clang-24
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20260920    gcc-10.5.0
arm                   randconfig-1001-20260920    gcc-12.5.0
arm                   randconfig-1002-20260920    clang-20
arm                   randconfig-1003-20260920    gcc-16.1.0
arm                  randconfig-r2105-20260918    clang-24
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
hexagon                           allmodconfig    clang-24
hexagon                            allnoconfig    clang-24
hexagon                              defconfig    clang-24
hexagon               randconfig-1000-20260919    clang-17
hexagon               randconfig-1001-20260919    clang-18
i386                              alldefconfig    gcc-14
i386                               allnoconfig    gcc-14
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
i386                  randconfig-1300-20260920    clang-22   sparse
i386                  randconfig-1301-20260920    clang-22   sparse
i386                  randconfig-1302-20260920    clang-22   sparse
i386                  randconfig-2100-20260918    clang-22
i386                  randconfig-2101-20260918    gcc-14
i386                  randconfig-2102-20260918    clang-22
i386                  randconfig-2103-20260918    clang-22
i386                  randconfig-2200-20260918    clang-22
i386                 randconfig-r2107-20260918    gcc-14
loongarch                         allmodconfig    clang-19
loongarch                          allnoconfig    clang-20
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260919    clang-24
loongarch             randconfig-1001-20260919    clang-18
loongarch            randconfig-r1304-20260920    gcc-15.2.0 sparse
loongarch            randconfig-r2103-20260918    clang-24
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                                 defconfig    gcc-16.1.0
m68k                           hp300_defconfig    gcc-16.1.0
m68k                             q40_defconfig    gcc-16.1.0
m68k                 randconfig-r1300-20260920    gcc-10.5.0 sparse
m68k                 randconfig-r1309-20260920    gcc-16.1.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    gcc-16.1.0
microblaze           randconfig-r1308-20260920    gcc-14.3.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            xway_defconfig    clang-19
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    gcc-11.5.0
nios2                                defconfig    gcc-11.5.0
nios2                 randconfig-1000-20260919    gcc-8.5.0
nios2                 randconfig-1001-20260919    gcc-11.5.0
openrisc                          allmodconfig    gcc-16.1.0
openrisc                           allnoconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r1306-20260920    gcc-9.5.0  sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260920    gcc-14.3.0
parisc                randconfig-1001-20260920    gcc-8.5.0
parisc               randconfig-r2100-20260918    gcc-16.1.0
parisc64                             defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    gcc-16.1.0
powerpc                      ep8248e_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260920    gcc-8.5.0
powerpc               randconfig-1001-20260920    clang-24
powerpc              randconfig-r1302-20260920    gcc-9.5.0  sparse
powerpc              randconfig-r1303-20260920    gcc-8.5.0  sparse
powerpc              randconfig-r2104-20260918    clang-24
powerpc64             randconfig-1000-20260920    clang-24
powerpc64             randconfig-1001-20260920    clang-22
powerpc64            randconfig-r2200-20260918    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    gcc-16.1.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-24
riscv                 randconfig-1000-20260919    clang-24
riscv                 randconfig-1001-20260919    clang-17
riscv                randconfig-r2102-20260918    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    clang-18
s390                  randconfig-1000-20260919    clang-24
s390                  randconfig-1001-20260919    clang-19
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    gcc-16.1.0
sh                                allyesconfig    gcc-16.1.0
sh                                   defconfig    gcc-16.1.0
sh                    randconfig-1000-20260919    gcc-15.2.0
sh                    randconfig-1001-20260919    gcc-9.5.0
sparc                              allnoconfig    gcc-16.1.0
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260919    gcc-11.5.0
sparc                 randconfig-1001-20260919    gcc-16.1.0
sparc                 randconfig-2000-20260918    gcc-8.5.0
sparc                 randconfig-2001-20260918    gcc-11.5.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    clang-24
sparc64               randconfig-1000-20260919    clang-20
sparc64               randconfig-1001-20260919    clang-22
sparc64               randconfig-2000-20260918    gcc-8.5.0
sparc64               randconfig-2001-20260918    clang-20
sparc64              randconfig-r1301-20260920    gcc-8.5.0  sparse
sparc64              randconfig-r1305-20260920    gcc-13.4.0 sparse
um                                 allnoconfig    clang-17
um                                allyesconfig    gcc-14
um                                   defconfig    clang-24
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260919    clang-24
um                    randconfig-1001-20260919    gcc-12
um                    randconfig-2000-20260918    gcc-14
um                    randconfig-2001-20260918    gcc-14
um                            x86_64_defconfig    clang-24
x86_64                             allnoconfig    clang-22
x86_64      buildonly-randconfig-1000-20260920    gcc-14
x86_64      buildonly-randconfig-1001-20260920    gcc-14
x86_64      buildonly-randconfig-1002-20260920    gcc-14
x86_64      buildonly-randconfig-1003-20260920    clang-22
x86_64      buildonly-randconfig-1004-20260920    clang-22
x86_64      buildonly-randconfig-1005-20260920    gcc-14
x86_64                               defconfig    gcc-14
x86_64                randconfig-1000-20260920    clang-22
x86_64                randconfig-1001-20260920    gcc-14
x86_64                randconfig-1002-20260920    clang-22
x86_64                randconfig-1003-20260920    gcc-14
x86_64                randconfig-1004-20260920    gcc-14
x86_64                randconfig-1005-20260920    clang-22
x86_64                randconfig-1300-20260920    clang-22   sparse
x86_64                randconfig-1301-20260920    clang-22   sparse
x86_64                randconfig-1302-20260920    gcc-14     sparse
x86_64                randconfig-2100-20260918    clang-22
x86_64                randconfig-2101-20260918    clang-22
x86_64                randconfig-2102-20260918    gcc-14
x86_64                randconfig-2103-20260918    clang-22
x86_64                randconfig-2200-20260918    gcc-14
x86_64               randconfig-r2101-20260918    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    gcc-16.1.0
xtensa                            allyesconfig    gcc-16.1.0
xtensa                randconfig-1000-20260919    gcc-13.4.0
xtensa                randconfig-1001-20260919    gcc-15.2.0
xtensa                randconfig-2000-20260918    gcc-8.5.0
xtensa                randconfig-2001-20260918    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
