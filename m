Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793161875;
	b=xtRJCAgoARLVWbkUAkUiRfJTXaVpk7ibTwP7vQEZqL5c0teycHzFlJ7HnEVwuag/1AeN
	 XAyF2JHw9wYc32YIsnYXlQkdA7nGQvVsOd7uzcVbDgc0pSn9D5Pb65vzo99wltZIs+63K
	 Ch/lZ6MWwXD4IU8QJ+suCBEmHTK/DVlU2thgPNqlDNPJqGKMeTjIVwgtFGo4t26Xx5rDl
	 boTNfWiHixhR+ifJHlXra0I/ypqv3/SNUOUD/VZmwX9YK4NXOdJhsqqnhzhOe+3dhX/hg
	 EonKlTGHXJWevpHP09e0nqFVgA0RwHQFLM1rgiOZOzEBp6UfR2kljY2MXcDw3W3YDbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793161875;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=p8BxSIMfDSmHAM4gw+YeVACWBRtMMeTX1xYassRc3dE=;
	b=X4DK5jQFjtkeY8QPgvrdtdx3rp4VhetUg4xdeQ5k2yd38ZKPRfOApkC44R/ApBny47GL
	 F5VcOpF5SSjPxlNeMCtYEcpJCc3ykA6/uTyr7m3ptyuHAs4kOTIDqiIRN4VRu1llFr2zF
	 aH8T1aZ4dht83zd2HjeYH6hzGAK8WAuTXslHV7rhBO/qd+eC5jrUlQEGvP8YfOw6X7xGC
	 2miHhFbUk9GxYnKtnf+UruXnWKppFB1C0fqp3yLusl+O4dd/Kcp7j89wy4iCPHBxy9Xnd
	 0ROI7kAcVh/PkmmUxPQTclbczLupqo6qYiybKFI4y53eFu2rRsUuLuq4syAwxx1ZDMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JPAY7kIp;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73960606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73960606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JPAY7kIp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793161875; x=1824697875;
  h=date:from:to:cc:subject:message-id;
  bh=yQmczqsMPR+lsWi12hYTj1ogEg+r/Hi8La4C+q6OHyc=;
  b=JPAY7kIpBwgeR1EEh+W64DEaHDud2+9p6ahP6Anzi/ZeGA+DhO0mK51K
   KOuAo/iuLE4LnKC3a4wjnBgiMAzvvehNA8mqnu2AwOIKnJ0f3ssgh+UPM
   7PfV+njbJs4+QuAGDPgTrk6quprAEs6ejzy51EYDY6NTiPI/pJGdGt+ca
   Upp2Gz9yd71c/EZ5S7rA29JhixbrN+Kzhu6CwgM7+QJpbJSSMnYL38dbc
   r5OZdKnm+rakPDhwY+EFbPdmuT0WkNotoADDMCti+5sbPcmcD/98mPXAS
   fCfvD0HU6v7m94WBiGMpl+OZlB0jWzJqwO40H2BxYC1z3e6yznVDoMytb
   Q==;
X-CSE-ConnectionGUID: vacoTauuS8mVufhdcVu+ew==
X-CSE-MsgGUID: a2UwMa1LRnC0pajbd5S+cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1762216"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1762216"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 21:31:14 -0700
X-CSE-ConnectionGUID: LWbIpx1iRMW9ifVOsgsgmA==
X-CSE-MsgGUID: by6LkpaCSyCjOPvu9lmwcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4675324"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Oct 2026 21:31:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLvJe-00000000YCV-1QBl;
	Wed, 28 Oct 2026 04:31:10 +0000
Date: Wed, 28 Oct 2026 12:30:39 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 f19aa57d9feb58cfb455b52b84b74a988941b417
Message-ID: <202610281237.YBQzR1oh-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: f19aa57d9feb58cfb455b52b84b74a988941b417  Merge branch into tip/master: 'x86/misc'

elapsed time: 3198m

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
