Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846322;
	b=LBz3XrZ0RKEAdAUadAiSGtVMu4Fdn8bCSq+6bzikuWv8TKgRgs8np0tgP3wN2LxesQsw
	 CE0xoDlAq5S1dhWX3LU2QH9ZOE6XZiXWZYlLn0g7UvHyDi3U6Ewe8xYdJUslpksaJda9t
	 kXpNKR9jLYclapyKXKH415obF8BYGjehu22Ed5JiiRnMVFCJiXcuu7EnMakruv/QPSpbJ
	 QRVQAhADvAKc/qP0Y8vvkdKRGmqUbQKtOwxE8EpoC2/JbijSkbikrwIZksjX2YDeuT+MC
	 4CvpL8xcjF5LCpRJ3WqoWXrM7ytmfkY3P21z2anVFXHE/gNDHLh+bRRvauNm2jd8/5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846322;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Owf9XUNd00WhrvxRkjSR8nMAd1e7fEWIc20Fa4z88JQ=;
	b=cq8gYOz5x7pLNsO1WUmnhk9a6IqugRd8Zd4KHrvvHlB5ecMEiIZvNvuhoz4ZzIXjf17h
	 dfD/0UFfZlLjmiA5o1RTBf+FeVcrD7bs6ZnVKbE9v28nFM9Ac5Z9TJHYWt5peLG44aSWj
	 fKX70XpNP1ID1etHcneXBCAKDdYsXrqlw0riqALe0jf3tYIui6OMlVhADlt32MJdPpZM0
	 Le4pDPcU8W5+GwP7SrZ6aYkEFU65wO3WcfnwVGiO5nsZ0QXe3Zi8QzLWlWlccr4NvYyj1
	 srOVFcBQ5ESRmyYc4pV0y1GllpZZDp4g32aR6F+Sa5DANOcMX0mkEuXoFzPpF0tZfvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZB4HznEA;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCB0606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CCB0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZB4HznEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794846322; x=1826382322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zq/0cVXACAhVV1O2zrEpFTBhCFeoln5zUktT7z+NI5Q=;
  b=ZB4HznEALPbtU3lLtV71t16sPCnmngANOSgQpoC/idKVH9EVkqyNKnm7
   4pTV8BH7QHmk+eK10MXwqcusltF9Jj4mOKS/xQIJuZ/ZvyFdOoZEtKGy8
   55DjN90LoMSxlr6YdcelRC/BmU7hQHFKHsF8T++FKhI+q37D7SQdwA7WX
   jL5O7qA8J+vVbopaoHUjSFqqNc6DBdb5lqW7lfGgZHzw8L0oGLmX3X2qr
   Or+gpocTsvkecchKYhcNja9uppSv8WZMAG5NOb31joIxhINfUqNkUF97r
   vhk4sICxcnekT5JPNhQmz3IwnFMLhMO+AOF5cv7j7zm8bajY0vbfZmPMq
   g==;
X-CSE-ConnectionGUID: M7pcRdTCSUKJry81DWZAYA==
X-CSE-MsgGUID: NnqAh54aStaOke1jXg7/AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3510031"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3510031"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 08:25:21 -0800
X-CSE-ConnectionGUID: yHe9RphfTpil+Sr7ndTo+A==
X-CSE-MsgGUID: 2K8F7cAKS2GT+qLfrgyqhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9785125"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Nov 2026 08:25:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSzW8-000000018yK-1SGL;
	Mon, 16 Nov 2026 16:25:16 +0000
Date: Tue, 17 Nov 2026 00:24:35 +0800
From: kernel test robot <lkp@intel.com>
To: huang zheng <huangzheng9869@gmail.com>, jaegeuk@kernel.org,
	chao@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, huangzheng1@xiaomi.com,
	Huang Zheng <huangzheng9869@gmail.com>
Subject: Re: [PATCH v2] f2fs: add checkpoint step timing statistics to debugfs
Message-ID: <202611170005.Q9ISJ71Q-lkp@intel.com>
References: <20261116095011.2868219-1-huangzheng9869@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116095011.2868219-1-huangzheng9869@gmail.com>

Hi huang,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev linus/master v7.4-rc3 next-20261113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/huang-zheng/f2fs-add-checkpoint-step-timing-statistics-to-debugfs/20261116-175011
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20261116095011.2868219-1-huangzheng9869%40gmail.com
patch subject: [PATCH v2] f2fs: add checkpoint step timing statistics to debugfs
config: i386-buildonly-randconfig-1000-20261116 (https://download.01.org/0day-ci/archive/20261117/202611170005.Q9ISJ71Q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170005.Q9ISJ71Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170005.Q9ISJ71Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/checkpoint.c: In function 'check_cp_time':
>> fs/f2fs/checkpoint.c:1744:17: error: implicit declaration of function 'update_cp_stats'; did you mean 'update_ckpt_flags'? [-Wimplicit-function-declaration]
    1744 |                 update_cp_stats(sbi, cpc);
         |                 ^~~~~~~~~~~~~~~
         |                 update_ckpt_flags


vim +1744 fs/f2fs/checkpoint.c

  1732	
  1733	static inline void check_cp_time(struct f2fs_sb_info *sbi, struct cp_control *cpc)
  1734	{
  1735		unsigned long long sb_diff, cur_diff;
  1736		enum cp_time ct;
  1737	
  1738		sb_diff = (u64)ktime_ms_delta(sbi->cp_stats.times[CP_TIME_END],
  1739						sbi->cp_stats.times[CP_TIME_START]);
  1740		cur_diff = (u64)ktime_ms_delta(cpc->stats.times[CP_TIME_END],
  1741						cpc->stats.times[CP_TIME_START]);
  1742	
  1743		if (cur_diff > sb_diff) {
> 1744			update_cp_stats(sbi, cpc);
  1745			if (cur_diff < CP_LONG_LATENCY_THRESHOLD)
  1746				return;
  1747	
  1748			f2fs_warn(sbi, "checkpoint was blocked for %llu ms", cur_diff);
  1749			for (ct = CP_TIME_START; ct < CP_TIME_MAX - 1; ct++)
  1750				f2fs_warn(sbi, "Step#%d: %llu ms", ct,
  1751					(u64)ktime_ms_delta(cpc->stats.times[ct + 1],
  1752							cpc->stats.times[ct]));
  1753		}
  1754	}
  1755	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
