Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27308556BB1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091980; cv=none; b=CLqx14IoQgZ45535+6RU2tVUbIkt92JHOLyRTwrCkXx3c550CnC4O59fWkGTJXeb1wGte49u6yLciP3IpnC00GPEG4FTBezec1nYfvkibGdLllU7GORW4IzRemP65Lxtk+TI31oAKg0T583BTBDoWS+B+J/sWJbt1gAEaC/ioAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091980; c=relaxed/simple;
	bh=8FhZsC65X6YI33LYK+hRK5dPuguChkgBFrALY2BTl5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kySXh5oI6ubYZnbjUfstlLmKSLzZslJajpxCG5MmLxKUycJqpWC6EfR+7qgbhmzuAsNfWPoojkLdEnkpY1eam8O++R38dgp0tJcKeRHjAsxSXaVeFDGw3bxf+79sRWL9qf2IfGjqlfa3tUg+kX7pCvDXXrPYuIni0kYT7gtTpGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AijspE9R; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AijspE9R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790091976; x=1821627976;
  h=date:from:to:cc:subject:message-id;
  bh=8FhZsC65X6YI33LYK+hRK5dPuguChkgBFrALY2BTl5k=;
  b=AijspE9RQjgcbHyPVgvgLQn9pxZMA1Sd75R+AiOjixGQQshSzuRcVa5h
   +Qs1RXmcVGKsmof68fxgqfXJMwaAfsbGMD3/U8P5MhHGrYDh/r86racty
   SsuIW3AvFFW8myiMg7vs2tZtwVIXxMiWOaczckMAYCQX71mNroNAmdMx2
   vntmRtdzBgOPNkZ7xBSoz2CdoWa6XdB/o4fzz0PIz2v5SGd5ASjpBoRL8
   Hq6pHMpOdUdMHEmceLdxzSyS8ilr6/m6fR48/iQygR+viljC5riuCSFjA
   Hv+K20OIt3JrwUDw6fXnoysGOibODtBYvUke4GVMEiQQHuZTqHdl0p3Vp
   g==;
X-CSE-ConnectionGUID: O5vF5lAlT+WpTX807doRnQ==
X-CSE-MsgGUID: jy4VSy5UTTq2OADu9ht5IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90731512"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="90731512"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 08:46:14 -0700
X-CSE-ConnectionGUID: efiyjAHmSrCmA9fr/CcPIQ==
X-CSE-MsgGUID: PdRqS7BBQIS9VRecHiErLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="272389142"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Sep 2026 08:46:11 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x92h7-00000000Ff0-0XD6;
	Tue, 22 Sep 2026 15:46:09 +0000
Date: Tue, 22 Sep 2026 23:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@kernel.org>,
 Md Haris Iqbal <haris.iqbal@linux.dev>
Subject: block/blk-core.c:141:33: sparse: sparse: cast to restricted
 blk_opf_t
Message-ID: <202609222319.5RyqLCpp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: d39a63ead381c7ee93cd938ea2d759c17343b522 block: add a str_to_blk_op helper
date:   3 months ago
config: x86_64-randconfig-1300-20260922 (https://download.01.org/0day-ci/archive/20260922/202609222319.5RyqLCpp-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609222319.5RyqLCpp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d39a63ead381 ("block: add a str_to_blk_op helper")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609222319.5RyqLCpp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-core.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/block.h):
   include/trace/events/block.h:244:1: sparse: sparse: restricted blk_mq_req_flags_t degrades to integer
   block/blk-core.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, include/trace/events/block.h):
   include/trace/events/block.h:244:1: sparse: sparse: restricted blk_mq_req_flags_t degrades to integer
>> block/blk-core.c:141:33: sparse: sparse: cast to restricted blk_opf_t

vim +141 block/blk-core.c

   134	
   135	enum req_op str_to_blk_op(const char *op)
   136	{
   137		int i;
   138	
   139		for (i = 0; i < ARRAY_SIZE(blk_op_name); i++)
   140			if (blk_op_name[i] && !strcmp(blk_op_name[i], op))
 > 141				return (enum req_op)i;
   142		return REQ_OP_LAST;
   143	}
   144	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
