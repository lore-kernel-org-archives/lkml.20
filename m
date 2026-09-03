Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13257381E88
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788407032; cv=none; b=LFowx5d6liaM/hamiWXBuqnZD1lHbdsDp9P+yIGIgU37cZsfGdp9clDX7WaLQ20eICxGAmmh7lC/nQ9RHkCjzQamxO/8Kq3lHeVeKpsdU0p0QcUr02PQG4TXLN6PynjiRi4qSwKtVdEZGu/YziNDO+NoAjhq53SX034Tm9huIwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788407032; c=relaxed/simple;
	bh=URtMABNXxfDs9rVLzPk4e0EloHpc6n9IORh1n8CJQQw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aVCj/+zrMsL4i0rmkEcnJvmIUaQZAE34bjJidFQ3rHA9yA5905CF1pZFQk9va+xJaZnSe6dUhGrXG6rKOG7LOqktSfgxicz47rB8wADLguL00bK/fsP9WFt/oE6qzIXBe/lQENZLU81H1TX8sLMIWn84eG3TvJnIbBDjgs8SpPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrSY25Gs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrSY25Gs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788407027; x=1819943027;
  h=date:from:to:cc:subject:message-id;
  bh=URtMABNXxfDs9rVLzPk4e0EloHpc6n9IORh1n8CJQQw=;
  b=JrSY25GsfbWgES2Kv72ea/pL6bNgUWm1cm7Fwbc7Y00Al+PK6oqz2LOC
   yP5gtrCfmfKMfE1aRruO7BX8uW6pPpoMpCuxYQWO8P8DrbA+W4ARxd/By
   pIkQiWTlX3FvIKhm/n/7yBTjuWJjjH0vTfz+oAIjdwzIkopmXb1vVGvma
   zJP/JwhRU2joEBxQNh5vmVS6pEX+6l42IiQ4s8Jk2PrAxUno2HAxvCwmO
   PyU1z0KqNv6FF1mNZiIBM6NUQeC4NUKSM1B1NNC0F/QpRHqQ3wWXGYDl5
   qIlhzycVqwcglhQWoGHKvJOkuu+iZFH5QfiY1cb0OhUvmcC6/x9BUakPc
   g==;
X-CSE-ConnectionGUID: +y17IxNRTbeDbasaOPUvNQ==
X-CSE-MsgGUID: 7YCp1a2UQwS7J7GgGFuGfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="87813249"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="87813249"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 20:43:43 -0700
X-CSE-ConnectionGUID: NlJvmcORTkeh7c+A6ug48w==
X-CSE-MsgGUID: 6BVET9+cR4mVznAvDpU5og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="293095553"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Sep 2026 20:43:43 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1yMX-000000003vi-1Jg4;
	Thu, 03 Sep 2026 03:43:41 +0000
Date: Thu, 03 Sep 2026 11:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:bugs] BUILD SUCCESS
 ae1d2082d93bc04604dc08e9b7f9cdba5e0c28e6
Message-ID: <202609031103.ZiQ7X91p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/bugs
branch HEAD: ae1d2082d93bc04604dc08e9b7f9cdba5e0c28e6  x86/bugs: Adapt SRSO mitigation to Zen6

elapsed time: 1518m

configs tested: 55
configs skipped: 30

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
