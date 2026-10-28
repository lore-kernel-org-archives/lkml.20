Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793161937;
	b=FMpWUJ4Vbzuu65V4GvamJ67Zsbiy5fPciX42wTRUgg7LjMVpcANSxBm6rHbTUoevdbzN
	 m7HM/xs17PjxGzLTLTN8lH5+c4ZmhYIGSQMa+dZ5nQ2k1ACwm+NYOA1eqOsP2Ro0NuUKj
	 n1tudMKwnC16owAbuAc86uIccEIkR43atcr5tMUFElpEr321mYHHMaRR/yPOgkhKwpWpv
	 2OJPrRlQXTt7sYvp5o7lT0MLWt6fNnE3iWh3DlhTJIhmiEg5ATDtY/IrwMGm8/pgGO9rE
	 KpaG8kcRwF8wB9xV39S7UjeJGlDhGnJ7131buEM8Rz5MmzNVLiTLfWuKY5kBicdMJcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793161937;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=3B7XlkqckHdLy+F0+yb8O7fynQ6hlmobZ+zQ/4D8/Ww=;
	b=VxHjeck44jR5f42UCqpOkFdAqU7Gry1w9j2Kmf03mTvMw3+HaTTkca6TtSQiYXu2IWic
	 Lv8/vTpG5d9bwlaJUt2dOpfVHNOHAYGQTJ5n0Uo66hob2z7w7at5C1B4GT7ldBIOkJRzb
	 VdwHFVCT2xLHHc5TbYb0NSdQeOVIp10T3F61kenPnBSYnpF4F7FJ2RZ/b+4VRdahzh+6T
	 cN4zC+nuGgVdgmTdr3dkCZLLVaj9j3d/69T0hrGdCXLgMN321M/coyCwN8ss/+aJrr3UL
	 nU+uEXvtOr/pm6gzB+yLCTSOpiaf2wP+OnGX54RAJEU1Ldok1BZO8xrRuv2de4ICkmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IabN2cr7;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4783A606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4783A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IabN2cr7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793161935; x=1824697935;
  h=date:from:to:cc:subject:message-id;
  bh=3g+6ES9Ri9XpsmVRb28CvbpXloY+e21IfHlQmLz0soU=;
  b=IabN2cr7Mg5vk3rhe4/8P9DAGItLLo4YuZB69zC3ojbye+2MBUPV/bAj
   r6LRyfpqMrTq5FahWOlbLwXIl7jupUnGXjjmYCMiUk6H78JNiozTjNz23
   6i8F6fk4FY/ZWdXTT3QaDdJGzQtIAvAVEApCGTBefrqxiBRanAe2Novdi
   5uOvJrbSCCSbzsnQjDvKP0887DKxZoT3eFlnzGMC2K50Q+Y33ib3PyWoC
   n9BMbyq5Rx/JoLk3Z5LAAeMXxTriLRIEY9h21hxKfhfAkUM4u51GwuA/b
   AWrOZb5z+NNYzMzu2qx5MKQpn48OaH0IPgQxOfMQGDy8yJAfSGbLDlgll
   w==;
X-CSE-ConnectionGUID: s7cBv+E8TCu0wMj6+uiu/g==
X-CSE-MsgGUID: fcIlC2baTXeTV5SWFq109g==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1881115"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1881115"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 21:32:15 -0700
X-CSE-ConnectionGUID: +pPyBwSlQxWByJ61mlAiSQ==
X-CSE-MsgGUID: b4EGRGzcQw6vMunvRoVklg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5112210"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Oct 2026 21:32:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLvKd-00000000YCl-03t5;
	Wed, 28 Oct 2026 04:32:11 +0000
Date: Wed, 28 Oct 2026 12:31:14 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched:urgent] BUILD SUCCESS
 7dbc307b6c72a5412e3f4e9fa2e0e926925fc5d6
Message-ID: <202610281211.5e9oJ39q-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/urgent
branch HEAD: 7dbc307b6c72a5412e3f4e9fa2e0e926925fc5d6  sched/mmcid: Fix affinity-triggered switch back to per-task mode

elapsed time: 9755m

configs tested: 669
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                randconfig-r2104-20261020    gcc-8.5.0  cocci
alpha                randconfig-r2111-20261022    gcc-12     cocci
alpha                randconfig-r2200-20261021    gcc-8.5.0  smatch
alpha                randconfig-r2305-20261020    gcc-12     sparse
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
arc                   randconfig-2000-20261020    gcc-14.4.0
arc                   randconfig-2000-20261021    clang-24
arc                   randconfig-2000-20261022    clang-24
arc                   randconfig-2001-20261020    gcc-14.4.0
arc                   randconfig-2001-20261021    clang-24
arc                   randconfig-2001-20261022    clang-24
arc                  randconfig-r2103-20261020    gcc-10.5.0 cocci
arc                  randconfig-r2107-20261020    gcc-8.5.0  cocci
arc                  randconfig-r2107-20261021    gcc-12.5.0 cocci
arc                  randconfig-r2109-20261021    gcc-8.5.0  cocci
arc                  randconfig-r2202-20261021    gcc-13.5.0 smatch
arc                  randconfig-r2304-20261020    gcc-12     sparse
arc                  randconfig-r2306-20261021    gcc-11.5.0 sparse
arc                  randconfig-r2310-20261021    gcc-11.5.0 sparse
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
arm                   randconfig-2000-20261020    gcc-14.4.0
arm                   randconfig-2000-20261021    clang-24
arm                   randconfig-2000-20261022    clang-24
arm                   randconfig-2001-20261020    gcc-14.4.0
arm                   randconfig-2001-20261021    clang-24
arm                   randconfig-2001-20261022    clang-24
arm                  randconfig-r2105-20261021    gcc-12.5.0 cocci
arm                  randconfig-r2108-20261021    clang-24   cocci
arm                  randconfig-r2200-20261021    gcc-10.5.0 smatch
arm                  randconfig-r2202-20261021    gcc-13.5.0 smatch
arm                  randconfig-r2304-20261021    clang-22   sparse
arm                  randconfig-r2309-20261020    gcc-11.5.0 sparse
arm                          s5pv210_defconfig    gcc-16.2.0
arm                            sama5_defconfig    clang-19
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
arm64                 randconfig-2000-20261020    clang-24
arm64                 randconfig-2000-20261021    clang-24
arm64                 randconfig-2001-20261020    clang-24
arm64                 randconfig-2001-20261021    clang-24
arm64                randconfig-r2105-20261021    clang-24   cocci
arm64                randconfig-r2108-20261022    gcc-16.2.0 cocci
arm64                randconfig-r2300-20261020    gcc-12     sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261023    gcc-8.5.0
csky                  randconfig-1000-20261024    gcc-10.5.0
csky                  randconfig-1001-20261023    gcc-8.5.0
csky                  randconfig-1001-20261024    gcc-10.5.0
csky                  randconfig-2000-20261020    clang-24
csky                  randconfig-2000-20261021    clang-24
csky                  randconfig-2001-20261020    clang-24
csky                  randconfig-2001-20261021    clang-24
csky                 randconfig-r2101-20261020    gcc-10.5.0 cocci
csky                 randconfig-r2101-20261021    gcc-8.5.0  cocci
csky                 randconfig-r2109-20261020    gcc-10.5.0 cocci
csky                 randconfig-r2109-20261021    clang-24   cocci
csky                 randconfig-r2300-20261021    clang-22   sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261023    clang-17
hexagon               randconfig-1000-20261024    clang-24
hexagon               randconfig-1001-20261023    clang-17
hexagon               randconfig-1001-20261024    clang-24
hexagon               randconfig-2000-20261020    clang-24
hexagon               randconfig-2000-20261021    clang-24
hexagon               randconfig-2001-20261020    clang-24
hexagon               randconfig-2001-20261021    clang-24
hexagon              randconfig-r2101-20261022    gcc-16.2.0 cocci
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
i386                  randconfig-1000-20261022    gcc-13
i386                  randconfig-1000-20261023    gcc-14
i386                  randconfig-1000-20261024    clang-22
i386                  randconfig-1001-20261022    gcc-13
i386                  randconfig-1001-20261023    gcc-14
i386                  randconfig-1001-20261024    clang-22
i386                  randconfig-1002-20261022    gcc-13
i386                  randconfig-1002-20261023    gcc-14
i386                  randconfig-1002-20261024    clang-22
i386                  randconfig-1003-20261022    gcc-13
i386                  randconfig-1003-20261023    gcc-14
i386                  randconfig-1003-20261024    clang-22
i386                  randconfig-1004-20261022    gcc-13
i386                  randconfig-1004-20261023    gcc-14
i386                  randconfig-1004-20261024    clang-22
i386                  randconfig-1005-20261022    gcc-13
i386                  randconfig-1005-20261023    gcc-14
i386                  randconfig-1005-20261024    clang-22
i386                  randconfig-1006-20261022    gcc-13
i386                  randconfig-1006-20261023    gcc-14
i386                  randconfig-1006-20261024    clang-22
i386                  randconfig-1007-20261022    clang-22
i386                  randconfig-1007-20261023    clang-22
i386                  randconfig-1007-20261024    gcc-14
i386                  randconfig-1008-20261022    clang-22
i386                  randconfig-1008-20261023    clang-22
i386                  randconfig-1008-20261024    gcc-14
i386                  randconfig-1009-20261022    clang-22
i386                  randconfig-1009-20261023    clang-22
i386                  randconfig-1009-20261024    gcc-14
i386                  randconfig-1010-20261022    clang-22
i386                  randconfig-1010-20261023    clang-22
i386                  randconfig-1010-20261024    gcc-14
i386                  randconfig-1011-20261022    clang-22
i386                  randconfig-1011-20261023    clang-22
i386                  randconfig-1011-20261024    gcc-14
i386                  randconfig-1012-20261022    clang-22
i386                  randconfig-1012-20261023    clang-22
i386                  randconfig-1012-20261024    gcc-14
i386                  randconfig-1013-20261022    clang-22
i386                  randconfig-1013-20261023    clang-22
i386                  randconfig-1013-20261024    gcc-14
i386                  randconfig-2000-20261020    gcc-14.4.0
i386                  randconfig-2000-20261021    clang-24
i386                  randconfig-2000-20261022    clang-24
i386                  randconfig-2001-20261020    gcc-14.4.0
i386                  randconfig-2001-20261021    clang-24
i386                  randconfig-2001-20261022    clang-24
i386                  randconfig-2100-20261020    clang-22   cocci
i386                  randconfig-2100-20261021    gcc-14     cocci
i386                  randconfig-2100-20261022    gcc-14     cocci
i386                  randconfig-2101-20261020    clang-22   cocci
i386                  randconfig-2101-20261021    gcc-14     cocci
i386                  randconfig-2101-20261022    gcc-14     cocci
i386                  randconfig-2102-20261020    clang-22   cocci
i386                  randconfig-2102-20261021    gcc-14     cocci
i386                  randconfig-2102-20261022    gcc-14     cocci
i386                  randconfig-2103-20261020    clang-22   cocci
i386                  randconfig-2103-20261021    gcc-14     cocci
i386                  randconfig-2103-20261022    gcc-14     cocci
i386                  randconfig-2104-20261020    clang-22   cocci
i386                  randconfig-2104-20261021    gcc-14     cocci
i386                  randconfig-2104-20261022    gcc-14     cocci
i386                  randconfig-2105-20261020    clang-22   cocci
i386                  randconfig-2105-20261021    gcc-14     cocci
i386                  randconfig-2105-20261022    gcc-14     cocci
i386                  randconfig-2200-20261020    gcc-12     smatch
i386                  randconfig-2200-20261021    clang-22   smatch
i386                  randconfig-2200-20261022    gcc-14     smatch
i386                  randconfig-2300-20261020    clang-22   sparse
i386                  randconfig-2300-20261021    clang-22   sparse
i386                  randconfig-2300-20261022    gcc-14     sparse
i386                  randconfig-2301-20261020    clang-22   sparse
i386                  randconfig-2301-20261021    clang-22   sparse
i386                  randconfig-2301-20261022    gcc-14     sparse
i386                  randconfig-2302-20261020    clang-22   sparse
i386                  randconfig-2302-20261021    clang-22   sparse
i386                  randconfig-2302-20261022    gcc-14     sparse
i386                 randconfig-r2103-20261021    clang-24   cocci
i386                 randconfig-r2104-20261021    clang-24   cocci
i386                 randconfig-r2105-20261022    gcc-12     cocci
loongarch                         alldefconfig    gcc-16.2.0
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson32_defconfig    gcc-11.5.0
loongarch             randconfig-1000-20261023    clang-17
loongarch             randconfig-1000-20261024    clang-24
loongarch             randconfig-1001-20261023    clang-17
loongarch             randconfig-1001-20261024    clang-24
loongarch             randconfig-2000-20261020    gcc-11.5.0
loongarch             randconfig-2000-20261021    gcc-11.5.0
loongarch             randconfig-2000-20261022    gcc-11.5.0
loongarch             randconfig-2001-20261020    gcc-11.5.0
loongarch             randconfig-2001-20261021    gcc-11.5.0
loongarch             randconfig-2001-20261022    gcc-11.5.0
loongarch            randconfig-r2106-20261021    clang-24   cocci
loongarch            randconfig-r2311-20261021    gcc-11.5.0 sparse
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
m68k                 randconfig-r2100-20261021    clang-24   cocci
m68k                 randconfig-r2102-20261021    gcc-8.5.0  cocci
m68k                 randconfig-r2105-20261022    gcc-14     cocci
m68k                 randconfig-r2108-20261020    gcc-10.5.0 cocci
m68k                            sun3_defconfig    clang-17
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2106-20261021    gcc-12.5.0 cocci
microblaze           randconfig-r2106-20261022    gcc-12     cocci
microblaze           randconfig-r2300-20261021    clang-22   sparse
microblaze           randconfig-r2303-20261021    clang-22   sparse
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
mips                         omega2p_defconfig    clang-19
mips                         omega2p_defconfig    gcc-16.2.0
mips                 randconfig-r2102-20261021    clang-24   cocci
mips                 randconfig-r2111-20261020    gcc-8.5.0  cocci
mips                 randconfig-r2111-20261021    clang-24   cocci
mips                 randconfig-r2302-20261021    clang-22   sparse
mips                 randconfig-r2308-20261020    gcc-11.5.0 sparse
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
nios2                 randconfig-2000-20261020    gcc-11.5.0
nios2                 randconfig-2000-20261021    gcc-11.5.0
nios2                 randconfig-2000-20261022    gcc-11.5.0
nios2                 randconfig-2001-20261020    gcc-11.5.0
nios2                 randconfig-2001-20261021    gcc-11.5.0
nios2                 randconfig-2001-20261022    gcc-11.5.0
nios2                randconfig-r2111-20261021    gcc-12.5.0 cocci
nios2                randconfig-r2200-20261022    gcc-11.5.0 smatch
nios2                randconfig-r2306-20261020    gcc-11.5.0 sparse
nios2                randconfig-r2308-20261021    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc             randconfig-r2100-20261022    gcc-16.2.0 cocci
openrisc             randconfig-r2103-20261022    gcc-16.2.0 cocci
openrisc             randconfig-r2110-20261022    gcc-12     cocci
openrisc             randconfig-r2301-20261020    gcc-12     sparse
openrisc             randconfig-r2310-20261020    gcc-11.5.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                            allyesconfig    gcc-16.2.0
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261023    gcc-15.3.0
parisc                randconfig-1000-20261024    clang-24
parisc                randconfig-1001-20261023    gcc-15.3.0
parisc                randconfig-1001-20261024    clang-24
parisc                randconfig-2000-20261020    gcc-11.5.0
parisc                randconfig-2000-20261021    gcc-11.5.0
parisc                randconfig-2000-20261022    gcc-11.5.0
parisc                randconfig-2001-20261020    gcc-11.5.0
parisc                randconfig-2001-20261021    gcc-11.5.0
parisc                randconfig-2001-20261022    gcc-11.5.0
parisc               randconfig-r2104-20261022    gcc-12     cocci
parisc               randconfig-r2109-20261022    gcc-16.2.0 cocci
parisc               randconfig-r2301-20261021    clang-22   sparse
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
powerpc                     gamecube_defconfig    clang-19
powerpc                         icon_defconfig    clang-24
powerpc                    lite5200b_defconfig    clang-24
powerpc                      mpc512x_defconfig    gcc-11.5.0
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc                          ps3_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261023    gcc-15.3.0
powerpc               randconfig-1000-20261024    clang-24
powerpc               randconfig-1001-20261023    gcc-15.3.0
powerpc               randconfig-1001-20261024    clang-24
powerpc               randconfig-2000-20261020    clang-19
powerpc               randconfig-2000-20261021    clang-24
powerpc               randconfig-2000-20261022    clang-24
powerpc               randconfig-2001-20261020    clang-19
powerpc               randconfig-2001-20261021    clang-24
powerpc               randconfig-2001-20261022    clang-24
powerpc              randconfig-r2201-20261021    clang-24   smatch
powerpc              randconfig-r2202-20261020    gcc-12.5.0 smatch
powerpc              randconfig-r2303-20261020    gcc-12     sparse
powerpc              randconfig-r2307-20261021    gcc-11.5.0 sparse
powerpc                     sam440ep_defconfig    clang-17
powerpc                      skiroot_defconfig    gcc-11.5.0
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64                         alldefconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261023    gcc-15.3.0
powerpc64             randconfig-1000-20261024    clang-24
powerpc64             randconfig-1001-20261023    gcc-15.3.0
powerpc64             randconfig-1001-20261024    clang-24
powerpc64             randconfig-2000-20261020    clang-19
powerpc64             randconfig-2000-20261021    clang-24
powerpc64             randconfig-2000-20261022    clang-24
powerpc64             randconfig-2001-20261020    clang-19
powerpc64             randconfig-2001-20261021    clang-24
powerpc64             randconfig-2001-20261022    clang-24
powerpc64            randconfig-r2100-20261020    gcc-10.5.0 cocci
powerpc64            randconfig-r2103-20261021    gcc-8.5.0  cocci
powerpc64            randconfig-r2104-20261022    gcc-14     cocci
powerpc64            randconfig-r2111-20261022    gcc-14     cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261022    gcc-13.5.0
riscv                 randconfig-1000-20261023    gcc-16.2.0
riscv                 randconfig-1000-20261024    gcc-11.5.0
riscv                 randconfig-1001-20261022    gcc-13.5.0
riscv                 randconfig-1001-20261023    gcc-16.2.0
riscv                 randconfig-1001-20261024    gcc-11.5.0
riscv                 randconfig-2000-20261020    clang-17
riscv                 randconfig-2000-20261021    clang-18
riscv                 randconfig-2001-20261020    clang-17
riscv                 randconfig-2001-20261021    clang-18
riscv                randconfig-r2110-20261022    gcc-14     cocci
riscv                randconfig-r2201-20261020    gcc-8.5.0  smatch
riscv                randconfig-r2301-20261021    clang-22   sparse
riscv                randconfig-r2309-20261021    gcc-11.5.0 sparse
riscv                         rzfive_defconfig    gcc-16.2.0
s390                              alldefconfig    gcc-16.2.0
s390                              allmodconfig    clang-17
s390                              allmodconfig    gcc-16.2.0
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261022    gcc-13.5.0
s390                  randconfig-1000-20261023    gcc-16.2.0
s390                  randconfig-1000-20261024    gcc-11.5.0
s390                  randconfig-1001-20261022    gcc-13.5.0
s390                  randconfig-1001-20261023    gcc-16.2.0
s390                  randconfig-1001-20261024    gcc-11.5.0
s390                  randconfig-2000-20261020    clang-17
s390                  randconfig-2000-20261021    clang-18
s390                  randconfig-2001-20261020    clang-17
s390                  randconfig-2001-20261021    clang-18
s390                 randconfig-r2110-20261021    clang-24   cocci
s390                 randconfig-r2307-20261020    gcc-11.5.0 sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                allyesconfig    gcc-16.2.0
sh                          apsh4a3a_defconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7705_defconfig    gcc-16.2.0
sh                                j2_defconfig    gcc-16.2.0
sh                             migor_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261022    gcc-13.5.0
sh                    randconfig-1000-20261023    gcc-16.2.0
sh                    randconfig-1000-20261024    gcc-11.5.0
sh                    randconfig-1001-20261022    gcc-13.5.0
sh                    randconfig-1001-20261023    gcc-16.2.0
sh                    randconfig-1001-20261024    gcc-11.5.0
sh                    randconfig-2000-20261020    clang-17
sh                    randconfig-2000-20261021    clang-18
sh                    randconfig-2001-20261020    clang-17
sh                    randconfig-2001-20261021    clang-18
sh                   randconfig-r2107-20261021    clang-24   cocci
sh                   randconfig-r2304-20261021    clang-22   sparse
sh                           rsk7201_defconfig    gcc-16.2.0
sh                           rsk7269_defconfig    gcc-16.2.0
sh                           sdk7786_defconfig    gcc-16.2.0
sh                            se7343_defconfig    gcc-16.2.0
sh                            se7712_defconfig    gcc-16.2.0
sh                            se7722_defconfig    gcc-16.2.0
sh                            se7724_defconfig    gcc-11.5.0
sh                            se7724_defconfig    gcc-16.2.0
sh                              sh03_defconfig    clang-19
sh                            sh2007_defconfig    gcc-16.2.0
sh                    sh7724_generic_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    clang-24
sh                         sh7785lcr_defconfig    gcc-16.2.0
sh                             shmin_defconfig    gcc-16.2.0
sh                              shx3_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261022    gcc-12
sparc                 randconfig-1000-20261023    clang-24
sparc                 randconfig-1000-20261024    gcc-14
sparc                 randconfig-1000-20261025    gcc-14
sparc                 randconfig-1001-20261022    gcc-12
sparc                 randconfig-1001-20261023    clang-24
sparc                 randconfig-1001-20261024    gcc-14
sparc                 randconfig-1001-20261025    gcc-14
sparc                 randconfig-2000-20261020    clang-24
sparc                 randconfig-2000-20261021    gcc-16.2.0
sparc                 randconfig-2000-20261022    gcc-15.3.0
sparc                 randconfig-2001-20261020    clang-24
sparc                 randconfig-2001-20261021    gcc-16.2.0
sparc                 randconfig-2001-20261022    gcc-15.3.0
sparc                randconfig-r2110-20261021    gcc-12.5.0 cocci
sparc                        sparc32_defconfig    clang-19
sparc                        sparc32_defconfig    gcc-16.2.0
sparc                        sparc64_defconfig    gcc-16.2.0
sparc64                           alldefconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261022    gcc-12
sparc64               randconfig-1000-20261023    clang-24
sparc64               randconfig-1000-20261024    gcc-14
sparc64               randconfig-1000-20261025    gcc-14
sparc64               randconfig-1001-20261022    gcc-12
sparc64               randconfig-1001-20261023    clang-24
sparc64               randconfig-1001-20261024    gcc-14
sparc64               randconfig-1001-20261025    gcc-14
sparc64               randconfig-2000-20261020    clang-24
sparc64               randconfig-2000-20261021    gcc-16.2.0
sparc64               randconfig-2000-20261022    gcc-15.3.0
sparc64               randconfig-2001-20261020    clang-24
sparc64               randconfig-2001-20261021    gcc-16.2.0
sparc64               randconfig-2001-20261022    gcc-15.3.0
sparc64              randconfig-r2102-20261022    gcc-16.2.0 cocci
sparc64              randconfig-r2106-20261022    gcc-14     cocci
sparc64              randconfig-r2110-20261020    gcc-8.5.0  cocci
sparc64              randconfig-r2200-20261020    gcc-8.5.0  smatch
sparc64              randconfig-r2305-20261021    clang-22   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261022    gcc-12
um                    randconfig-1000-20261023    clang-24
um                    randconfig-1000-20261024    gcc-14
um                    randconfig-1000-20261025    gcc-14
um                    randconfig-1001-20261022    gcc-12
um                    randconfig-1001-20261023    clang-24
um                    randconfig-1001-20261024    gcc-14
um                    randconfig-1001-20261025    gcc-14
um                    randconfig-2000-20261020    clang-24
um                    randconfig-2000-20261021    gcc-16.2.0
um                    randconfig-2000-20261022    gcc-15.3.0
um                    randconfig-2001-20261020    clang-24
um                    randconfig-2001-20261021    gcc-16.2.0
um                    randconfig-2001-20261022    gcc-15.3.0
um                   randconfig-r2102-20261020    gcc-10.5.0 cocci
um                   randconfig-r2105-20261020    gcc-8.5.0  cocci
um                   randconfig-r2106-20261020    gcc-8.5.0  cocci
um                   randconfig-r2107-20261022    gcc-12     cocci
um                   randconfig-r2107-20261022    gcc-14     cocci
um                   randconfig-r2201-20261021    clang-24   smatch
um                   randconfig-r2302-20261020    gcc-12     sparse
um                   randconfig-r2303-20261021    clang-22   sparse
um                   randconfig-r2311-20261020    gcc-11.5.0 sparse
um                            x86_64_defconfig    clang-19
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261022    gcc-14
x86_64      buildonly-randconfig-1000-20261023    clang-22
x86_64      buildonly-randconfig-1000-20261024    gcc-14
x86_64      buildonly-randconfig-1001-20261022    gcc-14
x86_64      buildonly-randconfig-1001-20261023    clang-22
x86_64      buildonly-randconfig-1001-20261024    gcc-14
x86_64      buildonly-randconfig-1002-20261022    gcc-14
x86_64      buildonly-randconfig-1002-20261023    clang-22
x86_64      buildonly-randconfig-1002-20261024    gcc-14
x86_64      buildonly-randconfig-1003-20261022    gcc-14
x86_64      buildonly-randconfig-1003-20261023    clang-22
x86_64      buildonly-randconfig-1003-20261024    gcc-14
x86_64      buildonly-randconfig-1004-20261022    gcc-14
x86_64      buildonly-randconfig-1004-20261023    clang-22
x86_64      buildonly-randconfig-1004-20261024    gcc-14
x86_64      buildonly-randconfig-1005-20261022    gcc-14
x86_64      buildonly-randconfig-1005-20261023    clang-22
x86_64      buildonly-randconfig-1005-20261024    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261022    clang-22
x86_64                randconfig-1000-20261023    gcc-14
x86_64                randconfig-1000-20261024    gcc-14
x86_64                randconfig-1001-20261022    clang-22
x86_64                randconfig-1001-20261023    gcc-14
x86_64                randconfig-1001-20261024    gcc-14
x86_64                randconfig-1002-20261022    clang-22
x86_64                randconfig-1002-20261023    gcc-14
x86_64                randconfig-1002-20261024    gcc-14
x86_64                randconfig-1003-20261022    clang-22
x86_64                randconfig-1003-20261023    gcc-14
x86_64                randconfig-1003-20261024    gcc-14
x86_64                randconfig-1004-20261022    clang-22
x86_64                randconfig-1004-20261023    gcc-14
x86_64                randconfig-1004-20261024    gcc-14
x86_64                randconfig-1005-20261022    clang-22
x86_64                randconfig-1005-20261023    gcc-14
x86_64                randconfig-1005-20261024    gcc-14
x86_64                randconfig-1006-20261022    clang-22
x86_64                randconfig-1006-20261023    gcc-14
x86_64                randconfig-1006-20261024    gcc-13
x86_64                randconfig-1006-20261025    clang-22
x86_64                randconfig-1007-20261022    clang-22
x86_64                randconfig-1007-20261023    gcc-14
x86_64                randconfig-1007-20261024    gcc-13
x86_64                randconfig-1007-20261025    clang-22
x86_64                randconfig-1008-20261022    clang-22
x86_64                randconfig-1008-20261023    gcc-14
x86_64                randconfig-1008-20261024    gcc-13
x86_64                randconfig-1008-20261025    clang-22
x86_64                randconfig-1009-20261022    clang-22
x86_64                randconfig-1009-20261023    gcc-14
x86_64                randconfig-1009-20261024    gcc-13
x86_64                randconfig-1009-20261025    clang-22
x86_64                randconfig-1010-20261022    clang-22
x86_64                randconfig-1010-20261023    gcc-14
x86_64                randconfig-1010-20261024    gcc-13
x86_64                randconfig-1010-20261025    clang-22
x86_64                randconfig-1011-20261022    clang-22
x86_64                randconfig-1011-20261023    gcc-14
x86_64                randconfig-1011-20261024    gcc-13
x86_64                randconfig-1011-20261025    clang-22
x86_64                randconfig-1012-20261023    clang-22
x86_64                randconfig-1012-20261024    clang-22
x86_64                randconfig-1012-20261025    clang-22
x86_64                randconfig-1013-20261023    clang-22
x86_64                randconfig-1013-20261024    clang-22
x86_64                randconfig-1013-20261025    clang-22
x86_64                randconfig-1014-20261023    clang-22
x86_64                randconfig-1014-20261024    clang-22
x86_64                randconfig-1014-20261025    clang-22
x86_64                randconfig-1015-20261023    clang-22
x86_64                randconfig-1015-20261024    clang-22
x86_64                randconfig-1015-20261025    clang-22
x86_64                randconfig-1016-20261023    clang-22
x86_64                randconfig-1016-20261024    clang-22
x86_64                randconfig-1016-20261025    clang-22
x86_64                randconfig-1017-20261023    clang-22
x86_64                randconfig-1017-20261024    clang-22
x86_64                randconfig-1017-20261025    clang-22
x86_64                randconfig-2000-20261020    clang-19
x86_64                randconfig-2000-20261021    clang-24
x86_64                randconfig-2000-20261022    clang-24
x86_64                randconfig-2001-20261020    clang-19
x86_64                randconfig-2001-20261021    clang-24
x86_64                randconfig-2001-20261022    clang-24
x86_64                randconfig-2100-20261020    clang-22   cocci
x86_64                randconfig-2100-20261021    clang-22   cocci
x86_64                randconfig-2100-20261022    gcc-14     cocci
x86_64                randconfig-2101-20261020    clang-22   cocci
x86_64                randconfig-2101-20261021    clang-22   cocci
x86_64                randconfig-2101-20261022    gcc-14     cocci
x86_64                randconfig-2102-20261020    clang-22   cocci
x86_64                randconfig-2102-20261021    clang-22   cocci
x86_64                randconfig-2102-20261022    gcc-14     cocci
x86_64                randconfig-2103-20261020    clang-22   cocci
x86_64                randconfig-2103-20261021    clang-22   cocci
x86_64                randconfig-2103-20261022    gcc-14     cocci
x86_64                randconfig-2104-20261020    clang-22   cocci
x86_64                randconfig-2104-20261021    clang-22   cocci
x86_64                randconfig-2104-20261022    gcc-14     cocci
x86_64                randconfig-2105-20261020    clang-22   cocci
x86_64                randconfig-2105-20261021    clang-22   cocci
x86_64                randconfig-2105-20261022    gcc-14     cocci
x86_64                randconfig-2200-20261020    gcc-14     smatch
x86_64                randconfig-2200-20261021    clang-22   smatch
x86_64                randconfig-2200-20261022    gcc-14     smatch
x86_64                randconfig-2300-20261020    clang-22   sparse
x86_64                randconfig-2300-20261021    clang-22   sparse
x86_64                randconfig-2300-20261022    gcc-14     sparse
x86_64                randconfig-2301-20261020    clang-22   sparse
x86_64                randconfig-2301-20261021    clang-22   sparse
x86_64                randconfig-2301-20261022    gcc-14     sparse
x86_64                randconfig-2302-20261020    clang-22   sparse
x86_64                randconfig-2302-20261021    clang-22   sparse
x86_64                randconfig-2302-20261022    gcc-14     sparse
x86_64               randconfig-r2101-20261021    clang-24   cocci
x86_64               randconfig-r2302-20261021    clang-22   sparse
x86_64               randconfig-r2305-20261021    clang-22   sparse
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
xtensa                            alldefconfig    gcc-16.2.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                   cadence_csp_defconfig    clang-17
xtensa                 generic_kc705_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261022    gcc-12
xtensa                randconfig-1000-20261023    clang-24
xtensa                randconfig-1000-20261024    gcc-14
xtensa                randconfig-1000-20261025    gcc-14
xtensa                randconfig-1001-20261022    gcc-12
xtensa                randconfig-1001-20261023    clang-24
xtensa                randconfig-1001-20261024    gcc-14
xtensa                randconfig-1001-20261025    gcc-14
xtensa                randconfig-2000-20261020    clang-24
xtensa                randconfig-2000-20261021    gcc-16.2.0
xtensa                randconfig-2000-20261022    gcc-15.3.0
xtensa                randconfig-2001-20261020    clang-24
xtensa                randconfig-2001-20261021    gcc-16.2.0
xtensa                randconfig-2001-20261022    gcc-15.3.0
xtensa               randconfig-r2100-20261021    gcc-8.5.0  cocci
xtensa               randconfig-r2104-20261021    gcc-12.5.0 cocci
xtensa               randconfig-r2108-20261021    gcc-8.5.0  cocci
xtensa               randconfig-r2201-20261022    gcc-12.5.0 smatch

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
