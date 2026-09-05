Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4753836DA1A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788620639; cv=none; b=MPViH1G+6YIfJaM6UDNH+r+aCo+UgOlzOap7Ss76qjIC93JWgJoFY214WtEfGn7xmTWhWK29oLS1mPPUcVubdidGvjzHs4EKq/mOOoAQQp0ENrpxGGizNMJkKF0qp0jMAkO09AOXv933IPWUD+dZItyvnDVLqsDudyUTTrJlCxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788620639; c=relaxed/simple;
	bh=39cTLyJAo2+EsBBGUEPxOl2NuySOzeO7aPaDIjgaGXA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HWBg/yN2JtqwYviUlNibszEiwHygosBdl9+uyTSgCjCUHJS27n8Z9o7b0WLWQzVW3i2S5KaK1xyqWSamTQ9EC8UmkZ70/9wm18twXP/Ycf/4aThQ4PT42gJLVdH2GS/kTcxZNeEBxr4I7p454vzc6KVDNWSTLs095c+W3G0u2qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYuLEbML; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYuLEbML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788620638; x=1820156638;
  h=date:from:to:cc:subject:message-id;
  bh=39cTLyJAo2+EsBBGUEPxOl2NuySOzeO7aPaDIjgaGXA=;
  b=QYuLEbML7prvsLC88ZPB41V4OxCzLcXXbRpiAq//BDmiWWmTYKIl/pGW
   pcOvOftvRyhLQpWSyzzeUOA2/czCYr4cUb+yb5L+FzYzYQG9KviCawoza
   6Lk9Ool2mzp68LHO5csyYFXftjY4i3pSX8QnP78leMqXOX13MZIQQ+fH8
   27+wDkPlQWKGhFZQAJWFhL5Jt3JmnGrnLroa43dryKrTkJrCpCo0zXKSh
   /W6cvAwk/wb0T83l/0sGPuf3j8O+voBWLSr+fJvSiK4MjG7K39QKJwz/a
   A7jyfB0E9fckJ6SaD2fKfOhTaDJkYdOrCUjL4aXcrcQ2+Qb+CNBDlX//b
   w==;
X-CSE-ConnectionGUID: fsZHMNvAQkGgWMzYu07KPA==
X-CSE-MsgGUID: x7jqr5ZCTPyGrGt4z27c5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="106463554"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="106463554"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 08:03:55 -0700
X-CSE-ConnectionGUID: mGKkEgEaTwa91kqDJ2IdUA==
X-CSE-MsgGUID: CVB2pHasTZ+ackCiqerWTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="274118424"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Sep 2026 08:03:54 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2rvr-000000000dB-2zYT;
	Sat, 05 Sep 2026 15:03:51 +0000
Date: Sat, 05 Sep 2026 23:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:kdump] BUILD SUCCESS
 d949fa7b1ec54c626b656f873b95d76b8ab0d143
Message-ID: <202609052355.NWuvBrGk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/kdump
branch HEAD: d949fa7b1ec54c626b656f873b95d76b8ab0d143  crash: Update stale NR_CPUS_DEFAULT references in elfcorehdr sizing docs

elapsed time: 3556m

configs tested: 59
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
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
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
openrisc     allmodconfig    clang-20
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
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
