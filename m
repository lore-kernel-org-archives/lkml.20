Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793535524;
	b=Kekej1idBENg/Y2GRmxgyNikS3fUijv2ELvKv4BaWLPWimoSVXy8HhiF9pVOeQwyNny/
	 tacHOKb5z5A8TXU1Ui9Cswe2cmt+vA+kHy4JRWRs6BDUKLcKj7WlX0YWxMoP1SHW7/9Ok
	 /n1lSdVLH4EtYt6QRSKFa0VzeC8glAnuLG44L07SRmT9PDPMk5SC9GMNXYXkImMKG07gm
	 pjigsAjRFTDPncwZIDSy8Vzh0ePVTlEWZgRP/KXzK19mX2JElmfiC1LgT5rPgv9iLgayG
	 my5iw0Vcl9HlULbUG1xNEGHgmsK6x7Vvu5AOklSER5Rp4R0XussW10ItQKFGcMeeX3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793535524;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=1mSn0UJFueTtA/HEJ7YdR4yTB0DtlZnYMAr2+J0vYm4=;
	b=B8J0wmf9iHGoKlUtsVdj8TxI8FCHI6GBz1FmsMEryxV0TwLiAgnArzZ168iSpNRouDRP
	 jlN16I5Zh6dKdlDgCPzeBC6LF+48ZHDZecNaANaP+qdnK99o98tBt2bWJSbBSk9EyQ/S4
	 85ERP1WQ6WpjqniBKafTBhsWZInoVvV9B9gLXl2T+jKocQcUu7QA2Y2OnWcWwBPyHnAcQ
	 2RyRBV+pMwl80Y62sy4BWJQPvKmqJfg/nlWVK8os34dypmYwyvMwIlvtHW+AJ5bQ+fYcC
	 qYyMoEbBr0K9NyOssbUfFS41EGyGWeIY18fuVNKmXZv+2zvD4oL+MupqweDIhSI2wNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PrJleK6N;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36458606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 12:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36458606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PrJleK6N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793535523; x=1825071523;
  h=date:from:to:cc:subject:message-id;
  bh=TrHJ6lcqc8F044agPTjIVa11kYDz/QmwFmyxUQ99Gp0=;
  b=PrJleK6NSstCbSJ57a4l+bnM7jyyfD8EWOKy7nyzU3CW5ivpK48a69Ar
   6oeO/d+aSEjTGcuLFe76ZwJiMBGrdFr1zpBQUuYi4YfNA7CHiVPYo+7FJ
   IKKV4Q6V8WO3kXzwOvhlpKEyWnWEq+BhrR+cd86tL07G0Ew8/dtFG4XCP
   zkRY318X8FCUwcuQKP4l0R/HYF6YWZs1CnDZW4BSA3M9OowWjzkuKFYmQ
   fLybE7y9NE2KUSJQTL27Z0pnuI1s4M/qtKZxibZIU2gPn1OMENa7UiZlS
   RipacjfnrWJ3Qd+AVd2oYgcVGMVkt7cpsqfH+il18RkQI8ieXspxIecWJ
   A==;
X-CSE-ConnectionGUID: D+C1jRL2RMe1zD+OKp/yxQ==
X-CSE-MsgGUID: mhaLWkA4Q5W2rZBawXmn/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2242741"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2242741"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 04:18:42 -0800
X-CSE-ConnectionGUID: ybB+8fSESNa3sdkk5VZH7w==
X-CSE-MsgGUID: zbhL8z2jR+G8oTReWpLIKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="6192100"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Nov 2026 04:18:40 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNUWE-00000000dl4-1PFw;
	Sun, 01 Nov 2026 12:18:38 +0000
Date: Sun, 01 Nov 2026 20:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched:urgent] BUILD SUCCESS
 b327e63683a2b894b500027375342c25222b58ef
Message-ID: <20261101201809.TXvcs8g7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/urgent
branch HEAD: b327e63683a2b894b500027375342c25222b58ef  sched/cputime: Don't warn when the tick period starts after idle exit

elapsed time: 262m

configs tested: 42
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                     allnoconfig    gcc-16.2.0
arc                       allnoconfig    gcc-16.2.0
arm                       allnoconfig    clang-17
arm               aspeed_g5_defconfig    gcc-16.2.0
arm                   h3600_defconfig    gcc-16.2.0
arm               omap2plus_defconfig    gcc-16.2.0
arm64                     allnoconfig    gcc-16.2.0
csky                      allnoconfig    gcc-16.2.0
hexagon                   allnoconfig    clang-24
i386                      allnoconfig    gcc-14
loongarch                 allnoconfig    clang-20
m68k                     allmodconfig    gcc-16.2.0
m68k                      allnoconfig    gcc-16.2.0
microblaze                allnoconfig    gcc-16.2.0
mips                      allnoconfig    gcc-16.2.0
nios2                     allnoconfig    gcc-11.5.0
openrisc                  allnoconfig    gcc-16.2.0
openrisc                    defconfig    gcc-16.2.0
parisc                    allnoconfig    gcc-16.2.0
parisc                      defconfig    gcc-16.2.0
powerpc                   allnoconfig    gcc-16.2.0
powerpc             asp8347_defconfig    clang-24
powerpc           motionpro_defconfig    clang-24
riscv                    alldefconfig    gcc-16.2.0
riscv                     allnoconfig    gcc-16.2.0
riscv                       defconfig    clang-24
s390                      allnoconfig    clang-24
s390                        defconfig    clang-18
sh                        allnoconfig    gcc-16.2.0
sh          sh7785lcr_32bit_defconfig    gcc-16.2.0
sparc                     allnoconfig    gcc-16.2.0
sparc                       defconfig    gcc-16.2.0
sparc        randconfig-1000-20261101    gcc-16.2.0
sparc        randconfig-1001-20261101    gcc-8.5.0
sparc               sparc32_defconfig    gcc-16.2.0
sparc64      randconfig-1000-20261101    gcc-9.5.0
um                        allnoconfig    clang-17
um           randconfig-1000-20261101    clang-22
um           randconfig-1001-20261101    clang-18
x86_64                    allnoconfig    clang-22
xtensa                    allnoconfig    gcc-16.2.0
xtensa       randconfig-1001-20261101    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
