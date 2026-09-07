Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC64337C0F5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 23:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788824210; cv=none; b=ZMeyZEaKOFjA5PxC2lJxuHeaVVl4RyPPGTxLGO3mWtXmkBPCSeBWI6nyHUKHKscrSjr8ZrrtK/Cgmu1O933u3Qjf6TiLGMsQxdn44hA6ta8FssFFZ2+yYmnYwWKPl3xWuThgIzu7mvoKviMDRye46Bj1C9lcbnErNrEO2Vd/GPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788824210; c=relaxed/simple;
	bh=JQHljp2l+jR6EevHKIWhPPNQjuW2VZR9QCyZi6hhJNw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fcDONg2K2pQ886LvzTlSs5FYEfVh2SgRQNh5xliH+6HuDvUAM/r1srOMd62OHQ72syV+hld7tnKpP8E+drAbgE8YFf2I65ZMTTUkXtzUOp1cIROYp10rq81EnTcI+YrQ1RmClTMpVs/ejVd5ui9IQL1dvveaSWDA+bGgcQZOcu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWqHjvE+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWqHjvE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788824208; x=1820360208;
  h=date:from:to:cc:subject:message-id;
  bh=JQHljp2l+jR6EevHKIWhPPNQjuW2VZR9QCyZi6hhJNw=;
  b=PWqHjvE+c7FmWXrKR9BMQ7uLIEjRhuC5eUq66u64pkVPCGk/u3XayPwA
   yupzyJS7rxqeeMhn6+m0jdNu6orf5oabq2Q5SrHIbPexSJpcCHARtToeU
   JWjSEZltiq5HYG8kXUK5TD1Hcy3yLMDz+8pccL9mcY91jg2gYqPhuVXJs
   K4Xde2o+ldvHqchDtTHfyRLOzBKGJmiPKOSHSlV42sh6Rm3QD7SnYxz56
   cIuiV4mcmHKQopiX/m1iMrGRdyj3b1evFj8S/c71d3g2D6WA0lgvZsA15
   nPiZD876u4HXzcggum2aHpHIRprva3lQHVB0MY1rSqzaCOYu0r9f6HAl6
   Q==;
X-CSE-ConnectionGUID: /JxOGkxZQE+uj2m4HgZ7kQ==
X-CSE-MsgGUID: pPLoGzefR6m+xIQT98WeWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99814402"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="99814402"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 16:36:47 -0700
X-CSE-ConnectionGUID: V9IRoQftTzWvDKvX+yiEGw==
X-CSE-MsgGUID: clKalyhISfuOAKPSxazR1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="300703846"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Sep 2026 16:36:47 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3itI-000000001PH-0Ty4;
	Mon, 07 Sep 2026 23:36:44 +0000
Date: Tue, 08 Sep 2026 07:35:26 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:tdx] BUILD SUCCESS
 e61c837817acde1df7ebd977b798683a3d9b0dda
Message-ID: <202609080757.LXjdTMjd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/tdx
branch HEAD: e61c837817acde1df7ebd977b798683a3d9b0dda  Documentation/x86: Add documentation for TDX's Dynamic PAMT

elapsed time: 4356m

configs tested: 73
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arc          allyesconfig    gcc-16.1.0
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
loongarch    allmodconfig    clang-19
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
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-14
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
