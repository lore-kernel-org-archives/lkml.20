Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120653ECBCF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552901; cv=none; b=lSEDqIRD4xPGYfsdEHRqEctin1Z7qdaGKuBq3b+voxBzCcBZ1l456o9Ur7BgFRynC3fLR+jHYKrCdJq0eAW9z2hzhqli98Ukv4fQ+t+ju9PEBKfMO4wm1MRYpbqXcQDAOBXcMeP5taMJb/VaFITf4zb4ICl4uasrwcVvUMjMHOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552901; c=relaxed/simple;
	bh=VvwWqsmXDrLbsRdZQWuVwXLaXvwqpVwqmLKIYhw1y5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f1Dnzh5+YAL8993zsbm2PvGFLDkOzovX6ZruhF+bPazaAI6D0MMQg3lYSweY9VcijU/wJdXMyUbXAhmSOiykYEMRF3kE6l+aWiiz4XFPRy3Np9KLVFns5CwUXdvtFQ2JhM9s8WxH7TSB7HbGk9Mk0ZzPmRG/LCPmeMb0GILlgak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPNUJAeY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPNUJAeY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788552900; x=1820088900;
  h=date:from:to:cc:subject:message-id;
  bh=VvwWqsmXDrLbsRdZQWuVwXLaXvwqpVwqmLKIYhw1y5k=;
  b=fPNUJAeYCeWwrxCWxeCA9VcWwYKw6rPS+UmR40i66CBbVbIm6MYjtiFg
   xaJp2B04KsfwfBGomb7G2dRzq4/yFYduIwkP91GTdnV5vdOTLYSJl5hR9
   XQVpMAqXXxdKI/8dFqOjZWVBn9tLeSFeP7SyYo4qlw3QfXIf4cFx1vL+n
   a+GqeKKA4gKM6bRRrY+0hXKw6qZVJmoQV96l9fSmKqHXYg5c9EQm1F5z0
   jYaxwo5xAC/3C4RJ3G0f2XpS/YJPAvjwTk52UXmSkzOQDHhG9XCgDSYXF
   zR+2HFf+E1sQnuFiqBQQf4flNAPQ9c4RZ7R0lLLL8rYRo3tEZdHP43MGf
   g==;
X-CSE-ConnectionGUID: MxqTQLwTRFiqsLAfEo6MrA==
X-CSE-MsgGUID: K2tNiWwUQWOvCUV9d6bv/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89268568"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="89268568"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:14:59 -0700
X-CSE-ConnectionGUID: TRKYfteESkCfgttdCe0V9A==
X-CSE-MsgGUID: imM5gPpvQraG0QxZaG0kyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="272070852"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Sep 2026 13:14:58 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2aJM-00000000A92-0TpW;
	Fri, 04 Sep 2026 20:14:56 +0000
Date: Sat, 05 Sep 2026 04:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:urgent] BUILD SUCCESS
 4846278477f09d1f3b5f03091393b35a92db0b52
Message-ID: <202609050442.L4Vf6bQx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 4846278477f09d1f3b5f03091393b35a92db0b52  x86/mm: Fix userspace data loss with MADV_FREE and THP

elapsed time: 1488m

configs tested: 31
configs skipped: 32

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arm           allnoconfig    gcc-16.1.0
arm64         allnoconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch     allnoconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
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
