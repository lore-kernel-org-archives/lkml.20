Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ACF36F419
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790738022; cv=none; b=KYsclKxdDmRV/NuG5fP4dD2zw/uain6DcxIMdq1utqhYn0MeX9Kw8gU4qkDvAhH6LG/zNV6gahnPopld6O0IZzgfMQws0ZbuxiPyyL+ZBJ1mnGJt/8NtDX5hHB2AWBDkvF8UTSAYLc4Xe5SLqaTVMPes5DTLNEMld4m14ApOFp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790738022; c=relaxed/simple;
	bh=0gvfcG9jm07pfn8scXFFmWOynvcSgZoKDjvAIRqNFH0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t124bGnrkqi6WK6hAY+vbZvK7W6wdRIBm0eG+TIzJxzLKsiTlhqJ9oNiSpu/NekH09r1csMAxcGfS/o9vfwAJZYWKETHvEXtkc4b8UZ3vKVUMfdNwjKfbuMBjA9eLuqgVuEWOrYKwFjtEUDz+siVmcpUwRI2wiwxsv5slrBozz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGD6UOT/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGD6UOT/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790738021; x=1822274021;
  h=date:from:to:cc:subject:message-id;
  bh=0gvfcG9jm07pfn8scXFFmWOynvcSgZoKDjvAIRqNFH0=;
  b=FGD6UOT/941/2bEpDskXC007YQQGc74t18aLslb+nGRu4GmMXlIBf6/7
   6UqBs6Q5abZPQD4N2wsfBtBl/Hpvt71MF9aJocTfnkqs363EmoBz4YV/I
   4mwfRnA2mKQEuq9sX1rjUgE4qXe3D/91hcNV0V44FRpkB406Spijb+y+9
   SNXoqJef/3YPPhn5ajZ6kGKK59cAvGeuKq/rygoLQ2ZrjS26ZPzIYkRhU
   KTN4nyccqWqIvH9gS6PwL8RmX7/LCkiQDg5JnOrjLtJ59BQChgpWVIM3C
   Q4wkcoovtzsxJsNgNlPM0KnDBG0k29LC3+oex3EuW1JQLIABpAf6DdQ7M
   Q==;
X-CSE-ConnectionGUID: VfJxoTA6SM+JH7/3Z32f7A==
X-CSE-MsgGUID: XnUG1F2ZTpGvLgcDV5bkSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="108956049"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="108956049"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 20:13:40 -0700
X-CSE-ConnectionGUID: 5IRk1580TPacb3oM5PGNDA==
X-CSE-MsgGUID: bhSWN0c2SC2X0hMlewIYkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="313504956"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Sep 2026 20:13:39 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBklD-00000000Q4f-2oEr;
	Wed, 30 Sep 2026 03:13:35 +0000
Date: Wed, 30 Sep 2026 11:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmck-rcu:dev.2026.09.18a 24/34] block.c:undefined
 reference to `cmpxchg_emu_u8'
Message-ID: <202609301117.nVKrDSkb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.09.18a
head:   90599c372e13369d11f6c1a01ff0094b16f72cf8
commit: c98d10b438b5626edb3f4e06f4f62bcb6ed6fe90 [24/34] lib: Add two-byte cmpxchg emulation function
config: xtensa-randconfig-1000-20260929 (https://download.01.org/0day-ci/archive/20260930/202609301117.nVKrDSkb-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301117.nVKrDSkb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301117.nVKrDSkb-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: fs/crypto/block.o: in function `fscrypt_limit_io_blocks':
>> block.c:(.text+0x300): undefined reference to `cmpxchg_emu_u8'
   xtensa-linux-ld: fs/crypto/block.o: in function `fscrypt_zeroout_range_end_io':
   block.c:(.text+0x31c): undefined reference to `cmpxchg_emu_u8'
   xtensa-linux-ld: fs/btrfs/bio.o: in function `btrfs_bio_alloc':
>> bio.c:(.text+0x88c): undefined reference to `cmpxchg_emu_u8'
   xtensa-linux-ld: fs/btrfs/bio.o: in function `btrfs_bio_end_io':
   bio.c:(.text+0x8e8): undefined reference to `cmpxchg_emu_u8'
   `.exit.text' referenced in section `__jump_table' of drivers/staging/vme_user/vme_fake.o: defined in discarded section `.exit.text' of drivers/staging/vme_user/vme_fake.o
   `.exit.text' referenced in section `__jump_table' of drivers/staging/vme_user/vme_fake.o: defined in discarded section `.exit.text' of drivers/staging/vme_user/vme_fake.o
   xtensa-linux-ld: block/blk-crypto-fallback.o: in function `blk_crypto_fallback_decrypt_endio':
>> blk-crypto-fallback.c:(.text+0x10c): undefined reference to `cmpxchg_emu_u8'
   xtensa-linux-ld: block/blk-crypto-fallback.o:blk-crypto-fallback.c:(.text+0x18c): more undefined references to `cmpxchg_emu_u8' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
