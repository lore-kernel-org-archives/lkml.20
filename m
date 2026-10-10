Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B94036E494
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791666443; cv=none; b=Gr63+wM3qjTTRnbz2wPuxwOzWFAreks0Fg7glir1TAeVOYt7ge7BU6hSwQ/v7I1lXxKDdr+9VnDhHrG8rrCYRiGhLDo5j0vfg4xM0yauBWjipCOdzfDQy6s3dIjQxlUzE2Aey/jk87u1toOdyJaO+YOUdQu3ndbkKws0Hd/C2ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791666443; c=relaxed/simple;
	bh=MHhcnigVw8j+ceXw4VlDXIz0Txd6VrNTwbuwiczxvWw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kTR+3qHGgV0eAJ9tYyuxZ7mVfSEVVSlAgWVhWu6wAN2IzT4XBlEXoQhITHFP9zL5Hbgg5137c3SC/eflfrBCFpG9DlMAfv9JrRHM2gMTKxbs0IfxR8hcPl9VB5G1Anson9ArEpEUrgDgA2zouoYJZaf9vTZ52D1YQHF/CFMqS6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEGAkdqj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEGAkdqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791666441; x=1823202441;
  h=date:from:to:cc:subject:message-id;
  bh=MHhcnigVw8j+ceXw4VlDXIz0Txd6VrNTwbuwiczxvWw=;
  b=QEGAkdqj61F5jMcKvWIjPcMS/6SzFgse3fuOuyKOKUxy2gn4hvMgY+sW
   MvNewzprqgRItTkMY9ZnL8DCTAhXD5kHmk32PcoPQRsLpIg4jvIyKEUua
   RrZsAb/mAvNWyt3mJlbTyuFTq/+uZMJkJ4yYulQtLPvLYfs3O+uEHj+we
   WrQJZDl4fgQmIfHTKQAXmkWzgiM7jnLCdwCOpp+MoQ5SQQF4JviRKB+ha
   dalRVQwh+YaEWys233OcA1P4EVHEHLm5Lr8g5kdTmgHYyLxJXg++VLAkn
   raj2s1fxCPj3YQfnB/aWD36wKGOAsCjkZEatem/CeC7aVhcH7kMCUv3tY
   A==;
X-CSE-ConnectionGUID: lZ05OA2IRyipWSs1e8tDlQ==
X-CSE-MsgGUID: 37cF6CwpT72Qra1dAsReYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="437608"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="437608"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 14:07:20 -0700
X-CSE-ConnectionGUID: u/VF7/B1S6KLLBMSzDWyYg==
X-CSE-MsgGUID: 5gOOVucBSiK1402Q0Yp9+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="501869"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Oct 2026 14:07:19 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFeHk-00000000A4o-1CmD;
	Sat, 10 Oct 2026 21:07:16 +0000
Date: Sun, 11 Oct 2026 05:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip:urgent] BUILD SUCCESS
 1e23b5e1feca3e0c8c90193ec2b93f1a9c316663
Message-ID: <202610110509.BNmalvab-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 1e23b5e1feca3e0c8c90193ec2b93f1a9c316663  Merge branch into tip/master: 'x86/urgent'

elapsed time: 991m

configs tested: 451
configs skipped: 125

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20261009    clang-18   cocci
alpha                randconfig-r2100-20261009    clang-24   cocci
alpha                randconfig-r2104-20261009    gcc-9.5.0  cocci
alpha                randconfig-r2202-20261010    gcc-8.5.0  smatch
alpha                randconfig-r2300-20261009    gcc-8.5.0  sparse
alpha                randconfig-r2304-20261009    gcc-13.4.0 sparse
alpha                randconfig-r2305-20261009    gcc-8.5.0  sparse
alpha                randconfig-r2306-20261009    clang-24   sparse
alpha                randconfig-r2308-20261009    gcc-14     sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261010    gcc-8.5.0
arc                   randconfig-1001-20261010    gcc-8.5.0
arc                  randconfig-r2100-20261009    clang-24   cocci
arc                  randconfig-r2101-20261009    gcc-14.3.0 cocci
arc                  randconfig-r2105-20261009    gcc-13.4.0 cocci
arc                  randconfig-r2106-20261009    gcc-15.2.0 cocci
arc                  randconfig-r2107-20261009    gcc-9.5.0  cocci
arc                  randconfig-r2201-20261009    gcc-16.1.0 smatch
arc                  randconfig-r2202-20261009    gcc-8.5.0  smatch
arc                  randconfig-r2300-20261009    gcc-16.1.0 sparse
arc                  randconfig-r2302-20261009    gcc-11.5.0 sparse
arc                  randconfig-r2302-20261009    gcc-8.5.0  sparse
arc                  randconfig-r2303-20261009    gcc-8.5.0  sparse
arc                  randconfig-r2306-20261009    gcc-9.5.0  sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                           moxart_defconfig    clang-24
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20261010    gcc-8.5.0
arm                   randconfig-1001-20261010    gcc-8.5.0
arm                   randconfig-1002-20261010    gcc-8.5.0
arm                   randconfig-1003-20261010    gcc-8.5.0
arm                  randconfig-r2102-20261009    gcc-14     cocci
arm                  randconfig-r2105-20261009    gcc-9.5.0  cocci
arm                  randconfig-r2106-20261009    clang-17   cocci
arm                  randconfig-r2107-20261009    gcc-15.2.0 cocci
arm                  randconfig-r2200-20261009    clang-24   smatch
arm                  randconfig-r2301-20261009    gcc-16.1.0 sparse
arm                  randconfig-r2302-20261009    gcc-10.5.0 sparse
arm                  randconfig-r2302-20261009    gcc-12     sparse
arm                  randconfig-r2305-20261009    gcc-11.5.0 sparse
arm                  randconfig-r2306-20261009    clang-24   sparse
arm                  randconfig-r2306-20261010    gcc-14     sparse
arm                  randconfig-r2308-20261009    clang-24   sparse
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261010    gcc-10.5.0
arm64                 randconfig-1001-20261010    gcc-10.5.0
arm64                 randconfig-1002-20261010    gcc-10.5.0
arm64                 randconfig-1003-20261010    gcc-10.5.0
arm64                randconfig-r2104-20261009    gcc-9.5.0  cocci
arm64                randconfig-r2104-20261010    gcc-14     cocci
arm64                randconfig-r2105-20261009    clang-24   cocci
arm64                randconfig-r2107-20261009    gcc-9.5.0  cocci
arm64                randconfig-r2202-20261009    gcc-10.5.0 smatch
arm64                randconfig-r2303-20261009    gcc-10.5.0 sparse
arm64                randconfig-r2304-20261010    gcc-16.1.0 sparse
arm64                randconfig-r2305-20261009    gcc-10.5.0 sparse
arm64                randconfig-r2307-20261009    gcc-11.5.0 sparse
arm64                randconfig-r2309-20261009    gcc-11.5.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261010    gcc-10.5.0
csky                  randconfig-1001-20261010    gcc-10.5.0
csky                 randconfig-r2102-20261009    clang-18   cocci
csky                 randconfig-r2103-20261010    clang-24   cocci
csky                 randconfig-r2106-20261009    clang-24   cocci
csky                 randconfig-r2202-20261009    gcc-12.5.0 smatch
csky                 randconfig-r2300-20261009    clang-24   sparse
csky                 randconfig-r2300-20261010    gcc-16.1.0 sparse
csky                 randconfig-r2302-20261009    clang-24   sparse
csky                 randconfig-r2306-20261009    gcc-11.5.0 sparse
csky                 randconfig-r2307-20261009    clang-24   sparse
csky                 randconfig-r2308-20261009    clang-17   sparse
csky                 randconfig-r2308-20261009    clang-22   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261010    clang-17
hexagon               randconfig-1001-20261010    clang-17
hexagon              randconfig-r2100-20261010    clang-24   cocci
hexagon              randconfig-r2103-20261009    clang-19   cocci
hexagon              randconfig-r2301-20261009    gcc-12     sparse
hexagon              randconfig-r2304-20261009    gcc-11.5.0 sparse
hexagon              randconfig-r2306-20261009    clang-24   sparse
hexagon              randconfig-r2309-20261009    gcc-14     sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261010    gcc-14
i386        buildonly-randconfig-1001-20261010    gcc-14
i386        buildonly-randconfig-1002-20261010    gcc-14
i386        buildonly-randconfig-1003-20261010    gcc-14
i386        buildonly-randconfig-1004-20261010    gcc-14
i386        buildonly-randconfig-1005-20261010    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261010    clang-22
i386                  randconfig-1001-20261010    clang-22
i386                  randconfig-1002-20261010    clang-22
i386                  randconfig-1003-20261010    clang-22
i386                  randconfig-1004-20261010    clang-22
i386                  randconfig-1005-20261010    clang-22
i386                  randconfig-1006-20261010    clang-22
i386                  randconfig-1007-20261010    gcc-14
i386                  randconfig-1008-20261010    gcc-14
i386                  randconfig-1009-20261010    gcc-14
i386                  randconfig-1010-20261010    gcc-14
i386                  randconfig-1011-20261010    gcc-14
i386                  randconfig-1012-20261010    gcc-14
i386                  randconfig-1013-20261010    gcc-14
i386                  randconfig-2100-20261009    clang-22   cocci
i386                  randconfig-2100-20261010    clang-22   cocci
i386                  randconfig-2101-20261009    clang-22   cocci
i386                  randconfig-2101-20261010    clang-22   cocci
i386                  randconfig-2102-20261009    clang-22   cocci
i386                  randconfig-2102-20261010    clang-22   cocci
i386                  randconfig-2103-20261009    clang-22   cocci
i386                  randconfig-2103-20261010    clang-22   cocci
i386                  randconfig-2200-20261009    gcc-14     smatch
i386                  randconfig-2200-20261010    gcc-12     smatch
i386                  randconfig-2300-20261009    clang-22   sparse
i386                  randconfig-2300-20261010    gcc-14     sparse
i386                  randconfig-2301-20261009    clang-22   sparse
i386                  randconfig-2301-20261009    gcc-14     sparse
i386                  randconfig-2301-20261010    gcc-14     sparse
i386                  randconfig-2302-20261009    clang-22   sparse
i386                  randconfig-2302-20261009    gcc-14     sparse
i386                  randconfig-2302-20261010    gcc-14     sparse
i386                 randconfig-r2100-20261009    gcc-14     cocci
i386                 randconfig-r2103-20261009    gcc-14     cocci
i386                 randconfig-r2106-20261009    gcc-14     cocci
i386                 randconfig-r2201-20261009    gcc-14     smatch
i386                 randconfig-r2304-20261009    gcc-12     sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch                 loongson32_defconfig    clang-24
loongarch             randconfig-1000-20261010    clang-17
loongarch             randconfig-1001-20261010    clang-17
loongarch            randconfig-r2103-20261009    gcc-16.1.0 cocci
loongarch            randconfig-r2107-20261010    gcc-14     cocci
loongarch            randconfig-r2202-20261009    clang-18   smatch
loongarch            randconfig-r2303-20261009    gcc-11.5.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                          amcore_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.1.0
m68k                         m5307c3_defconfig    clang-24
m68k                 randconfig-r2100-20261009    gcc-16.1.0 cocci
m68k                 randconfig-r2100-20261009    gcc-8.5.0  cocci
m68k                 randconfig-r2103-20261009    gcc-14.3.0 cocci
m68k                 randconfig-r2201-20261009    gcc-11.5.0 smatch
m68k                 randconfig-r2202-20261009    gcc-8.5.0  smatch
m68k                 randconfig-r2301-20261009    clang-24   sparse
m68k                 randconfig-r2307-20261009    gcc-9.5.0  sparse
m68k                 randconfig-r2307-20261010    gcc-14     sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2107-20261009    gcc-14     cocci
microblaze           randconfig-r2200-20261009    gcc-9.5.0  smatch
microblaze           randconfig-r2302-20261009    gcc-13.4.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                  decstation_r4k_defconfig    clang-24
mips                      eyeq6lplus_defconfig    gcc-16.1.0
mips                            ip22_defconfig    gcc-16.1.0
mips                     maltaup_xpa_defconfig    clang-24
mips                 randconfig-r2102-20261009    clang-19   cocci
mips                 randconfig-r2102-20261009    gcc-16.1.0 cocci
mips                 randconfig-r2103-20261009    clang-24   cocci
mips                 randconfig-r2106-20261009    gcc-9.5.0  cocci
mips                 randconfig-r2303-20261009    clang-24   sparse
mips                 randconfig-r2304-20261009    gcc-16.1.0 sparse
mips                 randconfig-r2305-20261009    gcc-16.1.0 sparse
mips                 randconfig-r2307-20261009    clang-24   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261010    clang-17
nios2                 randconfig-1001-20261010    clang-17
nios2                randconfig-r2101-20261009    gcc-8.5.0  cocci
nios2                randconfig-r2102-20261009    gcc-8.5.0  cocci
nios2                randconfig-r2300-20261009    gcc-10.5.0 sparse
nios2                randconfig-r2304-20261009    gcc-8.5.0  sparse
nios2                randconfig-r2306-20261009    gcc-9.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc                   or1klitex_defconfig    gcc-16.1.0
openrisc             randconfig-r2105-20261009    gcc-9.5.0  cocci
openrisc             randconfig-r2107-20261009    clang-17   cocci
openrisc             randconfig-r2107-20261009    clang-24   cocci
openrisc             randconfig-r2300-20261009    gcc-8.5.0  sparse
openrisc             randconfig-r2301-20261010    gcc-16.1.0 sparse
openrisc             randconfig-r2305-20261009    clang-24   sparse
openrisc             randconfig-r2305-20261009    gcc-16.1.0 sparse
openrisc             randconfig-r2306-20261009    gcc-14     sparse
openrisc             randconfig-r2308-20261009    gcc-11.5.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                 generic-64bit_defconfig    clang-24
parisc                 generic-64bit_defconfig    gcc-16.1.0
parisc                randconfig-1000-20261010    clang-24
parisc                randconfig-1001-20261010    clang-24
parisc               randconfig-r2101-20261009    clang-18   cocci
parisc               randconfig-r2101-20261010    clang-24   cocci
parisc               randconfig-r2103-20261009    gcc-8.5.0  cocci
parisc               randconfig-r2105-20261009    clang-24   cocci
parisc               randconfig-r2201-20261009    gcc-10.5.0 smatch
parisc               randconfig-r2302-20261009    gcc-8.5.0  sparse
parisc               randconfig-r2305-20261009    gcc-8.5.0  sparse
parisc               randconfig-r2305-20261010    gcc-16.1.0 sparse
parisc               randconfig-r2309-20261009    gcc-9.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                        ebony_defconfig    gcc-16.1.0
powerpc                      mpc5200_defconfig    clang-24
powerpc               randconfig-1000-20261010    clang-24
powerpc               randconfig-1001-20261010    clang-24
powerpc              randconfig-r2100-20261009    clang-19   cocci
powerpc              randconfig-r2101-20261009    clang-24   cocci
powerpc              randconfig-r2103-20261009    clang-18   cocci
powerpc              randconfig-r2104-20261009    gcc-15.2.0 cocci
powerpc              randconfig-r2107-20261009    clang-24   cocci
powerpc              randconfig-r2200-20261009    clang-17   smatch
powerpc              randconfig-r2201-20261009    clang-24   smatch
powerpc              randconfig-r2301-20261009    gcc-8.5.0  sparse
powerpc              randconfig-r2303-20261009    gcc-16.1.0 sparse
powerpc              randconfig-r2308-20261009    clang-24   sparse
powerpc              randconfig-r2308-20261010    gcc-14     sparse
powerpc                       tqm8xx_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261010    clang-24
powerpc64             randconfig-1001-20261010    clang-24
powerpc64            randconfig-r2100-20261009    gcc-8.5.0  cocci
powerpc64            randconfig-r2101-20261009    gcc-16.1.0 cocci
powerpc64            randconfig-r2101-20261009    gcc-8.5.0  cocci
powerpc64            randconfig-r2102-20261009    clang-24   cocci
powerpc64            randconfig-r2104-20261009    clang-24   cocci
powerpc64            randconfig-r2200-20261009    clang-24   smatch
powerpc64            randconfig-r2202-20261009    gcc-16.1.0 smatch
powerpc64            randconfig-r2301-20261009    gcc-8.5.0  sparse
powerpc64            randconfig-r2303-20261009    gcc-13.4.0 sparse
powerpc64            randconfig-r2304-20261009    gcc-10.5.0 sparse
powerpc64            randconfig-r2305-20261009    gcc-12     sparse
powerpc64            randconfig-r2309-20261009    gcc-9.5.0  sparse
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261010    clang-19
riscv                 randconfig-1001-20261010    clang-19
riscv                 randconfig-2000-20261009    gcc-16.1.0
riscv                 randconfig-2000-20261010    gcc-16.1.0
riscv                 randconfig-2001-20261009    gcc-16.1.0
riscv                 randconfig-2001-20261010    gcc-16.1.0
riscv                randconfig-r2102-20261009    gcc-8.5.0  cocci
riscv                randconfig-r2106-20261009    clang-24   cocci
riscv                randconfig-r2300-20261009    gcc-12     sparse
riscv                randconfig-r2306-20261009    clang-17   sparse
riscv                randconfig-r2307-20261009    clang-17   sparse
riscv                randconfig-r2308-20261009    gcc-9.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261010    clang-19
s390                  randconfig-1001-20261010    clang-19
s390                  randconfig-2000-20261009    gcc-16.1.0
s390                  randconfig-2000-20261010    gcc-16.1.0
s390                  randconfig-2001-20261009    gcc-16.1.0
s390                  randconfig-2001-20261010    gcc-16.1.0
s390                 randconfig-r2102-20261009    clang-24   cocci
s390                 randconfig-r2104-20261009    clang-24   cocci
s390                 randconfig-r2104-20261009    gcc-14     cocci
s390                 randconfig-r2105-20261009    gcc-15.2.0 cocci
s390                 randconfig-r2106-20261009    gcc-13.4.0 cocci
s390                 randconfig-r2202-20261009    clang-18   smatch
s390                 randconfig-r2301-20261009    gcc-16.1.0 sparse
s390                 randconfig-r2307-20261009    clang-24   sparse
s390                 randconfig-r2308-20261009    gcc-9.5.0  sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261010    clang-19
sh                    randconfig-1001-20261010    clang-19
sh                    randconfig-2000-20261009    gcc-16.1.0
sh                    randconfig-2000-20261010    gcc-16.1.0
sh                    randconfig-2001-20261009    gcc-16.1.0
sh                    randconfig-2001-20261010    gcc-16.1.0
sh                   randconfig-r2107-20261009    gcc-16.1.0 cocci
sh                   randconfig-r2300-20261009    gcc-13.4.0 sparse
sh                   randconfig-r2301-20261009    gcc-10.5.0 sparse
sh                   randconfig-r2302-20261010    gcc-16.1.0 sparse
sh                   randconfig-r2305-20261009    gcc-13.4.0 sparse
sh                   randconfig-r2308-20261009    clang-24   sparse
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261010    gcc-16.1.0
sparc                 randconfig-1001-20261010    gcc-16.1.0
sparc                 randconfig-2000-20261009    clang-17
sparc                 randconfig-2000-20261010    gcc-16.1.0
sparc                 randconfig-2001-20261009    clang-17
sparc                 randconfig-2001-20261010    gcc-16.1.0
sparc                randconfig-r2100-20261009    gcc-14.3.0 cocci
sparc                randconfig-r2101-20261009    clang-24   cocci
sparc                randconfig-r2105-20261009    gcc-16.1.0 cocci
sparc                randconfig-r2106-20261009    gcc-16.1.0 cocci
sparc                randconfig-r2200-20261009    gcc-16.1.0 smatch
sparc                randconfig-r2201-20261009    gcc-11.5.0 smatch
sparc                randconfig-r2300-20261009    gcc-16.1.0 sparse
sparc                randconfig-r2302-20261009    gcc-16.1.0 sparse
sparc                randconfig-r2303-20261010    gcc-16.1.0 sparse
sparc                randconfig-r2304-20261009    gcc-16.1.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261010    gcc-16.1.0
sparc64               randconfig-1001-20261010    gcc-16.1.0
sparc64               randconfig-2000-20261009    clang-17
sparc64               randconfig-2000-20261010    gcc-16.1.0
sparc64               randconfig-2001-20261009    clang-17
sparc64               randconfig-2001-20261010    gcc-16.1.0
sparc64              randconfig-r2101-20261009    clang-19   cocci
sparc64              randconfig-r2102-20261009    clang-18   cocci
sparc64              randconfig-r2102-20261009    gcc-14.3.0 cocci
sparc64              randconfig-r2102-20261010    clang-24   cocci
sparc64              randconfig-r2103-20261009    gcc-8.5.0  cocci
sparc64              randconfig-r2104-20261009    clang-17   cocci
sparc64              randconfig-r2104-20261009    gcc-16.1.0 cocci
sparc64              randconfig-r2105-20261010    gcc-14     cocci
sparc64              randconfig-r2106-20261009    gcc-9.5.0  cocci
sparc64              randconfig-r2107-20261009    gcc-13.4.0 cocci
sparc64              randconfig-r2201-20261009    clang-24   smatch
sparc64              randconfig-r2301-20261009    gcc-13.4.0 sparse
sparc64              randconfig-r2303-20261009    gcc-12     sparse
sparc64              randconfig-r2309-20261009    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261010    gcc-16.1.0
um                    randconfig-1001-20261010    gcc-16.1.0
um                    randconfig-2000-20261009    clang-17
um                    randconfig-2000-20261010    gcc-16.1.0
um                    randconfig-2001-20261009    clang-17
um                    randconfig-2001-20261010    gcc-16.1.0
um                   randconfig-r2104-20261009    gcc-13.4.0 cocci
um                   randconfig-r2105-20261009    clang-17   cocci
um                   randconfig-r2200-20261009    gcc-14     smatch
um                   randconfig-r2201-20261009    clang-24   smatch
um                   randconfig-r2201-20261010    clang-17   smatch
um                   randconfig-r2303-20261009    gcc-16.1.0 sparse
um                   randconfig-r2304-20261009    clang-24   sparse
um                   randconfig-r2304-20261009    gcc-8.5.0  sparse
um                   randconfig-r2307-20261009    gcc-9.5.0  sparse
um                   randconfig-r2309-20261009    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261010    clang-22
x86_64      buildonly-randconfig-1001-20261010    clang-22
x86_64      buildonly-randconfig-1002-20261010    clang-22
x86_64      buildonly-randconfig-1003-20261010    clang-22
x86_64      buildonly-randconfig-1004-20261010    clang-22
x86_64      buildonly-randconfig-1005-20261010    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261010    gcc-14
x86_64                randconfig-1001-20261010    gcc-14
x86_64                randconfig-1002-20261010    gcc-14
x86_64                randconfig-1003-20261010    gcc-14
x86_64                randconfig-1004-20261010    gcc-14
x86_64                randconfig-1005-20261010    gcc-14
x86_64                randconfig-1006-20261010    clang-22
x86_64                randconfig-1007-20261010    clang-22
x86_64                randconfig-1008-20261010    clang-22
x86_64                randconfig-1009-20261010    clang-22
x86_64                randconfig-1010-20261010    clang-22
x86_64                randconfig-1011-20261010    clang-22
x86_64                randconfig-1012-20261010    clang-22
x86_64                randconfig-1013-20261010    clang-22
x86_64                randconfig-1014-20261010    clang-22
x86_64                randconfig-1015-20261010    clang-22
x86_64                randconfig-1016-20261010    clang-22
x86_64                randconfig-1017-20261010    clang-22
x86_64                randconfig-2100-20261009    clang-22   cocci
x86_64                randconfig-2100-20261010    clang-22   cocci
x86_64                randconfig-2101-20261009    clang-22   cocci
x86_64                randconfig-2101-20261010    clang-22   cocci
x86_64                randconfig-2102-20261009    clang-22   cocci
x86_64                randconfig-2102-20261010    clang-22   cocci
x86_64                randconfig-2103-20261009    clang-22   cocci
x86_64                randconfig-2103-20261010    clang-22   cocci
x86_64                randconfig-2200-20261009    gcc-14     smatch
x86_64                randconfig-2300-20261009    clang-22   sparse
x86_64                randconfig-2300-20261009    gcc-14     sparse
x86_64                randconfig-2300-20261010    gcc-14     sparse
x86_64                randconfig-2301-20261009    clang-22   sparse
x86_64                randconfig-2301-20261010    gcc-14     sparse
x86_64                randconfig-2302-20261009    clang-22   sparse
x86_64                randconfig-2302-20261010    gcc-14     sparse
x86_64               randconfig-r2105-20261009    gcc-14     cocci
x86_64               randconfig-r2106-20261010    gcc-14     cocci
x86_64               randconfig-r2200-20261009    clang-22   smatch
x86_64               randconfig-r2201-20261009    gcc-14     smatch
x86_64               randconfig-r2300-20261009    gcc-11.5.0 sparse
x86_64               randconfig-r2301-20261009    gcc-11.5.0 sparse
x86_64               randconfig-r2303-20261009    gcc-8.5.0  sparse
x86_64               randconfig-r2306-20261009    clang-22   sparse
x86_64               randconfig-r2307-20261009    gcc-14     sparse
x86_64               randconfig-r2309-20261009    clang-22   sparse
x86_64               randconfig-r2309-20261010    gcc-14     sparse
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
xtensa                randconfig-1000-20261010    gcc-16.1.0
xtensa                randconfig-1001-20261010    gcc-16.1.0
xtensa                randconfig-2000-20261009    clang-17
xtensa                randconfig-2000-20261010    gcc-16.1.0
xtensa                randconfig-2001-20261009    clang-17
xtensa                randconfig-2001-20261010    gcc-16.1.0
xtensa               randconfig-r2101-20261009    clang-18   cocci
xtensa               randconfig-r2101-20261009    gcc-14     cocci
xtensa               randconfig-r2103-20261009    clang-24   cocci
xtensa               randconfig-r2200-20261010    gcc-8.5.0  smatch
xtensa               randconfig-r2307-20261009    clang-22   sparse
xtensa               randconfig-r2309-20261009    clang-17   sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
