Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9712D3EF2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789089068; cv=none; b=LDP2PutBfNAJTS1LvhbU0Kgga2EZEpq4hNWUg1m01OwnaBUIvXkrBV4CRU0DNKC6OdksaOhrF7UqvA64iyN6nKY4t5FUhz9OTqVvbnwBJhhc0qBABOnUG9Ew+yOT1jet9Sb1OwUt48QFDEwYuJIKriWez8B7MgcNPgSq+TyULrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789089068; c=relaxed/simple;
	bh=SGFQw5T4GTfcI1EuGOBU8OVEfPGCIxkX6yDDB4/jSJI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BrVhtiF0aNohj0eliEwGt2p605nBoVaD35oK1KsfxxMPZJ19UqxDvuLCrLivBBlLujIbTLfrDfUgdHmSvI34iQ0/7sBuDwUD7p/tTw4zWuwVSnL0KwGtBQ3n6ysdjwJm5ILYEZIAfCPoqv0W+ymzU4VQLteOWDjS4CeJ9vggYks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N59QXMCZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N59QXMCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789089065; x=1820625065;
  h=date:from:to:cc:subject:message-id;
  bh=SGFQw5T4GTfcI1EuGOBU8OVEfPGCIxkX6yDDB4/jSJI=;
  b=N59QXMCZTkXiM1JXkbsjYIDbYU9Pr+3RK6oZCiX6LwNNqGbFAb8bXykq
   oIwc/zC1yVRiuTPSkzptdxul8G1JoIPOXoZj2mm8LeX2mDnMH5f5OIT0o
   dIVADlu6qKeYnzi9G/EqDB7MrsjI00AbFiM46D20OcskNudEJYFLKpQS3
   f8aWz3lNf0zZ/Li8CWD0tGQL1AWu0SEwmDsBEAPZCTH/cMOlzv6VYpSXL
   aNWBYsYp304IEFxRfipJhDIYUYzMJ7tMRVCanZBC6ljs8vF4R7GFlWNnp
   7tCPYZd0+1wnhaR/2czcrj3sjubvz1Xp7vBcBG7Kb4Qtd2OUO7zJnZSj7
   w==;
X-CSE-ConnectionGUID: vYyBsYaaSAOcNIUFmdXAjg==
X-CSE-MsgGUID: 7auWYp+gRni/4mlhh54tPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100212503"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="100212503"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 18:11:03 -0700
X-CSE-ConnectionGUID: u8J9HXNWSTm9ZaamaluNUg==
X-CSE-MsgGUID: K+k39xyxTRqT/s4zMtVAcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="296775407"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 10 Sep 2026 18:11:01 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4pmw-000000000lV-07UB;
	Fri, 11 Sep 2026 01:10:51 +0000
Date: Fri, 11 Sep 2026 09:08:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Eric Biggers <ebiggers@kernel.org>
Subject: block/blk-crypto-fallback.c:154:17: sparse: sparse: cast
 from restricted blk_status_t
Message-ID: <202609110908.msNNCmDo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08df884136f1c1197bab2a27814404fd329d9aac
commit: b37fbce460ad60b0c4449c1c7566cf24f3016713 blk-crypto: optimize bio splitting in blk_crypto_fallback_encrypt_bio
date:   8 months ago
config: csky-randconfig-r113-20260910 (https://download.01.org/0day-ci/archive/20260911/202609110908.msNNCmDo-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110908.msNNCmDo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b37fbce460ad ("blk-crypto: optimize bio splitting in blk_crypto_fallback_encrypt_bio")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110908.msNNCmDo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-crypto-fallback.c:154:17: sparse: sparse: cast from restricted blk_status_t
   block/blk-crypto-fallback.c:154:17: sparse: sparse: cast to restricted blk_status_t

vim +154 block/blk-crypto-fallback.c

   143	
   144	static void blk_crypto_fallback_encrypt_endio(struct bio *enc_bio)
   145	{
   146		struct bio *src_bio = enc_bio->bi_private;
   147		int i;
   148	
   149		for (i = 0; i < enc_bio->bi_vcnt; i++)
   150			mempool_free(enc_bio->bi_io_vec[i].bv_page,
   151				     blk_crypto_bounce_page_pool);
   152	
   153		if (enc_bio->bi_status)
 > 154			cmpxchg(&src_bio->bi_status, 0, enc_bio->bi_status);
   155	
   156		bio_put(enc_bio);
   157		bio_endio(src_bio);
   158	}
   159	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
