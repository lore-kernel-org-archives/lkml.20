Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533739;
	b=ANm04EK2vGG39tXf6VV2ftTCd6TltOkYwSOPhDxWA0ggWAt45zMHZGWf3B55uQ7DD31q
	 Q/XKYG07C9FEQ7r0kGnb2wa5t5VccTkZ5gyiHfqwooO8s3VkaCUK2sRFvp8pRCtS05nee
	 N8Ap2Hf6SBxGj1IxnL46Wc6D91kamT3bXJi4oqW4+YOyXex9JK+h7m1v1Okxa+cIB6TKt
	 gGMoicjEQP3D7eJSDAiFXUJ5lrfV4StVB6HFG6b7RiRPK/oE2mPcOgfaYds3vsVhq9dws
	 YJarIAAbb4I3bSxlmX568xWircJeHRs9BjsefOfsvzqwrOGo/TLZL237soVL5hFu5+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533739;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LNY/OMg+hJKdO0cXZAVtR+XT55IIIsGPReDDtrqADg4=;
	b=ZU2nSC5RsXj4W6ByFSuaTK8Kn4W8BnW4/Kk0/WIQPlscxE0dAk6N34xp/m35tNQ+Hz0x
	 DdgJ7CBHpsCKdMbPE6aPQAPRqXu+le/mj3xpLD8qrh0re7JHo849XSnaOqSNIZjJ1BfO1
	 2kmjo88+TRVvykEoL7eK7rXXAIMyv48ln6pO/fWVgQKwbcOchkOJnIqrtqZkWuWMrFHpr
	 toqeiACVXxCks/4o18KQ7KxBIakZaSYjfdMC8OZOR/ePhOIG/VH/ChrhryiJ+gHslB5x7
	 hqS1lcQIKx2uZn5DS2GV2jPcIj9DCvlr3SJo0mKef93jfRBfY5ReBAYQHoIzwF+xqUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Is6QIKYv;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3638606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3638606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Is6QIKYv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794533739; x=1826069739;
  h=date:from:to:cc:subject:message-id;
  bh=B3QUj9bXbYQiIWq21TgzwatL0fvI27RzSMSVKpvjuuc=;
  b=Is6QIKYvzb0A/4gpB1x5xPwcE/aoJLtq2ZldAs5s2+i4NO+JxfoNKmdg
   Tu96/zEVfdhrI/FGbQYt4qPKcu3WzcpvGAuCs26E1TKp7UzIUehtuJRvQ
   dW5yaIl/+QhEUuE90wwx5gVO75dvPJ+bj2Ckq8/b/WuGO8bGxKxb1jVzq
   /bZkezMRg46yleCacN1rfXUkpEADsVPZPUP2Ok03x+KlNbnlAn9BJthq9
   YNXru6wVPYitIErfA7jbGj7nix7zW2Kfegc6dVRITySQvdYCxLdURqQj8
   EhbQoIay73l+y+Y+4o2g7Fsk2yH1CLm7HtskESx5bEyu1ZqdYu7ivUPzU
   A==;
X-CSE-ConnectionGUID: 1H16JtbVQ7qQ2JRmZRN/0A==
X-CSE-MsgGUID: UcBVGxziRE6yOw/OSdbXaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3202295"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3202295"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 17:35:38 -0800
X-CSE-ConnectionGUID: Odysw1xhRwmsI+zWb7JdLw==
X-CSE-MsgGUID: Rjl09OU5QcSCuwnyPgn7dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9127145"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2026 17:35:37 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRgCU-000000012IL-1bYx;
	Fri, 13 Nov 2026 01:35:34 +0000
Date: Fri, 13 Nov 2026 09:34:54 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:mm] BUILD SUCCESS
 65477e925b016cd35a9ef0dd4f40a262fd1c64cd
Message-ID: <20261113093454.wuf6yzoO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
branch HEAD: 65477e925b016cd35a9ef0dd4f40a262fd1c64cd  MAINTAINERS: Add myself as X86 MM reviewer

elapsed time: 991m

configs tested: 270
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             alldefconfig    gcc-16.2.0
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261112    clang-24
arc                   randconfig-1000-20261113    gcc-10.5.0
arc                   randconfig-1001-20261112    clang-24
arc                   randconfig-1001-20261113    gcc-10.5.0
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                             dove_defconfig    gcc-16.2.0
arm                           gemini_defconfig    gcc-16.2.0
arm                            imxrt_defconfig    gcc-16.2.0
arm                       integrator_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261112    clang-24
arm                   randconfig-1000-20261113    gcc-10.5.0
arm                   randconfig-1001-20261112    clang-24
arm                   randconfig-1001-20261113    gcc-10.5.0
arm                   randconfig-1002-20261112    clang-24
arm                   randconfig-1002-20261113    gcc-10.5.0
arm                   randconfig-1003-20261112    clang-24
arm                   randconfig-1003-20261113    gcc-10.5.0
arm                          s3c6400_defconfig    gcc-16.2.0
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261112    gcc-14.4.0
arm64                 randconfig-1001-20261112    gcc-14.4.0
arm64                 randconfig-1002-20261112    gcc-14.4.0
arm64                 randconfig-1003-20261112    gcc-14.4.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261112    gcc-14.4.0
csky                  randconfig-1001-20261112    gcc-14.4.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261112    clang-24
hexagon               randconfig-1000-20261113    clang-24
hexagon               randconfig-1001-20261112    clang-24
hexagon               randconfig-1001-20261113    clang-24
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261112    clang-22
i386        buildonly-randconfig-1000-20261113    clang-22
i386        buildonly-randconfig-1001-20261112    clang-22
i386        buildonly-randconfig-1001-20261113    clang-22
i386        buildonly-randconfig-1002-20261112    clang-22
i386        buildonly-randconfig-1002-20261113    clang-22
i386        buildonly-randconfig-1003-20261112    clang-22
i386        buildonly-randconfig-1003-20261113    clang-22
i386        buildonly-randconfig-1004-20261112    clang-22
i386        buildonly-randconfig-1004-20261113    clang-22
i386        buildonly-randconfig-1005-20261112    clang-22
i386        buildonly-randconfig-1005-20261113    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261112    gcc-14
i386                  randconfig-1000-20261113    clang-22
i386                  randconfig-1001-20261112    gcc-14
i386                  randconfig-1001-20261113    clang-22
i386                  randconfig-1002-20261112    gcc-14
i386                  randconfig-1002-20261113    clang-22
i386                  randconfig-1003-20261112    gcc-14
i386                  randconfig-1003-20261113    clang-22
i386                  randconfig-1004-20261112    gcc-14
i386                  randconfig-1004-20261113    clang-22
i386                  randconfig-1005-20261112    gcc-14
i386                  randconfig-1005-20261113    clang-22
i386                  randconfig-1006-20261112    gcc-14
i386                  randconfig-1006-20261113    clang-22
i386                  randconfig-1007-20261112    clang-22
i386                  randconfig-1007-20261113    clang-22
i386                  randconfig-1008-20261112    clang-22
i386                  randconfig-1008-20261113    clang-22
i386                  randconfig-1009-20261112    clang-22
i386                  randconfig-1009-20261113    clang-22
i386                  randconfig-1010-20261112    clang-22
i386                  randconfig-1010-20261113    clang-22
i386                  randconfig-1011-20261112    clang-22
i386                  randconfig-1011-20261113    clang-22
i386                  randconfig-1012-20261112    clang-22
i386                  randconfig-1012-20261113    clang-22
i386                  randconfig-1013-20261112    clang-22
i386                  randconfig-1013-20261113    clang-22
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261112    clang-24
loongarch             randconfig-1000-20261113    clang-24
loongarch             randconfig-1001-20261112    clang-24
loongarch             randconfig-1001-20261113    clang-24
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.2.0
m68k                        m5282evb_defconfig    gcc-16.2.0
m68k                             mac_defconfig    gcc-16.2.0
m68k                         mvme147_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                            ip28_defconfig    gcc-16.2.0
mips                         maltaup_defconfig    gcc-16.2.0
mips                       pic32mzda_defconfig    gcc-16.2.0
mips                        rbtx49xx_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261112    clang-24
nios2                 randconfig-1000-20261113    clang-24
nios2                 randconfig-1001-20261112    clang-24
nios2                 randconfig-1001-20261113    clang-24
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261112    gcc-12.5.0
parisc                randconfig-1000-20261113    gcc-13.5.0
parisc                randconfig-1001-20261112    gcc-12.5.0
parisc                randconfig-1001-20261113    gcc-13.5.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                         icon_defconfig    gcc-16.2.0
powerpc                  mpc832x_rdb_defconfig    gcc-16.2.0
powerpc                       ppc64e_defconfig    gcc-16.2.0
powerpc                       ppc6xx_defconfig    gcc-16.2.0
powerpc                      rainier_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261112    gcc-12.5.0
powerpc               randconfig-1000-20261113    gcc-13.5.0
powerpc               randconfig-1001-20261112    gcc-12.5.0
powerpc               randconfig-1001-20261113    gcc-13.5.0
powerpc                  xes_mpc85xx_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261112    gcc-12.5.0
powerpc64             randconfig-1000-20261113    gcc-13.5.0
powerpc64             randconfig-1001-20261112    gcc-12.5.0
powerpc64             randconfig-1001-20261113    gcc-13.5.0
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261112    gcc-9.5.0
riscv                 randconfig-1000-20261113    gcc-12.5.0
riscv                 randconfig-1001-20261112    gcc-9.5.0
riscv                 randconfig-1001-20261113    gcc-12.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261112    gcc-9.5.0
s390                  randconfig-1000-20261113    gcc-12.5.0
s390                  randconfig-1001-20261112    gcc-9.5.0
s390                  randconfig-1001-20261113    gcc-12.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           kfr2r09_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261112    gcc-9.5.0
sh                    randconfig-1000-20261113    gcc-12.5.0
sh                    randconfig-1001-20261112    gcc-9.5.0
sh                    randconfig-1001-20261113    gcc-12.5.0
sh                           rsk7269_defconfig    gcc-16.2.0
sh                      sh7710voipgw_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261112    gcc-8.5.0
sparc                 randconfig-1000-20261113    gcc-8.5.0
sparc                 randconfig-1001-20261112    gcc-8.5.0
sparc                 randconfig-1001-20261113    gcc-8.5.0
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261112    gcc-8.5.0
sparc64               randconfig-1000-20261113    gcc-8.5.0
sparc64               randconfig-1001-20261112    gcc-8.5.0
sparc64               randconfig-1001-20261113    gcc-8.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261112    gcc-8.5.0
um                    randconfig-1000-20261113    gcc-8.5.0
um                    randconfig-1001-20261112    gcc-8.5.0
um                    randconfig-1001-20261113    gcc-8.5.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261112    gcc-14
x86_64      buildonly-randconfig-1000-20261113    clang-22
x86_64      buildonly-randconfig-1001-20261112    gcc-14
x86_64      buildonly-randconfig-1001-20261113    clang-22
x86_64      buildonly-randconfig-1002-20261112    gcc-14
x86_64      buildonly-randconfig-1002-20261113    clang-22
x86_64      buildonly-randconfig-1003-20261112    gcc-14
x86_64      buildonly-randconfig-1003-20261113    clang-22
x86_64      buildonly-randconfig-1004-20261112    gcc-14
x86_64      buildonly-randconfig-1004-20261113    clang-22
x86_64      buildonly-randconfig-1005-20261112    gcc-14
x86_64      buildonly-randconfig-1005-20261113    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261112    clang-22
x86_64                randconfig-1000-20261113    clang-22
x86_64                randconfig-1001-20261112    clang-22
x86_64                randconfig-1001-20261113    clang-22
x86_64                randconfig-1002-20261112    clang-22
x86_64                randconfig-1002-20261113    clang-22
x86_64                randconfig-1003-20261112    clang-22
x86_64                randconfig-1003-20261113    clang-22
x86_64                randconfig-1004-20261112    clang-22
x86_64                randconfig-1004-20261113    clang-22
x86_64                randconfig-1005-20261112    clang-22
x86_64                randconfig-1005-20261113    clang-22
x86_64                randconfig-1006-20261112    gcc-14
x86_64                randconfig-1006-20261113    clang-22
x86_64                randconfig-1007-20261112    gcc-14
x86_64                randconfig-1007-20261113    clang-22
x86_64                randconfig-1008-20261112    gcc-14
x86_64                randconfig-1008-20261113    clang-22
x86_64                randconfig-1009-20261112    gcc-14
x86_64                randconfig-1009-20261113    clang-22
x86_64                randconfig-1010-20261112    gcc-14
x86_64                randconfig-1010-20261113    clang-22
x86_64                randconfig-1011-20261112    gcc-14
x86_64                randconfig-1011-20261113    clang-22
x86_64                randconfig-1012-20261112    clang-22
x86_64                randconfig-1012-20261113    gcc-14
x86_64                randconfig-1013-20261112    clang-22
x86_64                randconfig-1013-20261113    gcc-14
x86_64                randconfig-1014-20261112    clang-22
x86_64                randconfig-1014-20261113    gcc-14
x86_64                randconfig-1015-20261112    clang-22
x86_64                randconfig-1015-20261113    gcc-14
x86_64                randconfig-1016-20261112    clang-22
x86_64                randconfig-1016-20261113    gcc-14
x86_64                randconfig-1017-20261112    clang-22
x86_64                randconfig-1017-20261113    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261112    gcc-8.5.0
xtensa                randconfig-1000-20261113    gcc-8.5.0
xtensa                randconfig-1001-20261112    gcc-8.5.0
xtensa                randconfig-1001-20261113    gcc-8.5.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
