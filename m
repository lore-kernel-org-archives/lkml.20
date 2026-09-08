Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E7821D591
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830676; cv=none; b=bzRExpAhK4T8QtjSVxCZwt47EhDeDCiLyB4H7mWUU2f/4cwC+uWVrgW+z/Mdh27Y5/xC5feU3ojod6K9Yw3/Pu0Mraahmm6Ssc1hsIlOSoaNPNMzdC0/mapWen6m7AD1TnhCz6zjqw6bD4SEiIgz+CCyE+q2mp1oEOpfGQjBk3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830676; c=relaxed/simple;
	bh=xcgUzcfSDBvj2UZorrumzjKzSc7rE1GUXLWI5tPnPsg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IpGTzW2Aa9E7DkivYspUnOwKnBB12UAFbsRYsE+oeMMgQvFpnlUAaWUkB0BxmfT++ar9WJEexWocLwzvhX6GPU2l0u0pKmxvzpx/0EyNuvRA6t7JzxQP1z318ZZ+wgPqG9weDAmyQj5FkLuEFNjvzr9vqCvRkvFXLMdw8A2kjLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXz98AgA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXz98AgA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788830675; x=1820366675;
  h=date:from:to:cc:subject:message-id;
  bh=xcgUzcfSDBvj2UZorrumzjKzSc7rE1GUXLWI5tPnPsg=;
  b=UXz98AgArkfPpEsJO7ERYWILxgStgNxg4ZP2D2KMApCKkySXA6S7/jak
   TsIRGSzcNj8jeBQPM2npx7Kl7m2RrocUJIaw7GhYfyv6zCDe68AAmo0nT
   cwYp2jn2BGV3vOBhvIPHgiWdxfzQdFZ9PvtehrUQOFIiX9xT2AZdhhLP1
   KG4mXOcRf9ZXKkGPWGPxLreGmeORmPfb3nkKgK8MvVYbi2IV8C90kAI0p
   EKke3aqZJAy8gT/N8t8TZVfZuN7aFSKUKvyrEcJzSR56LE4L80/TZIxdV
   De2fm4VABZBK7nFeiWUn7/qXlqdWlzloQZ0EkTlNr9e1UPgAVn7B+XCyD
   w==;
X-CSE-ConnectionGUID: G7W2n15cSsOnvQxTxkVUqA==
X-CSE-MsgGUID: w2Kfqkf2TcuOxbiQgQA9bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89099574"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89099574"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 18:24:34 -0700
X-CSE-ConnectionGUID: jjZlt4aVSjKiRJMoU7Jgxg==
X-CSE-MsgGUID: dqdRa8xERp+zyJw3Tau4qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="295735802"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Sep 2026 18:24:32 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3kZa-000000001VL-2f5S;
	Tue, 08 Sep 2026 01:24:30 +0000
Date: Tue, 08 Sep 2026 09:23:51 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq:core] BUILD SUCCESS
 a0e1fdb96578ea562a03c487f70673d228824d0a
Message-ID: <202609080948.i0Nwn6SJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
branch HEAD: a0e1fdb96578ea562a03c487f70673d228824d0a  softirq: Remove redundant h->action from preempt_count mismatch error

elapsed time: 3215m

configs tested: 69
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
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
