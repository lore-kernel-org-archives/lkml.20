Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BD63546CD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 03:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577981; cv=none; b=KyKbVV8K0hGhNAeer0Ag6LPfu9Qafbb5OLKT/6uPu7MPe0k7I5geZ3YrNq32o22updtYFfJEVlx980eAkuYXjTGAMTWrRtGHK+/x9JVj73wmm/Q+D9l6322Xi5Dzbxr0StmkORY2DQIaKhW2LydAeCdx6v9ALCNfK641KqzLSdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577981; c=relaxed/simple;
	bh=7Db8oLVL1mwvCDthR7PhpFwxKyoi5UTKHrGEP1X47to=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OfGd5ZhFNQVtzFg0YY3IChayajEoUOd1Z5X7517FboDhBDsCLjoXvWLSi/jx1TIwxgn80vSrOCVp3rjI05hhGj71xNSVfJdgS/dYXfxpqpPKQwM7ZbhUZbDLjQVFMTy2Ft/ppkG5qFaw58MCKc0lSnEJTzuU/p9bFGNmDbtmZK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQ9+cJ1K; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQ9+cJ1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788577980; x=1820113980;
  h=date:from:to:cc:subject:message-id;
  bh=7Db8oLVL1mwvCDthR7PhpFwxKyoi5UTKHrGEP1X47to=;
  b=IQ9+cJ1KZi6H93EAFwm+32ws5oiYWzS9sYdtCFrFsUYwr0+D6dMVKbdL
   d/k70hlBy1XtrdLXQxvY1SnEUinh9Xb8Ufh4FNm/2R9K8aJ+kLLOwxphj
   +0tHUw7KL77Tq9gKxeYyShTpwxfm9YLzMmtw75xjrbeDFQh+MATZ76mZ6
   KDBngOIlM1ZrwjYmhECFku9rcgLr/mJsWLhAenYwiT5v6BlHT8uYeurjK
   hpLJR9ssWERK6maxWkSg8+si51eWnwLA3UYYZ53GsMXbXhOvBfxEdcdPG
   RA3X3y+ubMBrzPHAEtDYpJ84jjGXnvM1rsucPVUzH9p4y6Ae76Ib0M6L2
   A==;
X-CSE-ConnectionGUID: 5qyvnXF+QUC5zEzoJIROJA==
X-CSE-MsgGUID: LuPpLHmARWmHJi3QmIl6dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="92947667"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="92947667"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 20:12:57 -0700
X-CSE-ConnectionGUID: r+D3eYI8RDS1tgt8bLpV8w==
X-CSE-MsgGUID: 2K3Q+fYdQIq7VSD0dWRiBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="265843318"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Sep 2026 20:12:53 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2gpn-00000000Ael-2MCr;
	Sat, 05 Sep 2026 03:12:51 +0000
Date: Sat, 05 Sep 2026 11:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched:core] BUILD SUCCESS
 ef9293b3b797228fead10b55ed6bfb99bb7976b4
Message-ID: <202609051102.q7DwMELZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
branch HEAD: ef9293b3b797228fead10b55ed6bfb99bb7976b4  sched: dynamic: Fix preemption model strings

elapsed time: 3774m

configs tested: 74
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    gcc-16.1.0
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-14
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
