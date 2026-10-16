Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A71345ED3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792121079; cv=none; b=X5I3voc5Nu9SvcFKB/kMH2N/e8S6lIlM7wmLWH4SvA66no2099PhguyZBnoS8TTqcICgXN97ic6laBokeoRs3z8BT4vcvstWTwcyHqLioa/UfpKFqwZrk1OErKVRC2QYUJwoSot3x79ErrPzZcVIDyLrCsMSBOqSP2aJX4032cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792121079; c=relaxed/simple;
	bh=6gahHesjrdUZpjH12wPBRIpzJvR24mI8Mo8lLW7bO+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QL5BcLSej7u+bPd3jXTjzWKNBpMMfG6VdFrB5PrzaFrEm1Wi2NU+36rFjuIThH3iKQtaVthH0CHxDYc+JyofBXWmhGrnPjQYt7L8wnvcOrghWEj+5HzaiXhr/QcbYBMp48yQOrR0QPlOty8EeJ43sguwy0QQy2bJSSECm9fom1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QD8ww7E1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QD8ww7E1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792121077; x=1823657077;
  h=date:from:to:cc:subject:message-id;
  bh=6gahHesjrdUZpjH12wPBRIpzJvR24mI8Mo8lLW7bO+4=;
  b=QD8ww7E1+m0AXivlUcjf4fHV7qinneu61vSMlkQmrASFt0TGYxZZb+aI
   rSEfaNMt9+XObu8jbbXDDN3gm+1AquIAI5KhGx00NffThE9wqopLgEsXr
   YzN4iRvN9U7OMRCV7C2hnEwHYYtesPNupNdldafWlZceUMsWaY+cPeirT
   PPHIg1gix5SjzpZ/n23WtC1NTqhAy6p7YHngjk9HD2baNjXalGlFfGrkE
   7SkH4EZzaOFgLuR4drfXaC3GEV7z+nJR2lZxUxdLbY/6fQrVjGAS8jg6w
   AQ74b6LfCTpNuKgaNvxMBbUU+Nek56b4AXTHqzcEc2iGBCJI3FgBw5SIp
   A==;
X-CSE-ConnectionGUID: UumNaoAJTg2yiKP5/4fdhw==
X-CSE-MsgGUID: QjZIA6bLSny8zSNsxXLWIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="770597"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="770597"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 20:24:37 -0700
X-CSE-ConnectionGUID: O1kIwC0ERzOKWpaE739NBg==
X-CSE-MsgGUID: FWppH4Q0Rim7QW4ydpfklA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1832594"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Oct 2026 20:24:35 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHYYa-00000000HW6-1oYO;
	Fri, 16 Oct 2026 03:24:32 +0000
Date: Fri, 16 Oct 2026 11:24:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2026.10.12a] BUILD SUCCESS
 ac9e7f9b9febac8fa2d08ed106675d1382b38cdd
Message-ID: <202610161127.IpEp9y2U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.10.12a
branch HEAD: ac9e7f9b9febac8fa2d08ed106675d1382b38cdd  sched: Add check for lost wakeups in idle loop

elapsed time: 3449m

configs tested: 384
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                     allnoconfig    gcc-16.1.0
alpha                    allyesconfig    gcc-16.1.0
alpha       randconfig-r2104-20261013    clang-22   cocci
alpha       randconfig-r2106-20261013    clang-22   cocci
alpha       randconfig-r2109-20261014    gcc-13.4.0 cocci
arc                      allmodconfig    gcc-16.1.0
arc                       allnoconfig    gcc-16.1.0
arc                      allyesconfig    gcc-16.1.0
arc          randconfig-2000-20261013    gcc-8.5.0
arc          randconfig-2000-20261014    gcc-10.5.0
arc          randconfig-2000-20261014    gcc-16.1.0
arc          randconfig-2000-20261015    gcc-15.2.0
arc          randconfig-2001-20261013    gcc-8.5.0
arc          randconfig-2001-20261014    gcc-10.5.0
arc          randconfig-2001-20261015    gcc-15.2.0
arc         randconfig-r2107-20261013    clang-22   cocci
arc         randconfig-r2200-20261013    gcc-13.4.0 smatch
arc         randconfig-r2300-20261013    gcc-8.5.0  sparse
arc         randconfig-r2306-20261014    gcc-8.5.0  sparse
arc         randconfig-r2307-20261014    gcc-8.5.0  sparse
arc         randconfig-r2307-20261015    clang-24   sparse
arc         randconfig-r2310-20261015    clang-24   sparse
arc         randconfig-r2311-20261014    gcc-12.5.0 sparse
arm                       allnoconfig    clang-17
arm                      allyesconfig    gcc-16.1.0
arm          randconfig-2000-20261013    gcc-8.5.0
arm          randconfig-2000-20261014    clang-17
arm          randconfig-2000-20261014    gcc-10.5.0
arm          randconfig-2000-20261015    gcc-15.2.0
arm          randconfig-2001-20261013    gcc-8.5.0
arm          randconfig-2001-20261014    clang-20
arm          randconfig-2001-20261014    gcc-10.5.0
arm          randconfig-2001-20261015    gcc-15.2.0
arm         randconfig-r2101-20261013    clang-24   cocci
arm         randconfig-r2111-20261013    gcc-14.3.0 cocci
arm         randconfig-r2202-20261015    gcc-8.5.0  smatch
arm         randconfig-r2307-20261013    clang-19   sparse
arm64                    allmodconfig    clang-24
arm64                     allnoconfig    gcc-16.1.0
arm64        randconfig-2000-20261013    gcc-9.5.0
arm64        randconfig-2000-20261014    gcc-16.1.0
arm64        randconfig-2000-20261015    gcc-16.1.0
arm64        randconfig-2001-20261013    gcc-9.5.0
arm64        randconfig-2001-20261014    gcc-16.1.0
arm64        randconfig-2001-20261015    gcc-16.1.0
arm64       randconfig-r2100-20261014    gcc-13.4.0 cocci
arm64       randconfig-r2103-20261013    clang-24   cocci
arm64       randconfig-r2201-20261014    clang-24   smatch
arm64       randconfig-r2306-20261013    gcc-10.5.0 sparse
arm64       randconfig-r2309-20261013    clang-19   sparse
arm64       randconfig-r2311-20261013    clang-24   sparse
arm64       randconfig-r2311-20261015    clang-24   sparse
csky                     allmodconfig    gcc-16.1.0
csky                      allnoconfig    gcc-16.1.0
csky         randconfig-2000-20261013    gcc-9.5.0
csky         randconfig-2000-20261014    gcc-16.1.0
csky         randconfig-2000-20261015    gcc-16.1.0
csky         randconfig-2001-20261013    gcc-9.5.0
csky         randconfig-2001-20261014    gcc-16.1.0
csky         randconfig-2001-20261015    gcc-16.1.0
csky        randconfig-r2101-20261013    gcc-12.5.0 cocci
csky        randconfig-r2108-20261014    gcc-13.4.0 cocci
csky        randconfig-r2111-20261013    gcc-10.5.0 cocci
csky        randconfig-r2302-20261014    gcc-15.2.0 sparse
csky        randconfig-r2303-20261015    clang-24   sparse
hexagon                  allmodconfig    clang-24
hexagon                   allnoconfig    clang-24
hexagon      randconfig-2000-20261013    gcc-9.5.0
hexagon      randconfig-2000-20261014    gcc-16.1.0
hexagon      randconfig-2000-20261015    gcc-16.1.0
hexagon      randconfig-2001-20261013    gcc-9.5.0
hexagon      randconfig-2001-20261014    gcc-16.1.0
hexagon      randconfig-2001-20261015    gcc-16.1.0
hexagon     randconfig-r2101-20261013    clang-24   cocci
hexagon     randconfig-r2101-20261014    clang-17   cocci
hexagon     randconfig-r2102-20261013    clang-24   cocci
hexagon     randconfig-r2103-20261013    clang-24   cocci
hexagon     randconfig-r2108-20261014    clang-17   cocci
hexagon     randconfig-r2109-20261014    clang-24   cocci
hexagon     randconfig-r2200-20261015    clang-24   smatch
hexagon     randconfig-r2301-20261013    gcc-8.5.0  sparse
hexagon     randconfig-r2302-20261015    clang-24   sparse
i386                     allmodconfig    gcc-14
i386                      allnoconfig    gcc-14
i386         randconfig-2000-20261013    gcc-8.5.0
i386         randconfig-2000-20261014    gcc-10.5.0
i386         randconfig-2000-20261014    gcc-14
i386         randconfig-2000-20261015    gcc-15.2.0
i386         randconfig-2001-20261013    gcc-8.5.0
i386         randconfig-2001-20261014    gcc-10.5.0
i386         randconfig-2001-20261014    gcc-12
i386         randconfig-2001-20261015    gcc-15.2.0
i386         randconfig-2100-20261013    gcc-14     cocci
i386         randconfig-2100-20261014    gcc-13     cocci
i386         randconfig-2100-20261015    gcc-14     cocci
i386         randconfig-2101-20261013    gcc-14     cocci
i386         randconfig-2101-20261014    gcc-13     cocci
i386         randconfig-2101-20261015    gcc-14     cocci
i386         randconfig-2102-20261013    gcc-14     cocci
i386         randconfig-2102-20261014    gcc-13     cocci
i386         randconfig-2102-20261015    gcc-14     cocci
i386         randconfig-2103-20261013    gcc-14     cocci
i386         randconfig-2103-20261014    gcc-13     cocci
i386         randconfig-2103-20261015    gcc-14     cocci
i386         randconfig-2104-20261013    gcc-14     cocci
i386         randconfig-2104-20261014    gcc-13     cocci
i386         randconfig-2104-20261015    gcc-14     cocci
i386         randconfig-2105-20261013    gcc-14     cocci
i386         randconfig-2105-20261014    gcc-13     cocci
i386         randconfig-2105-20261015    gcc-14     cocci
i386         randconfig-2200-20261013    gcc-14     smatch
i386         randconfig-2200-20261014    clang-22   smatch
i386         randconfig-2200-20261015    clang-22   smatch
i386         randconfig-2300-20261013    gcc-14     sparse
i386         randconfig-2300-20261014    clang-22   sparse
i386         randconfig-2300-20261015    gcc-14     sparse
i386         randconfig-2301-20261013    gcc-14     sparse
i386         randconfig-2301-20261014    clang-22   sparse
i386         randconfig-2301-20261015    gcc-14     sparse
i386         randconfig-2302-20261013    gcc-14     sparse
i386         randconfig-2302-20261014    clang-22   sparse
i386         randconfig-2302-20261015    gcc-14     sparse
i386        randconfig-r2100-20261013    clang-24   cocci
i386        randconfig-r2102-20261013    clang-24   cocci
i386        randconfig-r2104-20261013    gcc-10.5.0 cocci
i386        randconfig-r2111-20261013    clang-22   cocci
i386        randconfig-r2300-20261014    gcc-13.4.0 sparse
i386        randconfig-r2305-20261013    clang-22   sparse
i386        randconfig-r2305-20261014    gcc-8.5.0  sparse
i386        randconfig-r2308-20261015    clang-24   sparse
loongarch                allmodconfig    clang-19
loongarch                 allnoconfig    clang-20
loongarch    randconfig-2000-20261013    gcc-11.5.0
loongarch    randconfig-2000-20261014    gcc-16.1.0
loongarch    randconfig-2000-20261014    gcc-8.5.0
loongarch    randconfig-2000-20261015    gcc-8.5.0
loongarch    randconfig-2001-20261013    gcc-11.5.0
loongarch    randconfig-2001-20261014    gcc-16.1.0
loongarch    randconfig-2001-20261014    gcc-8.5.0
loongarch    randconfig-2001-20261015    gcc-8.5.0
loongarch   randconfig-r2100-20261013    gcc-12.5.0 cocci
loongarch   randconfig-r2110-20261013    gcc-14.3.0 cocci
loongarch   randconfig-r2201-20261013    clang-24   smatch
loongarch   randconfig-r2302-20261014    gcc-8.5.0  sparse
loongarch   randconfig-r2303-20261014    gcc-13.4.0 sparse
loongarch   randconfig-r2306-20261013    clang-24   sparse
m68k                     allmodconfig    gcc-16.1.0
m68k                      allnoconfig    gcc-16.1.0
m68k                     allyesconfig    gcc-16.1.0
m68k        randconfig-r2103-20261013    gcc-12.5.0 cocci
m68k        randconfig-r2103-20261014    gcc-13.4.0 cocci
m68k        randconfig-r2103-20261014    gcc-8.5.0  cocci
m68k        randconfig-r2109-20261013    gcc-12.5.0 cocci
m68k        randconfig-r2303-20261014    gcc-8.5.0  sparse
m68k        randconfig-r2306-20261015    clang-24   sparse
microblaze                allnoconfig    gcc-16.1.0
microblaze               allyesconfig    gcc-16.1.0
microblaze  randconfig-r2200-20261015    gcc-8.5.0  smatch
microblaze  randconfig-r2202-20261014    gcc-9.5.0  smatch
microblaze  randconfig-r2307-20261013    clang-24   sparse
microblaze  randconfig-r2309-20261015    clang-24   sparse
mips                      allnoconfig    gcc-16.1.0
mips                     allyesconfig    gcc-16.1.0
mips        randconfig-r2101-20261014    gcc-13.4.0 cocci
mips        randconfig-r2105-20261013    gcc-10.5.0 cocci
mips        randconfig-r2106-20261013    gcc-10.5.0 cocci
mips        randconfig-r2110-20261013    gcc-10.5.0 cocci
mips        randconfig-r2202-20261013    clang-24   smatch
mips        randconfig-r2300-20261013    gcc-8.5.0  sparse
mips        randconfig-r2301-20261013    gcc-8.5.0  sparse
mips        randconfig-r2302-20261013    gcc-8.5.0  sparse
mips        randconfig-r2303-20261014    gcc-8.5.0  sparse
mips        randconfig-r2304-20261014    gcc-13.4.0 sparse
mips        randconfig-r2310-20261013    gcc-10.5.0 sparse
nios2                    allmodconfig    gcc-11.5.0
nios2                     allnoconfig    gcc-11.5.0
nios2        randconfig-2000-20261013    gcc-11.5.0
nios2        randconfig-2000-20261014    gcc-8.5.0
nios2        randconfig-2000-20261015    gcc-8.5.0
nios2        randconfig-2001-20261013    gcc-11.5.0
nios2        randconfig-2001-20261014    gcc-8.5.0
nios2        randconfig-2001-20261015    gcc-8.5.0
nios2       randconfig-r2106-20261013    gcc-14.3.0 cocci
nios2       randconfig-r2201-20261013    gcc-8.5.0  smatch
nios2       randconfig-r2202-20261013    gcc-11.5.0 smatch
nios2       randconfig-r2302-20261013    clang-22   sparse
nios2       randconfig-r2302-20261014    gcc-13.4.0 sparse
nios2       randconfig-r2305-20261013    gcc-8.5.0  sparse
nios2       randconfig-r2311-20261013    clang-19   sparse
openrisc                 allmodconfig    gcc-16.1.0
openrisc                  allnoconfig    gcc-16.1.0
openrisc    randconfig-r2100-20261013    clang-24   cocci
openrisc    randconfig-r2201-20261013    gcc-15.2.0 smatch
openrisc    randconfig-r2300-20261015    clang-24   sparse
openrisc    randconfig-r2306-20261014    gcc-9.5.0  sparse
parisc                   allmodconfig    gcc-16.1.0
parisc                    allnoconfig    gcc-16.1.0
parisc                   allyesconfig    gcc-16.1.0
parisc       randconfig-2000-20261013    gcc-11.5.0
parisc       randconfig-2000-20261014    gcc-8.5.0
parisc       randconfig-2000-20261015    gcc-8.5.0
parisc       randconfig-2001-20261013    gcc-11.5.0
parisc       randconfig-2001-20261014    gcc-8.5.0
parisc       randconfig-2001-20261015    gcc-8.5.0
parisc      randconfig-r2108-20261013    clang-24   cocci
parisc      randconfig-r2304-20261014    gcc-11.5.0 sparse
parisc      randconfig-r2304-20261015    clang-24   sparse
parisc      randconfig-r2311-20261013    gcc-10.5.0 sparse
powerpc                   allnoconfig    gcc-16.1.0
powerpc      randconfig-2000-20261013    gcc-14
powerpc      randconfig-2000-20261014    clang-17
powerpc      randconfig-2001-20261013    gcc-14
powerpc      randconfig-2001-20261014    clang-24
powerpc     randconfig-r2107-20261013    gcc-10.5.0 cocci
powerpc     randconfig-r2110-20261013    clang-22   cocci
powerpc     randconfig-r2305-20261013    gcc-8.5.0  sparse
powerpc     randconfig-r2308-20261014    gcc-8.5.0  sparse
powerpc     randconfig-r2310-20261014    gcc-8.5.0  sparse
powerpc64    randconfig-2000-20261013    gcc-14
powerpc64    randconfig-2000-20261014    gcc-11.5.0
powerpc64    randconfig-2001-20261013    gcc-14
powerpc64    randconfig-2001-20261014    clang-19
powerpc64   randconfig-r2109-20261013    clang-24   cocci
powerpc64   randconfig-r2300-20261013    clang-22   sparse
powerpc64   randconfig-r2304-20261014    gcc-8.5.0  sparse
powerpc64   randconfig-r2305-20261015    clang-24   sparse
powerpc64   randconfig-r2309-20261013    clang-24   sparse
powerpc64   randconfig-r2310-20261013    clang-24   sparse
riscv                    allmodconfig    clang-24
riscv                     allnoconfig    gcc-16.1.0
riscv                    allyesconfig    clang-24
riscv        randconfig-2000-20261013    gcc-15.2.0
riscv        randconfig-2000-20261014    clang-24
riscv        randconfig-2000-20261014    gcc-16.1.0
riscv        randconfig-2001-20261013    gcc-15.2.0
riscv        randconfig-2001-20261014    gcc-11.5.0
riscv        randconfig-2001-20261014    gcc-16.1.0
riscv       randconfig-r2301-20261015    clang-24   sparse
riscv       randconfig-r2308-20261013    gcc-10.5.0 sparse
s390                     allmodconfig    clang-24
s390                      allnoconfig    clang-24
s390         randconfig-2000-20261013    gcc-15.2.0
s390         randconfig-2000-20261014    gcc-16.1.0
s390         randconfig-2000-20261014    gcc-8.5.0
s390         randconfig-2001-20261013    gcc-15.2.0
s390         randconfig-2001-20261014    gcc-11.5.0
s390         randconfig-2001-20261014    gcc-16.1.0
s390        randconfig-r2100-20261014    gcc-8.5.0  cocci
s390        randconfig-r2105-20261013    gcc-14.3.0 cocci
s390        randconfig-r2108-20261013    gcc-12.5.0 cocci
s390        randconfig-r2109-20261013    clang-24   cocci
s390        randconfig-r2200-20261013    clang-24   smatch
s390        randconfig-r2304-20261013    gcc-8.5.0  sparse
s390        randconfig-r2307-20261013    gcc-10.5.0 sparse
s390        randconfig-r2307-20261014    clang-17   sparse
s390        randconfig-r2308-20261014    gcc-11.5.0 sparse
s390        randconfig-r2309-20261014    gcc-9.5.0  sparse
sh                       allmodconfig    gcc-16.1.0
sh                        allnoconfig    gcc-16.1.0
sh                       allyesconfig    gcc-16.1.0
sh           randconfig-2000-20261013    gcc-15.2.0
sh           randconfig-2000-20261014    gcc-16.1.0
sh           randconfig-2001-20261013    gcc-15.2.0
sh           randconfig-2001-20261014    gcc-10.5.0
sh           randconfig-2001-20261014    gcc-16.1.0
sh          randconfig-r2309-20261014    gcc-8.5.0  sparse
sh          randconfig-r2311-20261014    gcc-8.5.0  sparse
sparc                     allnoconfig    gcc-16.1.0
sparc        randconfig-2000-20261013    gcc-16.1.0
sparc        randconfig-2000-20261014    gcc-14.3.0
sparc        randconfig-2000-20261015    gcc-15.2.0
sparc        randconfig-2001-20261013    gcc-16.1.0
sparc        randconfig-2001-20261014    gcc-14.3.0
sparc        randconfig-2001-20261015    gcc-15.2.0
sparc       randconfig-r2108-20261013    clang-24   cocci
sparc       randconfig-r2300-20261014    gcc-8.5.0  sparse
sparc       randconfig-r2301-20261014    gcc-13.4.0 sparse
sparc       randconfig-r2303-20261013    gcc-8.5.0  sparse
sparc       randconfig-r2304-20261013    clang-22   sparse
sparc       randconfig-r2306-20261013    clang-19   sparse
sparc64                  allmodconfig    clang-20
sparc64      randconfig-2000-20261013    gcc-16.1.0
sparc64      randconfig-2000-20261014    gcc-14.3.0
sparc64      randconfig-2000-20261015    gcc-15.2.0
sparc64      randconfig-2001-20261013    gcc-16.1.0
sparc64      randconfig-2001-20261014    gcc-14.3.0
sparc64      randconfig-2001-20261015    gcc-15.2.0
sparc64     randconfig-r2102-20261014    gcc-13.4.0 cocci
sparc64     randconfig-r2102-20261014    gcc-8.5.0  cocci
sparc64     randconfig-r2200-20261013    clang-24   smatch
sparc64     randconfig-r2200-20261014    clang-24   smatch
sparc64     randconfig-r2201-20261014    clang-24   smatch
sparc64     randconfig-r2202-20261014    clang-22   smatch
sparc64     randconfig-r2300-20261014    clang-20   sparse
sparc64     randconfig-r2301-20261014    clang-24   sparse
sparc64     randconfig-r2301-20261014    gcc-8.5.0  sparse
sparc64     randconfig-r2303-20261013    clang-22   sparse
sparc64     randconfig-r2305-20261014    gcc-13.4.0 sparse
um                       allmodconfig    clang-17
um                        allnoconfig    clang-17
um                       allyesconfig    gcc-14
um           randconfig-2000-20261013    gcc-16.1.0
um           randconfig-2000-20261014    gcc-14.3.0
um           randconfig-2000-20261015    gcc-15.2.0
um           randconfig-2001-20261013    gcc-16.1.0
um           randconfig-2001-20261014    gcc-14.3.0
um           randconfig-2001-20261015    gcc-15.2.0
um          randconfig-r2102-20261013    gcc-12.5.0 cocci
um          randconfig-r2200-20261014    clang-17   smatch
um          randconfig-r2308-20261013    clang-19   sparse
um          randconfig-r2310-20261013    clang-19   sparse
x86_64                   allmodconfig    clang-22
x86_64                    allnoconfig    clang-22
x86_64                   allyesconfig    clang-22
x86_64                          kexec    clang-22
x86_64       randconfig-1012-20261015    clang-22
x86_64       randconfig-1013-20261015    clang-22
x86_64       randconfig-1014-20261015    clang-22
x86_64       randconfig-1015-20261015    clang-22
x86_64       randconfig-1016-20261015    gcc-14
x86_64       randconfig-1017-20261015    gcc-13
x86_64       randconfig-2000-20261013    gcc-14
x86_64       randconfig-2000-20261014    clang-22
x86_64       randconfig-2001-20261013    gcc-14
x86_64       randconfig-2001-20261014    clang-22
x86_64       randconfig-2100-20261013    clang-22   cocci
x86_64       randconfig-2100-20261014    clang-22   cocci
x86_64       randconfig-2100-20261014    gcc-14     cocci
x86_64       randconfig-2100-20261015    clang-22   cocci
x86_64       randconfig-2101-20261013    clang-22   cocci
x86_64       randconfig-2101-20261014    clang-22   cocci
x86_64       randconfig-2101-20261015    clang-22   cocci
x86_64       randconfig-2102-20261013    clang-22   cocci
x86_64       randconfig-2102-20261014    clang-22   cocci
x86_64       randconfig-2102-20261015    clang-22   cocci
x86_64       randconfig-2103-20261013    clang-22   cocci
x86_64       randconfig-2103-20261014    clang-22   cocci
x86_64       randconfig-2103-20261014    gcc-14     cocci
x86_64       randconfig-2103-20261015    clang-22   cocci
x86_64       randconfig-2104-20261013    clang-22   cocci
x86_64       randconfig-2104-20261014    clang-22   cocci
x86_64       randconfig-2104-20261015    clang-22   cocci
x86_64       randconfig-2105-20261013    clang-22   cocci
x86_64       randconfig-2105-20261014    clang-22   cocci
x86_64       randconfig-2105-20261015    clang-22   cocci
x86_64       randconfig-2200-20261013    gcc-13     smatch
x86_64       randconfig-2200-20261014    clang-22   smatch
x86_64       randconfig-2300-20261013    gcc-14     sparse
x86_64       randconfig-2300-20261014    clang-22   sparse
x86_64       randconfig-2300-20261015    gcc-14     sparse
x86_64       randconfig-2301-20261013    gcc-14     sparse
x86_64       randconfig-2301-20261014    clang-22   sparse
x86_64       randconfig-2301-20261015    gcc-14     sparse
x86_64       randconfig-2302-20261013    gcc-14     sparse
x86_64       randconfig-2302-20261014    clang-22   sparse
x86_64       randconfig-2302-20261015    gcc-14     sparse
x86_64      randconfig-r2202-20261013    gcc-14     smatch
x86_64      randconfig-r2301-20261013    clang-22   sparse
x86_64      randconfig-r2302-20261013    gcc-8.5.0  sparse
x86_64      randconfig-r2303-20261013    gcc-8.5.0  sparse
x86_64      randconfig-r2304-20261013    gcc-8.5.0  sparse
x86_64      randconfig-r2305-20261014    gcc-14     sparse
x86_64      randconfig-r2308-20261013    clang-24   sparse
x86_64                       rhel-9.4    clang-22
x86_64                   rhel-9.4-bpf    clang-22
x86_64                  rhel-9.4-func    clang-22
x86_64            rhel-9.4-kselftests    clang-22
x86_64                 rhel-9.4-kunit    clang-22
x86_64                   rhel-9.4-ltp    clang-22
x86_64                  rhel-9.4-rust    clang-22
x86_64                  rhel-9.4-rust    clang-22
xtensa                    allnoconfig    gcc-16.1.0
xtensa                   allyesconfig    gcc-16.1.0
xtensa       randconfig-2000-20261013    gcc-16.1.0
xtensa       randconfig-2000-20261014    gcc-14.3.0
xtensa       randconfig-2000-20261015    gcc-15.2.0
xtensa       randconfig-2001-20261013    gcc-16.1.0
xtensa       randconfig-2001-20261014    gcc-14.3.0
xtensa       randconfig-2001-20261015    gcc-15.2.0
xtensa      randconfig-r2104-20261013    gcc-14.3.0 cocci
xtensa      randconfig-r2105-20261013    clang-22   cocci
xtensa      randconfig-r2107-20261013    gcc-14.3.0 cocci
xtensa      randconfig-r2309-20261013    gcc-10.5.0 sparse
xtensa      randconfig-r2310-20261014    gcc-10.5.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
