Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AC1459AD4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927322; cv=none; b=A0QHy10Wbf68LgGiA1BMBSEjr+Rcvypk+/2fc7NOWzJavlzS8ee4uDYLi9JaDqp0blQdwBHOCuTj2UqhFZEG0vTrMTO/+nIqk9L+m1/3HtX7CWShzjgGflnr2pSoLz/VSkJ6x2SLbQaxacEVYggS0ImdkWRd4mSrSXl/N+VCWOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927322; c=relaxed/simple;
	bh=nx8NT6hFMc8iPW5yLMzhgteCxzNQnPeUNjROwLmrWTk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rFWOU95m47ZV1qquq+IP2BlGLqm2HKBgbm8oCPepCA5lxJv7+K+87xK54ubeCmG9fhsH9B0Act5bFSMbLkrlQB5Jf1zpcIjxEcQ4z8FiFN7lP6px92LPt3moGlBwmqfgshEMMHOrL4lT+JW7TdsD3HcuLIEuTtJnjln3inhuFCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjRlNr31; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjRlNr31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787927319; x=1819463319;
  h=date:from:to:cc:subject:message-id;
  bh=nx8NT6hFMc8iPW5yLMzhgteCxzNQnPeUNjROwLmrWTk=;
  b=TjRlNr31kHUkdeH8fLvx1bu/T9zMYfLiNCePk+J6B8ljrJoCzuvucxCG
   G1Gj7VuQDlqwHMSTYkf/mv/x23N3T+3dyBnqRtae5kwpOUevcDN0CVYkB
   EFteF8hSbaj+9jojbdJwx5f32B7zna3jWFirIuiTWkUiWP8h6lRsY+pDg
   poxGlS32QB65154lpy6PQyB3a3zOtbp77vIZLuxrpPY8PE1ezrdgT0028
   8ID6ZJeVTJNwdJAcQnP/d7qzzqC/MiIi7dafUlEz7rFZzEZPqwVgZfZRH
   UXbDYTBR0biSDCyUP6cwcd8+jYVHzqWtRFL0hbT4SMTvadZvqbdOXYfLR
   A==;
X-CSE-ConnectionGUID: hqcYeaI7Su+S0kyjwkbZxg==
X-CSE-MsgGUID: PNwrbPtlTjeXmpIIXSHSTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="99786875"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="99786875"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 07:28:36 -0700
X-CSE-ConnectionGUID: b2p1GQNkSdOIoP97XxMr4Q==
X-CSE-MsgGUID: TNLj+UxATruGLo9UGr3r8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="292989914"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Aug 2026 07:28:35 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzxZI-00000000BFg-3Duh;
	Fri, 28 Aug 2026 14:28:32 +0000
Date: Fri, 28 Aug 2026 22:28:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2026.08.23a] BUILD SUCCESS
 bf0e2569a7793acd4d1680cc0fafe918ff47cf4b
Message-ID: <202608282243.fPy1uH6a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.08.23a
branch HEAD: bf0e2569a7793acd4d1680cc0fafe918ff47cf4b  srcu_tree: Disable preemption across synchronize_srcu_atomic()

elapsed time: 1598m

configs tested: 230
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-14
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-14
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                     nsimosci_hs_defconfig    gcc-16.1.0
arc                   randconfig-001-20260828    clang-17
arc                   randconfig-002-20260828    clang-17
arc                        vdk_hs38_defconfig    gcc-16.1.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-14
arm                              allyesconfig    gcc-16.1.0
arm                         at91_dt_defconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                         lpc18xx_defconfig    clang-24
arm                             pxa_defconfig    gcc-16.1.0
arm                   randconfig-001-20260828    clang-17
arm                   randconfig-002-20260828    clang-17
arm                   randconfig-003-20260828    clang-17
arm                   randconfig-004-20260828    clang-17
arm                           sunxi_defconfig    gcc-16.1.0
arm                         vf610m4_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-14
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260828    clang-14
arm64                 randconfig-002-20260828    clang-14
arm64                 randconfig-003-20260828    clang-14
arm64                 randconfig-004-20260828    clang-14
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260828    clang-14
csky                  randconfig-002-20260828    clang-14
hexagon                          allmodconfig    clang-24
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-24
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260828    clang-17
hexagon               randconfig-001-20260828    clang-18
hexagon               randconfig-002-20260828    clang-18
hexagon               randconfig-002-20260828    clang-24
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260828    clang-22
i386        buildonly-randconfig-002-20260828    clang-22
i386        buildonly-randconfig-003-20260828    clang-22
i386        buildonly-randconfig-004-20260828    clang-22
i386        buildonly-randconfig-005-20260828    clang-22
i386        buildonly-randconfig-006-20260828    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260828    gcc-14
i386                  randconfig-002-20260828    gcc-14
i386                  randconfig-003-20260828    gcc-14
i386                  randconfig-004-20260828    gcc-14
i386                  randconfig-005-20260828    gcc-14
i386                  randconfig-006-20260828    gcc-14
i386                  randconfig-007-20260828    gcc-14
i386                  randconfig-011-20260828    gcc-14
i386                  randconfig-012-20260828    gcc-14
i386                  randconfig-013-20260828    gcc-14
i386                  randconfig-014-20260828    gcc-14
i386                  randconfig-015-20260828    gcc-14
i386                  randconfig-016-20260828    gcc-14
i386                  randconfig-017-20260828    gcc-14
loongarch                        allmodconfig    clang-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-14
loongarch             randconfig-001-20260828    clang-18
loongarch             randconfig-001-20260828    gcc-16.1.0
loongarch             randconfig-002-20260828    clang-18
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-14
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-14
m68k                       m5329evb_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-14
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                         bigsur_defconfig    gcc-16.1.0
mips                   sb1250_swarm_defconfig    gcc-16.1.0
nios2                         10m50_defconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-14
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-14
nios2                 randconfig-001-20260828    clang-18
nios2                 randconfig-001-20260828    gcc-8.5.0
nios2                 randconfig-002-20260828    clang-18
nios2                 randconfig-002-20260828    gcc-8.5.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-14
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-14
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260828    gcc-9.5.0
parisc                randconfig-002-20260828    gcc-9.5.0
parisc64                            defconfig    clang-14
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-14
powerpc                           allnoconfig    gcc-16.1.0
powerpc                       holly_defconfig    clang-24
powerpc                   motionpro_defconfig    clang-24
powerpc               randconfig-001-20260828    gcc-9.5.0
powerpc               randconfig-002-20260828    gcc-9.5.0
powerpc                      tqm8xx_defconfig    clang-20
powerpc64             randconfig-001-20260828    gcc-9.5.0
powerpc64             randconfig-002-20260828    gcc-9.5.0
riscv                            allmodconfig    clang-14
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-14
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-14
riscv                            allyesconfig    clang-24
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260828    clang-17
riscv                 randconfig-002-20260828    clang-17
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-24
s390                              allnoconfig    clang-14
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260828    clang-17
s390                  randconfig-002-20260828    clang-17
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-14
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260828    clang-17
sh                    randconfig-002-20260828    clang-17
sh                           se7724_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-14
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260828    gcc-8.5.0
sparc                 randconfig-001-20260828    gcc-9.5.0
sparc                 randconfig-002-20260828    gcc-8.5.0
sparc                 randconfig-002-20260828    gcc-9.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260828    gcc-11.5.0
sparc64               randconfig-001-20260828    gcc-9.5.0
sparc64               randconfig-002-20260828    gcc-9.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-14
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260828    clang-24
um                    randconfig-001-20260828    gcc-9.5.0
um                    randconfig-002-20260828    gcc-14
um                    randconfig-002-20260828    gcc-9.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-14
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260828    clang-22
x86_64      buildonly-randconfig-001-20260828    gcc-14
x86_64      buildonly-randconfig-002-20260828    gcc-14
x86_64      buildonly-randconfig-003-20260828    gcc-14
x86_64      buildonly-randconfig-004-20260828    clang-22
x86_64      buildonly-randconfig-004-20260828    gcc-14
x86_64      buildonly-randconfig-005-20260828    gcc-14
x86_64      buildonly-randconfig-006-20260828    clang-22
x86_64      buildonly-randconfig-006-20260828    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260828    gcc-14
x86_64                randconfig-002-20260828    gcc-14
x86_64                randconfig-003-20260828    gcc-14
x86_64                randconfig-004-20260828    gcc-14
x86_64                randconfig-005-20260828    gcc-14
x86_64                randconfig-006-20260828    gcc-14
x86_64                randconfig-011-20260828    clang-22
x86_64                randconfig-011-20260828    gcc-14
x86_64                randconfig-012-20260828    clang-22
x86_64                randconfig-013-20260828    clang-22
x86_64                randconfig-014-20260828    clang-22
x86_64                randconfig-015-20260828    clang-22
x86_64                randconfig-015-20260828    gcc-14
x86_64                randconfig-016-20260828    clang-22
x86_64                randconfig-016-20260828    gcc-13
x86_64                randconfig-071-20260828    clang-22
x86_64                randconfig-072-20260828    clang-22
x86_64                randconfig-073-20260828    clang-22
x86_64                randconfig-074-20260828    clang-22
x86_64                randconfig-075-20260828    clang-22
x86_64                randconfig-076-20260828    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                           alldefconfig    gcc-16.1.0
xtensa                            allnoconfig    clang-14
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260828    gcc-15.2.0
xtensa                randconfig-001-20260828    gcc-9.5.0
xtensa                randconfig-002-20260828    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
