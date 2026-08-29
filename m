Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302F522E3F0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787974971; cv=none; b=tNWw3HH6k+ia2qUwT6cvbChOPbpfZEARk7r2If+gjYLbLU4+iH6yDCbW/keE6zyfo/EoHDc4QFPMN8LgFtd10WgH7Dc1Ws9EzWrMuswKjWFCBVPmXeVC6oxkhXGJiu2VJwbkLsRnYPU3zCjhHBgtkG/n6h/iAeoRKCnlQVRsn8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787974971; c=relaxed/simple;
	bh=6z0dnWBafKXYdvmlwvIikffPES600dqGaEQBuxEz3Kc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cdRFWqE45SP9ZLa3cA1HhwC2CfvXHoKXvxYzDdESUxO/GH+QVhdda2d5LCdjop0nZILPISOiQJMja/ldItaQ5At5RmqHxgJPVlX4o/DbcHV005DQTTh45E3Y90PvlErntO8aft6OoGjzm7dktAymEn6u+NkvglLQAIqZL5gpIhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkxqrFNs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkxqrFNs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787974968; x=1819510968;
  h=date:from:to:cc:subject:message-id;
  bh=6z0dnWBafKXYdvmlwvIikffPES600dqGaEQBuxEz3Kc=;
  b=DkxqrFNsSQXA49CybvTbZQmmW9m+lDoe/Q8oMSif1+RajSkzpaIsZt/J
   YPe51dLAM56wqvzbDprAX+hhLhXIZWZTHwtXFHp3kRB9uM/3WJ7fRU9z/
   5sd22EmEmVFuYrUzzLSP/VaAZ+jy1jqByu+x9yQTxa2C7gBUBl9i+D4DC
   f4KpnOjcb6d0ZPT3XBOOgV05JIITseFma/J3w4zwIZMdNkbqmPi8XZBmX
   DTIfupPj9fG00A2uAA3i86cg27b4+L/S+BteZgC38rdLl8wGc3qYMe3GU
   9JpMVV4JvuvzOvaU7MHad9/Gf/Abnhl+/WPb3IidSwKmW3AH7GQF1ZpSw
   g==;
X-CSE-ConnectionGUID: WilM5TkqR0C7zJ7LD3cXXw==
X-CSE-MsgGUID: 3TTlNyk6T0iE1Re6CZlEww==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88603656"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="88603656"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 20:42:47 -0700
X-CSE-ConnectionGUID: iNPK2Yz3RBG1Y6VEwkyiow==
X-CSE-MsgGUID: KqNKfQuSQ9ScO1NURPrEMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="266523115"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Aug 2026 20:42:46 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x09xs-00000000CL5-0ZX3;
	Sat, 29 Aug 2026 03:42:44 +0000
Date: Sat, 29 Aug 2026 11:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 5385e8f4cb975bf4cc651e739ef06a4cc3cc2850
Message-ID: <202608291120.39dCACEc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 5385e8f4cb975bf4cc651e739ef06a4cc3cc2850  Merge branch into tip/master: 'timers/urgent'

elapsed time: 788m

configs tested: 93
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-16.1.0
alpha              allyesconfig    gcc-16.1.0
arc                allmodconfig    clang-24
arc                allmodconfig    gcc-16.1.0
arc                 allnoconfig    gcc-16.1.0
arc                allyesconfig    clang-24
arm                 allnoconfig    clang-17
arm                 allnoconfig    gcc-16.1.0
arm                allyesconfig    clang-24
arm                allyesconfig    gcc-16.1.0
arm64              allmodconfig    clang-24
arm64               allnoconfig    gcc-16.1.0
csky               allmodconfig    gcc-16.1.0
csky                allnoconfig    gcc-16.1.0
hexagon            allmodconfig    clang-24
hexagon            allmodconfig    gcc-16.1.0
hexagon             allnoconfig    clang-24
hexagon             allnoconfig    gcc-16.1.0
i386               allmodconfig    clang-22
i386                allnoconfig    gcc-14
i386                allnoconfig    gcc-16.1.0
i386               allyesconfig    clang-22
loongarch          allmodconfig    clang-24
loongarch           allnoconfig    clang-20
loongarch           allnoconfig    gcc-16.1.0
m68k               allmodconfig    gcc-16.1.0
m68k                allnoconfig    gcc-16.1.0
m68k               allyesconfig    clang-24
m68k               allyesconfig    gcc-16.1.0
microblaze          allnoconfig    gcc-16.1.0
microblaze         allyesconfig    gcc-16.1.0
mips               allmodconfig    gcc-16.1.0
mips                allnoconfig    gcc-16.1.0
mips               allyesconfig    gcc-16.1.0
nios2              allmodconfig    clang-20
nios2              allmodconfig    gcc-11.5.0
nios2               allnoconfig    clang-24
nios2               allnoconfig    gcc-11.5.0
openrisc           allmodconfig    clang-20
openrisc           allmodconfig    gcc-16.1.0
openrisc            allnoconfig    clang-24
openrisc            allnoconfig    gcc-16.1.0
parisc             allmodconfig    gcc-16.1.0
parisc              allnoconfig    clang-24
parisc              allnoconfig    gcc-16.1.0
parisc             allyesconfig    clang-17
parisc             allyesconfig    gcc-16.1.0
powerpc            allmodconfig    gcc-16.1.0
powerpc             allnoconfig    clang-24
powerpc             allnoconfig    gcc-16.1.0
riscv              allmodconfig    clang-24
riscv               allnoconfig    clang-24
riscv               allnoconfig    gcc-16.1.0
riscv              allyesconfig    clang-24
s390               allmodconfig    clang-17
s390               allmodconfig    clang-24
s390                allnoconfig    clang-24
s390               allyesconfig    gcc-16.1.0
sh                 allmodconfig    gcc-16.1.0
sh                  allnoconfig    clang-24
sh                  allnoconfig    gcc-16.1.0
sh                 allyesconfig    clang-17
sh                 allyesconfig    gcc-16.1.0
sh                    defconfig    gcc-14
sparc               allnoconfig    clang-24
sparc               allnoconfig    gcc-16.1.0
sparc64            allmodconfig    clang-20
sparc64               defconfig    gcc-14
um                 allmodconfig    clang-17
um                  allnoconfig    clang-17
um                  allnoconfig    clang-24
um                 allyesconfig    gcc-14
um                 allyesconfig    gcc-16.1.0
um                    defconfig    gcc-14
um               i386_defconfig    gcc-14
um             x86_64_defconfig    gcc-14
x86_64             allmodconfig    clang-22
x86_64              allnoconfig    clang-22
x86_64              allnoconfig    clang-24
x86_64             allyesconfig    clang-22
x86_64                defconfig    gcc-14
x86_64                    kexec    clang-22
x86_64                 rhel-9.4    clang-22
x86_64             rhel-9.4-bpf    gcc-14
x86_64            rhel-9.4-func    clang-22
x86_64      rhel-9.4-kselftests    clang-22
x86_64           rhel-9.4-kunit    gcc-14
x86_64             rhel-9.4-ltp    gcc-14
x86_64            rhel-9.4-rust    clang-22
xtensa              allnoconfig    clang-24
xtensa              allnoconfig    gcc-16.1.0
xtensa             allyesconfig    clang-20
xtensa             allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
