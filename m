Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833441;
	b=KIT/k2V8SrkLuhcumHsJ8pR92Am+EGjHWHaL5lib95jRenTdNbU8kLxEBd9jMbqBS3w9
	 4F36d6xphQVLtA1kXpkpR2hCcI3qFKfahc76/wgVSL+xYZAeCsBfuK2GUUlZ4WjbzlO8D
	 2sk/5NIy/vcbEUh6HESAFiFS6JvqF78zF0ovZ/FfVkakNEgHHTdcqHanAvQYxybcF8zFj
	 N+Twefq6jqJYajkn0Mg2d8jxMbQiEaj6WNca4FquZ7HRfJJ6dkfyaK/uI9nIUIIbQEV8a
	 rXDff6Lc2rr10VAbiOgt/rBqiYaAWU1SonVtweDMshPKUtnIeiz1q3eu0svoD24HVaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833441;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Tia7JI8GJX7VdewkEEg9ZhUa0dq73AqZo89K8b/QS/E=;
	b=e+QEm63ye2N6UROyCdL/422dnryqyaISR2WeNAoChFO1+YQi4YTSEreDSZynni1WTbUV
	 K3KAZopPu3FK+v+umZ2CcT+5QDY9Tef/GSxddAuYf1koi55OINrtUru/ra+tqLOzelI54
	 qXkoSAZrz/zEf9Cmw1zmpbYPi5QwpHTJp7DWGD319dKHZbXpFHjQYPTQRMjGvewdNvkmw
	 sUPMjOyZSBCv6j20bR6WJEOG80uVQOWCY4TLeS1wf3NKhMPhOeTP8Jkq0sjIkMLpkXCk5
	 Ga8I33GEG6u1geynT0RjKmWpOKa8rs5PceiYnXYy1rQbKK/tGiS7NpljsnOQsN2RjKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=no4GLZG1;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF44606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFF44606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=no4GLZG1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794833441; x=1826369441;
  h=date:from:to:cc:subject:message-id;
  bh=pZPgg8RWp17mkcul6OOb3YiDVmNDu2Tuz3OlcnbUOoM=;
  b=no4GLZG1xetRDcnK8RhUXdFmvMtH7OBjsvqqAM/JyLBznLoqdrFqjs5S
   v7l20bJm0JKa8y4ooe2CWV4HBhRpd4mB+/7igdxfdu1i60dn/78Fdw2cJ
   AW8MLx3PUPSAPFQwmx/67iYmlSVf731sYJjdk+rQmsZQ2+nrYiXsNK+5a
   cWqVYWsWRGINGli/YAfgGcfwKj7f4rvdwHM6H+pkKIkrGCjLX4iJatd9U
   iW5O4YrOiKBlehydX3peNy422B0Vd7yUrEoSmlj18zoT/cFECrZ2R61F3
   /tlOuDaKtGocHDeEQHxSKjJAVC+5J6hVy92JXANMql9Ui6Kxk5bYaJNNZ
   g==;
X-CSE-ConnectionGUID: 2jqFZvExTI6GVCJX0oBNIg==
X-CSE-MsgGUID: 8Q6rpOYNSMacrWNwTEPKBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3462889"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3462889"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 04:50:41 -0800
X-CSE-ConnectionGUID: ugge3mNdSKmR2EtLGz4VZw==
X-CSE-MsgGUID: aJnHST2IR7ezuls5X8Q1kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9386104"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Nov 2026 04:50:39 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSwAO-000000018Ym-39h6;
	Mon, 16 Nov 2026 12:50:36 +0000
Date: Mon, 16 Nov 2026 20:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 ff8a2f3c5727f8dea474b80402bd306b1630e2db
Message-ID: <20261116204939.sTStu2Aq-lkp@intel.com>
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
branch HEAD: ff8a2f3c5727f8dea474b80402bd306b1630e2db  Merge branch into tip/master: 'x86/sev'

elapsed time: 962m

configs tested: 467
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261115    gcc-14.4.0
alpha                 randconfig-2000-20261115    gcc-8.5.0
alpha                 randconfig-2001-20261115    gcc-16.2.0
alpha                 randconfig-2001-20261115    gcc-8.5.0
alpha                 randconfig-2200-20261115    gcc-8.5.0  smatch
alpha                randconfig-r2106-20261115    gcc-10.5.0 cocci
alpha                randconfig-r2301-20261115    gcc-10.5.0 sparse
alpha                randconfig-r2306-20261115    gcc-8.5.0  sparse
alpha                randconfig-r2308-20261115    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261116    gcc-8.5.0
arc                   randconfig-1001-20261116    gcc-8.5.0
arc                   randconfig-2000-20261115    gcc-8.5.0
arc                   randconfig-2001-20261115    gcc-16.2.0
arc                   randconfig-2001-20261115    gcc-8.5.0
arc                   randconfig-2002-20261115    gcc-14.4.0
arc                   randconfig-2002-20261115    gcc-8.5.0
arc                   randconfig-2003-20261115    gcc-16.2.0
arc                   randconfig-2003-20261115    gcc-8.5.0
arc                   randconfig-2004-20261115    gcc-8.5.0
arc                   randconfig-2005-20261115    gcc-8.5.0
arc                   randconfig-2200-20261115    gcc-16.2.0 smatch
arc                  randconfig-r2101-20261115    gcc-8.5.0  cocci
arc                  randconfig-r2103-20261115    gcc-8.5.0  cocci
arc                  randconfig-r2105-20261115    gcc-11.5.0 cocci
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          at91_dt_defconfig    gcc-16.2.0
arm                      davinci_all_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                           gemini_defconfig    clang-24
arm                        imx_v4_v5_defconfig    clang-24
arm                           moxart_defconfig    clang-24
arm                             mps2_defconfig    clang-24
arm                        multi_v4t_defconfig    clang-24
arm                              mxs_defconfig    clang-17
arm                         neponset_defconfig    gcc-16.2.0
arm                          orion5x_defconfig    gcc-16.2.0
arm                              pxa_defconfig    gcc-14
arm                   randconfig-1000-20261116    gcc-8.5.0
arm                   randconfig-1001-20261116    gcc-8.5.0
arm                   randconfig-1002-20261116    gcc-8.5.0
arm                   randconfig-1003-20261116    gcc-8.5.0
arm                   randconfig-2000-20261115    clang-24
arm                   randconfig-2001-20261115    clang-24
arm                   randconfig-2001-20261115    gcc-10.5.0
arm                   randconfig-2002-20261115    clang-24
arm                   randconfig-2002-20261115    gcc-8.5.0
arm                   randconfig-2200-20261115    clang-17   smatch
arm                  randconfig-r2100-20261115    gcc-11.5.0 cocci
arm                  randconfig-r2306-20261115    gcc-11.5.0 sparse
arm                  randconfig-r2309-20261115    clang-22   sparse
arm                         realview_defconfig    clang-17
arm                            tegra_defconfig    gcc-16.2.0
arm                         vexpress_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261116    gcc-10.5.0
arm64                 randconfig-1001-20261116    gcc-10.5.0
arm64                 randconfig-1002-20261116    gcc-10.5.0
arm64                 randconfig-1003-20261116    gcc-10.5.0
arm64                 randconfig-2000-20261115    clang-24
arm64                 randconfig-2000-20261115    gcc-13.5.0
arm64                 randconfig-2001-20261115    clang-22
arm64                 randconfig-2001-20261115    clang-24
arm64                 randconfig-2002-20261115    clang-24
arm64                 randconfig-2002-20261115    gcc-8.5.0
arm64                 randconfig-2200-20261115    gcc-15.3.0 smatch
arm64                randconfig-r2102-20261115    clang-24   cocci
arm64                randconfig-r2102-20261115    gcc-11.5.0 cocci
arm64                randconfig-r2108-20261115    gcc-8.5.0  cocci
arm64                randconfig-r2110-20261115    gcc-11.5.0 cocci
arm64                randconfig-r2111-20261115    clang-18   cocci
arm64                randconfig-r2306-20261115    clang-20   sparse
arm64                randconfig-r2308-20261115    clang-18   sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261116    gcc-10.5.0
csky                  randconfig-1001-20261116    gcc-10.5.0
csky                  randconfig-2000-20261115    gcc-14.4.0
csky                  randconfig-2001-20261115    gcc-12.5.0
csky                  randconfig-2001-20261115    gcc-14.4.0
csky                  randconfig-2200-20261115    gcc-12.5.0 smatch
csky                 randconfig-r2109-20261115    gcc-8.5.0  cocci
csky                 randconfig-r2300-20261115    gcc-9.5.0  sparse
csky                 randconfig-r2301-20261115    gcc-16.2.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261116    clang-17
hexagon               randconfig-1001-20261116    clang-17
hexagon               randconfig-2000-20261115    clang-24
hexagon               randconfig-2000-20261115    gcc-14.4.0
hexagon               randconfig-2001-20261115    clang-24
hexagon               randconfig-2001-20261115    gcc-14.4.0
hexagon               randconfig-2200-20261115    clang-24   smatch
hexagon              randconfig-r2101-20261115    clang-24   cocci
hexagon              randconfig-r2101-20261115    gcc-9.5.0  cocci
hexagon              randconfig-r2102-20261115    gcc-9.5.0  cocci
hexagon              randconfig-r2104-20261115    gcc-11.5.0 cocci
hexagon              randconfig-r2109-20261115    clang-24   cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386        buildonly-randconfig-1000-20261116    gcc-14
i386        buildonly-randconfig-1001-20261116    gcc-14
i386        buildonly-randconfig-1002-20261116    gcc-14
i386        buildonly-randconfig-1003-20261116    gcc-14
i386        buildonly-randconfig-1004-20261116    gcc-14
i386        buildonly-randconfig-1005-20261116    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261116    gcc-14
i386                  randconfig-1001-20261116    gcc-14
i386                  randconfig-1002-20261116    gcc-14
i386                  randconfig-1003-20261116    gcc-14
i386                  randconfig-1004-20261116    gcc-14
i386                  randconfig-1005-20261116    gcc-14
i386                  randconfig-1006-20261116    gcc-14
i386                  randconfig-2000-20261115    gcc-14
i386                  randconfig-2001-20261115    gcc-14
i386                  randconfig-2002-20261115    gcc-12
i386                  randconfig-2002-20261115    gcc-14
i386                  randconfig-2003-20261115    clang-22
i386                  randconfig-2003-20261115    gcc-14
i386                  randconfig-2004-20261115    gcc-14
i386                  randconfig-2005-20261115    gcc-12
i386                  randconfig-2005-20261115    gcc-14
i386                  randconfig-2100-20261115    clang-22   cocci
i386                  randconfig-2100-20261115    gcc-14     cocci
i386                  randconfig-2101-20261115    clang-22   cocci
i386                  randconfig-2101-20261115    gcc-14     cocci
i386                  randconfig-2102-20261115    clang-22   cocci
i386                  randconfig-2102-20261115    gcc-14     cocci
i386                  randconfig-2103-20261115    gcc-14     cocci
i386                  randconfig-2104-20261115    gcc-14     cocci
i386                  randconfig-2105-20261115    gcc-14     cocci
i386                  randconfig-2200-20261115    gcc-14     smatch
i386                  randconfig-2300-20261115    clang-22   sparse
i386                  randconfig-2301-20261115    clang-22   sparse
i386                  randconfig-2301-20261115    gcc-14     sparse
i386                  randconfig-2302-20261115    clang-22   sparse
i386                 randconfig-r2101-20261115    gcc-11.5.0 cocci
i386                 randconfig-r2103-20261115    gcc-14     cocci
i386                 randconfig-r2110-20261115    gcc-14     cocci
i386                 randconfig-r2307-20261115    clang-22   sparse
i386                 randconfig-r2311-20261115    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261116    clang-17
loongarch             randconfig-1001-20261116    clang-17
loongarch             randconfig-2000-20261115    gcc-16.2.0
loongarch             randconfig-2000-20261115    gcc-8.5.0
loongarch             randconfig-2001-20261115    clang-20
loongarch             randconfig-2001-20261115    gcc-8.5.0
loongarch             randconfig-2200-20261115    gcc-16.2.0 smatch
loongarch            randconfig-r2309-20261115    gcc-11.5.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    clang-17
m68k                        m5249evb_defconfig    gcc-14
m68k                         m5272c3_defconfig    gcc-14
m68k                        m5282evb_defconfig    gcc-14
m68k                        m5329evb_defconfig    clang-17
m68k                  randconfig-2000-20261115    gcc-15.3.0
m68k                  randconfig-2000-20261115    gcc-8.5.0
m68k                  randconfig-2001-20261115    gcc-8.5.0
m68k                  randconfig-2200-20261115    gcc-8.5.0  smatch
m68k                 randconfig-r2102-20261115    gcc-8.5.0  cocci
m68k                 randconfig-r2105-20261115    gcc-12.5.0 cocci
m68k                 randconfig-r2105-20261115    gcc-8.5.0  cocci
m68k                 randconfig-r2310-20261115    clang-22   sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261115    gcc-10.5.0
microblaze            randconfig-2000-20261115    gcc-8.5.0
microblaze            randconfig-2001-20261115    gcc-16.2.0
microblaze            randconfig-2001-20261115    gcc-8.5.0
microblaze            randconfig-2200-20261115    gcc-12.5.0 smatch
microblaze           randconfig-r2104-20261115    gcc-8.5.0  cocci
microblaze           randconfig-r2303-20261115    gcc-10.5.0 sparse
microblaze           randconfig-r2306-20261115    clang-22   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                           ath79_defconfig    gcc-16.2.0
mips                   cavium_octeon_defconfig    clang-17
mips                 econet_en751221_defconfig    gcc-16.2.0
mips                            ip27_defconfig    gcc-14
mips                            ip28_defconfig    clang-24
mips                            jazz_defconfig    gcc-14
mips                  randconfig-2000-20261115    clang-17
mips                  randconfig-2000-20261115    gcc-10.5.0
mips                  randconfig-2001-20261115    clang-20
mips                  randconfig-2001-20261115    gcc-10.5.0
mips                  randconfig-2002-20261115    clang-24
mips                  randconfig-2002-20261115    gcc-10.5.0
mips                  randconfig-2200-20261115    clang-24   smatch
mips                 randconfig-r2100-20261115    gcc-9.5.0  cocci
mips                 randconfig-r2107-20261115    clang-17   cocci
mips                            rs90_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261116    clang-17
nios2                 randconfig-1001-20261116    clang-17
nios2                 randconfig-2000-20261115    gcc-8.5.0
nios2                 randconfig-2001-20261115    gcc-8.5.0
nios2                 randconfig-2200-20261115    gcc-11.5.0 smatch
nios2                randconfig-r2103-20261115    gcc-11.5.0 cocci
nios2                randconfig-r2106-20261115    gcc-11.5.0 cocci
nios2                randconfig-r2304-20261115    gcc-9.5.0  sparse
nios2                randconfig-r2307-20261115    gcc-11.5.0 sparse
nios2                randconfig-r2307-20261115    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    gcc-16.2.0
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261115    gcc-10.5.0
openrisc              randconfig-2001-20261115    gcc-10.5.0
openrisc              randconfig-2001-20261115    gcc-12.5.0
openrisc              randconfig-2002-20261115    gcc-10.5.0
openrisc              randconfig-2200-20261115    gcc-12.5.0 smatch
openrisc             randconfig-r2107-20261115    gcc-11.5.0 cocci
openrisc             randconfig-r2307-20261115    gcc-16.2.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261116    gcc-16.2.0
parisc                randconfig-1001-20261116    gcc-16.2.0
parisc                randconfig-2000-20261115    gcc-8.5.0
parisc                randconfig-2001-20261115    gcc-14.4.0
parisc                randconfig-2001-20261115    gcc-8.5.0
parisc                randconfig-2200-20261115    gcc-10.5.0 smatch
parisc               randconfig-r2103-20261115    gcc-9.5.0  cocci
parisc               randconfig-r2302-20261115    gcc-13.5.0 sparse
parisc               randconfig-r2305-20261115    gcc-10.5.0 sparse
parisc               randconfig-r2308-20261115    gcc-11.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                        eiger_defconfig    clang-17
powerpc                       ep88xc_defconfig    clang-24
powerpc                     gamecube_defconfig    clang-24
powerpc                        holly_defconfig    clang-24
powerpc                   iss476-smp_defconfig    gcc-16.2.0
powerpc                  linkstation_defconfig    gcc-16.2.0
powerpc                   mpc885_ads_defconfig    clang-24
powerpc                     mvme5100_defconfig    clang-24
powerpc                      powernv_defconfig    clang-24
powerpc                       ppc44x_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261116    gcc-16.2.0
powerpc               randconfig-1001-20261116    gcc-16.2.0
powerpc               randconfig-2000-20261115    gcc-15.3.0
powerpc               randconfig-2000-20261115    gcc-8.5.0
powerpc               randconfig-2001-20261115    gcc-8.5.0
powerpc               randconfig-2001-20261115    gcc-9.5.0
powerpc               randconfig-2002-20261115    clang-24
powerpc               randconfig-2002-20261115    gcc-8.5.0
powerpc               randconfig-2200-20261115    clang-17   smatch
powerpc              randconfig-r2311-20261115    gcc-14.4.0 sparse
powerpc                     sam440ep_defconfig    clang-24
powerpc                      stx_gp3_defconfig    clang-24
powerpc                      tqm5200_defconfig    gcc-16.2.0
powerpc                         warp_defconfig    clang-24
powerpc64             randconfig-1000-20261116    gcc-16.2.0
powerpc64             randconfig-1001-20261116    gcc-16.2.0
powerpc64             randconfig-2000-20261115    gcc-13.5.0
powerpc64             randconfig-2000-20261115    gcc-8.5.0
powerpc64             randconfig-2001-20261115    gcc-8.5.0
powerpc64             randconfig-2002-20261115    gcc-8.5.0
powerpc64             randconfig-2200-20261115    clang-24   smatch
powerpc64            randconfig-r2111-20261115    gcc-8.5.0  cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261116    clang-17
riscv                 randconfig-1001-20261116    clang-17
riscv                 randconfig-2000-20261115    clang-20
riscv                 randconfig-2000-20261115    gcc-8.5.0
riscv                 randconfig-2001-20261115    gcc-8.5.0
riscv                 randconfig-2002-20261115    gcc-11.5.0
riscv                 randconfig-2002-20261115    gcc-8.5.0
riscv                 randconfig-2003-20261115    gcc-8.5.0
riscv                 randconfig-2004-20261115    gcc-15.3.0
riscv                 randconfig-2004-20261115    gcc-8.5.0
riscv                 randconfig-2005-20261115    gcc-8.5.0
riscv                 randconfig-2005-20261115    gcc-9.5.0
riscv                 randconfig-2200-20261115    clang-24   smatch
riscv                randconfig-r2104-20261115    gcc-9.5.0  cocci
riscv                randconfig-r2108-20261115    gcc-11.5.0 cocci
riscv                randconfig-r2110-20261115    gcc-8.5.0  cocci
riscv                randconfig-r2305-20261115    gcc-8.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261116    clang-17
s390                  randconfig-1001-20261116    clang-17
s390                  randconfig-2000-20261115    gcc-11.5.0
s390                  randconfig-2000-20261115    gcc-13.5.0
s390                  randconfig-2001-20261115    clang-17
s390                  randconfig-2001-20261115    gcc-13.5.0
s390                  randconfig-2002-20261115    clang-24
s390                  randconfig-2002-20261115    gcc-13.5.0
s390                  randconfig-2003-20261115    clang-24
s390                  randconfig-2003-20261115    gcc-13.5.0
s390                  randconfig-2004-20261115    gcc-13.5.0
s390                  randconfig-2004-20261115    gcc-8.5.0
s390                  randconfig-2005-20261115    gcc-13.5.0
s390                  randconfig-2200-20261115    clang-24   smatch
s390                 randconfig-r2311-20261115    gcc-8.5.0  sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                         apsh4ad0a_defconfig    gcc-16.2.0
sh                                   defconfig    gcc-14
sh                              espt_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261116    clang-17
sh                    randconfig-1001-20261116    clang-17
sh                    randconfig-2000-20261115    gcc-10.5.0
sh                    randconfig-2000-20261115    gcc-12.5.0
sh                    randconfig-2001-20261115    gcc-12.5.0
sh                    randconfig-2002-20261115    gcc-10.5.0
sh                    randconfig-2002-20261115    gcc-12.5.0
sh                    randconfig-2003-20261115    gcc-12.5.0
sh                    randconfig-2003-20261115    gcc-16.2.0
sh                    randconfig-2004-20261115    gcc-10.5.0
sh                    randconfig-2004-20261115    gcc-12.5.0
sh                    randconfig-2005-20261115    gcc-12.5.0
sh                    randconfig-2200-20261115    gcc-16.2.0 smatch
sh                   randconfig-r2105-20261115    gcc-9.5.0  cocci
sh                   randconfig-r2309-20261115    gcc-8.5.0  sparse
sh                           sdk7786_defconfig    clang-17
sh                            se7206_defconfig    clang-17
sh                    sh7724_generic_defconfig    gcc-14
sh                               ul2_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261116    gcc-16.2.0
sparc                 randconfig-1001-20261116    gcc-16.2.0
sparc                 randconfig-2000-20261115    clang-24
sparc                 randconfig-2000-20261115    gcc-8.5.0
sparc                 randconfig-2001-20261115    clang-24
sparc                 randconfig-2001-20261115    gcc-8.5.0
sparc                 randconfig-2200-20261115    gcc-16.2.0 smatch
sparc                randconfig-r2106-20261115    gcc-8.5.0  cocci
sparc                randconfig-r2302-20261115    gcc-10.5.0 sparse
sparc                randconfig-r2310-20261115    gcc-8.5.0  sparse
sparc                randconfig-r2311-20261115    gcc-11.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261116    gcc-16.2.0
sparc64               randconfig-1001-20261116    gcc-16.2.0
sparc64               randconfig-2000-20261115    clang-24
sparc64               randconfig-2000-20261115    gcc-15.3.0
sparc64               randconfig-2001-20261115    clang-24
sparc64               randconfig-2001-20261115    gcc-9.5.0
sparc64               randconfig-2200-20261115    gcc-13.5.0 smatch
sparc64              randconfig-r2100-20261115    gcc-8.5.0  cocci
sparc64              randconfig-r2304-20261115    gcc-10.5.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261116    gcc-16.2.0
um                    randconfig-1001-20261116    gcc-16.2.0
um                    randconfig-2000-20261115    clang-24
um                    randconfig-2000-20261115    gcc-14
um                    randconfig-2001-20261115    clang-24
um                    randconfig-2200-20261115    clang-24   smatch
um                   randconfig-r2109-20261115    gcc-11.5.0 cocci
um                   randconfig-r2111-20261115    gcc-11.5.0 cocci
um                   randconfig-r2310-20261115    gcc-11.5.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261116    gcc-14
x86_64      buildonly-randconfig-1001-20261116    gcc-14
x86_64      buildonly-randconfig-1002-20261116    gcc-14
x86_64      buildonly-randconfig-1003-20261116    gcc-14
x86_64      buildonly-randconfig-1004-20261116    gcc-14
x86_64      buildonly-randconfig-1005-20261116    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261116    gcc-14
x86_64                randconfig-1001-20261116    gcc-14
x86_64                randconfig-1002-20261116    gcc-14
x86_64                randconfig-1003-20261116    gcc-14
x86_64                randconfig-1004-20261116    gcc-14
x86_64                randconfig-1005-20261116    gcc-14
x86_64                randconfig-1006-20261116    clang-22
x86_64                randconfig-1007-20261116    clang-22
x86_64                randconfig-1008-20261116    clang-22
x86_64                randconfig-1009-20261116    clang-22
x86_64                randconfig-1010-20261116    clang-22
x86_64                randconfig-1011-20261116    clang-22
x86_64                randconfig-1012-20261116    clang-22
x86_64                randconfig-1013-20261116    clang-22
x86_64                randconfig-1014-20261116    clang-22
x86_64                randconfig-1015-20261116    clang-22
x86_64                randconfig-1016-20261116    clang-22
x86_64                randconfig-1017-20261116    clang-22
x86_64                randconfig-2000-20261115    gcc-14
x86_64                randconfig-2001-20261115    gcc-14
x86_64                randconfig-2002-20261115    gcc-14
x86_64                randconfig-2003-20261115    clang-22
x86_64                randconfig-2003-20261115    gcc-14
x86_64                randconfig-2004-20261115    clang-22
x86_64                randconfig-2004-20261115    gcc-14
x86_64                randconfig-2005-20261115    gcc-14
x86_64                randconfig-2100-20261115    clang-22   cocci
x86_64                randconfig-2101-20261115    clang-22   cocci
x86_64                randconfig-2102-20261115    clang-22   cocci
x86_64                randconfig-2102-20261115    gcc-14     cocci
x86_64                randconfig-2103-20261115    clang-22   cocci
x86_64                randconfig-2104-20261115    clang-22   cocci
x86_64                randconfig-2104-20261115    gcc-14     cocci
x86_64                randconfig-2105-20261115    clang-22   cocci
x86_64                randconfig-2105-20261115    gcc-14     cocci
x86_64                randconfig-2200-20261115    clang-22   smatch
x86_64                randconfig-2300-20261115    clang-22   sparse
x86_64                randconfig-2300-20261115    gcc-14     sparse
x86_64                randconfig-2301-20261115    clang-22   sparse
x86_64                randconfig-2302-20261115    clang-22   sparse
x86_64               randconfig-r2104-20261115    gcc-14     cocci
x86_64               randconfig-r2108-20261115    gcc-14     cocci
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
xtensa                randconfig-1000-20261116    gcc-16.2.0
xtensa                randconfig-1001-20261116    gcc-16.2.0
xtensa                randconfig-2000-20261115    gcc-14.4.0
xtensa                randconfig-2000-20261115    gcc-8.5.0
xtensa                randconfig-2001-20261115    gcc-10.5.0
xtensa                randconfig-2001-20261115    gcc-14.4.0
xtensa                randconfig-2200-20261115    gcc-14.4.0 smatch
xtensa               randconfig-r2100-20261115    gcc-8.5.0  cocci
xtensa               randconfig-r2107-20261115    gcc-8.5.0  cocci
xtensa               randconfig-r2300-20261115    gcc-10.5.0 sparse
xtensa               randconfig-r2303-20261115    gcc-9.5.0  sparse
xtensa               randconfig-r2308-20261115    clang-22   sparse
xtensa               randconfig-r2309-20261115    gcc-13.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
