Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434402;
	b=hvERvF0otC5O6WGD38I9i5kfqbZXTtdbZbgD4vjyOqhH6Gz/4mL3bBN2t2WQ0Qmv1xT/
	 +PFUEXTIj+CXgPxm445UViLXvgLyoKgcUIaJm0k0NwmHbLa//X65+0UZQGDKrRBd8Mhjy
	 4xUUBj66g22scbkpXdkNP/HIuS3CMnm5a1pSKMzEZKX5iqu8uMod/4IadgfTe6MF9CcKb
	 FuuqbgHyrTGpG0sDwPOmCIf7ZETzUClJqVMB4IcH1MT/gQx8TuuoIfPh5usHdffAV//OA
	 2jNxjpWHTEHwEH7pyp/4M+/ncJxUdMHXcqZzIg/XgWOYDEQxeuPtPF1XJPCxrdDSQqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434402;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=D/MJw7b7sqVNUyr2ak0+mfj7+OIXy+ZHEbW1fHkEk2I=;
	b=Z41DSla+v8cS59ilskkDdq2g7gMdiJgZEeicLxOnw+PWMKhNRHrQywrd10sNZojXIsBE
	 pI0sIzJA6VO+xnWYBJ3WZe6N0p84k3jeq10grOoJNKD5jZJ7GdJlc5j5fFJSxSQDF0J8/
	 dN3QYSjp9h0NLBl8jBkqe4lZ1xfCbW/EVv5QUsK5oxBPf2F+OHXU6DAKVNYOMj7Kk64ZN
	 NcVhvlc9oOqhVYgDF67wD0h4nxrgEwIsiB8/gbthRPejbrw38qg6us1ciY2M417UP0tiC
	 OyCdgbX2Clsbso2eSsyTAitgo7XQfzLVbgSNU5HiVeoekxFX2lyWiHaGebm6DtKnzTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RgwfnqOK;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EA2606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21EA2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RgwfnqOK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792434401; x=1823970401;
  h=date:from:to:cc:subject:message-id;
  bh=q08Jkx5hg1UVVLTwRHrnu4D2+3uX28+FnXgXYxpy0kI=;
  b=RgwfnqOKRSCygb+8AkGjt/xHojKB3TKXvZm9vObmqVewlrIZSrqXNiT+
   NKUikDQbQU3ggYHV8fdAbmXD0PkGjA8NAHhUOR5k8gif7bmCDhoaEPOtL
   Qq6DnhknjndXMtgEsOGSAXw23pvXP5/NsxdfCQxAsO9vnz4iUN8AlGIw0
   Xp3B6xtHLuMnD4/jmrJX2DamSn9xqwL/y3VVdvokwp2lxU89DRu0Z+RNg
   je7UtrYLQdreoMMYYv0EZQcs1STxIsjnfXj/SHCXY+G5rcCjAjEfmRbsZ
   FhvDX6s8Q52xWvI6XE6sEbH/dgEm4K52HN5xyfim20Mkd98EkkjeEmh7h
   Q==;
X-CSE-ConnectionGUID: z3JtYh3PRdOmsTGsT0K0Aw==
X-CSE-MsgGUID: zILmnTazTNqFzHVytKET/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1163246"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1163246"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 11:26:40 -0700
X-CSE-ConnectionGUID: wuVup/EeTSuLT04/hPgl+w==
X-CSE-MsgGUID: ehh0c5vZTuSYdRBubXHZ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2607063"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Oct 2026 11:26:38 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIs4C-00000000MCI-1Wpz;
	Mon, 19 Oct 2026 18:26:36 +0000
Date: Tue, 20 Oct 2026 02:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2026.10.14a] BUILD SUCCESS
 1a09530e35bf96053326b1a7b19a466c6238ad6b
Message-ID: <202610200214.nS542DEr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.10.14a
branch HEAD: 1a09530e35bf96053326b1a7b19a466c6238ad6b  squash! EXP rcu: Print CPU that preempted stalled reader wants to run on

elapsed time: 2199m

configs tested: 53
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                     allnoconfig    gcc-16.2.0
alpha                    allyesconfig    gcc-16.2.0
arc                      allmodconfig    gcc-16.2.0
arc                       allnoconfig    gcc-16.2.0
arc                      allyesconfig    gcc-16.2.0
arm                       allnoconfig    clang-17
arm                      allyesconfig    gcc-16.2.0
arm64                    allmodconfig    clang-24
arm64                     allnoconfig    gcc-16.2.0
csky                     allmodconfig    gcc-16.2.0
csky                      allnoconfig    gcc-16.2.0
hexagon                  allmodconfig    clang-24
hexagon                   allnoconfig    clang-24
i386                     allmodconfig    gcc-14
i386                      allnoconfig    gcc-14
loongarch                allmodconfig    clang-19
loongarch                 allnoconfig    clang-20
m68k                     allmodconfig    gcc-16.2.0
m68k                      allnoconfig    gcc-16.2.0
m68k                     allyesconfig    gcc-16.2.0
microblaze                allnoconfig    gcc-16.2.0
microblaze               allyesconfig    gcc-16.2.0
mips                     allmodconfig    gcc-16.2.0
mips                      allnoconfig    gcc-16.2.0
mips                     allyesconfig    gcc-16.2.0
nios2                    allmodconfig    gcc-11.5.0
nios2                     allnoconfig    gcc-11.5.0
openrisc                 allmodconfig    gcc-16.2.0
openrisc                  allnoconfig    gcc-16.2.0
parisc                   allmodconfig    gcc-16.2.0
parisc                    allnoconfig    gcc-16.2.0
parisc                   allyesconfig    gcc-16.2.0
powerpc                  allmodconfig    gcc-16.2.0
powerpc                   allnoconfig    gcc-16.2.0
powerpc64   randconfig-r2202-20261018    gcc-12.5.0 smatch
riscv                    allmodconfig    clang-24
riscv                     allnoconfig    gcc-16.2.0
riscv                    allyesconfig    clang-24
s390                     allmodconfig    clang-24
s390                      allnoconfig    clang-24
s390                     allyesconfig    gcc-16.2.0
sh                       allmodconfig    gcc-16.2.0
sh                        allnoconfig    gcc-16.2.0
sh                       allyesconfig    gcc-16.2.0
sparc                     allnoconfig    gcc-16.2.0
sparc64                  allmodconfig    clang-20
um                       allmodconfig    clang-17
um                        allnoconfig    clang-17
um                       allyesconfig    gcc-14
x86_64                    allnoconfig    clang-22
x86_64                  rhel-9.4-rust    clang-22
xtensa                    allnoconfig    gcc-16.2.0
xtensa                   allyesconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
