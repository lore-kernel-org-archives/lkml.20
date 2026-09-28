Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8E1502772
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632554; cv=none; b=IKwBx5MV28GsbkbhJu7weXbQGilAbL/jIh4gccGtYKlAiSi+x/Vxt/OgMtEXBGrcpcZo396wYqUdSFL0qawqjN1Q/wosjXouvH6M5XjT4mnWD1uODCE+WmPTOblCyBIoo657d0AMPTrxW2LYIei48uNGzsnMRDACtq87lplq1VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632554; c=relaxed/simple;
	bh=l+x5EGdr6xdltmuEqahT381Wzz1Nfo9mldBmWIqQmQY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pL9Dj3csUaH7vodoLLKD4EV3ozw5wRhlajj8ZsskFCXSYZkSo6TVLvf9zbZzqorrj7cpUAN17ZoLrKzUhFdStfTrrUxY+MRnFxwEpCnFlWwFTVf8rUWzAb9mIw5W+rhICytxmFzcGLywJfxO1XB6iD110tvFI1aGJnFEeQVuBuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QtiQSb9J; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QtiQSb9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790632546; x=1822168546;
  h=date:from:to:cc:subject:message-id;
  bh=l+x5EGdr6xdltmuEqahT381Wzz1Nfo9mldBmWIqQmQY=;
  b=QtiQSb9Jba/THv8Y8lM95HNHD8BlfzcX3Gf2iuptr3xBLSTd+yVOGNoB
   mSMElyskpT4Kg2dU5vH9h3Qntj3p9Ksk3JVIARd/4WDn1H638MHMRvZg1
   FLxMIkTcXcRMv9OwFSNeEP1PlzZ3aIa06E60VgQdWShoC84+DRPqt1VLZ
   gsESYAmXVw1F7JKhrzJWdQ93K6hsE7Y87LFvJnhbEHs+fqA8S6frwZJ+D
   fF3Kd1BQkHsTnaguIPSOT3iQ2eqvuNK/gFauSbsFiNz+6ku3mwl69nrIx
   rkbH0QegQA+9YJ5jj8r6BTGgnWswU95TMp8EiIBhHP1lnx0s6PUhisg20
   g==;
X-CSE-ConnectionGUID: tTWuDuc2R3imF//UUMVNgA==
X-CSE-MsgGUID: 6TyjcpfNTvqxIumttCFMdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90395808"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90395808"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:55:44 -0700
X-CSE-ConnectionGUID: lQcbEw/+QiqJj4cj8X+qxA==
X-CSE-MsgGUID: GUmDzMa6RO+J5tn4YhEK+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="279893644"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2026 14:55:42 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBJJx-0000000018h-32i4;
	Mon, 28 Sep 2026 21:55:37 +0000
Date: Mon, 28 Sep 2026 23:55:25 +0200
From: kernel test robot <lkp@intel.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrii Nakryiko <andrii@kernel.org>
Subject: FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or
 directory
Message-ID: <202609282308.BVuIaLpQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Ihor,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
commit: 522397d05e7d4a7c30b91841492360336b24f833 resolve_btfids: Change in-place update with raw binary output
date:   9 months ago
config: nios2-randconfig-r2308-20260928 (https://download.01.org/0day-ci/archive/20260928/202609282308.BVuIaLpQ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609282308.BVuIaLpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 522397d05e7d ("resolve_btfids: Change in-place update with raw binary output")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609282308.BVuIaLpQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   Complex, interval and imaginary float types are not supported
   btf_encoder__encode_cu: error encoding base_type (core_id 31): -1
   Error while encoding BTF.
>> FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or directory

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
