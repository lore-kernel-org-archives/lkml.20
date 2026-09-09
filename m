Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FE3368D40
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974601; cv=none; b=JbXzet5Ntoswi4oiqGi4JYHjWK0s2DKBC7JbPcPTfzkzbXkpCgytVVw1OrJGJgJs5TT76dq9iU1lugzEtIpOHVUxuc4U1xhoEkgRfEV34tty3l7wIT2ulBrtvcgSApaGWY7qM+SwJ/qG8/BS94okh6XNOmo52aWLABUX81ezuXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974601; c=relaxed/simple;
	bh=QRQeyGbvB6uWFyozMaw+B+k+NOkOMlgBgEc3+7+aDms=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WGy2Z9Yday0aEzxKiCQAuyg3wR1SlM5GJ4RK2XA3SuA2tXi05hfbzPG1MUdz44OVJwMPDzeuv+QM7FNnby4EgLDVv+A2AbkLDj9adMrqhwlGXqaATRVzBFlXlIO9AvAUXZEcGz32Uh2LKZeAtd19em17A6Olc989Jfj/SwMB7EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JnUwVxuj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JnUwVxuj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788974599; x=1820510599;
  h=date:from:to:cc:subject:message-id;
  bh=QRQeyGbvB6uWFyozMaw+B+k+NOkOMlgBgEc3+7+aDms=;
  b=JnUwVxujMN55FeRzS+SSbgN6bkiLM2T/aUt0iZXDZAE8R6IwcvH6VgBI
   yzWAPv4nSZTiLtVJ/w/suz/JXJo7bm90JVDMweYfJr7oxlhDOw3LeEa5t
   hEUT9Vxbm1r1+1PBHDvrwX/ZI2EeAVOeG1b/KzSQOK1rK9gsN6SP4WjbY
   FRfFQtsQg1jhpYe4OgVfDN5Y9sZFHakAC2bpEmiTmeV3UKG06jOgD5XFL
   ro5JDmuoLC2/3EIlg2AiDQWoA3VQagCULSBTObUeHyKyFUtaO5uGRsuwx
   Zosi64ASUMbmEq52u5Nno2ztr0cMcfAufBjpnfSepMzAiJHfTNKzPqFN7
   A==;
X-CSE-ConnectionGUID: Uq5HLVSWQmW9oBhzIxmfJg==
X-CSE-MsgGUID: LNlv2+ybRWKBxQaEc4BJbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91928487"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="91928487"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 10:23:18 -0700
X-CSE-ConnectionGUID: NO8JRf7GT0ukM4Ssh8/i3g==
X-CSE-MsgGUID: 7aDOgVIdRzm9bACwb8o+NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="275152080"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Sep 2026 10:23:17 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4M0w-000000000h0-47F9;
	Wed, 09 Sep 2026 17:23:14 +0000
Date: Thu, 10 Sep 2026 01:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:mm] BUILD SUCCESS
 ebaf7c9bbb1e16523d7036e7e1225ad2dfcc6482
Message-ID: <202609100112.85vhF5lU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
branch HEAD: ebaf7c9bbb1e16523d7036e7e1225ad2dfcc6482  x86/mm/pat: Fix effective RW computation in lookup_address_in_pgd_attr()

elapsed time: 1119m

configs tested: 55
configs skipped: 28

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
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
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    clang-17
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
