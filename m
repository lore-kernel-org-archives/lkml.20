Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3402D0602
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034823; cv=none; b=o1bcVQn/eM/pmmScUjuXympFlF4vNBQLaPsS1dK0s/uQqXDcEg6Wfj77ux+fLqB33iaBUXoGeBzWMhohHlwSGzJ5Ez+Qyq0fcE95+A9D0rDianfSaTWCVpQ41t7t2Ie5jqAN2+Z6eQWf3sCPB/ORfQhAZ+tKX0yS+PCcVodL+5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034823; c=relaxed/simple;
	bh=d/U3Zhp36p4I4cqlKaFiT8C/4My/i67sRO6QPyUJFM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=npq1PxLVHCq9unZ43taPNwFV7X8pX9k2l/psS7rFj2HEHON2eaTotaoWDdrtRxyAYvHmj93OKmZVnpazSTzeNHEr7iiUfEJAC6xPHpklyrWvxitQm6b4y0meQYSCeE6Jf6GM69NeGVSI3dFygev2938UQhbH5rLplhhZ4YrvJng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DE9uWlee; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DE9uWlee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792034822; x=1823570822;
  h=date:from:to:cc:subject:message-id;
  bh=d/U3Zhp36p4I4cqlKaFiT8C/4My/i67sRO6QPyUJFM8=;
  b=DE9uWleer1TvZ4HL8Kn7P5zQYr6xcEwyLNRkLWIvwgVJgGxGSNzsiX+B
   0+7lBRB/+kIo50fevMwAKcRYBfxjTPi833qUt7c0ptvBkZ2K3Z/TDUqVq
   0lxYMKK3YE6O+S2XvKsqe81fxGYDh9SK9+nuVLg3B5Awhjd+OvN82amrY
   CLg4MOYHIeWae/KXR5c78D3epqOuAwlejy7IuR8uM5Q2vVLn0OgSnuF1K
   JnhCe3fRgWY20JscnX1Ctp9ebs7Ulc7caJlJVrQ7TEQzyw0cvklwlD9OJ
   Jpgz7LvSIXT5GwfXk8I5o46E3IwZIZj5raR9l74/dEPs42vh+TZXuzJjx
   g==;
X-CSE-ConnectionGUID: gVHPrwQlR4uEfNyPWMBOQw==
X-CSE-MsgGUID: SwJYVxbUT9OV3VMZu/37sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="899572"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="899572"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 20:27:02 -0700
X-CSE-ConnectionGUID: A4oD+xDFT1Kd2ukBtieRQw==
X-CSE-MsgGUID: lJnanwL0SGaDoJIWkblQ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="2044319"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 Oct 2026 20:26:59 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHC7N-00000000BaF-3274;
	Thu, 15 Oct 2026 03:26:57 +0000
Date: Thu, 15 Oct 2026 05:26:34 +0200
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>
Subject: init/main.c:763:(.init.text+0x6c): relocation truncated to
 fit: R_ARC_S25W_PCREL against symbol `__st_r13_to_r15' defined in .text
 section in ../lib/gcc/arc-linux/9.5.0/hs38/libgcc.a(_millicodethunk_st.o)
Message-ID: <202610150558.j5Ad60li-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0fcb05b72344f40806cbe810de8872f1698bf053
commit: 83dc0ba2755296b5e5882e044c80973b7c3fce9e Merge tag 'amd-drm-next-6.20-2026-01-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
date:   9 months ago
config: arc-randconfig-r2101-20261014 (https://download.01.org/0day-ci/archive/20261015/202610150558.j5Ad60li-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150558.j5Ad60li-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 83dc0ba27552 ("Merge tag 'amd-drm-next-6.20-2026-01-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-next")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150558.j5Ad60li-lkp@intel.com/

All errors (new ones prefixed by >>):

   init/main.o: in function `do_early_param':
>> init/main.c:763:(.init.text+0x6c): relocation truncated to fit: R_ARC_S25W_PCREL against symbol `__st_r13_to_r15' defined in .text section in ../lib/gcc/arc-linux/9.5.0/hs38/libgcc.a(_millicodethunk_st.o)


vim +763 init/main.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  759  
^1da177e4c3f41 Linus Torvalds    2005-04-16  760  /* Check for early params. */
ecc8617053e0a9 Luis R. Rodriguez 2015-03-30  761  static int __init do_early_param(char *param, char *val,
ecc8617053e0a9 Luis R. Rodriguez 2015-03-30  762  				 const char *unused, void *arg)
^1da177e4c3f41 Linus Torvalds    2005-04-16 @763  {
914dcaa84c53f2 Rusty Russell     2010-08-11  764  	const struct obs_kernel_param *p;
^1da177e4c3f41 Linus Torvalds    2005-04-16  765  
^1da177e4c3f41 Linus Torvalds    2005-04-16  766  	for (p = __setup_start; p < __setup_end; p++) {
17b655759e83fd Raul E Rangel     2024-09-11  767  		if (p->early && parameq(param, p->str)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  768  			if (p->setup_func(val) != 0)
ea676e846a8171 Andrew Morton     2013-04-29  769  				pr_warn("Malformed early option '%s'\n", param);
^1da177e4c3f41 Linus Torvalds    2005-04-16  770  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  771  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  772  	/* We accept everything at this stage. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  773  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  774  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  775  

:::::: The code at line 763 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
