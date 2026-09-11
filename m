Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84A247F3A3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131707; cv=none; b=IkkrwY5nZZADPDAeIExKceee/p0bZNilGLcbFVKryd8sT1ZzqeP/DanQQUz0QcjXQlknS3n8u5nTzOWdzQtQvWEhe0nVRpCt+p7q5tvcOpdqzM3arHBZ7T6MrPkyDZo7wgx1TVrRo7MeSw//U+Ev7J9G5G0/7/+SNekPGHcLCJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131707; c=relaxed/simple;
	bh=06MJWhk7eSen+L5zkxqBtSwqtRhFcpX6sLL0fr0ncig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pXwKMYqdVi+FE8nMwPom5gujiM06vZZULaUkcb5QFT43s8iuE6UGr6h7jwqf3jMB1OQRyWV4RXIKTwEicsIvpfqPiAdZeZieIspmJUzOhy6Yf+5I4KisEx1W8IluTnkhW5ldvRxsm3NIz2AkSG4qZssKi+jzmSK328sgpgsxYfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSnekC53; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSnekC53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789131700; x=1820667700;
  h=date:from:to:cc:subject:message-id;
  bh=06MJWhk7eSen+L5zkxqBtSwqtRhFcpX6sLL0fr0ncig=;
  b=gSnekC53N3s14lMf2TDb3WMEqfLUaH3gBN8+6u6TA3os0EFnjR2ck/Xl
   ARpi9StROiL5SgxQ7hSOqayO6IGOlmxLDk6js7kDLwvjDzpG4JAsnYuxV
   i2JppPYaWiVL0VDcKS9ClaY8wSB0RBh5V6gJn1Vk8xoIMBKOtn9a+SAqx
   A7cFGhZor9QUrZVQmFgPb5BbZxs3KaWd/qpFMLqgubHjfB9KfXqy48awu
   RabiGIm0dW5AtDwen2cVUhEe9NINz038URosiZHD73u4APY00n91G6I3Y
   o6kAQA1P1lOG+M4//qxwQiZoWUQrGkXmK3A6xjAUAGo0xqMvTdwO9sAkS
   A==;
X-CSE-ConnectionGUID: Ww4KqTT/Q5++/FYBZ1L83w==
X-CSE-MsgGUID: BCym44OxQJinBg1np+R5uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100945881"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100945881"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 06:01:34 -0700
X-CSE-ConnectionGUID: OLYADhAOQmmV3siP9TdUEw==
X-CSE-MsgGUID: 22YdOM48QcuJ+mbWHo3QBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268624859"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 11 Sep 2026 06:01:33 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x50sf-000000001ZH-3uWl;
	Fri, 11 Sep 2026 13:01:27 +0000
Date: Fri, 11 Sep 2026 21:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched:urgent] BUILD SUCCESS
 f5741d2b34519d387edf6e9798fc7030c20a35f3
Message-ID: <202609112104.NKqBj4PH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/urgent
branch HEAD: f5741d2b34519d387edf6e9798fc7030c20a35f3  sched/core: Call wq_worker_tick() for the execution context

elapsed time: 1487m

configs tested: 156
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260911    gcc-12.5.0
arc                   randconfig-002-20260911    gcc-8.5.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-24
arm                         lpc32xx_defconfig    clang-17
arm                   randconfig-001-20260911    clang-24
arm                   randconfig-002-20260911    gcc-12.5.0
arm                   randconfig-003-20260911    gcc-10.5.0
arm                   randconfig-004-20260911    clang-24
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260911    clang-24
arm64                 randconfig-002-20260911    clang-24
arm64                 randconfig-003-20260911    clang-24
arm64                 randconfig-004-20260911    clang-24
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260911    gcc-16.1.0
csky                  randconfig-002-20260911    gcc-16.1.0
hexagon                          allmodconfig    clang-24
hexagon                           allnoconfig    clang-24
hexagon                             defconfig    clang-24
hexagon               randconfig-001-20260911    clang-17
hexagon               randconfig-002-20260911    clang-20
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20260911    clang-22
i386        buildonly-randconfig-002-20260911    gcc-14
i386        buildonly-randconfig-003-20260911    gcc-14
i386        buildonly-randconfig-004-20260911    clang-22
i386        buildonly-randconfig-005-20260911    clang-22
i386        buildonly-randconfig-006-20260911    gcc-14
i386                                defconfig    clang-22
i386                  randconfig-001-20260911    gcc-13
i386                  randconfig-002-20260911    clang-22
i386                  randconfig-003-20260911    gcc-14
i386                  randconfig-004-20260911    clang-22
i386                  randconfig-005-20260911    clang-22
i386                  randconfig-006-20260911    clang-22
i386                  randconfig-007-20260911    clang-22
i386                  randconfig-011-20260911    gcc-14
i386                  randconfig-012-20260911    gcc-14
i386                  randconfig-013-20260911    clang-22
i386                  randconfig-014-20260911    gcc-14
i386                  randconfig-015-20260911    gcc-14
i386                  randconfig-016-20260911    gcc-14
i386                  randconfig-017-20260911    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                           defconfig    clang-24
loongarch             randconfig-001-20260911    gcc-12.5.0
loongarch             randconfig-002-20260911    clang-22
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                        omega2p_defconfig    clang-17
mips                   sb1250_swarm_defconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260911    gcc-11.5.0
nios2                 randconfig-002-20260911    gcc-11.5.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    gcc-16.1.0
openrisc         de0_nano_multicore_defconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260911    gcc-13.4.0
parisc                randconfig-002-20260911    gcc-11.5.0
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-16.1.0
powerpc                       holly_defconfig    clang-24
powerpc               randconfig-001-20260911    clang-21
powerpc               randconfig-002-20260911    clang-24
powerpc64             randconfig-001-20260911    gcc-8.5.0
powerpc64             randconfig-002-20260911    clang-24
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-24
riscv                               defconfig    clang-24
riscv                 randconfig-001-20260911    clang-24
riscv                 randconfig-002-20260911    clang-24
s390                             allmodconfig    clang-24
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                  randconfig-001-20260911    gcc-13.4.0
s390                  randconfig-002-20260911    gcc-15.2.0
s390                       zfcpdump_defconfig    clang-22
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260911    gcc-14.3.0
sh                    randconfig-002-20260911    gcc-16.1.0
sh                          sdk7786_defconfig    gcc-16.1.0
sparc                            alldefconfig    gcc-16.1.0
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260911    gcc-8.5.0
sparc                 randconfig-002-20260911    gcc-13.4.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-24
sparc64               randconfig-001-20260911    clang-21
sparc64               randconfig-002-20260911    gcc-9.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-14
um                                  defconfig    clang-24
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260911    gcc-14
um                    randconfig-002-20260911    clang-24
um                           x86_64_defconfig    clang-24
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260911    clang-22
x86_64      buildonly-randconfig-002-20260911    gcc-14
x86_64      buildonly-randconfig-003-20260911    clang-22
x86_64      buildonly-randconfig-004-20260911    gcc-14
x86_64      buildonly-randconfig-005-20260911    clang-22
x86_64      buildonly-randconfig-006-20260911    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260911    clang-22
x86_64                randconfig-002-20260911    gcc-12
x86_64                randconfig-003-20260911    clang-22
x86_64                randconfig-004-20260911    clang-22
x86_64                randconfig-005-20260911    gcc-14
x86_64                randconfig-006-20260911    gcc-14
x86_64                randconfig-011-20260911    gcc-14
x86_64                randconfig-012-20260911    gcc-14
x86_64                randconfig-013-20260911    clang-22
x86_64                randconfig-014-20260911    clang-22
x86_64                randconfig-015-20260911    clang-22
x86_64                randconfig-016-20260911    clang-22
x86_64                randconfig-074-20260911    clang-22
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260911    gcc-8.5.0
xtensa                randconfig-002-20260911    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
