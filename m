Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794097599;
	b=bt3rTZXNe1ONfl5JpvCvQITiQH5XzLkuzhf8KNSa1gczFF5kxkWTJ/Oq6Wr3+3h+yJTH
	 gnvi6nZZpPV0zffYdXObytLVxTEOe6cvZgj9EHV/7Q4fnkb8vqOdvqvfLqjzZq4YBxV0r
	 egld2s5MHR6CWvGVEAzG98sSRVKJOGfkaQ9fMkZkKpemLydWTlcHJkKsSfp4AR7T4BNjF
	 jJxtzw/ktm0hbGaTuu84ioGsXnRq4uGgVRL1UQuNjnF0OTQqYSp1fnBR+w+ufnnPULd0n
	 mJkaoSj4C6mWiimDv3mP3NKhOIe59mo2v/4DixFqHrUJk+zfKeQ29ZrN3xiEQHxNe1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794097599;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5RDCQlUugG8LJXuzQG1X3/exg6yXJrjsUNiLvhXtFng=;
	b=GZBlHBjuzIFWk6TWw8QU7A5TOVFnlI1NyidSz4uFxENZnpJ1kauryxdP4XVOO9IWkOmQ
	 su1sSwCT3AkDTHWSgmEUeqttLg3PPCNkjPMUd3ha+KusrJhJjWCd1dWuVFeeQ855d5n0S
	 395laC3uW+d1Xso8BjbVsD5Bq3btc7A/PSozOmWmtu4jW7Sol1Wbtdxvp0x7ctwxF229U
	 v7JTK+r9dOr1708h6qXW6KWt2M+xtpTHnakhVV4wYMw/zEa8UFugvw3cweKtHWRDOOOfQ
	 0ngw5TmwpjYm8t9h/OSfen8xSEeW+TqU5rZ82G0PNNGG6Ss0D+yckJ/B7mzIMQCDPbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eQDI9xhE;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5936F606A32F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 00:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5936F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eQDI9xhE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794097599; x=1825633599;
  h=date:from:to:cc:subject:message-id;
  bh=US2j2RFlGRHV64Md/OeelG1YenFBfrF5PpRHT7Q4tJQ=;
  b=eQDI9xhEiUFggchjDv6+6OcBOG/8sfitTrVyviDTWcQ/qmFg53DGh6Lh
   ZUt2NR6ZP04v781zfJSV8hg8n6avH6M0FjJ9UwLv8RN2DbxyLxA/+ghOA
   gKpsWVW+ttk7vmv629PokBwPuiEsKqqcPukUDmEtYqNbAnWVvRWgqFPg1
   fgxcLN/z8d3Aj/kEj5WAkISjFHGZkF+sD6gvAPZMtXL9CvXp13DAtwG0a
   OKWIGm+5dXXiw96NMK/H/Ff249mHVwaOJsSZkDrdfaevysgfjtqFF3kil
   XHcTjdc5jABPtduCcSzupf25d2rHo49xHw8L8kRUoiX9ht/Mq2mZwrnac
   g==;
X-CSE-ConnectionGUID: K1JVyLVnR6+FoFSeV53w2Q==
X-CSE-MsgGUID: SjUG1uTVTrm0GS9qMpvr6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2872755"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2872755"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 16:26:36 -0800
X-CSE-ConnectionGUID: oR7yilm6TKGWyERffUiTlQ==
X-CSE-MsgGUID: e/pIOoQzTjCS/hsJPs9jSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7700551"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Nov 2026 16:26:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPqjv-00000000rpR-2ufR;
	Sun, 08 Nov 2026 00:26:31 +0000
Date: Sun, 08 Nov 2026 08:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip:urgent] BUILD SUCCESS
 2715c9af094d7cf36a2bcc6a0aed70d710307224
Message-ID: <20261108082612.TYapsOGP-lkp@intel.com>
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
branch HEAD: 2715c9af094d7cf36a2bcc6a0aed70d710307224  Merge branch into tip/master: 'x86/urgent'

elapsed time: 868m

configs tested: 271
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                      haps_hs_smp_defconfig    clang-17
arc                   randconfig-1000-20261107    gcc-12.5.0
arc                   randconfig-1000-20261108    gcc-11.5.0
arc                   randconfig-1001-20261107    gcc-12.5.0
arc                   randconfig-1001-20261108    gcc-11.5.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                            omap1_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261107    gcc-12.5.0
arm                   randconfig-1000-20261108    gcc-11.5.0
arm                   randconfig-1001-20261107    gcc-12.5.0
arm                   randconfig-1001-20261108    gcc-11.5.0
arm                   randconfig-1002-20261107    gcc-12.5.0
arm                   randconfig-1002-20261108    gcc-11.5.0
arm                   randconfig-1003-20261107    gcc-12.5.0
arm                   randconfig-1003-20261108    gcc-11.5.0
arm                            u8500_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261107    gcc-11.5.0
arm64                 randconfig-1000-20261108    clang-24
arm64                 randconfig-1001-20261107    gcc-11.5.0
arm64                 randconfig-1001-20261108    clang-24
arm64                 randconfig-1002-20261107    gcc-11.5.0
arm64                 randconfig-1002-20261108    clang-24
arm64                 randconfig-1003-20261107    gcc-11.5.0
arm64                 randconfig-1003-20261108    clang-24
arm64                        renesas_defconfig    gcc-16.2.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261107    gcc-11.5.0
csky                  randconfig-1000-20261108    clang-24
csky                  randconfig-1001-20261107    gcc-11.5.0
csky                  randconfig-1001-20261108    clang-24
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261107    clang-18
hexagon               randconfig-1000-20261108    gcc-16.2.0
hexagon               randconfig-1001-20261107    clang-18
hexagon               randconfig-1001-20261108    gcc-16.2.0
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
i386                  randconfig-1000-20261108    gcc-14
i386                  randconfig-1001-20261107    clang-22
i386                  randconfig-1001-20261108    gcc-14
i386                  randconfig-1002-20261107    clang-22
i386                  randconfig-1002-20261108    gcc-14
i386                  randconfig-1003-20261107    clang-22
i386                  randconfig-1003-20261108    gcc-14
i386                  randconfig-1004-20261107    clang-22
i386                  randconfig-1004-20261108    gcc-14
i386                  randconfig-1005-20261107    clang-22
i386                  randconfig-1005-20261108    gcc-14
i386                  randconfig-1006-20261107    clang-22
i386                  randconfig-1006-20261108    gcc-14
i386                  randconfig-1007-20261107    clang-22
i386                  randconfig-1007-20261108    clang-22
i386                  randconfig-1008-20261107    clang-22
i386                  randconfig-1008-20261108    clang-22
i386                  randconfig-1009-20261107    clang-22
i386                  randconfig-1009-20261108    clang-22
i386                  randconfig-1010-20261107    clang-22
i386                  randconfig-1010-20261108    clang-22
i386                  randconfig-1011-20261107    clang-22
i386                  randconfig-1011-20261108    clang-22
i386                  randconfig-1012-20261107    clang-22
i386                  randconfig-1012-20261108    clang-22
i386                  randconfig-1013-20261107    clang-22
i386                  randconfig-1013-20261108    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261107    clang-18
loongarch             randconfig-1000-20261108    gcc-16.2.0
loongarch             randconfig-1001-20261107    clang-18
loongarch             randconfig-1001-20261108    gcc-16.2.0
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                             q40_defconfig    gcc-16.2.0
m68k                            sun3_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    clang-17
mips                      cu1000-neo_defconfig    clang-24
mips                           malta_defconfig    clang-17
mips                       malta_kvm_defconfig    clang-17
mips                   maltasmvp_eva_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261107    clang-18
nios2                 randconfig-1000-20261108    gcc-16.2.0
nios2                 randconfig-1001-20261107    clang-18
nios2                 randconfig-1001-20261108    gcc-16.2.0
openrisc                          alldefconfig    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261107    clang-24
parisc                randconfig-1000-20261108    clang-24
parisc                randconfig-1001-20261107    clang-24
parisc                randconfig-1001-20261108    clang-24
parisc64                             defconfig    clang-24
powerpc                      akebono_defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                        ebony_defconfig    gcc-16.2.0
powerpc                      ep8248e_defconfig    gcc-16.2.0
powerpc                    microwatt_defconfig    gcc-16.2.0
powerpc                      mpc5200_defconfig    clang-24
powerpc                      mpc83xx_defconfig    gcc-16.2.0
powerpc                     mvme5100_defconfig    gcc-16.2.0
powerpc                      rainier_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261107    clang-24
powerpc               randconfig-1000-20261108    clang-24
powerpc               randconfig-1001-20261107    clang-24
powerpc               randconfig-1001-20261108    clang-24
powerpc                     sam440ep_defconfig    gcc-16.2.0
powerpc                      sequoia_defconfig    gcc-16.2.0
powerpc                      tqm8548_defconfig    clang-24
powerpc                          wii_defconfig    clang-24
powerpc64             randconfig-1000-20261107    clang-24
powerpc64             randconfig-1000-20261108    clang-24
powerpc64             randconfig-1001-20261107    clang-24
powerpc64             randconfig-1001-20261108    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-17
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261107    gcc-11.5.0
riscv                 randconfig-1001-20261107    gcc-11.5.0
s390                              alldefconfig    clang-17
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261107    gcc-11.5.0
s390                  randconfig-1001-20261107    gcc-11.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                              espt_defconfig    clang-24
sh                                j2_defconfig    clang-24
sh                                j2_defconfig    gcc-16.2.0
sh                           r7780mp_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261107    gcc-11.5.0
sh                    randconfig-1001-20261107    gcc-11.5.0
sh                           rsk7264_defconfig    gcc-16.2.0
sh                           rsk7269_defconfig    clang-17
sh                           sdk7786_defconfig    clang-24
sh                            se7705_defconfig    gcc-16.2.0
sh                            se7722_defconfig    gcc-16.2.0
sh                              sh03_defconfig    clang-17
sh                              sh03_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261107    gcc-10.5.0
sparc                 randconfig-1000-20261108    gcc-8.5.0
sparc                 randconfig-1001-20261107    gcc-10.5.0
sparc                 randconfig-1001-20261108    gcc-8.5.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261107    gcc-10.5.0
sparc64               randconfig-1000-20261108    gcc-8.5.0
sparc64               randconfig-1001-20261107    gcc-10.5.0
sparc64               randconfig-1001-20261108    gcc-8.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261107    gcc-10.5.0
um                    randconfig-1000-20261108    gcc-8.5.0
um                    randconfig-1001-20261107    gcc-10.5.0
um                    randconfig-1001-20261108    gcc-8.5.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261107    gcc-14
x86_64      buildonly-randconfig-1000-20261108    gcc-14
x86_64      buildonly-randconfig-1001-20261107    gcc-14
x86_64      buildonly-randconfig-1001-20261108    gcc-14
x86_64      buildonly-randconfig-1002-20261107    gcc-14
x86_64      buildonly-randconfig-1002-20261108    gcc-14
x86_64      buildonly-randconfig-1003-20261107    gcc-14
x86_64      buildonly-randconfig-1003-20261108    gcc-14
x86_64      buildonly-randconfig-1004-20261107    gcc-14
x86_64      buildonly-randconfig-1004-20261108    gcc-14
x86_64      buildonly-randconfig-1005-20261107    gcc-14
x86_64      buildonly-randconfig-1005-20261108    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261108    gcc-14
x86_64                randconfig-1001-20261108    gcc-14
x86_64                randconfig-1002-20261108    gcc-14
x86_64                randconfig-1003-20261108    gcc-14
x86_64                randconfig-1004-20261108    gcc-14
x86_64                randconfig-1005-20261108    gcc-14
x86_64                randconfig-1006-20261107    gcc-13
x86_64                randconfig-1006-20261108    clang-22
x86_64                randconfig-1007-20261107    gcc-13
x86_64                randconfig-1007-20261108    clang-22
x86_64                randconfig-1008-20261107    gcc-13
x86_64                randconfig-1008-20261108    clang-22
x86_64                randconfig-1009-20261107    gcc-13
x86_64                randconfig-1009-20261108    clang-22
x86_64                randconfig-1010-20261107    gcc-13
x86_64                randconfig-1010-20261108    clang-22
x86_64                randconfig-1011-20261107    gcc-13
x86_64                randconfig-1011-20261108    clang-22
x86_64                randconfig-1012-20261107    clang-22
x86_64                randconfig-1012-20261108    clang-22
x86_64                randconfig-1013-20261107    clang-22
x86_64                randconfig-1013-20261108    clang-22
x86_64                randconfig-1014-20261107    clang-22
x86_64                randconfig-1014-20261108    clang-22
x86_64                randconfig-1015-20261107    clang-22
x86_64                randconfig-1015-20261108    clang-22
x86_64                randconfig-1016-20261107    clang-22
x86_64                randconfig-1016-20261108    clang-22
x86_64                randconfig-1017-20261107    clang-22
x86_64                randconfig-1017-20261108    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                            alldefconfig    gcc-16.2.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                        common_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261107    gcc-10.5.0
xtensa                randconfig-1000-20261108    gcc-8.5.0
xtensa                randconfig-1001-20261107    gcc-10.5.0
xtensa                randconfig-1001-20261108    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
