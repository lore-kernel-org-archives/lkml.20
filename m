Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F2747ECDF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131650; cv=none; b=ZDzTcaMqPETfKp2pq9d0fxiA1UWIafJ/rGZf31/iRIstgefgGWgD/Q4ynrXF2SRJRIJBl+NpeqOwRYY8nc7eYskBU746N6jNLHG+EH3DLw2s4sxXrJWhFut6yzaFPkB8lQHV+ygPRgOxGVUWAtmrHcSxjzEOoDWhdy5lUjuHvxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131650; c=relaxed/simple;
	bh=aRqcLRDk8D5UL2DCjynPnDKnj5vXZ/z0LiApN45CeLs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PSSVAS8zLKnzNrJNVFxsqYbXqYcp2eAnZYYHjreU3Ah72JJtQRz4N+3GiISpD1lZp05sbsivuT8AeqalRbg1aCSdYR61OINWOSLOjTUdKSUtoXHTDwgAdik3mcy7SF/VpMRakxKlI3EJ50DPjVRmL7ENBLAf+waGX+0GIeg333I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lfs1E00u; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lfs1E00u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789131634; x=1820667634;
  h=date:from:to:cc:subject:message-id;
  bh=aRqcLRDk8D5UL2DCjynPnDKnj5vXZ/z0LiApN45CeLs=;
  b=Lfs1E00uhutvp6njLFyJ3y6Q/MWJqz9DAbQh6N144xHhhdBgF08XG4k6
   SnKByju/KUO4IjcvQT0sqM0RbiX7uAO4ewmGRh2/MztD/jH2ltPH76bmO
   QfiGjLLxcBBxGm1iDbFBmCh7wRFU0wkXAXUW/goDoC5o4xzxpO1sIR8h1
   emBfPBQaROVf4p43yEVokptO8LVIvTLmA9Ohj8MmVrE8gUc5X3BhKsKE5
   ronoLZppm1+ClvDZvr+ZmYTDXPsWHMHFBDebEmkAI6uxcEW3orAW1JcL7
   aHkZrYbIlat+S1jjJe6JcBfSNXnb9DpFPP7zSLrT7dfHmKfjJb9vPapDZ
   g==;
X-CSE-ConnectionGUID: 3PrtCzKgQc2FpQI8ulJUUg==
X-CSE-MsgGUID: W4iP54GdT7CjZXwMgDpqMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100256546"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100256546"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 06:00:24 -0700
X-CSE-ConnectionGUID: C92SqITxSQmD/Zy/1iiUHw==
X-CSE-MsgGUID: AsCTzMfhQFSs726UajEe1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="296902218"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 11 Sep 2026 06:00:23 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x50rX-000000001Z9-2xjz;
	Fri, 11 Sep 2026 13:00:16 +0000
Date: Fri, 11 Sep 2026 20:59:44 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched:core] BUILD SUCCESS
 e81ee06308379a5f2ededf997bcf17551bce5db7
Message-ID: <202609112041.mZqpiNDc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
branch HEAD: e81ee06308379a5f2ededf997bcf17551bce5db7  sched/fair: Reset NUMA fault locality after scan period update

elapsed time: 1487m

configs tested: 124
configs skipped: 11

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
arm                         assabet_defconfig    clang-22
arm                         bcm2835_defconfig    clang-17
arm                                 defconfig    clang-24
arm                   randconfig-001-20260911    clang-24
arm                   randconfig-002-20260911    gcc-12.5.0
arm                   randconfig-003-20260911    gcc-10.5.0
arm                   randconfig-004-20260911    clang-24
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
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20260911    clang-22
i386        buildonly-randconfig-002-20260911    gcc-14
i386        buildonly-randconfig-003-20260911    gcc-14
i386        buildonly-randconfig-004-20260911    clang-22
i386        buildonly-randconfig-005-20260911    clang-22
i386        buildonly-randconfig-006-20260911    gcc-14
i386                                defconfig    clang-22
loongarch                         allnoconfig    clang-20
loongarch             randconfig-001-20260911    gcc-12.5.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
m68k                         apollo_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                 decstation_r4k_defconfig    gcc-16.1.0
mips                  maltasmvp_eva_defconfig    gcc-16.1.0
nios2                         3c120_defconfig    gcc-11.5.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20260911    gcc-11.5.0
nios2                 randconfig-002-20260911    gcc-11.5.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260911    gcc-13.4.0
parisc                randconfig-002-20260911    gcc-11.5.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-16.1.0
powerpc                       ebony_defconfig    clang-24
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
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260911    gcc-14.3.0
sh                    randconfig-002-20260911    gcc-16.1.0
sh                           se7724_defconfig    gcc-16.1.0
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
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260911    clang-22
x86_64                randconfig-002-20260911    gcc-12
x86_64                randconfig-003-20260911    clang-22
x86_64                randconfig-004-20260911    clang-22
x86_64                randconfig-005-20260911    gcc-14
x86_64                randconfig-006-20260911    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260911    gcc-8.5.0
xtensa                randconfig-002-20260911    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
