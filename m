Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA752364E9E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 22:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791413987; cv=none; b=dW8f/S2bO5ZFIfI2UEi51L6a4YHYu+mGOpfV5ZslgScKR5BYlA2/7jkhHPi7hftwGCakOp5amJ31zzvnjvy+3hsjQISNv8vItGe7QIHoNc9Q5UjYadVaVG+Iyh+DjmlPCJdZjrKjHG8UPIVPmpEXyDo3iYEBGACzCQHOsG4M4Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791413987; c=relaxed/simple;
	bh=KcgdW8Ymou+cnYDJZ8kTaOBfDPR7jywHPu5lecoNAiI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nACG1gPFb1rJSL2NAsT5I5j0E5UADpXz6icY8Qjb8aUHq1FPE1jEzCf7tY+CS2v5QyNkhFNFPdqDzn2CCaTOgvjMXnNhid3PZ+52OmA+CJVx9Y24rH/IzxnEUN1XrFHxcofHKH7fK4FN0y4hCHXN0dEQ7+7oLUrLomyilRfBA4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9+CjQhg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9+CjQhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791413984; x=1822949984;
  h=date:from:to:cc:subject:message-id;
  bh=KcgdW8Ymou+cnYDJZ8kTaOBfDPR7jywHPu5lecoNAiI=;
  b=P9+CjQhg43UOl3d3OP7ar0tmhHyyUgYy74AscYZ5HJZN5Ky5SFFzwPk7
   3XrUG5ri4bbRCsJjKY+HqNI3X+as7HM1ajEsJCPMJvAoaDu462uoqL6IW
   LYJkD/CA/2JkjrBClh1ooEx8kPArxqBcq/jA3ck72nCfVmcp+6T9W9Lrc
   Vq0ympfw1yHGDP0rWfM09vPfprQJ00guqFZc6LbFIS0T1wo8g4IF6OkOi
   +sqSUOhZ4P1EWk8m0WB3F6yoEnPM/O3G/z4vklbeLs9zd88+ejgN8vMye
   hNg64R7IWm5qgoqlHyjEscMTRPU0l0WXUMdLc3jtVu57VJ1n8kdevKnDu
   Q==;
X-CSE-ConnectionGUID: UgY5EfhTQVqpXz6JwLY8WQ==
X-CSE-MsgGUID: k6rnojg5Q9q7VEnBMiTf6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="297497"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="297497"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 15:59:43 -0700
X-CSE-ConnectionGUID: i7TyAtWVTS6k8jdjKm/p4Q==
X-CSE-MsgGUID: M13/o/euQh+TK6/UrC6d0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="1667944"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 07 Oct 2026 15:59:41 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEabr-000000004Eb-2U7o;
	Wed, 07 Oct 2026 22:59:39 +0000
Date: Thu, 08 Oct 2026 00:59:25 +0200
From: kernel test robot <lkp@intel.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: include/linux/compiler_types.h:572:45: error: call to
 '__compiletime_assert_431' declared with attribute error: BUILD_BUG_ON
 failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)
Message-ID: <202610080034.W7eXW61r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Miaohe,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7b63ef2d55f24519e7e9e5f4d15dbea03f126e40
commit: c090868f59ce888db838cf543d18f731d13ed498 Revert "hugetlb: make hugetlb depends on SYSFS or SYSCTL"
date:   1 year, 1 month ago
config: mips-randconfig-r2301-20261007 (https://download.01.org/0day-ci/archive/20261008/202610080034.W7eXW61r-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080034.W7eXW61r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c090868f59ce ("Revert "hugetlb: make hugetlb depends on SYSFS or SYSCTL"")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080034.W7eXW61r-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/mips/mm/init.c: In function 'arch_mm_preinit':
>> include/linux/compiler_types.h:572:45: error: call to '__compiletime_assert_431' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:553:25: note: in definition of macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/mips/mm/init.c:434:9: note: in expansion of macro 'BUILD_BUG_ON'
     434 |         BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_431 +572 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  558  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  559  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  560  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  561  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  562  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  563   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  564   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  565   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  566   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  567   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  568   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  569   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  570   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  571  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @572  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  573  

:::::: The code at line 572 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
