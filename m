Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18CF3CFF49
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790548297; cv=none; b=NJhHBICLsLlUFAwdCk8PzY/+kmloC7QQBX9rrB8cFjZpa2p9FBccwsR27KMjhPjACylZ2UB1fOAJOcHveAW46dIkVsCkLPgHZSuqb7nQA+rSm3Btlfy6sZlnryTyrygZcH36g0kYg8UWxyE2lzNx4PdMd5eXHxuusAM6tOkSey8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790548297; c=relaxed/simple;
	bh=JyjP1RlEYeqfWNrq/kM+FXnfh+gDfAiipweM2p6YwRQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AWV2HftT2xC/Kc1zKsGMFB1UB6BrnYaxxQK64fEzMv4ePNlIToQzSodViD0ihGSDU9TjPqaYwbKIrJod+n+osj/9sRUgdMA3EGtPATPbIPp/4ZBZcBPbUKClo4DrSLXOX1bQDm9lIF03dEpSqtPn60qob211G5yioWdZIbvr3S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGV9eJPv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGV9eJPv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790548294; x=1822084294;
  h=date:from:to:cc:subject:message-id;
  bh=JyjP1RlEYeqfWNrq/kM+FXnfh+gDfAiipweM2p6YwRQ=;
  b=AGV9eJPvddpSJ+5ZuYoCi4uroIK1UBwIgpkz0Q/AeIeXWHh9aK/ACLGq
   obtCMK4KoKrnA4RZgVHUjzVElKmpwqjRAZLU5QaVzqYYpOAJn3ROlWE5O
   BOAte7NJfLu65g1Lq5N6DkrUbqJrIzEr49QUINlgCXzOlFYmmwrryowvJ
   w6Vkekffqf1fSt7Z73nEddqKOAnxoRqH4hnU1wnGik8xvUtWoRkv4hVnd
   lyWhA0nyfNV1mfjH79D3MFRVGYiG2jogIsQ09fTAn7NPQ5egxm0ahGiPO
   SrhIAlcoTsoA8Y5RvVWAxsr2dvmo18inIbu+nXSbPDEvgA0g47gDXW1W1
   w==;
X-CSE-ConnectionGUID: P/ekqO4BQv+jPDfVRtAOmQ==
X-CSE-MsgGUID: o/ZaKl29RaaKvBm0TUABvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="102617584"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="102617584"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 15:31:33 -0700
X-CSE-ConnectionGUID: DGFbH5WxQge4Dcs8yw/CAw==
X-CSE-MsgGUID: QEU/wtmNQLeICd0JE1RyDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="271365045"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 27 Sep 2026 15:31:31 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAxP7-000000000iZ-2CCz;
	Sun, 27 Sep 2026 22:31:29 +0000
Date: Mon, 28 Sep 2026 00:30:54 +0200
From: kernel test robot <lkp@intel.com>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Subject: include/linux/fortify-string.h:562:4: error: call to
 '__write_overflow' declared with attribute error: detected write beyond size
 of object (1st parameter)
Message-ID: <202609280038.eX20jfbs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
commit: 294403fde5ba8e972d1bab88ea56be0fa2ff1f3e drm/amdgpu: bounds check VBIOS name extraction
date:   3 months ago
config: powerpc-randconfig-r2300-20260927 (https://download.01.org/0day-ci/archive/20260928/202609280038.eX20jfbs-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609280038.eX20jfbs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 294403fde5ba ("drm/amdgpu: bounds check VBIOS name extraction")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609280038.eX20jfbs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/string.h:386,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/gpu/drm/amd/amdgpu/atom.c:25:
   In function 'fortify_memcpy_chk',
       inlined from 'atom_get_vbios_name' at drivers/gpu/drm/amd/amdgpu/atom.c:1404:2,
       inlined from 'amdgpu_atom_parse' at drivers/gpu/drm/amd/amdgpu/atom.c:1642:2:
>> include/linux/fortify-string.h:562:4: error: call to '__write_overflow' declared with attribute error: detected write beyond size of object (1st parameter)
     562 |    __write_overflow();
         |    ^~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:569:4: warning: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
     569 |    __write_overflow_field(p_size_field, size);
         |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__write_overflow +562 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  513  
f68f2ff91512c1 Kees Cook      2021-04-20  514  /*
f68f2ff91512c1 Kees Cook      2021-04-20  515   * To make sure the compiler can enforce protection against buffer overflows,
f68f2ff91512c1 Kees Cook      2021-04-20  516   * memcpy(), memmove(), and memset() must not be used beyond individual
f68f2ff91512c1 Kees Cook      2021-04-20  517   * struct members. If you need to copy across multiple members, please use
f68f2ff91512c1 Kees Cook      2021-04-20  518   * struct_group() to create a named mirror of an anonymous struct union.
f68f2ff91512c1 Kees Cook      2021-04-20  519   * (e.g. see struct sk_buff.) Read overflow checking is currently only
f68f2ff91512c1 Kees Cook      2021-04-20  520   * done when a write overflow is also present, or when building with W=1.
f68f2ff91512c1 Kees Cook      2021-04-20  521   *
f68f2ff91512c1 Kees Cook      2021-04-20  522   * Mitigation coverage matrix
f68f2ff91512c1 Kees Cook      2021-04-20  523   *					Bounds checking at:
f68f2ff91512c1 Kees Cook      2021-04-20  524   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  525   *					| Compile time  |   Run time    |
f68f2ff91512c1 Kees Cook      2021-04-20  526   * memcpy() argument sizes:		| write | read  | write | read  |
f68f2ff91512c1 Kees Cook      2021-04-20  527   *        dest     source   length      +-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  528   * memcpy(known,   known,   constant)	|   y   |   y   |  n/a  |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  529   * memcpy(known,   unknown, constant)	|   y   |   n   |  n/a  |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  530   * memcpy(known,   known,   dynamic)	|   n   |   n   |   B   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  531   * memcpy(known,   unknown, dynamic)	|   n   |   n   |   B   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  532   * memcpy(unknown, known,   constant)	|   n   |   y   |   V   |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  533   * memcpy(unknown, unknown, constant)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  534   * memcpy(unknown, known,   dynamic)	|   n   |   n   |   V   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  535   * memcpy(unknown, unknown, dynamic)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  536   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  537   *
f68f2ff91512c1 Kees Cook      2021-04-20  538   * y = perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  539   * n = cannot perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  540   * n/a = no run-time bounds checking needed since compile-time deterministic
f68f2ff91512c1 Kees Cook      2021-04-20  541   * B = can perform run-time bounds checking (currently unimplemented)
f68f2ff91512c1 Kees Cook      2021-04-20  542   * V = vulnerable to run-time overflow (will need refactoring to solve)
f68f2ff91512c1 Kees Cook      2021-04-20  543   *
f68f2ff91512c1 Kees Cook      2021-04-20  544   */
54d9469bc515dc Kees Cook      2021-06-24  545  __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_size_t size,
f68f2ff91512c1 Kees Cook      2021-04-20  546  					 const size_t p_size,
f68f2ff91512c1 Kees Cook      2021-04-20  547  					 const size_t q_size,
f68f2ff91512c1 Kees Cook      2021-04-20  548  					 const size_t p_size_field,
f68f2ff91512c1 Kees Cook      2021-04-20  549  					 const size_t q_size_field,
475ddf1fce1ec4 Kees Cook      2023-04-07  550  					 const u8 func)
a28a6e860c6cf2 Francis Laniel 2021-02-25  551  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  552  	if (__builtin_constant_p(size)) {
f68f2ff91512c1 Kees Cook      2021-04-20  553  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  554  		 * Length argument is a constant expression, so we
f68f2ff91512c1 Kees Cook      2021-04-20  555  		 * can perform compile-time bounds checking where
fa35198f39571b Kees Cook      2022-09-19  556  		 * buffer sizes are also known at compile time.
f68f2ff91512c1 Kees Cook      2021-04-20  557  		 */
f68f2ff91512c1 Kees Cook      2021-04-20  558  
f68f2ff91512c1 Kees Cook      2021-04-20  559  		/* Error when size is larger than enclosing struct. */
fa35198f39571b Kees Cook      2022-09-19  560  		if (__compiletime_lessthan(p_size_field, p_size) &&
fa35198f39571b Kees Cook      2022-09-19  561  		    __compiletime_lessthan(p_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25 @562  			__write_overflow();
fa35198f39571b Kees Cook      2022-09-19  563  		if (__compiletime_lessthan(q_size_field, q_size) &&
fa35198f39571b Kees Cook      2022-09-19  564  		    __compiletime_lessthan(q_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  565  			__read_overflow2();
f68f2ff91512c1 Kees Cook      2021-04-20  566  
f68f2ff91512c1 Kees Cook      2021-04-20  567  		/* Warn when write size argument larger than dest field. */
fa35198f39571b Kees Cook      2022-09-19  568  		if (__compiletime_lessthan(p_size_field, size))
f68f2ff91512c1 Kees Cook      2021-04-20  569  			__write_overflow_field(p_size_field, size);
f68f2ff91512c1 Kees Cook      2021-04-20  570  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  571  		 * Warn for source field over-read when building with W=1
f68f2ff91512c1 Kees Cook      2021-04-20  572  		 * or when an over-write happened, so both can be fixed at
f68f2ff91512c1 Kees Cook      2021-04-20  573  		 * the same time.
f68f2ff91512c1 Kees Cook      2021-04-20  574  		 */
fa35198f39571b Kees Cook      2022-09-19  575  		if ((IS_ENABLED(KBUILD_EXTRA_WARN1) ||
fa35198f39571b Kees Cook      2022-09-19  576  		     __compiletime_lessthan(p_size_field, size)) &&
fa35198f39571b Kees Cook      2022-09-19  577  		    __compiletime_lessthan(q_size_field, size))
f68f2ff91512c1 Kees Cook      2021-04-20  578  			__read_overflow2_field(q_size_field, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  579  	}
f68f2ff91512c1 Kees Cook      2021-04-20  580  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  581  	 * At this point, length argument may not be a constant expression,
f68f2ff91512c1 Kees Cook      2021-04-20  582  	 * so run-time bounds checking can be done where buffer sizes are
f68f2ff91512c1 Kees Cook      2021-04-20  583  	 * known. (This is not an "else" because the above checks may only
f68f2ff91512c1 Kees Cook      2021-04-20  584  	 * be compile-time warnings, and we want to still warn for run-time
f68f2ff91512c1 Kees Cook      2021-04-20  585  	 * overflows.)
f68f2ff91512c1 Kees Cook      2021-04-20  586  	 */
f68f2ff91512c1 Kees Cook      2021-04-20  587  
f68f2ff91512c1 Kees Cook      2021-04-20  588  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  589  	 * Always stop accesses beyond the struct that contains the
f68f2ff91512c1 Kees Cook      2021-04-20  590  	 * field, when the buffer's remaining size is known.
311fb40aa0569a Kees Cook      2022-09-02  591  	 * (The SIZE_MAX test is to optimize away checks where the buffer
f68f2ff91512c1 Kees Cook      2021-04-20  592  	 * lengths are unknown.)
f68f2ff91512c1 Kees Cook      2021-04-20  593  	 */
475ddf1fce1ec4 Kees Cook      2023-04-07  594  	if (p_size != SIZE_MAX && p_size < size)
3d965b33e40d97 Kees Cook      2023-04-07  595  		fortify_panic(func, FORTIFY_WRITE, p_size, size, true);
475ddf1fce1ec4 Kees Cook      2023-04-07  596  	else if (q_size != SIZE_MAX && q_size < size)
94fd44648dae2a Kees Cook      2025-07-29  597  		fortify_panic(func, FORTIFY_READ, q_size, size, true);
54d9469bc515dc Kees Cook      2021-06-24  598  
54d9469bc515dc Kees Cook      2021-06-24  599  	/*
54d9469bc515dc Kees Cook      2021-06-24  600  	 * Warn when writing beyond destination field size.
54d9469bc515dc Kees Cook      2021-06-24  601  	 *
2003e483a81cc2 Kees Cook      2024-06-19  602  	 * Note the implementation of __builtin_*object_size() behaves
54d9469bc515dc Kees Cook      2021-06-24  603  	 * like sizeof() when not directly referencing a flexible
54d9469bc515dc Kees Cook      2021-06-24  604  	 * array member, which means there will be many bounds checks
54d9469bc515dc Kees Cook      2021-06-24  605  	 * that will appear at run-time, without a way for them to be
54d9469bc515dc Kees Cook      2021-06-24  606  	 * detected at compile-time (as can be done when the destination
54d9469bc515dc Kees Cook      2021-06-24  607  	 * is specifically the flexible array member).
54d9469bc515dc Kees Cook      2021-06-24  608  	 * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101832
54d9469bc515dc Kees Cook      2021-06-24  609  	 */
2003e483a81cc2 Kees Cook      2024-06-19  610  	if (p_size_field != SIZE_MAX &&
54d9469bc515dc Kees Cook      2021-06-24  611  	    p_size != p_size_field && p_size_field < size)
54d9469bc515dc Kees Cook      2021-06-24  612  		return true;
54d9469bc515dc Kees Cook      2021-06-24  613  
54d9469bc515dc Kees Cook      2021-06-24  614  	return false;
a28a6e860c6cf2 Francis Laniel 2021-02-25  615  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  616  

:::::: The code at line 562 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
