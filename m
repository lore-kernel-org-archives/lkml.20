Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490347;
	b=ARILtx5NaVdnFQijbsENVHtUOjKQ5p0jjOI58fE8OwpCqB0p3aX+L6x+0t2U1kP9Ju/t
	 xPC0rf44FNhWl1eUczGtMUiTEeVagWx8VQq4N+xOIUx8iVCkDEgnP1GAJesRn9s1y5afE
	 exkfRCId7sk8Vb331hNHUoD8fnzD2bK7sOgVwAibYuYn3t2J5ij6XkwViyqYVeW8m+f2c
	 XTT6eHUgkEDP/FmYSHHrXqhMVh7cJhPeTdW84jq5f9qTZbalv83UeH8eHx0v/OSGvdiTQ
	 RHgj6tS9GXIkpEoYBtgFaG5HE8/2LndgReZUZwzdxpE/iU7Wdsx1cUqSkTOaREIWX6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490347;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+/pORRW5vV7sL+/2h13stoAbWwRpDSjVbjtJr339z7k=;
	b=zL+/OdYwMdq3bCOVbKbgAyFd3sE+6gqaq8AUaW8w7IFDxLt4GuG0M60D6bu8pwGHt+1O
	 XqXWx45FkQauF/GUMk2300j8v0O3DIKnh/zXUOtdm1ZhHxwgmnqRqFPHlB4uLoeBQPIc0
	 +PpMAwbi0dUbXU9ERez5gURK1zWrHEtoMkjVn/hGW9MAt/wWM8i6IyqkDWwxMK0b+QE9X
	 HamqbTqf4PBNmEGAOyy8H8nFr5B7Hex/H8ksx+mar27+e+P5WG7u4FZYGIPOstPMdyGty
	 6UOV/QTJSSpjU8fZzQMNlmS/aGxFfYAYNUenLzCRKarVaz2g0TDNzv9yoN4Yq3T1eIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k61X9cq5;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58CF606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D58CF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k61X9cq5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792490347; x=1824026347;
  h=date:from:to:cc:subject:message-id;
  bh=BzRxWWD1hC9aN6JE/2sK8xVbwzcR/3syi/Y2zZADMdo=;
  b=k61X9cq5aFd7I4wrJYChZN/dIONBVJqPYxB5W9XjTiGXw6c3LbkL/2on
   k81//4BRbvN8871oF4fiHJqbFbQ987jeaVOyL8mH+UO+VzAoOGZqLQN0W
   IG6mfI2vb0mjl3UHj99SaSqQIulk7OP3bmVbGrnYBHyvDureDC5PL4Jds
   51ZIVADpjIqgO8zyGCjOoTM7Hj+0XhgyFMEJJW0hJZp1oj8YZCD9lH2ZY
   hIDLkOzRqU6FsJZOdNioWN6WJfQjoHqGQozRp5Zh0eClZQ0b/41RIXmmN
   eapZG6ngDZJ7qtBY7Mx27X+V85sUAs9uMiSUoYKhivrbvRsum+PIWhMIA
   g==;
X-CSE-ConnectionGUID: f+kpOOEJQvGoXPJMgsAb1w==
X-CSE-MsgGUID: Gf3Pn7JXRXSIdqdkIWop/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1073246"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1073246"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 02:59:07 -0700
X-CSE-ConnectionGUID: uQOahe3mT9S6pFQrcItDEg==
X-CSE-MsgGUID: LJU4j1X5QyyrTauPvagqug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3231719"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Oct 2026 02:59:05 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ6cY-00000000NGx-2o4m;
	Tue, 20 Oct 2026 09:59:02 +0000
Date: Tue, 20 Oct 2026 17:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 c803a3f002ec36285d15c462ac3519198207bb3a
Message-ID: <202610201742.il8dGvkW-lkp@intel.com>
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
branch HEAD: c803a3f002ec36285d15c462ac3519198207bb3a  Merge branch into tip/master: 'x86/tdx'

elapsed time: 1663m

configs tested: 326
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                randconfig-r2100-20261019    gcc-10.5.0 cocci
alpha                randconfig-r2106-20261019    gcc-8.5.0  cocci
alpha                randconfig-r2111-20261019    gcc-8.5.0  cocci
alpha                randconfig-r2200-20261019    gcc-16.2.0 smatch
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261020    gcc-10.5.0
arc                   randconfig-1001-20261020    gcc-10.5.0
arc                   randconfig-2000-20261019    gcc-8.5.0
arc                   randconfig-2001-20261019    gcc-8.5.0
arc                  randconfig-r2107-20261019    gcc-8.5.0  cocci
arc                  randconfig-r2202-20261019    gcc-11.5.0 smatch
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                             hisi_defconfig    gcc-16.2.0
arm                         mvebu_v5_defconfig    gcc-16.2.0
arm                         neponset_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261020    gcc-10.5.0
arm                   randconfig-1001-20261020    gcc-10.5.0
arm                   randconfig-1002-20261020    gcc-10.5.0
arm                   randconfig-1003-20261020    gcc-10.5.0
arm                   randconfig-2000-20261019    gcc-8.5.0
arm                   randconfig-2001-20261019    clang-17
arm                   randconfig-2001-20261019    gcc-8.5.0
arm                  randconfig-r2309-20261019    gcc-10.5.0 sparse
arm                     vt8500_v6_v7_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261020    gcc-8.5.0
arm64                 randconfig-1001-20261020    gcc-8.5.0
arm64                 randconfig-1002-20261020    gcc-8.5.0
arm64                 randconfig-1003-20261020    gcc-8.5.0
arm64                 randconfig-2000-20261019    gcc-14.4.0
arm64                 randconfig-2000-20261019    gcc-15.3.0
arm64                 randconfig-2001-20261019    gcc-15.3.0
arm64                 randconfig-2001-20261019    gcc-8.5.0
arm64                randconfig-r2100-20261019    gcc-14.4.0 cocci
arm64                randconfig-r2104-20261019    gcc-8.5.0  cocci
arm64                randconfig-r2110-20261019    gcc-8.5.0  cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261020    gcc-8.5.0
csky                  randconfig-1001-20261020    gcc-8.5.0
csky                  randconfig-2000-20261019    gcc-15.3.0
csky                  randconfig-2000-20261019    gcc-16.2.0
csky                  randconfig-2001-20261019    gcc-15.3.0
csky                 randconfig-r2101-20261019    gcc-10.5.0 cocci
csky                 randconfig-r2103-20261019    gcc-16.2.0 cocci
csky                 randconfig-r2200-20261019    gcc-16.2.0 smatch
csky                 randconfig-r2300-20261019    gcc-16.2.0 sparse
csky                 randconfig-r2301-20261019    gcc-16.2.0 sparse
csky                 randconfig-r2308-20261019    gcc-16.2.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261020    clang-17
hexagon               randconfig-1001-20261020    clang-17
hexagon               randconfig-2000-20261019    clang-17
hexagon               randconfig-2000-20261019    gcc-15.3.0
hexagon               randconfig-2001-20261019    clang-24
hexagon               randconfig-2001-20261019    gcc-15.3.0
hexagon              randconfig-r2107-20261019    clang-24   cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261020    clang-22
i386        buildonly-randconfig-1001-20261020    clang-22
i386        buildonly-randconfig-1002-20261020    clang-22
i386        buildonly-randconfig-1003-20261020    clang-22
i386        buildonly-randconfig-1004-20261020    clang-22
i386        buildonly-randconfig-1005-20261020    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261020    gcc-14
i386                  randconfig-1001-20261020    gcc-14
i386                  randconfig-1002-20261020    gcc-14
i386                  randconfig-1003-20261020    gcc-14
i386                  randconfig-1004-20261020    gcc-14
i386                  randconfig-1005-20261020    gcc-14
i386                  randconfig-1006-20261020    gcc-14
i386                  randconfig-1007-20261020    gcc-14
i386                  randconfig-1008-20261020    gcc-14
i386                  randconfig-1009-20261020    gcc-14
i386                  randconfig-1010-20261020    gcc-14
i386                  randconfig-1011-20261020    gcc-14
i386                  randconfig-1012-20261020    gcc-14
i386                  randconfig-1013-20261020    gcc-14
i386                  randconfig-2000-20261019    clang-22
i386                  randconfig-2000-20261019    gcc-8.5.0
i386                  randconfig-2001-20261019    clang-22
i386                  randconfig-2001-20261019    gcc-8.5.0
i386                  randconfig-2100-20261019    gcc-14     cocci
i386                  randconfig-2101-20261019    gcc-14     cocci
i386                  randconfig-2102-20261019    clang-22   cocci
i386                  randconfig-2102-20261019    gcc-14     cocci
i386                  randconfig-2103-20261019    gcc-14     cocci
i386                  randconfig-2104-20261019    gcc-14     cocci
i386                  randconfig-2105-20261019    gcc-14     cocci
i386                  randconfig-2200-20261019    gcc-14     smatch
i386                  randconfig-2300-20261019    gcc-14     sparse
i386                  randconfig-2301-20261019    gcc-14     sparse
i386                  randconfig-2302-20261019    gcc-14     sparse
i386                 randconfig-r2303-20261019    gcc-16.2.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261020    clang-17
loongarch             randconfig-1001-20261020    clang-17
loongarch             randconfig-2000-20261019    clang-24
loongarch             randconfig-2000-20261019    gcc-11.5.0
loongarch             randconfig-2001-20261019    gcc-11.5.0
loongarch             randconfig-2001-20261019    gcc-12.5.0
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5235evb_defconfig    clang-17
m68k                 randconfig-r2106-20261019    gcc-8.5.0  cocci
m68k                 randconfig-r2109-20261019    gcc-10.5.0 cocci
m68k                 randconfig-r2304-20261019    gcc-16.2.0 sparse
m68k                 randconfig-r2306-20261019    clang-24   sparse
m68k                 randconfig-r2310-20261019    gcc-16.2.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2105-20261019    gcc-8.5.0  cocci
microblaze           randconfig-r2109-20261019    gcc-15.3.0 cocci
microblaze           randconfig-r2201-20261019    gcc-10.5.0 smatch
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                         bcm47xx_defconfig    gcc-16.2.0
mips                      cu1000-neo_defconfig    gcc-16.2.0
mips                       maltaaprp_defconfig    clang-17
mips                 randconfig-r2202-20261019    clang-24   smatch
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261020    clang-17
nios2                 randconfig-1001-20261020    clang-17
nios2                 randconfig-2000-20261019    gcc-11.5.0
nios2                 randconfig-2001-20261019    gcc-11.5.0
nios2                randconfig-r2102-20261019    gcc-8.5.0  cocci
nios2                randconfig-r2201-20261019    gcc-11.5.0 smatch
nios2                randconfig-r2309-20261019    clang-24   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc             randconfig-r2104-20261019    gcc-10.5.0 cocci
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261020    clang-17
parisc                randconfig-1001-20261020    clang-17
parisc                randconfig-2000-20261019    gcc-11.5.0
parisc                randconfig-2000-20261019    gcc-15.3.0
parisc                randconfig-2001-20261019    gcc-11.5.0
parisc                randconfig-2001-20261019    gcc-8.5.0
parisc               randconfig-r2101-20261019    gcc-8.5.0  cocci
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    gcc-16.2.0
powerpc                           g5_defconfig    clang-17
powerpc               randconfig-1000-20261020    clang-17
powerpc               randconfig-1001-20261020    clang-17
powerpc               randconfig-2000-20261019    clang-22
powerpc               randconfig-2000-20261019    gcc-8.5.0
powerpc               randconfig-2001-20261019    clang-22
powerpc               randconfig-2001-20261019    clang-24
powerpc              randconfig-r2102-20261019    gcc-10.5.0 cocci
powerpc              randconfig-r2108-20261019    gcc-10.5.0 cocci
powerpc              randconfig-r2111-20261019    gcc-15.3.0 cocci
powerpc              randconfig-r2305-20261019    gcc-16.2.0 sparse
powerpc                      taishan_defconfig    gcc-16.2.0
powerpc                      tqm8541_defconfig    clang-17
powerpc64             randconfig-1000-20261020    clang-17
powerpc64             randconfig-1001-20261020    clang-17
powerpc64             randconfig-2000-20261019    clang-22
powerpc64             randconfig-2000-20261019    clang-24
powerpc64             randconfig-2001-20261019    clang-22
powerpc64             randconfig-2001-20261019    clang-24
powerpc64            randconfig-r2307-20261019    gcc-12.5.0 sparse
powerpc64            randconfig-r2308-20261019    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261020    gcc-11.5.0
riscv                 randconfig-1001-20261020    gcc-11.5.0
riscv                 randconfig-2000-20261019    clang-17
riscv                 randconfig-2000-20261019    gcc-13.5.0
riscv                 randconfig-2001-20261019    clang-24
riscv                 randconfig-2001-20261019    gcc-13.5.0
riscv                randconfig-r2103-20261019    gcc-10.5.0 cocci
riscv                randconfig-r2105-20261019    gcc-16.2.0 cocci
riscv                randconfig-r2108-20261019    gcc-8.5.0  cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261020    gcc-11.5.0
s390                  randconfig-1001-20261020    gcc-11.5.0
s390                  randconfig-2000-20261019    clang-20
s390                  randconfig-2000-20261019    gcc-13.5.0
s390                  randconfig-2001-20261019    gcc-10.5.0
s390                  randconfig-2001-20261019    gcc-13.5.0
s390                 randconfig-r2311-20261019    clang-24   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                          ecovec24_defconfig    clang-17
sh                      magicpanelr2_defconfig    clang-17
sh                    randconfig-1000-20261020    gcc-11.5.0
sh                    randconfig-1001-20261020    gcc-11.5.0
sh                    randconfig-2000-20261019    gcc-13.5.0
sh                    randconfig-2001-20261019    gcc-13.5.0
sh                    randconfig-2001-20261019    gcc-15.3.0
sh                   randconfig-r2311-20261019    gcc-10.5.0 sparse
sh                            se7780_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261020    clang-20
sparc                 randconfig-1001-20261020    clang-20
sparc                 randconfig-2000-20261019    gcc-11.5.0
sparc                 randconfig-2000-20261019    gcc-16.2.0
sparc                 randconfig-2001-20261019    gcc-11.5.0
sparc                randconfig-r2310-20261019    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261020    clang-20
sparc64               randconfig-1001-20261020    clang-20
sparc64               randconfig-2000-20261019    gcc-11.5.0
sparc64               randconfig-2000-20261019    gcc-8.5.0
sparc64               randconfig-2001-20261019    clang-24
sparc64               randconfig-2001-20261019    gcc-11.5.0
sparc64              randconfig-r2306-20261019    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261020    clang-20
um                    randconfig-1001-20261020    clang-20
um                    randconfig-2000-20261019    gcc-11.5.0
um                    randconfig-2000-20261019    gcc-12
um                    randconfig-2001-20261019    gcc-11.5.0
um                    randconfig-2001-20261019    gcc-12
um                   randconfig-r2110-20261019    clang-17   cocci
um                   randconfig-r2307-20261019    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261020    gcc-14
x86_64      buildonly-randconfig-1001-20261020    gcc-14
x86_64      buildonly-randconfig-1002-20261020    gcc-14
x86_64      buildonly-randconfig-1003-20261020    gcc-14
x86_64      buildonly-randconfig-1004-20261020    gcc-14
x86_64      buildonly-randconfig-1005-20261020    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261020    clang-22
x86_64                randconfig-1001-20261020    clang-22
x86_64                randconfig-1002-20261020    clang-22
x86_64                randconfig-1003-20261020    clang-22
x86_64                randconfig-1004-20261020    clang-22
x86_64                randconfig-1005-20261020    clang-22
x86_64                randconfig-1006-20261020    gcc-14
x86_64                randconfig-1007-20261020    gcc-14
x86_64                randconfig-1008-20261020    gcc-14
x86_64                randconfig-1009-20261020    gcc-14
x86_64                randconfig-1010-20261020    gcc-14
x86_64                randconfig-1011-20261020    gcc-14
x86_64                randconfig-1012-20261020    clang-22
x86_64                randconfig-1013-20261020    clang-22
x86_64                randconfig-1014-20261020    clang-22
x86_64                randconfig-1015-20261020    clang-22
x86_64                randconfig-1016-20261020    clang-22
x86_64                randconfig-1017-20261020    clang-22
x86_64                randconfig-2000-20261019    clang-22
x86_64                randconfig-2000-20261019    gcc-14
x86_64                randconfig-2001-20261019    clang-22
x86_64                randconfig-2100-20261019    clang-22   cocci
x86_64                randconfig-2101-20261019    clang-22   cocci
x86_64                randconfig-2101-20261019    gcc-14     cocci
x86_64                randconfig-2102-20261019    clang-22   cocci
x86_64                randconfig-2103-20261019    clang-22   cocci
x86_64                randconfig-2103-20261019    gcc-14     cocci
x86_64                randconfig-2104-20261019    clang-22   cocci
x86_64                randconfig-2105-20261019    clang-22   cocci
x86_64                randconfig-2105-20261019    gcc-14     cocci
x86_64                randconfig-2200-20261019    clang-22   smatch
x86_64                randconfig-2300-20261019    gcc-14     sparse
x86_64                randconfig-2301-20261019    gcc-14     sparse
x86_64                randconfig-2302-20261019    gcc-14     sparse
x86_64               randconfig-r2302-20261019    gcc-16.2.0 sparse
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
xtensa                   cadence_csp_defconfig    clang-17
xtensa                randconfig-1000-20261020    clang-20
xtensa                randconfig-1001-20261020    clang-20
xtensa                randconfig-2000-20261019    gcc-11.5.0
xtensa                randconfig-2000-20261019    gcc-15.3.0
xtensa                randconfig-2001-20261019    gcc-11.5.0
xtensa                randconfig-2001-20261019    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
