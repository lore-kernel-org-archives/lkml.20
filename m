Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046768;
	b=H6XEMAAAzNe9YxIWKimiBZAn++w+VvETLVSai46WVl4nGqFTM0N8TSq2JfK4uLtPhjlO
	 +EKtojwM1GvaVDWvmU3YN57eODvrFgz9u/TIp5g2KdFZ5RY7CZWmXo65Mwr20bdSNr1wL
	 TahOHqS2vQBPA9hPwcQ7LZobol6tT5Te17Rcv+Cv9tQkBWYOM39oekbb/W9Puw5Z/XLKj
	 gURjkE/qEz0Pp4qkIUYprEzVmG1WyPZLPHRKNb7axvw10Crgz33dG68wdbqZwhAyKrsVt
	 Q45nFhkaFtYupFyepahmU630CPISW9cChNgdz97V1MP6wG81xPA34KVrC2qD7FEMEMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046768;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YnWF+YOQH18oldZuCNFlCL49+dZkN64v1ufmBHW3RIk=;
	b=iU7vWqfnEkQ79SKXCKVwKs13jX7m/Qsf5kjg7Q5Y8H1LDKHne6h0npllB9E6hV1pg80g
	 AkWzg4UsGRicJ7J7GcgTFo74Neny3PWhmh9QT0P6l9rQYDmKUITDHvgdmz+1pk5SxM5r5
	 ELuJBFn/Zn3sPZ98SQVuhLjSapG89JcScjhQzTFEuGgSUdk0vDefgkU45hbqQ1KHwr1bS
	 jheWfYG74AcxToOyYhSic090X/jsVgxynqdqR1c1FAqI52ih4apD/Pg0yja99Y9y1iz4k
	 odqUh6EegKL0UK1GSe8ItJ/6qYHItkyHSiMJGV/IhRqyi/kN9HKYujdSauM9mtzol8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lFqa+Jbb;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC71606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC71606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lFqa+Jbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794046767; x=1825582767;
  h=date:from:to:cc:subject:message-id;
  bh=DWVXaBVtf7eVhPy4uCZvglACZjRfBzw62aS6s/7mgd0=;
  b=lFqa+Jbbeh6NwBmDohxfKVqKtRVsOHT67mIeU6PZEZ1M8lZoFoA5iQlo
   ernu3ZmRf5zM/XrhW8Q+83p2oQxvLf4fyA8GZmAauhZ44o6reIIE0d/g1
   S6LslPfdf3PuUPMcpCeNmtg1c5iFNzbC328MQqqTMEjjXbxPE4KS+APgf
   NCTvXFj6CRdu3/j6QyAmlyOTF0/whOcX4cIOiSyqAwLoe1P/gmbqqgEuA
   JFBtN6l8F4FfuRlN2Gm57/9jUXAPUqEJ5BU9TBhpf29tCAYO4BKeMaPqT
   YUIsbqHacVD6pdGeChO/O5SYMHVSLJUslHD2UemHu+clzdqJHJzlYUnM2
   A==;
X-CSE-ConnectionGUID: GrAdOK+HRtGVDfvhy+WpTQ==
X-CSE-MsgGUID: vIJydfaBTiKJhgA+xupcTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2727997"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2727997"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 02:19:26 -0800
X-CSE-ConnectionGUID: SnNMDAdFRI+u8h0vYSf5pg==
X-CSE-MsgGUID: DdzHFnBSRpeYdMgucaWAZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7638512"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2026 02:19:24 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPdW6-00000000qhv-1YKk;
	Sat, 07 Nov 2026 10:19:22 +0000
Date: Sat, 07 Nov 2026 18:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:urgent] BUILD SUCCESS
 cb319926808b1cca522d2087a13205e840beb45b
Message-ID: <20261107181903.3iUbKjKq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: cb319926808b1cca522d2087a13205e840beb45b  x86/boot: Fix off-by-one error in sme_clear_pgd()

elapsed time: 958m

configs tested: 611
configs skipped: 208

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261106    gcc-8.5.0
alpha                 randconfig-2000-20261107    gcc-9.5.0
alpha                 randconfig-2001-20261106    gcc-8.5.0
alpha                 randconfig-2001-20261107    gcc-9.5.0
alpha                 randconfig-2200-20261106    gcc-14.4.0 smatch
alpha                 randconfig-2200-20261107    gcc-8.5.0  smatch
alpha                randconfig-r2106-20261107    gcc-10.5.0 cocci
alpha                randconfig-r2107-20261106    gcc-12.5.0 cocci
alpha                randconfig-r2109-20261107    clang-24   cocci
alpha                randconfig-r2302-20261106    gcc-16.2.0 sparse
alpha                randconfig-r2304-20261106    gcc-13.5.0 sparse
alpha                randconfig-r2304-20261106    gcc-16.2.0 sparse
alpha                randconfig-r2306-20261107    clang-17   sparse
arc                               alldefconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                               allmodconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                             hsdk_defconfig    gcc-16.2.0
arc                         nsimosci_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261107    gcc-12.5.0
arc                   randconfig-1001-20261107    gcc-12.5.0
arc                   randconfig-2000-20261106    gcc-12.5.0
arc                   randconfig-2000-20261107    gcc-9.5.0
arc                   randconfig-2001-20261106    gcc-12.5.0
arc                   randconfig-2001-20261107    gcc-9.5.0
arc                   randconfig-2002-20261106    gcc-12.5.0
arc                   randconfig-2002-20261107    gcc-9.5.0
arc                   randconfig-2003-20261106    gcc-12.5.0
arc                   randconfig-2003-20261107    gcc-9.5.0
arc                   randconfig-2004-20261106    gcc-12.5.0
arc                   randconfig-2004-20261107    gcc-9.5.0
arc                   randconfig-2005-20261106    gcc-12.5.0
arc                   randconfig-2005-20261107    gcc-9.5.0
arc                   randconfig-2200-20261106    gcc-10.5.0 smatch
arc                   randconfig-2200-20261107    gcc-8.5.0  smatch
arc                  randconfig-r2100-20261106    clang-21   cocci
arc                  randconfig-r2103-20261106    clang-21   cocci
arc                  randconfig-r2103-20261106    gcc-16.2.0 cocci
arc                  randconfig-r2110-20261106    gcc-11.5.0 cocci
arc                  randconfig-r2301-20261106    gcc-8.5.0  sparse
arc                  randconfig-r2301-20261107    clang-17   sparse
arc                  randconfig-r2302-20261106    gcc-13.5.0 sparse
arc                  randconfig-r2306-20261106    gcc-8.5.0  sparse
arc                  randconfig-r2310-20261107    gcc-16.2.0 sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                            h3600_defconfig    gcc-16.2.0
arm                           ixp4xx_defconfig    gcc-16.2.0
arm                    milbeaut_m10v_defconfig    gcc-16.2.0
arm                         multi_v7_defconfig    gcc-16.2.0
arm                         mvebu_v5_defconfig    gcc-16.2.0
arm                         neponset_defconfig    gcc-16.2.0
arm                           pxa910_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261107    gcc-12.5.0
arm                   randconfig-1001-20261107    gcc-12.5.0
arm                   randconfig-1002-20261107    gcc-12.5.0
arm                   randconfig-1003-20261107    gcc-12.5.0
arm                   randconfig-2000-20261106    gcc-9.5.0
arm                   randconfig-2000-20261107    gcc-16.2.0
arm                   randconfig-2001-20261106    gcc-9.5.0
arm                   randconfig-2001-20261107    gcc-16.2.0
arm                   randconfig-2002-20261106    gcc-9.5.0
arm                   randconfig-2002-20261107    gcc-16.2.0
arm                   randconfig-2200-20261106    clang-17   smatch
arm                   randconfig-2200-20261107    clang-24   smatch
arm                  randconfig-r2102-20261106    clang-17   cocci
arm                  randconfig-r2104-20261106    clang-21   cocci
arm                  randconfig-r2106-20261106    gcc-10.5.0 cocci
arm                  randconfig-r2302-20261106    gcc-8.5.0  sparse
arm                  randconfig-r2303-20261107    clang-17   sparse
arm                  randconfig-r2304-20261106    gcc-8.5.0  sparse
arm                              rpc_defconfig    gcc-16.2.0
arm                           sp7021_defconfig    gcc-16.2.0
arm                            spitz_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261107    gcc-11.5.0
arm64                 randconfig-1001-20261107    gcc-11.5.0
arm64                 randconfig-1002-20261107    gcc-11.5.0
arm64                 randconfig-1003-20261107    gcc-11.5.0
arm64                 randconfig-2000-20261106    gcc-9.5.0
arm64                 randconfig-2000-20261107    gcc-16.2.0
arm64                 randconfig-2001-20261106    gcc-9.5.0
arm64                 randconfig-2001-20261107    gcc-16.2.0
arm64                 randconfig-2002-20261106    gcc-9.5.0
arm64                 randconfig-2002-20261107    gcc-16.2.0
arm64                 randconfig-2200-20261106    clang-24   smatch
arm64                 randconfig-2200-20261107    gcc-12.5.0 smatch
arm64                randconfig-r2103-20261106    gcc-15.3.0 cocci
arm64                randconfig-r2103-20261107    clang-24   cocci
arm64                randconfig-r2107-20261107    clang-24   cocci
arm64                randconfig-r2300-20261106    gcc-12     sparse
arm64                randconfig-r2304-20261106    gcc-12     sparse
arm64                randconfig-r2305-20261106    gcc-13.5.0 sparse
arm64                randconfig-r2305-20261106    gcc-8.5.0  sparse
arm64                randconfig-r2306-20261106    clang-17   sparse
arm64                randconfig-r2306-20261106    gcc-8.5.0  sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261107    gcc-11.5.0
csky                  randconfig-1001-20261107    gcc-11.5.0
csky                  randconfig-2000-20261106    clang-24
csky                  randconfig-2000-20261107    clang-24
csky                  randconfig-2001-20261106    clang-24
csky                  randconfig-2001-20261107    clang-24
csky                  randconfig-2200-20261106    gcc-10.5.0 smatch
csky                  randconfig-2200-20261107    gcc-11.5.0 smatch
csky                 randconfig-r2102-20261106    clang-21   cocci
csky                 randconfig-r2102-20261107    clang-24   cocci
csky                 randconfig-r2103-20261107    gcc-15.3.0 cocci
csky                 randconfig-r2104-20261107    gcc-12.5.0 cocci
csky                 randconfig-r2105-20261106    clang-21   cocci
csky                 randconfig-r2108-20261106    gcc-10.5.0 cocci
csky                 randconfig-r2108-20261106    gcc-11.5.0 cocci
csky                 randconfig-r2108-20261106    gcc-12.5.0 cocci
csky                 randconfig-r2109-20261107    gcc-10.5.0 cocci
csky                 randconfig-r2110-20261106    gcc-12.5.0 cocci
csky                 randconfig-r2300-20261107    gcc-8.5.0  sparse
csky                 randconfig-r2301-20261106    gcc-16.2.0 sparse
csky                 randconfig-r2302-20261106    gcc-12     sparse
csky                 randconfig-r2306-20261107    gcc-16.2.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261107    clang-18
hexagon               randconfig-1001-20261107    clang-18
hexagon               randconfig-2000-20261106    clang-24
hexagon               randconfig-2000-20261107    clang-24
hexagon               randconfig-2001-20261106    clang-24
hexagon               randconfig-2001-20261107    clang-24
hexagon               randconfig-2200-20261106    clang-24   smatch
hexagon               randconfig-2200-20261107    clang-19   smatch
hexagon              randconfig-r2102-20261107    gcc-15.3.0 cocci
hexagon              randconfig-r2111-20261107    gcc-10.5.0 cocci
hexagon              randconfig-r2301-20261107    gcc-8.5.0  sparse
hexagon              randconfig-r2305-20261107    gcc-8.5.0  sparse
hexagon              randconfig-r2308-20261106    clang-17   sparse
hexagon              randconfig-r2310-20261106    clang-17   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261107    gcc-14
i386        buildonly-randconfig-1001-20261107    gcc-14
i386        buildonly-randconfig-1002-20261107    gcc-14
i386        buildonly-randconfig-1003-20261107    gcc-14
i386        buildonly-randconfig-1004-20261107    gcc-14
i386        buildonly-randconfig-1005-20261107    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261107    clang-22
i386                  randconfig-1001-20261107    clang-22
i386                  randconfig-1002-20261107    clang-22
i386                  randconfig-1003-20261107    clang-22
i386                  randconfig-1004-20261107    clang-22
i386                  randconfig-1005-20261107    clang-22
i386                  randconfig-1006-20261107    clang-22
i386                  randconfig-1007-20261107    clang-22
i386                  randconfig-1008-20261107    clang-22
i386                  randconfig-1009-20261107    clang-22
i386                  randconfig-1010-20261107    clang-22
i386                  randconfig-1011-20261107    clang-22
i386                  randconfig-1012-20261107    clang-22
i386                  randconfig-1013-20261107    clang-22
i386                  randconfig-2000-20261106    gcc-14
i386                  randconfig-2000-20261107    clang-22
i386                  randconfig-2001-20261106    gcc-14
i386                  randconfig-2001-20261107    clang-22
i386                  randconfig-2002-20261106    gcc-14
i386                  randconfig-2002-20261107    clang-22
i386                  randconfig-2003-20261106    gcc-14
i386                  randconfig-2003-20261107    clang-22
i386                  randconfig-2004-20261106    gcc-14
i386                  randconfig-2004-20261107    clang-22
i386                  randconfig-2005-20261106    gcc-14
i386                  randconfig-2005-20261107    clang-22
i386                  randconfig-2100-20261106    clang-22   cocci
i386                  randconfig-2100-20261107    gcc-14     cocci
i386                  randconfig-2101-20261106    clang-22   cocci
i386                  randconfig-2101-20261107    gcc-14     cocci
i386                  randconfig-2102-20261106    clang-22   cocci
i386                  randconfig-2102-20261107    gcc-14     cocci
i386                  randconfig-2103-20261106    clang-22   cocci
i386                  randconfig-2103-20261107    gcc-14     cocci
i386                  randconfig-2104-20261106    clang-22   cocci
i386                  randconfig-2104-20261107    gcc-14     cocci
i386                  randconfig-2105-20261106    clang-22   cocci
i386                  randconfig-2105-20261107    gcc-14     cocci
i386                  randconfig-2200-20261107    clang-22   smatch
i386                  randconfig-2300-20261106    clang-22   sparse
i386                  randconfig-2300-20261107    gcc-14     sparse
i386                  randconfig-2301-20261106    clang-22   sparse
i386                  randconfig-2301-20261107    gcc-14     sparse
i386                  randconfig-2302-20261106    clang-22   sparse
i386                  randconfig-2302-20261107    gcc-14     sparse
i386                 randconfig-r2108-20261107    gcc-14     cocci
i386                 randconfig-r2109-20261107    gcc-14     cocci
i386                 randconfig-r2302-20261107    clang-17   sparse
i386                 randconfig-r2307-20261107    clang-24   sparse
i386                 randconfig-r2310-20261107    clang-17   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261107    clang-18
loongarch             randconfig-1001-20261107    clang-18
loongarch             randconfig-2000-20261106    clang-19
loongarch             randconfig-2000-20261107    gcc-16.2.0
loongarch             randconfig-2001-20261106    clang-19
loongarch             randconfig-2001-20261107    gcc-16.2.0
loongarch             randconfig-2200-20261106    clang-24   smatch
loongarch             randconfig-2200-20261107    gcc-16.2.0 smatch
loongarch            randconfig-r2105-20261107    gcc-12.5.0 cocci
loongarch            randconfig-r2109-20261106    gcc-11.5.0 cocci
loongarch            randconfig-r2110-20261107    clang-24   cocci
loongarch            randconfig-r2300-20261106    gcc-13.5.0 sparse
loongarch            randconfig-r2303-20261106    gcc-13.5.0 sparse
loongarch            randconfig-r2307-20261107    gcc-16.2.0 sparse
loongarch            randconfig-r2308-20261106    gcc-8.5.0  sparse
loongarch            randconfig-r2309-20261107    gcc-16.2.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261106    gcc-8.5.0
m68k                  randconfig-2000-20261107    gcc-9.5.0
m68k                  randconfig-2001-20261106    gcc-8.5.0
m68k                  randconfig-2001-20261107    gcc-9.5.0
m68k                  randconfig-2200-20261106    gcc-11.5.0 smatch
m68k                  randconfig-2200-20261107    gcc-8.5.0  smatch
m68k                 randconfig-r2107-20261107    gcc-10.5.0 cocci
m68k                 randconfig-r2111-20261107    gcc-14     cocci
m68k                 randconfig-r2305-20261106    gcc-16.2.0 sparse
m68k                 randconfig-r2311-20261107    clang-24   sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261106    gcc-8.5.0
microblaze            randconfig-2000-20261107    gcc-9.5.0
microblaze            randconfig-2001-20261106    gcc-8.5.0
microblaze            randconfig-2001-20261107    gcc-9.5.0
microblaze            randconfig-2200-20261106    gcc-14.4.0 smatch
microblaze            randconfig-2200-20261107    gcc-15.3.0 smatch
microblaze           randconfig-r2101-20261107    gcc-15.3.0 cocci
microblaze           randconfig-r2102-20261107    gcc-12.5.0 cocci
microblaze           randconfig-r2105-20261106    clang-17   cocci
microblaze           randconfig-r2110-20261107    gcc-14     cocci
microblaze           randconfig-r2307-20261107    clang-17   sparse
microblaze           randconfig-r2309-20261106    clang-17   sparse
microblaze           randconfig-r2311-20261107    clang-17   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                            gcw0_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                   maltasmvp_eva_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261106    gcc-8.5.0
mips                  randconfig-2000-20261107    gcc-8.5.0
mips                  randconfig-2001-20261106    gcc-8.5.0
mips                  randconfig-2001-20261107    gcc-8.5.0
mips                  randconfig-2002-20261106    gcc-8.5.0
mips                  randconfig-2002-20261107    gcc-8.5.0
mips                  randconfig-2200-20261106    clang-17   smatch
mips                  randconfig-2200-20261107    gcc-13.5.0 smatch
mips                 randconfig-r2100-20261106    gcc-15.3.0 cocci
mips                 randconfig-r2105-20261106    gcc-16.2.0 cocci
mips                 randconfig-r2109-20261106    gcc-12.5.0 cocci
mips                 randconfig-r2303-20261106    gcc-12     sparse
mips                 randconfig-r2303-20261107    gcc-8.5.0  sparse
mips                 randconfig-r2311-20261106    gcc-8.5.0  sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261107    clang-18
nios2                 randconfig-1001-20261107    clang-18
nios2                 randconfig-2000-20261106    clang-19
nios2                 randconfig-2000-20261107    gcc-16.2.0
nios2                 randconfig-2001-20261106    clang-19
nios2                 randconfig-2001-20261107    gcc-16.2.0
nios2                 randconfig-2200-20261106    gcc-10.5.0 smatch
nios2                 randconfig-2200-20261107    gcc-11.5.0 smatch
nios2                randconfig-r2101-20261106    clang-21   cocci
nios2                randconfig-r2102-20261106    gcc-16.2.0 cocci
nios2                randconfig-r2103-20261106    clang-17   cocci
nios2                randconfig-r2105-20261107    gcc-15.3.0 cocci
nios2                randconfig-r2107-20261106    gcc-12.5.0 cocci
nios2                randconfig-r2307-20261106    gcc-8.5.0  sparse
nios2                randconfig-r2308-20261107    gcc-16.2.0 sparse
nios2                randconfig-r2309-20261106    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261106    gcc-8.5.0
openrisc              randconfig-2000-20261107    gcc-8.5.0
openrisc              randconfig-2001-20261106    gcc-8.5.0
openrisc              randconfig-2001-20261107    gcc-8.5.0
openrisc              randconfig-2002-20261106    gcc-8.5.0
openrisc              randconfig-2002-20261107    gcc-8.5.0
openrisc              randconfig-2200-20261106    gcc-16.2.0 smatch
openrisc              randconfig-2200-20261107    gcc-11.5.0 smatch
openrisc             randconfig-r2100-20261107    clang-24   cocci
openrisc             randconfig-r2101-20261106    clang-21   cocci
openrisc             randconfig-r2102-20261106    gcc-15.3.0 cocci
openrisc             randconfig-r2106-20261106    gcc-11.5.0 cocci
openrisc             randconfig-r2109-20261106    gcc-12.5.0 cocci
openrisc             randconfig-r2300-20261106    gcc-16.2.0 sparse
openrisc                  simple_smp_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261107    clang-24
parisc                randconfig-1001-20261107    clang-24
parisc                randconfig-2000-20261106    clang-19
parisc                randconfig-2000-20261107    gcc-16.2.0
parisc                randconfig-2001-20261106    clang-19
parisc                randconfig-2001-20261107    gcc-16.2.0
parisc                randconfig-2200-20261106    gcc-12.5.0 smatch
parisc                randconfig-2200-20261107    gcc-9.5.0  smatch
parisc               randconfig-r2100-20261107    gcc-12.5.0 cocci
parisc               randconfig-r2101-20261107    clang-24   cocci
parisc               randconfig-r2300-20261106    gcc-8.5.0  sparse
parisc               randconfig-r2305-20261106    gcc-12     sparse
parisc               randconfig-r2307-20261106    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    gcc-16.2.0
powerpc                       katmai_defconfig    gcc-16.2.0
powerpc                      ksi8560_defconfig    gcc-16.2.0
powerpc                       mgcoge_defconfig    gcc-16.2.0
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc                      rainier_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261107    clang-24
powerpc               randconfig-1001-20261107    clang-24
powerpc               randconfig-2000-20261106    gcc-8.5.0
powerpc               randconfig-2000-20261107    clang-24
powerpc               randconfig-2001-20261106    gcc-8.5.0
powerpc               randconfig-2001-20261107    clang-24
powerpc               randconfig-2002-20261106    gcc-8.5.0
powerpc               randconfig-2002-20261107    clang-24
powerpc               randconfig-2200-20261106    clang-24   smatch
powerpc               randconfig-2200-20261107    gcc-10.5.0 smatch
powerpc              randconfig-r2105-20261107    clang-24   cocci
powerpc              randconfig-r2107-20261106    gcc-11.5.0 cocci
powerpc              randconfig-r2107-20261107    gcc-14     cocci
powerpc              randconfig-r2108-20261106    gcc-12.5.0 cocci
powerpc              randconfig-r2308-20261106    gcc-8.5.0  sparse
powerpc                      tqm8555_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261107    clang-24
powerpc64             randconfig-1001-20261107    clang-24
powerpc64             randconfig-2000-20261106    gcc-8.5.0
powerpc64             randconfig-2000-20261107    clang-24
powerpc64             randconfig-2001-20261106    gcc-8.5.0
powerpc64             randconfig-2001-20261107    clang-24
powerpc64             randconfig-2002-20261106    gcc-8.5.0
powerpc64             randconfig-2002-20261107    clang-24
powerpc64             randconfig-2200-20261106    gcc-8.5.0  smatch
powerpc64             randconfig-2200-20261107    clang-24   smatch
powerpc64            randconfig-r2100-20261107    gcc-15.3.0 cocci
powerpc64            randconfig-r2101-20261106    gcc-15.3.0 cocci
powerpc64            randconfig-r2101-20261107    gcc-12.5.0 cocci
powerpc64            randconfig-r2110-20261106    gcc-10.5.0 cocci
powerpc64            randconfig-r2304-20261107    clang-17   sparse
powerpc64            randconfig-r2305-20261107    clang-17   sparse
powerpc64            randconfig-r2311-20261106    gcc-8.5.0  sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                     nommu_k210_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261107    gcc-11.5.0
riscv                 randconfig-1001-20261107    gcc-11.5.0
riscv                 randconfig-2000-20261106    gcc-13.5.0
riscv                 randconfig-2000-20261107    clang-24
riscv                 randconfig-2001-20261106    gcc-13.5.0
riscv                 randconfig-2001-20261107    clang-24
riscv                 randconfig-2002-20261106    gcc-13.5.0
riscv                 randconfig-2002-20261107    clang-24
riscv                 randconfig-2003-20261106    gcc-13.5.0
riscv                 randconfig-2003-20261107    clang-24
riscv                 randconfig-2004-20261106    gcc-13.5.0
riscv                 randconfig-2004-20261107    clang-24
riscv                 randconfig-2005-20261106    gcc-13.5.0
riscv                 randconfig-2005-20261107    clang-24
riscv                 randconfig-2200-20261106    gcc-11.5.0 smatch
riscv                 randconfig-2200-20261107    gcc-10.5.0 smatch
riscv                randconfig-r2104-20261106    clang-17   cocci
riscv                randconfig-r2105-20261106    clang-21   cocci
riscv                randconfig-r2108-20261107    gcc-10.5.0 cocci
riscv                randconfig-r2109-20261106    gcc-10.5.0 cocci
riscv                randconfig-r2308-20261107    clang-24   sparse
riscv                randconfig-r2309-20261107    clang-17   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261107    gcc-11.5.0
s390                  randconfig-1001-20261107    gcc-11.5.0
s390                  randconfig-2000-20261106    gcc-8.5.0
s390                  randconfig-2000-20261107    gcc-14.4.0
s390                  randconfig-2001-20261106    gcc-8.5.0
s390                  randconfig-2001-20261107    gcc-14.4.0
s390                  randconfig-2002-20261106    gcc-8.5.0
s390                  randconfig-2002-20261107    gcc-14.4.0
s390                  randconfig-2003-20261106    gcc-8.5.0
s390                  randconfig-2003-20261107    gcc-14.4.0
s390                  randconfig-2004-20261106    gcc-8.5.0
s390                  randconfig-2004-20261107    gcc-14.4.0
s390                  randconfig-2005-20261106    gcc-8.5.0
s390                  randconfig-2005-20261107    gcc-14.4.0
s390                  randconfig-2200-20261106    clang-18   smatch
s390                  randconfig-2200-20261107    gcc-10.5.0 smatch
s390                 randconfig-r2100-20261106    clang-17   cocci
s390                 randconfig-r2104-20261106    gcc-15.3.0 cocci
s390                 randconfig-r2104-20261107    clang-24   cocci
s390                 randconfig-r2300-20261107    clang-17   sparse
s390                 randconfig-r2301-20261106    gcc-13.5.0 sparse
s390                 randconfig-r2307-20261106    clang-17   sparse
s390                 randconfig-r2308-20261107    clang-17   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           r7780mp_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261107    gcc-11.5.0
sh                    randconfig-1001-20261107    gcc-11.5.0
sh                    randconfig-2000-20261106    gcc-16.2.0
sh                    randconfig-2000-20261107    gcc-13.5.0
sh                    randconfig-2001-20261106    gcc-16.2.0
sh                    randconfig-2001-20261107    gcc-13.5.0
sh                    randconfig-2002-20261106    gcc-16.2.0
sh                    randconfig-2002-20261107    gcc-13.5.0
sh                    randconfig-2003-20261106    gcc-16.2.0
sh                    randconfig-2003-20261107    gcc-13.5.0
sh                    randconfig-2004-20261106    gcc-16.2.0
sh                    randconfig-2004-20261107    gcc-13.5.0
sh                    randconfig-2005-20261106    gcc-16.2.0
sh                    randconfig-2005-20261107    gcc-13.5.0
sh                    randconfig-2200-20261106    gcc-16.2.0 smatch
sh                    randconfig-2200-20261107    gcc-11.5.0 smatch
sh                   randconfig-r2100-20261106    clang-21   cocci
sh                   randconfig-r2103-20261106    clang-21   cocci
sh                   randconfig-r2104-20261107    gcc-15.3.0 cocci
sh                   randconfig-r2110-20261107    gcc-10.5.0 cocci
sh                   randconfig-r2310-20261106    gcc-8.5.0  sparse
sh                            se7619_defconfig    gcc-16.2.0
sh                            se7712_defconfig    gcc-16.2.0
sh                            se7751_defconfig    gcc-16.2.0
sh                            sh2007_defconfig    gcc-16.2.0
sh                         sh7785lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261107    gcc-10.5.0
sparc                 randconfig-1001-20261107    gcc-10.5.0
sparc                 randconfig-2000-20261106    gcc-8.5.0
sparc                 randconfig-2000-20261107    clang-24
sparc                 randconfig-2001-20261106    gcc-8.5.0
sparc                 randconfig-2001-20261107    clang-24
sparc                 randconfig-2200-20261106    gcc-8.5.0  smatch
sparc                 randconfig-2200-20261107    gcc-11.5.0 smatch
sparc                randconfig-r2100-20261106    gcc-16.2.0 cocci
sparc                randconfig-r2106-20261106    gcc-12.5.0 cocci
sparc                randconfig-r2111-20261106    gcc-10.5.0 cocci
sparc                randconfig-r2111-20261106    gcc-12.5.0 cocci
sparc                randconfig-r2309-20261107    clang-24   sparse
sparc                randconfig-r2310-20261107    clang-24   sparse
sparc                randconfig-r2311-20261106    clang-17   sparse
sparc                randconfig-r2311-20261107    gcc-16.2.0 sparse
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261107    gcc-10.5.0
sparc64               randconfig-1001-20261107    gcc-10.5.0
sparc64               randconfig-2000-20261106    gcc-8.5.0
sparc64               randconfig-2000-20261107    clang-24
sparc64               randconfig-2001-20261106    gcc-8.5.0
sparc64               randconfig-2001-20261107    clang-24
sparc64               randconfig-2200-20261106    gcc-8.5.0  smatch
sparc64               randconfig-2200-20261107    clang-20   smatch
sparc64              randconfig-r2102-20261106    clang-21   cocci
sparc64              randconfig-r2105-20261106    gcc-15.3.0 cocci
sparc64              randconfig-r2106-20261107    clang-24   cocci
sparc64              randconfig-r2108-20261107    clang-24   cocci
sparc64              randconfig-r2111-20261107    clang-24   cocci
sparc64              randconfig-r2302-20261107    gcc-8.5.0  sparse
sparc64              randconfig-r2304-20261107    gcc-8.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261107    gcc-10.5.0
um                    randconfig-1001-20261107    gcc-10.5.0
um                    randconfig-2000-20261106    gcc-8.5.0
um                    randconfig-2000-20261107    clang-24
um                    randconfig-2001-20261106    gcc-8.5.0
um                    randconfig-2001-20261107    clang-24
um                    randconfig-2200-20261106    gcc-13     smatch
um                    randconfig-2200-20261107    gcc-14     smatch
um                   randconfig-r2101-20261106    clang-17   cocci
um                   randconfig-r2103-20261107    gcc-12.5.0 cocci
um                   randconfig-r2104-20261106    gcc-16.2.0 cocci
um                   randconfig-r2303-20261106    gcc-16.2.0 sparse
um                   randconfig-r2306-20261107    clang-24   sparse
um                   randconfig-r2309-20261106    gcc-8.5.0  sparse
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    gcc-16.2.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261107    gcc-14
x86_64      buildonly-randconfig-1001-20261107    gcc-14
x86_64      buildonly-randconfig-1002-20261107    gcc-14
x86_64      buildonly-randconfig-1003-20261107    gcc-14
x86_64      buildonly-randconfig-1004-20261107    gcc-14
x86_64      buildonly-randconfig-1005-20261107    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261107    gcc-14
x86_64                randconfig-1001-20261107    gcc-14
x86_64                randconfig-1002-20261107    gcc-14
x86_64                randconfig-1003-20261107    gcc-14
x86_64                randconfig-1004-20261107    gcc-14
x86_64                randconfig-1005-20261107    gcc-14
x86_64                randconfig-1006-20261107    gcc-13
x86_64                randconfig-1007-20261107    gcc-13
x86_64                randconfig-1008-20261107    gcc-13
x86_64                randconfig-1009-20261107    gcc-13
x86_64                randconfig-1010-20261107    gcc-13
x86_64                randconfig-1011-20261107    gcc-13
x86_64                randconfig-1012-20261107    clang-22
x86_64                randconfig-1013-20261107    clang-22
x86_64                randconfig-1014-20261107    clang-22
x86_64                randconfig-1015-20261107    clang-22
x86_64                randconfig-1016-20261107    clang-22
x86_64                randconfig-1017-20261107    clang-22
x86_64                randconfig-2000-20261106    gcc-14
x86_64                randconfig-2000-20261107    clang-22
x86_64                randconfig-2001-20261106    gcc-14
x86_64                randconfig-2001-20261107    clang-22
x86_64                randconfig-2002-20261106    gcc-14
x86_64                randconfig-2002-20261107    clang-22
x86_64                randconfig-2003-20261106    gcc-14
x86_64                randconfig-2003-20261107    clang-22
x86_64                randconfig-2004-20261106    gcc-14
x86_64                randconfig-2004-20261107    clang-22
x86_64                randconfig-2005-20261106    gcc-14
x86_64                randconfig-2005-20261107    clang-22
x86_64                randconfig-2100-20261106    clang-22   cocci
x86_64                randconfig-2100-20261107    gcc-14     cocci
x86_64                randconfig-2101-20261106    clang-22   cocci
x86_64                randconfig-2101-20261107    gcc-14     cocci
x86_64                randconfig-2102-20261106    clang-22   cocci
x86_64                randconfig-2102-20261107    gcc-14     cocci
x86_64                randconfig-2103-20261106    clang-22   cocci
x86_64                randconfig-2103-20261107    gcc-14     cocci
x86_64                randconfig-2104-20261106    clang-22   cocci
x86_64                randconfig-2104-20261107    gcc-14     cocci
x86_64                randconfig-2105-20261106    clang-22   cocci
x86_64                randconfig-2105-20261107    gcc-14     cocci
x86_64                randconfig-2200-20261106    gcc-14     smatch
x86_64                randconfig-2200-20261107    clang-22   smatch
x86_64                randconfig-2300-20261106    clang-22   sparse
x86_64                randconfig-2300-20261107    gcc-14     sparse
x86_64                randconfig-2301-20261106    clang-22   sparse
x86_64                randconfig-2301-20261107    gcc-14     sparse
x86_64                randconfig-2302-20261106    clang-22   sparse
x86_64                randconfig-2302-20261107    gcc-14     sparse
x86_64               randconfig-r2107-20261106    gcc-10.5.0 cocci
x86_64               randconfig-r2110-20261106    gcc-12.5.0 cocci
x86_64               randconfig-r2301-20261106    gcc-12     sparse
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
xtensa                randconfig-1000-20261107    gcc-10.5.0
xtensa                randconfig-1001-20261107    gcc-10.5.0
xtensa                randconfig-2000-20261106    clang-24
xtensa                randconfig-2000-20261107    clang-24
xtensa                randconfig-2001-20261106    clang-24
xtensa                randconfig-2001-20261107    clang-24
xtensa                randconfig-2200-20261106    gcc-8.5.0  smatch
xtensa                randconfig-2200-20261107    gcc-13.5.0 smatch
xtensa               randconfig-r2101-20261106    gcc-16.2.0 cocci
xtensa               randconfig-r2106-20261107    gcc-14     cocci
xtensa               randconfig-r2111-20261106    gcc-11.5.0 cocci
xtensa               randconfig-r2111-20261106    gcc-12.5.0 cocci
xtensa               randconfig-r2303-20261106    gcc-8.5.0  sparse
xtensa               randconfig-r2310-20261106    gcc-8.5.0  sparse
xtensa                          virt_defconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
