Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291572;
	b=w0AE8/x4aEpo+w887pDZW0bhfslv99J1yiF1HnPwgLNwfwlDYmGdIp34zM2j6rW7ty7y
	 GwuHd0gB1lZi/UgcIboedyodbHGtpbPTqSPUk6/G6GWiXOSxXQLXmJY6erj1tO1IMEgFm
	 SlUR1wYKQGAYONGltD3wvFnMFlARN7gCA/3z/GAnEQ1KMQp0TJKdzq9dPGrQDF9YW+ULg
	 S7M4shMFCCaNAfEa7H+cGsWHvXMX886MLFp7shOGRLVirstAYxQlAlUZyKyANtgFwEfTx
	 DW9EjqMf75ie2wvGtRgCj3mdz5HUdSdF4nTnSRgVt9GqhV5THZkjAqF/fRgNPxuZQfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291572;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=pD7lxwsbMPo/noUe/eig/EFT+ChG1DQ69Dk0PUCXyOg=;
	b=p9eP5cB6tUq7ufW5jHWOqtUm9DJuwF4wxT7iHngAv/xZRxYZitR8JJ1bpXSJ6mrhMITO
	 KvMkq6bbKq4jZz26agdpN9rjWVm5oWUyYQWDGRSeBWrm7errOG3sMwWtSOeFD0PGUmLe0
	 DWomc+RV9H3+JV/RQMrkPGjNo0xWSIGivSZL6Rhrn09i2cxlLis7LrpbK7XCimHRo8tHw
	 pal8WgnGTQ1lft2QrOkuhttnInimytVstYy/KnZNfsXK5YFoq0NDMiDwSJQAk9Nvj+PVr
	 Ap81MbiW3TzhdSOxRm8S6Xh7lPSqVj6HLW7gXaKk/bFE32GPrdWBFmmqkPcxbBSZ1Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dQVZSjjt;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C90606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dQVZSjjt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793291571; x=1824827571;
  h=date:from:to:cc:subject:message-id;
  bh=aXi4BD0wlvAlkcupcqJ5Va5Hl0q8VyOa1Hsxi0fl2uE=;
  b=dQVZSjjtPLlWs3ZC21Z8JmWMdILN4lBvbKvKytxcqWyWuJbzpzrTX2hi
   cR2axh4Ly2eZWjsru/ZDxNmGE6ZUVpanU501lecBTOQXf0AotCpQymn7M
   N/kkPYCDv2/seP+gCx1PfQJzaWBvBjwfjuVKlUkb5ugCz3Q3M29f1QapD
   FZkDG0wVqbpXFN9GBism1sdT89B2n676PPHdSUAQuMzbSt58qA1uhAO/A
   gs6ijeCS3PkIflDNmhkwRCaPLPf6heqKhzAP7T7pKVZgQfr04qXvWCviG
   vuTOQcLedFipc1fSmaLMDIc/juPOjhHrU6g2VpuYw6PtnQd754ZNlKgtz
   Q==;
X-CSE-ConnectionGUID: iAnApc+JRSGoe2vsFbkEkw==
X-CSE-MsgGUID: 80JaVlycTSCul+wCtjgGKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2057767"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2057767"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 09:32:47 -0700
X-CSE-ConnectionGUID: xP7TxkkfSOKINGmdgjhmNA==
X-CSE-MsgGUID: FK9Ti18yS9mVNjy1fzeT5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5530109"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2026 09:32:46 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMT3T-00000000aOy-1lrH;
	Thu, 29 Oct 2026 16:32:43 +0000
Date: Fri, 30 Oct 2026 00:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf:urgent] BUILD SUCCESS
 d095321349222961813333277881b3c74f10b17b
Message-ID: <202610300059.H7dStcYI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/urgent
branch HEAD: d095321349222961813333277881b3c74f10b17b  perf: Fix perf_remove_from_context() event scheduling

elapsed time: 7431m

configs tested: 687
configs skipped: 28

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               alldefconfig    clang-17
arc                               allmodconfig    clang-24
arc                               allmodconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-19
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                           axs101_defconfig    gcc-16.2.0
arc                       axs103_smp_defconfig    clang-17
arc                                  defconfig    gcc-16.2.0
arc                             hsdk_defconfig    clang-24
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261025    clang-24
arc                   randconfig-1000-20261026    clang-24
arc                   randconfig-1000-20261027    gcc-10.5.0
arc                   randconfig-1000-20261028    gcc-8.5.0
arc                   randconfig-1000-20261029    clang-24
arc                   randconfig-1001-20261025    clang-24
arc                   randconfig-1001-20261026    clang-24
arc                   randconfig-1001-20261027    gcc-10.5.0
arc                   randconfig-1001-20261028    gcc-8.5.0
arc                   randconfig-1001-20261029    clang-24
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                               allyesconfig    gcc-16.2.0
arm                      am200epdkit_defconfig    gcc-16.2.0
arm                        aspeed_g4_defconfig    gcc-16.2.0
arm                          assabet_defconfig    clang-24
arm                          axm55xx_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                           exynos_defconfig    gcc-16.2.0
arm                       footbridge_defconfig    gcc-16.2.0
arm                            h3600_defconfig    clang-24
arm                             hisi_defconfig    gcc-16.2.0
arm                        imx_v4_v5_defconfig    gcc-16.2.0
arm                            imxrt_defconfig    gcc-16.2.0
arm                    milbeaut_m10v_defconfig    gcc-16.2.0
arm                             mmp2_defconfig    gcc-16.2.0
arm                             mps2_defconfig    clang-24
arm                        multi_v4t_defconfig    gcc-16.2.0
arm                         multi_v5_defconfig    clang-24
arm                         multi_v7_defconfig    gcc-16.2.0
arm                         mvebu_v7_defconfig    gcc-16.2.0
arm                              mxs_defconfig    clang-17
arm                          nhk8815_defconfig    clang-24
arm                        omap2plus_defconfig    gcc-14
arm                          orion5x_defconfig    clang-17
arm                           pxa910_defconfig    gcc-16.2.0
arm                              pxa_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261025    clang-24
arm                   randconfig-1000-20261026    clang-24
arm                   randconfig-1000-20261027    gcc-10.5.0
arm                   randconfig-1000-20261028    gcc-8.5.0
arm                   randconfig-1000-20261029    clang-24
arm                   randconfig-1001-20261025    clang-24
arm                   randconfig-1001-20261026    clang-24
arm                   randconfig-1001-20261027    gcc-10.5.0
arm                   randconfig-1001-20261028    gcc-8.5.0
arm                   randconfig-1001-20261029    clang-24
arm                   randconfig-1002-20261025    clang-24
arm                   randconfig-1002-20261026    clang-24
arm                   randconfig-1002-20261027    gcc-10.5.0
arm                   randconfig-1002-20261028    gcc-8.5.0
arm                   randconfig-1002-20261029    clang-24
arm                   randconfig-1003-20261025    clang-24
arm                   randconfig-1003-20261026    clang-24
arm                   randconfig-1003-20261027    gcc-10.5.0
arm                   randconfig-1003-20261028    gcc-8.5.0
arm                   randconfig-1003-20261029    clang-24
arm                          s3c6400_defconfig    gcc-16.2.0
arm                          s5pv210_defconfig    clang-24
arm                        spear13xx_defconfig    clang-24
arm                         spear3xx_defconfig    gcc-16.2.0
arm                            tegra_defconfig    clang-24
arm                        versatile_defconfig    clang-24
arm                     vt8500_v6_v7_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261025    clang-24
arm64                 randconfig-1000-20261026    clang-24
arm64                 randconfig-1000-20261027    gcc-8.5.0
arm64                 randconfig-1000-20261028    clang-22
arm64                 randconfig-1000-20261029    gcc-8.5.0
arm64                 randconfig-1001-20261025    clang-24
arm64                 randconfig-1001-20261026    clang-24
arm64                 randconfig-1001-20261027    gcc-8.5.0
arm64                 randconfig-1001-20261028    clang-22
arm64                 randconfig-1001-20261029    gcc-8.5.0
arm64                 randconfig-1002-20261025    clang-24
arm64                 randconfig-1002-20261026    clang-24
arm64                 randconfig-1002-20261027    gcc-8.5.0
arm64                 randconfig-1002-20261028    clang-22
arm64                 randconfig-1002-20261029    gcc-8.5.0
arm64                 randconfig-1003-20261025    clang-24
arm64                 randconfig-1003-20261026    clang-24
arm64                 randconfig-1003-20261027    gcc-8.5.0
arm64                 randconfig-1003-20261028    clang-22
arm64                 randconfig-1003-20261029    gcc-8.5.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261025    clang-24
csky                  randconfig-1000-20261026    clang-24
csky                  randconfig-1000-20261027    gcc-8.5.0
csky                  randconfig-1000-20261028    clang-22
csky                  randconfig-1000-20261029    gcc-8.5.0
csky                  randconfig-1001-20261025    clang-24
csky                  randconfig-1001-20261026    clang-24
csky                  randconfig-1001-20261027    gcc-8.5.0
csky                  randconfig-1001-20261028    clang-22
csky                  randconfig-1001-20261029    gcc-8.5.0
hexagon                           alldefconfig    clang-17
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261025    clang-24
hexagon               randconfig-1000-20261026    clang-24
hexagon               randconfig-1000-20261027    clang-24
hexagon               randconfig-1000-20261028    clang-17
hexagon               randconfig-1000-20261029    clang-24
hexagon               randconfig-1001-20261025    clang-24
hexagon               randconfig-1001-20261026    clang-24
hexagon               randconfig-1001-20261027    clang-24
hexagon               randconfig-1001-20261028    clang-17
hexagon               randconfig-1001-20261029    clang-24
i386                              alldefconfig    clang-24
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261025    gcc-14
i386        buildonly-randconfig-1000-20261026    clang-22
i386        buildonly-randconfig-1000-20261027    clang-22
i386        buildonly-randconfig-1000-20261028    clang-22
i386        buildonly-randconfig-1000-20261029    gcc-14
i386        buildonly-randconfig-1001-20261025    gcc-14
i386        buildonly-randconfig-1001-20261026    clang-22
i386        buildonly-randconfig-1001-20261027    clang-22
i386        buildonly-randconfig-1001-20261028    clang-22
i386        buildonly-randconfig-1001-20261029    gcc-14
i386        buildonly-randconfig-1002-20261025    gcc-14
i386        buildonly-randconfig-1002-20261026    clang-22
i386        buildonly-randconfig-1002-20261027    clang-22
i386        buildonly-randconfig-1002-20261028    clang-22
i386        buildonly-randconfig-1002-20261029    gcc-14
i386        buildonly-randconfig-1003-20261025    gcc-14
i386        buildonly-randconfig-1003-20261026    clang-22
i386        buildonly-randconfig-1003-20261027    clang-22
i386        buildonly-randconfig-1003-20261028    clang-22
i386        buildonly-randconfig-1003-20261029    gcc-14
i386        buildonly-randconfig-1004-20261025    gcc-14
i386        buildonly-randconfig-1004-20261026    clang-22
i386        buildonly-randconfig-1004-20261027    clang-22
i386        buildonly-randconfig-1004-20261028    clang-22
i386        buildonly-randconfig-1004-20261029    gcc-14
i386        buildonly-randconfig-1005-20261025    gcc-14
i386        buildonly-randconfig-1005-20261026    clang-22
i386        buildonly-randconfig-1005-20261027    clang-22
i386        buildonly-randconfig-1005-20261028    clang-22
i386        buildonly-randconfig-1005-20261029    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261025    clang-22
i386                  randconfig-1000-20261026    gcc-14
i386                  randconfig-1000-20261027    gcc-14
i386                  randconfig-1000-20261028    gcc-14
i386                  randconfig-1000-20261029    clang-22
i386                  randconfig-1001-20261025    clang-22
i386                  randconfig-1001-20261026    gcc-14
i386                  randconfig-1001-20261027    gcc-14
i386                  randconfig-1001-20261028    gcc-14
i386                  randconfig-1001-20261029    clang-22
i386                  randconfig-1002-20261025    clang-22
i386                  randconfig-1002-20261026    gcc-14
i386                  randconfig-1002-20261027    gcc-14
i386                  randconfig-1002-20261028    gcc-14
i386                  randconfig-1002-20261029    clang-22
i386                  randconfig-1003-20261025    clang-22
i386                  randconfig-1003-20261026    gcc-14
i386                  randconfig-1003-20261027    gcc-14
i386                  randconfig-1003-20261028    gcc-14
i386                  randconfig-1003-20261029    clang-22
i386                  randconfig-1004-20261025    clang-22
i386                  randconfig-1004-20261026    gcc-14
i386                  randconfig-1004-20261027    gcc-14
i386                  randconfig-1004-20261028    gcc-14
i386                  randconfig-1004-20261029    clang-22
i386                  randconfig-1005-20261025    clang-22
i386                  randconfig-1005-20261026    gcc-14
i386                  randconfig-1005-20261027    gcc-14
i386                  randconfig-1005-20261028    gcc-14
i386                  randconfig-1005-20261029    clang-22
i386                  randconfig-1006-20261025    clang-22
i386                  randconfig-1006-20261026    gcc-14
i386                  randconfig-1006-20261027    gcc-14
i386                  randconfig-1006-20261028    gcc-14
i386                  randconfig-1006-20261029    clang-22
i386                  randconfig-1007-20261025    gcc-14
i386                  randconfig-1007-20261026    clang-22
i386                  randconfig-1007-20261027    gcc-14
i386                  randconfig-1007-20261028    clang-22
i386                  randconfig-1007-20261029    clang-22
i386                  randconfig-1008-20261025    gcc-14
i386                  randconfig-1008-20261026    clang-22
i386                  randconfig-1008-20261027    gcc-14
i386                  randconfig-1008-20261028    clang-22
i386                  randconfig-1008-20261029    clang-22
i386                  randconfig-1009-20261025    gcc-14
i386                  randconfig-1009-20261026    clang-22
i386                  randconfig-1009-20261027    gcc-14
i386                  randconfig-1009-20261028    clang-22
i386                  randconfig-1009-20261029    clang-22
i386                  randconfig-1010-20261025    gcc-14
i386                  randconfig-1010-20261026    clang-22
i386                  randconfig-1010-20261027    gcc-14
i386                  randconfig-1010-20261028    clang-22
i386                  randconfig-1010-20261029    clang-22
i386                  randconfig-1011-20261025    gcc-14
i386                  randconfig-1011-20261026    clang-22
i386                  randconfig-1011-20261027    gcc-14
i386                  randconfig-1011-20261028    clang-22
i386                  randconfig-1011-20261029    clang-22
i386                  randconfig-1012-20261025    gcc-14
i386                  randconfig-1012-20261026    clang-22
i386                  randconfig-1012-20261027    gcc-14
i386                  randconfig-1012-20261028    clang-22
i386                  randconfig-1012-20261029    clang-22
i386                  randconfig-1013-20261025    gcc-14
i386                  randconfig-1013-20261026    clang-22
i386                  randconfig-1013-20261027    gcc-14
i386                  randconfig-1013-20261028    clang-22
i386                  randconfig-1013-20261029    clang-22
loongarch                         alldefconfig    gcc-16.2.0
loongarch                         allmodconfig    clang-19
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261025    clang-24
loongarch             randconfig-1000-20261026    clang-24
loongarch             randconfig-1000-20261027    clang-24
loongarch             randconfig-1000-20261028    clang-17
loongarch             randconfig-1000-20261029    clang-24
loongarch             randconfig-1001-20261025    clang-24
loongarch             randconfig-1001-20261026    clang-24
loongarch             randconfig-1001-20261027    clang-24
loongarch             randconfig-1001-20261028    clang-17
loongarch             randconfig-1001-20261029    clang-24
m68k                              alldefconfig    gcc-16.2.0
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                           amiga_defconfig    clang-17
m68k                           amiga_defconfig    clang-22
m68k                           amiga_defconfig    gcc-16.2.0
m68k                          apollo_defconfig    clang-17
m68k                          apollo_defconfig    clang-24
m68k                        bvme6000_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                         m5272c3_defconfig    clang-24
m68k                         m5272c3_defconfig    gcc-16.2.0
m68k                        m5275evb_defconfig    clang-17
m68k                        m5275evb_defconfig    clang-22
m68k                        m5275evb_defconfig    gcc-16.2.0
m68k                        m5282evb_defconfig    clang-24
m68k                        m5329evb_defconfig    clang-17
m68k                        m5475evb_defconfig    clang-24
m68k                         mvme147_defconfig    clang-17
m68k                         mvme147_defconfig    gcc-16.2.0
m68k                          nettel_defconfig    gcc-16.2.0
m68k                         stmark2_defconfig    clang-24
microblaze                        alldefconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                         bcm47xx_defconfig    clang-17
mips                            ci20_defconfig    clang-17
mips                          cobalt_defconfig    gcc-16.2.0
mips                   decstation_64_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                  decstation_r4k_defconfig    gcc-16.2.0
mips                 econet_en751221_defconfig    gcc-16.2.0
mips                            gcw0_defconfig    clang-17
mips                            gcw0_defconfig    clang-24
mips                            ip32_defconfig    gcc-16.2.0
mips                        lemote2f_defconfig    clang-22
mips                       loongson1_defconfig    gcc-14
mips                       loongson1_defconfig    gcc-16.2.0
mips                       malta_kvm_defconfig    gcc-14
mips                       maltaaprp_defconfig    clang-17
mips                         maltaup_defconfig    gcc-14
mips                     maltaup_xpa_defconfig    gcc-16.2.0
mips                            mtx1_defconfig    gcc-16.2.0
mips                         qi_lb60_defconfig    clang-17
mips                           rb532_defconfig    clang-24
mips                           rm200_defconfig    clang-24
mips                            xway_defconfig    gcc-16.2.0
nios2                          3c120_defconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261025    clang-24
nios2                 randconfig-1000-20261026    clang-24
nios2                 randconfig-1000-20261027    clang-24
nios2                 randconfig-1000-20261028    clang-17
nios2                 randconfig-1000-20261029    clang-24
nios2                 randconfig-1001-20261025    clang-24
nios2                 randconfig-1001-20261026    clang-24
nios2                 randconfig-1001-20261027    clang-24
nios2                 randconfig-1001-20261028    clang-17
nios2                 randconfig-1001-20261029    clang-24
openrisc                          alldefconfig    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    gcc-16.2.0
openrisc                             defconfig    gcc-16.2.0
openrisc                     or1ksim_defconfig    clang-24
openrisc                     or1ksim_defconfig    gcc-16.2.0
openrisc                        virt_defconfig    clang-24
parisc                            alldefconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261025    clang-24
parisc                randconfig-1000-20261026    gcc-14.4.0
parisc                randconfig-1000-20261027    clang-22
parisc                randconfig-1000-20261028    clang-19
parisc                randconfig-1000-20261029    clang-17
parisc                randconfig-1001-20261025    clang-24
parisc                randconfig-1001-20261026    gcc-14.4.0
parisc                randconfig-1001-20261027    clang-22
parisc                randconfig-1001-20261028    clang-19
parisc                randconfig-1001-20261029    clang-17
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    gcc-16.2.0
powerpc                      asp8347_defconfig    clang-24
powerpc                       bamboo_defconfig    clang-24
powerpc                       bamboo_defconfig    gcc-16.2.0
powerpc                  canyonlands_defconfig    clang-22
powerpc                       cm5200_defconfig    clang-24
powerpc                    currituck_defconfig    clang-17
powerpc                    currituck_defconfig    gcc-16.2.0
powerpc                      ep8248e_defconfig    clang-22
powerpc                      ep8248e_defconfig    gcc-16.2.0
powerpc                           g5_defconfig    clang-24
powerpc                     ge_imp3a_defconfig    clang-24
powerpc                         icon_defconfig    gcc-16.2.0
powerpc                   iss476-smp_defconfig    gcc-16.2.0
powerpc                    motionpro_defconfig    clang-24
powerpc                      mpc5200_defconfig    clang-17
powerpc                      mpc5200_defconfig    clang-24
powerpc                  mpc8313_rdb_defconfig    clang-24
powerpc                  mpc8315_rdb_defconfig    gcc-16.2.0
powerpc                  mpc834x_itx_defconfig    clang-24
powerpc                mpc834x_itxgp_defconfig    gcc-16.2.0
powerpc                  mpc836x_rdk_defconfig    clang-17
powerpc                      mpc83xx_defconfig    gcc-16.2.0
powerpc                     mvme5100_defconfig    clang-24
powerpc                     mvme5100_defconfig    gcc-16.2.0
powerpc                       pasemi_defconfig    clang-24
powerpc                      powernv_defconfig    gcc-16.2.0
powerpc                       ppc44x_defconfig    clang-24
powerpc                       ppc44x_defconfig    gcc-16.2.0
powerpc                       ppc64e_defconfig    clang-24
powerpc               randconfig-1000-20261025    clang-24
powerpc               randconfig-1000-20261026    gcc-14.4.0
powerpc               randconfig-1000-20261027    clang-22
powerpc               randconfig-1000-20261028    clang-19
powerpc               randconfig-1000-20261029    clang-17
powerpc               randconfig-1001-20261025    clang-24
powerpc               randconfig-1001-20261026    gcc-14.4.0
powerpc               randconfig-1001-20261027    clang-22
powerpc               randconfig-1001-20261028    clang-19
powerpc               randconfig-1001-20261029    clang-17
powerpc                     sam440ep_defconfig    clang-17
powerpc                     sam440ep_defconfig    clang-22
powerpc                     sam440ep_defconfig    clang-24
powerpc                      skiroot_defconfig    clang-24
powerpc                     socrates_defconfig    gcc-16.2.0
powerpc                   storcenter_defconfig    clang-24
powerpc                      stx_gp3_defconfig    clang-17
powerpc                      stx_gp3_defconfig    gcc-14
powerpc                      tqm8540_defconfig    gcc-16.2.0
powerpc                      tqm8548_defconfig    gcc-16.2.0
powerpc                      tqm8555_defconfig    clang-24
powerpc                      tqm8560_defconfig    clang-17
powerpc                         warp_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261025    clang-24
powerpc64             randconfig-1000-20261026    gcc-14.4.0
powerpc64             randconfig-1000-20261027    clang-22
powerpc64             randconfig-1000-20261028    clang-19
powerpc64             randconfig-1000-20261029    clang-17
powerpc64             randconfig-1001-20261025    clang-24
powerpc64             randconfig-1001-20261026    gcc-14.4.0
powerpc64             randconfig-1001-20261027    clang-22
powerpc64             randconfig-1001-20261028    clang-19
powerpc64             randconfig-1001-20261029    clang-17
riscv                             alldefconfig    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                     nommu_virt_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261025    gcc-10.5.0
riscv                 randconfig-1000-20261026    gcc-13.5.0
riscv                 randconfig-1000-20261027    gcc-16.2.0
riscv                 randconfig-1000-20261028    gcc-11.5.0
riscv                 randconfig-1000-20261029    gcc-10.5.0
riscv                 randconfig-1001-20261025    gcc-10.5.0
riscv                 randconfig-1001-20261026    gcc-13.5.0
riscv                 randconfig-1001-20261027    gcc-16.2.0
riscv                 randconfig-1001-20261028    gcc-11.5.0
riscv                 randconfig-1001-20261029    gcc-10.5.0
s390                              alldefconfig    gcc-16.2.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261025    gcc-10.5.0
s390                  randconfig-1000-20261026    gcc-13.5.0
s390                  randconfig-1000-20261027    gcc-16.2.0
s390                  randconfig-1000-20261028    gcc-11.5.0
s390                  randconfig-1000-20261029    gcc-10.5.0
s390                  randconfig-1001-20261025    gcc-10.5.0
s390                  randconfig-1001-20261026    gcc-13.5.0
s390                  randconfig-1001-20261027    gcc-16.2.0
s390                  randconfig-1001-20261028    gcc-11.5.0
s390                  randconfig-1001-20261029    gcc-10.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                allyesconfig    gcc-16.2.0
sh                          ap325rxa_defconfig    clang-24
sh                          ap325rxa_defconfig    gcc-16.2.0
sh                          apsh4a3a_defconfig    clang-24
sh                          apsh4a3a_defconfig    gcc-14
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    clang-22
sh                         dreamcast_defconfig    gcc-16.2.0
sh                         edosk7705_defconfig    gcc-16.2.0
sh                             hp6xx_defconfig    clang-24
sh                                j2_defconfig    clang-24
sh                                j2_defconfig    gcc-16.2.0
sh                  kfr2r09-romimage_defconfig    clang-24
sh                           polaris_defconfig    gcc-16.2.0
sh                           r7780mp_defconfig    clang-17
sh                           r7780mp_defconfig    clang-24
sh                    randconfig-1000-20261025    gcc-10.5.0
sh                    randconfig-1000-20261026    gcc-13.5.0
sh                    randconfig-1000-20261027    gcc-16.2.0
sh                    randconfig-1000-20261028    gcc-11.5.0
sh                    randconfig-1000-20261029    gcc-10.5.0
sh                    randconfig-1001-20261025    gcc-10.5.0
sh                    randconfig-1001-20261026    gcc-13.5.0
sh                    randconfig-1001-20261027    gcc-16.2.0
sh                    randconfig-1001-20261028    gcc-11.5.0
sh                    randconfig-1001-20261029    gcc-10.5.0
sh                           rsk7201_defconfig    clang-22
sh                           rsk7201_defconfig    gcc-16.2.0
sh                           rsk7264_defconfig    gcc-16.2.0
sh                            se7206_defconfig    gcc-16.2.0
sh                            se7343_defconfig    clang-24
sh                            se7619_defconfig    clang-24
sh                            se7712_defconfig    gcc-16.2.0
sh                            se7721_defconfig    gcc-16.2.0
sh                            se7722_defconfig    gcc-16.2.0
sh                            se7751_defconfig    gcc-16.2.0
sh                            se7780_defconfig    clang-24
sh                    secureedge5410_defconfig    clang-24
sh                              sh03_defconfig    gcc-14
sh                    sh7724_generic_defconfig    gcc-16.2.0
sh                         sh7785lcr_defconfig    gcc-16.2.0
sh                             shmin_defconfig    gcc-16.2.0
sh                             titan_defconfig    clang-24
sh                             titan_defconfig    gcc-16.2.0
sh                               ul2_defconfig    gcc-16.2.0
sh                           urquell_defconfig    gcc-16.2.0
sparc                             alldefconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261025    gcc-14
sparc                 randconfig-1000-20261026    gcc-14
sparc                 randconfig-1000-20261027    clang-20
sparc                 randconfig-1000-20261028    gcc-12
sparc                 randconfig-1000-20261029    clang-24
sparc                 randconfig-1001-20261025    gcc-14
sparc                 randconfig-1001-20261026    gcc-14
sparc                 randconfig-1001-20261027    clang-20
sparc                 randconfig-1001-20261028    gcc-12
sparc                 randconfig-1001-20261029    clang-24
sparc                        sparc32_defconfig    gcc-16.2.0
sparc                        sparc64_defconfig    clang-24
sparc                        sparc64_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261025    gcc-14
sparc64               randconfig-1000-20261026    gcc-14
sparc64               randconfig-1000-20261027    clang-20
sparc64               randconfig-1000-20261028    gcc-12
sparc64               randconfig-1000-20261029    clang-24
sparc64               randconfig-1001-20261025    gcc-14
sparc64               randconfig-1001-20261026    gcc-14
sparc64               randconfig-1001-20261027    clang-20
sparc64               randconfig-1001-20261028    gcc-12
sparc64               randconfig-1001-20261029    clang-24
um                                alldefconfig    gcc-16.2.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261025    gcc-14
um                    randconfig-1000-20261026    gcc-14
um                    randconfig-1000-20261027    clang-20
um                    randconfig-1000-20261028    gcc-12
um                    randconfig-1000-20261029    clang-24
um                    randconfig-1001-20261025    gcc-14
um                    randconfig-1001-20261026    gcc-14
um                    randconfig-1001-20261027    clang-20
um                    randconfig-1001-20261028    gcc-12
um                    randconfig-1001-20261029    clang-24
um                            x86_64_defconfig    clang-24
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    clang-24
x86_64                            alldefconfig    gcc-16.2.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261025    gcc-14
x86_64      buildonly-randconfig-1000-20261026    clang-22
x86_64      buildonly-randconfig-1000-20261027    gcc-14
x86_64      buildonly-randconfig-1000-20261028    clang-22
x86_64      buildonly-randconfig-1000-20261029    gcc-14
x86_64      buildonly-randconfig-1001-20261025    gcc-14
x86_64      buildonly-randconfig-1001-20261026    clang-22
x86_64      buildonly-randconfig-1001-20261027    gcc-14
x86_64      buildonly-randconfig-1001-20261028    clang-22
x86_64      buildonly-randconfig-1001-20261029    gcc-14
x86_64      buildonly-randconfig-1002-20261025    gcc-14
x86_64      buildonly-randconfig-1002-20261026    clang-22
x86_64      buildonly-randconfig-1002-20261027    gcc-14
x86_64      buildonly-randconfig-1002-20261028    clang-22
x86_64      buildonly-randconfig-1002-20261029    gcc-14
x86_64      buildonly-randconfig-1003-20261025    gcc-14
x86_64      buildonly-randconfig-1003-20261026    clang-22
x86_64      buildonly-randconfig-1003-20261027    gcc-14
x86_64      buildonly-randconfig-1003-20261028    clang-22
x86_64      buildonly-randconfig-1003-20261029    gcc-14
x86_64      buildonly-randconfig-1004-20261025    gcc-14
x86_64      buildonly-randconfig-1004-20261026    clang-22
x86_64      buildonly-randconfig-1004-20261027    gcc-14
x86_64      buildonly-randconfig-1004-20261028    clang-22
x86_64      buildonly-randconfig-1004-20261029    gcc-14
x86_64      buildonly-randconfig-1005-20261025    gcc-14
x86_64      buildonly-randconfig-1005-20261026    clang-22
x86_64      buildonly-randconfig-1005-20261027    gcc-14
x86_64      buildonly-randconfig-1005-20261028    clang-22
x86_64      buildonly-randconfig-1005-20261029    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261025    clang-22
x86_64                randconfig-1000-20261026    clang-22
x86_64                randconfig-1000-20261027    gcc-14
x86_64                randconfig-1000-20261028    clang-22
x86_64                randconfig-1000-20261029    clang-22
x86_64                randconfig-1001-20261025    clang-22
x86_64                randconfig-1001-20261026    clang-22
x86_64                randconfig-1001-20261027    gcc-14
x86_64                randconfig-1001-20261028    clang-22
x86_64                randconfig-1001-20261029    clang-22
x86_64                randconfig-1002-20261025    clang-22
x86_64                randconfig-1002-20261026    clang-22
x86_64                randconfig-1002-20261027    gcc-14
x86_64                randconfig-1002-20261028    clang-22
x86_64                randconfig-1002-20261029    clang-22
x86_64                randconfig-1003-20261025    clang-22
x86_64                randconfig-1003-20261026    clang-22
x86_64                randconfig-1003-20261027    gcc-14
x86_64                randconfig-1003-20261028    clang-22
x86_64                randconfig-1003-20261029    clang-22
x86_64                randconfig-1004-20261025    clang-22
x86_64                randconfig-1004-20261026    clang-22
x86_64                randconfig-1004-20261027    gcc-14
x86_64                randconfig-1004-20261028    clang-22
x86_64                randconfig-1004-20261029    clang-22
x86_64                randconfig-1005-20261025    clang-22
x86_64                randconfig-1005-20261026    clang-22
x86_64                randconfig-1005-20261027    gcc-14
x86_64                randconfig-1005-20261028    clang-22
x86_64                randconfig-1005-20261029    clang-22
x86_64                randconfig-1006-20261025    clang-22
x86_64                randconfig-1006-20261026    gcc-14
x86_64                randconfig-1006-20261027    clang-22
x86_64                randconfig-1006-20261028    gcc-14
x86_64                randconfig-1006-20261029    gcc-14
x86_64                randconfig-1007-20261025    clang-22
x86_64                randconfig-1007-20261026    gcc-14
x86_64                randconfig-1007-20261027    clang-22
x86_64                randconfig-1007-20261028    gcc-14
x86_64                randconfig-1007-20261029    gcc-14
x86_64                randconfig-1008-20261025    clang-22
x86_64                randconfig-1008-20261026    gcc-14
x86_64                randconfig-1008-20261027    clang-22
x86_64                randconfig-1008-20261028    gcc-14
x86_64                randconfig-1008-20261029    gcc-14
x86_64                randconfig-1009-20261025    clang-22
x86_64                randconfig-1009-20261026    gcc-14
x86_64                randconfig-1009-20261027    clang-22
x86_64                randconfig-1009-20261028    gcc-14
x86_64                randconfig-1009-20261029    gcc-14
x86_64                randconfig-1010-20261025    clang-22
x86_64                randconfig-1010-20261026    gcc-14
x86_64                randconfig-1010-20261027    clang-22
x86_64                randconfig-1010-20261028    gcc-14
x86_64                randconfig-1010-20261029    gcc-14
x86_64                randconfig-1011-20261025    clang-22
x86_64                randconfig-1011-20261026    gcc-14
x86_64                randconfig-1011-20261027    clang-22
x86_64                randconfig-1011-20261028    gcc-14
x86_64                randconfig-1011-20261029    gcc-14
x86_64                randconfig-1012-20261025    clang-22
x86_64                randconfig-1012-20261026    gcc-14
x86_64                randconfig-1012-20261027    clang-22
x86_64                randconfig-1012-20261028    gcc-12
x86_64                randconfig-1012-20261029    clang-22
x86_64                randconfig-1013-20261025    clang-22
x86_64                randconfig-1013-20261026    gcc-14
x86_64                randconfig-1013-20261027    clang-22
x86_64                randconfig-1013-20261028    gcc-12
x86_64                randconfig-1013-20261029    clang-22
x86_64                randconfig-1014-20261025    clang-22
x86_64                randconfig-1014-20261026    gcc-14
x86_64                randconfig-1014-20261027    clang-22
x86_64                randconfig-1014-20261028    gcc-12
x86_64                randconfig-1014-20261029    clang-22
x86_64                randconfig-1015-20261025    clang-22
x86_64                randconfig-1015-20261026    gcc-14
x86_64                randconfig-1015-20261027    clang-22
x86_64                randconfig-1015-20261028    gcc-12
x86_64                randconfig-1015-20261029    clang-22
x86_64                randconfig-1016-20261025    clang-22
x86_64                randconfig-1016-20261026    gcc-14
x86_64                randconfig-1016-20261027    clang-22
x86_64                randconfig-1016-20261028    gcc-12
x86_64                randconfig-1016-20261029    clang-22
x86_64                randconfig-1017-20261025    clang-22
x86_64                randconfig-1017-20261026    gcc-14
x86_64                randconfig-1017-20261027    clang-22
x86_64                randconfig-1017-20261028    gcc-12
x86_64                randconfig-1017-20261029    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                   audio_kc705_defconfig    gcc-16.2.0
xtensa                   cadence_csp_defconfig    clang-24
xtensa                        common_defconfig    gcc-16.2.0
xtensa                 generic_kc705_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261025    gcc-14
xtensa                randconfig-1000-20261026    gcc-14
xtensa                randconfig-1000-20261027    clang-20
xtensa                randconfig-1000-20261028    gcc-12
xtensa                randconfig-1000-20261029    clang-24
xtensa                randconfig-1001-20261025    gcc-14
xtensa                randconfig-1001-20261026    gcc-14
xtensa                randconfig-1001-20261027    clang-20
xtensa                randconfig-1001-20261028    gcc-12
xtensa                randconfig-1001-20261029    clang-24
xtensa                          virt_defconfig    gcc-16.2.0
xtensa                     xip_kc705_defconfig    clang-17
xtensa                     xip_kc705_defconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
