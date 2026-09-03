Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342AD485CCA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438524; cv=none; b=ZDSifCGOLn0xaf3LArVLB7MzASR4342cUlfFUkZZ50VtsSsrflb1fjpSrnwx9g3JfzWICKyJL946MNrN0niZ2WF3H3VNZ3txGg4xg80xwSgTJgjaZCSJXgQYjoIXMh26p4E6QXwzb3Le9uB3dNuK/yaN2x8u/1fniUYJ58l7KDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438524; c=relaxed/simple;
	bh=T8LGIybHLxYOmOJZWdqzpCtnroH4lxedDR+iPt7QbMc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=foImCs6BH2YxH40V0WyOgThFyPdVW9H13qt6M4B+TOWOZlmalEss1wfqJZFK7Sqg4jMdCaufPTHMWVO4G+OYlj1JZFQpZy4yvfN0AgeS2vhbvOC90h/d1MWd6YvW7KdYGjzxbsHsyvibIirlbUFGz9QhgsgLvrlSOxO8POU/3r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOJvEqQ0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOJvEqQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788438522; x=1819974522;
  h=date:from:to:cc:subject:message-id;
  bh=T8LGIybHLxYOmOJZWdqzpCtnroH4lxedDR+iPt7QbMc=;
  b=JOJvEqQ0TkK3vnF04CoDcP/W2GfV6SEizUWXzwUzZUYETkAuUIIV44ot
   Pyy/5jHfnIBvl4nqBPWa0yVcL4XONOb3mwSUj+2KRIkF+QZ6tmOCgDg3+
   bSEyqpEIRsjVSW33yGRbCxd8ANZQ562fwqjuLwGCS3S8pb2KHwEDl1ijV
   OhrIP9qWDY2jPfH+bQrBPabZ6ECM8LVBGf5Himgy5XdvfpYg63n98lXZF
   P18LoAFAg5qrfJUdkzPqGMA7E1vZjK4YuoqdutBBxR/IRfMbQlpA7Z2m/
   x1QmDyUAqQ+vuQRaHl+OH5FB7ZhVZcabDhu1denDVKVwINtXR5VH0g7zH
   g==;
X-CSE-ConnectionGUID: 8gQd21ZJRlq4wJemtwIprw==
X-CSE-MsgGUID: 8Ge2CHlcRyqzcYEEvkfDZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88941426"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88941426"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 05:28:41 -0700
X-CSE-ConnectionGUID: 60RNIVXRQgSomjSEP0jhrg==
X-CSE-MsgGUID: DB7VDl6xSrWXHLbFEP2Flw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="265365691"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Sep 2026 05:28:39 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x26YW-000000004oE-4BPy;
	Thu, 03 Sep 2026 12:28:36 +0000
Date: Thu, 03 Sep 2026 20:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Hao-Yu Yang" <naup96721@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Eric Dumazet <edumazet@google.com>
Subject: mm/mempolicy.c:488:6-25: WARNING: atomic_dec_and_test
 variation before object free at line 496.
Message-ID: <202609032025.W5uNU0A3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   940de590b839f71d6dc846160534bf202401b8b7
commit: 190a8c48ff623c3d67cb295b4536a660db2012aa futex: Fix UaF between futex_key_to_node_opt() and vma_replace_policy()
date:   5 months ago
config: s390-randconfig-r064-20260903 (https://download.01.org/0day-ci/archive/20260903/202609032025.W5uNU0A3-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 190a8c48ff62 ("futex: Fix UaF between futex_key_to_node_opt() and vma_replace_policy()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609032025.W5uNU0A3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/mempolicy.c:488:6-25: WARNING: atomic_dec_and_test variation before object free at line 496.

vim +488 mm/mempolicy.c

^1da177e4c3f415 Linus Torvalds   2005-04-16  484  
52cd3b074050dd6 Lee Schermerhorn 2008-04-28  485  /* Slow path of a mpol destructor. */
c36f6e6dff4d32e Hugh Dickins     2023-10-03  486  void __mpol_put(struct mempolicy *pol)
52cd3b074050dd6 Lee Schermerhorn 2008-04-28  487  {
c36f6e6dff4d32e Hugh Dickins     2023-10-03 @488  	if (!atomic_dec_and_test(&pol->refcnt))
52cd3b074050dd6 Lee Schermerhorn 2008-04-28  489  		return;
190a8c48ff623c3 Hao-Yu Yang      2026-03-13  490  	/*
190a8c48ff623c3 Hao-Yu Yang      2026-03-13  491  	 * Required to allow mmap_lock_speculative*() access, see for example
190a8c48ff623c3 Hao-Yu Yang      2026-03-13  492  	 * futex_key_to_node_opt(). All accesses are serialized by mmap_lock,
190a8c48ff623c3 Hao-Yu Yang      2026-03-13  493  	 * however the speculative lock section unbound by the normal lock
190a8c48ff623c3 Hao-Yu Yang      2026-03-13  494  	 * boundaries, requiring RCU freeing.
190a8c48ff623c3 Hao-Yu Yang      2026-03-13  495  	 */
190a8c48ff623c3 Hao-Yu Yang      2026-03-13 @496  	kfree_rcu(pol, rcu);
52cd3b074050dd6 Lee Schermerhorn 2008-04-28  497  }
f634f10809ec3d5 Shivank Garg     2025-08-27  498  EXPORT_SYMBOL_FOR_MODULES(__mpol_put, "kvm");
52cd3b074050dd6 Lee Schermerhorn 2008-04-28  499  

:::::: The code at line 488 was first introduced by commit
:::::: c36f6e6dff4d32ec8b6da8f553933727a57a7a4a mempolicy trivia: slightly more consistent naming

:::::: TO: Hugh Dickins <hughd@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
