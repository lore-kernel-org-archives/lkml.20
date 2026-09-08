Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED6F4C6F1E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869266; cv=none; b=mvUATmZBjkEmnT88Wagl7KizreB3k9uGx3iTtD/ot0nh6VJrL3GWwVEMOH9qR9MgiprF4+Mj7/c8IJND3zdgfWLPEcd82KF43xt80JARFdin/VGCi+tmeT5hxTgGXiV/iLvlpywR/M82nlvf6OHl/v+mytfh1QWX0Eylactz7Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869266; c=relaxed/simple;
	bh=bGIQE9DEVlkwOYjux3i4RlzB5DclZt00zhVHnbfYUmY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kQY78YuK7a0gx4x7axAOfr5R+5WtuklEAnKDG07XYiQJJLBwM3KoY6UfQvfXsOD8+EX7sYDivU4MLK2Ghs/GiNWeMNqN4YgXZ7hOESLMPGTdJ+Fr+o0Nc+wGjpVEv4cXYaKjG8/GaJQZPXzxx6sdZL0VowsNIU0Xeeg41wwKDOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jz5yt+mw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jz5yt+mw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788869257; x=1820405257;
  h=date:from:to:cc:subject:message-id;
  bh=bGIQE9DEVlkwOYjux3i4RlzB5DclZt00zhVHnbfYUmY=;
  b=jz5yt+mwqQj228sHDzH7+54b4e35Rgy8Vhf3G+jejcnOucET7Dr/RqmP
   RgL8/1jxaOHwYghf00D0C0usdgju+Ld2oGX+u2oZPHZYdqYYYUHjMkD1K
   4puXL1cw0o1xm7bU3Yu7D1rhgYkl0IeeQ3yoahDC+y654Qwyp5VofYwFn
   pI69VhGxFm3hJa4bSxoq8g03Nsmc8e/oC4ediY6PcozE+u+r8KcN2nIZy
   ST1upAIExu307GdkGslKEoUf9Jyj89Ci4TYnIK4A9idFL3TVzhxnPz2KE
   aprBQNtmbIVGU9IHCmfjNLRzGZNPFb6FPHDxmX/YSLe+kJ7v7K74RIuqA
   A==;
X-CSE-ConnectionGUID: Ykt0lHcpQDir2A3w77QhVQ==
X-CSE-MsgGUID: L0LU4FkkRQmumdztHRQAjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89111854"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89111854"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 05:07:34 -0700
X-CSE-ConnectionGUID: cqeJl4+TToihPdUQXSJjqQ==
X-CSE-MsgGUID: ihy7aRm6ReOUytQi90MJaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="295870476"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2026 05:07:32 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3ubq-0000000004z-0RSI;
	Tue, 08 Sep 2026 12:07:30 +0000
Date: Tue, 08 Sep 2026 20:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers:urgent] BUILD SUCCESS
 113a9796effe3376d2ec5aabcca1fef4fef4cd62
Message-ID: <202609082023.1JpZKVGn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
branch HEAD: 113a9796effe3376d2ec5aabcca1fef4fef4cd62  tick/broadcast: Plug clockevents replacement race

elapsed time: 1582m

configs tested: 80
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm          allyesconfig    gcc-16.1.0
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
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
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
