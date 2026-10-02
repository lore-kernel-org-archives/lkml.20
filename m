Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99DA3EF666
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928820; cv=none; b=r/0ZxODEdI/Ys6oOUMQn826twta1c3wTb+F+Ulh5GUnEQKZ28XkOx2heSS8VoiAN/LTd9jL7DhCXC2ftxHLD/mZ2ihVg4+1RWysfvMyFK+JIm8NZOXoAxfg5JUJETwsN/V/6cs2dgzWMq9UmkxXyMVfH7Ni7t2DeItzg9GENEXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928820; c=relaxed/simple;
	bh=i3ftOOd/IwwR5Cn+LV5v9g5KACBM2K81REk+7vsnfHA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e23G4L13LREEt5LoFivjRLx8LybtuENIVUMjiKgUSJxLDomI3w/uFRbzEL2tW6hT/udM0qvvopSntGRqEYFgVHJGHyuyLZ0crot4C7oPDiS4pW3i0prixa1Lm9jt/fDedyLbyuWKwp6fcJuKNetg29T2NhJbR63t3k8IdNu90OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eaBGYxYy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eaBGYxYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790928818; x=1822464818;
  h=date:from:to:cc:subject:message-id;
  bh=i3ftOOd/IwwR5Cn+LV5v9g5KACBM2K81REk+7vsnfHA=;
  b=eaBGYxYyY/Qk9nPMX0yXxjbrvmFe/ygPLtmj9O9vetyi1Lgsc9onHo+K
   lO8dB1Bqrat54hqx1A2dwjU/OnX9rCnl1FeGOnk/g0DxwAGUU8qek1Wq3
   7IIDXfzGs4JVvoFooXLx0AvC2csejT5qBo+g+Q8xsRbYbCfcFKZQczqhb
   HDX74Vv50gMbNdcBE4UIndQveq79xmfU35Al9nRCaSVZTxYTGxc36D9DY
   EAxVnUFhTOmuxkCSQARRgTkaUprebfrqHd/tZP023Fxc21M4qE2bj6zdB
   uY/UvwAgfqYNlXsAfN/BkmCHfDMtB/LEKIfgb1r+B8uOlhETcQPgPvu34
   A==;
X-CSE-ConnectionGUID: PiHm0zODTraOWlvjBMcl1g==
X-CSE-MsgGUID: xdf8Lz8TSPeG9mIUZdnj1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90648459"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90648459"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:13:38 -0700
X-CSE-ConnectionGUID: aEPJDqc0RcyrfKYYbgS7KA==
X-CSE-MsgGUID: NXC5h+QgRemLD3dwgoYPVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="272606845"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Oct 2026 01:13:36 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCYOb-00000000Sle-1iLD;
	Fri, 02 Oct 2026 08:13:33 +0000
Date: Fri, 02 Oct 2026 16:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:non-rcu:next] BUILD SUCCESS
 afb36d3025c845d8ae32f4ca83bb0ae31240d790
Message-ID: <202610021643.QIbz2lOi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git non-rcu/next
branch HEAD: afb36d3025c845d8ae32f4ca83bb0ae31240d790  Merge branches 'csd-lock.2026.09.03a', 'hazptr.2026.09.30a', 'nmi.2026.09.17a' and 'usb-mtu3.2026.09.29a' into HEAD

elapsed time: 1024m

configs tested: 290
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2101-20261001    gcc-9.5.0  cocci
alpha                randconfig-r2102-20261001    gcc-9.5.0  cocci
alpha                randconfig-r2302-20261001    gcc-16.1.0 sparse
alpha                randconfig-r2309-20261001    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261002    clang-17
arc                   randconfig-1001-20261002    clang-17
arc                  randconfig-r2105-20261001    gcc-8.5.0  cocci
arc                  randconfig-r2306-20261001    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                        aspeed_g4_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                             dove_defconfig    gcc-16.1.0
arm                       integrator_defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261002    clang-17
arm                   randconfig-1001-20261002    clang-17
arm                   randconfig-1002-20261002    clang-17
arm                   randconfig-1003-20261002    clang-17
arm                  randconfig-r2305-20261001    gcc-13.4.0 sparse
arm                  randconfig-r2306-20261001    gcc-14     sparse
arm                          s3c6400_defconfig    gcc-16.1.0
arm                          vf610m4_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261002    gcc-12.5.0
arm64                 randconfig-1001-20261002    gcc-12.5.0
arm64                 randconfig-1002-20261002    gcc-12.5.0
arm64                 randconfig-1003-20261002    gcc-12.5.0
arm64                randconfig-r2105-20261001    gcc-13.4.0 cocci
arm64                randconfig-r2106-20261001    clang-24   cocci
arm64                randconfig-r2200-20261001    gcc-14.3.0 smatch
arm64                randconfig-r2301-20261001    gcc-16.1.0 sparse
arm64                randconfig-r2302-20261001    gcc-13.4.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261002    gcc-12.5.0
csky                  randconfig-1001-20261002    gcc-12.5.0
csky                 randconfig-r2303-20261001    gcc-16.1.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261002    gcc-13.4.0
hexagon               randconfig-1001-20261002    gcc-13.4.0
hexagon              randconfig-r2200-20261001    clang-24   smatch
hexagon              randconfig-r2201-20261001    clang-17   smatch
hexagon              randconfig-r2306-20261001    gcc-14     sparse
hexagon              randconfig-r2307-20261001    gcc-8.5.0  sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261002    clang-22
i386        buildonly-randconfig-1001-20261002    clang-22
i386        buildonly-randconfig-1002-20261002    clang-22
i386        buildonly-randconfig-1003-20261002    clang-22
i386        buildonly-randconfig-1004-20261002    clang-22
i386        buildonly-randconfig-1005-20261002    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261002    gcc-14
i386                  randconfig-1001-20261002    gcc-14
i386                  randconfig-1002-20261002    gcc-14
i386                  randconfig-1003-20261002    gcc-14
i386                  randconfig-1004-20261002    gcc-14
i386                  randconfig-1005-20261002    gcc-14
i386                  randconfig-1006-20261002    gcc-14
i386                  randconfig-1007-20261002    clang-22
i386                  randconfig-1008-20261002    clang-22
i386                  randconfig-1009-20261002    clang-22
i386                  randconfig-1010-20261002    clang-22
i386                  randconfig-1011-20261002    clang-22
i386                  randconfig-1012-20261002    clang-22
i386                  randconfig-1013-20261002    clang-22
i386                  randconfig-2100-20261001    gcc-14     cocci
i386                  randconfig-2101-20261001    gcc-14     cocci
i386                  randconfig-2102-20261001    gcc-14     cocci
i386                  randconfig-2103-20261001    gcc-14     cocci
i386                  randconfig-2200-20261001    clang-22   smatch
i386                  randconfig-2300-20261001    gcc-14     sparse
i386                  randconfig-2301-20261001    gcc-14     sparse
i386                  randconfig-2302-20261001    gcc-14     sparse
i386                 randconfig-r2101-20261001    gcc-14     cocci
i386                 randconfig-r2307-20261001    gcc-14     sparse
i386                 randconfig-r2309-20261001    gcc-14     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261002    gcc-13.4.0
loongarch             randconfig-1001-20261002    gcc-13.4.0
loongarch            randconfig-r2202-20261001    clang-21   smatch
loongarch            randconfig-r2304-20261001    gcc-16.1.0 sparse
loongarch            randconfig-r2308-20261001    gcc-14     sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5272c3_defconfig    gcc-16.1.0
m68k                        m5275evb_defconfig    gcc-16.1.0
m68k                       m54418evb_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2103-20261001    gcc-14     cocci
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
mips                            ip28_defconfig    gcc-16.1.0
mips                         maltaup_defconfig    gcc-16.1.0
mips                     maltaup_xpa_defconfig    gcc-16.1.0
mips                            mtx1_defconfig    gcc-16.1.0
mips                 randconfig-r2301-20261001    gcc-16.1.0 sparse
mips                 randconfig-r2303-20261001    gcc-13.4.0 sparse
mips                 randconfig-r2308-20261001    gcc-14     sparse
nios2                          3c120_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261002    gcc-13.4.0
nios2                 randconfig-1001-20261002    gcc-13.4.0
nios2                randconfig-r2106-20261001    gcc-13.4.0 cocci
nios2                randconfig-r2201-20261001    gcc-10.5.0 smatch
nios2                randconfig-r2305-20261001    gcc-16.1.0 sparse
openrisc                          alldefconfig    gcc-16.1.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2103-20261001    clang-24   cocci
openrisc             randconfig-r2200-20261001    gcc-14.3.0 smatch
openrisc             randconfig-r2300-20261001    gcc-16.1.0 sparse
openrisc             randconfig-r2307-20261001    gcc-14     sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261002    gcc-14.3.0
parisc                randconfig-1001-20261002    gcc-14.3.0
parisc               randconfig-r2100-20261001    gcc-9.5.0  cocci
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.1.0
powerpc                        eiger_defconfig    gcc-16.1.0
powerpc                       katmai_defconfig    gcc-16.1.0
powerpc                       pcm030_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261002    gcc-14.3.0
powerpc               randconfig-1001-20261002    gcc-14.3.0
powerpc              randconfig-r2101-20261001    clang-24   cocci
powerpc              randconfig-r2102-20261001    clang-24   cocci
powerpc              randconfig-r2308-20261001    gcc-8.5.0  sparse
powerpc                      tqm8548_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261002    gcc-14.3.0
powerpc64             randconfig-1001-20261002    gcc-14.3.0
powerpc64            randconfig-r2304-20261001    gcc-16.1.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261002    clang-24
riscv                 randconfig-1001-20261002    clang-24
riscv                 randconfig-2000-20261001    gcc-10.5.0
riscv                 randconfig-2001-20261001    gcc-10.5.0
riscv                randconfig-r2107-20261001    gcc-13.4.0 cocci
riscv                randconfig-r2300-20261001    gcc-13.4.0 sparse
riscv                randconfig-r2300-20261001    gcc-16.1.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261002    clang-24
s390                  randconfig-1001-20261002    clang-24
s390                  randconfig-2000-20261001    gcc-10.5.0
s390                  randconfig-2001-20261001    gcc-10.5.0
s390                 randconfig-r2302-20261001    gcc-16.1.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          apsh4a3a_defconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                           lboxre2_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261002    clang-24
sh                    randconfig-1001-20261002    clang-24
sh                    randconfig-2000-20261001    gcc-10.5.0
sh                    randconfig-2001-20261001    gcc-10.5.0
sh                   randconfig-r2100-20261001    clang-24   cocci
sh                   randconfig-r2303-20261001    gcc-16.1.0 sparse
sh                   randconfig-r2305-20261001    gcc-16.1.0 sparse
sh                       rts7751r2d1_defconfig    gcc-16.1.0
sh                           sdk7780_defconfig    gcc-16.1.0
sh                            se7724_defconfig    gcc-16.1.0
sh                            se7780_defconfig    gcc-16.1.0
sh                             shmin_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261002    clang-24
sparc                 randconfig-1001-20261002    clang-24
sparc                 randconfig-2000-20261001    clang-24
sparc                 randconfig-2001-20261001    clang-24
sparc                randconfig-r2107-20261001    gcc-8.5.0  cocci
sparc                randconfig-r2201-20261001    gcc-15.2.0 smatch
sparc                randconfig-r2202-20261001    gcc-13.4.0 smatch
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261002    clang-24
sparc64               randconfig-1001-20261002    clang-24
sparc64               randconfig-2000-20261001    clang-24
sparc64               randconfig-2001-20261001    clang-24
sparc64              randconfig-r2106-20261001    gcc-8.5.0  cocci
sparc64              randconfig-r2304-20261001    gcc-13.4.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261002    clang-24
um                    randconfig-1001-20261002    clang-24
um                    randconfig-2000-20261001    clang-24
um                    randconfig-2001-20261001    clang-24
um                   randconfig-r2100-20261001    gcc-14     cocci
um                   randconfig-r2102-20261001    gcc-14     cocci
um                   randconfig-r2103-20261001    gcc-9.5.0  cocci
um                   randconfig-r2104-20261001    clang-24   cocci
um                   randconfig-r2202-20261001    clang-24   smatch
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261002    gcc-14
x86_64      buildonly-randconfig-1001-20261002    gcc-14
x86_64      buildonly-randconfig-1002-20261002    gcc-14
x86_64      buildonly-randconfig-1003-20261002    gcc-14
x86_64      buildonly-randconfig-1004-20261002    gcc-14
x86_64      buildonly-randconfig-1005-20261002    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261002    gcc-14
x86_64                randconfig-1001-20261002    gcc-14
x86_64                randconfig-1002-20261002    gcc-14
x86_64                randconfig-1003-20261002    gcc-14
x86_64                randconfig-1004-20261002    gcc-14
x86_64                randconfig-1005-20261002    gcc-14
x86_64                randconfig-1006-20261002    clang-22
x86_64                randconfig-1007-20261002    clang-22
x86_64                randconfig-1008-20261002    clang-22
x86_64                randconfig-1009-20261002    clang-22
x86_64                randconfig-1010-20261002    clang-22
x86_64                randconfig-1011-20261002    clang-22
x86_64                randconfig-1012-20261002    clang-22
x86_64                randconfig-1013-20261002    clang-22
x86_64                randconfig-1014-20261002    clang-22
x86_64                randconfig-1015-20261002    clang-22
x86_64                randconfig-1016-20261002    clang-22
x86_64                randconfig-1017-20261002    clang-22
x86_64                randconfig-2100-20261001    gcc-14     cocci
x86_64                randconfig-2101-20261001    gcc-14     cocci
x86_64                randconfig-2102-20261001    gcc-14     cocci
x86_64                randconfig-2103-20261001    gcc-14     cocci
x86_64                randconfig-2200-20261001    clang-22   smatch
x86_64                randconfig-2300-20261001    gcc-14     sparse
x86_64                randconfig-2301-20261001    gcc-14     sparse
x86_64                randconfig-2302-20261001    gcc-14     sparse
x86_64               randconfig-r2104-20261001    gcc-13.4.0 cocci
x86_64               randconfig-r2301-20261001    gcc-13.4.0 sparse
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
xtensa                randconfig-1000-20261002    clang-24
xtensa                randconfig-1001-20261002    clang-24
xtensa                randconfig-2000-20261001    clang-24
xtensa                randconfig-2001-20261001    clang-24
xtensa               randconfig-r2104-20261001    gcc-8.5.0  cocci
xtensa               randconfig-r2105-20261001    clang-24   cocci
xtensa               randconfig-r2107-20261001    clang-24   cocci
xtensa                     smp_lx200_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
