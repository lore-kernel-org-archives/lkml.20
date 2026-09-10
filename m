Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060CB34A79D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027154; cv=none; b=TJLsCtVPnvqnqSwStaIDtzJvV6wr6eIDBJ2mCrlpxViurzkvQMvCPVU6rDB2EhNrbHntc7bVE49Bmg4V07+/OnJYJrvioLGDy38RWVkhtQJMDIdZXj/wboPis0oiga8shgKIDfA5Ok0Drlh9KEGSFY5inW1xHOaaezoeh4G92QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027154; c=relaxed/simple;
	bh=+tSVGHYluMghAiERypGLAKiFGJVcuO1hjr/vqDKFeSQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bsDSRbCEyA9y7DZTP8qV8WaEz0c5fSCOVTk2XckZRB2B/CkoKbCFLI5gWIZsgjTD0XOjPkzwzbpYTedMjYQ7jDIkcijJp7Pbr7EhsvvrANMyTP1hw1zzzb5+JVlEk3Ld6xbn07nql2L5MgRewRTYl52uYZ2IL15t4PO11RdVrxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXQfYWIM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXQfYWIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789027152; x=1820563152;
  h=date:from:to:cc:subject:message-id;
  bh=+tSVGHYluMghAiERypGLAKiFGJVcuO1hjr/vqDKFeSQ=;
  b=GXQfYWIMg/sLVb+btU059matH8toHaeOd6fGasX71/DuI0lHv1o2t8Oi
   idwtO/uKSxCJcSYW2fibE65Mktdlp5CXgw3Ja6IkFC55qH68n7nH8ptCB
   9kAjntMl+qagjM8/JJ/CcWZG4xogxVpCTWnKxdhYvxonJdF5V/Ezk5Kya
   0H5WSPGUweiaB6a7AB9ckwl4ahkusNpP7gS6lD5Mel0NyR3wwvcbWAZOb
   X55L2/NSVz5Nn3zAGFjcEF99H2saxOkTYae5z9kz7ZxdO136tcFla+mib
   XVohP4qKKQiQEhl1stNRD7VDBvSRylQHUvx0E3XSTYYeCF4/OOQCbR+3O
   A==;
X-CSE-ConnectionGUID: RLG9iioMQxW5LRoxs2WwqA==
X-CSE-MsgGUID: T38cGlrfRESfGTlnv+bQnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106838481"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="106838481"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 00:59:12 -0700
X-CSE-ConnectionGUID: nnds1CkvTZyM23Kl+1hDSg==
X-CSE-MsgGUID: bEG5tgFvSaqpU4ced0wZ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="275707554"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Sep 2026 00:59:11 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4Zga-000000001Y7-1VkE;
	Thu, 10 Sep 2026 07:59:08 +0000
Date: Thu, 10 Sep 2026 15:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:urgent] BUILD SUCCESS
 f7491d7c81db0e7c304a7bd757a76d2fbeaff80e
Message-ID: <202609101530.8O3CL2sx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: f7491d7c81db0e7c304a7bd757a76d2fbeaff80e  x86/mm: Fix user-space data loss with MADV_FREE and THP

elapsed time: 1335m

configs tested: 60
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arc          allyesconfig    gcc-16.1.0
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
loongarch    allmodconfig    clang-19
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
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    clang-17
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
