Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63D031716D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 20:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791489687; cv=none; b=IEt6aG+xL/U1n5QBRkHP8wS7x+Xo7+jxDMOTt0/bum+u3aSpaH8BpJR2LU/Bfez76qiUt0pcUgo94Kk2D7n007n61Sry7tQ54sHSBHZvuiHYa7h70UbZYFn3D7PK9uwtue5j6eVlGtAKp0HaVC7KbnDuYM10zyhWdE9V8+XLdBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791489687; c=relaxed/simple;
	bh=V7cOuzaHlLFp3hzMfJhPbKv+sHwf6Lp0W0nPVsPqHNs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nDXBp+EyrTWRNzq8/vtl4P3xYzWidy4/VoECOn0vFsh3cfFKkTuaCDfWcpj+XOlawl3gNvkwXyNa9wYVNQNCX9s7GO1j3IhTc4eimFpTPJPYzUX/VmFv1UjZWV6q1LpIrj+CvRNW77Vby0EaskkgwcmWoQB42wU12Fyg3mmvcAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cp7s8VKd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cp7s8VKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791489686; x=1823025686;
  h=date:from:to:cc:subject:message-id;
  bh=V7cOuzaHlLFp3hzMfJhPbKv+sHwf6Lp0W0nPVsPqHNs=;
  b=Cp7s8VKdwVHC+tCWUyQh50fvi+z4AMTgF30zjxdxU/iuq54wqrPNfLX7
   59vMi26fhWTClYmcj07Be6CaNi/PVQqJQQal+pEKgjLJi8Qbcpl7ew9jo
   Pfdbz8IFa5jKbm/0n1ekZ4Z3Bi0tXImBN40aRxOQyW0B05Xkpx4t+RXWd
   oqeTDGUV7sT97wDdEI3gVoCbn+bXQzGipt2Yn0KmPtOyz93eTaencR9on
   DlwrmXwEfv6TTSGlWRxnpcuyBeTp/kF+S+xdqrBCJw7DlYfTMHaTBflyL
   1PSvRIXbgMKyo9rLD4mXsy6r1xhPiWVz3490ZXdlWelS9CreDogAdCUOm
   g==;
X-CSE-ConnectionGUID: 5MbWXbkgRfymbnxTtexWWw==
X-CSE-MsgGUID: 2MdSuGrgRZS0pVXo5Nz80w==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="178310"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="178310"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 13:01:25 -0700
X-CSE-ConnectionGUID: qeJ0aHCjTmWgpSP+o9LEsg==
X-CSE-MsgGUID: kFvkHJY1Q8i+4DhuI3ZGHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="1943157"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 08 Oct 2026 13:01:23 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEuIq-000000004r8-3yV2;
	Thu, 08 Oct 2026 20:01:20 +0000
Date: Fri, 09 Oct 2026 04:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Jason A. Donenfeld" <zx2c4@kernel.org>
Subject: error[E0080]: evaluation panicked: assertion failed:
 size_of::<isize>() == size_of::<isize_atomic_repr>()
Message-ID: <202610090309.cmThgsbB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   47324d3a5b3abd781295044d01d92d09f184e872
commit: eb13a1ff271b0d180687eebb30611b0b276d5193 random: vDSO: avoid call to memset() when zeroing reserved parameter
date:   6 days ago
config: loongarch-randconfig-1000-20261009 (https://download.01.org/0day-ci/archive/20261009/202610090309.cmThgsbB-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 242243a5814307de825db3428662d67b064e2cbc)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090309.cmThgsbB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: eb13a1ff271b ("random: vDSO: avoid call to memset() when zeroing reserved parameter")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090309.cmThgsbB-lkp@intel.com/

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
