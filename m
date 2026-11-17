Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915980;
	b=W/fg8wtgbqYmQkARFDC/5bTqKOpjSfh6GX3hoxWGlfTHXMzdhtPSIHQdpxzNS0M47NYu
	 HVl4AU9uW8yuSsfM8Ls847nDow7QoNFtMhO3uhHqIYl3PhHoxqAZk4fqLXu+aNcrfkYX8
	 +ck1f9e40Rra6Ot606Tofv1e1eh6V6pmtK2QJMs1bhl+oiEK1MxvnGPa86ZFSDXqWLArR
	 +7djaaCFEHuquspBUoD7QcdRMSF4nsBYrohL892sBwOTFdXPy0+AXzvExy8AjIwljpNou
	 dZy+w6WzH95tSvHSkN+Z2k+X2Hl6IUrIEigH53m4i6j2H2Dxol4PHxEfRYgnrp/8Yew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915980;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=VKyPbL/0FjVAG5PQ9OrDH7lvTuPwg8MaBqAM+2z63WY=;
	b=2krnHwAReoXUQRoMmnurpHw9iu/o7IeqginxsUXiyRr3t6qIRKipuO02XpNioQeZSgku
	 v7zEuuMsFHlBv1lqn1giwCb5acO/qi8iPuF0f3CEqvPQLUEPdiX2pxpVJsABTd1uNa+Zn
	 lfGGaVS1z2qRUCKzm8ZAbiQshza/Y7tfOP7//0Pn5vSliI+VmkgN9ksn8Jx1NF2CYsrVQ
	 9rq+dia7sBO5+opnWwYIZ5Sqk9GTh7Toll13JzPXxr00ZyrdYn/UgDDZArkz0azMWEu+k
	 IdyO7n2foY5nIzdIPaXmqoYvWdB3/h7rk+OJZ7b2MNNDA+PBUP4LLEDZ8/qXtnlxG+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SSCQzNxC;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8E1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SSCQzNxC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794915980; x=1826451980;
  h=date:from:to:cc:subject:message-id;
  bh=aP54VjaHGAwxngNdNnYPlP0LdLJXPWVl/HVAU6tajlc=;
  b=SSCQzNxCfdSbviomGB8lP7TlDiI1jXe10cqd95uYFzVEz1hvaUh7cW9g
   qnkLPdSXGoP7q2H6ZDHlUWmv8G+rVjYOccKHuT8A1iKj2m7HY+NoxkkMl
   Uin/RvcnDJm/HtPclOMeITsgGOzG9Pdnpj132YkMpdue4i3SrE8KE+ech
   zpOdJ4W/oEEEwVvLa5D9mVB3mZsWtKQXtRK8Ys7/rLZQcl/iVvyqMCBVp
   hnrjV+ZvIrU0UTZBSz3K2j3q/9FReUq88VwZnyxNoevTs9hGo1TjKQFUJ
   KUcf08GbgP51+ZVXJcxAuSJukrdeRqdpJlZ++JVuRx2UdKhZ1WDvPwYbB
   g==;
X-CSE-ConnectionGUID: NiX0fImpRM+XSr7aL+lwJw==
X-CSE-MsgGUID: U56PA3J3RHuwucR8mTjMDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3577632"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3577632"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 03:46:19 -0800
X-CSE-ConnectionGUID: PRerXt/GRqehKuD8NHW2hg==
X-CSE-MsgGUID: 3vliaU7lTFamIR0wXKenZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9900149"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Nov 2026 03:46:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTHdf-00000001BMK-2XsL;
	Tue, 17 Nov 2026 11:46:15 +0000
Date: Tue, 17 Nov 2026 19:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:urgent] BUILD SUCCESS
 303c7c0e5ae5ac9685db11a4afaf5fa217a852db
Message-ID: <20261117194514.MrM45stl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 303c7c0e5ae5ac9685db11a4afaf5fa217a852db  x86/cpu: Add Intel Coral Rapids and Razor Lake CPU models

elapsed time: 1249m

configs tested: 498
configs skipped: 203

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    clang-24
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261116    gcc-10.5.0
alpha                 randconfig-2001-20261116    gcc-10.5.0
alpha                 randconfig-2200-20261116    gcc-15.3.0 smatch
alpha                randconfig-r2105-20261116    clang-22   cocci
alpha                randconfig-r2107-20261116    clang-24   cocci
alpha                randconfig-r2110-20261116    gcc-16.2.0 cocci
alpha                randconfig-r2301-20261116    gcc-16.2.0 sparse
alpha                randconfig-r2306-20261116    gcc-12.5.0 sparse
alpha                randconfig-r2307-20261116    gcc-16.2.0 sparse
alpha                randconfig-r2307-20261116    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                          haps_hs_defconfig    gcc-16.2.0
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261117    gcc-13.5.0
arc                   randconfig-1001-20261117    gcc-13.5.0
arc                   randconfig-2000-20261116    gcc-13.5.0
arc                   randconfig-2001-20261116    gcc-13.5.0
arc                   randconfig-2002-20261116    gcc-13.5.0
arc                   randconfig-2003-20261116    gcc-13.5.0
arc                   randconfig-2004-20261116    gcc-13.5.0
arc                   randconfig-2005-20261116    gcc-13.5.0
arc                   randconfig-2200-20261116    gcc-15.3.0 smatch
arc                  randconfig-r2101-20261116    gcc-9.5.0  cocci
arc                  randconfig-r2108-20261116    clang-24   cocci
arc                  randconfig-r2304-20261116    gcc-8.5.0  sparse
arc                  randconfig-r2307-20261116    gcc-14.4.0 sparse
arc                  randconfig-r2310-20261116    clang-20   sparse
arc                            tb10x_defconfig    clang-24
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       footbridge_defconfig    gcc-16.2.0
arm                       jornada720_defconfig    clang-24
arm                         neponset_defconfig    gcc-16.2.0
arm                          nhk8815_defconfig    clang-24
arm                          orion5x_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261117    gcc-13.5.0
arm                   randconfig-1001-20261117    gcc-13.5.0
arm                   randconfig-1002-20261117    gcc-13.5.0
arm                   randconfig-1003-20261117    gcc-13.5.0
arm                   randconfig-2000-20261116    gcc-15.3.0
arm                   randconfig-2001-20261116    gcc-15.3.0
arm                   randconfig-2002-20261116    gcc-15.3.0
arm                   randconfig-2200-20261116    gcc-13.5.0 smatch
arm                  randconfig-r2101-20261116    gcc-14.4.0 cocci
arm                  randconfig-r2108-20261116    clang-24   cocci
arm                  randconfig-r2303-20261116    gcc-16.2.0 sparse
arm                  randconfig-r2310-20261116    gcc-8.5.0  sparse
arm                            spitz_defconfig    clang-24
arm                         vexpress_defconfig    gcc-16.2.0
arm64                             alldefconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261117    gcc-16.2.0
arm64                 randconfig-1001-20261117    gcc-16.2.0
arm64                 randconfig-1002-20261117    gcc-16.2.0
arm64                 randconfig-1003-20261117    gcc-16.2.0
arm64                 randconfig-2000-20261116    gcc-15.3.0
arm64                 randconfig-2001-20261116    gcc-15.3.0
arm64                 randconfig-2002-20261116    gcc-15.3.0
arm64                 randconfig-2200-20261116    gcc-8.5.0  smatch
arm64                randconfig-r2100-20261116    clang-22   cocci
arm64                randconfig-r2107-20261116    clang-24   cocci
arm64                randconfig-r2107-20261116    gcc-16.2.0 cocci
arm64                randconfig-r2108-20261116    clang-24   cocci
arm64                randconfig-r2309-20261116    clang-20   sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261117    gcc-16.2.0
csky                  randconfig-1001-20261117    gcc-16.2.0
csky                  randconfig-2000-20261116    gcc-16.2.0
csky                  randconfig-2001-20261116    gcc-16.2.0
csky                  randconfig-2200-20261116    gcc-16.2.0 smatch
csky                 randconfig-r2104-20261116    gcc-14.4.0 cocci
csky                 randconfig-r2107-20261116    clang-24   cocci
csky                 randconfig-r2109-20261116    clang-24   cocci
csky                 randconfig-r2300-20261116    gcc-16.2.0 sparse
csky                 randconfig-r2305-20261116    gcc-16.2.0 sparse
csky                 randconfig-r2308-20261116    gcc-14.4.0 sparse
csky                 randconfig-r2311-20261116    clang-20   sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261117    clang-17
hexagon               randconfig-1001-20261117    clang-17
hexagon               randconfig-2000-20261116    gcc-16.2.0
hexagon               randconfig-2001-20261116    gcc-16.2.0
hexagon               randconfig-2200-20261116    clang-17   smatch
hexagon              randconfig-r2104-20261116    clang-22   cocci
hexagon              randconfig-r2107-20261116    clang-24   cocci
hexagon              randconfig-r2111-20261116    clang-24   cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261117    clang-22
i386        buildonly-randconfig-1001-20261117    clang-22
i386        buildonly-randconfig-1002-20261117    clang-22
i386        buildonly-randconfig-1003-20261117    clang-22
i386        buildonly-randconfig-1004-20261117    clang-22
i386        buildonly-randconfig-1005-20261117    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261117    gcc-14
i386                  randconfig-1001-20261117    gcc-14
i386                  randconfig-1002-20261117    gcc-14
i386                  randconfig-1003-20261117    gcc-14
i386                  randconfig-1004-20261117    gcc-14
i386                  randconfig-1005-20261117    gcc-14
i386                  randconfig-1006-20261117    gcc-14
i386                  randconfig-1007-20261117    clang-22
i386                  randconfig-1008-20261117    clang-22
i386                  randconfig-1009-20261117    clang-22
i386                  randconfig-1010-20261117    clang-22
i386                  randconfig-1011-20261117    clang-22
i386                  randconfig-1012-20261117    clang-22
i386                  randconfig-1013-20261117    clang-22
i386                  randconfig-2000-20261116    clang-22
i386                  randconfig-2000-20261116    gcc-14
i386                  randconfig-2001-20261116    gcc-14
i386                  randconfig-2002-20261116    clang-22
i386                  randconfig-2002-20261116    gcc-14
i386                  randconfig-2003-20261116    gcc-13
i386                  randconfig-2003-20261116    gcc-14
i386                  randconfig-2004-20261116    clang-22
i386                  randconfig-2004-20261116    gcc-14
i386                  randconfig-2005-20261116    gcc-13
i386                  randconfig-2005-20261116    gcc-14
i386                  randconfig-2100-20261116    gcc-14     cocci
i386                  randconfig-2101-20261116    clang-22   cocci
i386                  randconfig-2101-20261116    gcc-14     cocci
i386                  randconfig-2102-20261116    clang-22   cocci
i386                  randconfig-2102-20261116    gcc-14     cocci
i386                  randconfig-2103-20261116    gcc-14     cocci
i386                  randconfig-2104-20261116    gcc-14     cocci
i386                  randconfig-2105-20261116    gcc-14     cocci
i386                  randconfig-2200-20261116    gcc-14     smatch
i386                  randconfig-2300-20261116    gcc-14     sparse
i386                  randconfig-2301-20261116    clang-22   sparse
i386                  randconfig-2301-20261116    gcc-14     sparse
i386                  randconfig-2302-20261116    clang-22   sparse
i386                  randconfig-2302-20261116    gcc-14     sparse
i386                 randconfig-r2102-20261116    clang-22   cocci
i386                 randconfig-r2103-20261116    gcc-14     cocci
i386                 randconfig-r2103-20261116    gcc-14.4.0 cocci
i386                 randconfig-r2106-20261116    clang-24   cocci
i386                 randconfig-r2110-20261116    clang-24   cocci
i386                 randconfig-r2304-20261116    gcc-14.4.0 sparse
i386                 randconfig-r2307-20261116    gcc-15.3.0 sparse
i386                 randconfig-r2311-20261116    gcc-16.2.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson32_defconfig    clang-24
loongarch             randconfig-1000-20261117    clang-17
loongarch             randconfig-1001-20261117    clang-17
loongarch             randconfig-2000-20261116    gcc-11.5.0
loongarch             randconfig-2001-20261116    gcc-11.5.0
loongarch            randconfig-r2101-20261116    clang-22   cocci
loongarch            randconfig-r2107-20261116    clang-24   cocci
loongarch            randconfig-r2300-20261116    gcc-16.2.0 sparse
loongarch            randconfig-r2302-20261116    gcc-16.2.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                        m5235evb_defconfig    gcc-16.2.0
m68k                             q40_defconfig    clang-24
m68k                  randconfig-2000-20261116    gcc-10.5.0
m68k                  randconfig-2001-20261116    gcc-10.5.0
m68k                  randconfig-2200-20261116    gcc-14.4.0 smatch
m68k                 randconfig-r2108-20261116    clang-24   cocci
m68k                 randconfig-r2302-20261116    gcc-16.2.0 sparse
m68k                 randconfig-r2303-20261116    gcc-8.5.0  sparse
m68k                 randconfig-r2305-20261116    gcc-16.2.0 sparse
m68k                 randconfig-r2311-20261116    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261116    gcc-10.5.0
microblaze            randconfig-2001-20261116    gcc-10.5.0
microblaze            randconfig-2200-20261116    gcc-11.5.0 smatch
microblaze           randconfig-r2102-20261116    gcc-9.5.0  cocci
microblaze           randconfig-r2309-20261116    gcc-8.5.0  sparse
microblaze           randconfig-r2310-20261116    gcc-15.3.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                          bigsur_defconfig    gcc-16.2.0
mips                      cu1830-neo_defconfig    gcc-16.2.0
mips                           eyeq6_defconfig    clang-24
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                       maltaaprp_defconfig    clang-24
mips                       pic32mzda_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261116    gcc-13.5.0
mips                  randconfig-2001-20261116    gcc-13.5.0
mips                  randconfig-2002-20261116    gcc-13.5.0
mips                  randconfig-2200-20261116    gcc-8.5.0  smatch
mips                 randconfig-r2103-20261116    gcc-9.5.0  cocci
mips                 randconfig-r2106-20261116    gcc-16.2.0 cocci
mips                          rt305x_defconfig    clang-24
mips                            xway_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261117    clang-17
nios2                 randconfig-1001-20261117    clang-17
nios2                 randconfig-2000-20261116    gcc-11.5.0
nios2                 randconfig-2001-20261116    gcc-11.5.0
nios2                 randconfig-2200-20261116    gcc-11.5.0 smatch
nios2                randconfig-r2111-20261116    clang-24   cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261116    gcc-13.5.0
openrisc              randconfig-2001-20261116    gcc-13.5.0
openrisc              randconfig-2002-20261116    gcc-13.5.0
openrisc              randconfig-2200-20261116    gcc-15.3.0 smatch
openrisc             randconfig-r2106-20261116    clang-24   cocci
openrisc             randconfig-r2302-20261116    gcc-16.2.0 sparse
openrisc             randconfig-r2303-20261116    gcc-16.2.0 sparse
openrisc             randconfig-r2308-20261116    clang-20   sparse
openrisc             randconfig-r2308-20261116    gcc-16.2.0 sparse
openrisc             randconfig-r2309-20261116    gcc-14.4.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261117    gcc-9.5.0
parisc                randconfig-1001-20261117    gcc-9.5.0
parisc                randconfig-2000-20261116    gcc-11.5.0
parisc                randconfig-2001-20261116    gcc-11.5.0
parisc                randconfig-2200-20261116    gcc-8.5.0  smatch
parisc               randconfig-r2101-20261116    gcc-14     cocci
parisc               randconfig-r2104-20261116    gcc-14     cocci
parisc               randconfig-r2105-20261116    gcc-14.4.0 cocci
parisc               randconfig-r2301-20261116    gcc-16.2.0 sparse
parisc               randconfig-r2302-20261116    gcc-16.2.0 sparse
parisc               randconfig-r2303-20261116    gcc-16.2.0 sparse
parisc               randconfig-r2304-20261116    gcc-16.2.0 sparse
parisc               randconfig-r2305-20261116    gcc-16.2.0 sparse
parisc               randconfig-r2306-20261116    clang-20   sparse
parisc               randconfig-r2306-20261116    gcc-16.2.0 sparse
parisc               randconfig-r2307-20261116    gcc-12.5.0 sparse
parisc               randconfig-r2309-20261116    gcc-12.5.0 sparse
parisc               randconfig-r2310-20261116    gcc-12.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    clang-24
powerpc                       bamboo_defconfig    clang-24
powerpc                       cm5200_defconfig    clang-24
powerpc                       ep88xc_defconfig    clang-24
powerpc                        holly_defconfig    clang-24
powerpc                  mpc8313_rdb_defconfig    gcc-16.2.0
powerpc                  mpc836x_rdk_defconfig    clang-24
powerpc                      mpc83xx_defconfig    gcc-16.2.0
powerpc                       pasemi_defconfig    gcc-16.2.0
powerpc                      powernv_defconfig    gcc-16.2.0
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261117    gcc-9.5.0
powerpc               randconfig-1001-20261117    gcc-9.5.0
powerpc               randconfig-2000-20261116    clang-17
powerpc               randconfig-2001-20261116    clang-17
powerpc               randconfig-2002-20261116    clang-17
powerpc               randconfig-2200-20261116    clang-22   smatch
powerpc              randconfig-r2100-20261116    gcc-14.4.0 cocci
powerpc              randconfig-r2304-20261116    gcc-16.2.0 sparse
powerpc              randconfig-r2309-20261116    gcc-15.3.0 sparse
powerpc                      skiroot_defconfig    clang-24
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261117    gcc-9.5.0
powerpc64             randconfig-1001-20261117    gcc-9.5.0
powerpc64             randconfig-2000-20261116    clang-17
powerpc64             randconfig-2001-20261116    clang-17
powerpc64             randconfig-2002-20261116    clang-17
powerpc64             randconfig-2200-20261116    clang-19   smatch
powerpc64            randconfig-r2100-20261116    gcc-9.5.0  cocci
powerpc64            randconfig-r2109-20261116    clang-24   cocci
powerpc64            randconfig-r2110-20261116    clang-24   cocci
powerpc64            randconfig-r2111-20261116    clang-24   cocci
powerpc64            randconfig-r2303-20261116    gcc-16.2.0 sparse
powerpc64            randconfig-r2308-20261116    gcc-8.5.0  sparse
powerpc64            randconfig-r2310-20261116    gcc-16.2.0 sparse
riscv                             alldefconfig    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261117    clang-24
riscv                 randconfig-1001-20261117    clang-24
riscv                 randconfig-2000-20261116    clang-20
riscv                 randconfig-2001-20261116    clang-20
riscv                 randconfig-2002-20261116    clang-20
riscv                 randconfig-2003-20261116    clang-20
riscv                 randconfig-2004-20261116    clang-20
riscv                 randconfig-2005-20261116    clang-20
riscv                 randconfig-2200-20261116    clang-24   smatch
riscv                randconfig-r2106-20261116    clang-24   cocci
riscv                randconfig-r2110-20261116    clang-24   cocci
riscv                randconfig-r2300-20261116    gcc-8.5.0  sparse
riscv                randconfig-r2303-20261116    gcc-14.4.0 sparse
riscv                randconfig-r2304-20261116    gcc-16.2.0 sparse
riscv                randconfig-r2306-20261116    gcc-14.4.0 sparse
riscv                randconfig-r2308-20261116    gcc-12.5.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261117    clang-24
s390                  randconfig-1001-20261117    clang-24
s390                  randconfig-2000-20261116    clang-17
s390                  randconfig-2001-20261116    clang-17
s390                  randconfig-2002-20261116    clang-17
s390                  randconfig-2003-20261116    clang-17
s390                  randconfig-2004-20261116    clang-17
s390                  randconfig-2005-20261116    clang-17
s390                  randconfig-2200-20261116    gcc-10.5.0 smatch
s390                 randconfig-r2109-20261116    clang-24   cocci
s390                 randconfig-r2111-20261116    clang-24   cocci
s390                 randconfig-r2302-20261116    gcc-14.4.0 sparse
s390                 randconfig-r2305-20261116    gcc-14.4.0 sparse
s390                 randconfig-r2305-20261116    gcc-8.5.0  sparse
s390                 randconfig-r2307-20261116    gcc-16.2.0 sparse
s390                 randconfig-r2310-20261116    gcc-16.2.0 sparse
s390                 randconfig-r2311-20261116    gcc-14.4.0 sparse
s390                        zfcpdump_defconfig    gcc-16.2.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                              espt_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261117    clang-24
sh                    randconfig-1001-20261117    clang-24
sh                    randconfig-2000-20261116    gcc-15.3.0
sh                    randconfig-2001-20261116    gcc-15.3.0
sh                    randconfig-2002-20261116    gcc-15.3.0
sh                    randconfig-2003-20261116    gcc-15.3.0
sh                    randconfig-2004-20261116    gcc-15.3.0
sh                    randconfig-2005-20261116    gcc-15.3.0
sh                    randconfig-2200-20261116    gcc-15.3.0 smatch
sh                   randconfig-r2109-20261116    clang-24   cocci
sh                   randconfig-r2306-20261116    gcc-15.3.0 sparse
sh                   randconfig-r2311-20261116    gcc-12.5.0 sparse
sh                   randconfig-r2311-20261116    gcc-15.3.0 sparse
sh                           sdk7780_defconfig    gcc-16.2.0
sh                            se7750_defconfig    clang-24
sh                            sh2007_defconfig    clang-24
sh                      sh7710voipgw_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261117    gcc-15.3.0
sparc                 randconfig-1001-20261117    gcc-15.3.0
sparc                 randconfig-2000-20261116    gcc-14
sparc                 randconfig-2001-20261116    gcc-14
sparc                 randconfig-2200-20261116    gcc-15.3.0 smatch
sparc                randconfig-r2104-20261116    gcc-9.5.0  cocci
sparc                randconfig-r2106-20261116    clang-24   cocci
sparc                randconfig-r2109-20261116    gcc-16.2.0 cocci
sparc                randconfig-r2111-20261116    gcc-16.2.0 cocci
sparc                randconfig-r2300-20261116    gcc-14.4.0 sparse
sparc                randconfig-r2301-20261116    gcc-8.5.0  sparse
sparc                randconfig-r2304-20261116    gcc-16.2.0 sparse
sparc                randconfig-r2305-20261116    gcc-16.2.0 sparse
sparc                randconfig-r2309-20261116    gcc-16.2.0 sparse
sparc                        sparc32_defconfig    gcc-16.2.0
sparc                        sparc64_defconfig    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261117    gcc-15.3.0
sparc64               randconfig-1001-20261117    gcc-15.3.0
sparc64               randconfig-2000-20261116    gcc-14
sparc64               randconfig-2001-20261116    gcc-14
sparc64               randconfig-2200-20261116    gcc-8.5.0  smatch
sparc64              randconfig-r2100-20261116    gcc-14     cocci
sparc64              randconfig-r2103-20261116    clang-22   cocci
sparc64              randconfig-r2300-20261116    gcc-16.2.0 sparse
sparc64              randconfig-r2301-20261116    gcc-16.2.0 sparse
sparc64              randconfig-r2306-20261116    gcc-16.2.0 sparse
sparc64              randconfig-r2306-20261116    gcc-8.5.0  sparse
sparc64              randconfig-r2307-20261116    clang-20   sparse
sparc64              randconfig-r2308-20261116    gcc-16.2.0 sparse
um                                alldefconfig    clang-24
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    clang-24
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261117    gcc-15.3.0
um                    randconfig-1001-20261117    gcc-15.3.0
um                    randconfig-2000-20261116    gcc-14
um                    randconfig-2001-20261116    gcc-14
um                    randconfig-2200-20261116    gcc-14     smatch
um                   randconfig-r2102-20261116    gcc-14.4.0 cocci
um                   randconfig-r2106-20261116    clang-24   cocci
um                   randconfig-r2110-20261116    clang-24   cocci
um                   randconfig-r2111-20261116    clang-24   cocci
um                   randconfig-r2301-20261116    gcc-16.2.0 sparse
um                   randconfig-r2308-20261116    gcc-15.3.0 sparse
um                   randconfig-r2310-20261116    gcc-14.4.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261117    gcc-13
x86_64      buildonly-randconfig-1001-20261117    gcc-13
x86_64      buildonly-randconfig-1002-20261117    gcc-13
x86_64      buildonly-randconfig-1003-20261117    gcc-13
x86_64      buildonly-randconfig-1004-20261117    gcc-13
x86_64      buildonly-randconfig-1005-20261117    gcc-13
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261117    clang-22
x86_64                randconfig-1001-20261117    clang-22
x86_64                randconfig-1002-20261117    clang-22
x86_64                randconfig-1003-20261117    clang-22
x86_64                randconfig-1004-20261117    clang-22
x86_64                randconfig-1005-20261117    clang-22
x86_64                randconfig-1006-20261117    gcc-14
x86_64                randconfig-1007-20261117    gcc-14
x86_64                randconfig-1008-20261117    gcc-14
x86_64                randconfig-1009-20261117    gcc-14
x86_64                randconfig-1010-20261117    gcc-14
x86_64                randconfig-1011-20261117    gcc-14
x86_64                randconfig-1012-20261117    gcc-14
x86_64                randconfig-1013-20261117    gcc-14
x86_64                randconfig-1014-20261117    gcc-14
x86_64                randconfig-1015-20261117    gcc-14
x86_64                randconfig-1016-20261117    gcc-14
x86_64                randconfig-1017-20261117    gcc-14
x86_64                randconfig-2000-20261116    gcc-13
x86_64                randconfig-2000-20261116    gcc-14
x86_64                randconfig-2001-20261116    gcc-14
x86_64                randconfig-2002-20261116    clang-22
x86_64                randconfig-2002-20261116    gcc-14
x86_64                randconfig-2003-20261116    clang-22
x86_64                randconfig-2003-20261116    gcc-14
x86_64                randconfig-2004-20261116    gcc-14
x86_64                randconfig-2005-20261116    clang-22
x86_64                randconfig-2005-20261116    gcc-14
x86_64                randconfig-2100-20261116    gcc-14     cocci
x86_64                randconfig-2101-20261116    clang-22   cocci
x86_64                randconfig-2101-20261116    gcc-14     cocci
x86_64                randconfig-2102-20261116    gcc-14     cocci
x86_64                randconfig-2103-20261116    gcc-14     cocci
x86_64                randconfig-2104-20261116    gcc-14     cocci
x86_64                randconfig-2105-20261116    clang-22   cocci
x86_64                randconfig-2105-20261116    gcc-14     cocci
x86_64                randconfig-2200-20261116    clang-22   smatch
x86_64                randconfig-2300-20261116    clang-22   sparse
x86_64                randconfig-2300-20261116    gcc-14     sparse
x86_64                randconfig-2301-20261116    gcc-12     sparse
x86_64                randconfig-2301-20261116    gcc-14     sparse
x86_64                randconfig-2302-20261116    gcc-14     sparse
x86_64               randconfig-r2102-20261116    gcc-14     cocci
x86_64               randconfig-r2105-20261116    gcc-14     cocci
x86_64               randconfig-r2105-20261116    gcc-9.5.0  cocci
x86_64               randconfig-r2107-20261116    clang-22   cocci
x86_64               randconfig-r2108-20261116    clang-24   cocci
x86_64               randconfig-r2301-20261116    gcc-14.4.0 sparse
x86_64               randconfig-r2302-20261116    gcc-8.5.0  sparse
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
xtensa                           iss_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261117    gcc-15.3.0
xtensa                randconfig-1001-20261117    gcc-15.3.0
xtensa                randconfig-2000-20261116    gcc-16.2.0
xtensa                randconfig-2001-20261116    gcc-16.2.0
xtensa                randconfig-2200-20261116    gcc-9.5.0  smatch
xtensa               randconfig-r2108-20261116    gcc-16.2.0 cocci
xtensa               randconfig-r2109-20261116    clang-24   cocci
xtensa               randconfig-r2311-20261116    gcc-16.2.0 sparse
xtensa                          virt_defconfig    gcc-16.2.0
xtensa                     xip_kc705_defconfig    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
