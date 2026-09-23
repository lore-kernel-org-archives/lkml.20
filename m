Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A7A43F08F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156697; cv=none; b=ifAn56gp8M+uPZHGVrfY7vf4zlLiuByJU//xfwa8pxfvzdb1Fe7FPixLDZ7/ZSAjed676oIGBZmQMvvUa2cRV3JjJBxR319f/4GWv5RImxwwoFSDcygOhwi1UV9aXFR9g0vPKdt6ny7bCSFouNCZ7JC8sQsWjkIUsO/6kpH9f9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156697; c=relaxed/simple;
	bh=NqcWXzzfzw2yz/pC0EGzHLV+lAnO5XSXRorkx27WJPA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o3ltPPJg5gYTo91UO69wlx74m7W3ghYcqIMUk10Nt4rARXgMRpwbDxWCnWY7zE5aOUpOTmFmZaeLFGsT5ceSQ0N6u/kHJawaWWjgfNxzSBxUDP7iIkSCEhV4fuRLuAiPxA8mhA4o0MHX3WdWidXmMtRw7mBZv9kbSBK97Mqj2Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2nQIHrp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2nQIHrp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790156696; x=1821692696;
  h=date:from:to:cc:subject:message-id;
  bh=NqcWXzzfzw2yz/pC0EGzHLV+lAnO5XSXRorkx27WJPA=;
  b=L2nQIHrp5mAmfLvPhckPcn8TzlybNgf5wLQDk7ADVJuMv6LMY+ngruz8
   voBz6finLAgsTP8qUqCL5CBTob7KdNdGfS4tBAHuXDQzc/rKi5vUiJ+xg
   oi2nivJVl+ekjXwX4qBzk1BTbxuwQmZdGJmIvfRHOS8sJhNgwYTnilliv
   Q5tBQNCO5Uq+O3p2YJw7zlD/zaUBYWWJeG3jvV9SO6EGnjguLOZk4x7Gj
   7Eu9A66U3NVkDvUMUar49hC+mphliUFfcSCyA5HMeGauac3xeELxlekU7
   hwNbcZRJ4gLlcoh2ala2cDEh7mnW5EZe5DcrLX0KOdGsCfmtPLpA+Il6z
   g==;
X-CSE-ConnectionGUID: 392vQTpFRfuDOgF45FGXzQ==
X-CSE-MsgGUID: PTWrabPwQ1iSi2tjjQgxJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="108329901"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="108329901"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 02:44:55 -0700
X-CSE-ConnectionGUID: lk+dp/dMS/i7wxwC2H7A0w==
X-CSE-MsgGUID: bjRY6rrhTJevjFWO/mhmyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4605857"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 02:44:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9JX0-00000000GuM-0CSx;
	Wed, 23 Sep 2026 09:44:50 +0000
Date: Wed, 23 Sep 2026 17:44:11 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Gary Guo <gary@garyguo.net>
Subject: drivers/android/binder/rust_binderfs.c:51:6: sparse: sparse:
 symbol 'rust_binder_devices_param' was not declared. Should it be static?
Message-ID: <202609231723.xD1MYVan-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: 72d33b8bfeacbfdccf2cda4650e8e002def036f8 rust: kasan: add support for Software Tag-Based KASAN
date:   4 months ago
config: arm64-randconfig-r1304-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231723.xD1MYVan-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5dc57157f12f0ff676e823d9b4d98b45c07e5df2)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231723.xD1MYVan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 72d33b8bfeac ("rust: kasan: add support for Software Tag-Based KASAN")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231723.xD1MYVan-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/binder/rust_binderfs.c:51:6: sparse: sparse: symbol 'rust_binder_devices_param' was not declared. Should it be static?

vim +/rust_binder_devices_param +51 drivers/android/binder/rust_binderfs.c

eafedbc7c050c44 Alice Ryhl 2025-09-19  50  
eafedbc7c050c44 Alice Ryhl 2025-09-19 @51  char *rust_binder_devices_param = CONFIG_ANDROID_BINDER_DEVICES;
eafedbc7c050c44 Alice Ryhl 2025-09-19  52  module_param_named(rust_devices, rust_binder_devices_param, charp, 0444);
eafedbc7c050c44 Alice Ryhl 2025-09-19  53  

:::::: The code at line 51 was first introduced by commit
:::::: eafedbc7c050c44744fbdf80bdf3315e860b7513 rust_binder: add Rust Binder driver

:::::: TO: Alice Ryhl <aliceryhl@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
