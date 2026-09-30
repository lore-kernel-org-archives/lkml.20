Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD84372ECF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790738663; cv=none; b=Fyk27NJDNMZCYCU0eFlw849hAuBybsVHKIxc8B/w6LMLIHSHMu9KNeVZeyWT1SzUdua9Ak+Dv9cAMBkgO40OMhoCvh5pvPok6p9rWD+qEWs+C/eWaeeSdal+d3ECYQSv0v6Q2vVsWfNxLF12f2lt+Y9xd1CRhqNM9oKOt8sO+b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790738663; c=relaxed/simple;
	bh=n1DADKhe9xRV3sNCWeM67fzx17yWLTOn9FAz5GnZbEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JGYK4lChjgvWvxwwIYjFF58PgBbrhsRnScN7eBZmkiUPumPSVBTFvCCM1yPU4O47w/acYeIvCIaD1g7YGVrTPqjjZma8GZA6GqIpbCs0fBskCbGY3JZfsrTRWt6ftWl1/R7DNDvVILuUUO8RNdKcq4YFjqeexZBBkk1UmDL8w30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKbR2kIw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKbR2kIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790738661; x=1822274661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n1DADKhe9xRV3sNCWeM67fzx17yWLTOn9FAz5GnZbEw=;
  b=dKbR2kIw1OlZw9VAA8JRMEBwN2PeZo5nj6hehc47jmuAPkvQmpAd8lmt
   0nnZMFLHBr7xlPuPE072Nh7XuaQWYyb3BUskU99C0UxEkI1HVfnoKV4aZ
   fpnmUqqKLvYnJDiZxyyrZxuiQtFXSK1RjEGXni9/UIg/ylkED69tfzMDr
   IAMuTdXNCThzOw0r+Nt06NDJLLQxki82hiR5hEay6eEDodMTcx15N58/0
   pYlrtQotl2OmGWugP91qAdBLO4QJN/JW1s58H9VB75YCXE3hcUjqOt6ZW
   2wQE8KRX8zI1VeKi/O1aABDSayb51NEwe1jX6QIaDGUKU8Z4NTOHUL8uY
   A==;
X-CSE-ConnectionGUID: taY5MTfjRO+aLsltmjRROw==
X-CSE-MsgGUID: hj9sXzo8SXCrkBpQXcTUIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95280787"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="95280787"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 20:24:20 -0700
X-CSE-ConnectionGUID: VnyXi1hdT7OT0v18A97Vqg==
X-CSE-MsgGUID: kHYUENvuTiKPKYkUD4bebg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="275593739"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 29 Sep 2026 20:24:19 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBkvW-000000001it-1GQS;
	Wed, 30 Sep 2026 03:24:14 +0000
Date: Wed, 30 Sep 2026 05:23:21 +0200
From: kernel test robot <lkp@intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: [tip:timers/vdso 4/4] include/linux/compiler_types.h:702:38:
 error: call to '__compiletime_assert_5' declared with attribute error:
 BUILD_BUG_ON failed: clock >= BITS_PER_TYPE(msk)
Message-ID: <202609300510.Ej5t8KO8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
head:   ca46a07c4b68246c4e400ce3649ab7228a878d8f
commit: ca46a07c4b68246c4e400ce3649ab7228a878d8f [4/4] vdso/gettimeofday: Assert that the clockid fits into the u32 bitmask
config: sparc64-randconfig-2001-20260930 (https://download.01.org/0day-ci/archive/20260930/202609300510.Ej5t8KO8-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300510.Ej5t8KO8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300510.Ej5t8KO8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c: In function '__cvdso_clock_gettime_common':
   arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:288:24: error: implicit declaration of function 'BITS_PER_TYPE'; did you mean 'BITS_PER_LONG'? [-Werror=implicit-function-declaration]
     288 |  BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
         |                        ^~~~~~~~~~~~~
   include/linux/compiler_types.h:682:9: note: in definition of macro '__compiletime_assert'
     682 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     702 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:288:2: note: in expansion of macro 'BUILD_BUG_ON'
     288 |  BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
         |  ^~~~~~~~~~~~
   In function '__cvdso_clock_gettime_common',
       inlined from '__vdso_clock_gettime64' at arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:310:7:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_5' declared with attribute error: BUILD_BUG_ON failed: clock >= BITS_PER_TYPE(msk)
     702 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
     683 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     702 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:288:2: note: in expansion of macro 'BUILD_BUG_ON'
     288 |  BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
         |  ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/__compiletime_assert_5 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
