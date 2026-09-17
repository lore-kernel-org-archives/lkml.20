Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5025383CE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664573; cv=none; b=n9eSF3VRlca4M86UvIwDJqD0RnPPsr3Nn0mPS18+aKbA7pXWdATxiYwArLo4gaBzTSYSiWfsoBNvUHft6rYBG2vF1D2Aqxlgdo9CeinqYirxyeXv1RQfz+Nd7xZ4sZL5j0dOeWuuxSJcPaGk4vEDcolau4mUkM8w8XQTDPkWII8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664573; c=relaxed/simple;
	bh=WhwHfTD0tuYgTrtq1ANji5JKq5blp4kYMCk8ZObZL2o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pp7Z3ujI/GuVFQFcX9gK6bbJCcP1UCj+nRAgXapKBTNbKZU5/2ZWPv1M3Xi2/4Hoin+7AhayQlia6lUSr2D1YfWN4HnQSsD1uaOy0kMnr20OpTsulUR4EZrmNyKyuS4tyQzkgvvOOtSxhEbj+lHZZ7oR81yQemMVrWFb9wDJfmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWW4hO/e; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWW4hO/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789664571; x=1821200571;
  h=date:from:to:cc:subject:message-id;
  bh=WhwHfTD0tuYgTrtq1ANji5JKq5blp4kYMCk8ZObZL2o=;
  b=LWW4hO/eLqTyE8X8HbFca5LYXuusGfWkNrDNlRtvg7XYoKJUl8Ozuaqs
   x7/Ezzn+jptfRE1fCC9ypA2F2BULJOu46vq3rvyBfIaTcFIQ99vcTuc0a
   u3HPGolHF69BmbPfOr0zCO9XBe2ym89P1ITLSNrPH7ZuTFmyIGcuEl6lj
   oKl7B9o66Kzsfrpfowc83KqxP9FVbjOcBD0vBMxREtu7UtGGOKXLC7ikt
   g1Butw27OzG93wCu/SlB96sqkMuU2Nsz2Xt9U00N9dloh4anAegZOoAo0
   A5YFrlUJ+LYsHR+ql/s9FApRaL1HCbscjxMeIMVqZ9MsUP78uwbW9hZyo
   w==;
X-CSE-ConnectionGUID: h1AiVcnoTWm/yoRlAde0Nw==
X-CSE-MsgGUID: XqjJktbgTieWjhKhg1hqgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="617944"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="617944"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 10:02:50 -0700
X-CSE-ConnectionGUID: QVRCJBy/TbW9XZMb7nfw7A==
X-CSE-MsgGUID: vhZfLCHsTUeGWgscaREGXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297400213"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 17 Sep 2026 10:02:47 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7FVV-000000000hO-0ui8;
	Thu, 17 Sep 2026 17:02:45 +0000
Date: Thu, 17 Sep 2026 19:02:05 +0200
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: lib/crypto/curve25519-fiat32.c:272 fe_sub_impl() warn:
 inconsistent indenting
Message-ID: <202609171950.R4mgiLzE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   238650ef6c7c7cca08e032527329424c9fbd70e5
commit: ed1767442d919f57aaf83d69c33853da2644d902 lib/crypto: tests: Introduce CRYPTO_LIB_ENABLE_ALL_FOR_KUNIT
date:   6 months ago
config: xtensa-randconfig-r2202-20260917 (https://download.01.org/0day-ci/archive/20260917/202609171950.R4mgiLzE-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ed1767442d91 ("lib/crypto: tests: Introduce CRYPTO_LIB_ENABLE_ALL_FOR_KUNIT")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609171950.R4mgiLzE-lkp@intel.com/

New smatch warnings:
lib/crypto/curve25519-fiat32.c:272 fe_sub_impl() warn: inconsistent indenting

Old smatch warnings:
lib/crypto/curve25519-fiat32.c:229 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:230 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:231 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:232 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:233 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:234 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:235 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:236 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:237 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:238 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:239 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:240 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:241 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:242 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:243 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:244 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:245 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:246 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:247 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:248 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:273 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:274 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:275 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:276 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:277 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:278 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:279 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:280 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:281 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:282 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:283 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:284 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:285 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:286 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:287 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:288 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:289 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:290 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:291 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:315 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:316 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:317 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:318 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:319 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:320 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:321 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:322 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:323 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:324 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:325 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:326 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:327 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:328 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:329 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:330 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:331 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:332 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:333 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:334 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:335 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:336 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:337 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:338 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:339 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:340 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:341 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:342 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:343 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:344 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:345 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:346 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:347 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:348 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:349 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:350 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:351 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:352 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:353 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:354 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:355 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:356 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:357 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:358 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:359 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:360 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:361 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:362 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:363 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:364 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:365 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:366 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:367 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:368 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:369 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:370 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:371 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:372 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:373 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:374 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:375 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:376 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:377 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:378 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:379 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:380 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:381 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:382 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:383 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:384 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:385 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:386 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:387 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:388 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:389 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:390 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:391 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:392 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:393 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:394 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:395 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:396 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:397 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:398 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:399 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:400 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:401 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:402 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:403 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:404 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:405 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:406 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:407 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:408 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:409 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:410 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:411 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:412 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:413 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:414 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:415 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:447 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:448 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:449 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:450 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:451 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:452 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:453 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:454 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:455 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:456 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:457 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:458 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:459 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:460 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:461 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:462 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:463 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:464 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:465 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:466 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:467 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:468 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:469 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:470 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:471 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:472 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:473 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:474 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:475 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:476 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:477 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:478 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:479 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:480 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:481 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:482 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:483 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:484 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:485 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:486 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:487 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:488 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:489 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:490 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:491 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:492 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:493 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:494 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:495 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:496 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:497 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:498 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:499 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:500 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:501 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:502 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:503 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:504 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:505 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:506 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:507 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:508 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:509 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:510 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:511 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:512 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:513 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:514 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:515 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:516 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:517 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:518 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:519 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:520 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:521 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:522 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:523 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:524 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:525 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:526 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:527 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:528 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:529 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:530 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:531 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:532 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:533 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:534 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:535 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:536 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:537 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:638 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:639 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:640 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:641 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:642 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:643 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:644 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:645 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:646 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:647 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:648 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:649 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:650 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:651 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:652 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:653 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:654 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:655 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:656 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:657 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:658 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:659 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:660 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:661 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:662 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:663 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:664 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:665 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:666 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:667 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:668 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:669 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:670 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:671 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:672 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:673 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:674 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:675 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:676 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:677 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:678 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:679 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:680 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:681 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:682 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:683 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:684 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:685 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:686 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:687 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:688 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:689 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:690 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:691 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:692 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:693 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:694 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:695 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:696 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:697 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:698 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:699 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:700 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:701 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:702 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:703 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:704 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:705 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:706 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:707 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:708 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:709 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:710 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:711 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:712 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:713 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:714 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:715 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:716 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:717 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:718 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:719 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:720 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:721 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:722 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:723 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:724 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:725 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:726 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:727 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:728 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:729 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:730 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:731 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:732 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:733 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:734 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:735 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:736 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:737 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:738 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:111 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:112 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:113 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:114 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:115 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:116 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:117 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:118 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:119 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:120 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:131 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:132 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:134 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:136 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:138 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:140 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:142 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:144 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:146 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:148 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:150 fe_freeze() warn: inconsistent indenting

vim +272 lib/crypto/curve25519-fiat32.c

0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  268  
660bb8e1f833ea Ard Biesheuvel     2019-11-08  269  static noinline void fe_sub_impl(u32 out[10], const u32 in1[10], const u32 in2[10])
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  270  {
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  271  	{ const u32 x20 = in1[9];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08 @272  	{ const u32 x21 = in1[8];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  273  	{ const u32 x19 = in1[7];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  274  	{ const u32 x17 = in1[6];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  275  	{ const u32 x15 = in1[5];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  276  	{ const u32 x13 = in1[4];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  277  	{ const u32 x11 = in1[3];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  278  	{ const u32 x9 = in1[2];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  279  	{ const u32 x7 = in1[1];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  280  	{ const u32 x5 = in1[0];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  281  	{ const u32 x38 = in2[9];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  282  	{ const u32 x39 = in2[8];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  283  	{ const u32 x37 = in2[7];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  284  	{ const u32 x35 = in2[6];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  285  	{ const u32 x33 = in2[5];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  286  	{ const u32 x31 = in2[4];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  287  	{ const u32 x29 = in2[3];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  288  	{ const u32 x27 = in2[2];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  289  	{ const u32 x25 = in2[1];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  290  	{ const u32 x23 = in2[0];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  291  	out[0] = ((0x7ffffda + x5) - x23);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  292  	out[1] = ((0x3fffffe + x7) - x25);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  293  	out[2] = ((0x7fffffe + x9) - x27);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  294  	out[3] = ((0x3fffffe + x11) - x29);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  295  	out[4] = ((0x7fffffe + x13) - x31);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  296  	out[5] = ((0x3fffffe + x15) - x33);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  297  	out[6] = ((0x7fffffe + x17) - x35);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  298  	out[7] = ((0x3fffffe + x19) - x37);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  299  	out[8] = ((0x7fffffe + x21) - x39);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  300  	out[9] = ((0x3fffffe + x20) - x38);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  301  	}}}}}}}}}}}}}}}}}}}}
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  302  }
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  303  

:::::: The code at line 272 was first introduced by commit
:::::: 0ed42a6f431e930b2e8fae21955406e09fe75d70 crypto: curve25519 - generic C library implementations

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
