Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F0C50C29B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552122; cv=none; b=jCqpHzHc8dsE/BvDeNrER6OEdEJSkzHEXup1wWqVQPmGZy1Zy26JB+6iat137vP4RIvCuwjbHdLjJooltFjG9xVovQM/OlCTh/Uo+PKRFoc2Su23iCKkJBXaem3E+67r6jY7bwEDVyxWOb177ccEgBAbX5x+0tFbHC+08GnZhG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552122; c=relaxed/simple;
	bh=HBI7zJ4PvOOdXcrmsDQMCs6ZxnD3iOtUgWDQh4Z4/Ck=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vGXg9Zsu3yhExFD1k81W+4IkMLzMqDAt538PrHagNV/5/JEAog5JEINYRVov5VC3VfxB7qR11x0ceLSCs+5JAK6kyLKyP2wcq2af8d3f9H1JtuM3rFSrdTPd7/vgDabYP22b9kX8dhg+zWFU9D7nvXtjAjEeHjS2ahdTfyjBd2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fvvE4Psw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvvE4Psw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788552121; x=1820088121;
  h=date:from:to:cc:subject:message-id;
  bh=HBI7zJ4PvOOdXcrmsDQMCs6ZxnD3iOtUgWDQh4Z4/Ck=;
  b=fvvE4PswpNyX0xA8tJqyrC5r2rjFjzi5TUxpF2yzJzJTmbxl5SDEw3xg
   iSy5a8wxDOS01OMthUxA+BYy9Zaf9h0WY/r624zkLDqJrlxMY6T0L6CkC
   MSjNPgbvMqJSo/nwwFd4UlAhpFf3aEAv9PRe7zjCrLvATjeirBN+7pfUG
   vjfIAelT8dfDcIheZHpa9KsMSVBZQk/s5NRrZa5+zFYsKaw/ATbcH+4kN
   BFkXV85a+SgD++BahqPNsf53uUYk4nF/uFE8mkOI+BVFTXoD+cc6GU/lJ
   uip7YAPWNA19e1Su7JTa/39Cq5UdwWcr69X00oaPptBQJVUzp7vlqwLRZ
   w==;
X-CSE-ConnectionGUID: YsOq5TlUTQyENndoG2OQAw==
X-CSE-MsgGUID: 9waA+95SQFedDAorClMYqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99392952"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="99392952"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:01:59 -0700
X-CSE-ConnectionGUID: +lGWtsf4RAKT4vQp/EQZqQ==
X-CSE-MsgGUID: t390IPSoST6w7pVr/j/+eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="308337378"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Sep 2026 13:01:57 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2a6l-00000000A7u-0uvY;
	Fri, 04 Sep 2026 20:01:55 +0000
Date: Sat, 05 Sep 2026 04:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:boot] BUILD SUCCESS
 6744e454d877e51394ed15e48e25c97dd6c62099
Message-ID: <202609050438.xBnIhfJK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
branch HEAD: 6744e454d877e51394ed15e48e25c97dd6c62099  x86/boot: Use BASE_BAUD and DEFAULT_SERIAL_PORT

elapsed time: 2415m

configs tested: 36
configs skipped: 42

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arm           allnoconfig    gcc-16.1.0
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2         allnoconfig    clang-24
openrisc      allnoconfig    clang-24
parisc        allnoconfig    clang-24
powerpc       allnoconfig    clang-24
riscv         allnoconfig    clang-24
s390          allnoconfig    clang-24
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sparc         allnoconfig    clang-24
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
