Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CDE4D37B7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552555; cv=none; b=bqK5cTgAdM64OrqNp7Gm8DzBIPKSF46kETK+cW0kzLYfmGXzSLPUjxj4xRqMJ8zZBIgWkGWQQQJGn/6OgqxhzJJmFPqTPmGjPGSv7m342rU4lRAW+JUHBvrdG1DbVOZDaq/spbe7VrGf2vRlItk1qP9mfPqLuT8TlRKin5MCLDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552555; c=relaxed/simple;
	bh=wcKvnbLEjalGDR8vRcoPhp5QGrg7hZGrKtIVXmAweic=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H2DMkcWpBLBIvV6Tv76qUWynrMxAx3cfVyN7GEfAcOjfKYbIkuyY0bv2+/GXHtT+KlH/rF4WUigrG4WfEA2lUDfbkch71FYe0seJoeWNpVgTSLqkD7WQUkzEjKEwgO67rwiIjVXKXqcZ3t4Euq9QcftgSPP+fuRIlljZV0bUJH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFFSKiMn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFFSKiMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791552553; x=1823088553;
  h=date:from:to:cc:subject:message-id;
  bh=wcKvnbLEjalGDR8vRcoPhp5QGrg7hZGrKtIVXmAweic=;
  b=dFFSKiMnXMuuAA6TRVvLj3jwqTEYXrjcaODYvxre7Ce0FGHZm0czqlx9
   yxT9uUZDfWoGukyB02tEzWJ3khh9wggg2GM5ByttINxn9BLHZzIOjVGRk
   TzcPBISa1dQPLtsImRlPvWvEmgFXSFaiRC3vAIIgFuKkREh4IufwwebVk
   RvV1Tvjc5kKvfOVjCzMo7VJX5mlAnLquAbCX6iUNdQAKnOFT3gXhwcIIV
   xBiVDB4q6rQvKqHAQETxyXNUzzey62PFRThb7rwKuuXBWTVXMPOiiEA9j
   g952E0Lm24O15hx6eubygx3WvOSrvhezQig1V2DfYl2T0lD7Xvoi3eryS
   g==;
X-CSE-ConnectionGUID: sApXIxdnT5iAJzi4KA1sQQ==
X-CSE-MsgGUID: Jjj46M9jRn6DN6Z5pfPqKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="256881"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="256881"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 06:29:12 -0700
X-CSE-ConnectionGUID: x9ylyGnJSsqFDsNHbz8p+A==
X-CSE-MsgGUID: me7kLQl2R7KrFDxs9fquEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="269632"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 09 Oct 2026 06:29:11 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFAeq-0000000075L-0BDE;
	Fri, 09 Oct 2026 13:29:08 +0000
Date: Fri, 09 Oct 2026 15:28:31 +0200
From: kernel test robot <lkp@intel.com>
To: David Yang <mmyangfl@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Subject: include/linux/compiler_types.h:631:38: error: call to
 '__compiletime_assert_344' declared with attribute error: BUILD_BUG_ON
 failed: len % sizeof(u64_stats_t)
Message-ID: <202610091513.YHtzM9fw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi David,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af32da41b0327b9c6a37856ba82b6760d6c8d10e
commit: 35710f0db8011e7ebbfb5b929a0575c3a09b761d macsec: fix memcpy with u64_stats
date:   9 months ago
config: parisc-randconfig-r2309-20261009 (https://download.01.org/0day-ci/archive/20261009/202610091513.YHtzM9fw-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091513.YHtzM9fw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35710f0db801 ("macsec: fix memcpy with u64_stats")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091513.YHtzM9fw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   include/linux/u64_stats_sync.h: In function 'u64_stats_copy.part.0':
>> include/linux/compiler_types.h:631:38: error: call to '__compiletime_assert_344' declared with attribute error: BUILD_BUG_ON failed: len % sizeof(u64_stats_t)
     631 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:612:4: note: in definition of macro '__compiletime_assert'
     612 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:631:2: note: in expansion of macro '_compiletime_assert'
     631 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   include/linux/u64_stats_sync.h:134:2: note: in expansion of macro 'BUILD_BUG_ON'
     134 |  BUILD_BUG_ON(len % sizeof(u64_stats_t));
         |  ^~~~~~~~~~~~


vim +/__compiletime_assert_344 +631 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  617  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  618  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  619  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  620  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  621  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  622   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  623   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  624   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  625   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  626   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  627   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  628   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  629   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  630  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @631  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  632  

:::::: The code at line 631 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
