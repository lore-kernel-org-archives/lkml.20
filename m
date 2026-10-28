Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171166;
	b=lnN0Ct3R+Qq+Y/jwxkoGgzdC/20I6BOZ0ZZcQ8mkmiGfRdWMpdWgjgvuDg2oZK6Ua+dY
	 Fb3MxwjqJTquUoNDweJ684AAJJAUcn2eYuhYK8Khz4Yeyx+zYoe9HHyjR7Pi9GUFVS9gA
	 8wZji6lZdv3tqlnlzPaseixCZAVH7KXZHkt8N84kqG6UIgKQ/5PRkwBhflr7Nj1jKadPi
	 4zgf0QMo7/CM2Vsj1vkkG8kU85Sjvu9L0j2nDbxm/Q73/Ew8F0suDKDMGtIbIXxKVmQaJ
	 eZYdIbbofAVNxrSC4JRaRl1vv5RH9CEPlRZP0XMxeNmS6v5SGa34HvazKMDh6miAaqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171166;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=70mUe82KX67m+ZkNYS+8w5tkJ8QasutFk7ftenxVT8g=;
	b=WSa2qvbsqLi2uHnQa7eIVJVX6Ybx91yE1s5EtA1ZZrDRJBEV/r12Z9LR1ZX8D1/vTcx3
	 28dZWwS4Dhx/n+0Xl+T16GCgfhCu8YzgZ26ZEFDdHmKjxoZV2XkaNvdgeQLm5NJCmGxLv
	 nlbqFSRQeFC6em+RhDS0ROby1sZb1D47mgfaTz+pRl/KE0EUIc6c61HVwBXSCxmTTGc/k
	 mIiKAMEebIGEZa4nf/sZ58HC1FnaVw5lauWxU8TnXa0vpSj4p+gSkcGvUHsHGhOVaZPsv
	 T4WS36J4yvcA/KUZzuPmZ21ttUgfJDnlYcEAR0ltSliaapb2ksQGvJOzJOqz3yUWOJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qp9+jKCn;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40627606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40627606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qp9+jKCn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793171166; x=1824707166;
  h=date:from:to:cc:subject:message-id;
  bh=kdcQSeGNE+Wi7Rw/v+BZUBs8RWA38TQ4Kc42jvVNl6E=;
  b=Qp9+jKCnMdux/UCIHVJYe+XG+BJPXcWCjShlBG9wtKhgvhtjzjK2UmI4
   wnxMMJs1lAxb/nxNkIhwCsVd6DutESG9ZxuQph/WiKVbU/t62LTaW7Oht
   BMJAhGL+1YJ0jBQwqW6fvBoICFoHXygyPtHlSxU75qtZU2V+bgA8bJTgw
   tuA9+XN7+0ROQymwAlViGKkmldF3BGawYRdFSX/GmqxDs3OH/HO6rdm42
   jw9ocz18J+5QZFy703CuzrRMyBP3A/m8a5LESqLc/Jsl2PVr1oTir0kMh
   H9IEHagN3Fh9EkdgCi0mQvt/LKgD3Isb2YlCqyR8IxOj0BOlUTOi5bWQQ
   A==;
X-CSE-ConnectionGUID: v9yzUTvBT0mItZLdby/KUA==
X-CSE-MsgGUID: ji2JiaGSScqRVMD9ZAmp9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1913916"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1913916"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 00:06:03 -0700
X-CSE-ConnectionGUID: reLMmjoFRCqVizHjtYaySw==
X-CSE-MsgGUID: 5whIgfpcRoeRm5CNP2B0Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4805838"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2026 00:06:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLxjT-00000000YPm-0Lwo;
	Wed, 28 Oct 2026 07:05:59 +0000
Date: Wed, 28 Oct 2026 15:05:47 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip:urgent] BUILD SUCCESS
 ddd5075648cbe3866207f458e96a10f06ae0b5aa
Message-ID: <202610281543.2G2TzlWj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: ddd5075648cbe3866207f458e96a10f06ae0b5aa  Merge branch into tip/master: 'timers/urgent'

elapsed time: 488m

configs tested: 163
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261028    gcc-8.5.0
arc                   randconfig-1001-20261028    gcc-8.5.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                   randconfig-1000-20261028    gcc-8.5.0
arm                   randconfig-1001-20261028    gcc-8.5.0
arm                   randconfig-1002-20261028    gcc-8.5.0
arm                   randconfig-1003-20261028    gcc-8.5.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261028    clang-17
hexagon               randconfig-1001-20261028    clang-17
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261028    clang-22
i386        buildonly-randconfig-1001-20261028    clang-22
i386        buildonly-randconfig-1002-20261028    clang-22
i386        buildonly-randconfig-1003-20261028    clang-22
i386        buildonly-randconfig-1004-20261028    clang-22
i386        buildonly-randconfig-1005-20261028    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261028    gcc-14
i386                  randconfig-1001-20261028    gcc-14
i386                  randconfig-1002-20261028    gcc-14
i386                  randconfig-1003-20261028    gcc-14
i386                  randconfig-1004-20261028    gcc-14
i386                  randconfig-1005-20261028    gcc-14
i386                  randconfig-1006-20261028    gcc-14
i386                  randconfig-1007-20261028    clang-22
i386                  randconfig-1008-20261028    clang-22
i386                  randconfig-1009-20261028    clang-22
i386                  randconfig-1010-20261028    clang-22
i386                  randconfig-1011-20261028    clang-22
i386                  randconfig-1012-20261028    clang-22
i386                  randconfig-1013-20261028    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261028    clang-17
loongarch             randconfig-1001-20261028    clang-17
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261028    clang-17
nios2                 randconfig-1001-20261028    clang-17
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc                        virt_defconfig    clang-24
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261028    clang-19
parisc                randconfig-1001-20261028    clang-19
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       bamboo_defconfig    clang-24
powerpc                       cm5200_defconfig    clang-24
powerpc                       ppc64e_defconfig    clang-24
powerpc               randconfig-1000-20261028    clang-19
powerpc               randconfig-1001-20261028    clang-19
powerpc                     sam440ep_defconfig    clang-24
powerpc64             randconfig-1000-20261028    clang-19
powerpc64             randconfig-1001-20261028    clang-19
riscv                             alldefconfig    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                  kfr2r09-romimage_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261028    gcc-12
sparc                 randconfig-1001-20261028    gcc-12
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261028    gcc-12
sparc64               randconfig-1001-20261028    gcc-12
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261028    gcc-12
um                    randconfig-1001-20261028    gcc-12
um                            x86_64_defconfig    clang-24
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261028    clang-22
x86_64      buildonly-randconfig-1001-20261028    clang-22
x86_64      buildonly-randconfig-1002-20261028    clang-22
x86_64      buildonly-randconfig-1003-20261028    clang-22
x86_64      buildonly-randconfig-1004-20261028    clang-22
x86_64      buildonly-randconfig-1005-20261028    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261028    clang-22
x86_64                randconfig-1001-20261028    clang-22
x86_64                randconfig-1002-20261028    clang-22
x86_64                randconfig-1003-20261028    clang-22
x86_64                randconfig-1004-20261028    clang-22
x86_64                randconfig-1005-20261028    clang-22
x86_64                randconfig-1006-20261028    gcc-14
x86_64                randconfig-1007-20261028    gcc-14
x86_64                randconfig-1008-20261028    gcc-14
x86_64                randconfig-1009-20261028    gcc-14
x86_64                randconfig-1010-20261028    gcc-14
x86_64                randconfig-1011-20261028    gcc-14
x86_64                randconfig-1012-20261028    gcc-12
x86_64                randconfig-1013-20261028    gcc-12
x86_64                randconfig-1014-20261028    gcc-12
x86_64                randconfig-1015-20261028    gcc-12
x86_64                randconfig-1016-20261028    gcc-12
x86_64                randconfig-1017-20261028    gcc-12
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261028    gcc-12
xtensa                randconfig-1001-20261028    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
