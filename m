Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E3139A054
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270113; cv=none; b=RuKmlkMkuDSBir5nccYqt6awwqUrtZvaaVSmJc5MPp1tm96619xHltK5qx3TOiFff9lWrttA/SxpzUAYm5kboTe4nnjFf+HGYJCXFYzoD4ZoGWIdgv/XGydM1ARL5ivuLtQMmc1OtPCApSQUkvEPIfMktsYTS5bcul3xWibTVJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270113; c=relaxed/simple;
	bh=ef4X3KrThBCfzNj00N82Bs0EyfQsa2udrQuRrXWCqew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjJ4AjeWU47RrynFmWS+o6s7O9TVOZVmnwcHu4UXLiyNjAXFbBj4wZHC9Bx2k7ZMw8NUTwlO2D9vT2JCXaHSW06d5VtFoIOHMKzQY/Q986F5xjIFr3SW5p8Sa3qXSMYEq53f0UCrz5AxCLyKdSj8GM2vg3x0BjuwNLswqnVY1Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P40R3la+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P40R3la+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788270111; x=1819806111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ef4X3KrThBCfzNj00N82Bs0EyfQsa2udrQuRrXWCqew=;
  b=P40R3la+U/YCE+bU/LdXdx4wXOWeXW1dq1lMS09P2FqBCYkzutdCgKb5
   eJYlSvnVvJrzwq7QQSJ6MvAui1y/Bzw3T96D0GOuEzJ0j83DbtcAy/ZEA
   OmrxuSc2po8+2ohR+uWvJ3I5RQWHNcK5F4IA9sKena+LL/uxGwjrCfZHC
   L5OExneHZl59QLwEsVHGquMJpb14Rtt1bUsuM+CgkR4So6mzwxV20M7Aq
   rAw+aMGRHkUq9tooqMJpYpo31lRU/3prqPPHudE1RJiwXa2Hq9jDVXuLR
   R6hLHSrZHrxS3rhP3KYV3IKlrEuaXw+s2y+v/MwQ93Y8170ZoZSscxYsL
   w==;
X-CSE-ConnectionGUID: /nihVRgtRMCjmVXS3cd9NA==
X-CSE-MsgGUID: 8zzxVgFDQC67igajQsEz0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="106218178"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="106218178"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 06:41:51 -0700
X-CSE-ConnectionGUID: xF4XZyquQGWdm/NY+bcZhQ==
X-CSE-MsgGUID: Vi3SeTLPRMK1o+3SmmDfRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="268571051"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Sep 2026 06:41:46 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1OkB-000000000rE-2GDC;
	Tue, 01 Sep 2026 13:41:43 +0000
Date: Tue, 1 Sep 2026 21:41:34 +0800
From: kernel test robot <lkp@intel.com>
To: Bingfang Guo via B4 Relay <devnull+bingfangguo.tencent.com@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Bingfang Guo <bfguo@icloud.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/memcg: clear folio memcg after changing per memcg
 stats
Message-ID: <202609012136.TM23t7zi-lkp@intel.com>
References: <20260901-memcg-swapcache-stats-fix-v2-1-9caad330459b@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-memcg-swapcache-stats-fix-v2-1-9caad330459b@tencent.com>

Hi Bingfang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 88297631d4d42f6004cb39c0ba3da7d2d10a616f]

url:    https://github.com/intel-lab-lkp/linux/commits/Bingfang-Guo-via-B4-Relay/mm-memcg-clear-folio-memcg-after-changing-per-memcg-stats/20260901-144911
base:   88297631d4d42f6004cb39c0ba3da7d2d10a616f
patch link:    https://lore.kernel.org/r/20260901-memcg-swapcache-stats-fix-v2-1-9caad330459b%40tencent.com
patch subject: [PATCH v2] mm/memcg: clear folio memcg after changing per memcg stats
config: powerpc-randconfig-r071-20260901 (https://download.01.org/0day-ci/archive/20260901/202609012136.TM23t7zi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260901/202609012136.TM23t7zi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609012136.TM23t7zi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/swap_state.c:317 function parameter 'swapout' not described in '__swap_cache_del_folio'
>> Warning: mm/swap_state.c:317 function parameter 'swapout' not described in '__swap_cache_del_folio'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
