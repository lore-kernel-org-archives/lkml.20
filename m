Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9995D38D3E2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790831142; cv=none; b=Y+E8OgABux1xZB6fDPpvXCZI7BDCLjPqwCDHqwANjnxIBkEqQDvEdPQiaWIndrHBLInq2z/mzSm+i4hOMiUTVFISBjE93cAoL504ziRn7TE8CO9bx6qR0xvCtFepu6XRC0kk3umI9OVOVW6NCxFsli7MmKv3asb5mDV8qkxVffk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790831142; c=relaxed/simple;
	bh=un/73Qze39dy9Af6XIGl6njiSxf7J+nml847NDR2bS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UXwzm9HRUaoT3omI8Bjd6iazFeQ/UDNcMjPB4PdlZm4zZM8hC5XOr5qWs+YHvxNYvlhpNg4yLdjFHJYQsvoN4gfLX9zJGN7wgGXL77t6qJLH75ZVrnHMiy1XK/1KgrsAqs6VMKFJ+QXjJjtCiQ7SP/AdrwAJhawFKCoC+WNGhRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZfEd00sF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZfEd00sF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790831139; x=1822367139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=un/73Qze39dy9Af6XIGl6njiSxf7J+nml847NDR2bS8=;
  b=ZfEd00sFU9r7FYzwLuSy2BuBwknWWyfDHYJ/VYg6puy8x/cwYnw6xUQP
   DiXCsbvreNis1WoTabRTclcrH6e7dlCwlaeslaKrhm+tuUAyMXD2cYyrg
   8ik1MjiLZjIh1Iu0SzC6l0a80w7NJTf3LgyU5BK1DVznRHHiJo7R+Ctka
   YOEc8L/fqWulVXpLRwpFVNYXC0ej9fP232NlN52QwFaBBV06z1p+xDeIi
   hMNa7CmujuWVY31kghwgM1IOlk5/sefQJoxvxiDNu+vBTU3Pux77PVjfe
   ldJMfd0G65mTsmeRO2F3rn5KQJweFFABw9YYx4bp/44y2H7hdtDbJd41Q
   w==;
X-CSE-ConnectionGUID: vkU9ONItRYyM/E4ZpXxBzg==
X-CSE-MsgGUID: demQo8V0S1KSpZCh/F49MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="94293247"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="94293247"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 22:05:38 -0700
X-CSE-ConnectionGUID: oY4uHIgYRdGU9/02QEd1tw==
X-CSE-MsgGUID: s16t+4ZvRuq6Jjwq9uO/Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="303817409"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2026 22:05:36 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC8z7-000000002FT-3qv0;
	Thu, 01 Oct 2026 05:05:33 +0000
Date: Thu, 01 Oct 2026 07:04:51 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 David Gow <davidgow@google.com>
Subject: drivers/clk/imx/clk-frac-pll.c:171:1-7: WARNING: do_div()
 does a 64-by-32 division, please consider using div64_ul instead.
Message-ID: <202610010618.W1vpHMMD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   551c722f40809618230001baccf219193e22fc5a
commit: 031cdd3bc3f369553933c1b0f4cb18000162c8ff kunit: Enable PCI on UML without triggering WARN()
date:   1 year, 1 month ago
config: um-randconfig-r2103-20261001 (https://download.01.org/0day-ci/archive/20261001/202610010618.W1vpHMMD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610010618.W1vpHMMD-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/imx/clk-frac-pll.c:171:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
>> drivers/clk/imx/clk-frac-pll.c:132:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
   drivers/clk/imx/clk-frac-pll.c:136:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
--
>> drivers/clk/imx/clk-pfd.c:95:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
--
>> drivers/clk/imx/clk-pfdv2.c:118:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
   drivers/clk/imx/clk-pfdv2.c:177:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
--
>> drivers/clk/imx/clk-pllv2.c:143:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
>> drivers/clk/imx/clk-pllv2.c:100:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_long instead.
--
>> drivers/clk/imx/clk-pllv4.c:111:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
   drivers/clk/imx/clk-pllv4.c:141:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
   drivers/clk/imx/clk-pllv4.c:201:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

vim +171 drivers/clk/imx/clk-frac-pll.c

6209624b9a5c1e Lucas Stach  2018-12-01  121  
6d50f953f75e76 Brian Masney 2025-07-10  122  static int clk_pll_determine_rate(struct clk_hw *hw,
6d50f953f75e76 Brian Masney 2025-07-10  123  				  struct clk_rate_request *req)
6209624b9a5c1e Lucas Stach  2018-12-01  124  {
6d50f953f75e76 Brian Masney 2025-07-10  125  	u64 parent_rate = req->best_parent_rate;
6209624b9a5c1e Lucas Stach  2018-12-01  126  	u32 divff, divfi;
6209624b9a5c1e Lucas Stach  2018-12-01  127  	u64 temp64;
6209624b9a5c1e Lucas Stach  2018-12-01  128  
6209624b9a5c1e Lucas Stach  2018-12-01  129  	parent_rate *= 8;
6d50f953f75e76 Brian Masney 2025-07-10  130  	req->rate *= 2;
6d50f953f75e76 Brian Masney 2025-07-10  131  	temp64 = req->rate;
6209624b9a5c1e Lucas Stach  2018-12-01 @132  	do_div(temp64, parent_rate);
6209624b9a5c1e Lucas Stach  2018-12-01  133  	divfi = temp64;
6d50f953f75e76 Brian Masney 2025-07-10  134  	temp64 = req->rate - divfi * parent_rate;
6209624b9a5c1e Lucas Stach  2018-12-01  135  	temp64 *= PLL_FRAC_DENOM;
6209624b9a5c1e Lucas Stach  2018-12-01  136  	do_div(temp64, parent_rate);
6209624b9a5c1e Lucas Stach  2018-12-01  137  	divff = temp64;
6209624b9a5c1e Lucas Stach  2018-12-01  138  
6209624b9a5c1e Lucas Stach  2018-12-01  139  	temp64 = parent_rate;
6209624b9a5c1e Lucas Stach  2018-12-01  140  	temp64 *= divff;
6209624b9a5c1e Lucas Stach  2018-12-01  141  	do_div(temp64, PLL_FRAC_DENOM);
6209624b9a5c1e Lucas Stach  2018-12-01  142  
6d50f953f75e76 Brian Masney 2025-07-10  143  	req->rate = parent_rate * divfi + temp64;
6d50f953f75e76 Brian Masney 2025-07-10  144  
6d50f953f75e76 Brian Masney 2025-07-10  145  	req->rate = req->rate / 2;
6209624b9a5c1e Lucas Stach  2018-12-01  146  
6d50f953f75e76 Brian Masney 2025-07-10  147  	return 0;
6209624b9a5c1e Lucas Stach  2018-12-01  148  }
6209624b9a5c1e Lucas Stach  2018-12-01  149  
6209624b9a5c1e Lucas Stach  2018-12-01  150  /*
6209624b9a5c1e Lucas Stach  2018-12-01  151   * To simplify the clock calculation, we can keep the 'PLL_OUTPUT_VAL' at zero
6209624b9a5c1e Lucas Stach  2018-12-01  152   * (means the PLL output will be divided by 2). So the PLL output can use
6209624b9a5c1e Lucas Stach  2018-12-01  153   * the below formula:
6209624b9a5c1e Lucas Stach  2018-12-01  154   * pllout = parent_rate * 8 / 2 * DIVF_VAL;
6209624b9a5c1e Lucas Stach  2018-12-01  155   * where DIVF_VAL = 1 + DIVFI + DIVFF / 2^24.
6209624b9a5c1e Lucas Stach  2018-12-01  156   */
6209624b9a5c1e Lucas Stach  2018-12-01  157  static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
6209624b9a5c1e Lucas Stach  2018-12-01  158  			    unsigned long parent_rate)
6209624b9a5c1e Lucas Stach  2018-12-01  159  {
6209624b9a5c1e Lucas Stach  2018-12-01  160  	struct clk_frac_pll *pll = to_clk_frac_pll(hw);
6209624b9a5c1e Lucas Stach  2018-12-01  161  	u32 val, divfi, divff;
a64a9c088b75cb Abel Vesa    2019-01-18  162  	u64 temp64;
6209624b9a5c1e Lucas Stach  2018-12-01  163  	int ret;
6209624b9a5c1e Lucas Stach  2018-12-01  164  
6209624b9a5c1e Lucas Stach  2018-12-01  165  	parent_rate *= 8;
6209624b9a5c1e Lucas Stach  2018-12-01  166  	rate *= 2;
6209624b9a5c1e Lucas Stach  2018-12-01  167  	divfi = rate / parent_rate;
a64a9c088b75cb Abel Vesa    2019-01-18  168  	temp64 = parent_rate * divfi;
a64a9c088b75cb Abel Vesa    2019-01-18  169  	temp64 = rate - temp64;
6209624b9a5c1e Lucas Stach  2018-12-01  170  	temp64 *= PLL_FRAC_DENOM;
6209624b9a5c1e Lucas Stach  2018-12-01 @171  	do_div(temp64, parent_rate);
6209624b9a5c1e Lucas Stach  2018-12-01  172  	divff = temp64;
6209624b9a5c1e Lucas Stach  2018-12-01  173  
6209624b9a5c1e Lucas Stach  2018-12-01  174  	val = readl_relaxed(pll->base + PLL_CFG1);
6209624b9a5c1e Lucas Stach  2018-12-01  175  	val &= ~(PLL_FRAC_DIV_MASK | PLL_INT_DIV_MASK);
6209624b9a5c1e Lucas Stach  2018-12-01  176  	val |= (divff << 7) | (divfi - 1);
6209624b9a5c1e Lucas Stach  2018-12-01  177  	writel_relaxed(val, pll->base + PLL_CFG1);
6209624b9a5c1e Lucas Stach  2018-12-01  178  
6209624b9a5c1e Lucas Stach  2018-12-01  179  	val = readl_relaxed(pll->base + PLL_CFG0);
6209624b9a5c1e Lucas Stach  2018-12-01  180  	val &= ~0x1f;
6209624b9a5c1e Lucas Stach  2018-12-01  181  	writel_relaxed(val, pll->base + PLL_CFG0);
6209624b9a5c1e Lucas Stach  2018-12-01  182  
6209624b9a5c1e Lucas Stach  2018-12-01  183  	/* Set the NEV_DIV_VAL to reload the DIVFI and DIVFF */
6209624b9a5c1e Lucas Stach  2018-12-01  184  	val = readl_relaxed(pll->base + PLL_CFG0);
6209624b9a5c1e Lucas Stach  2018-12-01  185  	val |= PLL_NEWDIV_VAL;
6209624b9a5c1e Lucas Stach  2018-12-01  186  	writel_relaxed(val, pll->base + PLL_CFG0);
6209624b9a5c1e Lucas Stach  2018-12-01  187  
6209624b9a5c1e Lucas Stach  2018-12-01  188  	ret = clk_wait_ack(pll);
6209624b9a5c1e Lucas Stach  2018-12-01  189  
6209624b9a5c1e Lucas Stach  2018-12-01  190  	/* clear the NEV_DIV_VAL */
6209624b9a5c1e Lucas Stach  2018-12-01  191  	val = readl_relaxed(pll->base + PLL_CFG0);
6209624b9a5c1e Lucas Stach  2018-12-01  192  	val &= ~PLL_NEWDIV_VAL;
6209624b9a5c1e Lucas Stach  2018-12-01  193  	writel_relaxed(val, pll->base + PLL_CFG0);
6209624b9a5c1e Lucas Stach  2018-12-01  194  
6209624b9a5c1e Lucas Stach  2018-12-01  195  	return ret;
6209624b9a5c1e Lucas Stach  2018-12-01  196  }
6209624b9a5c1e Lucas Stach  2018-12-01  197  

:::::: The code at line 171 was first introduced by commit
:::::: 6209624b9a5c1e417b142e9688f5fc96c1e0cd58 clk: imx: Add fractional PLL output clock

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
