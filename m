Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C1546A61E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931586; cv=none; b=Rqv9mkNjq/31QfazdzPzUhTQ1vYh6TaVLtci96q2hHE/efuNw365bbg2OYEOVs1OCZQEELmj2d4RZ9KJ9SbArGBvZ94V1+eKRwOFUcvlJiiy3mQsohW07r4ub0gLsMwYIFgRHR+e4CGAgdYNsuNDKmsQ0K77DxmHC7LNA1vofTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931586; c=relaxed/simple;
	bh=tLwV6r2io/Mtq9vCWQhGpVPbqXUvhLyT/3YPqH8IDSU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DwnB6cGzvVQxAVehsWrSneaXiOeeEzI0A5NWZOyBkuRZ0HCUwK3oadNccx/yMawk+889HL0479o8F95KE8/4bxaraeN5l54iBdruw/icnGxNHayUYSdQlh5nlqpzaMoR05Z/JaRdIRnNQ/sNBtXOVLIyZPH9y9xWmMZv9lILJGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euBnR2x+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euBnR2x+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790931585; x=1822467585;
  h=date:from:to:cc:subject:message-id;
  bh=tLwV6r2io/Mtq9vCWQhGpVPbqXUvhLyT/3YPqH8IDSU=;
  b=euBnR2x+2UqWKhAjbQiOqhoYpTf5Zr0ZhzAPMlpzXnt/hO5bkn4Pj/jE
   yx7d+BfGA5ju6kwwI7J7UI8YCpSZFNSIZFS5iTThih2/f8TLXRKyvEw4g
   74BMt78gjgxKxrn0AzeWSlsB96fMaxfs/PiimL9WUrpjCddk3RKA6SGjc
   xhpiV1J0vIW0Q9C60dYBO5dAzaFg5qzkmTgCUOZHv89tvVmEc3YBzDVRN
   LW9DXanvjuPDCPurQrgx489aWlEAJWuj0fypLFuKFdbITn6NRUi0jxhD/
   B89FJ1eUnb3wtvsZKI7QT8Ik25yUeWiSvQmTc9d1kr7p8dPQBynZtu09p
   w==;
X-CSE-ConnectionGUID: JfOcg14LSem+lShGMPVv4A==
X-CSE-MsgGUID: oGfyQE9WQu+M1d5AK83edA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="113480557"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="113480557"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:59:44 -0700
X-CSE-ConnectionGUID: AzTfQiqDRnWmj2nFaplEmw==
X-CSE-MsgGUID: H0JoxXltRmSfP/el9TGwxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275403585"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Oct 2026 01:59:42 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCZ7E-00000000SqO-0uO7;
	Fri, 02 Oct 2026 08:59:40 +0000
Date: Fri, 02 Oct 2026 16:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:platform] BUILD SUCCESS
 edb2b6d8ea88659679787231253e1acefca63f28
Message-ID: <202610021644.cRZdDD1K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/platform
branch HEAD: edb2b6d8ea88659679787231253e1acefca63f28  x86/platform/olpc: Use named initializers for acpi_device_id

elapsed time: 1075m

configs tested: 321
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20260930    gcc-9.5.0  cocci
alpha                randconfig-r2102-20260930    gcc-8.5.0  cocci
alpha                randconfig-r2103-20260930    gcc-9.5.0  cocci
alpha                randconfig-r2201-20260930    gcc-8.5.0  smatch
alpha                randconfig-r2301-20260930    clang-17   sparse
alpha                randconfig-r2307-20260930    gcc-10.5.0 sparse
alpha                randconfig-r2308-20260930    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261002    clang-17
arc                   randconfig-1001-20261002    clang-17
arc                  randconfig-r2107-20260930    gcc-8.5.0  cocci
arc                  randconfig-r2202-20260930    gcc-16.1.0 smatch
arc                  randconfig-r2303-20260930    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             dove_defconfig    gcc-16.1.0
arm                       integrator_defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261002    clang-17
arm                   randconfig-1001-20261002    clang-17
arm                   randconfig-1002-20261002    clang-17
arm                   randconfig-1003-20261002    clang-17
arm                  randconfig-r2105-20260930    gcc-8.5.0  cocci
arm                  randconfig-r2200-20260930    clang-17   smatch
arm                  randconfig-r2300-20260930    clang-17   sparse
arm                  randconfig-r2300-20260930    gcc-8.5.0  sparse
arm                          s3c6400_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261002    gcc-12.5.0
arm64                 randconfig-1001-20261002    gcc-12.5.0
arm64                 randconfig-1002-20261002    gcc-12.5.0
arm64                 randconfig-1003-20261002    gcc-12.5.0
arm64                randconfig-r2104-20260930    gcc-16.1.0 cocci
arm64                randconfig-r2200-20260930    gcc-12.5.0 smatch
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261002    gcc-12.5.0
csky                  randconfig-1001-20261002    gcc-12.5.0
csky                 randconfig-r2104-20260930    clang-24   cocci
csky                 randconfig-r2106-20260930    gcc-16.1.0 cocci
csky                 randconfig-r2200-20260930    gcc-14.3.0 smatch
csky                 randconfig-r2202-20260930    gcc-10.5.0 smatch
csky                 randconfig-r2307-20260930    gcc-16.1.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261002    gcc-13.4.0
hexagon               randconfig-1001-20261002    gcc-13.4.0
hexagon              randconfig-r2106-20260930    clang-24   cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261002    clang-22
i386        buildonly-randconfig-1001-20261002    clang-22
i386        buildonly-randconfig-1002-20261002    clang-22
i386        buildonly-randconfig-1003-20261002    clang-22
i386        buildonly-randconfig-1004-20261002    clang-22
i386        buildonly-randconfig-1005-20261002    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261002    gcc-14
i386                  randconfig-1001-20261002    gcc-14
i386                  randconfig-1002-20261002    gcc-14
i386                  randconfig-1003-20261002    gcc-14
i386                  randconfig-1004-20261002    gcc-14
i386                  randconfig-1005-20261002    gcc-14
i386                  randconfig-1006-20261002    gcc-14
i386                  randconfig-1007-20261002    clang-22
i386                  randconfig-1008-20261002    clang-22
i386                  randconfig-1009-20261002    clang-22
i386                  randconfig-1010-20261002    clang-22
i386                  randconfig-1011-20261002    clang-22
i386                  randconfig-1012-20261002    clang-22
i386                  randconfig-1013-20261002    clang-22
i386                  randconfig-2100-20260930    clang-22   cocci
i386                  randconfig-2101-20260930    clang-22   cocci
i386                  randconfig-2102-20260930    clang-22   cocci
i386                  randconfig-2103-20260930    clang-22   cocci
i386                  randconfig-2200-20260930    gcc-14     smatch
i386                  randconfig-2300-20260930    gcc-13     sparse
i386                  randconfig-2301-20260930    gcc-13     sparse
i386                  randconfig-2302-20260930    gcc-13     sparse
i386                 randconfig-r2100-20260930    clang-17   cocci
i386                 randconfig-r2105-20260930    gcc-12     cocci
i386                 randconfig-r2304-20260930    gcc-8.5.0  sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261002    gcc-13.4.0
loongarch             randconfig-1001-20261002    gcc-13.4.0
loongarch            randconfig-r2300-20260930    gcc-8.5.0  sparse
loongarch            randconfig-r2301-20260930    gcc-8.5.0  sparse
loongarch            randconfig-r2303-20260930    gcc-8.5.0  sparse
loongarch            randconfig-r2308-20260930    gcc-10.5.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5272c3_defconfig    gcc-16.1.0
m68k                        m5275evb_defconfig    gcc-16.1.0
m68k                       m54418evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2103-20260930    gcc-8.5.0  cocci
m68k                 randconfig-r2104-20260930    gcc-8.5.0  cocci
m68k                 randconfig-r2202-20260930    gcc-15.2.0 smatch
m68k                 randconfig-r2308-20260930    gcc-8.5.0  sparse
m68k                 randconfig-r2309-20260930    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2100-20260930    gcc-8.5.0  cocci
microblaze           randconfig-r2107-20260930    gcc-16.1.0 cocci
microblaze           randconfig-r2304-20260930    clang-17   sparse
microblaze           randconfig-r2306-20260930    gcc-16.1.0 sparse
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
mips                            ip28_defconfig    gcc-16.1.0
mips                         maltaup_defconfig    gcc-16.1.0
mips                     maltaup_xpa_defconfig    gcc-16.1.0
mips                            mtx1_defconfig    gcc-16.1.0
mips                 randconfig-r2102-20260930    clang-17   cocci
mips                 randconfig-r2103-20260930    clang-17   cocci
mips                 randconfig-r2303-20260930    clang-17   sparse
mips                 randconfig-r2304-20260930    gcc-8.5.0  sparse
mips                 randconfig-r2309-20260930    gcc-10.5.0 sparse
nios2                          3c120_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261002    gcc-13.4.0
nios2                 randconfig-1001-20261002    gcc-13.4.0
nios2                randconfig-r2103-20260930    gcc-8.5.0  cocci
nios2                randconfig-r2309-20260930    gcc-8.5.0  sparse
openrisc                          alldefconfig    gcc-16.1.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20260930    gcc-9.5.0  cocci
openrisc             randconfig-r2102-20260930    gcc-9.5.0  cocci
openrisc             randconfig-r2104-20260930    gcc-9.5.0  cocci
openrisc             randconfig-r2301-20260930    gcc-8.5.0  sparse
openrisc             randconfig-r2305-20260930    gcc-8.5.0  sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261002    gcc-14.3.0
parisc                randconfig-1001-20261002    gcc-14.3.0
parisc               randconfig-r2105-20260930    gcc-9.5.0  cocci
parisc               randconfig-r2106-20260930    gcc-9.5.0  cocci
parisc               randconfig-r2200-20260930    gcc-10.5.0 smatch
parisc               randconfig-r2300-20260930    gcc-8.5.0  sparse
parisc               randconfig-r2309-20260930    gcc-16.1.0 sparse
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.1.0
powerpc                       katmai_defconfig    gcc-16.1.0
powerpc                       pcm030_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261002    gcc-14.3.0
powerpc               randconfig-1001-20261002    gcc-14.3.0
powerpc              randconfig-r2101-20260930    clang-17   cocci
powerpc              randconfig-r2106-20260930    gcc-8.5.0  cocci
powerpc              randconfig-r2305-20260930    gcc-8.5.0  sparse
powerpc              randconfig-r2306-20260930    gcc-10.5.0 sparse
powerpc              randconfig-r2306-20260930    gcc-8.5.0  sparse
powerpc64             randconfig-1000-20261002    gcc-14.3.0
powerpc64             randconfig-1001-20261002    gcc-14.3.0
powerpc64            randconfig-r2100-20260930    clang-20   cocci
powerpc64            randconfig-r2304-20260930    gcc-8.5.0  sparse
powerpc64            randconfig-r2307-20260930    gcc-8.5.0  sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261002    clang-24
riscv                 randconfig-1001-20261002    clang-24
riscv                 randconfig-2000-20260930    gcc-14.3.0
riscv                 randconfig-2000-20260930    gcc-15.2.0
riscv                 randconfig-2001-20260930    gcc-14.3.0
riscv                 randconfig-2001-20260930    gcc-8.5.0
riscv                randconfig-r2103-20260930    clang-20   cocci
riscv                randconfig-r2201-20260930    clang-17   smatch
riscv                randconfig-r2305-20260930    clang-17   sparse
riscv                randconfig-r2308-20260930    gcc-16.1.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261002    clang-24
s390                  randconfig-1001-20261002    clang-24
s390                  randconfig-2000-20260930    clang-24
s390                  randconfig-2000-20260930    gcc-14.3.0
s390                  randconfig-2001-20260930    gcc-14.3.0
s390                  randconfig-2001-20260930    gcc-8.5.0
s390                 randconfig-r2100-20260930    gcc-11.5.0 cocci
s390                 randconfig-r2101-20260930    clang-20   cocci
s390                 randconfig-r2105-20260930    clang-24   cocci
s390                 randconfig-r2105-20260930    gcc-16.1.0 cocci
s390                 randconfig-r2107-20260930    clang-24   cocci
s390                 randconfig-r2202-20260930    clang-18   smatch
s390                 randconfig-r2306-20260930    gcc-8.5.0  sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          apsh4a3a_defconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261002    clang-24
sh                    randconfig-1001-20261002    clang-24
sh                    randconfig-2000-20260930    gcc-14.3.0
sh                    randconfig-2001-20260930    gcc-12.5.0
sh                    randconfig-2001-20260930    gcc-14.3.0
sh                   randconfig-r2106-20260930    gcc-16.1.0 cocci
sh                   randconfig-r2200-20260930    gcc-16.1.0 smatch
sh                   randconfig-r2302-20260930    clang-17   sparse
sh                   randconfig-r2302-20260930    gcc-8.5.0  sparse
sh                           sdk7780_defconfig    gcc-16.1.0
sh                            se7780_defconfig    gcc-16.1.0
sh                             shmin_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261002    clang-24
sparc                 randconfig-1001-20261002    clang-24
sparc                 randconfig-2000-20260930    gcc-10.5.0
sparc                 randconfig-2000-20260930    gcc-14.3.0
sparc                 randconfig-2001-20260930    gcc-10.5.0
sparc                 randconfig-2001-20260930    gcc-8.5.0
sparc                randconfig-r2102-20260930    clang-20   cocci
sparc                randconfig-r2301-20260930    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261002    clang-24
sparc64               randconfig-1001-20261002    clang-24
sparc64               randconfig-2000-20260930    gcc-10.5.0
sparc64               randconfig-2000-20260930    gcc-8.5.0
sparc64               randconfig-2001-20260930    gcc-10.5.0
sparc64               randconfig-2001-20260930    gcc-9.5.0
sparc64              randconfig-r2101-20260930    clang-24   cocci
sparc64              randconfig-r2107-20260930    gcc-9.5.0  cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261002    clang-24
um                    randconfig-1001-20261002    clang-24
um                    randconfig-2000-20260930    clang-24
um                    randconfig-2000-20260930    gcc-10.5.0
um                    randconfig-2001-20260930    clang-24
um                    randconfig-2001-20260930    gcc-10.5.0
um                   randconfig-r2101-20260930    gcc-8.5.0  cocci
um                   randconfig-r2201-20260930    clang-17   smatch
um                   randconfig-r2302-20260930    gcc-8.5.0  sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261002    gcc-14
x86_64      buildonly-randconfig-1001-20261002    gcc-14
x86_64      buildonly-randconfig-1002-20261002    gcc-14
x86_64      buildonly-randconfig-1003-20261002    gcc-14
x86_64      buildonly-randconfig-1004-20261002    gcc-14
x86_64      buildonly-randconfig-1005-20261002    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261002    gcc-14
x86_64                randconfig-1001-20261002    gcc-14
x86_64                randconfig-1002-20261002    gcc-14
x86_64                randconfig-1003-20261002    gcc-14
x86_64                randconfig-1004-20261002    gcc-14
x86_64                randconfig-1005-20261002    gcc-14
x86_64                randconfig-1006-20261002    clang-22
x86_64                randconfig-1007-20261002    clang-22
x86_64                randconfig-1008-20261002    clang-22
x86_64                randconfig-1009-20261002    clang-22
x86_64                randconfig-1010-20261002    clang-22
x86_64                randconfig-1011-20261002    clang-22
x86_64                randconfig-1012-20261002    clang-22
x86_64                randconfig-1013-20261002    clang-22
x86_64                randconfig-1014-20261002    clang-22
x86_64                randconfig-1015-20261002    clang-22
x86_64                randconfig-1016-20261002    clang-22
x86_64                randconfig-1017-20261002    clang-22
x86_64                randconfig-2100-20260930    clang-22   cocci
x86_64                randconfig-2101-20260930    clang-22   cocci
x86_64                randconfig-2102-20260930    clang-22   cocci
x86_64                randconfig-2103-20260930    clang-22   cocci
x86_64                randconfig-2200-20260930    gcc-14     smatch
x86_64                randconfig-2300-20260930    gcc-13     sparse
x86_64                randconfig-2301-20260930    gcc-13     sparse
x86_64                randconfig-2302-20260930    gcc-13     sparse
x86_64               randconfig-r2104-20260930    gcc-8.5.0  cocci
x86_64               randconfig-r2305-20260930    gcc-8.5.0  sparse
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
xtensa                randconfig-1000-20261002    clang-24
xtensa                randconfig-1001-20261002    clang-24
xtensa                randconfig-2000-20260930    gcc-10.5.0
xtensa                randconfig-2000-20260930    gcc-12.5.0
xtensa                randconfig-2001-20260930    gcc-10.5.0
xtensa               randconfig-r2201-20260930    gcc-10.5.0 smatch
xtensa               randconfig-r2307-20260930    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
