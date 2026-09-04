Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AD1513540
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552184; cv=none; b=jUnt7wkrzB1suhXxopW/zxO9yCr+jrbcxvjgGeGbhElQLk7dKQZCjhaPSmr3UzafOjfewJf+c2AvxSi7sd7CfqysWUbzyW7tVO2LjKZpxZchqNJz7Adc9hppAk+z4Qxcbj291cxRaSA0zf7FxTWgUtGoM+cHgFUxB0CLx1Ejdxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552184; c=relaxed/simple;
	bh=MXIMDIHM4E/siA6UtK6s0btMUfG+x50O1cxYTKcGE/4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=da72iFpKZ5/XgVhddh52V7OX4ugzEB57FejW3OqIy3vWTGV/SCEsjADUh++3Upj6i1lV0T1UGIAB9lMSpeoFOBnzEgBHfNHAUbcbQVbEDnDJrBmwnAsnjyRWP0bjaxG6BbkdNv4qDWnxwkM2gkBTJhhXOSF9plnYmHSpMPpdyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=em8HpHcN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="em8HpHcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788552183; x=1820088183;
  h=date:from:to:cc:subject:message-id;
  bh=MXIMDIHM4E/siA6UtK6s0btMUfG+x50O1cxYTKcGE/4=;
  b=em8HpHcN0X/pS3Ntbm4tVqG+0eUsXmDF0qBO99I5BvfuXLZotwNYfbX0
   yZ6vNzO7juUxR92E07NGvjndAVWDVg6cmtPFEYhEemo1sg3WBsXdSyTaq
   vc7uSQTkR7Qy4hPKvObZ/f730zJqTsQ9Jq3N6OTmSDAM/lik4YFI4rIWZ
   Mv5FEEXklHFzYK4c/LUYouaDbtRLSFsaC8//Zc9lvjA/ke4Bayma8YggB
   zkX/Dm116pYCRtVpbRkYXDJjpSjuGOIkImRj5drbY/IK/+K6UWuGbm+nI
   1ZnJsmqnvF2uJED9BPYWk4/9tCPejQHKuU4h0PtuT15/AQFmuXux97+j9
   Q==;
X-CSE-ConnectionGUID: XuLiD/0hRlSFPInIMHmE6A==
X-CSE-MsgGUID: JsYd3IqZS+aSG3fswTaxRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88908130"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88908130"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:02:59 -0700
X-CSE-ConnectionGUID: osS0syGrRu+rTeKidapcjw==
X-CSE-MsgGUID: rWrvXGkFROWYI1TB8U00Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="274283640"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Sep 2026 13:02:58 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2a7j-00000000A86-1CqV;
	Fri, 04 Sep 2026 20:02:55 +0000
Date: Sat, 05 Sep 2026 04:02:03 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:misc] BUILD SUCCESS
 4a673a0026b95030ee727f1f8578c46a42107011
Message-ID: <202609050400.7gLfRI6x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/misc
branch HEAD: 4a673a0026b95030ee727f1f8578c46a42107011  x86/itmt: Don't make ITMT enablement depend on debugfs

elapsed time: 2415m

configs tested: 36
configs skipped: 42

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arm           allnoconfig    gcc-16.1.0
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2         allnoconfig    clang-24
openrisc      allnoconfig    clang-24
parisc        allnoconfig    clang-24
powerpc       allnoconfig    clang-24
riscv         allnoconfig    clang-24
s390          allnoconfig    clang-24
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sparc         allnoconfig    clang-24
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
