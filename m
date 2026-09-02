Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF8B43E083
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390426; cv=none; b=gV+QDkeqK+9F4aOstYQzIoXlndoD+dz/9ElH+wQEqIbsmPnlsU9FNpIsC3kB94cKP6Q1uh54+ZylFihh4VaUf5WPQrjNIgeHucQq3wUIvlDj+D458SLq7aidzyfr624cLkEd7QeDcl5QGJ0GIKEHEqhNjONsBNCLAaemkHPvXPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390426; c=relaxed/simple;
	bh=Gi6ZR9CeS40YgnOJFANvXSgCP3NNW9e3s2q172ykE1M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EJwvVgVu0Ah9+DV3G3Jqy8qH0I0/gzkM8ZZoS3WKy48vMcAzue6sFHVBbCGwy1qs2W8qZrq2Jk2+jyGZw7hAP4ax2Lg/++QTjZGNP2cZVgprMaIUlhTeKwitSCDW12oogw1l5oBtOCQQvkohEXEy4ZzxIv+ohZYE7ER3XTw72tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRKs+rgy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRKs+rgy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788390425; x=1819926425;
  h=date:from:to:cc:subject:message-id;
  bh=Gi6ZR9CeS40YgnOJFANvXSgCP3NNW9e3s2q172ykE1M=;
  b=mRKs+rgyr0uddTW1LUv6aLFtn795oFyXLEjMe7a/MvLUiehIlYEIfRGw
   jpudUXUSV/3ifNSgDgHIEn07FNayfoTCi4cX31uvQ+w62oL9FrIoofOEf
   WRkS9YEu7U6r4eBMdjwm8L/3VahFwyxX9qcoTAW4gQrNkceR2sEwDzqvA
   VKJZ6RPqW2x8iZxjcs1gDg441hKRBoc5HFrVbQr6zpAL4JnahokYbUfgo
   m882NGMbKs+Bisg3ZonG++pdPuGxzPYbVTqN6omT12Kh7VSniYnuGq61J
   F4VCcuL+m493QoRRynkP9/CzoqH1KM5m0kEaiDwxiyalfO8VfTVeraFDS
   w==;
X-CSE-ConnectionGUID: BBz2fyYoRWCq1TbPlrnm2g==
X-CSE-MsgGUID: eRYF1k4RQD+WqMhuIhf7EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88626241"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88626241"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 16:07:04 -0700
X-CSE-ConnectionGUID: XXFgzgFbQP+39NCJL/XxZQ==
X-CSE-MsgGUID: sZhM5mXXQqaaDX2wU/F1FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="270096441"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Sep 2026 16:07:03 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1u2m-000000003Qw-1lHA;
	Wed, 02 Sep 2026 23:07:00 +0000
Date: Thu, 03 Sep 2026 07:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:urgent] BUILD SUCCESS
 453e7859443446b837d905d6f2983a76c867247d
Message-ID: <202609030750.z5NP3VbT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 453e7859443446b837d905d6f2983a76c867247d  x86/mm/pat: Fix effective RW computation in lookup_address_in_pgd_attr()

elapsed time: 1329m

configs tested: 55
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
