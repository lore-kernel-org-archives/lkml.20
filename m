Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8319C48BD54
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783523; cv=none; b=R33CbCCZy9Ikl2Xd3xkUh2NKdZKdCGdcmbJNWq5eYCO0efYsu6YFd8keAebrzM9mzVpfyIE9n+3RW/u0lHnaI0+OgP90ltxrCkXWIl04vev8nudw/j1IFaxK0qQPeBHjFpvTZS9hcTIG6OiE8FWvHuKDMUO3Y4mdmaCxufBR51w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783523; c=relaxed/simple;
	bh=Fb5sB2GgvvytgwxfMGXZOeuTJwPWFAuBgW8qJrNAIWY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tnunx+sDOsYoI8jKKSwapYxB5wfe636ROV62EYPpUe8XhKjSBeKIkByzbqqU41OKcBfPFUWdaTEVIj6b7pSeGqKBpGBzgp/EVgTxA1sgLiYKvhfZcF+X4I30eaGBZ9zq9HDVED9yX2XJAYrD/7J2t8JApOjVivZEqf7Yc7S8FJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBRcnmk0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBRcnmk0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788783522; x=1820319522;
  h=date:from:to:cc:subject:message-id;
  bh=Fb5sB2GgvvytgwxfMGXZOeuTJwPWFAuBgW8qJrNAIWY=;
  b=eBRcnmk0R05dyyDduNSsbE6CbSPDn0x1oF+5aa0/2ihCAc93VjHq7fBs
   ZmR+prJbMbFvX5VuqoRy3AllrJHmBdjOmKKbaE0e/3nDdG0oeScUs7rvz
   trBseMTVxj2Ols+DYBd9kiGclrspcC2mQWOYIhNm4/WstzjbVRT0ZumlD
   AhXooBtkF9saWbsGK4HFtiKQ8mavexpawfcgtmVY7j0w5FpAO4xg7+n+j
   rIEv+IlXefVV9nw7VZMmQh9TxnPMvSaJTP/VA1P1M7yr8PLUl1MKnTw+Y
   pTSJaK8WyoS/mAjOJ4VXLkqMf5Nz4lOm1U7Je24xBMJ0g0CqJjFrOuRU1
   w==;
X-CSE-ConnectionGUID: fbKtN3QvTKiUdH64I9PImA==
X-CSE-MsgGUID: pN+2fWXsT42BcQYpQL/rKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="111961942"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="111961942"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 05:18:42 -0700
X-CSE-ConnectionGUID: X0p+3rZnQw+WcCYMTxA71Q==
X-CSE-MsgGUID: N6tmbH+PQZCJmTWtvjy4Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="268965048"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Sep 2026 05:18:39 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3YJ2-000000000sd-3I70;
	Mon, 07 Sep 2026 12:18:36 +0000
Date: Mon, 07 Sep 2026 20:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: Lachlan Hodges <lachlan.hodges@morsemicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Pope <andrew.pope@morsemicro.com>,
 Arien Judge <arien.judge@morsemicro.com>,
 Ayman Grais <ayman.grais@morsemicro.com>,
 Bassem Dawood <bassem@morsemicro.com>,
 Chetan Mistry <chetan.mistry@morsemicro.com>,
 Dan Callaghan <dan.callaghan@morsemicro.com>,
 James Herbert <james.herbert@morsemicro.com>,
 Sahand Maleki <sahand.maleki@morsemicro.com>,
 Simon Wadsworth <simon@morsemicro.com>
Subject: {standard input}:188: Error: Insn b has an instruction mpyuw
 with limm in its delay slot.
Message-ID: <202609072054.dPv2m6o3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Lachlan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   df2908090cda368b01ff43709f51890076c56157
commit: b1906cea00b021acea22460225401d5b27bc7c36 wifi: mm81x: add mm81x Wi-Fi HaLow driver
date:   9 weeks ago
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260907/202609072054.dPv2m6o3-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609072054.dPv2m6o3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b1906cea00b0 ("wifi: mm81x: add mm81x Wi-Fi HaLow driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609072054.dPv2m6o3-lkp@intel.com/

All errors (new ones prefixed by >>):

   Assembler messages:
>> {standard input}:188: Error: Insn b has an instruction mpyuw with limm in its delay slot.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
