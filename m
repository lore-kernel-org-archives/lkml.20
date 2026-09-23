Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41785545D8C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192037; cv=none; b=cVBPg1XlF3KTqBcj3JI9cPD0V/dzQgC9M27wvE4K4CXGDM1dLBsLzba3joknHjmPOwpmDiqlolKR8QH8QRCrjEQzes1q4Xv4QUWXRC/KSElK3zasq4VnNw815SKKrVVMolE4uW4+iHanFNj+BCJIOptqccLjWYn+2ZeGrEjgH5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192037; c=relaxed/simple;
	bh=Pd9NdMzHhfwKsLmMXuMpwqKlfFPOUaPjYCSTUJCNPyo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tRGrbFr5yWyTu2MhtcYYYgrNtU3C8jv5aenrGGMWu1NN6Ilr9JQE5rJ7rberBWdkLmf1wV0spMAspwWoYpIVZ1sfTOWhNbRG7gOrsMpNBeVXuZvkpm/Ztymb1ZOD0vOCq6uA9Ur8JYi5NrYWORRXdb//UPu7xV6SKXWdL69R3MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHGKzKAx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHGKzKAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790192034; x=1821728034;
  h=date:from:to:cc:subject:message-id;
  bh=Pd9NdMzHhfwKsLmMXuMpwqKlfFPOUaPjYCSTUJCNPyo=;
  b=bHGKzKAxpvcoilhE0g8kqWFZRZrwvxgTEtpTGMC6BkwXmcPJwM9/o8PW
   /HtUfEiEP8ECT9GG4KkIp8bDD4CGIWrjRkKkFMReggzhuOc0sG2FoZOYW
   /Lb5bTnDFUgkz2DkcZX/AfOhi3+HacsSajw62H6eenvlRIAaqx9Y0HxGU
   ZxrDM2m+yXPHnEv5Xhe5He/Gf+OW6/UcyNSZMhIMbkcaYgaghRla52rlU
   jC+xCFP8BqM0SCGM2hQTGSB1ejygrDSgpKtD/8BAq8xp4/Elzf6kkeH+q
   LBJk6PQ3EQmfwgf9yjjlxVyNXl4lEeunLigyXheWhI/DDu7HOF7mVeN+X
   w==;
X-CSE-ConnectionGUID: OQzIbstVQny5auCqDIIDFA==
X-CSE-MsgGUID: 4ed2eVohT6mcbt54bz6dag==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="78484663"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="78484663"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 12:33:54 -0700
X-CSE-ConnectionGUID: 66dJGiipQ8yhRXSCZ0/Alw==
X-CSE-MsgGUID: fjY5neZ+QVizaKHyRDQLtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="272937054"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2026 12:33:52 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Siz-000000000nB-3zvK;
	Wed, 23 Sep 2026 19:33:49 +0000
Date: Wed, 23 Sep 2026 21:33:19 +0200
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: lib/crypto/curve25519-fiat32.c:315 fe_mul_impl() warn:
 inconsistent indenting
Message-ID: <202609232149.hykFTsV9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: ed1767442d919f57aaf83d69c33853da2644d902 lib/crypto: tests: Introduce CRYPTO_LIB_ENABLE_ALL_FOR_KUNIT
date:   6 months ago
config: i386-randconfig-2200-20260923 (https://download.01.org/0day-ci/archive/20260923/202609232149.hykFTsV9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ed1767442d91 ("lib/crypto: tests: Introduce CRYPTO_LIB_ENABLE_ALL_FOR_KUNIT")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609232149.hykFTsV9-lkp@intel.com/

New smatch warnings:
lib/crypto/curve25519-fiat32.c:315 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:638 fe_mul_121666_impl() warn: inconsistent indenting

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
lib/crypto/curve25519-fiat32.c:272 fe_sub_impl() warn: inconsistent indenting
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

vim +315 lib/crypto/curve25519-fiat32.c

0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  311  
660bb8e1f833ea Ard Biesheuvel     2019-11-08  312  static noinline void fe_mul_impl(u32 out[10], const u32 in1[10], const u32 in2[10])
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  313  {
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  314  	{ const u32 x20 = in1[9];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08 @315  	{ const u32 x21 = in1[8];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  316  	{ const u32 x19 = in1[7];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  317  	{ const u32 x17 = in1[6];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  318  	{ const u32 x15 = in1[5];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  319  	{ const u32 x13 = in1[4];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  320  	{ const u32 x11 = in1[3];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  321  	{ const u32 x9 = in1[2];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  322  	{ const u32 x7 = in1[1];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  323  	{ const u32 x5 = in1[0];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  324  	{ const u32 x38 = in2[9];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  325  	{ const u32 x39 = in2[8];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  326  	{ const u32 x37 = in2[7];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  327  	{ const u32 x35 = in2[6];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  328  	{ const u32 x33 = in2[5];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  329  	{ const u32 x31 = in2[4];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  330  	{ const u32 x29 = in2[3];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  331  	{ const u32 x27 = in2[2];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  332  	{ const u32 x25 = in2[1];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  333  	{ const u32 x23 = in2[0];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  334  	{ u64 x40 = ((u64)x23 * x5);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  335  	{ u64 x41 = (((u64)x23 * x7) + ((u64)x25 * x5));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  336  	{ u64 x42 = ((((u64)(0x2 * x25) * x7) + ((u64)x23 * x9)) + ((u64)x27 * x5));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  337  	{ u64 x43 = (((((u64)x25 * x9) + ((u64)x27 * x7)) + ((u64)x23 * x11)) + ((u64)x29 * x5));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  338  	{ u64 x44 = (((((u64)x27 * x9) + (0x2 * (((u64)x25 * x11) + ((u64)x29 * x7)))) + ((u64)x23 * x13)) + ((u64)x31 * x5));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  339  	{ u64 x45 = (((((((u64)x27 * x11) + ((u64)x29 * x9)) + ((u64)x25 * x13)) + ((u64)x31 * x7)) + ((u64)x23 * x15)) + ((u64)x33 * x5));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  340  	{ u64 x46 = (((((0x2 * ((((u64)x29 * x11) + ((u64)x25 * x15)) + ((u64)x33 * x7))) + ((u64)x27 * x13)) + ((u64)x31 * x9)) + ((u64)x23 * x17)) + ((u64)x35 * x5));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  341  	{ u64 x47 = (((((((((u64)x29 * x13) + ((u64)x31 * x11)) + ((u64)x27 * x15)) + ((u64)x33 * x9)) + ((u64)x25 * x17)) + ((u64)x35 * x7)) + ((u64)x23 * x19)) + ((u64)x37 * x5));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  342  	{ u64 x48 = (((((((u64)x31 * x13) + (0x2 * (((((u64)x29 * x15) + ((u64)x33 * x11)) + ((u64)x25 * x19)) + ((u64)x37 * x7)))) + ((u64)x27 * x17)) + ((u64)x35 * x9)) + ((u64)x23 * x21)) + ((u64)x39 * x5));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  343  	{ u64 x49 = (((((((((((u64)x31 * x15) + ((u64)x33 * x13)) + ((u64)x29 * x17)) + ((u64)x35 * x11)) + ((u64)x27 * x19)) + ((u64)x37 * x9)) + ((u64)x25 * x21)) + ((u64)x39 * x7)) + ((u64)x23 * x20)) + ((u64)x38 * x5));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  344  	{ u64 x50 = (((((0x2 * ((((((u64)x33 * x15) + ((u64)x29 * x19)) + ((u64)x37 * x11)) + ((u64)x25 * x20)) + ((u64)x38 * x7))) + ((u64)x31 * x17)) + ((u64)x35 * x13)) + ((u64)x27 * x21)) + ((u64)x39 * x9));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  345  	{ u64 x51 = (((((((((u64)x33 * x17) + ((u64)x35 * x15)) + ((u64)x31 * x19)) + ((u64)x37 * x13)) + ((u64)x29 * x21)) + ((u64)x39 * x11)) + ((u64)x27 * x20)) + ((u64)x38 * x9));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  346  	{ u64 x52 = (((((u64)x35 * x17) + (0x2 * (((((u64)x33 * x19) + ((u64)x37 * x15)) + ((u64)x29 * x20)) + ((u64)x38 * x11)))) + ((u64)x31 * x21)) + ((u64)x39 * x13));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  347  	{ u64 x53 = (((((((u64)x35 * x19) + ((u64)x37 * x17)) + ((u64)x33 * x21)) + ((u64)x39 * x15)) + ((u64)x31 * x20)) + ((u64)x38 * x13));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  348  	{ u64 x54 = (((0x2 * ((((u64)x37 * x19) + ((u64)x33 * x20)) + ((u64)x38 * x15))) + ((u64)x35 * x21)) + ((u64)x39 * x17));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  349  	{ u64 x55 = (((((u64)x37 * x21) + ((u64)x39 * x19)) + ((u64)x35 * x20)) + ((u64)x38 * x17));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  350  	{ u64 x56 = (((u64)x39 * x21) + (0x2 * (((u64)x37 * x20) + ((u64)x38 * x19))));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  351  	{ u64 x57 = (((u64)x39 * x20) + ((u64)x38 * x21));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  352  	{ u64 x58 = ((u64)(0x2 * x38) * x20);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  353  	{ u64 x59 = (x48 + (x58 << 0x4));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  354  	{ u64 x60 = (x59 + (x58 << 0x1));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  355  	{ u64 x61 = (x60 + x58);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  356  	{ u64 x62 = (x47 + (x57 << 0x4));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  357  	{ u64 x63 = (x62 + (x57 << 0x1));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  358  	{ u64 x64 = (x63 + x57);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  359  	{ u64 x65 = (x46 + (x56 << 0x4));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  360  	{ u64 x66 = (x65 + (x56 << 0x1));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  361  	{ u64 x67 = (x66 + x56);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  362  	{ u64 x68 = (x45 + (x55 << 0x4));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  363  	{ u64 x69 = (x68 + (x55 << 0x1));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  364  	{ u64 x70 = (x69 + x55);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  365  	{ u64 x71 = (x44 + (x54 << 0x4));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  366  	{ u64 x72 = (x71 + (x54 << 0x1));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  367  	{ u64 x73 = (x72 + x54);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  368  	{ u64 x74 = (x43 + (x53 << 0x4));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  369  	{ u64 x75 = (x74 + (x53 << 0x1));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  370  	{ u64 x76 = (x75 + x53);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  371  	{ u64 x77 = (x42 + (x52 << 0x4));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  372  	{ u64 x78 = (x77 + (x52 << 0x1));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  373  	{ u64 x79 = (x78 + x52);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  374  	{ u64 x80 = (x41 + (x51 << 0x4));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  375  	{ u64 x81 = (x80 + (x51 << 0x1));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  376  	{ u64 x82 = (x81 + x51);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  377  	{ u64 x83 = (x40 + (x50 << 0x4));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  378  	{ u64 x84 = (x83 + (x50 << 0x1));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  379  	{ u64 x85 = (x84 + x50);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  380  	{ u64 x86 = (x85 >> 0x1a);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  381  	{ u32 x87 = ((u32)x85 & 0x3ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  382  	{ u64 x88 = (x86 + x82);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  383  	{ u64 x89 = (x88 >> 0x19);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  384  	{ u32 x90 = ((u32)x88 & 0x1ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  385  	{ u64 x91 = (x89 + x79);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  386  	{ u64 x92 = (x91 >> 0x1a);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  387  	{ u32 x93 = ((u32)x91 & 0x3ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  388  	{ u64 x94 = (x92 + x76);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  389  	{ u64 x95 = (x94 >> 0x19);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  390  	{ u32 x96 = ((u32)x94 & 0x1ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  391  	{ u64 x97 = (x95 + x73);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  392  	{ u64 x98 = (x97 >> 0x1a);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  393  	{ u32 x99 = ((u32)x97 & 0x3ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  394  	{ u64 x100 = (x98 + x70);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  395  	{ u64 x101 = (x100 >> 0x19);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  396  	{ u32 x102 = ((u32)x100 & 0x1ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  397  	{ u64 x103 = (x101 + x67);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  398  	{ u64 x104 = (x103 >> 0x1a);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  399  	{ u32 x105 = ((u32)x103 & 0x3ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  400  	{ u64 x106 = (x104 + x64);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  401  	{ u64 x107 = (x106 >> 0x19);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  402  	{ u32 x108 = ((u32)x106 & 0x1ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  403  	{ u64 x109 = (x107 + x61);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  404  	{ u64 x110 = (x109 >> 0x1a);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  405  	{ u32 x111 = ((u32)x109 & 0x3ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  406  	{ u64 x112 = (x110 + x49);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  407  	{ u64 x113 = (x112 >> 0x19);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  408  	{ u32 x114 = ((u32)x112 & 0x1ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  409  	{ u64 x115 = (x87 + (0x13 * x113));
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  410  	{ u32 x116 = (u32) (x115 >> 0x1a);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  411  	{ u32 x117 = ((u32)x115 & 0x3ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  412  	{ u32 x118 = (x116 + x90);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  413  	{ u32 x119 = (x118 >> 0x19);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  414  	{ u32 x120 = (x118 & 0x1ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  415  	out[0] = x117;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  416  	out[1] = x120;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  417  	out[2] = (x119 + x93);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  418  	out[3] = x96;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  419  	out[4] = x99;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  420  	out[5] = x102;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  421  	out[6] = x105;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  422  	out[7] = x108;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  423  	out[8] = x111;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  424  	out[9] = x114;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  425  	}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  426  }
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  427  

:::::: The code at line 315 was first introduced by commit
:::::: 0ed42a6f431e930b2e8fae21955406e09fe75d70 crypto: curve25519 - generic C library implementations

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
