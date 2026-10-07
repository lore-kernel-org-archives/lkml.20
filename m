Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3A54825C1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791399133; cv=none; b=AOHQ38IKX6hvvzfkVf0wk3Yo0EaHUePuK7SsE/lFfRaXepDe+t/bjwFMp5ye78SXmtZvLB7uvesrLZJ2occIWenV8KOPvg7SZMmakCq5B/iQKEcDj0Cm4l4JHo5T90jOtCj1W0if1N7VBaPEqZXJLNiIk9dDZj3IjJ/6ljBvg/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791399133; c=relaxed/simple;
	bh=spnrb+A0VdKm9mACTqRVkbP4SHk/rOIvSdkezBuhXHw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V6Uqf2mP+MTn+G1Ny4xYNEZ6mJRNyKKuP6xqglVGDjUourVAd0IM0vgP5Is91qNAaDr1CmcPSFYosI5RFsp7LZ2CJ9RzmjQM14rO96fmYsKOb+OunQAhqRSeQZhtcqfypq9SUEiiwNgBCMuGMg6yrXGRKzeU5Os3LYQl5e1Di60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/vC+mXh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/vC+mXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791399132; x=1822935132;
  h=date:from:to:cc:subject:message-id;
  bh=spnrb+A0VdKm9mACTqRVkbP4SHk/rOIvSdkezBuhXHw=;
  b=l/vC+mXhq1Z2MAH3qhANffitDVgRspgU+oBY+uQOWQRHtkbeRjTNX8mF
   nPdtHb3ByGyH8qwFbelGPASatzUM6cxmxCSjP0tSMe+Nyq5WcqQpXi7sw
   5K3Ddxx1G1aPyUaJCLCCY2ZS3mda0IuGk+Jd7VpsFKx6hIHu7sfEKy/d9
   53ivgNWev+6hqgeL6se2XisN6YM/MjITeX9cgPMCimSfq+nM828537n/n
   /eQ866EvFtcznrOap5PU395+1LBh3JZm2vOLaQqtsZV0VC5w99JtbwAer
   Q4n/QtT+4Z5ZG8ZZDOmAPFje03mEB9+m9HPurT1ZN7+L8JPQSEi4k6ktj
   Q==;
X-CSE-ConnectionGUID: Qz/wC08vSDKYESV2IJMzhA==
X-CSE-MsgGUID: ao8NWFymSdaTbJPP1Ad8Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="54771"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="54771"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 11:52:12 -0700
X-CSE-ConnectionGUID: +ZXfQ7a9Tm+QQrtT4P4S3A==
X-CSE-MsgGUID: 3s1UuilVT9GoWjMFcgH69A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="1604942"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 07 Oct 2026 11:52:11 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEWkK-000000003pp-0qYO;
	Wed, 07 Oct 2026 18:52:08 +0000
Date: Wed, 07 Oct 2026 20:51:54 +0200
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/compiler_types.h:572:38: error: call to
 '__compiletime_assert_474' declared with attribute error: FIELD_PREP: value
 too large for the field
Message-ID: <202610072028.3zhwo1fX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7b63ef2d55f24519e7e9e5f4d15dbea03f126e40
commit: 32913fe7f71e72fb49033df35ec6388ff7b170ff mips: Add __attribute_const__ to ffs()-family implementations
date:   1 year, 1 month ago
config: mips-randconfig-r2105-20261007 (https://download.01.org/0day-ci/archive/20261007/202610072028.3zhwo1fX-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072028.3zhwo1fX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 32913fe7f71e ("mips: Add __attribute_const__ to ffs()-family implementations")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610072028.3zhwo1fX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/iio/adc/ti_am335x_adc.c: In function 'tiadc_step_config':
>> include/linux/compiler_types.h:572:38: error: call to '__compiletime_assert_474' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:553:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:572:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
      ^~~~~~~~~~~~~~~~
   include/linux/mfd/ti_am335x_tscadc.h:58:29: note: in expansion of macro 'FIELD_PREP'
    #define STEPCONFIG_AVG(val) FIELD_PREP(GENMASK(4, 2), (val))
                                ^~~~~~~~~~
   drivers/iio/adc/ti_am335x_adc.c:127:17: note: in expansion of macro 'STEPCONFIG_AVG'
       stepconfig = STEPCONFIG_AVG(ffs(adc_dev->step_avg[i]) - 1) |
                    ^~~~~~~~~~~~~~
--
   In file included from <command-line>:
   iio/adc/ti_am335x_adc.c: In function 'tiadc_step_config':
>> include/linux/compiler_types.h:572:38: error: call to '__compiletime_assert_474' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:553:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:572:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
      ^~~~~~~~~~~~~~~~
   include/linux/mfd/ti_am335x_tscadc.h:58:29: note: in expansion of macro 'FIELD_PREP'
    #define STEPCONFIG_AVG(val) FIELD_PREP(GENMASK(4, 2), (val))
                                ^~~~~~~~~~
   iio/adc/ti_am335x_adc.c:127:17: note: in expansion of macro 'STEPCONFIG_AVG'
       stepconfig = STEPCONFIG_AVG(ffs(adc_dev->step_avg[i]) - 1) |
                    ^~~~~~~~~~~~~~


vim +/__compiletime_assert_474 +572 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  568   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  570   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  571  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @572  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  573  

:::::: The code at line 572 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
