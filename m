Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733458;
	b=ZGASormr6Vmt3dEtXe6cHDa1m5+4UQKK/QMzX1EF3/VzkJJcYQgBBeA8GjUf8tA2BNQ3
	 f6gkennDoPCPvytk1S3U4783TeZnBfDWN/5BQuj6bXFQJtRHVb7YGwWtHyIxUtUwztqXW
	 9clAc1K7MAuqLwcpOK0VVH0VFVWE2mbqXRTBq0jVH98K8LPKYdDjUJ+l1l5QdRNPjW3MY
	 9Kl8jH75fyd13VxkDGZfZhDpEOIOxFBcTyMmfLmPqtA+yKKvW9nYTzC/VYSxaZDCcH0GI
	 pAqfU+kST4BuLE+qVSOKtsgP6oyW3AQhIrY9Zp6rXoCX/3UkqhF3PG4oiwE3Tm0nBqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733458;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zMr9VEC9jx04l1WtuGYLEQYRNw2eskJQNarxTF7YWss=;
	b=e1mlFo1pRxffyUAMKG0HkK1hRHkYR3WoFlF9q4zUw9w1seFMGM4W0MgeeNGJQX44GCYO
	 qq3QGdiLs5+UHhMXokGQTh/fu1xlWo7Bq1Ei5za2piKiy4r6y3lSr1cBZ+3X0FWecnF05
	 J/iLoGwGDS0EkLhhG8PjHUHqrx9WRRojUqx2HZDzqKBd+mKikBSxTwlizqfyU4VD8dVam
	 c7Cl1GTkHoftw4HfqzEX0P19Ay+by+s/gXyC6C7PCH535SPAYe8X6CD/wNBm2LX/N1kN6
	 OTA3nUNaxZJ5BuInJdtcL3EZGbYpo05Xwvz5+ONRjBNYhA2gDy0Yqif51XUnyYRYJBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e1Q6dq7F;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66AF606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C66AF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e1Q6dq7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794733456; x=1826269456;
  h=date:from:to:cc:subject:message-id;
  bh=aqrDhGBw6awt1GcMiz7VivETGnuOsbiT6Ebkgoy+UlU=;
  b=e1Q6dq7F7SXcuQmQYmhx045XbhAYP952msSIeG9H/RfuQgIvE09NRO0B
   VVFoqA4J/b8TZh++C0YAeF3QqIcMnRsO3BtoUzH5EELRcZcR6d9FXzDrG
   6dQ/i+IrQ4wntNLR8XsVkyL14xv7GPhZCVGzYAGU8/wxlhj3JwvdLq0Bv
   foA9WLbc5jqC+BmrvrP0UryfkMxha/MBfHDBwn4dWtcmpbC4PvZ561XXe
   HfHte9UkXrIdEGuOg8JPrsx2ERSMWlQKygEeb6Onb17wiO9Yl09auAA1+
   0+0NjW2pKZkhGRkhiR9aLN4I3LIbFQjPmP89GDFLQiAMDgj1I7MV+8ISN
   g==;
X-CSE-ConnectionGUID: zddJG0wMRauZ7YpiMmUchw==
X-CSE-MsgGUID: pdfw+MHbS4+blXtNLGo/eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3362621"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3362621"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 01:04:16 -0800
X-CSE-ConnectionGUID: MIr6e99dQ4ijCcyhwEle7w==
X-CSE-MsgGUID: uSj7WmMGS62+oALnRG8K9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9625686"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Nov 2026 01:04:15 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSW9k-000000016bK-1qDJ;
	Sun, 15 Nov 2026 09:04:12 +0000
Date: Sun, 15 Nov 2026 17:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2026.11.12b] BUILD SUCCESS
 6e4584110547d13fd58e17a4a5a15d367721ee6c
Message-ID: <20261115170337.ljwiF6Cw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.11.12b
branch HEAD: 6e4584110547d13fd58e17a4a5a15d367721ee6c  torture: Use ${:+} to save a few lines in torture.sh's torture_one()

elapsed time: 3012m

configs tested: 119
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        randconfig-2200-20261113    gcc-8.5.0  smatch
alpha       randconfig-r2104-20261113    gcc-16.2.0 cocci
arc          randconfig-2000-20261113    gcc-16.2.0
arc          randconfig-2001-20261113    gcc-10.5.0
arc          randconfig-2002-20261113    gcc-16.2.0
arc          randconfig-2003-20261113    gcc-10.5.0
arc          randconfig-2004-20261113    gcc-12.5.0
arc          randconfig-2005-20261113    gcc-10.5.0
arc         randconfig-r2108-20261113    gcc-11.5.0 cocci
arc         randconfig-r2311-20261113    gcc-16.2.0 sparse
arm          randconfig-2000-20261113    gcc-14.4.0
arm          randconfig-2001-20261113    gcc-12.5.0
arm          randconfig-2200-20261113    clang-24   smatch
arm         randconfig-r2302-20261113    clang-24   sparse
arm         randconfig-r2308-20261113    gcc-13.5.0 sparse
arm64        randconfig-2000-20261113    clang-24
arm64        randconfig-2001-20261113    gcc-8.5.0
arm64        randconfig-2002-20261113    gcc-15.3.0
arm64        randconfig-2200-20261113    gcc-8.5.0  smatch
csky         randconfig-2200-20261113    gcc-10.5.0 smatch
hexagon      randconfig-2200-20261113    clang-17   smatch
hexagon     randconfig-r2307-20261113    clang-24   sparse
i386         randconfig-2000-20261113    gcc-14
i386         randconfig-2001-20261113    gcc-12
i386         randconfig-2002-20261113    gcc-14
i386         randconfig-2003-20261113    gcc-14
i386         randconfig-2004-20261113    clang-22
i386         randconfig-2005-20261113    gcc-14
i386         randconfig-2100-20261113    clang-22   cocci
i386         randconfig-2101-20261113    gcc-13     cocci
i386         randconfig-2102-20261113    gcc-14     cocci
i386         randconfig-2103-20261113    clang-22   cocci
i386         randconfig-2104-20261113    gcc-14     cocci
i386         randconfig-2105-20261113    clang-22   cocci
i386         randconfig-2200-20261113    clang-22   smatch
i386         randconfig-2300-20261113    gcc-14     sparse
i386         randconfig-2301-20261113    gcc-14     sparse
i386         randconfig-2302-20261113    gcc-14     sparse
i386        randconfig-r2100-20261113    gcc-14     cocci
loongarch    randconfig-2000-20261113    gcc-16.2.0
loongarch    randconfig-2001-20261113    clang-24
loongarch   randconfig-r2306-20261114    clang-18   sparse
loongarch   randconfig-r2307-20261114    clang-20   sparse
m68k        randconfig-r2310-20261114    gcc-14.4.0 sparse
microblaze   randconfig-2200-20261113    gcc-8.5.0  smatch
mips         randconfig-2000-20261113    clang-18
mips         randconfig-2001-20261113    clang-22
mips         randconfig-2002-20261113    gcc-14.4.0
mips         randconfig-2200-20261113    clang-24   smatch
mips        randconfig-r2309-20261113    clang-24   sparse
nios2        randconfig-2000-20261113    gcc-8.5.0
nios2        randconfig-2001-20261113    gcc-8.5.0
nios2        randconfig-2200-20261113    gcc-10.5.0 smatch
nios2       randconfig-r2103-20261113    gcc-8.5.0  cocci
nios2       randconfig-r2303-20261113    gcc-9.5.0  sparse
openrisc     randconfig-2000-20261113    gcc-16.2.0
openrisc     randconfig-2001-20261113    gcc-14.4.0
openrisc     randconfig-2002-20261113    gcc-16.2.0
openrisc     randconfig-2200-20261113    gcc-14.4.0 smatch
openrisc    randconfig-r2101-20261113    gcc-13.5.0 cocci
openrisc    randconfig-r2105-20261113    gcc-13.5.0 cocci
openrisc    randconfig-r2106-20261113    gcc-11.5.0 cocci
openrisc    randconfig-r2309-20261114    gcc-16.2.0 sparse
parisc       randconfig-2000-20261113    gcc-10.5.0
parisc       randconfig-2001-20261113    gcc-8.5.0
parisc       randconfig-2200-20261113    gcc-16.2.0 smatch
powerpc      randconfig-2200-20261113    clang-24   smatch
powerpc     randconfig-r2102-20261113    gcc-11.5.0 cocci
powerpc     randconfig-r2107-20261113    clang-24   cocci
powerpc     randconfig-r2305-20261113    gcc-8.5.0  sparse
powerpc     randconfig-r2308-20261114    clang-24   sparse
powerpc64    randconfig-2200-20261113    gcc-10.5.0 smatch
riscv        randconfig-2000-20261113    gcc-13.5.0
riscv        randconfig-2001-20261113    gcc-15.3.0
riscv        randconfig-2002-20261113    clang-24
riscv        randconfig-2003-20261113    gcc-11.5.0
riscv        randconfig-2004-20261113    gcc-9.5.0
riscv        randconfig-2005-20261113    gcc-8.5.0
riscv       randconfig-r2110-20261113    gcc-8.5.0  cocci
s390         randconfig-2000-20261113    gcc-13.5.0
s390         randconfig-2001-20261113    clang-18
s390         randconfig-2002-20261113    gcc-13.5.0
s390         randconfig-2003-20261113    gcc-8.5.0
s390         randconfig-2004-20261113    clang-24
s390         randconfig-2005-20261113    gcc-11.5.0
s390         randconfig-2200-20261113    clang-24   smatch
sh           randconfig-2200-20261113    gcc-14.4.0 smatch
sh          randconfig-r2301-20261113    gcc-16.2.0 sparse
sparc        randconfig-2000-20261113    gcc-8.5.0
sparc        randconfig-2001-20261113    gcc-14.4.0
sparc        randconfig-2200-20261113    gcc-14.4.0 smatch
sparc       randconfig-r2311-20261114    gcc-12.5.0 sparse
sparc64      randconfig-2000-20261113    clang-24
sparc64      randconfig-2001-20261113    clang-20
sparc64     randconfig-r2111-20261113    clang-22   cocci
um           randconfig-2000-20261113    clang-21
um           randconfig-2001-20261113    clang-24
um           randconfig-2200-20261113    clang-24   smatch
um          randconfig-r2300-20261113    gcc-14     sparse
um          randconfig-r2306-20261113    gcc-14     sparse
x86_64       randconfig-2000-20261113    clang-22
x86_64       randconfig-2001-20261113    gcc-14
x86_64       randconfig-2002-20261113    clang-22
x86_64       randconfig-2003-20261113    gcc-14
x86_64       randconfig-2004-20261113    gcc-14
x86_64       randconfig-2005-20261113    gcc-12
x86_64       randconfig-2100-20261113    clang-22   cocci
x86_64       randconfig-2101-20261113    clang-22   cocci
x86_64       randconfig-2102-20261113    clang-22   cocci
x86_64       randconfig-2103-20261113    gcc-14     cocci
x86_64       randconfig-2104-20261113    gcc-14     cocci
x86_64       randconfig-2105-20261113    clang-22   cocci
x86_64       randconfig-2200-20261113    clang-22   smatch
x86_64       randconfig-2300-20261113    gcc-14     sparse
x86_64       randconfig-2301-20261113    clang-22   sparse
x86_64       randconfig-2302-20261113    gcc-14     sparse
x86_64      randconfig-r2304-20261113    gcc-14     sparse
xtensa       randconfig-2200-20261113    gcc-12.5.0 smatch
xtensa      randconfig-r2109-20261113    gcc-8.5.0  cocci

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
