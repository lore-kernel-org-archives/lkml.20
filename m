Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3358F331EB4
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789891387; cv=none; b=G2OelNj4pySH9ktYDPLzfDLWvcGrVuCxjXetONqsLulJRqnqhCircyblWJIM8dDtOcAZWe51IucjNhRbdaawyFYsChAt/AnKEAzOeLIMBlEAikiuweX8TjF7Nae8XkXN4dnCUHTcaoCtRzUg0rsBISrvx9eP4YQw1lytXrS6ydI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789891387; c=relaxed/simple;
	bh=TJAUI38ifciPKKyxbLzNZ7tsLCml17RD1952LgaKqi8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZYULdW7UalFAX/j53fbkeUTZvkxOoZYVGEbhuQqktndBs1E0MZtCMCHnCPpJPlBQxFRjOuOSA7N8LZJRdcjWX8b41mRyAXGXIdzZ9LyPZpgp9yidMHRecU/OyDA/vPM5VcEfJVSetQxAIM1fU98lHCksYx8DL0NxnPjiJXIS1rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfRQlWZX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfRQlWZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789891386; x=1821427386;
  h=date:from:to:cc:subject:message-id;
  bh=TJAUI38ifciPKKyxbLzNZ7tsLCml17RD1952LgaKqi8=;
  b=jfRQlWZX+GHUWqQhZxGZwpiBYQkX5wrExus2OclAa1UKPifD0Jx9gdAC
   jLapRtmZxheqQx/LRc+vStGlMRc1s5940o8GmwkYA5ac8HHuTWzmTW/tC
   TI7fHyS1ovbXOKbv6YblCNuhxVjAz4ccYnUeeyijPCg8EaujfNW6NXs1B
   OogyG7tiNJFINS/riyhfnJa0rLgsO+tMyvZib9mTlwkq9BzUSJQJCxuza
   RSdHXb1Evzy+XPj+Ic4eV03VQbfhqsYGR+Gt0/aGR6u2STH3BjPDlreSc
   0OXvJ50piK5YQZdzyu2Cb3vmFR0gxElUJRGauunuQNRftsgDUuut5meWr
   Q==;
X-CSE-ConnectionGUID: plniwS/2S/SBZIfbZzotQA==
X-CSE-MsgGUID: TVdP+TwiRoGlxi2VoBOTAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="92903117"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="92903117"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 01:02:53 -0700
X-CSE-ConnectionGUID: EO4GnmZkSla1pa+QH97V3g==
X-CSE-MsgGUID: HACl/gDGTLe/Cv7svC3lZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="271707177"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Sep 2026 01:02:52 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8CVc-00000000C9T-3Wi0;
	Sun, 20 Sep 2026 08:02:48 +0000
Date: Sun, 20 Sep 2026 16:02:05 +0800
From: kernel test robot <lkp@intel.com>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202609201549.zSHml9sK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: 5ae3dc078874693a0a7fd1cf32660bd473fe544d remoteproc: xlnx: Add crash detection mechanism
date:   3 months ago
config: arm64-randconfig-r1301-20260920 (https://download.01.org/0day-ci/archive/20260920/202609201549.zSHml9sK-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609201549.zSHml9sK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5ae3dc078874 ("remoteproc: xlnx: Add crash detection mechanism")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609201549.zSHml9sK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/xlnx_r5_remoteproc.c:571:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:749:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:773:24: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:797:25: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *rsc_offset @@     got void [noderef] __iomem * @@
   drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:     expected void *rsc_offset
   drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:     got void [noderef] __iomem *

vim +837 drivers/remoteproc/xlnx_r5_remoteproc.c

   832	
   833	static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
   834					int offset, int avail)
   835	{
   836		struct zynqmp_r5_core *r5_core = rproc->priv;
 > 837		void *rsc_offset = (r5_core->rsc_tbl_va + offset);
   838	
   839		if (rsc_type != XLNX_RPROC_FW_CRASH_REPORT)
   840			return RSC_IGNORED;
   841	
   842		r5_core->crash_report = rsc_offset;
   843		/* reset all values */
   844		r5_core->crash_report->crashed = false;
   845		r5_core->crash_report->crash_reason = 0;
   846		r5_core->crash_report->crash_reason_str[0] = '\0';
   847	
   848		return RSC_HANDLED;
   849	}
   850	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
