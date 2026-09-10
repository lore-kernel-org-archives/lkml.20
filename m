Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5383839AC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789009340; cv=none; b=r6Pxbxf06ECC/8d2163y9EMdTvIdHNJiuz57jpBiFU4Vu3k7MIcvxzvE5hD1q76DgomhDeW8lT8UgwSPjQT1V38UQDiH+lflj1pVqx+jiIQY+awYZzSeLnPukxXxLuIw4h/XDqWvHt+JG8x/MVEpbRLM16ISs3HogrKRr7Iogao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789009340; c=relaxed/simple;
	bh=0+kSteEVVTUk3GrBvBsGvBbliaRDTtC1yv7a2Coohds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zk5kD1I1QZYI2zRGTFEVg1J5SXy9fgV19tBI34I7NRNm0jHNpDLo4x7FWeEAVHCU4uEps9XYY/dBVDFp609fmknsZwJMufpZBbMkKdDmhsdHrO3z1YG8otKkqdf6w0JDkRZMM2s6qZqkF5mB82dypc1fscQlUGaNTmfe5SjZMB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzGYqeaX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzGYqeaX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789009339; x=1820545339;
  h=date:from:to:cc:subject:message-id;
  bh=0+kSteEVVTUk3GrBvBsGvBbliaRDTtC1yv7a2Coohds=;
  b=EzGYqeaXoZMVTcg7qq0Ssh6JUvGQOEFPSPVSUpdjNcDjuF10iU1cRdI/
   +U8gpkkEl4nCHy54KVwF1DnYLamcZdi6eNZRjl39kVkJIY2gf2hChtMJ1
   45sUvy1rmwlgqZZ5eUbvJB77DOD1jfGW+H6S6QmYuzeF2tjeIZ1mqTnLk
   XjKDZju+d13fMpRdlbhMnLA9DEC717kbU6A3/hfYicaNMNdDLWj7ZiZJx
   eyNgtLrhN+M5hGgwJXzlAUTeJVxiV+HhMgX+k/BJAAaMA6VbeDkMlDWdT
   JAckrQWrcNRoD5IM3l4xbHDKHChlqiryW1ffoRel8gAptjlrUzUlzrPEx
   Q==;
X-CSE-ConnectionGUID: q0wVqSNbTba+4DS+Zd8pjQ==
X-CSE-MsgGUID: /NZP8nFxRDSRIVq8jjV57w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99780247"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="99780247"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 20:02:19 -0700
X-CSE-ConnectionGUID: PdCvwd1AQp2+S/myfXHIug==
X-CSE-MsgGUID: I6mrUVg2SkixcAYxPlpOiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="269738390"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Sep 2026 20:02:18 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4V3H-000000001Ie-2Hnf;
	Thu, 10 Sep 2026 03:02:15 +0000
Date: Thu, 10 Sep 2026 11:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 123f122bf1c8ee24cc967e53bfbc1c612551829c
Message-ID: <202609101120.Epb9BICV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 123f122bf1c8ee24cc967e53bfbc1c612551829c  Merge branch into tip/master: 'x86/tdx'

elapsed time: 1038m

configs tested: 65
configs skipped: 0

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
