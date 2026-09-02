Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868164ACC79
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375298; cv=none; b=Q0FbnLJDrPbWFee/5X7d9P/GsWmJtTAUq+mzE+7k8GkrwcNZLwgpUzZE9toXoRd4hhXKy9t7i/ZqD7tqwRkE9w4rwV5PfS9HCpBPO4PB5x2pcMsGTZlJwjkfhlE6nnpx2JluEIEIWMsKlLcSy+KVmxZzx6v7RuIQbkbyffGv+6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375298; c=relaxed/simple;
	bh=MR4qgJ1UJ0oluwZRSyT4J7IWkcsE8d91sz54LaYA/VI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O7Y8DqiSbgcLh5kBdP5hJ4fMmJMBhfWRa6g1eq1xn124bh1MzGTMBaiT6pYRem8fIo39YdnoR5rkD7YdhrpHBMLwhBzq64aaKjHFJHCjxWeQ549Zd905X98RRXgCVHEaNqvQQiejKUe4fdP0BiSmrTAVnMj+waR4B97uof82RL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsZY853r; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsZY853r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788375293; x=1819911293;
  h=date:from:to:cc:subject:message-id;
  bh=MR4qgJ1UJ0oluwZRSyT4J7IWkcsE8d91sz54LaYA/VI=;
  b=VsZY853r/aPeCufSEWwNkY/aD+ViPrWFTAlmu0xZcPRn/+aIIevV7YDX
   gpE6KAlNUL01LFcSA5Vlta7F/o96e1M4KmorzJn1kqas9Izm8h3XKOEaI
   OycICNRZAU1xvANWRT5iYuq/kwJLmZyAQqwdkiz2UgyIGRRZDVP/DlQk6
   xv55w9xGD4pzp1+VRq+1UTb2d/wb+A31dMMHoyCY64W54l9KEvLC9qR5C
   tPFr0zxRIqGkntbz7EjGjnqWzIATVpIJ0n216k4PWv4xAspX8Juko+oYm
   M4+7zuUvO/JxncBTuzPMWX5EOrZ5zDZDY7G43dGDp/Nq04qpLUb8oxHwQ
   Q==;
X-CSE-ConnectionGUID: bhxHqB6cQE+ClAUM5Z1BVQ==
X-CSE-MsgGUID: WClgt4igQTiG1tnHbcHHVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="111619137"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="111619137"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 11:54:49 -0700
X-CSE-ConnectionGUID: 3Y7oqasjR3GMIdjLdygtIA==
X-CSE-MsgGUID: Xhc0otCrRIeb07fWYYQTxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="265794651"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Sep 2026 11:54:47 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1q6f-000000003AM-2Gbs;
	Wed, 02 Sep 2026 18:54:45 +0000
Date: Thu, 03 Sep 2026 02:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:bugs] BUILD SUCCESS
 ae1d2082d93bc04604dc08e9b7f9cdba5e0c28e6
Message-ID: <202609030204.SECibHDv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/bugs
branch HEAD: ae1d2082d93bc04604dc08e9b7f9cdba5e0c28e6  x86/bugs: Adapt SRSO mitigation to Zen6

elapsed time: 989m

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
