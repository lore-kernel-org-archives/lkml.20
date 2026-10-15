Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8023101A0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071394; cv=none; b=ntUQawuxdsTYZxpbibaaQTUS66xw3fQjFHjQG3Foas8BcFaubtacFoqPOxGqPWN+lRCSXT5jJa+9s7wFSElJX8tuScTtQw02n9ZOx++H4CqVgxvQG9w0ePv6SrJ9TYbTpqzf2UEhtYNZO262iENjdly1KHZIBOsZDweqYBz7ja8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071394; c=relaxed/simple;
	bh=tP9BXX1L+9xmVZbzktrPj2//NxUi/Tjfxy/IU8RaoeE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VSsXT7WKWpk8XHYUFXybnfI3bFs/eOwycWRDXbJskDQNdBi6D2uyrSMcXROrCUiJtTrlRONIqjlN99h2yoop2t0rgWQKmbFJCATtVx2sGZ2HDk4ZMfM57L5gTmfmcY/AvxiMsMT0HmErQlO3uNxtZ0k+WNrwaOy1sGAIAFbqY3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edeHgl7U; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edeHgl7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792071393; x=1823607393;
  h=date:from:to:cc:subject:message-id;
  bh=tP9BXX1L+9xmVZbzktrPj2//NxUi/Tjfxy/IU8RaoeE=;
  b=edeHgl7UVqmRogUmyMDb0shyi5CP0su3ncrXtXxOz+so4U/XmCmunMx/
   75PWwfe4eg2c3IQx4IUY4ZtDg7Oih6XxCxljTQC0bFUD5pkkqiJx6Vz/J
   C0liBFIY12jW6IGbKLdRDRvGLyQLDds61WaFoG8nSDNoXdzAKizRK1pop
   OXI5MWEq0MDrtuj2SKvMI4nGbgJvA58Ti/plX1L0n9c5zhP+FVB39rD2k
   E03UIjS/2xjhs4Y6FSqDPi22hoEnMmiS0a+cHJ4zdboPXw47BXo81RBBa
   oCm+43HnfIYFkdA+/5QNQarOuBoFT43S4PzUK/YgNGTX7p507DCK8uagS
   A==;
X-CSE-ConnectionGUID: uj6nL4HcSZ+cGdIwLpjveQ==
X-CSE-MsgGUID: alk/XmacTXq7M9bGLTO9Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="841102"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="841102"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 06:36:31 -0700
X-CSE-ConnectionGUID: 4bNBNMz3Sz6pG9meplaxSA==
X-CSE-MsgGUID: atcLb5BYRlOGPikT96AQVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1662760"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Oct 2026 06:36:29 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHLdC-00000000GZk-2lqW;
	Thu, 15 Oct 2026 13:36:26 +0000
Date: Thu, 15 Oct 2026 21:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 7abc52da724b95eee09c77a1da04c49aec6d31b7
Message-ID: <202610152125.VBWbuzKN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 7abc52da724b95eee09c77a1da04c49aec6d31b7  Merge branch into tip/master: 'x86/tdx'

elapsed time: 2664m

configs tested: 431
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    clang-20
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20261014    gcc-8.5.0  cocci
alpha                randconfig-r2308-20261014    gcc-14.3.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    clang-20
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                  nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261015    clang-24
arc                   randconfig-1001-20261015    clang-24
arc                   randconfig-2000-20261013    gcc-15.2.0
arc                   randconfig-2000-20261013    gcc-8.5.0
arc                   randconfig-2000-20261014    gcc-10.5.0
arc                   randconfig-2001-20261013    gcc-8.5.0
arc                   randconfig-2001-20261014    gcc-10.5.0
arc                  randconfig-r2101-20261013    gcc-14.3.0 cocci
arc                  randconfig-r2102-20261014    gcc-8.5.0  cocci
arc                  randconfig-r2103-20261013    clang-17   cocci
arc                  randconfig-r2107-20261013    gcc-11.5.0 cocci
arc                  randconfig-r2108-20261013    clang-17   cocci
arc                  randconfig-r2109-20261013    clang-24   cocci
arc                  randconfig-r2304-20261013    gcc-8.5.0  sparse
arm                                allnoconfig    clang-20
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    gcc-16.1.0
arm                          bcm2835_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                          mv78xx0_defconfig    gcc-16.1.0
arm                              mxs_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261015    clang-24
arm                   randconfig-1001-20261015    clang-24
arm                   randconfig-1002-20261015    clang-24
arm                   randconfig-1003-20261015    clang-24
arm                   randconfig-2000-20261013    gcc-13.4.0
arm                   randconfig-2000-20261013    gcc-8.5.0
arm                   randconfig-2000-20261014    gcc-10.5.0
arm                   randconfig-2001-20261013    gcc-8.5.0
arm                   randconfig-2001-20261014    gcc-10.5.0
arm                  randconfig-r2309-20261013    gcc-8.5.0  sparse
arm                  randconfig-r2311-20261013    gcc-13.4.0 sparse
arm                          socfpga_defconfig    gcc-16.1.0
arm                         vexpress_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    clang-20
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261015    gcc-8.5.0
arm64                 randconfig-1001-20261015    gcc-8.5.0
arm64                 randconfig-1002-20261015    gcc-8.5.0
arm64                 randconfig-1003-20261015    gcc-8.5.0
arm64                 randconfig-2000-20261013    gcc-9.5.0
arm64                 randconfig-2000-20261014    gcc-16.1.0
arm64                 randconfig-2001-20261013    gcc-9.5.0
arm64                 randconfig-2001-20261014    gcc-16.1.0
arm64                randconfig-r2101-20261014    gcc-11.5.0 cocci
arm64                randconfig-r2104-20261014    gcc-10.5.0 cocci
arm64                randconfig-r2105-20261014    gcc-8.5.0  cocci
arm64                randconfig-r2200-20261013    gcc-8.5.0  smatch
arm64                randconfig-r2201-20261013    gcc-11.5.0 smatch
arm64                randconfig-r2305-20261014    clang-24   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    clang-20
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261015    gcc-8.5.0
csky                  randconfig-1001-20261015    gcc-8.5.0
csky                  randconfig-2000-20261013    gcc-9.5.0
csky                  randconfig-2000-20261014    gcc-16.1.0
csky                  randconfig-2001-20261013    gcc-9.5.0
csky                  randconfig-2001-20261014    gcc-16.1.0
csky                 randconfig-r2100-20261013    gcc-10.5.0 cocci
csky                 randconfig-r2106-20261014    gcc-10.5.0 cocci
csky                 randconfig-r2201-20261014    gcc-14.3.0 smatch
csky                 randconfig-r2202-20261013    gcc-16.1.0 smatch
csky                 randconfig-r2300-20261013    gcc-16.1.0 sparse
csky                 randconfig-r2302-20261014    clang-24   sparse
csky                 randconfig-r2303-20261013    gcc-16.1.0 sparse
csky                 randconfig-r2304-20261013    gcc-16.1.0 sparse
csky                 randconfig-r2309-20261014    gcc-14.3.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    clang-20
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261015    clang-24
hexagon               randconfig-1001-20261015    clang-24
hexagon               randconfig-2000-20261013    gcc-9.5.0
hexagon               randconfig-2000-20261014    gcc-16.1.0
hexagon               randconfig-2001-20261013    gcc-9.5.0
hexagon               randconfig-2001-20261014    gcc-16.1.0
hexagon              randconfig-r2103-20261014    gcc-11.5.0 cocci
hexagon              randconfig-r2107-20261013    clang-24   cocci
hexagon              randconfig-r2300-20261013    clang-17   sparse
hexagon              randconfig-r2304-20261014    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    clang-20
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261015    gcc-14
i386        buildonly-randconfig-1001-20261015    gcc-14
i386        buildonly-randconfig-1002-20261015    gcc-14
i386        buildonly-randconfig-1003-20261015    gcc-14
i386        buildonly-randconfig-1004-20261015    gcc-14
i386        buildonly-randconfig-1005-20261015    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261015    gcc-14
i386                  randconfig-1001-20261015    gcc-14
i386                  randconfig-1002-20261015    gcc-14
i386                  randconfig-1003-20261015    gcc-14
i386                  randconfig-1004-20261015    gcc-14
i386                  randconfig-1005-20261015    gcc-14
i386                  randconfig-1006-20261015    gcc-14
i386                  randconfig-2000-20261013    clang-22
i386                  randconfig-2000-20261013    gcc-8.5.0
i386                  randconfig-2000-20261014    gcc-10.5.0
i386                  randconfig-2001-20261013    clang-22
i386                  randconfig-2001-20261013    gcc-8.5.0
i386                  randconfig-2001-20261014    gcc-10.5.0
i386                  randconfig-2100-20261013    clang-22   cocci
i386                  randconfig-2100-20261013    gcc-14     cocci
i386                  randconfig-2100-20261014    gcc-13     cocci
i386                  randconfig-2101-20261013    gcc-14     cocci
i386                  randconfig-2101-20261014    gcc-13     cocci
i386                  randconfig-2102-20261013    gcc-12     cocci
i386                  randconfig-2102-20261013    gcc-14     cocci
i386                  randconfig-2102-20261014    gcc-13     cocci
i386                  randconfig-2103-20261013    gcc-14     cocci
i386                  randconfig-2103-20261014    gcc-13     cocci
i386                  randconfig-2104-20261013    gcc-12     cocci
i386                  randconfig-2104-20261013    gcc-14     cocci
i386                  randconfig-2104-20261014    gcc-13     cocci
i386                  randconfig-2105-20261013    gcc-14     cocci
i386                  randconfig-2105-20261014    gcc-13     cocci
i386                  randconfig-2200-20261013    gcc-14     smatch
i386                  randconfig-2200-20261014    clang-22   smatch
i386                  randconfig-2300-20261013    gcc-14     sparse
i386                  randconfig-2300-20261014    clang-22   sparse
i386                  randconfig-2301-20261013    gcc-14     sparse
i386                  randconfig-2301-20261014    clang-22   sparse
i386                  randconfig-2302-20261013    gcc-14     sparse
i386                  randconfig-2302-20261014    clang-22   sparse
i386                 randconfig-r2104-20261013    gcc-11.5.0 cocci
i386                 randconfig-r2108-20261013    clang-22   cocci
i386                 randconfig-r2110-20261013    clang-24   cocci
i386                 randconfig-r2110-20261014    gcc-10.5.0 cocci
i386                 randconfig-r2111-20261014    gcc-8.5.0  cocci
i386                 randconfig-r2300-20261014    clang-24   sparse
i386                 randconfig-r2301-20261013    clang-17   sparse
i386                 randconfig-r2311-20261013    gcc-14     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    clang-20
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261015    clang-24
loongarch             randconfig-1001-20261015    clang-24
loongarch             randconfig-2000-20261013    gcc-11.5.0
loongarch             randconfig-2000-20261014    gcc-8.5.0
loongarch             randconfig-2001-20261013    gcc-11.5.0
loongarch             randconfig-2001-20261014    gcc-8.5.0
loongarch            randconfig-r2101-20261013    clang-24   cocci
loongarch            randconfig-r2104-20261014    gcc-8.5.0  cocci
loongarch            randconfig-r2109-20261013    gcc-16.1.0 cocci
loongarch            randconfig-r2110-20261013    gcc-11.5.0 cocci
loongarch            randconfig-r2111-20261014    gcc-10.5.0 cocci
loongarch            randconfig-r2305-20261014    clang-24   sparse
loongarch            randconfig-r2310-20261013    gcc-16.1.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    clang-20
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2100-20261013    clang-24   cocci
m68k                 randconfig-r2101-20261013    clang-17   cocci
m68k                 randconfig-r2107-20261014    gcc-10.5.0 cocci
m68k                 randconfig-r2108-20261013    clang-24   cocci
m68k                 randconfig-r2200-20261014    gcc-9.5.0  smatch
m68k                 randconfig-r2300-20261013    gcc-13.4.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2101-20261014    gcc-8.5.0  cocci
microblaze           randconfig-r2105-20261014    gcc-10.5.0 cocci
microblaze           randconfig-r2301-20261013    gcc-16.1.0 sparse
microblaze           randconfig-r2306-20261013    gcc-13.4.0 sparse
microblaze           randconfig-r2310-20261014    gcc-14.3.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
mips                            ip28_defconfig    gcc-16.1.0
mips                            mtx1_defconfig    gcc-16.1.0
mips                 randconfig-r2103-20261014    gcc-8.5.0  cocci
mips                 randconfig-r2111-20261013    clang-24   cocci
mips                 randconfig-r2201-20261014    clang-24   smatch
mips                 randconfig-r2307-20261014    gcc-14     sparse
mips                 randconfig-r2307-20261014    gcc-14.3.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261015    clang-24
nios2                 randconfig-1001-20261015    clang-24
nios2                 randconfig-2000-20261013    gcc-11.5.0
nios2                 randconfig-2000-20261014    gcc-8.5.0
nios2                 randconfig-2001-20261013    gcc-11.5.0
nios2                 randconfig-2001-20261014    gcc-8.5.0
nios2                randconfig-r2102-20261014    gcc-11.5.0 cocci
nios2                randconfig-r2308-20261013    gcc-13.4.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2102-20261013    clang-17   cocci
openrisc             randconfig-r2108-20261014    gcc-11.5.0 cocci
openrisc             randconfig-r2305-20261013    gcc-12.5.0 sparse
openrisc             randconfig-r2310-20261013    gcc-13.4.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261015    gcc-8.5.0
parisc                randconfig-1001-20261015    gcc-8.5.0
parisc                randconfig-2000-20261013    gcc-11.5.0
parisc                randconfig-2000-20261014    gcc-8.5.0
parisc                randconfig-2001-20261013    gcc-11.5.0
parisc                randconfig-2001-20261014    gcc-8.5.0
parisc               randconfig-r2108-20261014    gcc-8.5.0  cocci
parisc               randconfig-r2202-20261014    gcc-12.5.0 smatch
parisc               randconfig-r2305-20261013    gcc-16.1.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                        ebony_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261015    gcc-8.5.0
powerpc               randconfig-1001-20261015    gcc-8.5.0
powerpc               randconfig-2000-20261013    gcc-14
powerpc               randconfig-2000-20261013    gcc-8.5.0
powerpc               randconfig-2000-20261014    clang-22
powerpc               randconfig-2001-20261013    clang-22
powerpc               randconfig-2001-20261013    gcc-14
powerpc               randconfig-2001-20261014    clang-22
powerpc              randconfig-r2107-20261014    gcc-8.5.0  cocci
powerpc              randconfig-r2300-20261014    clang-24   sparse
powerpc              randconfig-r2302-20261013    gcc-16.1.0 sparse
powerpc              randconfig-r2303-20261013    clang-17   sparse
powerpc64             randconfig-1000-20261015    gcc-8.5.0
powerpc64             randconfig-1001-20261015    gcc-8.5.0
powerpc64             randconfig-2000-20261013    gcc-14
powerpc64             randconfig-2000-20261013    gcc-8.5.0
powerpc64             randconfig-2000-20261014    clang-22
powerpc64             randconfig-2001-20261013    gcc-14
powerpc64             randconfig-2001-20261013    gcc-14.3.0
powerpc64             randconfig-2001-20261014    clang-22
powerpc64            randconfig-r2105-20261013    gcc-11.5.0 cocci
powerpc64            randconfig-r2106-20261013    clang-24   cocci
powerpc64            randconfig-r2301-20261014    clang-24   sparse
powerpc64            randconfig-r2302-20261013    gcc-8.5.0  sparse
powerpc64            randconfig-r2306-20261014    gcc-14.3.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261015    gcc-11.5.0
riscv                 randconfig-1001-20261015    gcc-11.5.0
riscv                 randconfig-2000-20261013    gcc-15.2.0
riscv                 randconfig-2000-20261014    gcc-16.1.0
riscv                 randconfig-2001-20261013    gcc-15.2.0
riscv                 randconfig-2001-20261014    gcc-16.1.0
riscv                randconfig-r2304-20261013    clang-17   sparse
riscv                randconfig-r2307-20261013    gcc-13.4.0 sparse
s390                              allmodconfig    clang-17
s390                              allmodconfig    clang-24
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261015    gcc-11.5.0
s390                  randconfig-1001-20261015    gcc-11.5.0
s390                  randconfig-2000-20261013    gcc-15.2.0
s390                  randconfig-2000-20261014    gcc-16.1.0
s390                  randconfig-2001-20261013    gcc-15.2.0
s390                  randconfig-2001-20261014    gcc-16.1.0
s390                 randconfig-r2106-20261014    gcc-8.5.0  cocci
s390                 randconfig-r2109-20261013    clang-17   cocci
s390                 randconfig-r2200-20261014    gcc-8.5.0  smatch
s390                 randconfig-r2301-20261013    clang-24   sparse
s390                 randconfig-r2311-20261014    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                allyesconfig    gcc-16.1.0
sh                         apsh4ad0a_defconfig    gcc-16.1.0
sh                         dreamcast_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261015    gcc-11.5.0
sh                    randconfig-1001-20261015    gcc-11.5.0
sh                    randconfig-2000-20261013    gcc-15.2.0
sh                    randconfig-2000-20261014    gcc-16.1.0
sh                    randconfig-2001-20261013    gcc-15.2.0
sh                    randconfig-2001-20261014    gcc-16.1.0
sh                   randconfig-r2103-20261013    gcc-16.1.0 cocci
sh                   randconfig-r2106-20261013    gcc-11.5.0 cocci
sh                   randconfig-r2111-20261013    gcc-11.5.0 cocci
sh                   randconfig-r2311-20261014    gcc-14     sparse
sh                         sh7763rdp_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261015    gcc-8.5.0
sparc                 randconfig-1001-20261015    gcc-8.5.0
sparc                 randconfig-2000-20261013    gcc-16.1.0
sparc                 randconfig-2000-20261014    gcc-14.3.0
sparc                 randconfig-2001-20261013    gcc-16.1.0
sparc                 randconfig-2001-20261014    gcc-14.3.0
sparc                randconfig-r2103-20261013    clang-24   cocci
sparc                randconfig-r2110-20261014    gcc-8.5.0  cocci
sparc                randconfig-r2303-20261014    clang-24   sparse
sparc                randconfig-r2304-20261014    clang-24   sparse
sparc                randconfig-r2306-20261013    gcc-13.4.0 sparse
sparc                randconfig-r2309-20261014    gcc-14     sparse
sparc                        sparc32_defconfig    gcc-16.1.0
sparc64                           allmodconfig    clang-20
sparc64               randconfig-1000-20261015    gcc-8.5.0
sparc64               randconfig-1001-20261015    gcc-8.5.0
sparc64               randconfig-2000-20261013    gcc-16.1.0
sparc64               randconfig-2000-20261014    gcc-14.3.0
sparc64               randconfig-2001-20261013    gcc-16.1.0
sparc64               randconfig-2001-20261014    gcc-14.3.0
sparc64              randconfig-r2105-20261013    clang-24   cocci
sparc64              randconfig-r2201-20261013    gcc-8.5.0  smatch
sparc64              randconfig-r2308-20261013    clang-20   sparse
sparc64              randconfig-r2310-20261014    gcc-14     sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                    randconfig-1000-20261015    gcc-8.5.0
um                    randconfig-1001-20261015    gcc-8.5.0
um                    randconfig-2000-20261013    gcc-16.1.0
um                    randconfig-2000-20261014    gcc-14.3.0
um                    randconfig-2001-20261013    gcc-16.1.0
um                    randconfig-2001-20261014    gcc-14.3.0
um                   randconfig-r2102-20261013    clang-24   cocci
um                   randconfig-r2104-20261013    clang-24   cocci
um                   randconfig-r2109-20261014    gcc-8.5.0  cocci
um                   randconfig-r2200-20261013    clang-17   smatch
um                   randconfig-r2302-20261013    clang-17   sparse
um                   randconfig-r2302-20261014    clang-24   sparse
um                   randconfig-r2303-20261013    clang-24   sparse
um                   randconfig-r2308-20261014    gcc-14     sparse
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261015    gcc-14
x86_64      buildonly-randconfig-1001-20261015    gcc-14
x86_64      buildonly-randconfig-1002-20261015    gcc-14
x86_64      buildonly-randconfig-1003-20261015    gcc-14
x86_64      buildonly-randconfig-1004-20261015    gcc-14
x86_64      buildonly-randconfig-1005-20261015    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261015    gcc-14
x86_64                randconfig-1001-20261015    gcc-14
x86_64                randconfig-1002-20261015    gcc-14
x86_64                randconfig-1003-20261015    gcc-14
x86_64                randconfig-1004-20261015    gcc-14
x86_64                randconfig-1005-20261015    gcc-14
x86_64                randconfig-1006-20261015    gcc-14
x86_64                randconfig-1007-20261015    gcc-14
x86_64                randconfig-1008-20261015    gcc-14
x86_64                randconfig-1009-20261015    gcc-14
x86_64                randconfig-1010-20261015    gcc-14
x86_64                randconfig-1011-20261015    gcc-14
x86_64                randconfig-1012-20261015    gcc-13
x86_64                randconfig-1013-20261015    gcc-13
x86_64                randconfig-1014-20261015    gcc-13
x86_64                randconfig-1015-20261015    gcc-13
x86_64                randconfig-1016-20261015    gcc-13
x86_64                randconfig-1017-20261015    gcc-13
x86_64                randconfig-2000-20261013    gcc-14
x86_64                randconfig-2000-20261014    clang-22
x86_64                randconfig-2001-20261013    gcc-14
x86_64                randconfig-2001-20261014    clang-22
x86_64                randconfig-2100-20261013    clang-22   cocci
x86_64                randconfig-2100-20261014    clang-22   cocci
x86_64                randconfig-2101-20261013    clang-22   cocci
x86_64                randconfig-2101-20261014    clang-22   cocci
x86_64                randconfig-2102-20261013    clang-22   cocci
x86_64                randconfig-2102-20261014    clang-22   cocci
x86_64                randconfig-2103-20261013    clang-22   cocci
x86_64                randconfig-2103-20261014    clang-22   cocci
x86_64                randconfig-2104-20261013    clang-22   cocci
x86_64                randconfig-2104-20261014    clang-22   cocci
x86_64                randconfig-2105-20261013    clang-22   cocci
x86_64                randconfig-2105-20261014    clang-22   cocci
x86_64                randconfig-2200-20261013    gcc-13     smatch
x86_64                randconfig-2200-20261014    clang-22   smatch
x86_64                randconfig-2300-20261013    gcc-14     sparse
x86_64                randconfig-2300-20261014    clang-22   sparse
x86_64                randconfig-2301-20261013    gcc-14     sparse
x86_64                randconfig-2301-20261014    clang-22   sparse
x86_64                randconfig-2302-20261013    gcc-14     sparse
x86_64                randconfig-2302-20261014    clang-22   sparse
x86_64               randconfig-r2100-20261013    clang-17   cocci
x86_64               randconfig-r2109-20261014    gcc-11.5.0 cocci
x86_64               randconfig-r2202-20261013    gcc-14     smatch
x86_64               randconfig-r2202-20261014    clang-22   smatch
x86_64               randconfig-r2306-20261014    gcc-14     sparse
x86_64               randconfig-r2307-20261013    gcc-14     sparse
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
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261015    gcc-8.5.0
xtensa                randconfig-1001-20261015    gcc-8.5.0
xtensa                randconfig-2000-20261013    gcc-16.1.0
xtensa                randconfig-2000-20261014    gcc-14.3.0
xtensa                randconfig-2001-20261013    gcc-16.1.0
xtensa                randconfig-2001-20261014    gcc-14.3.0
xtensa               randconfig-r2100-20261014    gcc-11.5.0 cocci
xtensa               randconfig-r2303-20261014    clang-24   sparse
xtensa               randconfig-r2305-20261013    clang-17   sparse
xtensa               randconfig-r2309-20261013    gcc-13.4.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
