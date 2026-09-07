Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AF63BB690
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788807504; cv=none; b=NFrH46fyqU63L3o/4yW8J/yxyk3TJs+OPpLKOCvGZmILMBjxDvsNldPhPVWff7Y20qPpZza8RNzSodJkde/KqRBdxRRAI5K0tFNHd6QisFhBmZLu+StqGmeInhxb9flV97x0GIbeyq4tgdpdT1TCG4MwCxIQ62yI+fSg6pOfKAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788807504; c=relaxed/simple;
	bh=z+pY75vdhvup7aYrcNIaK11v4L5PUEpevTWqYdpQbB0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X5rNe02b+doqoQH7k1BwEfPHV5HO/XFWbBP9LemwYn8WJk1WKB1nPRl5lmGUaLp2DCnvDXQ+gWUFYUuvfp+s2Lt+YxtPli1QBsKICeqcDEs227RYQjvO57+KTJ1W8iBFGIdmPiuIAOBxtTXyPmG6afZcE5AF7uiep+VpXC1eAA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+YBSviW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+YBSviW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788807502; x=1820343502;
  h=date:from:to:cc:subject:message-id;
  bh=z+pY75vdhvup7aYrcNIaK11v4L5PUEpevTWqYdpQbB0=;
  b=f+YBSviWEVIk7/v1VTBsp9ZuZQj8+OigHjlfK+yk2Xaoe0WPU3XZeMHu
   O1aSxoTpNTo27lsR41pObx5JoIoucyziwTA3LoApwIUdnkqmiv4Nny7cV
   IZs5l/oWR4C2Bykd8bCb2HGiZAWUUQXmpmcCYQTgjcT2pQx98zzhDy09k
   80nAWR5Su6OpzHzZ8yhRMybsN1vAVphv/26a029Cyg9VSiaxpji+Mrds8
   xhq2T8qu6vdyoBAhVS6wKPbeD0b9qnzAETlDoQh4g/bqISG6wJ/0hxTmc
   SsQpSVIsQ+cHaZwpD/Yr8rtsHWdQQS3Pv63MBP+ELGJnE6lGSyDW8rZpz
   A==;
X-CSE-ConnectionGUID: 52Pd3UNWSGGOKQrd2YGt4g==
X-CSE-MsgGUID: ZOk5cSJkQjezx0kUAfyBIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88145598"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="88145598"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 11:58:19 -0700
X-CSE-ConnectionGUID: ufNdajnRS46qxCEZhq99jg==
X-CSE-MsgGUID: B6gZ81UGT8WZkElb38Wd4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="295670643"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Sep 2026 11:58:18 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3eXo-000000001Fe-0Juv;
	Mon, 07 Sep 2026 18:58:16 +0000
Date: Tue, 08 Sep 2026 02:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq:urgent] BUILD SUCCESS
 d31fbbade43f880b7e59e2b3a72722fe2725d93f
Message-ID: <202609080200.xdSQuaNA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
branch HEAD: d31fbbade43f880b7e59e2b3a72722fe2725d93f  irqchip/stm32mp-exti: Fix the unit of the hwspinlock timeout

elapsed time: 4511m

configs tested: 65
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
