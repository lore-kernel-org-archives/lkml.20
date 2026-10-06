Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1AC318EC7
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272408; cv=none; b=DmqiAdPazI3g5OWzrBsJUM18DjWuagnSINx4gTJeiBQQ0mMXCJRCjj/u2cakIp6pTQhUb+E6yrRvl0m2pppkxaC1CbMyIoJmdTCp2tgN4Hg1XkuP168ccBPlRDFDyiQA+7O4GnNocOmMUNXD8Aeq7tlZLKx3rZwkKchUFE3HKE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272408; c=relaxed/simple;
	bh=mSnJ3Jw1Ba54CcZuOeXUigHyf/5bbtVirEdSjzAMhzE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OWvMrbs/YUlOpDPSfShNvN70eDC0jsBLz9uK2MrwXhnLrDsy1pGQtQjizE4DBoXCMgVTWRpxkk/MbQaRlDW3LvB/wn9BQifKVrScAvBzRJE0i4sh1dn9eQuhRoPrq8pKCm2hGcKg5ECv/yhOt409XRtjMSE5XXIx8g+SwiuujeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgfJIB1P; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgfJIB1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791272406; x=1822808406;
  h=date:from:to:cc:subject:message-id;
  bh=mSnJ3Jw1Ba54CcZuOeXUigHyf/5bbtVirEdSjzAMhzE=;
  b=HgfJIB1Pq0wztt/6fPRv9OjdGkCL2i+6DOnDe2yFBVkYRprA1SNqJez3
   l1+Xw89hSOyAETkjUzeBALlwBihUXW0qs6a/iqfKrWIQYEzu0r55uFTRO
   GKoJyBtGRlXMxcnosWjBdKqXsPvuyBnjrGk8K4jvlfwbOPcom81OZitF8
   cvtHLM6Zet6Go7GEqxebVM23VP0NE2kf7SVWIS1WtSJvsNV69xayP0qdX
   w5h69MuHuikGaLdUxb3u0xrGqFmwV8GSp0OzciRHLiHrfzfEIl35a17af
   eauaoZGgyVuZrSoQptp5uQYmUWirU8T9HkHGcjJ1HVRU7Hwn/kFSym7hN
   A==;
X-CSE-ConnectionGUID: JHIrJQ33Q8SOVS6Qy8FywQ==
X-CSE-MsgGUID: GSf08I9LSeSbSPuZr/zZ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102114844"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102114844"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 00:40:06 -0700
X-CSE-ConnectionGUID: vqKtMzo5TwyZb9ROHTOHgQ==
X-CSE-MsgGUID: ox3E0cXDSyS6E4Z3foHHPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276203251"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Oct 2026 00:40:04 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDzmM-000000001Js-2onx;
	Tue, 06 Oct 2026 07:40:02 +0000
Date: Tue, 06 Oct 2026 15:39:59 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:urgent] BUILD SUCCESS
 87db7795cbaaf636ae22ae031f4906db7bb77803
Message-ID: <202610061555.FCzVtJDs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 87db7795cbaaf636ae22ae031f4906db7bb77803  x86/CPU/AMD: Fix AMD TLBI Erratum #1718

elapsed time: 836m

configs tested: 156
configs skipped: 124

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                                defconfig    clang-24
alpha                                defconfig    gcc-16.1.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                      haps_hs_smp_defconfig    clang-24
arc                   randconfig-1000-20261006    clang-24
arc                   randconfig-1001-20261006    clang-24
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    clang-24
arm                           pxa3xx_defconfig    clang-24
arm                   randconfig-1000-20261006    clang-24
arm                   randconfig-1001-20261006    clang-24
arm                   randconfig-1002-20261006    clang-24
arm                   randconfig-1003-20261006    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261006    gcc-16.1.0
arm64                 randconfig-1001-20261006    gcc-16.1.0
arm64                 randconfig-1002-20261006    gcc-16.1.0
arm64                 randconfig-1003-20261006    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261006    gcc-16.1.0
csky                  randconfig-1001-20261006    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261006    gcc-13.4.0
hexagon               randconfig-1001-20261006    gcc-13.4.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261006    gcc-14
i386        buildonly-randconfig-1001-20261006    gcc-14
i386        buildonly-randconfig-1002-20261006    gcc-14
i386        buildonly-randconfig-1003-20261006    gcc-14
i386        buildonly-randconfig-1004-20261006    gcc-14
i386        buildonly-randconfig-1005-20261006    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261006    gcc-14
i386                  randconfig-1001-20261006    gcc-14
i386                  randconfig-1002-20261006    gcc-14
i386                  randconfig-1003-20261006    gcc-14
i386                  randconfig-1004-20261006    gcc-14
i386                  randconfig-1005-20261006    gcc-14
i386                  randconfig-1006-20261006    gcc-14
i386                  randconfig-1007-20261006    gcc-14
i386                  randconfig-1008-20261006    gcc-14
i386                  randconfig-1009-20261006    gcc-14
i386                  randconfig-1010-20261006    gcc-14
i386                  randconfig-1011-20261006    gcc-14
i386                  randconfig-1012-20261006    gcc-14
i386                  randconfig-1013-20261006    gcc-14
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261006    gcc-13.4.0
loongarch             randconfig-1001-20261006    gcc-13.4.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    clang-24
m68k                                 defconfig    clang-24
microblaze                         allnoconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2200-20261005    gcc-9.5.0  smatch
mips                               allnoconfig    gcc-16.1.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261006    gcc-13.4.0
nios2                 randconfig-1001-20261006    gcc-13.4.0
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261006    gcc-14.3.0
parisc                randconfig-1001-20261006    gcc-14.3.0
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                  mpc836x_rdk_defconfig    clang-24
powerpc               randconfig-1000-20261006    gcc-14.3.0
powerpc               randconfig-1001-20261006    gcc-14.3.0
powerpc64             randconfig-1000-20261006    gcc-14.3.0
powerpc64             randconfig-1001-20261006    gcc-14.3.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                     nommu_virt_defconfig    clang-24
riscv                 randconfig-1000-20261006    clang-24
riscv                 randconfig-1001-20261006    clang-24
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261006    clang-24
s390                  randconfig-1001-20261006    clang-24
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261006    clang-24
sh                    randconfig-1001-20261006    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261006    gcc-14
sparc                 randconfig-1001-20261006    gcc-14
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261006    gcc-14
sparc64               randconfig-1001-20261006    gcc-14
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261006    gcc-14
um                    randconfig-1001-20261006    gcc-14
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261006    gcc-14
x86_64      buildonly-randconfig-1001-20261006    gcc-14
x86_64      buildonly-randconfig-1002-20261006    gcc-14
x86_64      buildonly-randconfig-1003-20261006    gcc-14
x86_64      buildonly-randconfig-1004-20261006    gcc-14
x86_64      buildonly-randconfig-1005-20261006    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261006    gcc-14
x86_64                randconfig-1001-20261006    gcc-14
x86_64                randconfig-1002-20261006    gcc-14
x86_64                randconfig-1003-20261006    gcc-14
x86_64                randconfig-1004-20261006    gcc-14
x86_64                randconfig-1005-20261006    gcc-14
x86_64                randconfig-1006-20261006    gcc-14
x86_64                randconfig-1007-20261006    gcc-14
x86_64                randconfig-1008-20261006    gcc-14
x86_64                randconfig-1009-20261006    gcc-14
x86_64                randconfig-1010-20261006    gcc-14
x86_64                randconfig-1011-20261006    gcc-14
x86_64                randconfig-1012-20261006    gcc-14
x86_64                randconfig-1013-20261006    gcc-14
x86_64                randconfig-1014-20261006    gcc-14
x86_64                randconfig-1015-20261006    gcc-14
x86_64                randconfig-1016-20261006    gcc-14
x86_64                randconfig-1017-20261006    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                randconfig-1000-20261006    gcc-14
xtensa                randconfig-1001-20261006    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
