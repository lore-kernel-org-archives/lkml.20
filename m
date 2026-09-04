Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DE8381E83
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552120; cv=none; b=UGD/kFM6Z7hMo3/whPvXVZVKw4X673Um+kvVAMsuMFzapMG+bOn2X9T8ykrs1EoEznqVfb7u32nG5aANlFyb1N9cHv7WtZ7zCgV9XYSRrHd9wt9FFThxwPM7obC/IoHYkxzY0/4LsYAe00TIUP71VjJOoXzKXSttaKk79InLt30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552120; c=relaxed/simple;
	bh=2k37FmirVy2BG6zwUJrSVmcDDj4aNFPM6uzcHOHMOW0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d1+sjcu98IBYD9+DjSaJVnOA13c/QQGoUfJuD2GfY5rWNbp2Avwq5LGrpfvSwnuBBnubh8rYc8bh8tH/Jx+LY+txec2UF9pgfZ4iZ/CkeXvy3/UfAtgtFVrICnRiV8gkl0kwDBqpDE74XRVL26jzZUwm1zquTU2N3MQyrUnPcfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxjuIpwz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxjuIpwz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788552119; x=1820088119;
  h=date:from:to:cc:subject:message-id;
  bh=2k37FmirVy2BG6zwUJrSVmcDDj4aNFPM6uzcHOHMOW0=;
  b=nxjuIpwzxzKz5xIKV50Yq7S63N/iki3aTjxOJN413ljMy9Kspuy58T7j
   ipv6IN4abaj1gPJOL/NQXWNfYPtf5bFbXiZUJgWmYmCvyWjr/S4hHkaqo
   kekqjAt9nPQl6ilU0wstantMtrAsPXvkxu4MURTiYaCbNCXzhRowtg+LL
   xXUZd4c41NJpFpJuM1LmvyhU2xle1vKMSbM7evNdVvBM23bZIuePO7W31
   4J2KZC6KfxprwsGNCyFEzjKwpS4EAgYFKj33yfgaGK4a7P3fyfnN7G+Jm
   SiegZIigcWNuKcAYf0a0s4b0fzhDKq6LL0mxAXoteS5eLfnVbs1Be+2Yq
   A==;
X-CSE-ConnectionGUID: 67Q1HZ+CQTWyxG6lk/nlVA==
X-CSE-MsgGUID: DOtSdpqHRZyFDqwKHZMoRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99392954"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="99392954"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:01:59 -0700
X-CSE-ConnectionGUID: 9IZRpRbtQheyGmxr92+yJQ==
X-CSE-MsgGUID: Z0PmgIf+RdqsJfXeOTrN2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="308337380"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Sep 2026 13:01:57 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2a6l-00000000A7y-14oh;
	Fri, 04 Sep 2026 20:01:55 +0000
Date: Sat, 05 Sep 2026 04:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:cpu] BUILD SUCCESS
 f4cadf2d1ee3a24f259495309b76f98af467004b
Message-ID: <202609050448.OLgmrr42-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cpu
branch HEAD: f4cadf2d1ee3a24f259495309b76f98af467004b  x86/shstk: Shadow stack enabling write return code change

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
