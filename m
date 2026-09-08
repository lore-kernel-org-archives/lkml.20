Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249864477FA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902351; cv=none; b=IBsIHlNQvu3hfUtByT9XNtbCorW8N7TxWl0e2/beq1lgKc+78C6Qud4L35A5QjRkZVlsCHiNBMh2vJp2bSP7hyhohT1RbjaYmiOXSHh2Q0JD88XtgLlcIVfBVpbYgCUY2fD/+W9Z8T8q6ldG3bPBmg0gc4auIFx5U4wPfIWoMYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902351; c=relaxed/simple;
	bh=jQ8tYK7e8T6cl64ACwc7fZturl6nee+hmSWxs/E0oJk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZUNqubKbyY8stCofPG4xu/CTeI2aLJwhEOfUoJZ1HGi9ehsne+iNJ5YNN5WqNHJ//2o2NstJimOklevpHP1c7m+ruA+MI+Vxvy0dPkpEl0Cuzsxyear8wZAometjn0sYgg+sFIyeM8CthABUFEPKLVFLAGKjxCs7XabpJoIUcFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gyKm6ml6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyKm6ml6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788902349; x=1820438349;
  h=date:from:to:cc:subject:message-id;
  bh=jQ8tYK7e8T6cl64ACwc7fZturl6nee+hmSWxs/E0oJk=;
  b=gyKm6ml6clA8a1nKd8f/A3rI4Vfv7V9caZW06Mm709c9raaVmPg1/ekz
   4JygC8kyQXWiBt5L8rAcxXZKvF2ShUlrC4YSwy9UobzDrYTWQVnTS92l7
   YtE3FS0La7765Q2KZIzifOnPcJGWS8vnfk9a1gBxWcRX+mJv6D9ZdbIjY
   IWPCnLTdTL610yzCFuuwo0rID/t3ahaFvY5SvuDztg4A6Hy3rSyBvPjeM
   EtYIcjOj/r2rzmAe5+2237FHiOPU5+cRjBr/EMGebG2SM1d9KDtif2qHU
   tdLATVXn6eenlNNkWy8TrpsrDvRqodtDIBZyV1abfkuCF/hGVDZf6bcCz
   w==;
X-CSE-ConnectionGUID: ys5TrHGVT3uF3DzCqpGicA==
X-CSE-MsgGUID: I8mW96qBRmu3p5GFxId2ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114857365"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="114857365"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 14:19:08 -0700
X-CSE-ConnectionGUID: Ze/iqxbvSnmgBDgBLH9elA==
X-CSE-MsgGUID: 82/BmweXTB+U4fkdK5A5jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="309370750"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Sep 2026 14:19:08 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x43Dc-000000000u3-3Qqi;
	Tue, 08 Sep 2026 21:19:04 +0000
Date: Wed, 09 Sep 2026 05:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq:urgent] BUILD SUCCESS
 1017911fcc03584b6854b1b8f0aafeb25f5a8d25
Message-ID: <202609090553.v9MUtrJB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
branch HEAD: 1017911fcc03584b6854b1b8f0aafeb25f5a8d25  irqchip/gic-v5: Preserve ICC_CR0_EL1 state

elapsed time: 1526m

configs tested: 47
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm          allyesconfig    gcc-16.1.0
arm64         allnoconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon       allnoconfig    clang-24
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch     allnoconfig    clang-20
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    gcc-16.1.0
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
