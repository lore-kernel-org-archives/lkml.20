Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638182;
	b=UH3YJ8dHvTt+rlG+5AzlUuk1/51ysDbBxCTdruCe1NtX5l3+9STm/gQLKZ0MYR1Q+QmI
	 MRPsPq6AC+N9TC9f3ZHv20/GarfyNmKd8k7CdT9dTuLyiajNoV6wCnG8lsGdrOm1kWeKR
	 sUEQeJNBqY5Sfghe6hntwuTSWiObLnlDdvPUp5Qk4Gz2SBhKOSyIDCzzsJVN5runM2bkN
	 lVSePsJQMjveaxDXJiDXfpNRQAwkSWD8Rb2V02pkVxRy08MLL0OX41mPf6wTEaBkiQAdw
	 AIPZAwKvpK/dm8EVUmow+lkiFWeKBNAqsxEG7OE7AH2chlDcojxU3gPmgrNhfcenfzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638182;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=oXrC79zTWK8jyGo4Kbd+f8OMXVIjG4yLLmcTF+d6hAk=;
	b=sEHjR07EnY8Q/+veyLFF30ytEdRSjhKSjceXHc8AfTZah9hoE8xKIDynTGU08FBX8g1u
	 c0YaR+lS7w6T1xwJ+rFWCe7v+aW4mPFvHAev3L2RRwgXHnN8P8IUKRUi6KZ8RZhUs4Hlu
	 bKHPLjXraHdedsExARDYuYgdOc++/Hk6eVwVfO0ehGXjD25OMaPPiCkbcNJHN4AK9gBJO
	 OnOSFnLTVIw1v/6722iCK/Yr248pZrNczu6AwM/bV0W2eA/ma2yp9+jv7fIBDVmoK+xwj
	 Vft30RJVCaXsOBpvzWoBKveR4ryaAVgAC5ASrlbjiBphACVLnjpIcFDlkXlQ1b7LsmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mNcQ+V0I;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A926072C76
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A926072C76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mNcQ+V0I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793638182; x=1825174182;
  h=date:from:to:cc:subject:message-id;
  bh=K9kb4CtYOpqn6apEAfzvoS6VcnE02r5TjNfzB/3jDR0=;
  b=mNcQ+V0IX0l5qx0DsfHElhdqKuHCWnbu6P+DRS/IeKRwSRhgmE4S5ecO
   Xs5kZ2KqYQNjIsRX1BApRYUCeXPwba7l9tRYaCtFviGI56F6++Mu6yBMW
   OVW22m/inBq/L/1JoY3vhbVdR3vh6Yd9YDnGHvB8HAaRBrO0eW5xj2rXv
   yAU9XojsyRMxp7ua0wUxPvLYkSOFXn5YuXdqaHRXqnUafUe+fH7jKfPDT
   Ee+RzviSn4h/BtGPU2LXZ0U8Tw4QuhTLeAKjF0X0WJxPsNci3w/hZ6+Az
   6zrR0i2fp+T8qdyiBa8P/Z+hD4uh8+kxKDgK922UgFXgoThHm7C7XwdQ8
   A==;
X-CSE-ConnectionGUID: by+7HrDAQDesL+NXYvERUw==
X-CSE-MsgGUID: uomepIoXSeap+9aoJuwTnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2217999"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2217999"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 08:49:40 -0800
X-CSE-ConnectionGUID: ydlyPKgkSBy4oj4ft/iFUA==
X-CSE-MsgGUID: oWzUXymUQ+6w6Ujc4i5fww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6269023"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Nov 2026 08:49:39 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNvE0-00000000hQ4-3O1g;
	Mon, 02 Nov 2026 16:49:36 +0000
Date: Tue, 03 Nov 2026 00:49:23 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip:urgent] BUILD SUCCESS
 3b46cb2bff081ada56b0428da721154090dce690
Message-ID: <20261103004923.NtrGOQgR-lkp@intel.com>
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
branch HEAD: 3b46cb2bff081ada56b0428da721154090dce690  Merge branch into tip/master: 'timers/urgent'

elapsed time: 1973m

configs tested: 158
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                      haps_hs_smp_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261102    gcc-10.5.0
arc                   randconfig-1001-20261102    gcc-10.5.0
arm                                allnoconfig    gcc-16.2.0
arm                          bcm2835_defconfig    gcc-16.2.0
arm                           collie_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                       integrator_defconfig    gcc-16.2.0
arm                              mxs_defconfig    clang-24
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20261102    gcc-10.5.0
arm                   randconfig-1001-20261102    gcc-10.5.0
arm                   randconfig-1002-20261102    gcc-10.5.0
arm                   randconfig-1003-20261102    gcc-10.5.0
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261102    clang-24
arm64                 randconfig-1001-20261102    clang-24
arm64                 randconfig-1002-20261102    clang-24
arm64                 randconfig-1003-20261102    clang-24
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261102    clang-24
csky                  randconfig-1001-20261102    clang-24
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261102    clang-19
hexagon               randconfig-1001-20261102    clang-19
i386                               allnoconfig    gcc-16.2.0
i386        buildonly-randconfig-1000-20261102    clang-22
i386        buildonly-randconfig-1001-20261102    clang-22
i386        buildonly-randconfig-1002-20261102    clang-22
i386        buildonly-randconfig-1003-20261102    clang-22
i386        buildonly-randconfig-1004-20261102    clang-22
i386        buildonly-randconfig-1005-20261102    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261102    gcc-14
i386                  randconfig-1001-20261102    gcc-14
i386                  randconfig-1002-20261102    gcc-14
i386                  randconfig-1003-20261102    gcc-14
i386                  randconfig-1004-20261102    gcc-14
i386                  randconfig-1005-20261102    gcc-14
i386                  randconfig-1006-20261102    gcc-14
i386                  randconfig-1007-20261102    clang-22
i386                  randconfig-1008-20261102    clang-22
i386                  randconfig-1009-20261102    clang-22
i386                  randconfig-1010-20261102    clang-22
i386                  randconfig-1011-20261102    clang-22
i386                  randconfig-1012-20261102    clang-22
i386                  randconfig-1013-20261102    clang-22
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261102    clang-19
loongarch             randconfig-1001-20261102    clang-19
m68k                               allnoconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                               allnoconfig    gcc-16.2.0
mips                      cu1830-neo_defconfig    gcc-16.2.0
mips                      decstation_defconfig    clang-24
mips                      eyeq6lplus_defconfig    clang-24
mips                            ip22_defconfig    clang-24
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261102    clang-19
nios2                 randconfig-1001-20261102    clang-19
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261102    clang-17
parisc                randconfig-1001-20261102    clang-17
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    gcc-16.2.0
powerpc                  canyonlands_defconfig    clang-24
powerpc                    lite5200b_defconfig    gcc-16.2.0
powerpc                      mpc512x_defconfig    clang-24
powerpc               randconfig-1000-20261102    clang-17
powerpc               randconfig-1001-20261102    clang-17
powerpc64             randconfig-1000-20261102    clang-17
powerpc64             randconfig-1001-20261102    clang-17
riscv                              allnoconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261102    clang-21
riscv                 randconfig-1001-20261102    clang-21
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261102    clang-21
s390                  randconfig-1001-20261102    clang-21
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261102    clang-21
sh                    randconfig-1001-20261102    clang-21
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261102    gcc-15.3.0
sparc                 randconfig-1001-20261102    gcc-15.3.0
sparc                        sparc64_defconfig    clang-24
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261102    gcc-15.3.0
sparc64               randconfig-1001-20261102    gcc-15.3.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261102    gcc-15.3.0
um                    randconfig-1001-20261102    gcc-15.3.0
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261102    gcc-14
x86_64      buildonly-randconfig-1001-20261102    gcc-14
x86_64      buildonly-randconfig-1002-20261102    gcc-14
x86_64      buildonly-randconfig-1003-20261102    gcc-14
x86_64      buildonly-randconfig-1004-20261102    gcc-14
x86_64      buildonly-randconfig-1005-20261102    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261102    clang-22
x86_64                randconfig-1001-20261102    clang-22
x86_64                randconfig-1002-20261102    clang-22
x86_64                randconfig-1003-20261102    clang-22
x86_64                randconfig-1004-20261102    clang-22
x86_64                randconfig-1005-20261102    clang-22
x86_64                randconfig-1006-20261102    gcc-14
x86_64                randconfig-1007-20261102    gcc-14
x86_64                randconfig-1008-20261102    gcc-14
x86_64                randconfig-1009-20261102    gcc-14
x86_64                randconfig-1010-20261102    gcc-14
x86_64                randconfig-1011-20261102    gcc-14
x86_64                randconfig-1012-20261102    gcc-12
x86_64                randconfig-1013-20261102    gcc-12
x86_64                randconfig-1014-20261102    gcc-12
x86_64                randconfig-1015-20261102    gcc-12
x86_64                randconfig-1016-20261102    gcc-12
x86_64                randconfig-1017-20261102    gcc-12
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
xtensa                             allnoconfig    clang-24
xtensa                randconfig-1000-20261102    gcc-15.3.0
xtensa                randconfig-1001-20261102    gcc-15.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
