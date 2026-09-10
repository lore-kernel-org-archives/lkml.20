Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6962C0F7F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789000609; cv=none; b=MrCKhUUIGhv66Pk+HXb9lN9LbY+OCbthliUwVRbdYp8sgfW5nAz/DdM4AvhIuwiG4yzclbvoW2cS4hYfYVDppDlWtnfNehX5er62qtxayYuSNFqamYjFepjnVhCW2ixUnFRxf1JIbtfYPBs15FwPQ4vrxpvOdeVk80lkqudYsgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789000609; c=relaxed/simple;
	bh=7eAOCzzrauWfo/ZzsM9CrDD7kYHr46n0dwqWgO4jX6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y/hOdtc8AFLX4erEUNktN/ZyvuPvh0k3QhDOH8x6V7S0iEVKk2HPhBKxW02Km7YiYutcA2PoXUto7WSjShh1yWWrCYwKoH6Pw9/1KGPoV/mcM1bhhOeQCIBfInj2A7nhndL+aO5fz8L7Cc0i4z9PQ/qGg106z0ZKPxqFUUJJ9ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1TrfzH5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1TrfzH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789000607; x=1820536607;
  h=date:from:to:cc:subject:message-id;
  bh=7eAOCzzrauWfo/ZzsM9CrDD7kYHr46n0dwqWgO4jX6g=;
  b=N1TrfzH5FivGkq47MI1V9C5FzIQyzJfPlE4oq9lrczY0bfAaTTNO+CyO
   Vy647oKl4LPwA66Mbo+hwMoPgMc3OVZC0grmFedIaNg2nPXXBq4TnKkdK
   NWnrQj9F182SfVW/PF3xQCImoZKEY+BITL/JtKkC9gdvz2S/nLO5AOxEK
   Ma0EU60QQD7f8Y7Fv2/4Igd4TXDBv3vRigNGnm/2ZGh6e360yxb1+YAOo
   lvWmdZEz7+9DQitheBAM2G5Nvm3s9knAZk6vjo2Wz34Jx5hqYKzl/58RL
   YGN7JYlG3HRoQWQcnLDG56zE0R9dfwdaFsXS5PHin9dAUxS+k+EVtLXQO
   A==;
X-CSE-ConnectionGUID: 5F6Pyn9fSa2WwmE49z40dg==
X-CSE-MsgGUID: Pr53yE+wRAaXzFQ7o3zzUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="112213958"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="112213958"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 17:36:46 -0700
X-CSE-ConnectionGUID: 2BA+iyJrQB+CRF84gR8u3w==
X-CSE-MsgGUID: 01BhLcWvR7K43gtZxChizA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="270983771"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Sep 2026 17:36:45 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4SmR-0000000019s-1xeg;
	Thu, 10 Sep 2026 00:36:43 +0000
Date: Thu, 10 Sep 2026 08:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip:urgent] BUILD SUCCESS
 b4551ede6c21d071f01536d83822d7e04705f33b
Message-ID: <202609100822.OJVgYA1e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: b4551ede6c21d071f01536d83822d7e04705f33b  Merge branch into tip/master: 'x86/mm'

elapsed time: 893m

configs tested: 55
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
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    clang-17
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
