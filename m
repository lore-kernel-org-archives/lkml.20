Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793554034;
	b=N2j8xnJhTYJqJtycQsD50ve+zChELfH9g/lucYqUE3oBrAsYxdSG1zKUWj7f6MTc/3mM
	 9MmCnIGl/LFDx0uPeCdS/xnJ1jdXcdwHrUf+tQmQ8Yu0jL96hlUK0lteTgLKz73ZXfc63
	 nis4JpVZ9jVP68zaUkFiPv7gnfBR8/h0PUYQVvyUotK0I3JmGbGvnaEaJk1GETgeVZ0B7
	 PrX8o9HhTe3Mxf6TrJRxhA7/1GrfezHcJEE5LWeOQW8sLUdZyKNWUJHeDZr5FeXNULZvf
	 BPgyiLJHM2Te+cRSEbNRcy1lzXYhaUCXRqbBXfpknyPunrWO6/qBfQhoyxua9h5YWWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793554034;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=x4C0OzECQXl7tXq4QSM3h6h5n/I38eCo/aKRqepBh9U=;
	b=1I/qUqps/513VHbsGmVzcoDwhZSse/tZOQCGkVV0XfZqUkguSTN5Ca6/ToNNV68t97RO
	 hNCtiDNfpojWvDwAJfUaDIfRg4rOe/rfxRpKxpJ5YwmbagGuLOiRTfY/mRMCaMJdDPSmg
	 CGYneNL6ze5UCXQqx8t9gC1b3wiVHtBfmGUUn2JrYmIyImzMF5IQfHzmXpAf6QRNMpmvG
	 e7BVeuj5J07LntqCMby6EpEQPAs5YcH299rejhccgLx4zgboKeb0/xWT1mIcPfUN+3nvi
	 nexh01klryE5K3Q9il9wz6dSN/syMnoEAvebg9XqYAZOGlfkhX+S7iieUbW/kpLr9GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="daFj/WJc";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C795606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C795606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=daFj/WJc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793554033; x=1825090033;
  h=date:from:to:cc:subject:message-id;
  bh=6pOkZBMzVoNplWlwI11PcHbk0L25NAAgsNYPV2P2Zf4=;
  b=daFj/WJcT7imvn+LiB+KczYVRjLhoCCPOZQBu5EvhjEAZ4DbOBpO8lLf
   KB9u5Bx7uFUY+rQij39Yt7IJrRFdCaekQdpQ+rWo9kbf9VGv+A01QrWkS
   YTfOq29DwYeP8hWQ8GIh8rgtK3hUyItjGUKSAyqalNaWw7pSTwAXNp/Ev
   X/22fizE7aOs7cdtFPSc5akg/FXQIGYjEaGjkAf6UlSfJ+rACWcZvmaet
   l0+v7vFaoW3Msgk/FmmExlxMlQPVoWyPgVg9UZUY+jt0ownW6d/vfgpFU
   6zecNuDmAWfSB6iWkbor5nckjlfguOnz161nlhv+OWDZkfgSTkWsDxa3b
   w==;
X-CSE-ConnectionGUID: eL6KnDgTQ9aEpIqfIcw3lQ==
X-CSE-MsgGUID: WY7IDRzESyqmu0bDXsqUhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2241137"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2241137"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 09:27:12 -0800
X-CSE-ConnectionGUID: p45xbcDMS/mTyh4dSc/XmQ==
X-CSE-MsgGUID: 467RCFwpS2mbjd+WQDRo8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="7682997"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 01 Nov 2026 09:27:10 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNZKm-00000000eXP-04Ay;
	Sun, 01 Nov 2026 17:27:08 +0000
Date: Mon, 02 Nov 2026 01:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq:urgent] BUILD SUCCESS
 1c16bc2b1122f78f9d51c5785f7a78b36d44972b
Message-ID: <20261102012703.IgFVrzFY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
branch HEAD: 1c16bc2b1122f78f9d51c5785f7a78b36d44972b  irqchip/irq-msi-lib: Free wired MSI descriptors

elapsed time: 5259m

configs tested: 444
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261030    gcc-12.5.0
arc                   randconfig-1000-20261031    gcc-9.5.0
arc                   randconfig-1000-20261101    clang-22
arc                   randconfig-1001-20261030    gcc-12.5.0
arc                   randconfig-1001-20261031    gcc-9.5.0
arc                   randconfig-1001-20261101    clang-22
arc                            tb10x_defconfig    gcc-16.2.0
arm                                allnoconfig    clang-17
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                           collie_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                           gemini_defconfig    gcc-16.2.0
arm                          mv78xx0_defconfig    gcc-16.2.0
arm                         mvebu_v5_defconfig    clang-17
arm                           pxa168_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261030    gcc-12.5.0
arm                   randconfig-1000-20261031    gcc-9.5.0
arm                   randconfig-1000-20261101    clang-22
arm                   randconfig-1001-20261030    gcc-12.5.0
arm                   randconfig-1001-20261031    gcc-9.5.0
arm                   randconfig-1001-20261101    clang-22
arm                   randconfig-1002-20261030    gcc-12.5.0
arm                   randconfig-1002-20261031    gcc-9.5.0
arm                   randconfig-1002-20261101    clang-22
arm                   randconfig-1003-20261030    gcc-12.5.0
arm                   randconfig-1003-20261031    gcc-9.5.0
arm                   randconfig-1003-20261101    clang-22
arm                         realview_defconfig    gcc-16.2.0
arm                              rpc_defconfig    gcc-16.2.0
arm                            spitz_defconfig    gcc-16.2.0
arm                            tegra_defconfig    gcc-16.2.0
arm                     vt8500_v6_v7_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261029    gcc-8.5.0
arm64                 randconfig-1000-20261030    gcc-13.5.0
arm64                 randconfig-1000-20261031    clang-24
arm64                 randconfig-1000-20261101    clang-22
arm64                 randconfig-1001-20261029    gcc-8.5.0
arm64                 randconfig-1001-20261030    gcc-13.5.0
arm64                 randconfig-1001-20261031    clang-24
arm64                 randconfig-1001-20261101    clang-22
arm64                 randconfig-1002-20261029    gcc-8.5.0
arm64                 randconfig-1002-20261030    gcc-13.5.0
arm64                 randconfig-1002-20261031    clang-24
arm64                 randconfig-1002-20261101    clang-22
arm64                 randconfig-1003-20261029    gcc-8.5.0
arm64                 randconfig-1003-20261030    gcc-13.5.0
arm64                 randconfig-1003-20261031    clang-24
arm64                 randconfig-1003-20261101    clang-22
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261029    gcc-8.5.0
csky                  randconfig-1000-20261030    gcc-13.5.0
csky                  randconfig-1000-20261031    clang-24
csky                  randconfig-1000-20261101    clang-22
csky                  randconfig-1001-20261029    gcc-8.5.0
csky                  randconfig-1001-20261030    gcc-13.5.0
csky                  randconfig-1001-20261031    clang-24
csky                  randconfig-1001-20261101    clang-22
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    clang-24
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261030    gcc-11.5.0
hexagon               randconfig-1000-20261031    gcc-11.5.0
hexagon               randconfig-1000-20261101    gcc-16.2.0
hexagon               randconfig-1001-20261030    gcc-11.5.0
hexagon               randconfig-1001-20261031    gcc-11.5.0
hexagon               randconfig-1001-20261101    gcc-16.2.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-14
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261030    clang-22
i386        buildonly-randconfig-1000-20261031    clang-22
i386        buildonly-randconfig-1000-20261101    gcc-14
i386        buildonly-randconfig-1001-20261030    clang-22
i386        buildonly-randconfig-1001-20261031    clang-22
i386        buildonly-randconfig-1001-20261101    gcc-14
i386        buildonly-randconfig-1002-20261030    clang-22
i386        buildonly-randconfig-1002-20261031    clang-22
i386        buildonly-randconfig-1002-20261101    gcc-14
i386        buildonly-randconfig-1003-20261030    clang-22
i386        buildonly-randconfig-1003-20261031    clang-22
i386        buildonly-randconfig-1003-20261101    gcc-14
i386        buildonly-randconfig-1004-20261030    clang-22
i386        buildonly-randconfig-1004-20261031    clang-22
i386        buildonly-randconfig-1004-20261101    gcc-14
i386        buildonly-randconfig-1005-20261030    clang-22
i386        buildonly-randconfig-1005-20261031    clang-22
i386        buildonly-randconfig-1005-20261101    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261030    clang-22
i386                  randconfig-1000-20261031    clang-22
i386                  randconfig-1000-20261101    gcc-14
i386                  randconfig-1001-20261030    clang-22
i386                  randconfig-1001-20261031    clang-22
i386                  randconfig-1001-20261101    gcc-14
i386                  randconfig-1002-20261030    clang-22
i386                  randconfig-1002-20261031    clang-22
i386                  randconfig-1002-20261101    gcc-14
i386                  randconfig-1003-20261030    clang-22
i386                  randconfig-1003-20261031    clang-22
i386                  randconfig-1003-20261101    gcc-14
i386                  randconfig-1004-20261030    clang-22
i386                  randconfig-1004-20261031    clang-22
i386                  randconfig-1004-20261101    gcc-14
i386                  randconfig-1005-20261030    clang-22
i386                  randconfig-1005-20261031    clang-22
i386                  randconfig-1005-20261101    gcc-14
i386                  randconfig-1006-20261030    clang-22
i386                  randconfig-1006-20261031    clang-22
i386                  randconfig-1006-20261101    gcc-14
i386                  randconfig-1007-20261029    clang-22
i386                  randconfig-1007-20261030    clang-22
i386                  randconfig-1007-20261031    gcc-14
i386                  randconfig-1007-20261101    clang-22
i386                  randconfig-1008-20261029    clang-22
i386                  randconfig-1008-20261030    clang-22
i386                  randconfig-1008-20261031    gcc-14
i386                  randconfig-1008-20261101    clang-22
i386                  randconfig-1009-20261029    clang-22
i386                  randconfig-1009-20261030    clang-22
i386                  randconfig-1009-20261031    gcc-14
i386                  randconfig-1009-20261101    clang-22
i386                  randconfig-1010-20261029    clang-22
i386                  randconfig-1010-20261030    clang-22
i386                  randconfig-1010-20261031    gcc-14
i386                  randconfig-1010-20261101    clang-22
i386                  randconfig-1011-20261029    clang-22
i386                  randconfig-1011-20261030    clang-22
i386                  randconfig-1011-20261031    gcc-14
i386                  randconfig-1011-20261101    clang-22
i386                  randconfig-1012-20261029    clang-22
i386                  randconfig-1012-20261030    clang-22
i386                  randconfig-1012-20261031    gcc-14
i386                  randconfig-1012-20261101    clang-22
i386                  randconfig-1013-20261029    clang-22
i386                  randconfig-1013-20261030    clang-22
i386                  randconfig-1013-20261031    gcc-14
i386                  randconfig-1013-20261101    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    clang-20
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261030    gcc-11.5.0
loongarch             randconfig-1000-20261031    gcc-11.5.0
loongarch             randconfig-1000-20261101    gcc-16.2.0
loongarch             randconfig-1001-20261030    gcc-11.5.0
loongarch             randconfig-1001-20261031    gcc-11.5.0
loongarch             randconfig-1001-20261101    gcc-16.2.0
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                          amcore_defconfig    gcc-16.2.0
m68k                           amiga_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    clang-17
m68k                         m5307c3_defconfig    clang-17
m68k                       m54418evb_defconfig    clang-17
m68k                          nettel_defconfig    clang-17
m68k                            virt_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                          bigsur_defconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                  decstation_r4k_defconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                       maltaaprp_defconfig    clang-17
mips                         maltaup_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                              allnoconfig    gcc-11.5.0
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261030    gcc-11.5.0
nios2                 randconfig-1000-20261031    gcc-11.5.0
nios2                 randconfig-1000-20261101    gcc-16.2.0
nios2                 randconfig-1001-20261030    gcc-11.5.0
nios2                 randconfig-1001-20261031    gcc-11.5.0
nios2                 randconfig-1001-20261101    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-16.2.0
openrisc                           allnoconfig    clang-24
openrisc                           allnoconfig    gcc-16.2.0
openrisc          de0_nano_multicore_defconfig    clang-17
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                             allnoconfig    gcc-16.2.0
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261029    clang-17
parisc                randconfig-1000-20261030    gcc-16.2.0
parisc                randconfig-1000-20261031    gcc-13.5.0
parisc                randconfig-1000-20261101    gcc-8.5.0
parisc                randconfig-1001-20261029    clang-17
parisc                randconfig-1001-20261030    gcc-16.2.0
parisc                randconfig-1001-20261031    gcc-13.5.0
parisc                randconfig-1001-20261101    gcc-8.5.0
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.2.0
powerpc                      akebono_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                            allnoconfig    gcc-16.2.0
powerpc                     amigaone_defconfig    gcc-16.2.0
powerpc                  canyonlands_defconfig    clang-17
powerpc                           g5_defconfig    gcc-16.2.0
powerpc                     ge_imp3a_defconfig    gcc-16.2.0
powerpc                        holly_defconfig    clang-17
powerpc                   mpc885_ads_defconfig    clang-17
powerpc                       pcm030_defconfig    clang-17
powerpc               randconfig-1000-20261029    clang-17
powerpc               randconfig-1000-20261030    gcc-16.2.0
powerpc               randconfig-1000-20261031    gcc-13.5.0
powerpc               randconfig-1000-20261101    gcc-8.5.0
powerpc               randconfig-1001-20261029    clang-17
powerpc               randconfig-1001-20261030    gcc-16.2.0
powerpc               randconfig-1001-20261031    gcc-13.5.0
powerpc               randconfig-1001-20261101    gcc-8.5.0
powerpc                         warp_defconfig    gcc-16.2.0
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261029    clang-17
powerpc64             randconfig-1000-20261030    gcc-16.2.0
powerpc64             randconfig-1000-20261031    gcc-13.5.0
powerpc64             randconfig-1000-20261101    gcc-8.5.0
powerpc64             randconfig-1001-20261029    clang-17
powerpc64             randconfig-1001-20261030    gcc-16.2.0
powerpc64             randconfig-1001-20261031    gcc-13.5.0
powerpc64             randconfig-1001-20261101    gcc-8.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                              allnoconfig    gcc-16.2.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261029    gcc-10.5.0
riscv                 randconfig-1000-20261030    gcc-11.5.0
riscv                 randconfig-1000-20261031    gcc-8.5.0
riscv                 randconfig-1000-20261101    gcc-8.5.0
riscv                 randconfig-1001-20261029    gcc-10.5.0
riscv                 randconfig-1001-20261030    gcc-11.5.0
riscv                 randconfig-1001-20261031    gcc-8.5.0
riscv                 randconfig-1001-20261101    gcc-8.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                           debug_defconfig    clang-17
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261029    gcc-10.5.0
s390                  randconfig-1000-20261030    gcc-11.5.0
s390                  randconfig-1000-20261031    gcc-8.5.0
s390                  randconfig-1000-20261101    gcc-8.5.0
s390                  randconfig-1001-20261029    gcc-10.5.0
s390                  randconfig-1001-20261030    gcc-11.5.0
s390                  randconfig-1001-20261031    gcc-8.5.0
s390                  randconfig-1001-20261101    gcc-8.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                 allnoconfig    gcc-16.2.0
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                          ecovec24_defconfig    gcc-16.2.0
sh                      magicpanelr2_defconfig    clang-17
sh                           polaris_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261029    gcc-10.5.0
sh                    randconfig-1000-20261030    gcc-11.5.0
sh                    randconfig-1000-20261031    gcc-8.5.0
sh                    randconfig-1000-20261101    gcc-8.5.0
sh                    randconfig-1001-20261029    gcc-10.5.0
sh                    randconfig-1001-20261030    gcc-11.5.0
sh                    randconfig-1001-20261031    gcc-8.5.0
sh                    randconfig-1001-20261101    gcc-8.5.0
sh                           rsk7201_defconfig    gcc-16.2.0
sh                           rsk7203_defconfig    gcc-16.2.0
sh                           urquell_defconfig    clang-17
sh                           urquell_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                              allnoconfig    gcc-16.2.0
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261029    clang-24
sparc                 randconfig-1000-20261030    gcc-10.5.0
sparc                 randconfig-1000-20261031    gcc-11.5.0
sparc                 randconfig-1000-20261101    gcc-8.5.0
sparc                 randconfig-1001-20261029    clang-24
sparc                 randconfig-1001-20261030    gcc-10.5.0
sparc                 randconfig-1001-20261031    gcc-11.5.0
sparc                 randconfig-1001-20261101    gcc-8.5.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261029    clang-24
sparc64               randconfig-1000-20261030    gcc-10.5.0
sparc64               randconfig-1000-20261031    gcc-11.5.0
sparc64               randconfig-1000-20261101    gcc-8.5.0
sparc64               randconfig-1001-20261029    clang-24
sparc64               randconfig-1001-20261030    gcc-10.5.0
sparc64               randconfig-1001-20261031    gcc-11.5.0
sparc64               randconfig-1001-20261101    gcc-8.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-16.2.0
um                    randconfig-1000-20261029    clang-24
um                    randconfig-1000-20261030    gcc-10.5.0
um                    randconfig-1000-20261031    gcc-11.5.0
um                    randconfig-1000-20261101    gcc-8.5.0
um                    randconfig-1001-20261029    clang-24
um                    randconfig-1001-20261030    gcc-10.5.0
um                    randconfig-1001-20261031    gcc-11.5.0
um                    randconfig-1001-20261101    gcc-8.5.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261030    gcc-14
x86_64      buildonly-randconfig-1000-20261031    clang-22
x86_64      buildonly-randconfig-1000-20261101    clang-22
x86_64      buildonly-randconfig-1001-20261030    gcc-14
x86_64      buildonly-randconfig-1001-20261031    clang-22
x86_64      buildonly-randconfig-1001-20261101    clang-22
x86_64      buildonly-randconfig-1002-20261030    gcc-14
x86_64      buildonly-randconfig-1002-20261031    clang-22
x86_64      buildonly-randconfig-1002-20261101    clang-22
x86_64      buildonly-randconfig-1003-20261030    gcc-14
x86_64      buildonly-randconfig-1003-20261031    clang-22
x86_64      buildonly-randconfig-1003-20261101    clang-22
x86_64      buildonly-randconfig-1004-20261030    gcc-14
x86_64      buildonly-randconfig-1004-20261031    clang-22
x86_64      buildonly-randconfig-1004-20261101    clang-22
x86_64      buildonly-randconfig-1005-20261030    gcc-14
x86_64      buildonly-randconfig-1005-20261031    clang-22
x86_64      buildonly-randconfig-1005-20261101    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261029    clang-22
x86_64                randconfig-1000-20261030    clang-22
x86_64                randconfig-1000-20261031    gcc-14
x86_64                randconfig-1000-20261101    gcc-14
x86_64                randconfig-1001-20261029    clang-22
x86_64                randconfig-1001-20261030    clang-22
x86_64                randconfig-1001-20261031    gcc-14
x86_64                randconfig-1001-20261101    gcc-14
x86_64                randconfig-1002-20261029    clang-22
x86_64                randconfig-1002-20261030    clang-22
x86_64                randconfig-1002-20261031    gcc-14
x86_64                randconfig-1002-20261101    gcc-14
x86_64                randconfig-1003-20261029    clang-22
x86_64                randconfig-1003-20261030    clang-22
x86_64                randconfig-1003-20261031    gcc-14
x86_64                randconfig-1003-20261101    gcc-14
x86_64                randconfig-1004-20261029    clang-22
x86_64                randconfig-1004-20261030    clang-22
x86_64                randconfig-1004-20261031    gcc-14
x86_64                randconfig-1004-20261101    gcc-14
x86_64                randconfig-1005-20261029    clang-22
x86_64                randconfig-1005-20261030    clang-22
x86_64                randconfig-1005-20261031    gcc-14
x86_64                randconfig-1005-20261101    gcc-14
x86_64                randconfig-1006-20261029    gcc-14
x86_64                randconfig-1006-20261030    gcc-14
x86_64                randconfig-1006-20261031    clang-22
x86_64                randconfig-1006-20261101    clang-22
x86_64                randconfig-1007-20261029    gcc-14
x86_64                randconfig-1007-20261030    gcc-14
x86_64                randconfig-1007-20261031    clang-22
x86_64                randconfig-1007-20261101    clang-22
x86_64                randconfig-1008-20261029    gcc-14
x86_64                randconfig-1008-20261030    gcc-14
x86_64                randconfig-1008-20261031    clang-22
x86_64                randconfig-1008-20261101    clang-22
x86_64                randconfig-1009-20261029    gcc-14
x86_64                randconfig-1009-20261030    gcc-14
x86_64                randconfig-1009-20261031    clang-22
x86_64                randconfig-1009-20261101    clang-22
x86_64                randconfig-1010-20261029    gcc-14
x86_64                randconfig-1010-20261030    gcc-14
x86_64                randconfig-1010-20261031    clang-22
x86_64                randconfig-1010-20261101    clang-22
x86_64                randconfig-1011-20261029    gcc-14
x86_64                randconfig-1011-20261030    gcc-14
x86_64                randconfig-1011-20261031    clang-22
x86_64                randconfig-1011-20261101    clang-22
x86_64                randconfig-1012-20261030    clang-22
x86_64                randconfig-1012-20261031    gcc-14
x86_64                randconfig-1012-20261101    gcc-14
x86_64                randconfig-1013-20261030    clang-22
x86_64                randconfig-1013-20261031    gcc-14
x86_64                randconfig-1013-20261101    gcc-14
x86_64                randconfig-1014-20261030    clang-22
x86_64                randconfig-1014-20261031    gcc-14
x86_64                randconfig-1014-20261101    gcc-14
x86_64                randconfig-1015-20261030    clang-22
x86_64                randconfig-1015-20261031    gcc-14
x86_64                randconfig-1015-20261101    gcc-14
x86_64                randconfig-1016-20261030    clang-22
x86_64                randconfig-1016-20261031    gcc-14
x86_64                randconfig-1016-20261101    gcc-14
x86_64                randconfig-1017-20261030    clang-22
x86_64                randconfig-1017-20261031    gcc-14
x86_64                randconfig-1017-20261101    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                             allnoconfig    gcc-16.2.0
xtensa                            allyesconfig    clang-20
xtensa                            allyesconfig    gcc-16.2.0
xtensa                   cadence_csp_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261029    clang-24
xtensa                randconfig-1000-20261030    gcc-10.5.0
xtensa                randconfig-1000-20261031    gcc-11.5.0
xtensa                randconfig-1000-20261101    gcc-8.5.0
xtensa                randconfig-1001-20261029    clang-24
xtensa                randconfig-1001-20261030    gcc-10.5.0
xtensa                randconfig-1001-20261031    gcc-11.5.0
xtensa                randconfig-1001-20261101    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
