Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C88F4195C8
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791309381; cv=none; b=vEDyFzYTd3vAsLd+0ud9+Vy7QZ99g9NYbKyq+MBUGd1Vg80tOibuwU2GKhIHvr8HRFMJFBeOsFM4hcLFCcuDivM2WTuse24eAjJ/TPfYJemYV2FME1wcAS2qpB7U36TSV0oQ0a754atKzNkSddE2a8lsnUVS5mDOAi/J1hxPmq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791309381; c=relaxed/simple;
	bh=llVmwYCThXahMFx26Opanh1BZuCYg3gzsCzBC00ZxGw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ufig/035KSGOgpOHudAb9VNMvAW9mnXgv9hCmMBq7jiizc/dlrQEUfuDA2FMsYphR59FinBXu08djjeU3f+WTEjFTAg4qyGbSwAxIeKmuz+uxLRxRJQTwLe9brK3bWDb6LYkYI4h5nDeVYTc0BQBQyZBF0gU+sAv2tuNhYinnck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIdx0N8v; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIdx0N8v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791309379; x=1822845379;
  h=date:from:to:cc:subject:message-id;
  bh=llVmwYCThXahMFx26Opanh1BZuCYg3gzsCzBC00ZxGw=;
  b=cIdx0N8vtwWUnSfrLDX1jSQlCEHHCKbYwJGg9f25ntQUNaPHahesdzW5
   VshIpI1iekJUq4JacHxYZ6a+yurNU1AUg29hBXNjaE7CFn6uXgCyJ8tKx
   SoAqO39FYnYa0ZRSryMl+OC+8aRzj0MUonYWbqXDaESnSYqSqxZFwdfdk
   ikYJ6AGoCeyho3T9Bfe9ilpIkT8FjDtKCc7Mdv+fzw8yI29YJuio51gt5
   yPhX0WDmJKMq70QOMsdgJURzRkDer8A7tLwMwIwJ/RgjVifP9e3JCOXov
   BzAAxLf0U1sGYm6y5rSOuCgiYHrI+SKfklytEBAEZHl5zJHHF8JJjxqub
   w==;
X-CSE-ConnectionGUID: DPQ41xuBS4inN3uUcB6wMQ==
X-CSE-MsgGUID: kpLt6kt0QwCe+M5xs8jgKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="48610"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="48610"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 10:56:18 -0700
X-CSE-ConnectionGUID: lfjynqdaQH+PT4fiPxkdpw==
X-CSE-MsgGUID: m9+7QKZ2RNKFFtcUvsNYkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1238758"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 06 Oct 2026 10:56:17 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE9Og-000000001aj-2zR9;
	Tue, 06 Oct 2026 17:56:14 +0000
Date: Tue, 06 Oct 2026 19:55:49 +0200
From: kernel test robot <lkp@intel.com>
To: "Hao-Yu Yang" <naup96721@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Eric Dumazet <edumazet@google.com>
Subject: mm/mempolicy.c:488:6-25: WARNING: atomic_dec_and_test
 variation before object free at line 496.
Message-ID: <202610061946.Bx22ZFrw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69f80fef3153299d9c72c53d1d71eef6354b6926
commit: 190a8c48ff623c3d67cb295b4536a660db2012aa futex: Fix UaF between futex_key_to_node_opt() and vma_replace_policy()
date:   6 months ago
config: x86_64-randconfig-2100-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061946.Bx22ZFrw-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 190a8c48ff62 ("futex: Fix UaF between futex_key_to_node_opt() and vma_replace_policy()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061946.Bx22ZFrw-lkp@intel.com/

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
