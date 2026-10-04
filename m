Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5BB45039
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 02:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791079543; cv=none; b=RjIIyjt7rsmFT3Qkiw/K64exsS4UgAgLhaPVzkwzg2CxqHMIJzljEIux4g3D9Addnr+db1aPTKlXxH8k+QzoT5GAp0f1/xxZguzLtTYLyA3/uXZ6+rvXla/JbGntCeYTiQEQGZmp5+BmiggN/XU0u9NYQUZ5GcCvWnsW9VGYQAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791079543; c=relaxed/simple;
	bh=3pi3hEWdVMfY1yEjTuQBKpGkdAOfPPvkxFHuPtv5BFM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BsAFfoYy0iBwRkZRiq0e5wv/0oBhrleuEbZuVblqlkgJhnkTZZKxoSACz165pKtqXaMqXI1sYtcsOs7zmcjTBtsyCEawluVdr3/PFQndKRNEkKV2600IpJqxPrGUgwwIXHuiANEEeSouHoLhbYn+HF3GWs5wk2tHWzJb+uu6svA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jowdaC1H; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jowdaC1H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791079541; x=1822615541;
  h=date:from:to:cc:subject:message-id;
  bh=3pi3hEWdVMfY1yEjTuQBKpGkdAOfPPvkxFHuPtv5BFM=;
  b=jowdaC1HGblI5lBVshoVi4N/ST2zcI1Gz9ianPIsv7UIVFPSy/mdoxBR
   m9087FugLH8czm8qaP0/g43xmtng9cdKBF8GOnIZ0K2+gHM96aaK+DNqo
   LsJohMZILR/fDrs1xNHmEUc+Jfqy5MTBGILcxYo50IWHgV2Jb2mgBqz1F
   COTTcR+Zzp1iAml17lsIqclH8a4guWLVL66Fw6aox1NHFBX95os65Kh3J
   URwCvb9Kh6/fMEHbePfvfBaiqMpxyAo9GKs8v4HYH548LgllLfxYJTD4R
   u9fOi4B34VGSxVZnpwfcZUkwiq7eDsbZozEOpnvU1Hna451FymUvZtvdb
   w==;
X-CSE-ConnectionGUID: GekjGLI7SUagyBZHIvgp9g==
X-CSE-MsgGUID: HdZ5qIttQq2sbCPCbMNVtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="79352471"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="79352471"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 19:05:40 -0700
X-CSE-ConnectionGUID: ygdnK8AdS+SLvywbVMQJNQ==
X-CSE-MsgGUID: aPTcOvdLQ+WyDMf89QgIjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="616753"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 03 Oct 2026 19:05:40 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDBbc-00000000UNd-3Nwc;
	Sun, 04 Oct 2026 02:05:36 +0000
Date: Sun, 04 Oct 2026 10:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:bugs] BUILD SUCCESS
 1847c80537891baead3975f3ca969233ff7b2a11
Message-ID: <202610041005.l27ETa1F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/bugs
branch HEAD: 1847c80537891baead3975f3ca969233ff7b2a11  x86/bugs: Fix CONFIG_MITIGATION_RETPOLINE=n mitigation reporting

elapsed time: 1229m

configs tested: 279
configs skipped: 123

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2202-20261003    gcc-11.5.0 smatch
arc                               alldefconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                  nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261003    clang-17
arc                   randconfig-1000-20261004    clang-22
arc                   randconfig-1001-20261003    clang-17
arc                   randconfig-1001-20261004    clang-22
arc                  randconfig-r2105-20261003    gcc-8.5.0  cocci
arc                  randconfig-r2106-20261003    gcc-8.5.0  cocci
arc                  randconfig-r2302-20261003    gcc-13.4.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                           collie_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                           ixp4xx_defconfig    clang-24
arm                       jornada720_defconfig    clang-24
arm                          nhk8815_defconfig    clang-24
arm                              pxa_defconfig    clang-24
arm                   randconfig-1000-20261003    clang-17
arm                   randconfig-1000-20261004    clang-22
arm                   randconfig-1001-20261003    clang-17
arm                   randconfig-1001-20261004    clang-22
arm                   randconfig-1002-20261003    clang-17
arm                   randconfig-1002-20261004    clang-22
arm                   randconfig-1003-20261003    clang-17
arm                   randconfig-1003-20261004    clang-22
arm                  randconfig-r2103-20261003    gcc-14     cocci
arm                  randconfig-r2309-20261003    gcc-8.5.0  sparse
arm                          socfpga_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261003    gcc-9.5.0
arm64                 randconfig-1000-20261004    gcc-16.1.0
arm64                 randconfig-1001-20261003    gcc-9.5.0
arm64                 randconfig-1001-20261004    gcc-16.1.0
arm64                 randconfig-1002-20261003    gcc-9.5.0
arm64                 randconfig-1002-20261004    gcc-16.1.0
arm64                 randconfig-1003-20261003    gcc-9.5.0
arm64                 randconfig-1003-20261004    gcc-16.1.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261003    gcc-9.5.0
csky                  randconfig-1000-20261004    gcc-16.1.0
csky                  randconfig-1001-20261003    gcc-9.5.0
csky                  randconfig-1001-20261004    gcc-16.1.0
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261003    gcc-16.1.0
hexagon               randconfig-1000-20261004    gcc-16.1.0
hexagon               randconfig-1001-20261003    gcc-16.1.0
hexagon               randconfig-1001-20261004    gcc-16.1.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261003    gcc-14
i386        buildonly-randconfig-1000-20261004    clang-22
i386        buildonly-randconfig-1001-20261003    gcc-14
i386        buildonly-randconfig-1001-20261004    clang-22
i386        buildonly-randconfig-1002-20261003    gcc-14
i386        buildonly-randconfig-1002-20261004    clang-22
i386        buildonly-randconfig-1003-20261003    gcc-14
i386        buildonly-randconfig-1003-20261004    clang-22
i386        buildonly-randconfig-1004-20261003    gcc-14
i386        buildonly-randconfig-1004-20261004    clang-22
i386        buildonly-randconfig-1005-20261003    gcc-14
i386        buildonly-randconfig-1005-20261004    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261003    gcc-14
i386                  randconfig-1001-20261003    gcc-14
i386                  randconfig-1002-20261003    gcc-14
i386                  randconfig-1003-20261003    gcc-14
i386                  randconfig-1004-20261003    gcc-14
i386                  randconfig-1005-20261003    gcc-14
i386                  randconfig-1006-20261003    gcc-14
i386                  randconfig-1007-20261003    gcc-14
i386                  randconfig-1008-20261003    gcc-14
i386                  randconfig-1009-20261003    gcc-14
i386                  randconfig-1010-20261003    gcc-14
i386                  randconfig-1011-20261003    gcc-14
i386                  randconfig-1012-20261003    gcc-14
i386                  randconfig-1013-20261003    gcc-14
i386                  randconfig-2100-20261003    gcc-14     cocci
i386                  randconfig-2101-20261003    clang-22   cocci
i386                  randconfig-2101-20261003    gcc-14     cocci
i386                  randconfig-2102-20261003    gcc-14     cocci
i386                  randconfig-2103-20261003    clang-22   cocci
i386                  randconfig-2103-20261003    gcc-14     cocci
i386                  randconfig-2200-20261003    gcc-14     smatch
i386                  randconfig-2300-20261003    clang-22   sparse
i386                  randconfig-2301-20261003    clang-22   sparse
i386                  randconfig-2302-20261003    clang-22   sparse
i386                 randconfig-r2306-20261003    gcc-8.5.0  sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261003    gcc-16.1.0
loongarch             randconfig-1000-20261004    gcc-16.1.0
loongarch             randconfig-1001-20261003    gcc-16.1.0
loongarch             randconfig-1001-20261004    gcc-16.1.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                 randconfig-r2304-20261003    gcc-13.4.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           eyeq6_defconfig    gcc-16.1.0
mips                            ip32_defconfig    gcc-16.1.0
mips                 malta_qemu_32r6_defconfig    gcc-16.1.0
mips                 randconfig-r2303-20261003    gcc-13.4.0 sparse
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261003    gcc-16.1.0
nios2                 randconfig-1000-20261004    gcc-16.1.0
nios2                 randconfig-1001-20261003    gcc-16.1.0
nios2                 randconfig-1001-20261004    gcc-16.1.0
nios2                randconfig-r2100-20261003    gcc-14     cocci
nios2                randconfig-r2101-20261003    gcc-14     cocci
nios2                randconfig-r2200-20261003    gcc-8.5.0  smatch
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2104-20261003    gcc-8.5.0  cocci
openrisc             randconfig-r2202-20261003    gcc-12.5.0 smatch
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                 generic-32bit_defconfig    gcc-16.1.0
parisc                randconfig-1000-20261003    gcc-11.5.0
parisc                randconfig-1000-20261004    gcc-12.5.0
parisc                randconfig-1001-20261003    gcc-11.5.0
parisc                randconfig-1001-20261004    gcc-12.5.0
parisc64                          alldefconfig    gcc-16.1.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                      powernv_defconfig    clang-24
powerpc               randconfig-1000-20261003    gcc-11.5.0
powerpc               randconfig-1000-20261004    gcc-12.5.0
powerpc               randconfig-1001-20261003    gcc-11.5.0
powerpc               randconfig-1001-20261004    gcc-12.5.0
powerpc64             randconfig-1000-20261003    gcc-11.5.0
powerpc64             randconfig-1000-20261004    gcc-12.5.0
powerpc64             randconfig-1001-20261003    gcc-11.5.0
powerpc64             randconfig-1001-20261004    gcc-12.5.0
powerpc64            randconfig-r2300-20261003    gcc-13.4.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261003    gcc-12.5.0
riscv                 randconfig-1000-20261004    gcc-11.5.0
riscv                 randconfig-1001-20261003    gcc-12.5.0
riscv                 randconfig-1001-20261004    gcc-11.5.0
riscv                 randconfig-2000-20261003    gcc-16.1.0
riscv                 randconfig-2001-20261003    gcc-16.1.0
riscv                randconfig-r2201-20261003    clang-24   smatch
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261003    gcc-12.5.0
s390                  randconfig-1000-20261004    gcc-11.5.0
s390                  randconfig-1001-20261003    gcc-12.5.0
s390                  randconfig-1001-20261004    gcc-11.5.0
s390                  randconfig-2000-20261003    gcc-16.1.0
s390                  randconfig-2001-20261003    gcc-16.1.0
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261003    gcc-12.5.0
sh                    randconfig-1000-20261004    gcc-11.5.0
sh                    randconfig-1001-20261003    gcc-12.5.0
sh                    randconfig-1001-20261004    gcc-11.5.0
sh                    randconfig-2000-20261003    gcc-16.1.0
sh                    randconfig-2001-20261003    gcc-16.1.0
sh                   randconfig-r2201-20261003    gcc-16.1.0 smatch
sh                   randconfig-r2301-20261003    gcc-13.4.0 sparse
sh                            se7724_defconfig    gcc-16.1.0
sh                      sh7710voipgw_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261003    clang-17
sparc                 randconfig-1000-20261004    gcc-14
sparc                 randconfig-1001-20261003    clang-17
sparc                 randconfig-1001-20261004    gcc-14
sparc                 randconfig-2000-20261003    gcc-14
sparc                 randconfig-2001-20261003    gcc-14
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261003    clang-17
sparc64               randconfig-1000-20261004    gcc-14
sparc64               randconfig-1001-20261003    clang-17
sparc64               randconfig-1001-20261004    gcc-14
sparc64               randconfig-2000-20261003    gcc-14
sparc64               randconfig-2001-20261003    gcc-14
sparc64              randconfig-r2305-20261003    gcc-13.4.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261003    clang-17
um                    randconfig-1000-20261004    gcc-14
um                    randconfig-1001-20261003    clang-17
um                    randconfig-1001-20261004    gcc-14
um                    randconfig-2000-20261003    gcc-14
um                    randconfig-2001-20261003    gcc-14
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261003    clang-22
x86_64      buildonly-randconfig-1001-20261003    clang-22
x86_64      buildonly-randconfig-1002-20261003    clang-22
x86_64      buildonly-randconfig-1003-20261003    clang-22
x86_64      buildonly-randconfig-1004-20261003    clang-22
x86_64      buildonly-randconfig-1005-20261003    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261003    clang-22
x86_64                randconfig-1001-20261003    clang-22
x86_64                randconfig-1002-20261003    clang-22
x86_64                randconfig-1003-20261003    clang-22
x86_64                randconfig-1004-20261003    clang-22
x86_64                randconfig-1005-20261003    clang-22
x86_64                randconfig-1006-20261003    clang-22
x86_64                randconfig-1007-20261003    clang-22
x86_64                randconfig-1008-20261003    clang-22
x86_64                randconfig-1009-20261003    clang-22
x86_64                randconfig-1010-20261003    clang-22
x86_64                randconfig-1011-20261003    clang-22
x86_64                randconfig-1012-20261003    clang-22
x86_64                randconfig-1013-20261003    clang-22
x86_64                randconfig-1014-20261003    clang-22
x86_64                randconfig-1015-20261003    clang-22
x86_64                randconfig-1016-20261003    clang-22
x86_64                randconfig-1017-20261003    clang-22
x86_64                randconfig-2100-20261003    clang-22   cocci
x86_64                randconfig-2101-20261003    clang-22   cocci
x86_64                randconfig-2102-20261003    clang-22   cocci
x86_64                randconfig-2103-20261003    clang-22   cocci
x86_64                randconfig-2200-20261003    gcc-14     smatch
x86_64                randconfig-2300-20261003    clang-22   sparse
x86_64                randconfig-2301-20261003    clang-22   sparse
x86_64                randconfig-2302-20261003    clang-22   sparse
x86_64               randconfig-r2102-20261003    gcc-14     cocci
x86_64               randconfig-r2308-20261003    gcc-8.5.0  sparse
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
xtensa                randconfig-1000-20261003    clang-17
xtensa                randconfig-1000-20261004    gcc-14
xtensa                randconfig-1001-20261003    clang-17
xtensa                randconfig-1001-20261004    gcc-14
xtensa                randconfig-2000-20261003    gcc-14
xtensa                randconfig-2001-20261003    gcc-14
xtensa               randconfig-r2107-20261003    gcc-8.5.0  cocci
xtensa               randconfig-r2200-20261003    gcc-8.5.0  smatch
xtensa               randconfig-r2307-20261003    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
