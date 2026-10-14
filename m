Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FA937B018
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993676; cv=none; b=FdRSLGAdrigfwsRFCHihQYio1sycRcGsMrngxDC/ZSTmX71tGkmPyypdwZdvGJ6mUYywSymosdC1CEG9d9Mw3UnI4e7AkZi2YFn0ncKDHTSJG60lT0p/OmXQ1Dsi91DNPIkLnEMVQnEAzRvMY/1D9bnsxyI3uyYRb3P2ScEHNMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993676; c=relaxed/simple;
	bh=7xNfBcx3j8ZQ6OgpNEsIGeBTzCja5U6Vo9xw0gJ1OtI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C9qWQL3VrKsGMb6VyWr9GQa6enASEl+zkzJRD9EzR/ufQfvJ5nq/P7FXyc30R8r8zZ1AB0allHyiNSt2yGoDraaEOXJ4XrQSFcPAJkNQewiDSc6Isnd9X5aR2GRB2osZyOvOm5siQ+ZSd4ADbsQBNvGBCkmGSmXb5sqxoTbLBY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTuK2RWf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTuK2RWf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791993673; x=1823529673;
  h=date:from:to:cc:subject:message-id;
  bh=7xNfBcx3j8ZQ6OgpNEsIGeBTzCja5U6Vo9xw0gJ1OtI=;
  b=bTuK2RWf5ZPvRmv7UHKBBnBJV4IgqGJ8toRmctuBXn1N+qL5icMIG4Yk
   4bDw34yJVs2QI5+XKOqBgUQUSGLBzyz2CoXgCHxM2sO4dXxOQZDaH0md8
   QcuL0PPY1d0OixsbhV0ttyOlEcVWyw2K3djfheYPjroaA4uRii1NWejFY
   WSZTn3Y+wzLl6Ue1nLB4/Gy+9OcN9Zs9qhRIxZdJY0i3KKQ2ovDSibw3/
   LGzTa9++uD5y+jOyeeqWjklLWr/bw3iLXeW7461g6hckW+g3ffhusDW0w
   Nuym5SrY+pGPOTgoWxzM4jDxYLIQwelGTi72a4OFyd27nATgz0FDolarG
   g==;
X-CSE-ConnectionGUID: PdViOKY8RrutO2cHw3JEZQ==
X-CSE-MsgGUID: SBc0NVFGS1uoh8/mcIePVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="644502"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="644502"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 09:01:13 -0700
X-CSE-ConnectionGUID: DMpq4fjzQ5OFE1l8ZGhvDA==
X-CSE-MsgGUID: fyicKvGpQgaXSvCFPlHaPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1823743"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Oct 2026 09:01:11 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH1Ph-00000000ErL-0Jnt;
	Wed, 14 Oct 2026 16:01:09 +0000
Date: Thu, 15 Oct 2026 00:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:core] BUILD SUCCESS
 41d1119e2f8577b4bd01d31321c6761af9140ce7
Message-ID: <202610150020.aTzq4e6C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/core
branch HEAD: 41d1119e2f8577b4bd01d31321c6761af9140ce7  x86/kcfi: Emit the FineIBT paranoid "cs" prefix as a byte

elapsed time: 1368m

configs tested: 628
configs skipped: 144

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20261014    gcc-8.5.0  cocci
alpha                randconfig-r2104-20261013    clang-22   cocci
alpha                randconfig-r2105-20261013    gcc-8.5.0  cocci
alpha                randconfig-r2106-20261013    clang-22   cocci
alpha                randconfig-r2110-20261012    gcc-10.5.0 cocci
alpha                randconfig-r2308-20261014    gcc-14.3.0 sparse
alpha                randconfig-r2309-20261012    gcc-12.5.0 sparse
alpha                randconfig-r2309-20261013    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261014    clang-17
arc                   randconfig-1001-20261014    clang-17
arc                   randconfig-2000-20261012    gcc-16.1.0
arc                   randconfig-2000-20261013    gcc-8.5.0
arc                   randconfig-2000-20261014    gcc-10.5.0
arc                   randconfig-2001-20261012    gcc-16.1.0
arc                   randconfig-2001-20261013    gcc-8.5.0
arc                   randconfig-2001-20261014    gcc-10.5.0
arc                  randconfig-r2102-20261013    clang-24   cocci
arc                  randconfig-r2102-20261014    gcc-8.5.0  cocci
arc                  randconfig-r2107-20261013    clang-22   cocci
arc                  randconfig-r2109-20261013    clang-24   cocci
arc                  randconfig-r2110-20261013    gcc-8.5.0  cocci
arc                  randconfig-r2200-20261012    gcc-16.1.0 smatch
arc                  randconfig-r2200-20261013    gcc-13.4.0 smatch
arc                  randconfig-r2300-20261013    gcc-8.5.0  sparse
arc                  randconfig-r2301-20261012    gcc-11.5.0 sparse
arc                  randconfig-r2301-20261013    gcc-12.5.0 sparse
arc                  randconfig-r2310-20261012    gcc-12.5.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20261014    clang-17
arm                   randconfig-1001-20261014    clang-17
arm                   randconfig-1002-20261014    clang-17
arm                   randconfig-1003-20261014    clang-17
arm                   randconfig-2000-20261012    gcc-16.1.0
arm                   randconfig-2000-20261013    gcc-8.5.0
arm                   randconfig-2000-20261014    gcc-10.5.0
arm                   randconfig-2001-20261012    gcc-16.1.0
arm                   randconfig-2001-20261013    gcc-8.5.0
arm                   randconfig-2001-20261014    gcc-10.5.0
arm                  randconfig-r2101-20261013    clang-24   cocci
arm                  randconfig-r2104-20261013    gcc-8.5.0  cocci
arm                  randconfig-r2107-20261012    gcc-11.5.0 cocci
arm                  randconfig-r2107-20261012    gcc-9.5.0  cocci
arm                  randconfig-r2109-20261013    clang-24   cocci
arm                  randconfig-r2111-20261013    gcc-14.3.0 cocci
arm                  randconfig-r2202-20261013    gcc-8.5.0  smatch
arm                  randconfig-r2306-20261012    gcc-12.5.0 sparse
arm                  randconfig-r2307-20261013    clang-19   sparse
arm                  randconfig-r2308-20261013    clang-24   sparse
arm                  randconfig-r2311-20261012    gcc-12.5.0 sparse
arm                  randconfig-r2311-20261013    gcc-13.4.0 sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261014    gcc-16.1.0
arm64                 randconfig-1001-20261014    gcc-16.1.0
arm64                 randconfig-1002-20261014    gcc-16.1.0
arm64                 randconfig-1003-20261014    gcc-16.1.0
arm64                 randconfig-2000-20261012    gcc-16.1.0
arm64                 randconfig-2000-20261013    gcc-9.5.0
arm64                 randconfig-2000-20261014    gcc-16.1.0
arm64                 randconfig-2001-20261012    gcc-16.1.0
arm64                 randconfig-2001-20261013    gcc-9.5.0
arm64                 randconfig-2001-20261014    gcc-16.1.0
arm64                randconfig-r2101-20261012    gcc-15.2.0 cocci
arm64                randconfig-r2101-20261014    gcc-11.5.0 cocci
arm64                randconfig-r2103-20261013    clang-24   cocci
arm64                randconfig-r2104-20261014    gcc-10.5.0 cocci
arm64                randconfig-r2105-20261014    gcc-8.5.0  cocci
arm64                randconfig-r2108-20261012    gcc-15.2.0 cocci
arm64                randconfig-r2111-20261012    gcc-11.5.0 cocci
arm64                randconfig-r2200-20261013    gcc-8.5.0  smatch
arm64                randconfig-r2201-20261012    gcc-10.5.0 smatch
arm64                randconfig-r2201-20261013    gcc-11.5.0 smatch
arm64                randconfig-r2303-20261012    clang-24   sparse
arm64                randconfig-r2305-20261012    clang-24   sparse
arm64                randconfig-r2305-20261013    gcc-12.5.0 sparse
arm64                randconfig-r2305-20261014    clang-24   sparse
arm64                randconfig-r2306-20261013    gcc-10.5.0 sparse
arm64                randconfig-r2307-20261012    gcc-16.1.0 sparse
arm64                randconfig-r2309-20261013    clang-19   sparse
arm64                randconfig-r2311-20261012    gcc-12.5.0 sparse
arm64                randconfig-r2311-20261013    clang-24   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261014    gcc-16.1.0
csky                  randconfig-1001-20261014    gcc-16.1.0
csky                  randconfig-2000-20261012    gcc-16.1.0
csky                  randconfig-2000-20261013    gcc-9.5.0
csky                  randconfig-2000-20261014    gcc-16.1.0
csky                  randconfig-2001-20261012    gcc-16.1.0
csky                  randconfig-2001-20261013    gcc-9.5.0
csky                  randconfig-2001-20261014    gcc-16.1.0
csky                 randconfig-r2101-20261013    gcc-12.5.0 cocci
csky                 randconfig-r2106-20261012    gcc-14     cocci
csky                 randconfig-r2106-20261014    gcc-10.5.0 cocci
csky                 randconfig-r2111-20261012    gcc-10.5.0 cocci
csky                 randconfig-r2111-20261013    gcc-10.5.0 cocci
csky                 randconfig-r2200-20261012    gcc-10.5.0 smatch
csky                 randconfig-r2201-20261014    gcc-14.3.0 smatch
csky                 randconfig-r2300-20261013    gcc-16.1.0 sparse
csky                 randconfig-r2302-20261012    clang-24   sparse
csky                 randconfig-r2303-20261013    gcc-16.1.0 sparse
csky                 randconfig-r2304-20261013    gcc-16.1.0 sparse
csky                 randconfig-r2306-20261012    gcc-12.5.0 sparse
csky                 randconfig-r2309-20261014    gcc-14.3.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261014    clang-18
hexagon               randconfig-1001-20261014    clang-18
hexagon               randconfig-2000-20261012    gcc-16.1.0
hexagon               randconfig-2000-20261013    gcc-9.5.0
hexagon               randconfig-2000-20261014    gcc-16.1.0
hexagon               randconfig-2001-20261012    gcc-16.1.0
hexagon               randconfig-2001-20261013    gcc-9.5.0
hexagon               randconfig-2001-20261014    gcc-16.1.0
hexagon              randconfig-r2101-20261013    clang-24   cocci
hexagon              randconfig-r2102-20261012    clang-24   cocci
hexagon              randconfig-r2102-20261013    clang-24   cocci
hexagon              randconfig-r2103-20261013    clang-21   cocci
hexagon              randconfig-r2103-20261013    clang-24   cocci
hexagon              randconfig-r2103-20261014    gcc-11.5.0 cocci
hexagon              randconfig-r2107-20261013    clang-24   cocci
hexagon              randconfig-r2109-20261012    clang-24   cocci
hexagon              randconfig-r2110-20261012    gcc-14     cocci
hexagon              randconfig-r2301-20261013    gcc-8.5.0  sparse
hexagon              randconfig-r2304-20261014    clang-24   sparse
hexagon              randconfig-r2305-20261012    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261014    gcc-14
i386        buildonly-randconfig-1001-20261014    gcc-14
i386        buildonly-randconfig-1002-20261014    gcc-14
i386        buildonly-randconfig-1003-20261014    gcc-14
i386        buildonly-randconfig-1004-20261014    gcc-14
i386        buildonly-randconfig-1005-20261014    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261014    clang-22
i386                  randconfig-1001-20261014    clang-22
i386                  randconfig-1002-20261014    clang-22
i386                  randconfig-1003-20261014    clang-22
i386                  randconfig-1004-20261014    clang-22
i386                  randconfig-1005-20261014    clang-22
i386                  randconfig-1006-20261014    clang-22
i386                  randconfig-2000-20261012    gcc-16.1.0
i386                  randconfig-2000-20261013    gcc-8.5.0
i386                  randconfig-2000-20261014    gcc-10.5.0
i386                  randconfig-2001-20261012    gcc-16.1.0
i386                  randconfig-2001-20261013    gcc-8.5.0
i386                  randconfig-2001-20261014    gcc-10.5.0
i386                  randconfig-2100-20261012    clang-22   cocci
i386                  randconfig-2100-20261013    gcc-14     cocci
i386                  randconfig-2100-20261014    gcc-13     cocci
i386                  randconfig-2101-20261012    clang-22   cocci
i386                  randconfig-2101-20261013    gcc-14     cocci
i386                  randconfig-2101-20261014    gcc-13     cocci
i386                  randconfig-2102-20261012    clang-22   cocci
i386                  randconfig-2102-20261013    gcc-14     cocci
i386                  randconfig-2102-20261014    gcc-13     cocci
i386                  randconfig-2103-20261012    clang-22   cocci
i386                  randconfig-2103-20261013    gcc-14     cocci
i386                  randconfig-2103-20261014    gcc-13     cocci
i386                  randconfig-2104-20261012    clang-22   cocci
i386                  randconfig-2104-20261013    gcc-14     cocci
i386                  randconfig-2104-20261014    gcc-13     cocci
i386                  randconfig-2105-20261012    clang-22   cocci
i386                  randconfig-2105-20261013    gcc-14     cocci
i386                  randconfig-2105-20261014    gcc-13     cocci
i386                  randconfig-2200-20261012    clang-22   smatch
i386                  randconfig-2200-20261013    gcc-14     smatch
i386                  randconfig-2200-20261014    clang-22   smatch
i386                  randconfig-2300-20261012    gcc-14     sparse
i386                  randconfig-2300-20261013    gcc-14     sparse
i386                  randconfig-2300-20261014    clang-22   sparse
i386                  randconfig-2301-20261012    gcc-14     sparse
i386                  randconfig-2301-20261013    gcc-14     sparse
i386                  randconfig-2301-20261014    clang-22   sparse
i386                  randconfig-2302-20261012    gcc-14     sparse
i386                  randconfig-2302-20261013    gcc-14     sparse
i386                  randconfig-2302-20261014    clang-22   sparse
i386                 randconfig-r2100-20261012    clang-24   cocci
i386                 randconfig-r2100-20261013    clang-24   cocci
i386                 randconfig-r2102-20261013    clang-24   cocci
i386                 randconfig-r2104-20261013    gcc-10.5.0 cocci
i386                 randconfig-r2110-20261013    clang-24   cocci
i386                 randconfig-r2110-20261014    gcc-10.5.0 cocci
i386                 randconfig-r2111-20261013    clang-22   cocci
i386                 randconfig-r2111-20261014    gcc-8.5.0  cocci
i386                 randconfig-r2305-20261013    clang-22   sparse
i386                 randconfig-r2307-20261012    gcc-12.5.0 sparse
i386                 randconfig-r2308-20261012    gcc-16.1.0 sparse
i386                 randconfig-r2308-20261013    gcc-9.5.0  sparse
i386                 randconfig-r2310-20261012    gcc-12.5.0 sparse
i386                 randconfig-r2311-20261012    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261014    clang-18
loongarch             randconfig-1001-20261014    clang-18
loongarch             randconfig-2000-20261012    gcc-11.5.0
loongarch             randconfig-2000-20261013    gcc-11.5.0
loongarch             randconfig-2000-20261014    gcc-8.5.0
loongarch             randconfig-2001-20261012    gcc-11.5.0
loongarch             randconfig-2001-20261013    gcc-11.5.0
loongarch             randconfig-2001-20261014    gcc-8.5.0
loongarch            randconfig-r2100-20261013    gcc-12.5.0 cocci
loongarch            randconfig-r2101-20261012    clang-24   cocci
loongarch            randconfig-r2101-20261013    clang-24   cocci
loongarch            randconfig-r2104-20261014    gcc-8.5.0  cocci
loongarch            randconfig-r2106-20261012    gcc-10.5.0 cocci
loongarch            randconfig-r2106-20261013    gcc-8.5.0  cocci
loongarch            randconfig-r2110-20261012    gcc-11.5.0 cocci
loongarch            randconfig-r2110-20261013    gcc-14.3.0 cocci
loongarch            randconfig-r2111-20261014    gcc-10.5.0 cocci
loongarch            randconfig-r2201-20261012    clang-20   smatch
loongarch            randconfig-r2201-20261013    clang-24   smatch
loongarch            randconfig-r2300-20261013    gcc-12.5.0 sparse
loongarch            randconfig-r2302-20261012    clang-24   sparse
loongarch            randconfig-r2306-20261013    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                 randconfig-r2100-20261013    clang-24   cocci
m68k                 randconfig-r2101-20261012    clang-24   cocci
m68k                 randconfig-r2103-20261013    gcc-12.5.0 cocci
m68k                 randconfig-r2107-20261013    gcc-8.5.0  cocci
m68k                 randconfig-r2107-20261014    gcc-10.5.0 cocci
m68k                 randconfig-r2108-20261013    clang-24   cocci
m68k                 randconfig-r2109-20261013    gcc-12.5.0 cocci
m68k                 randconfig-r2200-20261014    gcc-9.5.0  smatch
m68k                 randconfig-r2201-20261012    gcc-13.4.0 smatch
m68k                 randconfig-r2201-20261013    gcc-16.1.0 smatch
m68k                 randconfig-r2302-20261012    clang-24   sparse
m68k                 randconfig-r2305-20261012    clang-24   sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2101-20261014    gcc-8.5.0  cocci
microblaze           randconfig-r2105-20261014    gcc-10.5.0 cocci
microblaze           randconfig-r2108-20261012    clang-24   cocci
microblaze           randconfig-r2108-20261012    gcc-13.4.0 cocci
microblaze           randconfig-r2109-20261012    gcc-15.2.0 cocci
microblaze           randconfig-r2200-20261012    gcc-15.2.0 smatch
microblaze           randconfig-r2300-20261012    clang-24   sparse
microblaze           randconfig-r2301-20261013    gcc-16.1.0 sparse
microblaze           randconfig-r2302-20261012    gcc-11.5.0 sparse
microblaze           randconfig-r2307-20261013    clang-24   sparse
microblaze           randconfig-r2308-20261012    gcc-12.5.0 sparse
microblaze           randconfig-r2309-20261012    gcc-16.1.0 sparse
microblaze           randconfig-r2310-20261014    gcc-14.3.0 sparse
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           ath79_defconfig    gcc-16.1.0
mips                 randconfig-r2100-20261012    clang-24   cocci
mips                 randconfig-r2103-20261014    gcc-8.5.0  cocci
mips                 randconfig-r2105-20261013    gcc-10.5.0 cocci
mips                 randconfig-r2106-20261013    gcc-10.5.0 cocci
mips                 randconfig-r2110-20261013    gcc-10.5.0 cocci
mips                 randconfig-r2111-20261013    clang-24   cocci
mips                 randconfig-r2201-20261014    clang-24   smatch
mips                 randconfig-r2202-20261013    clang-24   smatch
mips                 randconfig-r2300-20261013    gcc-8.5.0  sparse
mips                 randconfig-r2301-20261013    gcc-8.5.0  sparse
mips                 randconfig-r2302-20261013    gcc-8.5.0  sparse
mips                 randconfig-r2304-20261012    clang-24   sparse
mips                 randconfig-r2307-20261014    gcc-14.3.0 sparse
mips                 randconfig-r2310-20261013    gcc-10.5.0 sparse
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261014    clang-18
nios2                 randconfig-1001-20261014    clang-18
nios2                 randconfig-2000-20261012    gcc-11.5.0
nios2                 randconfig-2000-20261013    gcc-11.5.0
nios2                 randconfig-2000-20261014    gcc-8.5.0
nios2                 randconfig-2001-20261012    gcc-11.5.0
nios2                 randconfig-2001-20261013    gcc-11.5.0
nios2                 randconfig-2001-20261014    gcc-8.5.0
nios2                randconfig-r2102-20261014    gcc-11.5.0 cocci
nios2                randconfig-r2103-20261012    clang-24   cocci
nios2                randconfig-r2105-20261012    gcc-11.5.0 cocci
nios2                randconfig-r2106-20261013    gcc-14.3.0 cocci
nios2                randconfig-r2107-20261012    gcc-10.5.0 cocci
nios2                randconfig-r2108-20261012    clang-24   cocci
nios2                randconfig-r2111-20261013    gcc-8.5.0  cocci
nios2                randconfig-r2201-20261013    gcc-8.5.0  smatch
nios2                randconfig-r2202-20261013    gcc-11.5.0 smatch
nios2                randconfig-r2300-20261012    clang-24   sparse
nios2                randconfig-r2302-20261013    clang-22   sparse
nios2                randconfig-r2305-20261013    gcc-8.5.0  sparse
nios2                randconfig-r2308-20261013    gcc-13.4.0 sparse
nios2                randconfig-r2311-20261012    gcc-16.1.0 sparse
nios2                randconfig-r2311-20261013    clang-19   sparse
openrisc                           allnoconfig    clang-24
openrisc                    de0_nano_defconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2100-20261013    clang-24   cocci
openrisc             randconfig-r2104-20261012    gcc-14     cocci
openrisc             randconfig-r2108-20261014    gcc-11.5.0 cocci
openrisc             randconfig-r2201-20261013    gcc-15.2.0 smatch
openrisc             randconfig-r2310-20261012    gcc-16.1.0 sparse
openrisc             randconfig-r2310-20261013    gcc-13.4.0 sparse
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261014    clang-22
parisc                randconfig-1001-20261014    clang-22
parisc                randconfig-2000-20261012    gcc-11.5.0
parisc                randconfig-2000-20261013    gcc-11.5.0
parisc                randconfig-2000-20261014    gcc-8.5.0
parisc                randconfig-2001-20261012    gcc-11.5.0
parisc                randconfig-2001-20261013    gcc-11.5.0
parisc                randconfig-2001-20261014    gcc-8.5.0
parisc               randconfig-r2105-20261012    gcc-9.5.0  cocci
parisc               randconfig-r2106-20261013    gcc-8.5.0  cocci
parisc               randconfig-r2108-20261013    clang-24   cocci
parisc               randconfig-r2108-20261014    gcc-8.5.0  cocci
parisc               randconfig-r2110-20261012    gcc-9.5.0  cocci
parisc               randconfig-r2111-20261012    gcc-9.5.0  cocci
parisc               randconfig-r2201-20261012    gcc-16.1.0 smatch
parisc               randconfig-r2202-20261012    gcc-10.5.0 smatch
parisc               randconfig-r2202-20261014    gcc-12.5.0 smatch
parisc               randconfig-r2305-20261013    gcc-16.1.0 sparse
parisc               randconfig-r2311-20261013    gcc-10.5.0 sparse
parisc64                          alldefconfig    gcc-16.1.0
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                       pasemi_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261014    clang-22
powerpc               randconfig-1001-20261014    clang-22
powerpc               randconfig-2000-20261012    gcc-14
powerpc               randconfig-2000-20261013    gcc-14
powerpc               randconfig-2000-20261014    clang-22
powerpc               randconfig-2001-20261012    gcc-14
powerpc               randconfig-2001-20261013    gcc-14
powerpc               randconfig-2001-20261014    clang-22
powerpc              randconfig-r2103-20261012    clang-24   cocci
powerpc              randconfig-r2106-20261012    gcc-9.5.0  cocci
powerpc              randconfig-r2107-20261013    gcc-10.5.0 cocci
powerpc              randconfig-r2107-20261014    gcc-8.5.0  cocci
powerpc              randconfig-r2110-20261013    clang-22   cocci
powerpc              randconfig-r2110-20261013    gcc-8.5.0  cocci
powerpc              randconfig-r2300-20261014    clang-24   sparse
powerpc              randconfig-r2302-20261013    gcc-16.1.0 sparse
powerpc              randconfig-r2303-20261012    clang-24   sparse
powerpc              randconfig-r2305-20261012    gcc-11.5.0 sparse
powerpc              randconfig-r2305-20261013    gcc-8.5.0  sparse
powerpc              randconfig-r2309-20261012    clang-22   sparse
powerpc64             randconfig-1000-20261014    clang-22
powerpc64             randconfig-1001-20261014    clang-22
powerpc64             randconfig-2000-20261012    gcc-14
powerpc64             randconfig-2000-20261013    gcc-14
powerpc64             randconfig-2000-20261014    clang-22
powerpc64             randconfig-2001-20261012    gcc-14
powerpc64             randconfig-2001-20261013    gcc-14
powerpc64             randconfig-2001-20261014    clang-22
powerpc64            randconfig-r2106-20261013    clang-24   cocci
powerpc64            randconfig-r2109-20261012    gcc-13.4.0 cocci
powerpc64            randconfig-r2109-20261013    clang-21   cocci
powerpc64            randconfig-r2109-20261013    clang-24   cocci
powerpc64            randconfig-r2300-20261012    gcc-11.5.0 sparse
powerpc64            randconfig-r2300-20261013    clang-22   sparse
powerpc64            randconfig-r2301-20261014    clang-24   sparse
powerpc64            randconfig-r2304-20261012    gcc-11.5.0 sparse
powerpc64            randconfig-r2306-20261014    gcc-14.3.0 sparse
powerpc64            randconfig-r2307-20261013    clang-24   sparse
powerpc64            randconfig-r2309-20261013    clang-24   sparse
powerpc64            randconfig-r2310-20261013    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261014    clang-18
riscv                 randconfig-1001-20261014    clang-18
riscv                 randconfig-2000-20261012    gcc-14.3.0
riscv                 randconfig-2000-20261013    gcc-15.2.0
riscv                 randconfig-2000-20261014    gcc-16.1.0
riscv                 randconfig-2001-20261012    gcc-14.3.0
riscv                 randconfig-2001-20261013    gcc-15.2.0
riscv                 randconfig-2001-20261014    gcc-16.1.0
riscv                randconfig-r2102-20261012    clang-24   cocci
riscv                randconfig-r2102-20261012    gcc-15.2.0 cocci
riscv                randconfig-r2103-20261012    gcc-15.2.0 cocci
riscv                randconfig-r2111-20261013    gcc-8.5.0  cocci
riscv                randconfig-r2202-20261012    clang-24   smatch
riscv                randconfig-r2307-20261013    gcc-13.4.0 sparse
riscv                randconfig-r2308-20261013    gcc-10.5.0 sparse
riscv                randconfig-r2310-20261013    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                           debug_defconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261014    clang-18
s390                  randconfig-1001-20261014    clang-18
s390                  randconfig-2000-20261012    gcc-14.3.0
s390                  randconfig-2000-20261013    gcc-15.2.0
s390                  randconfig-2000-20261014    gcc-16.1.0
s390                  randconfig-2001-20261012    gcc-14.3.0
s390                  randconfig-2001-20261013    gcc-15.2.0
s390                  randconfig-2001-20261014    gcc-16.1.0
s390                 randconfig-r2100-20261012    gcc-13.4.0 cocci
s390                 randconfig-r2100-20261013    clang-21   cocci
s390                 randconfig-r2104-20261012    gcc-11.5.0 cocci
s390                 randconfig-r2105-20261012    gcc-14     cocci
s390                 randconfig-r2105-20261013    gcc-14.3.0 cocci
s390                 randconfig-r2106-20261014    gcc-8.5.0  cocci
s390                 randconfig-r2108-20261013    gcc-12.5.0 cocci
s390                 randconfig-r2109-20261013    clang-24   cocci
s390                 randconfig-r2111-20261012    gcc-14     cocci
s390                 randconfig-r2200-20261013    clang-24   smatch
s390                 randconfig-r2200-20261014    gcc-8.5.0  smatch
s390                 randconfig-r2202-20261012    gcc-14.3.0 smatch
s390                 randconfig-r2302-20261013    gcc-12.5.0 sparse
s390                 randconfig-r2304-20261012    clang-24   sparse
s390                 randconfig-r2304-20261013    gcc-8.5.0  sparse
s390                 randconfig-r2306-20261012    clang-22   sparse
s390                 randconfig-r2307-20261013    gcc-10.5.0 sparse
s390                 randconfig-r2309-20261012    gcc-12.5.0 sparse
s390                 randconfig-r2310-20261012    clang-22   sparse
s390                 randconfig-r2311-20261013    clang-24   sparse
s390                 randconfig-r2311-20261014    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          ap325rxa_defconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261014    clang-18
sh                    randconfig-1001-20261014    clang-18
sh                    randconfig-2000-20261012    gcc-14.3.0
sh                    randconfig-2000-20261013    gcc-15.2.0
sh                    randconfig-2000-20261014    gcc-16.1.0
sh                    randconfig-2001-20261012    gcc-14.3.0
sh                    randconfig-2001-20261013    gcc-15.2.0
sh                    randconfig-2001-20261014    gcc-16.1.0
sh                   randconfig-r2101-20261013    clang-24   cocci
sh                   randconfig-r2104-20261013    gcc-8.5.0  cocci
sh                   randconfig-r2105-20261013    gcc-8.5.0  cocci
sh                   randconfig-r2109-20261012    clang-24   cocci
sh                   randconfig-r2300-20261012    clang-24   sparse
sh                   randconfig-r2301-20261012    clang-24   sparse
sh                   randconfig-r2306-20261013    gcc-9.5.0  sparse
sh                   randconfig-r2309-20261013    gcc-9.5.0  sparse
sh                            se7619_defconfig    gcc-16.1.0
sh                           urquell_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261014    clang-24
sparc                 randconfig-1001-20261014    clang-24
sparc                 randconfig-2000-20261012    gcc-8.5.0
sparc                 randconfig-2000-20261013    gcc-16.1.0
sparc                 randconfig-2000-20261014    gcc-14.3.0
sparc                 randconfig-2001-20261012    gcc-8.5.0
sparc                 randconfig-2001-20261013    gcc-16.1.0
sparc                 randconfig-2001-20261014    gcc-14.3.0
sparc                randconfig-r2100-20261012    gcc-15.2.0 cocci
sparc                randconfig-r2103-20261013    clang-24   cocci
sparc                randconfig-r2107-20261013    gcc-8.5.0  cocci
sparc                randconfig-r2108-20261013    clang-24   cocci
sparc                randconfig-r2110-20261014    gcc-8.5.0  cocci
sparc                randconfig-r2303-20261013    gcc-8.5.0  sparse
sparc                randconfig-r2303-20261014    clang-24   sparse
sparc                randconfig-r2304-20261013    clang-22   sparse
sparc                randconfig-r2306-20261012    gcc-16.1.0 sparse
sparc                randconfig-r2306-20261013    clang-19   sparse
sparc                randconfig-r2306-20261013    gcc-13.4.0 sparse
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261014    clang-24
sparc64               randconfig-1001-20261014    clang-24
sparc64               randconfig-2000-20261012    gcc-8.5.0
sparc64               randconfig-2000-20261013    gcc-16.1.0
sparc64               randconfig-2000-20261014    gcc-14.3.0
sparc64               randconfig-2001-20261012    gcc-8.5.0
sparc64               randconfig-2001-20261013    gcc-16.1.0
sparc64               randconfig-2001-20261014    gcc-14.3.0
sparc64              randconfig-r2100-20261013    clang-24   cocci
sparc64              randconfig-r2105-20261013    clang-24   cocci
sparc64              randconfig-r2200-20261012    clang-20   smatch
sparc64              randconfig-r2200-20261013    clang-24   smatch
sparc64              randconfig-r2301-20261012    clang-24   sparse
sparc64              randconfig-r2303-20261012    gcc-11.5.0 sparse
sparc64              randconfig-r2303-20261013    clang-22   sparse
sparc64              randconfig-r2304-20261013    gcc-12.5.0 sparse
sparc64              randconfig-r2311-20261013    gcc-9.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261014    clang-24
um                    randconfig-1001-20261014    clang-24
um                    randconfig-2000-20261012    gcc-8.5.0
um                    randconfig-2000-20261013    gcc-16.1.0
um                    randconfig-2000-20261014    gcc-14.3.0
um                    randconfig-2001-20261012    gcc-8.5.0
um                    randconfig-2001-20261013    gcc-16.1.0
um                    randconfig-2001-20261014    gcc-14.3.0
um                   randconfig-r2101-20261013    clang-21   cocci
um                   randconfig-r2102-20261013    clang-24   cocci
um                   randconfig-r2102-20261013    gcc-12.5.0 cocci
um                   randconfig-r2103-20261012    gcc-13.4.0 cocci
um                   randconfig-r2104-20261013    clang-24   cocci
um                   randconfig-r2106-20261012    gcc-11.5.0 cocci
um                   randconfig-r2108-20261013    clang-21   cocci
um                   randconfig-r2109-20261014    gcc-8.5.0  cocci
um                   randconfig-r2200-20261013    clang-17   smatch
um                   randconfig-r2202-20261012    clang-17   smatch
um                   randconfig-r2302-20261014    clang-24   sparse
um                   randconfig-r2303-20261013    gcc-12.5.0 sparse
um                   randconfig-r2307-20261012    clang-22   sparse
um                   randconfig-r2308-20261013    clang-19   sparse
um                   randconfig-r2310-20261013    clang-19   sparse
um                   randconfig-r2310-20261013    gcc-9.5.0  sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261014    clang-22
x86_64      buildonly-randconfig-1001-20261014    clang-22
x86_64      buildonly-randconfig-1002-20261014    clang-22
x86_64      buildonly-randconfig-1003-20261014    clang-22
x86_64      buildonly-randconfig-1004-20261014    clang-22
x86_64      buildonly-randconfig-1005-20261014    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1006-20261014    gcc-14
x86_64                randconfig-1007-20261014    gcc-14
x86_64                randconfig-1008-20261014    gcc-14
x86_64                randconfig-1009-20261014    gcc-14
x86_64                randconfig-1010-20261014    gcc-14
x86_64                randconfig-1011-20261014    gcc-14
x86_64                randconfig-1012-20261014    gcc-14
x86_64                randconfig-1013-20261014    gcc-14
x86_64                randconfig-1014-20261014    gcc-14
x86_64                randconfig-1015-20261014    gcc-14
x86_64                randconfig-1016-20261014    gcc-14
x86_64                randconfig-1017-20261014    gcc-14
x86_64                randconfig-2000-20261012    gcc-14
x86_64                randconfig-2000-20261013    gcc-14
x86_64                randconfig-2000-20261014    clang-22
x86_64                randconfig-2001-20261012    gcc-14
x86_64                randconfig-2001-20261013    gcc-14
x86_64                randconfig-2001-20261014    clang-22
x86_64                randconfig-2100-20261012    clang-22   cocci
x86_64                randconfig-2100-20261013    clang-22   cocci
x86_64                randconfig-2100-20261014    clang-22   cocci
x86_64                randconfig-2101-20261012    clang-22   cocci
x86_64                randconfig-2101-20261013    clang-22   cocci
x86_64                randconfig-2101-20261014    clang-22   cocci
x86_64                randconfig-2102-20261012    clang-22   cocci
x86_64                randconfig-2102-20261013    clang-22   cocci
x86_64                randconfig-2102-20261014    clang-22   cocci
x86_64                randconfig-2103-20261012    clang-22   cocci
x86_64                randconfig-2103-20261013    clang-22   cocci
x86_64                randconfig-2103-20261014    clang-22   cocci
x86_64                randconfig-2104-20261012    clang-22   cocci
x86_64                randconfig-2104-20261013    clang-22   cocci
x86_64                randconfig-2104-20261014    clang-22   cocci
x86_64                randconfig-2105-20261012    clang-22   cocci
x86_64                randconfig-2105-20261013    clang-22   cocci
x86_64                randconfig-2105-20261014    clang-22   cocci
x86_64                randconfig-2200-20261012    gcc-14     smatch
x86_64                randconfig-2200-20261013    gcc-13     smatch
x86_64                randconfig-2200-20261014    clang-22   smatch
x86_64                randconfig-2300-20261012    gcc-14     sparse
x86_64                randconfig-2300-20261013    gcc-14     sparse
x86_64                randconfig-2300-20261014    clang-22   sparse
x86_64                randconfig-2301-20261012    gcc-14     sparse
x86_64                randconfig-2301-20261013    gcc-14     sparse
x86_64                randconfig-2301-20261014    clang-22   sparse
x86_64                randconfig-2302-20261012    gcc-14     sparse
x86_64                randconfig-2302-20261013    gcc-14     sparse
x86_64                randconfig-2302-20261014    clang-22   sparse
x86_64               randconfig-r2102-20261013    clang-21   cocci
x86_64               randconfig-r2104-20261012    gcc-10.5.0 cocci
x86_64               randconfig-r2105-20261012    gcc-10.5.0 cocci
x86_64               randconfig-r2107-20261012    gcc-14     cocci
x86_64               randconfig-r2109-20261014    gcc-11.5.0 cocci
x86_64               randconfig-r2202-20261013    gcc-14     smatch
x86_64               randconfig-r2202-20261014    clang-22   smatch
x86_64               randconfig-r2301-20261013    clang-22   sparse
x86_64               randconfig-r2302-20261013    gcc-8.5.0  sparse
x86_64               randconfig-r2303-20261013    gcc-8.5.0  sparse
x86_64               randconfig-r2304-20261012    clang-24   sparse
x86_64               randconfig-r2304-20261013    gcc-8.5.0  sparse
x86_64               randconfig-r2306-20261013    clang-24   sparse
x86_64               randconfig-r2308-20261012    clang-22   sparse
x86_64               randconfig-r2308-20261013    clang-24   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                randconfig-1000-20261014    clang-24
xtensa                randconfig-1001-20261014    clang-24
xtensa                randconfig-2000-20261012    gcc-8.5.0
xtensa                randconfig-2000-20261013    gcc-16.1.0
xtensa                randconfig-2000-20261014    gcc-14.3.0
xtensa                randconfig-2001-20261012    gcc-8.5.0
xtensa                randconfig-2001-20261013    gcc-16.1.0
xtensa                randconfig-2001-20261014    gcc-14.3.0
xtensa               randconfig-r2100-20261014    gcc-11.5.0 cocci
xtensa               randconfig-r2101-20261012    gcc-13.4.0 cocci
xtensa               randconfig-r2102-20261012    gcc-13.4.0 cocci
xtensa               randconfig-r2104-20261012    gcc-9.5.0  cocci
xtensa               randconfig-r2104-20261013    gcc-14.3.0 cocci
xtensa               randconfig-r2105-20261013    clang-22   cocci
xtensa               randconfig-r2107-20261013    gcc-14.3.0 cocci
xtensa               randconfig-r2301-20261012    clang-24   sparse
xtensa               randconfig-r2303-20261012    clang-24   sparse
xtensa               randconfig-r2307-20261013    gcc-9.5.0  sparse
xtensa               randconfig-r2309-20261013    gcc-10.5.0 sparse
xtensa               randconfig-r2309-20261013    gcc-13.4.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
