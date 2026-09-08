Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B31534444
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869273; cv=none; b=BWVygC6I+OUDyPTgZUxGu2m3iE8sHgPYgAZm8Y2mx8FWJGEqEGLx7hqnNLj2XQRS5Qw9vSxDNBWYuL+w5VhSLAAapwf2dlcS/KQo7UBTZxUmuvyWuuprmQcR2OseBaPZZKfeqj2Z8FdsijD87pdr2RhhE5GWU7zA+ssYqDH5X7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869273; c=relaxed/simple;
	bh=Df9geUpFbPo8kYMFKQcgbLKrPusR0yzLcPr3I30p+6A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MuuaF9ZsnydOTUePoPVQqgMt6W0mRFE572qVegjDEHcXKoNEr5ZTH06vUh048pvscDvDcakGnwmumEnWT2EdKME1OU+8beoA/1nxIyMmBxUvZbYgcUHVmyhcCNE5gEF6m5tq5drg/wyjBa36OLhLx8+X+AvKVonBZaFmGRQVeGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QwcPb4Es; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwcPb4Es"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788869268; x=1820405268;
  h=date:from:to:cc:subject:message-id;
  bh=Df9geUpFbPo8kYMFKQcgbLKrPusR0yzLcPr3I30p+6A=;
  b=QwcPb4Esb1ie7gTtLgioeuBaMbRydDmp+LOJoJwtKvaRDnL9qwCo6BCC
   AAdPN9oE8/fpBGi2LThzELrhjz6depEgG18j8eHbMULwXpsEi+LGkjEaP
   fNapDtrO7ipC9mkheFo98G8GBH6FsFZfJwVyqDYd9nbXVEpSTA4fyRhld
   6wX7HtFUMnCEaDoG9UpvRoVGsIWqpxLoVUMTNjpJVB+eQRa2in13NxZ9+
   +5qZoZq2e0h/3zEBPnCPOqb6VJRP6vILf7nZPPsfFoGfka/57Zt91Z58F
   9Cp3dZBw7SfB7LqhTYztwFzKFin/ZTzJbpE9Qdqq0lKv2wtO7GmNxh/7I
   Q==;
X-CSE-ConnectionGUID: L+ZB44MiTuC7S8AnbS3Jaw==
X-CSE-MsgGUID: 5cb6CH3pR36uDqPHF5cLwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89111856"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89111856"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 05:07:34 -0700
X-CSE-ConnectionGUID: QSOKkC5eR0ecgvDZwOEkeg==
X-CSE-MsgGUID: EEYMM0KJR1OhupEpJ8QpJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="295870477"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2026 05:07:32 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3ubq-0000000004x-0MIm;
	Tue, 08 Sep 2026 12:07:30 +0000
Date: Tue, 08 Sep 2026 20:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:core:urgent] BUILD SUCCESS
 954f7a48fa2ae7310c67729fb556caf726783436
Message-ID: <202609082014.QHDpW2iF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/urgent
branch HEAD: 954f7a48fa2ae7310c67729fb556caf726783436  entry: Guard syscall_enter_audit() invocation with CONFIG_AUDITSYSCALL

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
sh           allyesconfig    gcc-16.1.0
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
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
