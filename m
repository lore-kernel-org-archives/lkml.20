Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD804D2EC6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548884; cv=none; b=A9cnnlgez+FiY2Ip2uSPiCylswDBvmastDQWZpaG3j5YVR9DGeldixWQjcaS0wF76l6IiOd22O+jVK2IqpjybdYFdwOCiPELXvL2h5ZCUjtOgxpL33zPL48OkS/Gkyge38apcWfcD+7IjHDOxN2kHT7ZFDJRvqQ0+ZWae4ogIvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548884; c=relaxed/simple;
	bh=6zXT/mNtIqTiOKRUcmo9bYKRehgXBjTqywsbso1n6eo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VJoOwx0l3MInNII6KroBFYVRnPAe6aY/YpWhIn87D8MZW5QTjb5odgZj2tICqw/XJtjn+B4aGKfmG3UxOR9z0Y9fDZFd4vasl4XchuPTswF23rR4zqZB67xDs/TzGZL3UsW6duQEkmDrvJLJj55mEAZpX3vTdordUcJfV0qFS+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URjhoLnA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URjhoLnA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791548878; x=1823084878;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6zXT/mNtIqTiOKRUcmo9bYKRehgXBjTqywsbso1n6eo=;
  b=URjhoLnAnpbtRshcBN1WSxTiGUJu8cyW6whcAY1zujM5JmEhRq5VfGGm
   Q4jRIN/ZUPftRAFR8O0kVj8oloekCV3jL09W1f2h0kL0TFzbi0hJNsh7e
   gDwxneg5pXGslhIuzz7ojjELvg/YuAh6Jg5NWfTUO3qolRxbts3JQMi3v
   AodsJOlC4X4XsP9YNbrSFE4fbSQ9oRIscZZTYeoZT06O8ak72pY93TgDt
   +i9zc0zwWl7uePvyNWH13oaKziit0XUIOohRlQtVzzN1ieXO/bMxdxFFL
   R9XTexID6aQBZY5T+Ahq2g2HN8nV44ExUrgiTUgyo+VwxdvYBTOw+tq7n
   Q==;
X-CSE-ConnectionGUID: e6UA1S7hQ6Sf3IW6t1xngA==
X-CSE-MsgGUID: Oli7zB90SE6Hrx3FNkwZ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="346017"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="346017"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:27:57 -0700
X-CSE-ConnectionGUID: fmdXjdxbSk6hyyovJrKmyg==
X-CSE-MsgGUID: x8ZSZOTvSlmvSx/YMCgq6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="290637"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 09 Oct 2026 05:27:54 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF9hY-0000000071r-30q6;
	Fri, 09 Oct 2026 12:27:52 +0000
Date: Fri, 09 Oct 2026 14:27:32 +0200
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>
Subject: arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202610091444.LHHlny4D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   af32da41b0327b9c6a37856ba82b6760d6c8d10e
commit: 818d78ba1b3f88d2bfee249f25020211488a26c3 riscv: signal: abstract he=
ader saving for setup_sigcontext
date:   10 months ago
config: riscv-randconfig-r2306-20261009 (https://download.01.org/0day-ci/ar=
chive/20261009/202610091444.LHHlny4D-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261009/202610091444.LHHlny4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 818d78ba1b3f ("riscv: signal: abstract header saving for setup_sig=
context")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091444.LHHlny4D-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected void [noderef] __user *d=
atap @@     got void * @@
   arch/riscv/kernel/signal.c:133:15: sparse:     expected void [noderef] _=
_user *datap
   arch/riscv/kernel/signal.c:133:15: sparse:     got void *
>> arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected void [noderef] __user *d=
atap @@     got void * @@
   arch/riscv/kernel/signal.c:133:15: sparse:     expected void [noderef] _=
_user *datap
   arch/riscv/kernel/signal.c:133:15: sparse:     got void *
>> arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected void [noderef] __user *d=
atap @@     got void * @@
   arch/riscv/kernel/signal.c:133:15: sparse:     expected void [noderef] _=
_user *datap
   arch/riscv/kernel/signal.c:133:15: sparse:     got void *
>> arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected void [noderef] __user *d=
atap @@     got void * @@
   arch/riscv/kernel/signal.c:133:15: sparse:     expected void [noderef] _=
_user *datap
   arch/riscv/kernel/signal.c:133:15: sparse:     got void *
   arch/riscv/kernel/signal.c:148:22: sparse: sparse: symbol 'arch_ext_list=
' was not declared. Should it be static?
   arch/riscv/kernel/signal.c:155:14: sparse: sparse: symbol 'nr_arch_exts'=
 was not declared. Should it be static?
   arch/riscv/kernel/signal.c:300:39: sparse: sparse: cast removes address =
space '__user' of expression
   arch/riscv/kernel/signal.c:300:36: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct __riscv_ctx_hdr [=
noderef] __user *sc_ext_ptr @@     got void * @@
   arch/riscv/kernel/signal.c:300:36: sparse:     expected struct __riscv_c=
tx_hdr [noderef] __user *sc_ext_ptr
   arch/riscv/kernel/signal.c:300:36: sparse:     got void *

vim +133 arch/riscv/kernel/signal.c

8ee0b41898fa26f Greentime Hu 2023-06-05  107 =20
8ee0b41898fa26f Greentime Hu 2023-06-05  108  /*
8ee0b41898fa26f Greentime Hu 2023-06-05  109   * Restore Vector extension c=
ontext from the user's signal frame. This function
8ee0b41898fa26f Greentime Hu 2023-06-05  110   * assumes a valid extension =
header. So magic and size checking must be done by
8ee0b41898fa26f Greentime Hu 2023-06-05  111   * the caller.
8ee0b41898fa26f Greentime Hu 2023-06-05  112   */
8ee0b41898fa26f Greentime Hu 2023-06-05  113  static long __restore_v_state=
(struct pt_regs *regs, void __user *sc_vec)
8ee0b41898fa26f Greentime Hu 2023-06-05  114  {
8ee0b41898fa26f Greentime Hu 2023-06-05  115  	long err;
8ee0b41898fa26f Greentime Hu 2023-06-05  116  	struct __sc_riscv_v_state __=
user *state =3D sc_vec;
8ee0b41898fa26f Greentime Hu 2023-06-05  117  	void __user *datap;
8ee0b41898fa26f Greentime Hu 2023-06-05  118 =20
c27fa53b858b4ee Bj=C3=B6rn T=C3=B6pel  2024-04-03  119  	/*
c27fa53b858b4ee Bj=C3=B6rn T=C3=B6pel  2024-04-03  120  	 * Mark the vstate=
 as clean prior performing the actual copy,
c27fa53b858b4ee Bj=C3=B6rn T=C3=B6pel  2024-04-03  121  	 * to avoid gettin=
g the vstate incorrectly clobbered by the
c27fa53b858b4ee Bj=C3=B6rn T=C3=B6pel  2024-04-03  122  	 *  discarded vect=
or state.
c27fa53b858b4ee Bj=C3=B6rn T=C3=B6pel  2024-04-03  123  	 */
c27fa53b858b4ee Bj=C3=B6rn T=C3=B6pel  2024-04-03  124  	riscv_v_vstate_set=
_restore(current, regs);
c27fa53b858b4ee Bj=C3=B6rn T=C3=B6pel  2024-04-03  125 =20
8ee0b41898fa26f Greentime Hu 2023-06-05  126  	/* Copy everything of __sc_r=
iscv_v_state except datap. */
8ee0b41898fa26f Greentime Hu 2023-06-05  127  	err =3D __copy_from_user(&cu=
rrent->thread.vstate, &state->v_state,
8ee0b41898fa26f Greentime Hu 2023-06-05  128  			       offsetof(struct __r=
iscv_v_ext_state, datap));
8ee0b41898fa26f Greentime Hu 2023-06-05  129  	if (unlikely(err))
8ee0b41898fa26f Greentime Hu 2023-06-05  130  		return err;
8ee0b41898fa26f Greentime Hu 2023-06-05  131 =20
8ee0b41898fa26f Greentime Hu 2023-06-05  132  	/* Copy the pointer datap it=
self. */
8ee0b41898fa26f Greentime Hu 2023-06-05 @133  	err =3D __get_user(datap, &s=
tate->v_state.datap);
8ee0b41898fa26f Greentime Hu 2023-06-05  134  	if (unlikely(err))
8ee0b41898fa26f Greentime Hu 2023-06-05  135  		return err;
8ee0b41898fa26f Greentime Hu 2023-06-05  136  	/*
8ee0b41898fa26f Greentime Hu 2023-06-05  137  	 * Copy the whole vector con=
tent from user space datap. Use
8ee0b41898fa26f Greentime Hu 2023-06-05  138  	 * copy_from_user to prevent=
 information leak.
8ee0b41898fa26f Greentime Hu 2023-06-05  139  	 */
c27fa53b858b4ee Bj=C3=B6rn T=C3=B6pel  2024-04-03  140  	return copy_from_u=
ser(current->thread.vstate.datap, datap, riscv_v_vsize);
8ee0b41898fa26f Greentime Hu 2023-06-05  141  }
818d78ba1b3f88d Andy Chiu    2025-11-12  142 =20

:::::: The code at line 133 was first introduced by commit
:::::: 8ee0b41898fa26f66e32237f179b6989c65600d6 riscv: signal: Add sigconte=
xt save/restore for vector

:::::: TO: Greentime Hu <greentime.hu@sifive.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
