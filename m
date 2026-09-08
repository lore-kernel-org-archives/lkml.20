Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44CC3A48E2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851470; cv=none; b=EHz9k/u0ZqHw8fR3QdqE1p7s8BvW4JJr+Xt30DsTtrRiTEf9BZFSnsbLJLMTGml02+8ECnWf8aBwhUobuJQj/1Mh17fzabvPmYlR4KYYGhe1Y27wYYLtjuJevhlbSlRkSAl09OxP+xMOQhOldJMmQsF8jGUZ4tc3m/rA2ASsR9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851470; c=relaxed/simple;
	bh=JIXhw0fXO485eNZ4xuaJ1BqsQwhqUIYu19j/zLf8Wjg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q0gS7WsuwXWdHX66r8Lq0+MZfPaam3XkdYZT+q1rntlrvGBltoh1LG7h+jmYJCcsLr+Nd9jkKgU9GZuEGpG4q5srbohdhfmMftCOSdDwOUyjKJJj9yPynCN+pqM5+pab+PwUYG8DoSiD2hfoLmfvX3JuTOc/BSMY+upbQ9tzrfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxWnNWxX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxWnNWxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788851467; x=1820387467;
  h=date:from:to:cc:subject:message-id;
  bh=JIXhw0fXO485eNZ4xuaJ1BqsQwhqUIYu19j/zLf8Wjg=;
  b=IxWnNWxXWjqFyoDrHKooBgEriQebBJrn0N6IQVLL81l0F0fcuyAKCPRj
   bBUICWL/w15NPo+k7nNkXp1pdCLxs3Du+h4tENsRYHL+N4Ef9zlmYYj5x
   igrYROpzZ0i9tJ+SWewhsddwYOKbkof9sNVnC76V+NEophdWbeKfObP7W
   YoH+jUqlTi6bOJXSVHf+nZRtMhlQVMNVjCTQwm0a5ErcVqD/b0dicHUfM
   oTe7D9j/uofgolYSTHgDZkZkCbPY3p+hpqbn+nWEA9mE7kFpsDNpgEfrY
   4+NhBO4k+pOWt4sXWne0wkMWX9BOHI4BVmSCTKPl6zlJD5RY2mMdtGpaZ
   g==;
X-CSE-ConnectionGUID: OYwR541lSwqXmiG9Hd68YQ==
X-CSE-MsgGUID: N01aWmJlRDKe+nnORuUaBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="76805216"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="76805216"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 00:11:04 -0700
X-CSE-ConnectionGUID: +55iWwGQQm6G7tn9pUB+bw==
X-CSE-MsgGUID: ZdxuLEa7SKG3j5uNkvdD4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="272846921"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Sep 2026 00:11:03 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3pyu-000000001n7-1gXs;
	Tue, 08 Sep 2026 07:11:00 +0000
Date: Tue, 08 Sep 2026 15:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip:urgent] BUILD SUCCESS
 102717cab52c1e29b67850b7bcecf421d36dc298
Message-ID: <202609081504.hC3j628m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 102717cab52c1e29b67850b7bcecf421d36dc298  Merge branch into tip/master: 'x86/urgent'

elapsed time: 1505m

configs tested: 57
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
