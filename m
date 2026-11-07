Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046768;
	b=T1WTv8PkdZRzLoriMw/iauhFo4cfqt9i13emIcCpBbdeh8GJBDc5FnZhPPmjChoAUEX8
	 lMlogE5rkWTOZK8kUrl2QPY4/9iJQ82nOvrGmJC5u72ylducbGa3BE0VGqEhiPjMrG7Hz
	 TuSU+UMJSUKSQlqKain0DMkeSNIHB6FhZkVFxHxTsIJZ4Afl0/JTMWCvxT7zd0+92g8XS
	 lvErA30KmfVuuR2PIto2cUdv8jyLPXci+y5Jd93bEFjiOzUC1toEkaV/PA9upT7bXEigY
	 g9QDmjVhqQavbwr2FP7cdjh7rhsyuqo3jWCxI+jmwITojpFfY8gnPILmY/gq629UASA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046768;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WuRKVbuKp1QuGZuMZh5gTVrPfCD0MBaoi/jveRMJ3bU=;
	b=m9jqu8SueHUO8JavcuyD2XmCbiZRF43tkoHrZcR6lrm2T12urh9oD+DWjPJctIBJEslV
	 Ov85+XVroh4mM8DrnYYRbqAlrP6prng9wlyDlvdJh4tXtcHV9CxF8n6kCGbN+iEz73jOE
	 Mft7+QtSzso2wY61gWLc342j6lhnQTUc02WBN3iSBFmFx/nKPWjJn+ybtJD7yNLFrRi9l
	 XgHxA5T07yxfP1mcBpSqneK1paQO20dTCCebrrqOLVHDVFlxe0EjGtXnP1MmrwXVf6ZC0
	 UZ/f2stjw0w+L5sAHQrRlY61Sy3mgHXFYRKXZrGOA7Rl0MdTWHJ8NxsyBWLEByWMyFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SFQdhPZq;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E53F606EEAB
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E53F606EEAB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SFQdhPZq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794046768; x=1825582768;
  h=date:from:to:cc:subject:message-id;
  bh=jG+UqNAERinrVzaxRGfQFioiHuBDGcYvgF02z+jxybA=;
  b=SFQdhPZqk90VWlIXLQuL2P3xpbTlqlXBob7hCrYp7G8qmrmyZ8Gh9WuN
   kmbptdaBd8ysKr9/zgjSdon/nkjT+WUEOfx7JezcUgcXMBh7oFUDAgQt9
   VnEhhRGAVMbC+p8tM34gBls8Vzrwrz5cGS419P2tuwCcwDTEhUL+wIJjv
   hgyV9mehxm9WM46u8Y/kkmRIlFlB8OaI3OS2gfrLlx66f0xBXuDUXCTvz
   ZgvA4+Q7TN3u2O7csFehEgieAyzujWMqaBiVdMrE+1QLtau7jLVHE0zFz
   s7oigJW9FeAkRB6EhaKIAYv1NR4en9nE3R0SEvUrHmRa+Ub0xWrtSc3Js
   A==;
X-CSE-ConnectionGUID: PgAQdoWSTPypBn0INmp9Ww==
X-CSE-MsgGUID: OpIWW+FeTjCDMleIESz3JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2843749"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2843749"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 02:19:26 -0800
X-CSE-ConnectionGUID: 8BaS4+fBR72HvNxzbemvxw==
X-CSE-MsgGUID: fgFuZfp2SLeDJ88Csi78Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9250233"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 07 Nov 2026 02:19:24 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPdW6-00000000qhr-1KJt;
	Sat, 07 Nov 2026 10:19:22 +0000
Date: Sat, 07 Nov 2026 18:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf:urgent] BUILD SUCCESS
 6f083fbccd5f06889bc08e1182bd02c0383b9121
Message-ID: <20261107181826.VXH63DJ1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/urgent
branch HEAD: 6f083fbccd5f06889bc08e1182bd02c0383b9121  perf/core: Don't send SIGTRAP after exec removed the event

elapsed time: 960m

configs tested: 368
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261106    gcc-8.5.0
alpha                 randconfig-2001-20261106    gcc-8.5.0
alpha                 randconfig-2200-20261106    gcc-14.4.0 smatch
alpha                randconfig-r2110-20261106    gcc-9.5.0  cocci
arc                               alldefconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                               allmodconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                             hsdk_defconfig    gcc-16.2.0
arc                         nsimosci_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261107    gcc-12.5.0
arc                   randconfig-1001-20261107    gcc-12.5.0
arc                   randconfig-2000-20261106    gcc-12.5.0
arc                   randconfig-2001-20261106    gcc-12.5.0
arc                   randconfig-2002-20261106    gcc-12.5.0
arc                   randconfig-2003-20261106    gcc-12.5.0
arc                   randconfig-2004-20261106    gcc-12.5.0
arc                   randconfig-2005-20261106    gcc-12.5.0
arc                   randconfig-2200-20261106    gcc-10.5.0 smatch
arc                  randconfig-r2111-20261106    gcc-16.2.0 cocci
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                            h3600_defconfig    gcc-16.2.0
arm                           ixp4xx_defconfig    gcc-16.2.0
arm                         multi_v7_defconfig    gcc-16.2.0
arm                         mvebu_v5_defconfig    gcc-16.2.0
arm                         neponset_defconfig    gcc-16.2.0
arm                           pxa910_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261107    gcc-12.5.0
arm                   randconfig-1001-20261107    gcc-12.5.0
arm                   randconfig-1002-20261107    gcc-12.5.0
arm                   randconfig-1003-20261107    gcc-12.5.0
arm                   randconfig-2000-20261106    gcc-9.5.0
arm                   randconfig-2001-20261106    gcc-9.5.0
arm                   randconfig-2002-20261106    gcc-9.5.0
arm                   randconfig-2200-20261106    clang-17   smatch
arm                  randconfig-r2109-20261106    gcc-16.2.0 cocci
arm                  randconfig-r2300-20261106    gcc-14     sparse
arm                              rpc_defconfig    gcc-16.2.0
arm                            spitz_defconfig    gcc-16.2.0
arm                          vf610m4_defconfig    clang-17
arm                     vt8500_v6_v7_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261107    gcc-11.5.0
arm64                 randconfig-1001-20261107    gcc-11.5.0
arm64                 randconfig-1002-20261107    gcc-11.5.0
arm64                 randconfig-1003-20261107    gcc-11.5.0
arm64                 randconfig-2000-20261106    gcc-9.5.0
arm64                 randconfig-2001-20261106    gcc-9.5.0
arm64                 randconfig-2002-20261106    gcc-9.5.0
arm64                 randconfig-2200-20261106    clang-24   smatch
arm64                randconfig-r2102-20261106    gcc-13.5.0 cocci
arm64                randconfig-r2304-20261106    gcc-14     sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261107    gcc-11.5.0
csky                  randconfig-1001-20261107    gcc-11.5.0
csky                  randconfig-2000-20261106    clang-24
csky                  randconfig-2001-20261106    clang-24
csky                  randconfig-2200-20261106    gcc-10.5.0 smatch
csky                 randconfig-r2107-20261106    gcc-16.2.0 cocci
csky                 randconfig-r2108-20261106    gcc-16.2.0 cocci
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261107    clang-18
hexagon               randconfig-1001-20261107    clang-18
hexagon               randconfig-2000-20261106    clang-24
hexagon               randconfig-2001-20261106    clang-24
hexagon               randconfig-2200-20261106    clang-24   smatch
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261107    gcc-14
i386        buildonly-randconfig-1001-20261107    gcc-14
i386        buildonly-randconfig-1002-20261107    gcc-14
i386        buildonly-randconfig-1003-20261107    gcc-14
i386        buildonly-randconfig-1004-20261107    gcc-14
i386        buildonly-randconfig-1005-20261107    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261107    clang-22
i386                  randconfig-1001-20261107    clang-22
i386                  randconfig-1002-20261107    clang-22
i386                  randconfig-1003-20261107    clang-22
i386                  randconfig-1004-20261107    clang-22
i386                  randconfig-1005-20261107    clang-22
i386                  randconfig-1006-20261107    clang-22
i386                  randconfig-1007-20261107    clang-22
i386                  randconfig-1008-20261107    clang-22
i386                  randconfig-1009-20261107    clang-22
i386                  randconfig-1010-20261107    clang-22
i386                  randconfig-1011-20261107    clang-22
i386                  randconfig-1012-20261107    clang-22
i386                  randconfig-1013-20261107    clang-22
i386                  randconfig-2000-20261106    gcc-14
i386                  randconfig-2001-20261106    gcc-14
i386                  randconfig-2002-20261106    gcc-14
i386                  randconfig-2003-20261106    gcc-14
i386                  randconfig-2004-20261106    gcc-14
i386                  randconfig-2005-20261106    gcc-14
i386                  randconfig-2100-20261106    clang-22   cocci
i386                  randconfig-2101-20261106    clang-22   cocci
i386                  randconfig-2102-20261106    clang-22   cocci
i386                  randconfig-2103-20261106    clang-22   cocci
i386                  randconfig-2104-20261106    clang-22   cocci
i386                  randconfig-2105-20261106    clang-22   cocci
i386                  randconfig-2300-20261106    clang-22   sparse
i386                  randconfig-2301-20261106    clang-22   sparse
i386                  randconfig-2302-20261106    clang-22   sparse
i386                 randconfig-r2111-20261106    gcc-9.5.0  cocci
i386                 randconfig-r2307-20261106    gcc-8.5.0  sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261107    clang-18
loongarch             randconfig-1001-20261107    clang-18
loongarch             randconfig-2000-20261106    clang-19
loongarch             randconfig-2001-20261106    clang-19
loongarch             randconfig-2200-20261106    clang-24   smatch
loongarch            randconfig-r2100-20261106    gcc-13.5.0 cocci
loongarch            randconfig-r2102-20261106    gcc-14     cocci
loongarch            randconfig-r2106-20261106    gcc-16.2.0 cocci
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261106    gcc-8.5.0
m68k                  randconfig-2001-20261106    gcc-8.5.0
m68k                  randconfig-2200-20261106    gcc-11.5.0 smatch
m68k                 randconfig-r2308-20261106    gcc-8.5.0  sparse
m68k                 randconfig-r2311-20261106    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261106    gcc-8.5.0
microblaze            randconfig-2001-20261106    gcc-8.5.0
microblaze            randconfig-2200-20261106    gcc-14.4.0 smatch
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    clang-17
mips                      decstation_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261106    gcc-8.5.0
mips                  randconfig-2001-20261106    gcc-8.5.0
mips                  randconfig-2002-20261106    gcc-8.5.0
mips                  randconfig-2200-20261106    clang-17   smatch
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261107    clang-18
nios2                 randconfig-1001-20261107    clang-18
nios2                 randconfig-2000-20261106    clang-19
nios2                 randconfig-2001-20261106    clang-19
nios2                 randconfig-2200-20261106    gcc-10.5.0 smatch
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261106    gcc-8.5.0
openrisc              randconfig-2001-20261106    gcc-8.5.0
openrisc              randconfig-2002-20261106    gcc-8.5.0
openrisc              randconfig-2200-20261106    gcc-16.2.0 smatch
openrisc             randconfig-r2103-20261106    gcc-13.5.0 cocci
openrisc             randconfig-r2107-20261106    gcc-9.5.0  cocci
openrisc                  simple_smp_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261107    clang-24
parisc                randconfig-1001-20261107    clang-24
parisc                randconfig-2000-20261106    clang-19
parisc                randconfig-2001-20261106    clang-19
parisc                randconfig-2200-20261106    gcc-12.5.0 smatch
parisc               randconfig-r2105-20261106    gcc-13.5.0 cocci
parisc               randconfig-r2106-20261106    gcc-9.5.0  cocci
parisc               randconfig-r2305-20261106    gcc-14     sparse
parisc               randconfig-r2310-20261106    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    gcc-16.2.0
powerpc                     ge_imp3a_defconfig    clang-17
powerpc                       katmai_defconfig    gcc-16.2.0
powerpc                       mgcoge_defconfig    gcc-16.2.0
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc                      ppa8548_defconfig    clang-17
powerpc                      rainier_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261107    clang-24
powerpc               randconfig-1001-20261107    clang-24
powerpc               randconfig-2000-20261106    gcc-8.5.0
powerpc               randconfig-2001-20261106    gcc-8.5.0
powerpc               randconfig-2002-20261106    gcc-8.5.0
powerpc               randconfig-2200-20261106    clang-24   smatch
powerpc              randconfig-r2100-20261106    gcc-14     cocci
powerpc              randconfig-r2109-20261106    gcc-9.5.0  cocci
powerpc              randconfig-r2301-20261106    gcc-14     sparse
powerpc                      tqm8555_defconfig    gcc-16.2.0
powerpc                      tqm8560_defconfig    clang-17
powerpc                         warp_defconfig    clang-17
powerpc64             randconfig-1000-20261107    clang-24
powerpc64             randconfig-1001-20261107    clang-24
powerpc64             randconfig-2000-20261106    gcc-8.5.0
powerpc64             randconfig-2001-20261106    gcc-8.5.0
powerpc64             randconfig-2002-20261106    gcc-8.5.0
powerpc64             randconfig-2200-20261106    gcc-8.5.0  smatch
powerpc64            randconfig-r2108-20261106    gcc-9.5.0  cocci
powerpc64            randconfig-r2303-20261106    gcc-14     sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                     nommu_k210_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261107    gcc-11.5.0
riscv                 randconfig-1001-20261107    gcc-11.5.0
riscv                 randconfig-2000-20261106    gcc-13.5.0
riscv                 randconfig-2001-20261106    gcc-13.5.0
riscv                 randconfig-2002-20261106    gcc-13.5.0
riscv                 randconfig-2003-20261106    gcc-13.5.0
riscv                 randconfig-2004-20261106    gcc-13.5.0
riscv                 randconfig-2005-20261106    gcc-13.5.0
riscv                 randconfig-2200-20261106    gcc-11.5.0 smatch
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261107    gcc-11.5.0
s390                  randconfig-1001-20261107    gcc-11.5.0
s390                  randconfig-2000-20261106    gcc-8.5.0
s390                  randconfig-2001-20261106    gcc-8.5.0
s390                  randconfig-2002-20261106    gcc-8.5.0
s390                  randconfig-2003-20261106    gcc-8.5.0
s390                  randconfig-2004-20261106    gcc-8.5.0
s390                  randconfig-2005-20261106    gcc-8.5.0
s390                  randconfig-2200-20261106    clang-18   smatch
s390                 randconfig-r2104-20261106    gcc-13.5.0 cocci
s390                 randconfig-r2104-20261106    gcc-14     cocci
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           r7780mp_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261107    gcc-11.5.0
sh                    randconfig-1001-20261107    gcc-11.5.0
sh                    randconfig-2000-20261106    gcc-16.2.0
sh                    randconfig-2001-20261106    gcc-16.2.0
sh                    randconfig-2002-20261106    gcc-16.2.0
sh                    randconfig-2003-20261106    gcc-16.2.0
sh                    randconfig-2004-20261106    gcc-16.2.0
sh                    randconfig-2005-20261106    gcc-16.2.0
sh                    randconfig-2200-20261106    gcc-16.2.0 smatch
sh                   randconfig-r2110-20261106    gcc-16.2.0 cocci
sh                   randconfig-r2309-20261106    gcc-8.5.0  sparse
sh                            se7712_defconfig    gcc-16.2.0
sh                            se7751_defconfig    gcc-16.2.0
sh                            sh2007_defconfig    gcc-16.2.0
sh                         sh7785lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261107    gcc-10.5.0
sparc                 randconfig-1001-20261107    gcc-10.5.0
sparc                 randconfig-2000-20261106    gcc-8.5.0
sparc                 randconfig-2001-20261106    gcc-8.5.0
sparc                 randconfig-2200-20261106    gcc-8.5.0  smatch
sparc                randconfig-r2101-20261106    gcc-13.5.0 cocci
sparc                randconfig-r2105-20261106    gcc-14     cocci
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261107    gcc-10.5.0
sparc64               randconfig-1001-20261107    gcc-10.5.0
sparc64               randconfig-2000-20261106    gcc-8.5.0
sparc64               randconfig-2001-20261106    gcc-8.5.0
sparc64               randconfig-2200-20261106    gcc-8.5.0  smatch
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261107    gcc-10.5.0
um                    randconfig-1001-20261107    gcc-10.5.0
um                    randconfig-2000-20261106    gcc-8.5.0
um                    randconfig-2001-20261106    gcc-8.5.0
um                    randconfig-2200-20261106    gcc-13     smatch
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    gcc-16.2.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261107    gcc-14
x86_64      buildonly-randconfig-1001-20261107    gcc-14
x86_64      buildonly-randconfig-1002-20261107    gcc-14
x86_64      buildonly-randconfig-1003-20261107    gcc-14
x86_64      buildonly-randconfig-1004-20261107    gcc-14
x86_64      buildonly-randconfig-1005-20261107    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261107    gcc-14
x86_64                randconfig-1001-20261107    gcc-14
x86_64                randconfig-1002-20261107    gcc-14
x86_64                randconfig-1003-20261107    gcc-14
x86_64                randconfig-1004-20261107    gcc-14
x86_64                randconfig-1005-20261107    gcc-14
x86_64                randconfig-1006-20261107    gcc-13
x86_64                randconfig-1007-20261107    gcc-13
x86_64                randconfig-1008-20261107    gcc-13
x86_64                randconfig-1009-20261107    gcc-13
x86_64                randconfig-1010-20261107    gcc-13
x86_64                randconfig-1011-20261107    gcc-13
x86_64                randconfig-1012-20261107    clang-22
x86_64                randconfig-1013-20261107    clang-22
x86_64                randconfig-1014-20261107    clang-22
x86_64                randconfig-1015-20261107    clang-22
x86_64                randconfig-1016-20261107    clang-22
x86_64                randconfig-1017-20261107    clang-22
x86_64                randconfig-2000-20261106    gcc-14
x86_64                randconfig-2001-20261106    gcc-14
x86_64                randconfig-2002-20261106    gcc-14
x86_64                randconfig-2003-20261106    gcc-14
x86_64                randconfig-2004-20261106    gcc-14
x86_64                randconfig-2005-20261106    gcc-14
x86_64                randconfig-2100-20261106    clang-22   cocci
x86_64                randconfig-2101-20261106    clang-22   cocci
x86_64                randconfig-2102-20261106    clang-22   cocci
x86_64                randconfig-2103-20261106    clang-22   cocci
x86_64                randconfig-2104-20261106    clang-22   cocci
x86_64                randconfig-2105-20261106    clang-22   cocci
x86_64                randconfig-2200-20261106    gcc-14     smatch
x86_64                randconfig-2300-20261106    clang-22   sparse
x86_64                randconfig-2301-20261106    clang-22   sparse
x86_64                randconfig-2302-20261106    clang-22   sparse
x86_64               randconfig-r2101-20261106    gcc-14     cocci
x86_64               randconfig-r2103-20261106    gcc-14     cocci
x86_64               randconfig-r2302-20261106    gcc-14     sparse
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
xtensa                randconfig-1000-20261107    gcc-10.5.0
xtensa                randconfig-1001-20261107    gcc-10.5.0
xtensa                randconfig-2000-20261106    clang-24
xtensa                randconfig-2001-20261106    clang-24
xtensa                randconfig-2200-20261106    gcc-8.5.0  smatch
xtensa               randconfig-r2306-20261106    gcc-8.5.0  sparse
xtensa                          virt_defconfig    gcc-16.2.0
xtensa                     xip_kc705_defconfig    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
