Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF12235DA47
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788807502; cv=none; b=qvlmXifysebJDtsnOiGXtAhJiSzn2IcBj1hZ/K425bns/tiBfliN3lGQMbARsAy8x2wX+KkoaY0XGg8yFEWgZ1KtuES9pHHruCLHE5QrWJvVq9WX+w7LHvTwy55QMPVdPYibJ3KxeWZki5c/onC8lhwctw9urJ0CcOjuSTiMyYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788807502; c=relaxed/simple;
	bh=zzYO/XunMoMFOVCtlY1UeUm4OpE+IxjGPw7rtT4TFkg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SmiSfzDkWLo7s+ppUgGPxcnZ03uZ0Jkzr4n3IyFsv7AoY8yDeT0jeqg55teUDweNa3Qnfo+P/0M2v4adgGOK6ieZLJNeSVjtW/RotN7Lr/CRo7MyH/b0HW9AW7nzSX1apSTFEZJf4auzFyr6haxLlXlxE7ufD92t+i9HiCm8r+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZdioRrx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZdioRrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788807500; x=1820343500;
  h=date:from:to:cc:subject:message-id;
  bh=zzYO/XunMoMFOVCtlY1UeUm4OpE+IxjGPw7rtT4TFkg=;
  b=kZdioRrxREpOY/0D2mGF50/hg7EFbeHRgE0kj1xCjuhI62KlN7gF907+
   tAFIe3nSRRdyiaHViM9N4uJNDwYkAalKNjrEXAkDvZCPSmtMhXWo55kQ2
   8CJMZaYXB+VrNI6uZQPAl+nikoPlspXimNpXoY3R8tvbMZ/pyuolee+pO
   BH3QeAUYCbkLV2L/VX/8+YlRt2AI+UUMNlIrExEhFK8OyullWMbs+3nYn
   7bPwU9d8xJC8AfnGi4ubgR0pVFUzx5NXpbzqy96TLqVlRekK/1oz/1+2r
   NF/vKLGFqozoGwgjT1Ww9QuJ83tkWYljKbkpOuhcLYPNVhb7LRJj6xpos
   w==;
X-CSE-ConnectionGUID: 3A1v7KJRRT2fGqnZMrZtSA==
X-CSE-MsgGUID: h8rgoOMWQnS2wDX1XDI6hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88145595"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="88145595"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 11:58:19 -0700
X-CSE-ConnectionGUID: /OJEFyfHSFG5OsBWRslHgg==
X-CSE-MsgGUID: 0UzyVNM4Q4WtbCZFXSi/lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="295670640"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Sep 2026 11:58:18 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3eXn-000000001FX-2kNh;
	Mon, 07 Sep 2026 18:58:15 +0000
Date: Tue, 08 Sep 2026 02:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq:drivers] BUILD SUCCESS
 13ca1c0b7d8a3ab1e59cb3e780c1dd7441e22515
Message-ID: <202609080245.yXPJorg2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
branch HEAD: 13ca1c0b7d8a3ab1e59cb3e780c1dd7441e22515  arm64: dts: qcom: purwa: Drop the Hamoa workaround for PDC

elapsed time: 4512m

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
