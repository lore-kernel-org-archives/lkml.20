Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030712;
	b=ulFQq2p/MNHwfWCTi/W1MA+NLKlptqSZvF8a+vzwSdiL6QEAAfUv1CEtg+jEkRsFoeeJ
	 /UofcwaIv11yABg80wyq2k1YNzOLAwEfX/tg5N6oCj0W8h1FkREVUCjPVizb+BGQBoCKV
	 eQJajXHI+24QShJty9KTCA8LbuwJxOqVdFKfl5zN6R8JJoTVeLg7g3v2Jb1vCyH752g9W
	 /fOOMas35w8aBQ5tNQ9y0m/7/lZSVl2r70Ztf22BJEOQ+qDIPEyh4DWuUE00N7orwwz+P
	 O7dQ4g0Kdx5F7RV/WwQ/sHbHEbsJPzSvL572lR+RGh/ARBa1lHl75i2Jr+AvLQOmz2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030712;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kdYmDCdrVKmNvVP1aGvgu9MiowtzG7BIaUAhZZkIVeI=;
	b=rFa37JL8yK/tNAnPJsxiPXe5oBZgBl/zt1S1bTLFt2JlU59ey/gYqEweNJwhWO94bDAl
	 jQc8RXj0qo+D01Sy3gJaZ7wXmOicyBTI4cof22dWCPoRyAk7Aljh20aU+P2eGTjQkfG2c
	 8UksG6SKUqugQ0Az3K7DUjvCqFVerxHgAPfaBQ6TT3fOpc2kHf3dndicjQ6D4JtavhNs7
	 +u1l8xJIbeSPwcRsgTbg4lEn+W9CcAlQHIyu4I9O+5bS+5ezWrttGE/QrxTNOnACF2kuv
	 nSLlu11Y1dcJNx+fPDFdtnHwpCk/LP1s30DLskgWNKFpUUaxANRp43KMNrMmZE7Xqbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A0pwGVrl;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E46F606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E46F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A0pwGVrl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793030712; x=1824566712;
  h=date:from:to:cc:subject:message-id;
  bh=FgwYM7MQ2xeQkZWdycu1oAcfJIMxuQeYSzHF73oY/Vk=;
  b=A0pwGVrl23dAtrC6C1GGY6/SHOOGtv8lUuSGHWm8dTuooCYQyv1FpXAn
   e2DEWHdwl/seJV/SyQ31XvABZ8sigdEzf+aqIAmKBW9hiu1fwjMv54eCy
   B3OJ3bvP6t92tz03Zm/puPa5yvVLeddUY9i/+MFC/46B2P7no5DrRuEKZ
   RRRuo2T7LLK//ZdJf86CG5g8qKcceoyJkS9dr9GEIn5gm6ez/smvqM1gd
   Gt1iBONIX1h0umjCYIHzJaPnfxd5HDhJl0lfA97xB4tWoNxgyQi3TMWIV
   HM9P68lfK8lsT63Yc87HoR0mkddTiZEp7CSWbaFCFF2WlcukSfjr/zuIQ
   Q==;
X-CSE-ConnectionGUID: IdNSXkvRQIigYUQ8F/ozGA==
X-CSE-MsgGUID: 32yg6LkES8yb4lMDWfP3bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1715171"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1715171"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 09:05:11 -0700
X-CSE-ConnectionGUID: u6eWjHS2SEevFcNxHAAsbw==
X-CSE-MsgGUID: a68NuEViTfiBc5QwFPWuXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6121930"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 26 Oct 2026 09:05:09 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLNC7-000000004A7-1dml;
	Mon, 26 Oct 2026 16:05:07 +0000
Date: Mon, 26 Oct 2026 17:04:20 +0100
From: kernel test robot <lkp@intel.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>
Subject: fs/kernfs/dir.c:751:31: sparse: sparse: cast to non-scalar
Message-ID: <202610261608.vItiXCGW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6b4b543fa18757297ac756a6fe6e64f506b7844a
commit: 81bdc85b4c086502f4446a58eb5d25f29bb5e9f7 kernfs: fix up the unlocked attribute reads on the creation paths
date:   7 weeks ago
config: alpha-randconfig-r2309-20261026 (https://download.01.org/0day-ci/archive/20261026/202610261608.vItiXCGW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610261608.vItiXCGW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 81bdc85b4c08 ("kernfs: fix up the unlocked attribute reads on the creation paths")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610261608.vItiXCGW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/kernfs/dir.c:751:31: sparse: sparse: cast to non-scalar
>> fs/kernfs/dir.c:751:31: sparse: sparse: cast from non-scalar

vim +751 fs/kernfs/dir.c

   731	
   732	struct kernfs_node *kernfs_new_node(struct kernfs_node *parent,
   733					    const char *name, umode_t mode,
   734					    kuid_t uid, kgid_t gid,
   735					    unsigned flags)
   736	{
   737		struct kernfs_node *kn;
   738	
   739		/*
   740		 * The mode and the gid below are read unlocked on purpose: they feed
   741		 * a node that does not exist yet, so nothing orders a racing chmod or
   742		 * chown against this creation.
   743		 */
   744		if (READ_ONCE(parent->mode) & S_ISGID) {
   745			/* this code block imitates inode_init_owner() for
   746			 * kernfs
   747			 */
   748			struct kernfs_iattrs *attrs = READ_ONCE(parent->iattr);
   749	
   750			if (attrs)
 > 751				gid = READ_ONCE(attrs->ia_gid);
   752	
   753			if (flags & KERNFS_DIR)
   754				mode |= S_ISGID;
   755		}
   756	
   757		kn = __kernfs_new_node(kernfs_root(parent), parent,
   758				       name, mode, uid, gid, flags);
   759		return kn;
   760	}
   761	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
