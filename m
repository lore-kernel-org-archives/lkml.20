Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F2A47D937
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063850; cv=none; b=TiQ5aPhzvgyTxq1zw19UMtoRF8icMSSSzh56KcXFJHogEfzdPKIyTSz6uE65s9wZiSqKNZLWC6+xAv29zMU6M0T4TnQVuyidOHd/hJXhAk5Ndgj3WiGjVbxIDYmskyAc/MloTuZ3nrbjhAcZLhdT7wBrfVFzmCt6jDMc5dNu+Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063850; c=relaxed/simple;
	bh=e9PkTtlYqMxaHfAu8LpieQ7czgbprlFJBVaH88XOm7Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jWa7KYp7nX0iCrKyfoE0X8zQjTsOVp7p9f7ws5DZoqXCpUUffHzjSYRD3D85SCeYfD2P5xP7O/hhn7rIP654BejmCscdt5BTuNMhhFb9qyGNNXuMr2AC7YvPWsEy1MMTw1R6xeCWvitoRl+BJwUvMvXCi60jPXjA2LIv5US86Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S396ilnZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S396ilnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789063849; x=1820599849;
  h=date:from:to:cc:subject:message-id;
  bh=e9PkTtlYqMxaHfAu8LpieQ7czgbprlFJBVaH88XOm7Q=;
  b=S396ilnZT92vtTscnnMxFwFdQwdAwBCKGLluFi9w54umMOHZ0/StT4Ll
   PKQMDePCEDCxHaW6zeNvQ94GbL0h/jCu8uZmMFtTOME3/TV8WOAc+yvGZ
   AYlMHuPOB/oKYVwbPVQHRsYPETSwllu3GGtmdF1H5tSgTcOJUx/eZ9mWA
   5yPGW8YJ6MR8jGE0qw2wkG3C+Ag4nuAKL8+TiB70xA/iJ/vhWwGbxKVEj
   dMeE17dfrXYZP52xhHExc/NhA53mUFChPVVjcvSAoNz2qHIxWzKKdp0g/
   ICxF3DcCrOShJencBpSKpxmqJJpe8DiaM8W776ZctqOrupMpjApf5E+X5
   A==;
X-CSE-ConnectionGUID: drN5rKZaSpmLNFrwLoaByg==
X-CSE-MsgGUID: +1IoPQQ/Ss+Lw7l51SxVhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="112297607"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="112297607"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 11:10:49 -0700
X-CSE-ConnectionGUID: uTF0ZRz2T2ydjHdOU1vWPw==
X-CSE-MsgGUID: gf6MNX1ZQBeN0VVwfUvn5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="273649797"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 10 Sep 2026 11:10:47 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4jES-000000000O8-196A;
	Thu, 10 Sep 2026 18:10:44 +0000
Date: Fri, 11 Sep 2026 02:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2026.09.03a] BUILD SUCCESS
 6c5c244f4b239bc4d284e58a2f79a143648557cb
Message-ID: <202609110223.bO8OBHSX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.09.03a
branch HEAD: 6c5c244f4b239bc4d284e58a2f79a143648557cb  EXP drivers/usb/mtu3: Work around mtu3_log_ep double-indirection issue

elapsed time: 1467m

configs tested: 79
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
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
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
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
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
parisc       allyesconfig    gcc-16.1.0
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
