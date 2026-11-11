Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422743;
	b=HlAgsc5t3Sc0PzZm6P5BiSitHJqJtBQHYZGGuM/mmEv81+CnmLk9706U6n7zlLdF+OlQ
	 a0PlXBF44s3gpX2Wr+D3UAQK3u/OROrNlQ3MrzHizpbKzdnCsk+967xhz8+h1/Z/c6GtM
	 q+ax/B9+caTv1k3bjaJBhXZ7tnDhWDBUNCfGp3pHls3+2gv3Mqn6GJbcoiXFFyaNnR1Yk
	 p2FgOc4i/xjGvWVAhgn6Ij+PvPZ1wWMTdYkKI1B+N38Mv6vvkeaYrNstiIFzdHw4xOe8A
	 /OnOrOTWskE027yv/+VgR6f0DSULg2U6IycZ/HLYa7oEX/6dexfwJjl46PdmbRQTiog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422743;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Qh6xsWFcr+TyYhEwSuT+xUOK6Ue4GbA4oASY4DtGgNY=;
	b=cfirvKuMRwLq++1YZVyLuU/zxn01KEET93IpT1aOtxfOA8FUmkGv41vT9CsmqgoAj/qS
	 eZq2MFq4fwwmvOK0b7N6oB2ypAFukeNwWsLR70GjTqtFh/BnXiejLjVewa/T7vHvYik4T
	 RWRMOIykXxk3HJ1YsJCuUfrQyHD8Lt5NiBHk7YcAHro7mFYjqOfOde38GuYchO0s+knul
	 s1/CwJRjmeJrosQ6jBUuJqn5+puEvTFq9gWb4ITqVFcAppSQCKMtZx9bCwTCQzCADpC7v
	 W1Zjjg0ytGtSYy3rSejlphVJm1rOMLNvf7ooO8TKECRyZvGI6ULaG2YPDtF4soRGHMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=khn1+m+X;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426FC606A334
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 426FC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=khn1+m+X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794422742; x=1825958742;
  h=date:from:to:cc:subject:message-id;
  bh=leoVNoUeo5yf9krn6Ld1UoU/JJIEuErLEuolrE3e01I=;
  b=khn1+m+XWBHyjvWWpkIZ4Fpu+K/Tl4gGVppFkxtHk1bPzg7KOqfXUEv2
   X8ntitK+tMMle+7TKhjuJpE7csEbMba6+//e7EairZeu6e4bF7guF9doF
   4orAM1e+UipHjWF47NMi7UYqDfKY4Ab3DKZAMWH4ZOIXsDzqMCORVXXui
   7FHT6KFuGOgC++3Z75rQXGCSMbrkx+tlxU2z8uOieIg8fslNKstm8SAzw
   boArYtswlhZqcDl8ldO01vPovRFoUqYV9DNam9rIfJKCA5Ke/ybOdxHTC
   n1u+buMf0H3AWboancf26HDBpiVnkRb4t+zLVkWHmLCimWXE3YI04lsvV
   Q==;
X-CSE-ConnectionGUID: mP3tHsswRS2v12LKS5F9/A==
X-CSE-MsgGUID: CEQ1B4i1QJC7z4VKfK7ujA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3093772"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3093772"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:45:41 -0800
X-CSE-ConnectionGUID: 4iaRtlL7TFyEuo+PcsCcqQ==
X-CSE-MsgGUID: 77Fr/EpgQCO8mNQb4qKarA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8814112"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Nov 2026 10:45:40 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRDKD-00000000zV7-1cg2;
	Wed, 11 Nov 2026 18:45:37 +0000
Date: Thu, 12 Nov 2026 02:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 c6279551a44c06f4cb1f7b1df2fb8e0d6d6e54cd
Message-ID: <20261112024518.KRx695pd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: c6279551a44c06f4cb1f7b1df2fb8e0d6d6e54cd  Merge branch into tip/master: 'x86/sev'

elapsed time: 1388m

configs tested: 497
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             alldefconfig    gcc-16.2.0
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261111    gcc-8.5.0
alpha                 randconfig-2001-20261111    gcc-8.5.0
alpha                 randconfig-2200-20261110    gcc-9.5.0  smatch
alpha                 randconfig-2200-20261111    gcc-12.5.0 smatch
alpha                randconfig-r2109-20261111    gcc-15.3.0 cocci
alpha                randconfig-r2110-20261111    gcc-15.3.0 cocci
alpha                randconfig-r2111-20261111    gcc-9.5.0  cocci
alpha                randconfig-r2301-20261110    gcc-10.5.0 sparse
alpha                randconfig-r2306-20261111    clang-17   sparse
alpha                randconfig-r2307-20261111    gcc-14     sparse
arc                               alldefconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                               allmodconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                       axs103_smp_defconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                         nsimosci_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261111    gcc-15.3.0
arc                   randconfig-1001-20261111    gcc-15.3.0
arc                   randconfig-2000-20261110    gcc-8.5.0
arc                   randconfig-2000-20261111    gcc-14.4.0
arc                   randconfig-2001-20261110    gcc-8.5.0
arc                   randconfig-2001-20261111    gcc-14.4.0
arc                   randconfig-2002-20261110    gcc-8.5.0
arc                   randconfig-2002-20261111    gcc-14.4.0
arc                   randconfig-2003-20261110    gcc-8.5.0
arc                   randconfig-2003-20261111    gcc-14.4.0
arc                   randconfig-2004-20261110    gcc-8.5.0
arc                   randconfig-2004-20261111    gcc-14.4.0
arc                   randconfig-2005-20261110    gcc-8.5.0
arc                   randconfig-2005-20261111    gcc-14.4.0
arc                   randconfig-2200-20261110    gcc-8.5.0  smatch
arc                   randconfig-2200-20261111    gcc-16.2.0 smatch
arc                  randconfig-r2104-20261111    gcc-13.5.0 cocci
arc                  randconfig-r2300-20261110    gcc-10.5.0 sparse
arc                  randconfig-r2300-20261111    gcc-8.5.0  sparse
arc                  randconfig-r2301-20261111    gcc-8.5.0  sparse
arc                  randconfig-r2308-20261111    gcc-14     sparse
arc                  randconfig-r2311-20261111    clang-17   sparse
arc                            tb10x_defconfig    clang-19
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    gcc-16.2.0
arm                          bcm2835_defconfig    gcc-16.2.0
arm                      davinci_all_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                             hisi_defconfig    gcc-16.2.0
arm                         mvebu_v5_defconfig    gcc-16.2.0
arm                         mvebu_v7_defconfig    clang-24
arm                           pxa910_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261111    gcc-15.3.0
arm                   randconfig-1001-20261111    gcc-15.3.0
arm                   randconfig-1002-20261111    gcc-15.3.0
arm                   randconfig-1003-20261111    gcc-15.3.0
arm                   randconfig-2000-20261110    clang-24
arm                   randconfig-2000-20261111    gcc-16.2.0
arm                   randconfig-2001-20261110    clang-24
arm                   randconfig-2001-20261111    gcc-16.2.0
arm                   randconfig-2002-20261110    clang-24
arm                   randconfig-2002-20261111    gcc-16.2.0
arm                   randconfig-2200-20261110    gcc-11.5.0 smatch
arm                   randconfig-2200-20261111    gcc-8.5.0  smatch
arm                  randconfig-r2304-20261110    gcc-10.5.0 sparse
arm                         shmobile_defconfig    gcc-16.2.0
arm                         spear6xx_defconfig    clang-19
arm                            sunxi_defconfig    clang-19
arm                        versatile_defconfig    clang-19
arm                         vexpress_defconfig    clang-19
arm                          vf610m4_defconfig    gcc-16.2.0
arm                     vt8500_v6_v7_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261111    gcc-13.5.0
arm64                 randconfig-1001-20261111    gcc-13.5.0
arm64                 randconfig-1002-20261111    gcc-13.5.0
arm64                 randconfig-1003-20261111    gcc-13.5.0
arm64                 randconfig-2000-20261110    clang-24
arm64                 randconfig-2000-20261111    gcc-16.2.0
arm64                 randconfig-2001-20261110    clang-24
arm64                 randconfig-2001-20261111    gcc-16.2.0
arm64                 randconfig-2002-20261110    clang-24
arm64                 randconfig-2002-20261111    gcc-16.2.0
arm64                 randconfig-2200-20261110    clang-24   smatch
arm64                 randconfig-2200-20261111    gcc-11.5.0 smatch
arm64                randconfig-r2106-20261111    gcc-9.5.0  cocci
arm64                randconfig-r2110-20261110    clang-19   cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261111    gcc-13.5.0
csky                  randconfig-1001-20261111    gcc-13.5.0
csky                  randconfig-2000-20261110    gcc-11.5.0
csky                  randconfig-2000-20261111    gcc-16.2.0
csky                  randconfig-2001-20261110    gcc-11.5.0
csky                  randconfig-2001-20261111    gcc-16.2.0
csky                  randconfig-2200-20261110    gcc-16.2.0 smatch
csky                  randconfig-2200-20261111    gcc-16.2.0 smatch
csky                 randconfig-r2108-20261110    clang-19   cocci
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261111    clang-17
hexagon               randconfig-1001-20261111    clang-17
hexagon               randconfig-2000-20261110    gcc-11.5.0
hexagon               randconfig-2000-20261111    gcc-16.2.0
hexagon               randconfig-2001-20261110    gcc-11.5.0
hexagon               randconfig-2001-20261111    gcc-16.2.0
hexagon               randconfig-2200-20261111    clang-24   smatch
hexagon              randconfig-r2309-20261110    gcc-15.3.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261111    clang-22
i386        buildonly-randconfig-1001-20261111    clang-22
i386        buildonly-randconfig-1002-20261111    clang-22
i386        buildonly-randconfig-1003-20261111    clang-22
i386        buildonly-randconfig-1004-20261111    clang-22
i386        buildonly-randconfig-1005-20261111    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261111    gcc-13
i386                  randconfig-1001-20261111    gcc-13
i386                  randconfig-1002-20261111    gcc-13
i386                  randconfig-1003-20261111    gcc-13
i386                  randconfig-1004-20261111    gcc-13
i386                  randconfig-1005-20261111    gcc-13
i386                  randconfig-1006-20261111    gcc-13
i386                  randconfig-1007-20261111    clang-22
i386                  randconfig-1008-20261111    clang-22
i386                  randconfig-1009-20261111    clang-22
i386                  randconfig-1010-20261111    clang-22
i386                  randconfig-1011-20261111    clang-22
i386                  randconfig-1012-20261111    clang-22
i386                  randconfig-1013-20261111    clang-22
i386                  randconfig-2000-20261110    clang-22
i386                  randconfig-2000-20261111    gcc-14
i386                  randconfig-2001-20261110    clang-22
i386                  randconfig-2001-20261111    gcc-14
i386                  randconfig-2002-20261110    clang-22
i386                  randconfig-2002-20261111    gcc-14
i386                  randconfig-2003-20261110    clang-22
i386                  randconfig-2003-20261111    gcc-14
i386                  randconfig-2004-20261110    clang-22
i386                  randconfig-2004-20261111    gcc-14
i386                  randconfig-2005-20261110    clang-22
i386                  randconfig-2005-20261111    gcc-14
i386                  randconfig-2100-20261110    gcc-14     cocci
i386                  randconfig-2100-20261111    gcc-14     cocci
i386                  randconfig-2101-20261110    gcc-14     cocci
i386                  randconfig-2101-20261111    gcc-14     cocci
i386                  randconfig-2102-20261110    gcc-14     cocci
i386                  randconfig-2102-20261111    gcc-14     cocci
i386                  randconfig-2103-20261110    gcc-14     cocci
i386                  randconfig-2103-20261111    gcc-14     cocci
i386                  randconfig-2104-20261110    gcc-14     cocci
i386                  randconfig-2104-20261111    gcc-14     cocci
i386                  randconfig-2105-20261110    gcc-14     cocci
i386                  randconfig-2105-20261111    gcc-14     cocci
i386                  randconfig-2200-20261110    gcc-13     smatch
i386                  randconfig-2200-20261111    gcc-14     smatch
i386                  randconfig-2300-20261110    clang-22   sparse
i386                  randconfig-2300-20261111    gcc-14     sparse
i386                  randconfig-2301-20261110    clang-22   sparse
i386                  randconfig-2301-20261111    gcc-14     sparse
i386                  randconfig-2302-20261110    clang-22   sparse
i386                  randconfig-2302-20261111    gcc-14     sparse
i386                 randconfig-r2106-20261111    gcc-8.5.0  cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261111    clang-17
loongarch             randconfig-1001-20261111    clang-17
loongarch             randconfig-2000-20261111    gcc-11.5.0
loongarch             randconfig-2001-20261111    gcc-11.5.0
loongarch             randconfig-2200-20261110    clang-24   smatch
loongarch             randconfig-2200-20261111    gcc-16.2.0 smatch
loongarch            randconfig-r2102-20261111    gcc-13.5.0 cocci
loongarch            randconfig-r2105-20261111    gcc-13.5.0 cocci
loongarch            randconfig-r2107-20261110    clang-19   cocci
loongarch            randconfig-r2109-20261111    gcc-9.5.0  cocci
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                          amcore_defconfig    gcc-16.2.0
m68k                           atari_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                  randconfig-2000-20261111    gcc-8.5.0
m68k                  randconfig-2001-20261111    gcc-8.5.0
m68k                  randconfig-2200-20261110    gcc-16.2.0 smatch
m68k                  randconfig-2200-20261111    gcc-9.5.0  smatch
m68k                 randconfig-r2107-20261111    gcc-9.5.0  cocci
m68k                 randconfig-r2108-20261111    gcc-15.3.0 cocci
m68k                 randconfig-r2111-20261110    clang-19   cocci
m68k                 randconfig-r2111-20261111    gcc-8.5.0  cocci
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261111    gcc-8.5.0
microblaze            randconfig-2001-20261111    gcc-8.5.0
microblaze            randconfig-2200-20261110    gcc-8.5.0  smatch
microblaze            randconfig-2200-20261111    gcc-8.5.0  smatch
microblaze           randconfig-r2302-20261111    gcc-8.5.0  sparse
microblaze           randconfig-r2307-20261110    gcc-15.3.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                 econet_en751221_defconfig    gcc-16.2.0
mips                           eyeq6_defconfig    clang-24
mips                             gpr_defconfig    clang-24
mips                        lemote2f_defconfig    clang-24
mips                       malta_kvm_defconfig    clang-19
mips                            mtx1_defconfig    clang-24
mips                         qi_lb60_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261110    gcc-16.2.0
mips                  randconfig-2000-20261111    gcc-10.5.0
mips                  randconfig-2001-20261110    gcc-16.2.0
mips                  randconfig-2001-20261111    gcc-10.5.0
mips                  randconfig-2002-20261110    gcc-16.2.0
mips                  randconfig-2002-20261111    gcc-10.5.0
mips                  randconfig-2200-20261110    clang-17   smatch
mips                  randconfig-2200-20261111    clang-19   smatch
mips                 randconfig-r2300-20261111    gcc-11.5.0 sparse
mips                            xway_defconfig    clang-19
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261111    clang-17
nios2                 randconfig-1001-20261111    clang-17
nios2                 randconfig-2000-20261111    gcc-11.5.0
nios2                 randconfig-2001-20261111    gcc-11.5.0
nios2                 randconfig-2200-20261111    gcc-8.5.0  smatch
nios2                randconfig-r2304-20261111    gcc-11.5.0 sparse
openrisc                          alldefconfig    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc                     or1ksim_defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261110    gcc-16.2.0
openrisc              randconfig-2000-20261111    gcc-10.5.0
openrisc              randconfig-2001-20261110    gcc-16.2.0
openrisc              randconfig-2001-20261111    gcc-10.5.0
openrisc              randconfig-2002-20261110    gcc-16.2.0
openrisc              randconfig-2002-20261111    gcc-10.5.0
openrisc              randconfig-2200-20261110    gcc-9.5.0  smatch
openrisc              randconfig-2200-20261111    gcc-16.2.0 smatch
openrisc             randconfig-r2305-20261110    gcc-10.5.0 sparse
openrisc             randconfig-r2311-20261111    gcc-14     sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261111    gcc-15.3.0
parisc                randconfig-1001-20261111    gcc-15.3.0
parisc                randconfig-2000-20261111    gcc-11.5.0
parisc                randconfig-2001-20261111    gcc-11.5.0
parisc                randconfig-2200-20261110    gcc-15.3.0 smatch
parisc                randconfig-2200-20261111    gcc-14.4.0 smatch
parisc               randconfig-r2100-20261111    gcc-13.5.0 cocci
parisc               randconfig-r2106-20261111    gcc-15.3.0 cocci
parisc64                          alldefconfig    clang-24
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                        eiger_defconfig    gcc-16.2.0
powerpc                         icon_defconfig    clang-19
powerpc               randconfig-1000-20261111    gcc-15.3.0
powerpc               randconfig-1001-20261111    gcc-15.3.0
powerpc               randconfig-2000-20261110    gcc-10.5.0
powerpc               randconfig-2000-20261111    gcc-11.5.0
powerpc               randconfig-2001-20261110    gcc-10.5.0
powerpc               randconfig-2001-20261111    gcc-11.5.0
powerpc               randconfig-2002-20261110    gcc-10.5.0
powerpc               randconfig-2002-20261111    gcc-11.5.0
powerpc               randconfig-2200-20261110    clang-24   smatch
powerpc               randconfig-2200-20261111    gcc-13.5.0 smatch
powerpc              randconfig-r2107-20261111    gcc-15.3.0 cocci
powerpc              randconfig-r2302-20261111    gcc-11.5.0 sparse
powerpc                       tqm8xx_defconfig    gcc-16.2.0
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261111    gcc-15.3.0
powerpc64             randconfig-1001-20261111    gcc-15.3.0
powerpc64             randconfig-2000-20261110    gcc-10.5.0
powerpc64             randconfig-2000-20261111    gcc-11.5.0
powerpc64             randconfig-2001-20261110    gcc-10.5.0
powerpc64             randconfig-2001-20261111    gcc-11.5.0
powerpc64             randconfig-2002-20261110    gcc-10.5.0
powerpc64             randconfig-2002-20261111    gcc-11.5.0
powerpc64             randconfig-2200-20261110    clang-24   smatch
powerpc64             randconfig-2200-20261111    gcc-11.5.0 smatch
powerpc64            randconfig-r2109-20261111    gcc-8.5.0  cocci
powerpc64            randconfig-r2308-20261110    gcc-15.3.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261111    clang-17
riscv                 randconfig-1001-20261111    clang-17
riscv                 randconfig-2000-20261110    gcc-12.5.0
riscv                 randconfig-2000-20261111    clang-21
riscv                 randconfig-2001-20261110    gcc-12.5.0
riscv                 randconfig-2001-20261111    clang-21
riscv                 randconfig-2002-20261110    gcc-12.5.0
riscv                 randconfig-2002-20261111    clang-21
riscv                 randconfig-2003-20261110    gcc-12.5.0
riscv                 randconfig-2003-20261111    clang-21
riscv                 randconfig-2004-20261110    gcc-12.5.0
riscv                 randconfig-2004-20261111    clang-21
riscv                 randconfig-2005-20261110    gcc-12.5.0
riscv                 randconfig-2005-20261111    clang-21
riscv                 randconfig-2200-20261110    gcc-8.5.0  smatch
riscv                randconfig-r2108-20261111    gcc-8.5.0  cocci
riscv                randconfig-r2110-20261111    gcc-8.5.0  cocci
riscv                randconfig-r2310-20261111    clang-17   sparse
riscv                randconfig-r2311-20261110    gcc-15.3.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261111    clang-17
s390                  randconfig-1001-20261111    clang-17
s390                  randconfig-2000-20261110    clang-20
s390                  randconfig-2000-20261111    gcc-8.5.0
s390                  randconfig-2001-20261110    clang-20
s390                  randconfig-2001-20261111    gcc-8.5.0
s390                  randconfig-2002-20261110    clang-20
s390                  randconfig-2002-20261111    gcc-8.5.0
s390                  randconfig-2003-20261110    clang-20
s390                  randconfig-2003-20261111    gcc-8.5.0
s390                  randconfig-2004-20261110    clang-20
s390                  randconfig-2004-20261111    gcc-8.5.0
s390                  randconfig-2005-20261110    clang-20
s390                  randconfig-2005-20261111    gcc-8.5.0
s390                  randconfig-2200-20261110    clang-18   smatch
s390                 randconfig-r2106-20261110    clang-19   cocci
s390                 randconfig-r2301-20261111    gcc-11.5.0 sparse
s390                 randconfig-r2305-20261111    gcc-11.5.0 sparse
s390                 randconfig-r2305-20261111    gcc-8.5.0  sparse
s390                        zfcpdump_defconfig    gcc-16.2.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                allyesconfig    gcc-16.2.0
sh                                   defconfig    gcc-14
sh                 ecovec24-romimage_defconfig    gcc-16.2.0
sh                  kfr2r09-romimage_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261111    clang-17
sh                    randconfig-1001-20261111    clang-17
sh                    randconfig-2000-20261110    gcc-9.5.0
sh                    randconfig-2000-20261111    gcc-16.2.0
sh                    randconfig-2001-20261110    gcc-9.5.0
sh                    randconfig-2001-20261111    gcc-16.2.0
sh                    randconfig-2002-20261110    gcc-9.5.0
sh                    randconfig-2002-20261111    gcc-16.2.0
sh                    randconfig-2003-20261110    gcc-9.5.0
sh                    randconfig-2003-20261111    gcc-16.2.0
sh                    randconfig-2004-20261110    gcc-9.5.0
sh                    randconfig-2004-20261111    gcc-16.2.0
sh                    randconfig-2005-20261110    gcc-9.5.0
sh                    randconfig-2005-20261111    gcc-16.2.0
sh                    randconfig-2200-20261110    gcc-16.2.0 smatch
sh                    randconfig-2200-20261111    gcc-16.2.0 smatch
sh                   randconfig-r2103-20261111    gcc-13.5.0 cocci
sh                   randconfig-r2108-20261111    gcc-9.5.0  cocci
sh                   randconfig-r2302-20261110    gcc-10.5.0 sparse
sh                   randconfig-r2304-20261111    gcc-8.5.0  sparse
sh                   randconfig-r2309-20261111    clang-17   sparse
sh                   randconfig-r2310-20261111    gcc-14     sparse
sh                            se7780_defconfig    gcc-16.2.0
sh                            sh2007_defconfig    gcc-16.2.0
sh                         sh7763rdp_defconfig    gcc-16.2.0
sh                             shmin_defconfig    gcc-16.2.0
sh                               ul2_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261111    gcc-16.2.0
sparc                 randconfig-1001-20261111    gcc-16.2.0
sparc                 randconfig-2000-20261110    gcc-14
sparc                 randconfig-2000-20261111    clang-18
sparc                 randconfig-2001-20261110    gcc-14
sparc                 randconfig-2001-20261111    clang-18
sparc                 randconfig-2200-20261110    gcc-13.5.0 smatch
sparc                 randconfig-2200-20261111    gcc-12.5.0 smatch
sparc                randconfig-r2101-20261111    gcc-13.5.0 cocci
sparc                randconfig-r2107-20261111    gcc-8.5.0  cocci
sparc                randconfig-r2109-20261110    clang-19   cocci
sparc                randconfig-r2306-20261110    gcc-15.3.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261111    gcc-16.2.0
sparc64               randconfig-1001-20261111    gcc-16.2.0
sparc64               randconfig-2000-20261110    gcc-14
sparc64               randconfig-2000-20261111    clang-18
sparc64               randconfig-2001-20261110    gcc-14
sparc64               randconfig-2001-20261111    clang-18
sparc64               randconfig-2200-20261110    clang-24   smatch
sparc64               randconfig-2200-20261111    gcc-9.5.0  smatch
sparc64              randconfig-r2110-20261111    gcc-9.5.0  cocci
sparc64              randconfig-r2303-20261110    gcc-10.5.0 sparse
sparc64              randconfig-r2310-20261110    gcc-15.3.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261111    gcc-16.2.0
um                    randconfig-1001-20261111    gcc-16.2.0
um                    randconfig-2000-20261110    gcc-14
um                    randconfig-2000-20261111    clang-18
um                    randconfig-2001-20261110    gcc-14
um                    randconfig-2001-20261111    clang-18
um                    randconfig-2200-20261110    gcc-14     smatch
um                    randconfig-2200-20261111    clang-24   smatch
um                            x86_64_defconfig    gcc-14
um                            x86_64_defconfig    gcc-16.2.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261111    gcc-14
x86_64      buildonly-randconfig-1001-20261111    gcc-14
x86_64      buildonly-randconfig-1002-20261111    gcc-14
x86_64      buildonly-randconfig-1003-20261111    gcc-14
x86_64      buildonly-randconfig-1004-20261111    gcc-14
x86_64      buildonly-randconfig-1005-20261111    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261111    clang-22
x86_64                randconfig-1001-20261111    clang-22
x86_64                randconfig-1002-20261111    clang-22
x86_64                randconfig-1003-20261111    clang-22
x86_64                randconfig-1004-20261111    clang-22
x86_64                randconfig-1005-20261111    clang-22
x86_64                randconfig-1006-20261111    clang-22
x86_64                randconfig-1007-20261111    clang-22
x86_64                randconfig-1008-20261111    clang-22
x86_64                randconfig-1009-20261111    clang-22
x86_64                randconfig-1010-20261111    clang-22
x86_64                randconfig-1011-20261111    clang-22
x86_64                randconfig-1012-20261111    gcc-14
x86_64                randconfig-1013-20261111    gcc-14
x86_64                randconfig-1014-20261111    gcc-14
x86_64                randconfig-1015-20261111    gcc-14
x86_64                randconfig-1016-20261111    gcc-14
x86_64                randconfig-1017-20261111    gcc-14
x86_64                randconfig-2000-20261111    clang-22
x86_64                randconfig-2001-20261111    clang-22
x86_64                randconfig-2002-20261111    clang-22
x86_64                randconfig-2003-20261111    clang-22
x86_64                randconfig-2004-20261111    clang-22
x86_64                randconfig-2005-20261111    clang-22
x86_64                randconfig-2100-20261111    clang-22   cocci
x86_64                randconfig-2101-20261111    clang-22   cocci
x86_64                randconfig-2102-20261111    clang-22   cocci
x86_64                randconfig-2103-20261111    clang-22   cocci
x86_64                randconfig-2104-20261111    clang-22   cocci
x86_64                randconfig-2105-20261111    clang-22   cocci
x86_64                randconfig-2200-20261111    gcc-14     smatch
x86_64                randconfig-2300-20261110    clang-22   sparse
x86_64                randconfig-2300-20261111    gcc-14     sparse
x86_64                randconfig-2301-20261110    clang-22   sparse
x86_64                randconfig-2301-20261111    gcc-14     sparse
x86_64                randconfig-2302-20261110    clang-22   sparse
x86_64                randconfig-2302-20261111    gcc-14     sparse
x86_64               randconfig-r2303-20261111    gcc-8.5.0  sparse
x86_64               randconfig-r2306-20261111    gcc-14     sparse
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
xtensa                randconfig-1000-20261111    gcc-16.2.0
xtensa                randconfig-1001-20261111    gcc-16.2.0
xtensa                randconfig-2000-20261110    gcc-11.5.0
xtensa                randconfig-2000-20261111    gcc-16.2.0
xtensa                randconfig-2001-20261110    gcc-11.5.0
xtensa                randconfig-2001-20261111    gcc-16.2.0
xtensa                randconfig-2200-20261111    gcc-8.5.0  smatch
xtensa               randconfig-r2111-20261111    gcc-15.3.0 cocci
xtensa               randconfig-r2303-20261111    gcc-11.5.0 sparse
xtensa               randconfig-r2307-20261111    clang-17   sparse
xtensa               randconfig-r2308-20261111    clang-17   sparse
xtensa               randconfig-r2309-20261111    gcc-14     sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
