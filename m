Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C672B37EFE4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552181; cv=none; b=ewCdFTpgjJHLDewHHfV1Qy7WmvzUnYaglORqiibaSZLfu+PTlmjLSBr6IoWXaSEvyH5AXXZEXvMEGgR2he+6u3gO+Df+PeCnoieXsRNDwKgRehHkesI2gVegVBOhtvXrpQmEzaR5tn8XqqWHnFvYTVFNMTpck3B97v6xW5cR3t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552181; c=relaxed/simple;
	bh=CHCm0NVir0kZaHnObo4g4VOOhwrmKiN9ZQqI0YDfeKE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=li5qHLPjcoNNmIlo9b9O/H8NJkIwD/tilWwIkjwiAD3biOD9hff/g6y/Rz6x3EIrI7+HwkyD609FXNlhk/e8gFQK7FpsaugWFfLMA4JVVnuDKhB5/i1EXyOttZcrg/HO1/7/4rKf9HxaoO8pNe0s447N35M/7u4PiKr7Esh3g9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n46DAx1+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n46DAx1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788552179; x=1820088179;
  h=date:from:to:cc:subject:message-id;
  bh=CHCm0NVir0kZaHnObo4g4VOOhwrmKiN9ZQqI0YDfeKE=;
  b=n46DAx1+FtUAsbMlA/CDjL+c6XySt/TsNNjC+3WOusHYihLhG4tJDTgB
   po+GB52AIYw46LtAqkPm9ZOFA/pQa0vl34qN1REnW5JzVoig0MC4JNImd
   zRGCXXYd4/ffU6P5LvBjZg4vCGWpOtv1gRUmB0vER9o0htukZOC2jGewg
   nrYY4KKgbpjiHZ3BPfr/R9i0Ah3PHedyOch0J1QV3Qu/zR2XN0oxk+Bcu
   hrC1l+m/P3FJ/VuYCKZzq6hfnS4c0y97DdsnApZu1NoY9LT/yUjKRlJOq
   BRaH/XtlDcs4tOEcdti50qFnQZoE1qi9uV813UfWmNff5BnjvhC7G07EF
   g==;
X-CSE-ConnectionGUID: aPTYMpLwTkWNlUhMqEC7GQ==
X-CSE-MsgGUID: M33R4GDRSxO+5BZAoRh7jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88908128"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88908128"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:02:59 -0700
X-CSE-ConnectionGUID: GXh+KqRCSVqryNgZNzDdBw==
X-CSE-MsgGUID: wzPhxq5OTWm4B7Cj6Ybwaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="274283636"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Sep 2026 13:02:58 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2a7j-00000000A88-1KSE;
	Fri, 04 Sep 2026 20:02:55 +0000
Date: Sat, 05 Sep 2026 04:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:sgx] BUILD SUCCESS
 993b65a2fc6f3b2d61428ed2f2d10f94e94e6f3c
Message-ID: <202609050411.OeSgU3lt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/sgx
branch HEAD: 993b65a2fc6f3b2d61428ed2f2d10f94e94e6f3c  x86/sgx: Report RCU-Tasks quiescent state in EPC sanitization loop

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
