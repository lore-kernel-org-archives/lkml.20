Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196890;
	b=FFNgrCcnwzeH/FZ/QgUL7SjRjgg36Fcnd8tez5P1OI0caT1A8gacq3e0frQugvKvH9NG
	 N+oJG98C1uPjOkcZ2U2FTr7yim5JjeP9mcEXEMrFAt22/lna8lmuuxfpq9TH1StI/VCs9
	 xGPCyKFt4a1p5V6JiMWC2nuOidvVFSF0eBTLTpCN0POhxZXKluJtD67dZgItETDx5bH0C
	 sVMYj1nV1oeI+WLXEBGf8Lm5WzoM96YyK0CH7bPm7cCrzQlP4jy6JDL3BoCs5j7cR16hI
	 hb+t/L3VD4vJD3rJjjAYX/FzoDivBCwH7cdKFBS8GAnfaYv1e1x+nFetHo79teZ3etg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196890;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kvtxcQ2attlc8ex7AMvUGzqP6LJHC3mq1MB6OH+eOR4=;
	b=mObV7XzkxKYAFDduA9rVULaPtdkI0c/RsoqDtwc4GdpUksav5BzlEJB+kSi0IDAwC+j9
	 IDY7IMuw5KWJGbtubvqtTOi+H7EjqObIf0njIh+4ngAjSHxDnDTWWylnHsji7yU1ZWx+I
	 Uf96oeL6+spKGU/9dvJ8cR5cBUxoRRag5vnbwlXtU1ukMEZRnuvZjJsePWShq+SunTj2q
	 mHpC8SnUO2pUKg8tk4WzKa6xXUDy6izdJxCyM46B33ht9SQFyK4O1d6+jHH1Hu6QMbZb7
	 6A1hvFcpaJ0gQlcMu2vI0qfXs2ULHdHrrjLjYl6CpORgOzVa76Nj5J4m1cXMWe3icdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EuqsHepS;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A49606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5A49606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EuqsHepS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794196889; x=1825732889;
  h=date:from:to:cc:subject:message-id;
  bh=w34uCBMhmKt2KxO70/90zjmYg2tVHinIfYNU6pFikog=;
  b=EuqsHepSJHnUMNsaul/7LiK1yL7sO84ODqxcWZ8WPsx8yfN/lUz1I0xJ
   C+UFxi/G51a8jfJ/HBotWyOf4WE1dn1MWk8O8dxvTUkWtf0OR7BaYUxOm
   i4hAYeKnkC2sMliVoRSp6+Gveo+moaRUz62WhL7B72CnllFawOqQIcM+Y
   eaqcWrImuG29sVBfCnWL916Rt6rDQJhqvoYHC0izmgyONfrK6+At8U/6P
   zybcm1liKS57jqETL25M2h1z4AWs24v/pvF1u5M0ahNR17J2M1IINd7y8
   KWTVdlXZcdC6gvfsMptIskXCeRXDWqFZw74iqRfREz0xxiRZscWF3WXQ/
   g==;
X-CSE-ConnectionGUID: clG9olZUSj66gtDf97j0AA==
X-CSE-MsgGUID: vGZH79WmQ5G3Z1IdMxCIzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2953254"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2953254"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 20:01:28 -0800
X-CSE-ConnectionGUID: Q2ifJN3KQu6C0sqGmELVmQ==
X-CSE-MsgGUID: YZ0OVnNTR+mW9nygiJdTXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="9525574"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 08 Nov 2026 20:01:26 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQGZQ-00000000trD-121k;
	Mon, 09 Nov 2026 04:01:24 +0000
Date: Mon, 09 Nov 2026 12:00:57 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip:urgent] BUILD SUCCESS
 04ecd7edbb87e17ca806d05f6394795ca4d50905
Message-ID: <20261109120057.7JUNdm0i-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 04ecd7edbb87e17ca806d05f6394795ca4d50905  Merge branch into tip/master: 'x86/urgent'

elapsed time: 831m

configs tested: 497
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261108    gcc-10.5.0
alpha                 randconfig-2001-20261108    gcc-10.5.0
alpha                 randconfig-2001-20261108    gcc-12.5.0
alpha                 randconfig-2200-20261108    gcc-12.5.0 smatch
alpha                randconfig-r2105-20261108    gcc-15.3.0 cocci
alpha                randconfig-r2108-20261108    gcc-10.5.0 cocci
alpha                randconfig-r2109-20261108    gcc-12.5.0 cocci
alpha                randconfig-r2111-20261108    gcc-10.5.0 cocci
alpha                randconfig-r2302-20261108    gcc-14     sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                           axs103_defconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261109    clang-24
arc                   randconfig-1001-20261109    clang-24
arc                   randconfig-2000-20261108    gcc-14.4.0
arc                   randconfig-2001-20261108    gcc-14.4.0
arc                   randconfig-2001-20261108    gcc-16.2.0
arc                   randconfig-2002-20261108    gcc-14.4.0
arc                   randconfig-2002-20261108    gcc-8.5.0
arc                   randconfig-2003-20261108    gcc-14.4.0
arc                   randconfig-2003-20261108    gcc-8.5.0
arc                   randconfig-2004-20261108    gcc-14.4.0
arc                   randconfig-2005-20261108    gcc-14.4.0
arc                   randconfig-2005-20261108    gcc-8.5.0
arc                   randconfig-2200-20261108    gcc-16.2.0 smatch
arc                  randconfig-r2103-20261108    gcc-15.3.0 cocci
arc                  randconfig-r2107-20261108    gcc-10.5.0 cocci
arc                  randconfig-r2107-20261108    gcc-14.4.0 cocci
arc                  randconfig-r2108-20261108    gcc-15.3.0 cocci
arc                  randconfig-r2110-20261108    gcc-15.3.0 cocci
arc                         vdk_hs38_defconfig    clang-24
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                         mvebu_v7_defconfig    gcc-16.2.0
arm                          orion5x_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261109    clang-24
arm                   randconfig-1001-20261109    clang-24
arm                   randconfig-1002-20261109    clang-24
arm                   randconfig-1003-20261109    clang-24
arm                   randconfig-2000-20261108    clang-19
arm                   randconfig-2000-20261108    gcc-8.5.0
arm                   randconfig-2001-20261108    gcc-10.5.0
arm                   randconfig-2001-20261108    gcc-8.5.0
arm                   randconfig-2002-20261108    gcc-16.2.0
arm                   randconfig-2002-20261108    gcc-8.5.0
arm                   randconfig-2200-20261108    clang-21   smatch
arm                  randconfig-r2106-20261108    gcc-14     cocci
arm                  randconfig-r2110-20261108    gcc-10.5.0 cocci
arm                  randconfig-r2307-20261108    gcc-9.5.0  sparse
arm                           sp7021_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-2000-20261108    gcc-8.5.0
arm64                 randconfig-2000-20261108    gcc-9.5.0
arm64                 randconfig-2001-20261108    gcc-8.5.0
arm64                 randconfig-2002-20261108    gcc-8.5.0
arm64                 randconfig-2200-20261108    clang-18   smatch
arm64                randconfig-r2101-20261108    gcc-15.3.0 cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-2000-20261108    clang-24
csky                  randconfig-2000-20261108    gcc-10.5.0
csky                  randconfig-2001-20261108    clang-24
csky                  randconfig-2001-20261108    gcc-12.5.0
csky                  randconfig-2200-20261108    gcc-16.2.0 smatch
csky                 randconfig-r2100-20261108    gcc-11.5.0 cocci
csky                 randconfig-r2104-20261108    clang-24   cocci
csky                 randconfig-r2107-20261108    gcc-14     cocci
csky                 randconfig-r2306-20261108    gcc-16.2.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261109    clang-19
hexagon               randconfig-1001-20261109    clang-19
hexagon               randconfig-2000-20261108    clang-17
hexagon               randconfig-2000-20261108    clang-24
hexagon               randconfig-2001-20261108    clang-24
hexagon               randconfig-2200-20261108    clang-24   smatch
hexagon              randconfig-r2106-20261108    clang-24   cocci
hexagon              randconfig-r2111-20261108    gcc-14     cocci
hexagon              randconfig-r2304-20261108    gcc-14     sparse
hexagon              randconfig-r2306-20261108    gcc-16.2.0 sparse
hexagon              randconfig-r2306-20261108    gcc-9.5.0  sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261109    clang-22
i386        buildonly-randconfig-1001-20261109    clang-22
i386        buildonly-randconfig-1002-20261109    clang-22
i386        buildonly-randconfig-1003-20261109    clang-22
i386        buildonly-randconfig-1004-20261109    clang-22
i386        buildonly-randconfig-1005-20261109    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261109    gcc-14
i386                  randconfig-1001-20261109    gcc-14
i386                  randconfig-1002-20261109    gcc-14
i386                  randconfig-1003-20261109    gcc-14
i386                  randconfig-1004-20261109    gcc-14
i386                  randconfig-1005-20261109    gcc-14
i386                  randconfig-1006-20261109    gcc-14
i386                  randconfig-1007-20261109    gcc-12
i386                  randconfig-1008-20261109    gcc-12
i386                  randconfig-1009-20261109    gcc-12
i386                  randconfig-1010-20261109    gcc-12
i386                  randconfig-1011-20261109    gcc-12
i386                  randconfig-1012-20261109    gcc-12
i386                  randconfig-1013-20261109    gcc-12
i386                  randconfig-2000-20261108    gcc-14
i386                  randconfig-2001-20261108    clang-22
i386                  randconfig-2001-20261108    gcc-14
i386                  randconfig-2002-20261108    clang-22
i386                  randconfig-2002-20261108    gcc-14
i386                  randconfig-2003-20261108    clang-22
i386                  randconfig-2003-20261108    gcc-14
i386                  randconfig-2004-20261108    gcc-12
i386                  randconfig-2004-20261108    gcc-14
i386                  randconfig-2005-20261108    clang-22
i386                  randconfig-2005-20261108    gcc-14
i386                  randconfig-2100-20261108    clang-22   cocci
i386                  randconfig-2100-20261108    gcc-14     cocci
i386                  randconfig-2101-20261108    clang-22   cocci
i386                  randconfig-2101-20261108    gcc-14     cocci
i386                  randconfig-2102-20261108    clang-22   cocci
i386                  randconfig-2102-20261108    gcc-14     cocci
i386                  randconfig-2103-20261108    clang-22   cocci
i386                  randconfig-2103-20261108    gcc-14     cocci
i386                  randconfig-2104-20261108    gcc-14     cocci
i386                  randconfig-2105-20261108    gcc-14     cocci
i386                  randconfig-2200-20261108    gcc-14     smatch
i386                  randconfig-2300-20261108    clang-22   sparse
i386                  randconfig-2301-20261108    clang-22   sparse
i386                  randconfig-2301-20261108    gcc-14     sparse
i386                  randconfig-2302-20261108    clang-22   sparse
i386                 randconfig-r2105-20261108    gcc-14     cocci
i386                 randconfig-r2109-20261108    gcc-14     cocci
i386                 randconfig-r2300-20261108    gcc-14     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261109    clang-19
loongarch             randconfig-1001-20261109    clang-19
loongarch             randconfig-2000-20261108    gcc-13.5.0
loongarch             randconfig-2000-20261108    gcc-15.3.0
loongarch             randconfig-2001-20261108    gcc-15.3.0
loongarch             randconfig-2200-20261108    gcc-15.3.0 smatch
loongarch            randconfig-r2103-20261108    clang-24   cocci
loongarch            randconfig-r2111-20261108    clang-24   cocci
loongarch            randconfig-r2300-20261108    gcc-11.5.0 sparse
loongarch            randconfig-r2310-20261108    gcc-16.2.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5235evb_defconfig    gcc-16.2.0
m68k                        m5475evb_defconfig    gcc-16.2.0
m68k                          nettel_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261108    gcc-10.5.0
m68k                  randconfig-2000-20261108    gcc-15.3.0
m68k                  randconfig-2001-20261108    gcc-10.5.0
m68k                  randconfig-2001-20261108    gcc-13.5.0
m68k                  randconfig-2200-20261108    gcc-9.5.0  smatch
m68k                 randconfig-r2106-20261108    gcc-12.5.0 cocci
m68k                 randconfig-r2303-20261108    gcc-14     sparse
m68k                 randconfig-r2303-20261108    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261108    gcc-10.5.0
microblaze            randconfig-2001-20261108    gcc-10.5.0
microblaze            randconfig-2001-20261108    gcc-8.5.0
microblaze            randconfig-2200-20261108    gcc-8.5.0  smatch
microblaze           randconfig-r2104-20261108    gcc-15.3.0 cocci
microblaze           randconfig-r2106-20261108    gcc-10.5.0 cocci
microblaze           randconfig-r2306-20261108    gcc-8.5.0  sparse
microblaze           randconfig-r2309-20261108    gcc-16.2.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                         bcm47xx_defconfig    gcc-16.2.0
mips                         bcm63xx_defconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    gcc-16.2.0
mips                      cu1000-neo_defconfig    gcc-16.2.0
mips                       fuloong2e_defconfig    gcc-16.2.0
mips                            gcw0_defconfig    gcc-16.2.0
mips                             gpr_defconfig    clang-24
mips                            ip28_defconfig    gcc-16.2.0
mips                       loongson3_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261108    gcc-12.5.0
mips                  randconfig-2001-20261108    clang-24
mips                  randconfig-2001-20261108    gcc-12.5.0
mips                  randconfig-2002-20261108    clang-24
mips                  randconfig-2002-20261108    gcc-12.5.0
mips                  randconfig-2200-20261108    clang-17   smatch
mips                 randconfig-r2104-20261108    clang-22   cocci
mips                 randconfig-r2310-20261108    gcc-8.5.0  sparse
mips                 randconfig-r2311-20261108    gcc-8.5.0  sparse
mips                 randconfig-r2311-20261108    gcc-9.5.0  sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261109    clang-19
nios2                 randconfig-1001-20261109    clang-19
nios2                 randconfig-2000-20261108    gcc-10.5.0
nios2                 randconfig-2000-20261108    gcc-15.3.0
nios2                 randconfig-2001-20261108    gcc-15.3.0
nios2                 randconfig-2001-20261108    gcc-8.5.0
nios2                 randconfig-2200-20261108    gcc-8.5.0  smatch
nios2                randconfig-r2100-20261108    clang-24   cocci
nios2                randconfig-r2101-20261108    clang-24   cocci
nios2                randconfig-r2102-20261108    gcc-11.5.0 cocci
nios2                randconfig-r2102-20261108    gcc-15.3.0 cocci
nios2                randconfig-r2108-20261108    gcc-11.5.0 cocci
nios2                randconfig-r2301-20261108    gcc-8.5.0  sparse
nios2                randconfig-r2310-20261108    gcc-9.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261108    gcc-12.5.0
openrisc              randconfig-2000-20261108    gcc-16.2.0
openrisc              randconfig-2001-20261108    gcc-12.5.0
openrisc              randconfig-2002-20261108    gcc-12.5.0
openrisc              randconfig-2002-20261108    gcc-14.4.0
openrisc              randconfig-2200-20261108    gcc-16.2.0 smatch
openrisc             randconfig-r2103-20261108    gcc-15.3.0 cocci
openrisc             randconfig-r2107-20261108    gcc-11.5.0 cocci
openrisc             randconfig-r2109-20261108    gcc-15.3.0 cocci
openrisc             randconfig-r2110-20261108    gcc-14.4.0 cocci
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261109    gcc-8.5.0
parisc                randconfig-1001-20261109    gcc-8.5.0
parisc                randconfig-2000-20261108    gcc-12.5.0
parisc                randconfig-2000-20261108    gcc-15.3.0
parisc                randconfig-2001-20261108    gcc-15.3.0
parisc                randconfig-2001-20261108    gcc-8.5.0
parisc                randconfig-2200-20261108    gcc-8.5.0  smatch
parisc               randconfig-r2100-20261108    gcc-15.3.0 cocci
parisc               randconfig-r2109-20261108    gcc-14.4.0 cocci
parisc               randconfig-r2111-20261108    gcc-15.3.0 cocci
parisc               randconfig-r2304-20261108    gcc-13.5.0 sparse
parisc               randconfig-r2307-20261108    gcc-16.2.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    gcc-16.2.0
powerpc                       ep88xc_defconfig    clang-24
powerpc                  mpc8315_rdb_defconfig    gcc-16.2.0
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261109    gcc-8.5.0
powerpc               randconfig-1001-20261109    gcc-8.5.0
powerpc               randconfig-2000-20261108    gcc-8.5.0
powerpc               randconfig-2001-20261108    gcc-8.5.0
powerpc               randconfig-2002-20261108    gcc-15.3.0
powerpc               randconfig-2002-20261108    gcc-8.5.0
powerpc               randconfig-2200-20261108    clang-24   smatch
powerpc              randconfig-r2310-20261108    gcc-16.2.0 sparse
powerpc                      skiroot_defconfig    gcc-16.2.0
powerpc                      stx_gp3_defconfig    clang-24
powerpc                      taishan_defconfig    clang-24
powerpc                       tqm8xx_defconfig    clang-24
powerpc64             randconfig-1000-20261109    gcc-8.5.0
powerpc64             randconfig-1001-20261109    gcc-8.5.0
powerpc64             randconfig-2000-20261108    gcc-13.5.0
powerpc64             randconfig-2000-20261108    gcc-8.5.0
powerpc64             randconfig-2001-20261108    clang-24
powerpc64             randconfig-2001-20261108    gcc-8.5.0
powerpc64             randconfig-2002-20261108    gcc-8.5.0
powerpc64             randconfig-2200-20261108    gcc-11.5.0 smatch
powerpc64            randconfig-r2101-20261108    gcc-15.3.0 cocci
powerpc64            randconfig-r2105-20261108    clang-24   cocci
powerpc64            randconfig-r2106-20261108    gcc-15.3.0 cocci
powerpc64            randconfig-r2107-20261108    gcc-15.3.0 cocci
powerpc64            randconfig-r2110-20261108    gcc-12.5.0 cocci
powerpc64            randconfig-r2309-20261108    gcc-9.5.0  sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261109    gcc-8.5.0
riscv                 randconfig-1001-20261109    gcc-8.5.0
riscv                 randconfig-2000-20261108    clang-24
riscv                 randconfig-2000-20261108    gcc-8.5.0
riscv                 randconfig-2001-20261108    clang-24
riscv                 randconfig-2001-20261108    gcc-8.5.0
riscv                 randconfig-2002-20261108    clang-24
riscv                 randconfig-2003-20261108    clang-24
riscv                 randconfig-2004-20261108    clang-24
riscv                 randconfig-2005-20261108    clang-17
riscv                 randconfig-2005-20261108    clang-24
riscv                 randconfig-2200-20261108    clang-20   smatch
riscv                randconfig-r2101-20261108    clang-22   cocci
riscv                randconfig-r2302-20261108    gcc-11.5.0 sparse
riscv                randconfig-r2304-20261108    gcc-11.5.0 sparse
riscv                randconfig-r2307-20261108    gcc-16.2.0 sparse
riscv                randconfig-r2308-20261108    clang-17   sparse
riscv                randconfig-r2309-20261108    gcc-16.2.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261109    gcc-8.5.0
s390                  randconfig-1001-20261109    gcc-8.5.0
s390                  randconfig-2000-20261108    clang-21
s390                  randconfig-2000-20261108    gcc-8.5.0
s390                  randconfig-2001-20261108    clang-21
s390                  randconfig-2001-20261108    gcc-13.5.0
s390                  randconfig-2002-20261108    clang-21
s390                  randconfig-2002-20261108    gcc-8.5.0
s390                  randconfig-2003-20261108    clang-21
s390                  randconfig-2004-20261108    clang-21
s390                  randconfig-2004-20261108    gcc-8.5.0
s390                  randconfig-2005-20261108    clang-21
s390                  randconfig-2005-20261108    gcc-13.5.0
s390                  randconfig-2200-20261108    gcc-13.5.0 smatch
s390                 randconfig-r2100-20261108    clang-22   cocci
s390                 randconfig-r2105-20261108    clang-22   cocci
s390                 randconfig-r2108-20261108    gcc-12.5.0 cocci
s390                 randconfig-r2109-20261108    gcc-10.5.0 cocci
s390                 randconfig-r2111-20261108    gcc-14.4.0 cocci
s390                 randconfig-r2305-20261108    gcc-15.3.0 sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                 ecovec24-romimage_defconfig    gcc-16.2.0
sh                             migor_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261109    gcc-8.5.0
sh                    randconfig-1001-20261109    gcc-8.5.0
sh                    randconfig-2000-20261108    gcc-10.5.0
sh                    randconfig-2000-20261108    gcc-14.4.0
sh                    randconfig-2001-20261108    gcc-10.5.0
sh                    randconfig-2001-20261108    gcc-12.5.0
sh                    randconfig-2002-20261108    gcc-10.5.0
sh                    randconfig-2003-20261108    gcc-10.5.0
sh                    randconfig-2003-20261108    gcc-12.5.0
sh                    randconfig-2004-20261108    gcc-10.5.0
sh                    randconfig-2004-20261108    gcc-14.4.0
sh                    randconfig-2005-20261108    gcc-10.5.0
sh                    randconfig-2005-20261108    gcc-16.2.0
sh                    randconfig-2200-20261108    gcc-12.5.0 smatch
sh                   randconfig-r2102-20261108    clang-24   cocci
sh                   randconfig-r2104-20261108    gcc-14.4.0 cocci
sh                   randconfig-r2107-20261108    gcc-12.5.0 cocci
sh                   randconfig-r2109-20261108    gcc-16.2.0 cocci
sh                   randconfig-r2303-20261108    gcc-11.5.0 sparse
sh                   randconfig-r2305-20261108    gcc-11.5.0 sparse
sh                   randconfig-r2305-20261108    gcc-14     sparse
sh                   randconfig-r2307-20261108    gcc-10.5.0 sparse
sh                   randconfig-r2311-20261108    gcc-16.2.0 sparse
sh                           sdk7786_defconfig    gcc-16.2.0
sh                    secureedge5410_defconfig    gcc-16.2.0
sh                   sh7785lcr_32bit_defconfig    clang-24
sh                             titan_defconfig    gcc-16.2.0
sh                           urquell_defconfig    gcc-16.2.0
sparc                             alldefconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261109    gcc-8.5.0
sparc                 randconfig-1001-20261109    gcc-8.5.0
sparc                 randconfig-2000-20261108    gcc-14
sparc                 randconfig-2000-20261108    gcc-16.2.0
sparc                 randconfig-2001-20261108    gcc-12.5.0
sparc                 randconfig-2001-20261108    gcc-14
sparc                 randconfig-2200-20261108    gcc-12.5.0 smatch
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261109    gcc-8.5.0
sparc64               randconfig-1001-20261109    gcc-8.5.0
sparc64               randconfig-2000-20261108    gcc-14
sparc64               randconfig-2000-20261108    gcc-15.3.0
sparc64               randconfig-2001-20261108    gcc-14
sparc64               randconfig-2001-20261108    gcc-8.5.0
sparc64               randconfig-2200-20261108    gcc-9.5.0  smatch
sparc64              randconfig-r2108-20261108    gcc-14     cocci
sparc64              randconfig-r2308-20261108    gcc-16.2.0 sparse
sparc64              randconfig-r2308-20261108    gcc-9.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261109    gcc-8.5.0
um                    randconfig-1001-20261109    gcc-8.5.0
um                    randconfig-2000-20261108    gcc-14
um                    randconfig-2001-20261108    gcc-14
um                    randconfig-2200-20261108    gcc-14     smatch
um                   randconfig-r2106-20261108    gcc-14.4.0 cocci
um                   randconfig-r2108-20261108    gcc-14.4.0 cocci
um                   randconfig-r2308-20261108    gcc-16.2.0 sparse
um                   randconfig-r2311-20261108    gcc-16.2.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261108    gcc-14
x86_64      buildonly-randconfig-1000-20261109    clang-22
x86_64      buildonly-randconfig-1001-20261108    gcc-14
x86_64      buildonly-randconfig-1001-20261109    clang-22
x86_64      buildonly-randconfig-1002-20261108    gcc-14
x86_64      buildonly-randconfig-1002-20261109    clang-22
x86_64      buildonly-randconfig-1003-20261108    gcc-14
x86_64      buildonly-randconfig-1003-20261109    clang-22
x86_64      buildonly-randconfig-1004-20261108    gcc-14
x86_64      buildonly-randconfig-1004-20261109    clang-22
x86_64      buildonly-randconfig-1005-20261108    gcc-14
x86_64      buildonly-randconfig-1005-20261109    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261108    gcc-14
x86_64                randconfig-1000-20261109    clang-22
x86_64                randconfig-1001-20261108    gcc-14
x86_64                randconfig-1001-20261109    clang-22
x86_64                randconfig-1002-20261108    gcc-14
x86_64                randconfig-1002-20261109    clang-22
x86_64                randconfig-1003-20261108    gcc-14
x86_64                randconfig-1003-20261109    clang-22
x86_64                randconfig-1004-20261108    gcc-14
x86_64                randconfig-1004-20261109    clang-22
x86_64                randconfig-1005-20261108    gcc-14
x86_64                randconfig-1005-20261109    clang-22
x86_64                randconfig-1006-20261109    gcc-14
x86_64                randconfig-1007-20261109    gcc-14
x86_64                randconfig-1008-20261109    gcc-14
x86_64                randconfig-1009-20261109    gcc-14
x86_64                randconfig-1010-20261109    gcc-14
x86_64                randconfig-1011-20261109    gcc-14
x86_64                randconfig-1012-20261109    clang-22
x86_64                randconfig-1013-20261109    clang-22
x86_64                randconfig-1014-20261109    clang-22
x86_64                randconfig-1015-20261109    clang-22
x86_64                randconfig-1016-20261109    clang-22
x86_64                randconfig-1017-20261109    clang-22
x86_64                randconfig-2000-20261108    clang-22
x86_64                randconfig-2001-20261108    clang-22
x86_64                randconfig-2002-20261108    clang-22
x86_64                randconfig-2003-20261108    clang-22
x86_64                randconfig-2003-20261108    gcc-12
x86_64                randconfig-2004-20261108    clang-22
x86_64                randconfig-2004-20261108    gcc-14
x86_64                randconfig-2005-20261108    clang-22
x86_64                randconfig-2005-20261108    gcc-14
x86_64                randconfig-2100-20261108    gcc-14     cocci
x86_64                randconfig-2101-20261108    gcc-13     cocci
x86_64                randconfig-2101-20261108    gcc-14     cocci
x86_64                randconfig-2102-20261108    clang-22   cocci
x86_64                randconfig-2102-20261108    gcc-14     cocci
x86_64                randconfig-2103-20261108    gcc-14     cocci
x86_64                randconfig-2104-20261108    gcc-14     cocci
x86_64                randconfig-2105-20261108    gcc-14     cocci
x86_64                randconfig-2200-20261108    clang-22   smatch
x86_64                randconfig-2300-20261108    clang-22   sparse
x86_64                randconfig-2300-20261108    gcc-13     sparse
x86_64                randconfig-2301-20261108    clang-22   sparse
x86_64                randconfig-2302-20261108    clang-22   sparse
x86_64               randconfig-r2103-20261108    clang-22   cocci
x86_64               randconfig-r2110-20261108    gcc-14     cocci
x86_64               randconfig-r2301-20261108    gcc-14     sparse
x86_64               randconfig-r2302-20261108    gcc-14     sparse
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
xtensa                           iss_defconfig    clang-24
xtensa                randconfig-1000-20261109    gcc-8.5.0
xtensa                randconfig-1001-20261109    gcc-8.5.0
xtensa                randconfig-2000-20261108    clang-24
xtensa                randconfig-2000-20261108    gcc-8.5.0
xtensa                randconfig-2001-20261108    clang-24
xtensa                randconfig-2001-20261108    gcc-10.5.0
xtensa                randconfig-2200-20261108    gcc-8.5.0  smatch
xtensa               randconfig-r2102-20261108    clang-22   cocci
xtensa               randconfig-r2110-20261108    gcc-10.5.0 cocci
xtensa               randconfig-r2301-20261108    gcc-11.5.0 sparse
xtensa               randconfig-r2309-20261108    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
