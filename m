Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019120;
	b=5ZN+TQJSSutfOc8QQR/75zSIDCXLixwkg3RTk/wQ9tiiIYd7S40wTZGmcYrDLfeExWLA
	 GtlW/fB7YJxTgdkiQl5L0onOB3D9ZFZdm1L1NtTiEU0vtZFjyxso+q4r7z9NAmi9pvTpn
	 ze4BRApSEy5uyBjqRVmDMv0pUJpKNBH2734yUZ0jWwmvhYqZ9ERINS4nSGEB1UgTS/v0Z
	 kQZy+6jcFzkQoe2H4shVY8hBhDysNbplEMgOmYKcIzNxvcWbgPz/5HMow0R+RmjSk4mcm
	 llbcjll0Tf4olbPrbmSfy7+3E9UCz1Vic2Hv1j8mjl60gdVhMKF6d/EtxPSk8uFFilg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019120;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rxKtCkuubO0zp/LQIsqmfacKmaitnLQEq4/IsiTEkeo=;
	b=OqRwtBAgnDJMEM3AJZXXsBt+eisKAxzbtGfQoaEGcfm+tHCIikROiArXR05GmkmEQixT
	 eSgWmUeLVJpFdrI+0aiK8ekwg2iIvHguq9pOXd1XKvanP18zKSfJ8XAo/7avKDa5Zob+W
	 IfiCDUGeIk3s+KYajmuKZjfJXie32L+jEr7Ib6V1lbwtk49fEyHcdvEgQkARjt+Xbok3v
	 J/Petd9Kgw+j2pXaUb6HXYWgErnLtkP4qh6obTxTXWqPQ2WZteb8cunj7Bi8bEguF1pvB
	 Z1hQXCiefh9lzRoVi63icbXcgeLNJaoBcwyDXw0Rp4bZxJ2csq2cDEfS9GosaAaWQzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SSpE3m06;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E7B606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E7B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SSpE3m06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793019118; x=1824555118;
  h=date:from:to:cc:subject:message-id;
  bh=yiy4WuJ3nqfKx9wc6w2okMivt9nSiIuK6DpZQhRruMU=;
  b=SSpE3m06F18LPhsN4mZsh4vU4tyzReF9edQol6MqPcQAvrG78rLcCSVu
   SBLEAR7plMfILv4nQnDpdqYNPcz7P/nmCQYveQaaoq0Jf6OPuhL+XzqrQ
   /7yJiSQ36ZQyV3AhgX6UL4+KAhnnE+Z77LCbR03fwgQGJnTYL8qIsurwM
   0YyzvNuQ97TejL5+pMrHYh164Snd53KdjG/AxlbhnL9tG71LC8H2zeM1r
   g8sd0nBikpeaKSC0O5TZhA47LJ+4cxEj0xlKDkysH4crdER4CM4d2Ts1l
   EcxO+O8zfvCIW05lp+6VOt7D2Xdik6IXtGAIF1DbNw7BkupcD9ohW+3S1
   A==;
X-CSE-ConnectionGUID: d59ZBruKT328MBzg8qYBBg==
X-CSE-MsgGUID: OPBCK2X/T5yrjxAxFs5pNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1705516"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1705516"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 05:51:56 -0700
X-CSE-ConnectionGUID: UfUzhIvjTJiauVYGKPOubw==
X-CSE-MsgGUID: T5jaaAEbTJK04qKXd9ESuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4655592"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 26 Oct 2026 05:51:54 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLKB4-0000000046x-2AJF;
	Mon, 26 Oct 2026 12:51:50 +0000
Date: Mon, 26 Oct 2026 13:51:14 +0100
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Jason A. Donenfeld" <zx2c4@kernel.org>
Subject: error[E0080]: evaluation panicked: assertion failed:
 size_of::<isize>() == size_of::<isize_atomic_repr>()
Message-ID: <202610261307.vnC1uCAL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Nathan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6b4b543fa18757297ac756a6fe6e64f506b7844a
commit: eb13a1ff271b0d180687eebb30611b0b276d5193 random: vDSO: avoid call to memset() when zeroing reserved parameter
date:   3 weeks ago
config: loongarch-randconfig-r2103-20261026 (https://download.01.org/0day-ci/archive/20261026/202610261307.vnC1uCAL-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610261307.vnC1uCAL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: eb13a1ff271b ("random: vDSO: avoid call to memset() when zeroing reserved parameter")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610261307.vnC1uCAL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0080]: evaluation panicked: assertion failed: size_of::<isize>() == size_of::<isize_atomic_repr>()
   --> rust/kernel/build_assert.rs:112:23
   |
   112 |         const _: () = ::core::assert!($condition $(,$arg)?);
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `sync::atomic::predefine::_` failed here
   |
   ::: rust/kernel/sync/atomic/predefine.rs:98:1
   |
   98 | static_assert!(size_of::<isize>() == size_of::<isize_atomic_repr>());
   | -------------------------------------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: evaluation panicked: assertion failed: align_of::<isize>() == align_of::<isize_atomic_repr>()
   --> rust/kernel/build_assert.rs:112:23
   |
   112 |         const _: () = ::core::assert!($condition $(,$arg)?);
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `sync::atomic::predefine::_` failed here
   |
   ::: rust/kernel/sync/atomic/predefine.rs:99:1
   |
   99 | static_assert!(align_of::<isize>() == align_of::<isize_atomic_repr>());
   | ---------------------------------------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: evaluation panicked: assertion failed: size_of::<usize>() == size_of::<isize_atomic_repr>()
   --> rust/kernel/build_assert.rs:112:23
   |
   112 |         const _: () = ::core::assert!($condition $(,$arg)?);
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `sync::atomic::predefine::_` failed here
   |
   ::: rust/kernel/sync/atomic/predefine.rs:100:1
   |
   100 | static_assert!(size_of::<usize>() == size_of::<isize_atomic_repr>());
   | -------------------------------------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: evaluation panicked: assertion failed: align_of::<usize>() == align_of::<isize_atomic_repr>()
   --> rust/kernel/build_assert.rs:112:23
   |
   112 |         const _: () = ::core::assert!($condition $(,$arg)?);
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `sync::atomic::predefine::_` failed here
   |
   ::: rust/kernel/sync/atomic/predefine.rs:101:1
   |
   101 | static_assert!(align_of::<usize>() == align_of::<isize_atomic_repr>());
   | ---------------------------------------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
