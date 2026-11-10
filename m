Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270592;
	b=WNctHyhLpZz7CbPQz2TwnDqAx9Jw2fMOddwJDX1JVTx/MHE6GP4rBEcdDwR3G5qX8SOw
	 y16Me4Fjyjwa4L3sZrMKuqdJOTLIK83NJPaGgbI6cZOVTj/nHJaGU/CC0vjn+uAiO3DmO
	 kK97nQ8/J0+fOLjYaCVgwXkcIhi2fP1byWCau6ExxGANapxOqbvGG1l3QcdCm4o0FAjWC
	 Tx4wFrKfXpeYNQ/3Ca7fHrx4NdW+DKX6yuISrqfAbqZjxB5MypXH054qkBgJqXIVflDGG
	 0xB8r63EPxIlWBAWHfeAmN8Ss0LRlTCOkO+CX1/4aYCANcM+cux708q985qIeSM2Vbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270592;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=R7iPjJ57WP+tgJtpTLRSwaGLIjTg1PzUACHYDUV7r8Q=;
	b=CP+b2N1Ku4trBOZJBVTmgzZHnU4SH7e3NbbVMuZKluPPYBwsXNlwr71CXFPbKrp0cppX
	 kt2gxB+/Od82XDVY+jTIjSDzEV3gH7vELPX6LbY6n++jvywrmTpnGtepaiNfg9xe+vF+d
	 Bvd5z7ffGCCEl3V2q6qbr/xrxF/cMpK1Hj35ZAlu/ZPSh5fbWAZIMfyDpcHoX9Ql3u5BM
	 0q/g8jFBjlSIkRBuVBFeX4KRzQPCyFHDRnUc+6qXL6m8xwBXNndCq6HtYz+J5pGsJKZz8
	 TLBqno0RTLLBeTDOsNJdvbnpy1SAX4iiJTG9RYmKFPhCDB6H9eWuPX8E/sD7I63Na8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ej9sYEGo;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1AA606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F1AA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ej9sYEGo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794270591; x=1825806591;
  h=date:from:to:cc:subject:message-id;
  bh=eMdS/v8bv6NW59LOoEEnKl4l6c+GlJC0LwZ/U+3eUBo=;
  b=Ej9sYEGoU12gN0ezm9DwpzRdKWSnE8RG/MlngiQuCDuxXo92EWKjhivg
   sYyXzItegYJiXawbuW9MEdZzbimecETlotQuhaan0dyrHC/qeEsuw+btc
   XSkqT6SEMx+kAqlKHL2hUI/M0JoINawAZckZ8I/xeE2tgnzFMvpcCbniQ
   Ee2uVxGgM8jRB6tjT6Wi//Exat7xE49LDdMu/+oth20HuQ00NeMe/ri8P
   VsFh3zd9MuhuDyJ7cjKyRvT4AsR+0ByiN5Fx3MnGrm8FsJDqvWkA9qYsN
   VBloXytT2owpNXyX4DYQOWKgmEZr+EFsHN5zSfOcUo6PDkAu2rIxMbosY
   g==;
X-CSE-ConnectionGUID: 2TauZKQzTGu4p6yYzvk2Nw==
X-CSE-MsgGUID: AraC1rhHTYuRHeqB+m4iKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2894243"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2894243"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 16:29:49 -0800
X-CSE-ConnectionGUID: UkmF/IqLS2y4o6d8Uolxyw==
X-CSE-MsgGUID: JvppI6emS6+y7+NuTIRLqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7994295"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Nov 2026 16:29:48 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQZk9-00000000vcf-0drC;
	Tue, 10 Nov 2026 00:29:45 +0000
Date: Tue, 10 Nov 2026 08:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq:drivers] BUILD SUCCESS
 0fcfc884260ab15e303461de4494ef70a2d85983
Message-ID: <20261110082853.yy3XzUsF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
branch HEAD: 0fcfc884260ab15e303461de4494ef70a2d85983  irqchip/alpine-msi: Add debug logging for MSI allocation

elapsed time: 884m

configs tested: 555
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2200-20261110    gcc-9.5.0  smatch
alpha                randconfig-r2102-20261109    gcc-16.2.0 cocci
alpha                randconfig-r2103-20261109    gcc-8.5.0  cocci
alpha                randconfig-r2107-20261109    gcc-11.5.0 cocci
alpha                randconfig-r2111-20261109    gcc-11.5.0 cocci
alpha                randconfig-r2303-20261109    gcc-15.3.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261109    clang-24
arc                   randconfig-1000-20261110    gcc-10.5.0
arc                   randconfig-1001-20261109    clang-24
arc                   randconfig-1001-20261110    gcc-10.5.0
arc                   randconfig-2000-20261109    gcc-8.5.0
arc                   randconfig-2001-20261109    gcc-13.5.0
arc                   randconfig-2001-20261109    gcc-8.5.0
arc                   randconfig-2002-20261109    gcc-13.5.0
arc                   randconfig-2002-20261109    gcc-8.5.0
arc                   randconfig-2003-20261109    gcc-13.5.0
arc                   randconfig-2003-20261109    gcc-8.5.0
arc                   randconfig-2004-20261109    gcc-13.5.0
arc                   randconfig-2004-20261109    gcc-8.5.0
arc                   randconfig-2005-20261109    gcc-13.5.0
arc                   randconfig-2005-20261109    gcc-8.5.0
arc                   randconfig-2200-20261109    gcc-13.5.0 smatch
arc                  randconfig-r2105-20261109    clang-24   cocci
arc                  randconfig-r2105-20261109    gcc-14.4.0 cocci
arc                  randconfig-r2109-20261109    gcc-10.5.0 cocci
arc                  randconfig-r2110-20261109    gcc-14     cocci
arc                  randconfig-r2301-20261109    gcc-11.5.0 sparse
arc                  randconfig-r2311-20261109    gcc-15.3.0 sparse
arc                            tb10x_defconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    gcc-16.2.0
arm                          axm55xx_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                           gemini_defconfig    clang-17
arm                       integrator_defconfig    clang-17
arm                          lpc32xx_defconfig    clang-17
arm                             mmp2_defconfig    gcc-16.2.0
arm                         multi_v7_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261109    clang-24
arm                   randconfig-1000-20261110    gcc-10.5.0
arm                   randconfig-1001-20261109    clang-24
arm                   randconfig-1001-20261110    gcc-10.5.0
arm                   randconfig-1002-20261109    clang-24
arm                   randconfig-1002-20261110    gcc-10.5.0
arm                   randconfig-1003-20261109    clang-24
arm                   randconfig-1003-20261110    gcc-10.5.0
arm                   randconfig-2000-20261109    gcc-10.5.0
arm                   randconfig-2001-20261109    gcc-10.5.0
arm                   randconfig-2002-20261109    gcc-10.5.0
arm                   randconfig-2200-20261109    clang-20   smatch
arm                  randconfig-r2103-20261109    clang-17   cocci
arm                  randconfig-r2105-20261109    gcc-8.5.0  cocci
arm                  randconfig-r2111-20261109    clang-17   cocci
arm                  randconfig-r2111-20261109    gcc-11.5.0 cocci
arm                  randconfig-r2300-20261109    clang-24   sparse
arm                  randconfig-r2309-20261109    gcc-13.5.0 sparse
arm                           sp7021_defconfig    gcc-16.2.0
arm                          vf610m4_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261109    gcc-13.5.0
arm64                 randconfig-1000-20261110    gcc-12.5.0
arm64                 randconfig-1001-20261109    gcc-13.5.0
arm64                 randconfig-1001-20261110    gcc-12.5.0
arm64                 randconfig-1002-20261109    gcc-13.5.0
arm64                 randconfig-1002-20261110    gcc-12.5.0
arm64                 randconfig-1003-20261109    gcc-13.5.0
arm64                 randconfig-1003-20261110    gcc-12.5.0
arm64                 randconfig-2000-20261109    gcc-10.5.0
arm64                 randconfig-2001-20261109    gcc-10.5.0
arm64                 randconfig-2002-20261109    gcc-10.5.0
arm64                 randconfig-2200-20261109    gcc-10.5.0 smatch
arm64                 randconfig-2200-20261110    clang-24   smatch
arm64                randconfig-r2101-20261109    gcc-16.2.0 cocci
arm64                randconfig-r2102-20261109    gcc-16.2.0 cocci
arm64                randconfig-r2104-20261109    gcc-14.4.0 cocci
arm64                randconfig-r2107-20261109    clang-17   cocci
arm64                randconfig-r2301-20261109    clang-17   sparse
arm64                randconfig-r2305-20261109    clang-24   sparse
arm64                randconfig-r2310-20261109    gcc-13.5.0 sparse
arm64                randconfig-r2311-20261109    gcc-15.3.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261109    gcc-13.5.0
csky                  randconfig-1000-20261110    gcc-12.5.0
csky                  randconfig-1001-20261109    gcc-13.5.0
csky                  randconfig-1001-20261110    gcc-12.5.0
csky                  randconfig-2000-20261109    clang-17
csky                  randconfig-2001-20261109    clang-17
csky                  randconfig-2200-20261109    gcc-16.2.0 smatch
csky                  randconfig-2200-20261110    gcc-16.2.0 smatch
csky                 randconfig-r2100-20261109    gcc-16.2.0 cocci
csky                 randconfig-r2107-20261109    gcc-11.5.0 cocci
csky                 randconfig-r2301-20261109    gcc-15.3.0 sparse
csky                 randconfig-r2309-20261109    gcc-11.5.0 sparse
csky                 randconfig-r2310-20261109    gcc-11.5.0 sparse
csky                 randconfig-r2311-20261109    gcc-13.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261109    clang-19
hexagon               randconfig-1000-20261110    clang-17
hexagon               randconfig-1001-20261109    clang-19
hexagon               randconfig-1001-20261110    clang-17
hexagon               randconfig-2000-20261109    clang-17
hexagon               randconfig-2001-20261109    clang-17
hexagon               randconfig-2200-20261109    clang-17   smatch
hexagon               randconfig-2200-20261110    clang-24   smatch
hexagon              randconfig-r2100-20261109    clang-17   cocci
hexagon              randconfig-r2102-20261109    gcc-14.4.0 cocci
hexagon              randconfig-r2107-20261109    clang-24   cocci
hexagon              randconfig-r2111-20261109    gcc-10.5.0 cocci
hexagon              randconfig-r2303-20261109    clang-17   sparse
hexagon              randconfig-r2304-20261109    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261109    clang-22
i386        buildonly-randconfig-1000-20261110    clang-22
i386        buildonly-randconfig-1001-20261109    clang-22
i386        buildonly-randconfig-1001-20261110    clang-22
i386        buildonly-randconfig-1002-20261109    clang-22
i386        buildonly-randconfig-1002-20261110    clang-22
i386        buildonly-randconfig-1003-20261109    clang-22
i386        buildonly-randconfig-1003-20261110    clang-22
i386        buildonly-randconfig-1004-20261109    clang-22
i386        buildonly-randconfig-1004-20261110    clang-22
i386        buildonly-randconfig-1005-20261109    clang-22
i386        buildonly-randconfig-1005-20261110    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261109    gcc-14
i386                  randconfig-1000-20261110    gcc-14
i386                  randconfig-1001-20261109    gcc-14
i386                  randconfig-1001-20261110    gcc-14
i386                  randconfig-1002-20261109    gcc-14
i386                  randconfig-1002-20261110    gcc-14
i386                  randconfig-1003-20261109    gcc-14
i386                  randconfig-1003-20261110    gcc-14
i386                  randconfig-1004-20261109    gcc-14
i386                  randconfig-1004-20261110    gcc-14
i386                  randconfig-1005-20261109    gcc-14
i386                  randconfig-1005-20261110    gcc-14
i386                  randconfig-1006-20261109    gcc-14
i386                  randconfig-1006-20261110    gcc-14
i386                  randconfig-1007-20261109    gcc-12
i386                  randconfig-1007-20261110    clang-22
i386                  randconfig-1008-20261109    gcc-12
i386                  randconfig-1008-20261110    clang-22
i386                  randconfig-1009-20261109    gcc-12
i386                  randconfig-1009-20261110    clang-22
i386                  randconfig-1010-20261109    gcc-12
i386                  randconfig-1010-20261110    clang-22
i386                  randconfig-1011-20261109    gcc-12
i386                  randconfig-1011-20261110    clang-22
i386                  randconfig-1012-20261109    gcc-12
i386                  randconfig-1012-20261110    clang-22
i386                  randconfig-1013-20261109    gcc-12
i386                  randconfig-1013-20261110    clang-22
i386                  randconfig-2000-20261109    clang-22
i386                  randconfig-2001-20261109    clang-22
i386                  randconfig-2002-20261109    clang-22
i386                  randconfig-2003-20261109    clang-22
i386                  randconfig-2004-20261109    clang-22
i386                  randconfig-2005-20261109    clang-22
i386                  randconfig-2100-20261109    gcc-14     cocci
i386                  randconfig-2101-20261109    gcc-14     cocci
i386                  randconfig-2102-20261109    gcc-14     cocci
i386                  randconfig-2103-20261109    gcc-14     cocci
i386                  randconfig-2104-20261109    gcc-14     cocci
i386                  randconfig-2105-20261109    gcc-14     cocci
i386                  randconfig-2200-20261109    clang-22   smatch
i386                  randconfig-2300-20261109    clang-22   sparse
i386                  randconfig-2301-20261109    clang-22   sparse
i386                  randconfig-2302-20261109    clang-22   sparse
i386                 randconfig-r2101-20261109    clang-24   cocci
i386                 randconfig-r2102-20261109    gcc-8.5.0  cocci
i386                 randconfig-r2108-20261109    gcc-14     cocci
i386                 randconfig-r2109-20261109    gcc-14     cocci
i386                 randconfig-r2110-20261109    clang-17   cocci
i386                 randconfig-r2300-20261109    gcc-11.5.0 sparse
i386                 randconfig-r2302-20261109    gcc-11.5.0 sparse
i386                 randconfig-r2304-20261109    gcc-11.5.0 sparse
i386                 randconfig-r2307-20261109    gcc-13.5.0 sparse
i386                 randconfig-r2309-20261109    gcc-15.3.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261109    clang-19
loongarch             randconfig-1000-20261110    clang-17
loongarch             randconfig-1001-20261109    clang-19
loongarch             randconfig-1001-20261110    clang-17
loongarch             randconfig-2000-20261109    clang-18
loongarch             randconfig-2001-20261109    clang-18
loongarch             randconfig-2200-20261109    gcc-16.2.0 smatch
loongarch            randconfig-r2101-20261109    gcc-14.4.0 cocci
loongarch            randconfig-r2104-20261109    clang-24   cocci
loongarch            randconfig-r2106-20261109    clang-17   cocci
loongarch            randconfig-r2107-20261109    gcc-10.5.0 cocci
loongarch            randconfig-r2300-20261109    gcc-11.5.0 sparse
loongarch            randconfig-r2302-20261109    clang-17   sparse
loongarch            randconfig-r2303-20261109    clang-24   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5307c3_defconfig    clang-24
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                       m54418evb_defconfig    gcc-16.2.0
m68k                  randconfig-2200-20261109    gcc-12.5.0 smatch
m68k                 randconfig-r2101-20261109    gcc-16.2.0 cocci
m68k                 randconfig-r2105-20261109    gcc-16.2.0 cocci
m68k                 randconfig-r2106-20261109    gcc-14     cocci
m68k                 randconfig-r2307-20261109    gcc-11.5.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2200-20261109    gcc-9.5.0  smatch
microblaze           randconfig-r2103-20261109    gcc-14.4.0 cocci
microblaze           randconfig-r2110-20261109    gcc-16.2.0 cocci
microblaze           randconfig-r2301-20261109    clang-24   sparse
microblaze           randconfig-r2302-20261109    gcc-9.5.0  sparse
microblaze           randconfig-r2303-20261109    gcc-9.5.0  sparse
microblaze           randconfig-r2306-20261109    clang-24   sparse
microblaze           randconfig-r2306-20261109    gcc-15.3.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                   decstation_64_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                             gpr_defconfig    clang-24
mips                            ip27_defconfig    clang-17
mips                            jazz_defconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                   maltasmvp_eva_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261109    gcc-8.5.0
mips                  randconfig-2001-20261109    gcc-8.5.0
mips                  randconfig-2002-20261109    gcc-8.5.0
mips                  randconfig-2200-20261109    gcc-11.5.0 smatch
mips                 randconfig-r2101-20261109    clang-17   cocci
mips                 randconfig-r2107-20261109    gcc-14     cocci
mips                 randconfig-r2108-20261109    gcc-11.5.0 cocci
mips                 randconfig-r2109-20261109    gcc-11.5.0 cocci
mips                 randconfig-r2110-20261109    gcc-11.5.0 cocci
mips                 randconfig-r2300-20261109    gcc-15.3.0 sparse
mips                 randconfig-r2304-20261109    gcc-15.3.0 sparse
mips                 randconfig-r2304-20261109    gcc-9.5.0  sparse
mips                 randconfig-r2307-20261109    gcc-15.3.0 sparse
mips                 randconfig-r2308-20261109    gcc-11.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261109    clang-19
nios2                 randconfig-1000-20261110    clang-17
nios2                 randconfig-1001-20261109    clang-19
nios2                 randconfig-1001-20261110    clang-17
nios2                 randconfig-2000-20261109    clang-18
nios2                 randconfig-2001-20261109    clang-18
nios2                 randconfig-2200-20261109    gcc-11.5.0 smatch
nios2                randconfig-r2103-20261109    gcc-16.2.0 cocci
nios2                randconfig-r2104-20261109    gcc-16.2.0 cocci
nios2                randconfig-r2107-20261109    gcc-16.2.0 cocci
nios2                randconfig-r2307-20261109    gcc-15.3.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261109    gcc-8.5.0
openrisc              randconfig-2001-20261109    gcc-8.5.0
openrisc              randconfig-2002-20261109    gcc-8.5.0
openrisc              randconfig-2200-20261109    gcc-13.5.0 smatch
openrisc             randconfig-r2102-20261109    clang-24   cocci
openrisc             randconfig-r2103-20261109    gcc-16.2.0 cocci
openrisc             randconfig-r2106-20261109    gcc-16.2.0 cocci
openrisc             randconfig-r2108-20261109    gcc-10.5.0 cocci
openrisc             randconfig-r2300-20261109    clang-17   sparse
openrisc             randconfig-r2305-20261109    gcc-11.5.0 sparse
openrisc             randconfig-r2306-20261109    gcc-15.3.0 sparse
openrisc             randconfig-r2308-20261109    gcc-15.3.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261109    gcc-8.5.0
parisc                randconfig-1000-20261110    gcc-14.4.0
parisc                randconfig-1001-20261109    gcc-8.5.0
parisc                randconfig-1001-20261110    gcc-14.4.0
parisc                randconfig-2000-20261109    clang-18
parisc                randconfig-2001-20261109    clang-18
parisc                randconfig-2200-20261109    gcc-15.3.0 smatch
parisc               randconfig-r2100-20261109    gcc-8.5.0  cocci
parisc               randconfig-r2105-20261109    gcc-8.5.0  cocci
parisc               randconfig-r2111-20261109    gcc-16.2.0 cocci
parisc               randconfig-r2301-20261109    gcc-11.5.0 sparse
parisc64                          alldefconfig    gcc-16.2.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                           g5_defconfig    gcc-16.2.0
powerpc                     ge_imp3a_defconfig    gcc-16.2.0
powerpc                      kmeter1_defconfig    gcc-16.2.0
powerpc                      powernv_defconfig    clang-17
powerpc                      ppa8548_defconfig    clang-17
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261109    gcc-8.5.0
powerpc               randconfig-1000-20261110    gcc-14.4.0
powerpc               randconfig-1001-20261109    gcc-8.5.0
powerpc               randconfig-1001-20261110    gcc-14.4.0
powerpc               randconfig-2000-20261109    clang-24
powerpc               randconfig-2001-20261109    clang-24
powerpc               randconfig-2002-20261109    clang-24
powerpc               randconfig-2200-20261109    gcc-8.5.0  smatch
powerpc               randconfig-2200-20261110    clang-24   smatch
powerpc              randconfig-r2302-20261109    gcc-11.5.0 sparse
powerpc              randconfig-r2306-20261109    gcc-11.5.0 sparse
powerpc              randconfig-r2308-20261109    clang-24   sparse
powerpc                         warp_defconfig    clang-17
powerpc                         warp_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261109    gcc-8.5.0
powerpc64             randconfig-1000-20261110    gcc-14.4.0
powerpc64             randconfig-1001-20261109    gcc-8.5.0
powerpc64             randconfig-1001-20261110    gcc-14.4.0
powerpc64             randconfig-2000-20261109    clang-24
powerpc64             randconfig-2001-20261109    clang-24
powerpc64             randconfig-2002-20261109    clang-24
powerpc64             randconfig-2200-20261109    gcc-14.4.0 smatch
powerpc64            randconfig-r2104-20261109    gcc-16.2.0 cocci
powerpc64            randconfig-r2304-20261109    clang-17   sparse
powerpc64            randconfig-r2304-20261109    gcc-11.5.0 sparse
powerpc64            randconfig-r2310-20261109    gcc-15.3.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261109    gcc-8.5.0
riscv                 randconfig-1000-20261110    clang-24
riscv                 randconfig-1001-20261109    gcc-8.5.0
riscv                 randconfig-1001-20261110    clang-24
riscv                 randconfig-2000-20261109    gcc-14.4.0
riscv                 randconfig-2001-20261109    gcc-14.4.0
riscv                 randconfig-2002-20261109    gcc-14.4.0
riscv                 randconfig-2003-20261109    gcc-14.4.0
riscv                 randconfig-2004-20261109    gcc-14.4.0
riscv                 randconfig-2005-20261109    gcc-14.4.0
riscv                randconfig-r2102-20261109    gcc-8.5.0  cocci
riscv                randconfig-r2104-20261109    clang-17   cocci
riscv                randconfig-r2300-20261109    gcc-9.5.0  sparse
riscv                randconfig-r2305-20261109    gcc-11.5.0 sparse
riscv                randconfig-r2307-20261109    clang-24   sparse
riscv                randconfig-r2310-20261109    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    clang-24
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261109    gcc-8.5.0
s390                  randconfig-1000-20261110    clang-24
s390                  randconfig-1001-20261109    gcc-8.5.0
s390                  randconfig-1001-20261110    clang-24
s390                  randconfig-2000-20261109    gcc-8.5.0
s390                  randconfig-2001-20261109    gcc-8.5.0
s390                  randconfig-2002-20261109    gcc-8.5.0
s390                  randconfig-2003-20261109    gcc-8.5.0
s390                  randconfig-2004-20261109    gcc-8.5.0
s390                  randconfig-2005-20261109    gcc-8.5.0
s390                  randconfig-2200-20261109    clang-24   smatch
s390                 randconfig-r2100-20261109    gcc-14.4.0 cocci
s390                 randconfig-r2103-20261109    clang-24   cocci
s390                 randconfig-r2305-20261109    clang-17   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                         apsh4ad0a_defconfig    clang-24
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261109    gcc-8.5.0
sh                    randconfig-1000-20261110    clang-24
sh                    randconfig-1001-20261109    gcc-8.5.0
sh                    randconfig-1001-20261110    clang-24
sh                    randconfig-2000-20261109    gcc-16.2.0
sh                    randconfig-2001-20261109    gcc-16.2.0
sh                    randconfig-2002-20261109    gcc-16.2.0
sh                    randconfig-2003-20261109    gcc-16.2.0
sh                    randconfig-2004-20261109    gcc-16.2.0
sh                    randconfig-2005-20261109    gcc-16.2.0
sh                    randconfig-2200-20261109    gcc-9.5.0  smatch
sh                   randconfig-r2106-20261109    gcc-11.5.0 cocci
sh                   randconfig-r2108-20261109    gcc-11.5.0 cocci
sh                   randconfig-r2311-20261109    gcc-11.5.0 sparse
sh                           rsk7201_defconfig    clang-24
sh                            se7751_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261109    gcc-8.5.0
sparc                 randconfig-1000-20261110    gcc-12.5.0
sparc                 randconfig-1001-20261109    gcc-8.5.0
sparc                 randconfig-1001-20261110    gcc-12.5.0
sparc                 randconfig-2000-20261109    gcc-14
sparc                 randconfig-2001-20261109    gcc-14
sparc                randconfig-r2105-20261109    clang-17   cocci
sparc                randconfig-r2106-20261109    gcc-11.5.0 cocci
sparc                randconfig-r2109-20261109    gcc-16.2.0 cocci
sparc                randconfig-r2110-20261109    gcc-11.5.0 cocci
sparc                randconfig-r2301-20261109    gcc-9.5.0  sparse
sparc                randconfig-r2303-20261109    gcc-11.5.0 sparse
sparc                randconfig-r2308-20261109    gcc-13.5.0 sparse
sparc                randconfig-r2311-20261109    clang-24   sparse
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261109    gcc-8.5.0
sparc64               randconfig-1000-20261110    gcc-12.5.0
sparc64               randconfig-1001-20261109    gcc-8.5.0
sparc64               randconfig-1001-20261110    gcc-12.5.0
sparc64               randconfig-2000-20261109    gcc-14
sparc64               randconfig-2001-20261109    gcc-14
sparc64               randconfig-2200-20261109    clang-24   smatch
sparc64               randconfig-2200-20261110    clang-24   smatch
sparc64              randconfig-r2100-20261109    clang-24   cocci
sparc64              randconfig-r2103-20261109    gcc-8.5.0  cocci
sparc64              randconfig-r2108-20261109    clang-17   cocci
sparc64              randconfig-r2108-20261109    gcc-16.2.0 cocci
sparc64              randconfig-r2109-20261109    clang-17   cocci
sparc64              randconfig-r2109-20261109    gcc-11.5.0 cocci
sparc64              randconfig-r2111-20261109    gcc-14     cocci
sparc64              randconfig-r2305-20261109    gcc-15.3.0 sparse
sparc64              randconfig-r2306-20261109    gcc-13.5.0 sparse
sparc64              randconfig-r2309-20261109    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-16.2.0
um                    randconfig-1000-20261109    gcc-8.5.0
um                    randconfig-1000-20261110    gcc-12.5.0
um                    randconfig-1001-20261109    gcc-8.5.0
um                    randconfig-1001-20261110    gcc-12.5.0
um                    randconfig-2000-20261109    gcc-14
um                    randconfig-2001-20261109    gcc-14
um                    randconfig-2200-20261109    clang-24   smatch
um                   randconfig-r2101-20261109    gcc-8.5.0  cocci
um                   randconfig-r2104-20261109    gcc-8.5.0  cocci
um                   randconfig-r2106-20261109    clang-24   cocci
um                   randconfig-r2108-20261109    clang-24   cocci
um                   randconfig-r2111-20261109    clang-24   cocci
um                   randconfig-r2302-20261109    clang-24   sparse
um                   randconfig-r2308-20261109    gcc-15.3.0 sparse
um                   randconfig-r2309-20261109    gcc-15.3.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261109    clang-22
x86_64      buildonly-randconfig-1000-20261110    gcc-14
x86_64      buildonly-randconfig-1001-20261109    clang-22
x86_64      buildonly-randconfig-1001-20261110    gcc-14
x86_64      buildonly-randconfig-1002-20261109    clang-22
x86_64      buildonly-randconfig-1002-20261110    gcc-14
x86_64      buildonly-randconfig-1003-20261109    clang-22
x86_64      buildonly-randconfig-1003-20261110    gcc-14
x86_64      buildonly-randconfig-1004-20261109    clang-22
x86_64      buildonly-randconfig-1004-20261110    gcc-14
x86_64      buildonly-randconfig-1005-20261109    clang-22
x86_64      buildonly-randconfig-1005-20261110    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261109    clang-22
x86_64                randconfig-1000-20261110    gcc-14
x86_64                randconfig-1001-20261109    clang-22
x86_64                randconfig-1001-20261110    gcc-14
x86_64                randconfig-1002-20261109    clang-22
x86_64                randconfig-1002-20261110    gcc-14
x86_64                randconfig-1003-20261109    clang-22
x86_64                randconfig-1003-20261110    gcc-14
x86_64                randconfig-1004-20261109    clang-22
x86_64                randconfig-1004-20261110    gcc-14
x86_64                randconfig-1005-20261109    clang-22
x86_64                randconfig-1005-20261110    gcc-14
x86_64                randconfig-1006-20261109    gcc-14
x86_64                randconfig-1006-20261110    gcc-14
x86_64                randconfig-1007-20261109    gcc-14
x86_64                randconfig-1007-20261110    gcc-14
x86_64                randconfig-1008-20261109    gcc-14
x86_64                randconfig-1008-20261110    gcc-14
x86_64                randconfig-1009-20261109    gcc-14
x86_64                randconfig-1009-20261110    gcc-14
x86_64                randconfig-1010-20261109    gcc-14
x86_64                randconfig-1010-20261110    gcc-14
x86_64                randconfig-1011-20261109    gcc-14
x86_64                randconfig-1011-20261110    gcc-14
x86_64                randconfig-1012-20261109    clang-22
x86_64                randconfig-1012-20261110    gcc-14
x86_64                randconfig-1013-20261109    clang-22
x86_64                randconfig-1013-20261110    gcc-14
x86_64                randconfig-1014-20261109    clang-22
x86_64                randconfig-1014-20261110    gcc-14
x86_64                randconfig-1015-20261109    clang-22
x86_64                randconfig-1015-20261110    gcc-14
x86_64                randconfig-1016-20261109    clang-22
x86_64                randconfig-1016-20261110    gcc-14
x86_64                randconfig-1017-20261109    clang-22
x86_64                randconfig-1017-20261110    gcc-14
x86_64                randconfig-2000-20261109    clang-22
x86_64                randconfig-2001-20261109    clang-22
x86_64                randconfig-2002-20261109    clang-22
x86_64                randconfig-2003-20261109    clang-22
x86_64                randconfig-2004-20261109    clang-22
x86_64                randconfig-2005-20261109    clang-22
x86_64                randconfig-2100-20261109    clang-22   cocci
x86_64                randconfig-2101-20261109    clang-22   cocci
x86_64                randconfig-2102-20261109    clang-22   cocci
x86_64                randconfig-2103-20261109    clang-22   cocci
x86_64                randconfig-2104-20261109    clang-22   cocci
x86_64                randconfig-2105-20261109    clang-22   cocci
x86_64                randconfig-2200-20261109    clang-22   smatch
x86_64                randconfig-2300-20261109    clang-22   sparse
x86_64                randconfig-2301-20261109    clang-22   sparse
x86_64                randconfig-2302-20261109    clang-22   sparse
x86_64               randconfig-r2102-20261109    clang-17   cocci
x86_64               randconfig-r2104-20261109    gcc-8.5.0  cocci
x86_64               randconfig-r2109-20261109    clang-24   cocci
x86_64               randconfig-r2110-20261109    clang-24   cocci
x86_64               randconfig-r2110-20261109    gcc-10.5.0 cocci
x86_64               randconfig-r2302-20261109    gcc-15.3.0 sparse
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
xtensa                        common_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261109    gcc-8.5.0
xtensa                randconfig-1000-20261110    gcc-12.5.0
xtensa                randconfig-1001-20261109    gcc-8.5.0
xtensa                randconfig-1001-20261110    gcc-12.5.0
xtensa                randconfig-2000-20261109    clang-17
xtensa                randconfig-2001-20261109    clang-17
xtensa               randconfig-r2305-20261109    gcc-9.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
