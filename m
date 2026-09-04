Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80AB374E5B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503112; cv=none; b=YSbwPSCIQ/HC7Beobv1tyuC9R/vCNNNu/Fqp/dC+uh6IK6TPsycAL2REW+LK40ptZi10DqYy52piJfQLP2NnnrnNVTYVK0RWaySCZ7li8cru2sMGBeu6bxdlWl2snCjB5Gguuf0EZqVUB9VwNCqQsdJiGFJ7wu1RQVPP8pXyLbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503112; c=relaxed/simple;
	bh=+zzAPBMHINzsKm/Zma2Zkxr7UG+PmcPgjUGhhOKtVok=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lghlePS7mjU7s7pLM94qnTnm4wDow+yaf1PlDaMQMkIdOnpiS1iheAcsbsO0/YezufsV4Y6o4Brh0Udv5mClpihexQYyGUdMlTJNcgf9iBh3ZWGaRi9Ub0ZFqHIY4R27HkIf17eHaPV+Fz5s+9+TpZYLYnnz8YvgBXSYD6r5TjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JW4X3s2I; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JW4X3s2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788503110; x=1820039110;
  h=date:from:to:cc:subject:message-id;
  bh=+zzAPBMHINzsKm/Zma2Zkxr7UG+PmcPgjUGhhOKtVok=;
  b=JW4X3s2IWTDuhdwqAwzMYkOP84exN+ILU8Q2ekgHtohvW69Dz+ThfVKC
   w7V96TD25boeaox3v4nPZbZdgy3wl2Y167HDleNF8IJXivGC27cl1T4qT
   4QO4liWBaoxlNTjGpJl0qzaCm2c7wimx8hbc/IidT8duEMn56HhivQ542
   mDpizyMmAfkZMrKszbl9FOcE6x/N4d9074bc5GlSronoTI7VZjEVA0sB9
   WS49d+JCinjIP5ztAiHTvuzAC8wT21+etRC+pMgPeKOo8wY94VKmtU5zH
   ERIeg+RAk678ctYhIlB29+3h8vFRStxvp4wGb34gSnU2JzI3RCpwpA61q
   Q==;
X-CSE-ConnectionGUID: f9HejvJwR0K9XGfljeSFFg==
X-CSE-MsgGUID: tsgmRcYaSqes9QaL7B2rFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92697059"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="92697059"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 23:25:08 -0700
X-CSE-ConnectionGUID: kOc0y9QuS1iM5Y64tavBuw==
X-CSE-MsgGUID: +u9HoayJSJSu/EpQVFH1FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273735903"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2026 23:25:07 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2NMG-000000005yA-3H2b;
	Fri, 04 Sep 2026 06:25:04 +0000
Date: Fri, 04 Sep 2026 14:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched:urgent] BUILD SUCCESS
 f0d243a96f2684ad771d678767d17972cf840bd7
Message-ID: <202609041453.XqFGjEhJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/urgent
branch HEAD: f0d243a96f2684ad771d678767d17972cf840bd7  sched/fair: Avoid creating misfits during cache-aware balancing

elapsed time: 2817m

configs tested: 58
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-19
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
