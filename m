Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793161877;
	b=Nb0C9b4Pebr7drRiORLNVS6wHkOBkeNb1rP94ct9TbfIXzLHF+3iHVKDQ+6kQh7IV4YR
	 efIdJ/zgK9kUtq/guc7HWGgqT61eR79/n93Jdn+1WDIRfQASHUSu7FiCF15dtLNlkpXXc
	 UJ4WMbKC3ILZwPy3vfNmI3d5rWwDyO1e68+HxDDSbMnxewrWKzw54YdzOONd4X78/4QjX
	 MP+ReLS1WLelR860c54Is3B5DnTpCH+AIkuT2lQHdeRINPzmQirxBwqpnFnJBfVZMcHlt
	 5m9+60jqo4MvR7vpXea9lo8idm/ZHj6tnvcs2rHRLJNDC6+EoGiHvPl72tQdeA33AQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793161877;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BFOoyFoEboOGzECBnAr8DxX/S1cSgv1CJp1dyRF0n/k=;
	b=Q4Q0zRQuInAwGrkxjXOBFFwewMu7JgoCTrp4Q2O/ATMGqq1kk1iPaL8I3rlKEZec8pie
	 0KZPswtf91VD8r6F81xNwYYJady2IlJzB6xKEkCLS9mBsLjWJws2LzKN2x4bKrIorl8Kv
	 bOIPz3GNrZMWerDh58rmnhvTVnsGEPmz62CIn+xJAjiAOQTkJ6pJjWXt8ZMcWG4ZbXY+j
	 4/CXCqsoI7AGJ7pMwLa0it+chilPvCaHXfWqaxU4eCq0Rp99TvMLD5kuP8/HrlnmV45G+
	 68CuAxLv9C+t1Fs2P5+t8XbfcsxOEGLH/ous+UGhbv4zFT2sKFcp6jm3ej/A1RBLUnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kycpbMa9;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCB7606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFCB7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kycpbMa9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793161877; x=1824697877;
  h=date:from:to:cc:subject:message-id;
  bh=83BrHaFhDP9LEa7FRe4iJ6hROXRSKkpX9lPC2GurnWQ=;
  b=kycpbMa9Lf4yUjIg57XHTHDpKXQsaGmxoZ1Imxro+jj7qlTK5zWIaPsG
   Gb+f3tMSli4nlnBWnddgxJTsJgTzpgUk2+G0hImKf/FhzRnS6ovfAiZvU
   AoTvcO4Nk1vLXAhjETiNPCsjOynZ5WXM5iycz8bPmnIeuipXJGFdVCY4S
   tiUtLOziCIpst4eWX6fLIXriL0EOro/akEIjpduwD6lUSK4XRE8FNRghw
   brBBjJ2jKA+HCMvZsNphBIWIkJFrw5LAIaMWqQXdxYIAeE/fkUtWn+iRw
   O7qtq2LtjbmBu7y5KhZbzr4yPpQDOlchnd//w1RpuRZOhPpDwNNJT0a7o
   w==;
X-CSE-ConnectionGUID: 7XpWoLgkR2G9l9Li6Gspvg==
X-CSE-MsgGUID: NTFic+y7R5WiKelNzq96ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1762218"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1762218"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 21:31:14 -0700
X-CSE-ConnectionGUID: QrxMFYTzRoKbQf71/mVObg==
X-CSE-MsgGUID: 0tP9WMffQ8Kdff3p7uZnwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4675329"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Oct 2026 21:31:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLvJe-00000000YCY-28hQ;
	Wed, 28 Oct 2026 04:31:10 +0000
Date: Wed, 28 Oct 2026 12:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf:urgent] BUILD SUCCESS
 2b774b5bbffabae7ac6be98a98e9641fb3c0bbb4
Message-ID: <202610281254.Y4y5CIVI-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/urgent
branch HEAD: 2b774b5bbffabae7ac6be98a98e9641fb3c0bbb4  alpha: add simd_enabled argument to perf_reg_validate()

elapsed time: 8168m

configs tested: 336
configs skipped: 253

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                               allmodconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                           axs103_defconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261023    gcc-14.4.0
arc                   randconfig-1000-20261024    clang-24
arc                   randconfig-1001-20261023    gcc-14.4.0
arc                   randconfig-1001-20261024    clang-24
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       integrator_defconfig    gcc-16.2.0
arm                    milbeaut_m10v_defconfig    gcc-16.2.0
arm                         mvebu_v7_defconfig    gcc-16.2.0
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20261023    gcc-14.4.0
arm                   randconfig-1000-20261024    clang-24
arm                   randconfig-1001-20261023    gcc-14.4.0
arm                   randconfig-1001-20261024    clang-24
arm                   randconfig-1002-20261023    gcc-14.4.0
arm                   randconfig-1002-20261024    clang-24
arm                   randconfig-1003-20261023    gcc-14.4.0
arm                   randconfig-1003-20261024    clang-24
arm                          s5pv210_defconfig    gcc-16.2.0
arm                          socfpga_defconfig    gcc-16.2.0
arm                           sp7021_defconfig    clang-24
arm                        spear13xx_defconfig    gcc-16.2.0
arm                         spear6xx_defconfig    gcc-16.2.0
arm                            stm32_defconfig    gcc-16.2.0
arm                         vexpress_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261023    gcc-8.5.0
arm64                 randconfig-1000-20261024    gcc-10.5.0
arm64                 randconfig-1001-20261023    gcc-8.5.0
arm64                 randconfig-1001-20261024    gcc-10.5.0
arm64                 randconfig-1002-20261023    gcc-8.5.0
arm64                 randconfig-1002-20261024    gcc-10.5.0
arm64                 randconfig-1003-20261023    gcc-8.5.0
arm64                 randconfig-1003-20261024    gcc-10.5.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261023    gcc-8.5.0
csky                  randconfig-1000-20261024    gcc-10.5.0
csky                  randconfig-1001-20261023    gcc-8.5.0
csky                  randconfig-1001-20261024    gcc-10.5.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261023    clang-17
hexagon               randconfig-1000-20261024    clang-24
hexagon               randconfig-1001-20261023    clang-17
hexagon               randconfig-1001-20261024    clang-24
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261023    clang-22
i386        buildonly-randconfig-1000-20261024    clang-22
i386        buildonly-randconfig-1001-20261023    clang-22
i386        buildonly-randconfig-1001-20261024    clang-22
i386        buildonly-randconfig-1002-20261023    clang-22
i386        buildonly-randconfig-1002-20261024    clang-22
i386        buildonly-randconfig-1003-20261023    clang-22
i386        buildonly-randconfig-1003-20261024    clang-22
i386        buildonly-randconfig-1004-20261023    clang-22
i386        buildonly-randconfig-1004-20261024    clang-22
i386        buildonly-randconfig-1005-20261023    clang-22
i386        buildonly-randconfig-1005-20261024    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261023    gcc-14
i386                  randconfig-1000-20261024    clang-22
i386                  randconfig-1001-20261023    gcc-14
i386                  randconfig-1001-20261024    clang-22
i386                  randconfig-1002-20261023    gcc-14
i386                  randconfig-1002-20261024    clang-22
i386                  randconfig-1003-20261023    gcc-14
i386                  randconfig-1003-20261024    clang-22
i386                  randconfig-1004-20261023    gcc-14
i386                  randconfig-1004-20261024    clang-22
i386                  randconfig-1005-20261023    gcc-14
i386                  randconfig-1005-20261024    clang-22
i386                  randconfig-1006-20261023    gcc-14
i386                  randconfig-1006-20261024    clang-22
i386                  randconfig-1007-20261023    clang-22
i386                  randconfig-1007-20261024    gcc-14
i386                  randconfig-1008-20261023    clang-22
i386                  randconfig-1008-20261024    gcc-14
i386                  randconfig-1009-20261023    clang-22
i386                  randconfig-1009-20261024    gcc-14
i386                  randconfig-1010-20261023    clang-22
i386                  randconfig-1010-20261024    gcc-14
i386                  randconfig-1011-20261023    clang-22
i386                  randconfig-1011-20261024    gcc-14
i386                  randconfig-1012-20261023    clang-22
i386                  randconfig-1012-20261024    gcc-14
i386                  randconfig-1013-20261023    clang-22
i386                  randconfig-1013-20261024    gcc-14
loongarch                         alldefconfig    gcc-16.2.0
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson32_defconfig    gcc-11.5.0
loongarch             randconfig-1000-20261023    clang-17
loongarch             randconfig-1000-20261024    clang-24
loongarch             randconfig-1001-20261023    clang-17
loongarch             randconfig-1001-20261024    clang-24
m68k                              alldefconfig    gcc-16.2.0
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                        bvme6000_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    gcc-16.2.0
m68k                        m5275evb_defconfig    gcc-16.2.0
m68k                             mac_defconfig    gcc-16.2.0
m68k                             q40_defconfig    gcc-16.2.0
m68k                            sun3_defconfig    clang-17
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    clang-24
mips                   cavium_octeon_defconfig    gcc-16.2.0
mips                            ci20_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                           malta_defconfig    gcc-11.5.0
mips                 malta_qemu_32r6_defconfig    gcc-16.2.0
mips                       maltaaprp_defconfig    clang-17
mips                     maltaup_xpa_defconfig    gcc-11.5.0
mips                         omega2p_defconfig    gcc-16.2.0
mips                        rbtx49xx_defconfig    clang-24
mips                           rm200_defconfig    gcc-16.2.0
mips                    sb1250_swarm_defconfig    gcc-16.2.0
mips                            xway_defconfig    clang-17
nios2                             alldefconfig    gcc-11.5.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261023    clang-17
nios2                 randconfig-1000-20261024    clang-24
nios2                 randconfig-1001-20261023    clang-17
nios2                 randconfig-1001-20261024    clang-24
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                            allyesconfig    gcc-16.2.0
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261023    gcc-15.3.0
parisc                randconfig-1000-20261024    clang-24
parisc                randconfig-1001-20261023    gcc-15.3.0
parisc                randconfig-1001-20261024    clang-24
parisc64                          alldefconfig    clang-17
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.2.0
powerpc                      akebono_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.2.0
powerpc                      asp8347_defconfig    gcc-16.2.0
powerpc                       chrp32_defconfig    gcc-16.2.0
powerpc                        ebony_defconfig    gcc-11.5.0
powerpc                           g5_defconfig    clang-24
powerpc                         icon_defconfig    clang-24
powerpc                    lite5200b_defconfig    clang-24
powerpc                      mpc512x_defconfig    gcc-11.5.0
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc                          ps3_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261023    gcc-15.3.0
powerpc               randconfig-1000-20261024    clang-24
powerpc               randconfig-1001-20261023    gcc-15.3.0
powerpc               randconfig-1001-20261024    clang-24
powerpc                     sam440ep_defconfig    clang-17
powerpc                      skiroot_defconfig    gcc-11.5.0
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64                         alldefconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261023    gcc-15.3.0
powerpc64             randconfig-1000-20261024    clang-24
powerpc64             randconfig-1001-20261023    gcc-15.3.0
powerpc64             randconfig-1001-20261024    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261023    gcc-16.2.0
riscv                 randconfig-1000-20261024    gcc-11.5.0
riscv                 randconfig-1001-20261023    gcc-16.2.0
riscv                 randconfig-1001-20261024    gcc-11.5.0
riscv                         rzfive_defconfig    gcc-16.2.0
s390                              alldefconfig    gcc-16.2.0
s390                              allmodconfig    clang-17
s390                              allmodconfig    gcc-16.2.0
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261023    gcc-16.2.0
s390                  randconfig-1000-20261024    gcc-11.5.0
s390                  randconfig-1001-20261023    gcc-16.2.0
s390                  randconfig-1001-20261024    gcc-11.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                allyesconfig    gcc-16.2.0
sh                          apsh4a3a_defconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7705_defconfig    gcc-16.2.0
sh                                j2_defconfig    gcc-16.2.0
sh                             migor_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261023    gcc-16.2.0
sh                    randconfig-1000-20261024    gcc-11.5.0
sh                    randconfig-1001-20261023    gcc-16.2.0
sh                    randconfig-1001-20261024    gcc-11.5.0
sh                           rsk7201_defconfig    gcc-16.2.0
sh                           rsk7269_defconfig    gcc-16.2.0
sh                           sdk7786_defconfig    gcc-16.2.0
sh                            se7343_defconfig    gcc-16.2.0
sh                            se7712_defconfig    gcc-16.2.0
sh                            se7722_defconfig    gcc-16.2.0
sh                            se7724_defconfig    gcc-11.5.0
sh                            se7724_defconfig    gcc-16.2.0
sh                            sh2007_defconfig    gcc-16.2.0
sh                    sh7724_generic_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    clang-24
sh                         sh7785lcr_defconfig    gcc-16.2.0
sh                             shmin_defconfig    gcc-16.2.0
sh                              shx3_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261023    clang-24
sparc                 randconfig-1000-20261024    gcc-14
sparc                 randconfig-1001-20261023    clang-24
sparc                 randconfig-1001-20261024    gcc-14
sparc                        sparc32_defconfig    gcc-16.2.0
sparc                        sparc64_defconfig    gcc-16.2.0
sparc64                           alldefconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261023    clang-24
sparc64               randconfig-1000-20261024    gcc-14
sparc64               randconfig-1001-20261023    clang-24
sparc64               randconfig-1001-20261024    gcc-14
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261023    clang-24
um                    randconfig-1000-20261024    gcc-14
um                    randconfig-1001-20261023    clang-24
um                    randconfig-1001-20261024    gcc-14
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261023    clang-22
x86_64      buildonly-randconfig-1000-20261024    gcc-14
x86_64      buildonly-randconfig-1001-20261023    clang-22
x86_64      buildonly-randconfig-1001-20261024    gcc-14
x86_64      buildonly-randconfig-1002-20261023    clang-22
x86_64      buildonly-randconfig-1002-20261024    gcc-14
x86_64      buildonly-randconfig-1003-20261023    clang-22
x86_64      buildonly-randconfig-1003-20261024    gcc-14
x86_64      buildonly-randconfig-1004-20261023    clang-22
x86_64      buildonly-randconfig-1004-20261024    gcc-14
x86_64      buildonly-randconfig-1005-20261023    clang-22
x86_64      buildonly-randconfig-1005-20261024    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261023    gcc-14
x86_64                randconfig-1000-20261024    gcc-14
x86_64                randconfig-1001-20261023    gcc-14
x86_64                randconfig-1001-20261024    gcc-14
x86_64                randconfig-1002-20261023    gcc-14
x86_64                randconfig-1002-20261024    gcc-14
x86_64                randconfig-1003-20261023    gcc-14
x86_64                randconfig-1003-20261024    gcc-14
x86_64                randconfig-1004-20261023    gcc-14
x86_64                randconfig-1004-20261024    gcc-14
x86_64                randconfig-1005-20261023    gcc-14
x86_64                randconfig-1005-20261024    gcc-14
x86_64                randconfig-1006-20261023    gcc-14
x86_64                randconfig-1006-20261024    gcc-13
x86_64                randconfig-1007-20261023    gcc-14
x86_64                randconfig-1007-20261024    gcc-13
x86_64                randconfig-1008-20261023    gcc-14
x86_64                randconfig-1008-20261024    gcc-13
x86_64                randconfig-1009-20261023    gcc-14
x86_64                randconfig-1009-20261024    gcc-13
x86_64                randconfig-1010-20261023    gcc-14
x86_64                randconfig-1010-20261024    gcc-13
x86_64                randconfig-1011-20261023    gcc-14
x86_64                randconfig-1011-20261024    gcc-13
x86_64                randconfig-1012-20261023    clang-22
x86_64                randconfig-1012-20261024    clang-22
x86_64                randconfig-1013-20261023    clang-22
x86_64                randconfig-1013-20261024    clang-22
x86_64                randconfig-1014-20261023    clang-22
x86_64                randconfig-1014-20261024    clang-22
x86_64                randconfig-1015-20261023    clang-22
x86_64                randconfig-1015-20261024    clang-22
x86_64                randconfig-1016-20261023    clang-22
x86_64                randconfig-1016-20261024    clang-22
x86_64                randconfig-1017-20261023    clang-22
x86_64                randconfig-1017-20261024    clang-22
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
xtensa                   cadence_csp_defconfig    clang-17
xtensa                 generic_kc705_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261023    clang-24
xtensa                randconfig-1000-20261024    gcc-14
xtensa                randconfig-1001-20261023    clang-24
xtensa                randconfig-1001-20261024    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
