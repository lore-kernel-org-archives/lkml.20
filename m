Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455664;
	b=pitJA+sviI5qGxYM07RBv+Cv6xVz/yhDYE4ibN7/PNzuC0PiCnxeRXjASLsFOGagj7gi
	 pUwE2GAjjnmQfAUIbnAEkoZBDd8Tewkxe0AEz4kQw+ebw/XYXuzS+k64ErdC3YE6X/RIN
	 Q8eY1tWn1txQLvVM9QPQwVtWQWv196AywzGOmNrBoziSih9JBTAgebH/EfOFxQSNXRumY
	 abttb8fhpHVFHgQhM0MhUP1cRLAjJvf5F1OUIhZ9sF8RtNHyUzVj7XjFR491kIZVA+pPE
	 qgU3cAa0jyn9pvFSSpwc8L+GrgK2IDBKYOGrfUrVqfexqzbtNKrPA6Wx5uhLsbvlFGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455664;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=y8lj/DjNbkjgOpOwfDcjgUDX938eBmt9ohPjCYNfnKQ=;
	b=gkOIQ4xZBPsRYKymoe9mEtRl2cotwNaRNsaMyE6cbhvivZU0rEKI2Ou7IEp7GvVNTaRc
	 2k6sxCqxy63TRIpvvn/q7ojGz3/iOy2uSyLDwr6+Y95OyffSSLPW4z7HtoASVIl9nCu1o
	 tNwKepZZjJ9TEawW448kdlzRAsalAy3il3/D7gZLOSu5Fbwk6YUpg6Wc+GkmkhbDI7pnG
	 scNF1k3V65y6Rl51y/TJIO1PztKsgv7HCLztjpz/jDovyzqfijDoisDRAHc2HnGvW4QnU
	 kmTw7h/MJelMrW1wliDdZBLnD7Xt/IMvn/dYQZfEruAxR+L6ghjqwHCYj1cwMZ9WOeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bsAhJtdr;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BC8606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99BC8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bsAhJtdr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792455663; x=1823991663;
  h=date:from:to:cc:subject:message-id;
  bh=YU7n3ZFyoNJQRJrFcJAX/ex2QLAjfyTSdSQw9LaW1kM=;
  b=bsAhJtdr97FlH6OuILIS4o2DWJRPHjbjgM2Xf+tzkkYsw0ZzglpcxxwN
   JX9UyF6aUtNariKTt3U2wbM+4nLb+nexLTz6ZQAJr1NSqF9bt3OpIEn80
   Nff2qP3czzKvGO06EMkEVMn9RMZioJlA8+ZuxEb7c4B62n0ie3qkc7RVE
   SZu0DgH1Uf7geqZV/+vzxrjY0d95b0Muoc943qn0Z1V1yC0xIMwqXgvam
   X8YrtMhw3QP8F+VpjvdmfMb2urXRZMiRdU1j72hkJWh1XNeq3YUPOJsHE
   34svpTk2tymM2RzdjZqaDalPqzOhkJ0Oe1cLYosi58mTXU8Wf/YZsMTgX
   g==;
X-CSE-ConnectionGUID: Yz5LE711TbWvfv4GKGHDNw==
X-CSE-MsgGUID: 2w7iYVmpR3ec2V4Ul9drZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1164063"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1164063"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 17:21:02 -0700
X-CSE-ConnectionGUID: ly7Bs1ZHQNiFL8l7ILntIQ==
X-CSE-MsgGUID: VFaS1WA0TgOgnnzo/iGQMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2740492"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Oct 2026 17:21:01 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIxb8-00000000MeW-3vg0;
	Tue, 20 Oct 2026 00:20:58 +0000
Date: Tue, 20 Oct 2026 08:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip:urgent] BUILD SUCCESS
 5f68525de8f13335cf22f6127005e65c7c68b48f
Message-ID: <202610200829.RqXRPp4v-lkp@intel.com>
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
branch HEAD: 5f68525de8f13335cf22f6127005e65c7c68b48f  Merge branch into tip/master: 'x86/mm'

elapsed time: 1084m

configs tested: 229
configs skipped: 148

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                randconfig-r2100-20261019    gcc-10.5.0 cocci
alpha                randconfig-r2111-20261019    gcc-8.5.0  cocci
alpha                randconfig-r2200-20261019    gcc-16.2.0 smatch
arc                                allnoconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261020    gcc-10.5.0
arc                   randconfig-1001-20261020    gcc-10.5.0
arc                   randconfig-2000-20261019    gcc-8.5.0
arc                   randconfig-2001-20261019    gcc-8.5.0
arc                  randconfig-r2107-20261019    gcc-8.5.0  cocci
arm                                allnoconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                             dove_defconfig    gcc-16.2.0
arm                        imx_v4_v5_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261020    gcc-10.5.0
arm                   randconfig-1001-20261020    gcc-10.5.0
arm                   randconfig-1002-20261020    gcc-10.5.0
arm                   randconfig-1003-20261020    gcc-10.5.0
arm                   randconfig-2000-20261019    gcc-8.5.0
arm                   randconfig-2001-20261019    gcc-8.5.0
arm                            sama7_defconfig    gcc-16.2.0
arm                     vt8500_v6_v7_defconfig    gcc-16.2.0
arm                          wpcm450_defconfig    gcc-16.2.0
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261020    gcc-8.5.0
arm64                 randconfig-1001-20261020    gcc-8.5.0
arm64                 randconfig-1002-20261020    gcc-8.5.0
arm64                 randconfig-1003-20261020    gcc-8.5.0
arm64                 randconfig-2000-20261019    gcc-15.3.0
arm64                 randconfig-2001-20261019    gcc-15.3.0
arm64                randconfig-r2104-20261019    gcc-8.5.0  cocci
arm64                randconfig-r2110-20261019    gcc-8.5.0  cocci
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261020    gcc-8.5.0
csky                  randconfig-1001-20261020    gcc-8.5.0
csky                  randconfig-2000-20261019    gcc-15.3.0
csky                  randconfig-2001-20261019    gcc-15.3.0
csky                 randconfig-r2101-20261019    gcc-10.5.0 cocci
csky                 randconfig-r2300-20261019    gcc-16.2.0 sparse
csky                 randconfig-r2301-20261019    gcc-16.2.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261020    clang-17
hexagon               randconfig-1001-20261020    clang-17
hexagon               randconfig-2000-20261019    gcc-15.3.0
hexagon               randconfig-2001-20261019    gcc-15.3.0
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
i386                  randconfig-2302-20261019    clang-22   sparse
i386                  randconfig-2302-20261019    gcc-14     sparse
i386                 randconfig-r2303-20261019    gcc-16.2.0 sparse
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261020    clang-17
loongarch             randconfig-1001-20261020    clang-17
loongarch             randconfig-2000-20261019    gcc-11.5.0
loongarch             randconfig-2001-20261019    gcc-11.5.0
m68k                               allnoconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                          nettel_defconfig    gcc-16.2.0
m68k                 randconfig-r2106-20261019    gcc-8.5.0  cocci
m68k                 randconfig-r2109-20261019    gcc-10.5.0 cocci
m68k                 randconfig-r2304-20261019    gcc-16.2.0 sparse
m68k                 randconfig-r2306-20261019    clang-24   sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2105-20261019    gcc-8.5.0  cocci
microblaze           randconfig-r2201-20261019    gcc-10.5.0 smatch
mips                               allnoconfig    gcc-16.2.0
mips                 randconfig-r2202-20261019    clang-24   smatch
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261020    clang-17
nios2                 randconfig-1001-20261020    clang-17
nios2                 randconfig-2000-20261019    gcc-11.5.0
nios2                 randconfig-2001-20261019    gcc-11.5.0
nios2                randconfig-r2309-20261019    clang-24   sparse
openrisc                           allnoconfig    clang-24
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                randconfig-1000-20261020    clang-17
parisc                randconfig-1001-20261020    clang-17
parisc                randconfig-2000-20261019    gcc-11.5.0
parisc                randconfig-2001-20261019    gcc-11.5.0
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc               randconfig-1000-20261020    clang-17
powerpc               randconfig-1001-20261020    clang-17
powerpc               randconfig-2000-20261019    clang-22
powerpc               randconfig-2001-20261019    clang-22
powerpc              randconfig-r2102-20261019    gcc-10.5.0 cocci
powerpc              randconfig-r2108-20261019    gcc-10.5.0 cocci
powerpc              randconfig-r2305-20261019    gcc-16.2.0 sparse
powerpc                      stx_gp3_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261020    clang-17
powerpc64             randconfig-1001-20261020    clang-17
powerpc64             randconfig-2000-20261019    clang-22
powerpc64             randconfig-2001-20261019    clang-22
powerpc64            randconfig-r2308-20261019    clang-24   sparse
riscv                              allnoconfig    clang-24
riscv                 randconfig-1000-20261020    gcc-11.5.0
riscv                 randconfig-1001-20261020    gcc-11.5.0
riscv                 randconfig-2000-20261019    gcc-13.5.0
riscv                 randconfig-2001-20261019    gcc-13.5.0
riscv                randconfig-r2103-20261019    gcc-10.5.0 cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                  randconfig-1000-20261020    gcc-11.5.0
s390                  randconfig-1001-20261020    gcc-11.5.0
s390                  randconfig-2000-20261019    gcc-13.5.0
s390                  randconfig-2001-20261019    gcc-13.5.0
s390                 randconfig-r2311-20261019    clang-24   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7705_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261020    gcc-11.5.0
sh                    randconfig-1001-20261020    gcc-11.5.0
sh                    randconfig-2000-20261019    gcc-13.5.0
sh                    randconfig-2001-20261019    gcc-13.5.0
sparc                              allnoconfig    clang-24
sparc                 randconfig-1000-20261020    clang-20
sparc                 randconfig-1001-20261020    clang-20
sparc                 randconfig-2000-20261019    gcc-11.5.0
sparc                 randconfig-2001-20261019    gcc-11.5.0
sparc                randconfig-r2310-20261019    clang-24   sparse
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261020    clang-20
sparc64               randconfig-1001-20261020    clang-20
sparc64               randconfig-2000-20261019    gcc-11.5.0
sparc64               randconfig-2001-20261019    gcc-11.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261020    clang-20
um                    randconfig-1001-20261020    clang-20
um                    randconfig-2000-20261019    gcc-11.5.0
um                    randconfig-2001-20261019    gcc-11.5.0
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
x86_64                randconfig-2301-20261019    clang-22   sparse
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
xtensa                randconfig-1000-20261020    clang-20
xtensa                randconfig-1001-20261020    clang-20
xtensa                randconfig-2000-20261019    gcc-11.5.0
xtensa                randconfig-2001-20261019    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
