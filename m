Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF4E41D208
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503110; cv=none; b=fh6lBLq9rmJv6GnAzcwAUPW8gmWYmZ8Vxkj76d/4h5nCQYI1WxYt+t3AHWC7es/v4wfd6pB6CW/X3vlwt/ZqIiw7um7f7JmOOs1jHZZ0yw8o+9EU56NpE9BwyvauTsfzMHbiNqhF1xOXCxWeziZSY+Rwpxpge0dUYHquVHpukT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503110; c=relaxed/simple;
	bh=wLrWulukcu6CvFfP6wjZc7D7RIWI4MbnVJ7GWgrA3No=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OsJhfjq2foCdjsCWXx5s/FNchc+bz7rEywGgkCIuJebst2wNTdpPktuHw5fO23AgY/Gl0bvjoa7TGT21USIRPgi6jpLwbXEqeo7+cIfPs1e+6+dVXzp0nuNpN7v6GlA9jFKxEcUNHyzlwI3x9NwI8cKZ83YSRj3RJipIwSe9Ilg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKMRkFeg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKMRkFeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788503108; x=1820039108;
  h=date:from:to:cc:subject:message-id;
  bh=wLrWulukcu6CvFfP6wjZc7D7RIWI4MbnVJ7GWgrA3No=;
  b=KKMRkFeg7mJPw+LIJZ9EYs5/B/pjhPSzbNcuq+Z74zpyTmksCZongDet
   Qwk4l0Im8+oOHfZuy+cJlS9EHDbiJqM2oUxvoLcxDe/eoihdZM34Ez+4W
   I9vTC9o4pngQJuMewx4HviW0NacU3m/TUL2P0xMFJa4YkIPd0FpfxeYwW
   qw1IG/L63HWNlEt/2zGxM6n9KpMqKyu37v79uQpqUEOXRm6R9OCHgqf2i
   s+glbXLmO0CnEf6s3HPth8E1Cwc6diLNpsZKD0+35ulHUSQlHr9IQ7xQE
   +vg/OyhB6JO1FqL0f+HRN7SYcLfQWq3gmA/bIFRxEbCdyMs0gPzX0WI3j
   Q==;
X-CSE-ConnectionGUID: 7ofqyqVjTOq0vMySSxp4jw==
X-CSE-MsgGUID: U3IVC/CSSU2FFgP/ylzD2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92697057"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="92697057"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 23:25:08 -0700
X-CSE-ConnectionGUID: EcXvEs/QREyLe5C5AQahvQ==
X-CSE-MsgGUID: cFnmiNA6Tyq4AwcUKnvMxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273735900"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2026 23:25:07 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2NMG-000000005y8-36fd;
	Fri, 04 Sep 2026 06:25:04 +0000
Date: Fri, 04 Sep 2026 14:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf:urgent] BUILD SUCCESS
 58a8108bc73de0740d5b88150465d6690ea5f85f
Message-ID: <202609041431.nPcuY0hc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/urgent
branch HEAD: 58a8108bc73de0740d5b88150465d6690ea5f85f  perf: Fix use-after-free when perf mmap() revival races with the last munmap()

elapsed time: 2816m

configs tested: 61
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-14
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
