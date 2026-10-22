Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636024;
	b=xpJy/S34GDRvhkAZhw0x7fXYj36WoaUJ0b4pPL7qhnidmzB0H4iC+dqPpxKq1DWXEzfW
	 GtPkCJ9/R8YjvYEhwclwkLHUqMsV1PTx3J+yj5FCygnk6l2suS/L1eJdjh2/lO4vQQP1O
	 H5NrNlntrebxZ9qTheYZRVzO6ISQuIF2UNyC1ZfMNXZNPND4F9yeZoSJnYFFrSMWeeuIs
	 F/kGHOZ50ZqTXPPfV7Yy+gqxDqJs3MeivF460977+R3sGO9eSlSjDNfhMMijxa3TGNszT
	 u9dCYJyjHZJ0dpD/0Mip8S36wbojm9e4+AlVS+wzWq2feywvmUdJoSPff4jDF8EyyBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636024;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=hxy+b9LZgzv3YGXZlR7vcoWPVfaxnXPeL89WigZRNSI=;
	b=y2tWeQ60cpNGEnbgTDq0/SOOUxfPMEjam11ZN1mRoVkgEW/kW9MfhZeTw8Hr7i/w2nS6
	 5wQNrDVGXBn0asQJJ6WOxpP5M/C1APKZSa1ORAF7Q9dJqL8TAbUhodM/orT1vPlKdKUkS
	 GWrr/8xEHY18Gk6kJTR9v6dPiTMM1rmt8b0WkS14DrVOAv6zjuvcUpq1v2ri8YtrukdpN
	 T1ib9GdrcFoVXsgY8jg0j7gCTvELPKTHEz33o7VwRc0wCbUOk1YSrkachjKLF4x9XTKUI
	 s0TTCG4URqVr9B++X6LXTvnHeIQ70AYATp8/83dVHVPiIHXUBLEYTTlN5aSMeVfD8pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LJeCp70o;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184DC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 184DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LJeCp70o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792636023; x=1824172023;
  h=date:from:to:cc:subject:message-id;
  bh=eqXoU14YE1hZQxf8Jepkte8GgZLIWiBGiZr6lelJDig=;
  b=LJeCp70oncYZLyYL6X6vRukCH/mPkwIoK6pw9cq1OKvDqp8h7Fx6nzce
   nDDQ2uzAiiWXCpO73m7VMfwQ796GT73bGWYOBeb/MF6C/mgAji++fZsu6
   2O7gdWPex5dhWLu2Op8vrmwkW7MP/CVKHuxbpqneatghRxiFVd6VRkkZx
   wptC925V4KfokmugJ7zqitAu3u36Ppa1TwZY6J3aceSAbkYd8+HE0tucB
   iziLDsZBQe81/5QyKCIdT5ovbpC0a0n4KT/ppSM8VXhTw2BK0kwPbXuq6
   YZ3FOJIh638f9QdLRaqonh1Gxhj16skrHY1+ZJxZU9BaE4uFb56/8ujfg
   w==;
X-CSE-ConnectionGUID: hhod4nKsRhyJnFOW1WFO4A==
X-CSE-MsgGUID: 1E2DzyEbTEKj+TGfy2QGlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1262451"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1262451"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 19:27:03 -0700
X-CSE-ConnectionGUID: +s7goX0ZT0yYoZs24chbCw==
X-CSE-MsgGUID: 7B/c/wPpTqCRy8J4+5hVHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3306030"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Oct 2026 19:27:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJiWA-00000000QQw-3E7x;
	Thu, 22 Oct 2026 02:26:58 +0000
Date: Thu, 22 Oct 2026 10:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2026.10.19a] BUILD SUCCESS
 1afdaa2b30aa69c340161cae31fe92669ba38867
Message-ID: <202610221052.bn8nx455-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.10.19a
branch HEAD: 1afdaa2b30aa69c340161cae31fe92669ba38867  squash! rcu: Print CPU that preempted stalled reader wants to run on

elapsed time: 2841m

configs tested: 182
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                     allnoconfig    gcc-16.2.0
alpha                    allyesconfig    gcc-16.2.0
alpha       randconfig-r2102-20261020    gcc-14.4.0 cocci
alpha       randconfig-r2105-20261020    gcc-12.5.0 cocci
alpha       randconfig-r2108-20261020    gcc-14.4.0 cocci
alpha       randconfig-r2200-20261020    gcc-8.5.0  smatch
alpha       randconfig-r2302-20261020    gcc-8.5.0  sparse
arc                      allmodconfig    gcc-16.2.0
arc                       allnoconfig    gcc-16.2.0
arc                      allyesconfig    gcc-16.2.0
arc          randconfig-2000-20261020    gcc-14.4.0
arc          randconfig-2001-20261020    gcc-14.4.0
arc         randconfig-r2105-20261020    gcc-8.5.0  cocci
arm                       allnoconfig    clang-17
arm                      allyesconfig    gcc-16.2.0
arm          randconfig-2000-20261020    gcc-14.4.0
arm          randconfig-2001-20261020    gcc-14.4.0
arm         randconfig-r2110-20261020    gcc-8.5.0  cocci
arm         randconfig-r2300-20261020    gcc-8.5.0  sparse
arm         randconfig-r2311-20261020    gcc-14.4.0 sparse
arm64                    allmodconfig    clang-24
arm64                     allnoconfig    gcc-16.2.0
arm64        randconfig-2000-20261020    clang-24
arm64        randconfig-2000-20261020    gcc-8.5.0
arm64        randconfig-2001-20261020    clang-24
arm64        randconfig-2001-20261020    gcc-11.5.0
csky                     allmodconfig    gcc-16.2.0
csky                      allnoconfig    gcc-16.2.0
csky         randconfig-2000-20261020    clang-24
csky         randconfig-2000-20261020    gcc-14.4.0
csky         randconfig-2001-20261020    clang-24
csky         randconfig-2001-20261020    gcc-16.2.0
csky        randconfig-r2202-20261020    gcc-10.5.0 smatch
hexagon                  allmodconfig    clang-24
hexagon                   allnoconfig    clang-24
hexagon      randconfig-1000-20261022    clang-24
hexagon      randconfig-1001-20261022    clang-24
hexagon      randconfig-2000-20261020    clang-24
hexagon      randconfig-2001-20261020    clang-17
hexagon      randconfig-2001-20261020    clang-24
hexagon     randconfig-r2308-20261020    gcc-14.4.0 sparse
i386                      allnoconfig    gcc-14
i386         randconfig-2000-20261020    gcc-14.4.0
i386         randconfig-2001-20261020    gcc-14.4.0
i386         randconfig-2100-20261020    clang-22   cocci
i386         randconfig-2101-20261020    clang-22   cocci
i386         randconfig-2102-20261020    clang-22   cocci
i386         randconfig-2103-20261020    clang-22   cocci
i386         randconfig-2104-20261020    clang-22   cocci
i386         randconfig-2105-20261020    clang-22   cocci
i386         randconfig-2200-20261020    gcc-12     smatch
i386         randconfig-2300-20261020    clang-22   sparse
i386         randconfig-2301-20261020    clang-22   sparse
i386         randconfig-2302-20261020    clang-22   sparse
i386        randconfig-r2303-20261020    gcc-8.5.0  sparse
i386        randconfig-r2304-20261020    gcc-8.5.0  sparse
loongarch                allmodconfig    clang-19
loongarch                 allnoconfig    clang-20
loongarch    randconfig-1000-20261022    clang-24
loongarch    randconfig-1001-20261022    clang-22
loongarch    randconfig-2000-20261020    gcc-11.5.0
loongarch    randconfig-2000-20261020    gcc-16.2.0
loongarch    randconfig-2001-20261020    gcc-11.5.0
loongarch    randconfig-2001-20261020    gcc-16.2.0
m68k                     allmodconfig    gcc-16.2.0
m68k                      allnoconfig    gcc-16.2.0
m68k                     allyesconfig    gcc-16.2.0
m68k        randconfig-r2100-20261020    gcc-14.4.0 cocci
m68k        randconfig-r2107-20261020    gcc-16.2.0 cocci
microblaze                allnoconfig    gcc-16.2.0
microblaze               allyesconfig    gcc-16.2.0
microblaze  randconfig-r2301-20261020    gcc-8.5.0  sparse
mips                     allmodconfig    gcc-16.2.0
mips                      allnoconfig    gcc-16.2.0
mips                     allyesconfig    gcc-16.2.0
mips        randconfig-r2103-20261020    gcc-14.4.0 cocci
mips        randconfig-r2111-20261020    gcc-16.2.0 cocci
nios2                    allmodconfig    gcc-11.5.0
nios2                     allnoconfig    gcc-11.5.0
nios2        randconfig-1000-20261022    gcc-11.5.0
nios2        randconfig-1001-20261022    gcc-8.5.0
nios2        randconfig-2000-20261020    gcc-11.5.0
nios2        randconfig-2001-20261020    gcc-11.5.0
nios2        randconfig-2001-20261020    gcc-8.5.0
nios2       randconfig-r2104-20261020    gcc-12.5.0 cocci
nios2       randconfig-r2106-20261020    gcc-12.5.0 cocci
openrisc                 allmodconfig    gcc-16.2.0
openrisc                  allnoconfig    gcc-16.2.0
openrisc                    defconfig    gcc-16.2.0
openrisc    randconfig-r2305-20261020    gcc-8.5.0  sparse
openrisc    randconfig-r2307-20261020    gcc-14.4.0 sparse
parisc                   allmodconfig    gcc-16.2.0
parisc                    allnoconfig    gcc-16.2.0
parisc                   allyesconfig    gcc-16.2.0
parisc                      defconfig    gcc-16.2.0
parisc       randconfig-1001-20261022    gcc-15.3.0
parisc       randconfig-2000-20261020    gcc-11.5.0
parisc       randconfig-2000-20261020    gcc-8.5.0
parisc       randconfig-2001-20261020    gcc-10.5.0
parisc       randconfig-2001-20261020    gcc-11.5.0
parisc      randconfig-r2109-20261020    gcc-14.4.0 cocci
powerpc                  allmodconfig    gcc-16.2.0
powerpc                   allnoconfig    gcc-16.2.0
powerpc      randconfig-1001-20261022    clang-24
powerpc      randconfig-2000-20261020    clang-19
powerpc      randconfig-2001-20261020    clang-19
powerpc     randconfig-r2200-20261020    clang-17   smatch
powerpc     randconfig-r2310-20261020    gcc-14.4.0 sparse
powerpc64    randconfig-1001-20261022    clang-24
powerpc64    randconfig-2000-20261020    clang-19
powerpc64    randconfig-2001-20261020    clang-19
powerpc64   randconfig-r2202-20261020    gcc-10.5.0 smatch
riscv                    allmodconfig    clang-24
riscv                     allnoconfig    gcc-16.2.0
riscv                    allyesconfig    clang-24
riscv                       defconfig    clang-24
riscv        randconfig-2000-20261020    clang-17
riscv        randconfig-2000-20261020    gcc-8.5.0
riscv        randconfig-2001-20261020    clang-17
riscv       randconfig-r2104-20261020    gcc-8.5.0  cocci
s390                     allmodconfig    clang-24
s390                      allnoconfig    clang-24
s390                     allyesconfig    gcc-16.2.0
s390                        defconfig    clang-18
s390         randconfig-2000-20261020    clang-17
s390         randconfig-2000-20261020    gcc-8.5.0
s390         randconfig-2001-20261020    clang-17
s390         randconfig-2001-20261020    gcc-8.5.0
s390        randconfig-r2101-20261020    gcc-14.4.0 cocci
s390        randconfig-r2111-20261020    gcc-12.5.0 cocci
sh                       allmodconfig    gcc-16.2.0
sh                        allnoconfig    gcc-16.2.0
sh                       allyesconfig    gcc-16.2.0
sh           randconfig-2000-20261020    clang-17
sh           randconfig-2000-20261020    gcc-16.2.0
sh           randconfig-2001-20261020    clang-17
sh           randconfig-2001-20261020    gcc-16.2.0
sparc                     allnoconfig    gcc-16.2.0
sparc                       defconfig    gcc-16.2.0
sparc        randconfig-2000-20261020    clang-24
sparc        randconfig-2001-20261020    clang-24
sparc       randconfig-r2107-20261020    gcc-12.5.0 cocci
sparc       randconfig-r2110-20261020    gcc-12.5.0 cocci
sparc       randconfig-r2309-20261020    gcc-14.4.0 sparse
sparc64                  allmodconfig    clang-20
sparc64      randconfig-2000-20261020    clang-24
sparc64      randconfig-2001-20261020    clang-24
sparc64     randconfig-r2201-20261020    clang-24   smatch
um                       allmodconfig    clang-17
um                        allnoconfig    clang-17
um                       allyesconfig    gcc-14
um           randconfig-2000-20261020    clang-24
um           randconfig-2001-20261020    clang-24
um          randconfig-r2200-20261020    gcc-14     smatch
um          randconfig-r2306-20261020    gcc-14.4.0 sparse
x86_64                    allnoconfig    clang-22
x86_64                          kexec    clang-22
x86_64       randconfig-2000-20261020    clang-19
x86_64       randconfig-2001-20261020    clang-19
x86_64       randconfig-2100-20261020    clang-22   cocci
x86_64       randconfig-2101-20261020    clang-22   cocci
x86_64       randconfig-2102-20261020    clang-22   cocci
x86_64       randconfig-2103-20261020    clang-22   cocci
x86_64       randconfig-2104-20261020    clang-22   cocci
x86_64       randconfig-2105-20261020    clang-22   cocci
x86_64       randconfig-2200-20261020    gcc-14     smatch
x86_64       randconfig-2300-20261020    clang-22   sparse
x86_64       randconfig-2301-20261020    clang-22   sparse
x86_64       randconfig-2302-20261020    clang-22   sparse
x86_64      randconfig-r2106-20261020    gcc-14     cocci
x86_64      randconfig-r2202-20261020    clang-22   smatch
x86_64                       rhel-9.4    clang-22
x86_64                   rhel-9.4-bpf    clang-22
x86_64                  rhel-9.4-func    clang-22
x86_64            rhel-9.4-kselftests    clang-22
x86_64                 rhel-9.4-kunit    clang-22
x86_64                   rhel-9.4-ltp    clang-22
x86_64                  rhel-9.4-rust    clang-22
xtensa                    allnoconfig    gcc-16.2.0
xtensa                   allyesconfig    gcc-16.2.0
xtensa       randconfig-2000-20261020    clang-24
xtensa       randconfig-2001-20261020    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
