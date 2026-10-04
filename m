Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EA222126C
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117225; cv=none; b=SVa/WcuSZdnKhUgfGTH/n4Bz+yfvWFwIRth4A9dIZaO9Jhy7EuvCUZ8oNHyzNmyv4da7e10/ju14EwUatdmg5wZsij16lOcpDRuPxMI3oLhs4ts7qjiMQmt9uPdffnSvok7RF4/9pNGGLB4VpOW0qYHK9nsaDVT9tHXxksy/ekg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117225; c=relaxed/simple;
	bh=s3YxXS+2yb3yIVQdqR9UufwN5fbh3NH8+SJQatGEj7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZvlPCp6mn6VbC8oI3e/5KFUqgVwLayLCZTED+gF+Qk0pDUpijRjUv8rozjfzAoOpbCd8whGWgxAmClZpJRadZWTi8zosU6ZmkuzZjnmc7fihhthwuZ3D9k885w1x3UZocHBDWtFmVSbeDbF1XiqYMdIcTFSC+9oEe6BUheKbn3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXZwkzHO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXZwkzHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791117223; x=1822653223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s3YxXS+2yb3yIVQdqR9UufwN5fbh3NH8+SJQatGEj7c=;
  b=lXZwkzHOXHj/PvAl9IVm5vwyJtFnHtTEjtMiO70iTDBqiEkNfKHFJvMy
   D+Gw0v+OEN8M10Um9OwTD7ildvyG1L6f0VPsyoPIARXIclSaXWhk9+nU/
   D/8c2UjAum+qjJgywZ0TTr/swHSpCWnxYPDxfG/L7LwjsqOFyGy3oviSy
   7qnIGlhngq8iRW4JpBgi3lVrJpFdvkJuUcl4RRK+zLGmHYRqF4SlGGMAo
   /nA4wYoCrv7n/VVjwvPBks9J2uoWSllJrvIG0Oh1UgK2fBACdNNM1yNRQ
   JqkVkC+xVN3vP1MZne53rtO6bnCDXkEJg+j248gsZiFmISTFoWRCzVtCO
   A==;
X-CSE-ConnectionGUID: fMDX/TpNS3GJImCMHlZq/Q==
X-CSE-MsgGUID: OXYn8gprR7q606rjlP64ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90665284"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="90665284"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 05:33:43 -0700
X-CSE-ConnectionGUID: kidfGGn/RUmVINPG12Z2IQ==
X-CSE-MsgGUID: YAiqQh+VTW+8N5751PRwdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="275779200"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 04 Oct 2026 05:33:41 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDLPO-000000000Hz-3EnI;
	Sun, 04 Oct 2026 12:33:38 +0000
Date: Sun, 04 Oct 2026 14:33:32 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 David Gow <davidgow@google.com>
Subject: drivers/clk/bcm/clk-bcm2835.c:952:1-7: WARNING: do_div()
 does a 64-by-32 division, please consider using div64_ul instead.
Message-ID: <202610041410.n4VXsQjz-lkp@intel.com>
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
head:   6addb4f385570ebc11c4eb499a4f1c149f313e84
commit: 031cdd3bc3f369553933c1b0f4cb18000162c8ff kunit: Enable PCI on UML without triggering WARN()
date:   1 year, 1 month ago
config: um-randconfig-r2104-20261004 (https://download.01.org/0day-ci/archive/20261004/202610041410.n4VXsQjz-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610041410.n4VXsQjz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/bcm/clk-bcm2835.c:952:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
   drivers/clk/bcm/clk-bcm2835.c:554:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
--
>> drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:327:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
--
>> drivers/watchdog/rti_wdt.c:187:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
   drivers/watchdog/rti_wdt.c:279:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
--
>> drivers/gpu/drm/tegra/output.c:167:8-28: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/gpu/drm/kmb/kmb_drv.c:520:2-8: ERROR: missing put_device; call of_find_device_by_node on line 507, but without a corresponding object release within this function.
   drivers/gpu/drm/kmb/kmb_drv.c:523:2-8: ERROR: missing put_device; call of_find_device_by_node on line 507, but without a corresponding object release within this function.
   drivers/gpu/drm/kmb/kmb_drv.c:530:2-8: ERROR: missing put_device; call of_find_device_by_node on line 507, but without a corresponding object release within this function.
   drivers/gpu/drm/kmb/kmb_drv.c:580:1-7: ERROR: missing put_device; call of_find_device_by_node on line 507, but without a corresponding object release within this function.
--
>> drivers/gpu/drm/panthor/panthor_heap.c:404:28-33: ERROR: invalid reference to the index variable of the iterator on line 392

vim +952 drivers/clk/bcm/clk-bcm2835.c

41691b8862e2a3 Eric Anholt   2015-10-08  940  
41691b8862e2a3 Eric Anholt   2015-10-08  941  static u32 bcm2835_clock_choose_div(struct clk_hw *hw,
41691b8862e2a3 Eric Anholt   2015-10-08  942  				    unsigned long rate,
8ca011ef4af48a Maxime Ripard 2021-09-22  943  				    unsigned long parent_rate)
41691b8862e2a3 Eric Anholt   2015-10-08  944  {
41691b8862e2a3 Eric Anholt   2015-10-08  945  	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
41691b8862e2a3 Eric Anholt   2015-10-08  946  	const struct bcm2835_clock_data *data = clock->data;
9c95b32ca09364 Remi Pommarel 2015-12-06  947  	u32 unused_frac_mask =
9c95b32ca09364 Remi Pommarel 2015-12-06  948  		GENMASK(CM_DIV_FRAC_BITS - data->frac_bits, 0) >> 1;
41691b8862e2a3 Eric Anholt   2015-10-08  949  	u64 temp = (u64)parent_rate << CM_DIV_FRAC_BITS;
959ca92a3235fc Martin Sperl  2016-02-29  950  	u32 div, mindiv, maxdiv;
41691b8862e2a3 Eric Anholt   2015-10-08  951  
88110a9f6209be Stefan Wahren 2022-04-28 @952  	do_div(temp, rate);
41691b8862e2a3 Eric Anholt   2015-10-08  953  	div = temp;
41691b8862e2a3 Eric Anholt   2015-10-08  954  	div &= ~unused_frac_mask;
41691b8862e2a3 Eric Anholt   2015-10-08  955  
959ca92a3235fc Martin Sperl  2016-02-29  956  	/* different clamping limits apply for a mash clock */
959ca92a3235fc Martin Sperl  2016-02-29  957  	if (data->is_mash_clock) {
959ca92a3235fc Martin Sperl  2016-02-29  958  		/* clamp to min divider of 2 */
959ca92a3235fc Martin Sperl  2016-02-29  959  		mindiv = 2 << CM_DIV_FRAC_BITS;
959ca92a3235fc Martin Sperl  2016-02-29  960  		/* clamp to the highest possible integer divider */
959ca92a3235fc Martin Sperl  2016-02-29  961  		maxdiv = (BIT(data->int_bits) - 1) << CM_DIV_FRAC_BITS;
959ca92a3235fc Martin Sperl  2016-02-29  962  	} else {
997f16bd5d2e9b Martin Sperl  2016-02-29  963  		/* clamp to min divider of 1 */
959ca92a3235fc Martin Sperl  2016-02-29  964  		mindiv = 1 << CM_DIV_FRAC_BITS;
997f16bd5d2e9b Martin Sperl  2016-02-29  965  		/* clamp to the highest possible fractional divider */
959ca92a3235fc Martin Sperl  2016-02-29  966  		maxdiv = GENMASK(data->int_bits + CM_DIV_FRAC_BITS - 1,
959ca92a3235fc Martin Sperl  2016-02-29  967  				 CM_DIV_FRAC_BITS - data->frac_bits);
959ca92a3235fc Martin Sperl  2016-02-29  968  	}
959ca92a3235fc Martin Sperl  2016-02-29  969  
959ca92a3235fc Martin Sperl  2016-02-29  970  	/* apply the clamping  limits */
959ca92a3235fc Martin Sperl  2016-02-29  971  	div = max_t(u32, div, mindiv);
959ca92a3235fc Martin Sperl  2016-02-29  972  	div = min_t(u32, div, maxdiv);
41691b8862e2a3 Eric Anholt   2015-10-08  973  
41691b8862e2a3 Eric Anholt   2015-10-08  974  	return div;
41691b8862e2a3 Eric Anholt   2015-10-08  975  }
41691b8862e2a3 Eric Anholt   2015-10-08  976  

:::::: The code at line 952 was first introduced by commit
:::::: 88110a9f6209be1ed7312bae029d000bc7c7e88f clk: bcm2835: fix bcm2835_clock_choose_div

:::::: TO: Stefan Wahren <stefan.wahren@i2se.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
