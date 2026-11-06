Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961494;
	b=b3MUYLrQHdmb5Mt8H0J81PU6gMoZo+GMlnBpvDS91b8glsodQ59VQZiAYIdOVDaojAEu
	 kkIR/UE8Cgr/0p7rtuC4+F1X+yF9iHdM7E87lPErol9HQ41xPa0bfwpxsUIuSv2hLf4QN
	 Fo89EU+tK2bqdS1YmgfXnPr6MQ8Bvyjkxkry7ZaE9H7/SGWPXrLa6XaaUGNbuJAMVTQFl
	 CIO39DB3kylX9osFoS0jAwOQ3Z5+1chRAro8n2T+IfOEtxAyrJeKaBYbfqIAejWs+VBYC
	 LaUsNIjp8dhqxjfQlw2TsskkU6DVOUrO3+7d5uBg6VTV8blfrGUgIJISVykKNwUplYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961494;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7PJunHGmKGELFbnwQ/3HGadr9pJmLqjevFTc+TqDmvE=;
	b=xvP8CjP44Vh6t/VZEYtL8dqY6YZZm0GksIkG0sTBqBCOF3/ewOHZ6j4C1C/NaioBb58H
	 7xwCqj7582z9zKg/p59CTSTHs/RCggCGwg49X98gUlEfPBkxORzkxtf2fIOcORRhsR4Yc
	 lTJbk0uj3Ivsyi4qJHrwiJ21wEzHSqIqaFAlx3Ju+RdXboBpR4SzzRF2hVW/OgoDh1tJO
	 dJvzOao0i1xPajh1CcDgC93t9FO+fWWNytziFZ4KBiHcFns5bzM1fQJKP8MTa6ZbKtw4V
	 +Rxy7fY+8iS2JN242zerQt9Lux4iMHJs9HZ6V5536Zhj2gDNgBU3TVeIi8CT7QT6oUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="W4hg/596";
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E470606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E470606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W4hg/596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793961493; x=1825497493;
  h=date:from:to:cc:subject:message-id;
  bh=Lp+/JbhoFTHaq70SGXznt6YSqNdMpjzkA9XBUFon7D8=;
  b=W4hg/596opYRcgu8DOAUcOyMvngaSU9c9PPjfUmtbJo9my+w8DxGjBW8
   kkGBLo1Bh4ozWqv2fFQIW5BYjniat+PNq8iPyjKlamNFSYT5PfhocgPlA
   RirYGOaMe3rgy9XNfgTUICexFMjxqQNjHq2/qNPqlRfLXdXvsVhhV3l+F
   9ciyD7HD8UlwrYwaPGKVo+nTfNMpqjSkw1ZUGN1h8f3EP5+f1s84FFVHm
   cPsxS7Psom9+9HYL0SAwWPkB+Bn1S07yRap0FkRXwg+cAqwYsL2bmycsp
   AUL4o6vYZAS2GN53hzk7fYK0Ewjt/A1zV2Q/qNM4LKU1BsTPeXheO6WpE
   A==;
X-CSE-ConnectionGUID: 0aWuN/FDQqa83fvlyXPPaA==
X-CSE-MsgGUID: nY9q7zMsQAipPW7IbPrAOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2803483"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2803483"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 02:38:12 -0800
X-CSE-ConnectionGUID: AwUQPix7Sk6EH9bSHeitVA==
X-CSE-MsgGUID: WWfbTzXETxGZQ/JnIK1R9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="9118944"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 06 Nov 2026 02:38:10 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPHKh-00000000p47-41MJ;
	Fri, 06 Nov 2026 10:38:07 +0000
Date: Fri, 06 Nov 2026 18:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:urgent] BUILD SUCCESS
 dc2334c1752b3c5f58af74f1e7ad6769b38e1f33
Message-ID: <20261106183730.0P6ltc6W-lkp@intel.com>
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
branch HEAD: dc2334c1752b3c5f58af74f1e7ad6769b38e1f33  x86/sev: Set up RMPOPT only on an active SNP host

elapsed time: 1605m

configs tested: 477
configs skipped: 212

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261105    gcc-15.3.0
alpha                 randconfig-2001-20261105    gcc-15.3.0
alpha                 randconfig-2200-20261105    gcc-9.5.0  smatch
alpha                randconfig-r2101-20261105    gcc-8.5.0  cocci
arc                               allmodconfig    clang-24
arc                               allmodconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-19
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                           axs103_defconfig    clang-19
arc                           axs103_defconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261105    gcc-14.4.0
arc                   randconfig-1000-20261106    gcc-8.5.0
arc                   randconfig-1001-20261105    gcc-14.4.0
arc                   randconfig-1001-20261106    gcc-8.5.0
arc                   randconfig-2000-20261105    gcc-8.5.0
arc                   randconfig-2001-20261105    gcc-8.5.0
arc                   randconfig-2002-20261105    gcc-8.5.0
arc                   randconfig-2003-20261105    gcc-8.5.0
arc                   randconfig-2004-20261105    gcc-8.5.0
arc                   randconfig-2005-20261105    gcc-8.5.0
arc                   randconfig-2200-20261105    gcc-8.5.0  smatch
arc                  randconfig-r2101-20261105    gcc-16.2.0 cocci
arc                  randconfig-r2104-20261105    gcc-16.2.0 cocci
arc                  randconfig-r2106-20261105    gcc-8.5.0  cocci
arc                  randconfig-r2309-20261105    clang-24   sparse
arc                         vdk_hs38_defconfig    clang-17
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       integrator_defconfig    gcc-16.2.0
arm                          lpc32xx_defconfig    clang-17
arm                   randconfig-1000-20261105    gcc-14.4.0
arm                   randconfig-1000-20261106    gcc-8.5.0
arm                   randconfig-1001-20261105    gcc-14.4.0
arm                   randconfig-1001-20261106    gcc-8.5.0
arm                   randconfig-1002-20261105    gcc-14.4.0
arm                   randconfig-1002-20261106    gcc-8.5.0
arm                   randconfig-1003-20261105    gcc-14.4.0
arm                   randconfig-1003-20261106    gcc-8.5.0
arm                   randconfig-2000-20261105    clang-24
arm                   randconfig-2001-20261105    clang-24
arm                   randconfig-2002-20261105    clang-24
arm                   randconfig-2200-20261105    gcc-15.3.0 smatch
arm                  randconfig-r2107-20261105    gcc-8.5.0  cocci
arm                  randconfig-r2110-20261105    gcc-8.5.0  cocci
arm                          s3c6400_defconfig    gcc-16.2.0
arm                            sama5_defconfig    gcc-16.2.0
arm                        spear13xx_defconfig    gcc-16.2.0
arm                            sunxi_defconfig    clang-17
arm                            sunxi_defconfig    gcc-16.2.0
arm                            u8500_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261105    gcc-13.5.0
arm64                 randconfig-1000-20261106    clang-17
arm64                 randconfig-1001-20261105    gcc-13.5.0
arm64                 randconfig-1001-20261106    clang-17
arm64                 randconfig-1002-20261105    gcc-13.5.0
arm64                 randconfig-1002-20261106    clang-17
arm64                 randconfig-1003-20261105    gcc-13.5.0
arm64                 randconfig-1003-20261106    clang-17
arm64                 randconfig-2000-20261105    clang-24
arm64                 randconfig-2001-20261105    clang-24
arm64                 randconfig-2002-20261105    clang-24
arm64                 randconfig-2200-20261105    clang-20   smatch
arm64                randconfig-r2100-20261105    gcc-16.2.0 cocci
arm64                randconfig-r2102-20261105    gcc-16.2.0 cocci
arm64                randconfig-r2111-20261105    clang-24   cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261105    gcc-13.5.0
csky                  randconfig-1000-20261106    clang-17
csky                  randconfig-1001-20261105    gcc-13.5.0
csky                  randconfig-1001-20261106    clang-17
csky                  randconfig-2000-20261105    clang-24
csky                  randconfig-2001-20261105    clang-24
csky                  randconfig-2200-20261105    gcc-9.5.0  smatch
csky                 randconfig-r2103-20261105    gcc-16.2.0 cocci
csky                 randconfig-r2106-20261105    clang-24   cocci
csky                 randconfig-r2306-20261105    gcc-16.2.0 sparse
csky                 randconfig-r2310-20261105    gcc-16.2.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261105    clang-24
hexagon               randconfig-1000-20261106    gcc-14.4.0
hexagon               randconfig-1001-20261105    clang-24
hexagon               randconfig-1001-20261106    gcc-14.4.0
hexagon               randconfig-2000-20261105    clang-24
hexagon               randconfig-2001-20261105    clang-24
hexagon               randconfig-2200-20261105    clang-17   smatch
hexagon              randconfig-r2105-20261105    clang-24   cocci
hexagon              randconfig-r2310-20261105    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261105    gcc-14
i386        buildonly-randconfig-1000-20261106    clang-22
i386        buildonly-randconfig-1001-20261105    gcc-14
i386        buildonly-randconfig-1001-20261106    clang-22
i386        buildonly-randconfig-1002-20261105    gcc-14
i386        buildonly-randconfig-1002-20261106    clang-22
i386        buildonly-randconfig-1003-20261105    gcc-14
i386        buildonly-randconfig-1003-20261106    clang-22
i386        buildonly-randconfig-1004-20261105    gcc-14
i386        buildonly-randconfig-1004-20261106    clang-22
i386        buildonly-randconfig-1005-20261105    gcc-14
i386        buildonly-randconfig-1005-20261106    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261106    gcc-14
i386                  randconfig-1001-20261106    gcc-14
i386                  randconfig-1002-20261106    gcc-14
i386                  randconfig-1003-20261106    gcc-14
i386                  randconfig-1004-20261106    gcc-14
i386                  randconfig-1005-20261106    gcc-14
i386                  randconfig-1006-20261106    gcc-14
i386                  randconfig-1007-20261105    clang-22
i386                  randconfig-1007-20261106    gcc-14
i386                  randconfig-1008-20261105    clang-22
i386                  randconfig-1008-20261106    gcc-14
i386                  randconfig-1009-20261105    clang-22
i386                  randconfig-1009-20261106    gcc-14
i386                  randconfig-1010-20261105    clang-22
i386                  randconfig-1010-20261106    gcc-14
i386                  randconfig-1011-20261105    clang-22
i386                  randconfig-1011-20261106    gcc-14
i386                  randconfig-1012-20261105    clang-22
i386                  randconfig-1012-20261106    gcc-14
i386                  randconfig-1013-20261105    clang-22
i386                  randconfig-1013-20261106    gcc-14
i386                  randconfig-2000-20261105    clang-22
i386                  randconfig-2001-20261105    clang-22
i386                  randconfig-2002-20261105    clang-22
i386                  randconfig-2003-20261105    clang-22
i386                  randconfig-2004-20261105    clang-22
i386                  randconfig-2005-20261105    clang-22
i386                  randconfig-2100-20261105    gcc-14     cocci
i386                  randconfig-2101-20261105    gcc-14     cocci
i386                  randconfig-2102-20261105    gcc-14     cocci
i386                  randconfig-2103-20261105    gcc-14     cocci
i386                  randconfig-2104-20261105    gcc-14     cocci
i386                  randconfig-2105-20261105    gcc-14     cocci
i386                  randconfig-2200-20261105    clang-22   smatch
i386                 randconfig-r2104-20261105    gcc-8.5.0  cocci
i386                 randconfig-r2108-20261105    gcc-8.5.0  cocci
loongarch                         allmodconfig    clang-19
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261105    clang-24
loongarch             randconfig-1000-20261106    gcc-14.4.0
loongarch             randconfig-1001-20261105    clang-24
loongarch             randconfig-1001-20261106    gcc-14.4.0
loongarch             randconfig-2000-20261105    gcc-16.2.0
loongarch             randconfig-2001-20261105    gcc-16.2.0
loongarch             randconfig-2200-20261105    gcc-16.2.0 smatch
loongarch            randconfig-r2100-20261105    clang-24   cocci
loongarch            randconfig-r2104-20261105    gcc-14.4.0 cocci
loongarch            randconfig-r2111-20261105    gcc-8.5.0  cocci
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                           atari_defconfig    clang-17
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    gcc-16.2.0
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                       m54418evb_defconfig    clang-19
m68k                          nettel_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261105    gcc-15.3.0
m68k                  randconfig-2001-20261105    gcc-15.3.0
m68k                  randconfig-2200-20261105    gcc-8.5.0  smatch
m68k                 randconfig-r2102-20261105    clang-24   cocci
m68k                 randconfig-r2107-20261105    gcc-8.5.0  cocci
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261105    gcc-15.3.0
microblaze            randconfig-2001-20261105    gcc-15.3.0
microblaze            randconfig-2200-20261105    gcc-9.5.0  smatch
microblaze           randconfig-r2308-20261105    clang-24   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                   cavium_octeon_defconfig    gcc-16.2.0
mips                           eyeq5_defconfig    clang-17
mips                           eyeq5_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                            ip28_defconfig    gcc-16.2.0
mips                       loongson3_defconfig    gcc-16.2.0
mips                 malta_qemu_32r6_defconfig    clang-17
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                     maltaup_xpa_defconfig    clang-19
mips                            mtx1_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261105    gcc-9.5.0
mips                  randconfig-2001-20261105    gcc-9.5.0
mips                  randconfig-2002-20261105    gcc-9.5.0
mips                  randconfig-2200-20261105    gcc-11.5.0 smatch
mips                 randconfig-r2311-20261105    clang-24   sparse
mips                            xway_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261105    clang-24
nios2                 randconfig-1000-20261106    gcc-14.4.0
nios2                 randconfig-1001-20261105    clang-24
nios2                 randconfig-1001-20261106    gcc-14.4.0
nios2                 randconfig-2000-20261105    gcc-16.2.0
nios2                 randconfig-2001-20261105    gcc-16.2.0
nios2                 randconfig-2200-20261105    gcc-9.5.0  smatch
nios2                randconfig-r2109-20261105    gcc-8.5.0  cocci
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc                    de0_nano_defconfig    clang-19
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261105    gcc-9.5.0
openrisc              randconfig-2001-20261105    gcc-9.5.0
openrisc              randconfig-2002-20261105    gcc-9.5.0
openrisc              randconfig-2200-20261105    gcc-16.2.0 smatch
openrisc             randconfig-r2109-20261105    clang-24   cocci
openrisc             randconfig-r2110-20261105    gcc-8.5.0  cocci
openrisc             randconfig-r2111-20261105    gcc-8.5.0  cocci
openrisc             randconfig-r2308-20261105    gcc-16.2.0 sparse
openrisc                  simple_smp_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261105    clang-21
parisc                randconfig-1000-20261106    clang-19
parisc                randconfig-1001-20261105    clang-21
parisc                randconfig-1001-20261106    clang-19
parisc                randconfig-2000-20261105    gcc-16.2.0
parisc                randconfig-2001-20261105    gcc-16.2.0
parisc                randconfig-2200-20261105    gcc-15.3.0 smatch
parisc               randconfig-r2102-20261105    gcc-14.4.0 cocci
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      ep8248e_defconfig    clang-17
powerpc                       ep88xc_defconfig    clang-17
powerpc                     gamecube_defconfig    clang-19
powerpc                       mgcoge_defconfig    clang-17
powerpc                      mpc512x_defconfig    gcc-16.2.0
powerpc                   mpc866_ads_defconfig    clang-17
powerpc                   mpc885_ads_defconfig    clang-19
powerpc                       pcm030_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261105    clang-21
powerpc               randconfig-1000-20261106    clang-19
powerpc               randconfig-1001-20261105    clang-21
powerpc               randconfig-1001-20261106    clang-19
powerpc               randconfig-2000-20261105    clang-18
powerpc               randconfig-2001-20261105    clang-18
powerpc               randconfig-2002-20261105    clang-18
powerpc               randconfig-2200-20261105    clang-17   smatch
powerpc              randconfig-r2103-20261105    clang-24   cocci
powerpc              randconfig-r2103-20261105    gcc-14.4.0 cocci
powerpc                      tqm8555_defconfig    clang-19
powerpc                  xes_mpc85xx_defconfig    clang-17
powerpc64             randconfig-1000-20261105    clang-21
powerpc64             randconfig-1000-20261106    clang-19
powerpc64             randconfig-1001-20261105    clang-21
powerpc64             randconfig-1001-20261106    clang-19
powerpc64             randconfig-2000-20261105    clang-18
powerpc64             randconfig-2001-20261105    clang-18
powerpc64             randconfig-2002-20261105    clang-18
powerpc64             randconfig-2200-20261105    clang-24   smatch
powerpc64            randconfig-r2100-20261105    gcc-14.4.0 cocci
powerpc64            randconfig-r2105-20261105    gcc-16.2.0 cocci
powerpc64            randconfig-r2107-20261105    clang-24   cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261105    clang-24
riscv                 randconfig-1000-20261106    gcc-14.4.0
riscv                 randconfig-1001-20261105    clang-24
riscv                 randconfig-1001-20261106    gcc-14.4.0
riscv                 randconfig-2000-20261105    clang-24
riscv                 randconfig-2001-20261105    clang-24
riscv                 randconfig-2002-20261105    clang-24
riscv                 randconfig-2003-20261105    clang-24
riscv                 randconfig-2004-20261105    clang-24
riscv                 randconfig-2005-20261105    clang-24
riscv                 randconfig-2200-20261105    clang-24   smatch
riscv                randconfig-r2102-20261105    gcc-8.5.0  cocci
riscv                randconfig-r2108-20261105    clang-24   cocci
riscv                randconfig-r2108-20261105    gcc-8.5.0  cocci
s390                              alldefconfig    clang-17
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261105    clang-24
s390                  randconfig-1000-20261106    gcc-14.4.0
s390                  randconfig-1001-20261105    clang-24
s390                  randconfig-1001-20261106    gcc-14.4.0
s390                  randconfig-2000-20261105    clang-24
s390                  randconfig-2001-20261105    clang-24
s390                  randconfig-2002-20261105    clang-24
s390                  randconfig-2003-20261105    clang-24
s390                  randconfig-2004-20261105    clang-24
s390                  randconfig-2005-20261105    clang-24
s390                  randconfig-2200-20261105    clang-24   smatch
s390                 randconfig-r2307-20261105    gcc-16.2.0 sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                              espt_defconfig    gcc-16.2.0
sh                  kfr2r09-romimage_defconfig    clang-17
sh                           polaris_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261105    clang-24
sh                    randconfig-1000-20261106    gcc-14.4.0
sh                    randconfig-1001-20261105    clang-24
sh                    randconfig-1001-20261106    gcc-14.4.0
sh                    randconfig-2000-20261105    gcc-16.2.0
sh                    randconfig-2001-20261105    gcc-16.2.0
sh                    randconfig-2002-20261105    gcc-16.2.0
sh                    randconfig-2003-20261105    gcc-16.2.0
sh                    randconfig-2004-20261105    gcc-16.2.0
sh                    randconfig-2005-20261105    gcc-16.2.0
sh                    randconfig-2200-20261105    gcc-13.5.0 smatch
sh                   randconfig-r2103-20261105    gcc-8.5.0  cocci
sh                   randconfig-r2105-20261105    gcc-14.4.0 cocci
sh                   randconfig-r2306-20261105    clang-24   sparse
sh                   randconfig-r2309-20261105    gcc-16.2.0 sparse
sh                           rsk7201_defconfig    clang-17
sh                         sh7757lcr_defconfig    gcc-16.2.0
sh                              shx3_defconfig    clang-17
sh                              shx3_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261105    gcc-8.5.0
sparc                 randconfig-1000-20261106    gcc-15.3.0
sparc                 randconfig-1001-20261105    gcc-8.5.0
sparc                 randconfig-1001-20261106    gcc-15.3.0
sparc                 randconfig-2000-20261105    clang-24
sparc                 randconfig-2001-20261105    clang-24
sparc                 randconfig-2200-20261105    gcc-16.2.0 smatch
sparc                randconfig-r2101-20261105    clang-24   cocci
sparc                randconfig-r2101-20261105    gcc-14.4.0 cocci
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261105    gcc-8.5.0
sparc64               randconfig-1000-20261106    gcc-15.3.0
sparc64               randconfig-1001-20261105    gcc-8.5.0
sparc64               randconfig-1001-20261106    gcc-15.3.0
sparc64               randconfig-2000-20261105    clang-24
sparc64               randconfig-2001-20261105    clang-24
sparc64               randconfig-2200-20261105    gcc-8.5.0  smatch
sparc64              randconfig-r2105-20261105    gcc-8.5.0  cocci
um                                alldefconfig    gcc-16.2.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261105    gcc-8.5.0
um                    randconfig-1000-20261106    gcc-15.3.0
um                    randconfig-1001-20261105    gcc-8.5.0
um                    randconfig-1001-20261106    gcc-15.3.0
um                    randconfig-2000-20261105    clang-24
um                    randconfig-2001-20261105    clang-24
um                    randconfig-2200-20261105    clang-19   smatch
um                   randconfig-r2307-20261105    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    clang-19
x86_64                            alldefconfig    gcc-16.2.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261105    gcc-14
x86_64      buildonly-randconfig-1000-20261106    gcc-13
x86_64      buildonly-randconfig-1001-20261105    gcc-14
x86_64      buildonly-randconfig-1001-20261106    gcc-13
x86_64      buildonly-randconfig-1002-20261105    gcc-14
x86_64      buildonly-randconfig-1002-20261106    gcc-13
x86_64      buildonly-randconfig-1003-20261105    gcc-14
x86_64      buildonly-randconfig-1003-20261106    gcc-13
x86_64      buildonly-randconfig-1004-20261105    gcc-14
x86_64      buildonly-randconfig-1004-20261106    gcc-13
x86_64      buildonly-randconfig-1005-20261105    gcc-14
x86_64      buildonly-randconfig-1005-20261106    gcc-13
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261105    clang-22
x86_64                randconfig-1000-20261106    clang-22
x86_64                randconfig-1001-20261105    clang-22
x86_64                randconfig-1001-20261106    clang-22
x86_64                randconfig-1002-20261105    clang-22
x86_64                randconfig-1002-20261106    clang-22
x86_64                randconfig-1003-20261105    clang-22
x86_64                randconfig-1003-20261106    clang-22
x86_64                randconfig-1004-20261105    clang-22
x86_64                randconfig-1004-20261106    clang-22
x86_64                randconfig-1005-20261105    clang-22
x86_64                randconfig-1005-20261106    clang-22
x86_64                randconfig-1006-20261105    clang-22
x86_64                randconfig-1006-20261106    clang-22
x86_64                randconfig-1007-20261105    clang-22
x86_64                randconfig-1007-20261106    clang-22
x86_64                randconfig-1008-20261105    clang-22
x86_64                randconfig-1008-20261106    clang-22
x86_64                randconfig-1009-20261105    clang-22
x86_64                randconfig-1009-20261106    clang-22
x86_64                randconfig-1010-20261105    clang-22
x86_64                randconfig-1010-20261106    clang-22
x86_64                randconfig-1011-20261105    clang-22
x86_64                randconfig-1011-20261106    clang-22
x86_64                randconfig-1012-20261105    clang-22
x86_64                randconfig-1012-20261106    gcc-14
x86_64                randconfig-1013-20261105    clang-22
x86_64                randconfig-1013-20261106    gcc-14
x86_64                randconfig-1014-20261105    clang-22
x86_64                randconfig-1014-20261106    gcc-14
x86_64                randconfig-1015-20261105    clang-22
x86_64                randconfig-1015-20261106    gcc-14
x86_64                randconfig-1016-20261105    clang-22
x86_64                randconfig-1016-20261106    gcc-14
x86_64                randconfig-1017-20261105    clang-22
x86_64                randconfig-1017-20261106    gcc-14
x86_64                randconfig-2000-20261105    gcc-14
x86_64                randconfig-2001-20261105    gcc-14
x86_64                randconfig-2002-20261105    gcc-14
x86_64                randconfig-2003-20261105    gcc-14
x86_64                randconfig-2004-20261105    gcc-14
x86_64                randconfig-2005-20261105    gcc-14
x86_64                randconfig-2100-20261105    gcc-14     cocci
x86_64                randconfig-2101-20261105    gcc-14     cocci
x86_64                randconfig-2102-20261105    gcc-14     cocci
x86_64                randconfig-2103-20261105    gcc-14     cocci
x86_64                randconfig-2104-20261105    gcc-14     cocci
x86_64                randconfig-2105-20261105    gcc-14     cocci
x86_64                randconfig-2200-20261105    clang-22   smatch
x86_64               randconfig-r2100-20261105    gcc-8.5.0  cocci
x86_64               randconfig-r2110-20261105    clang-24   cocci
x86_64               randconfig-r2311-20261105    gcc-16.2.0 sparse
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
xtensa                            allyesconfig    gcc-11.5.0
xtensa                 generic_kc705_defconfig    gcc-16.2.0
xtensa                   nommu_kc705_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261105    gcc-8.5.0
xtensa                randconfig-1000-20261106    gcc-15.3.0
xtensa                randconfig-1001-20261105    gcc-8.5.0
xtensa                randconfig-1001-20261106    gcc-15.3.0
xtensa                randconfig-2000-20261105    clang-24
xtensa                randconfig-2001-20261105    clang-24
xtensa                randconfig-2200-20261105    gcc-8.5.0  smatch
xtensa               randconfig-r2104-20261105    clang-24   cocci
xtensa               randconfig-r2106-20261105    gcc-8.5.0  cocci
xtensa               randconfig-r2109-20261105    gcc-8.5.0  cocci
xtensa                     xip_kc705_defconfig    clang-17
xtensa                     xip_kc705_defconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
