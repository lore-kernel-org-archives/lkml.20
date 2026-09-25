Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8E0448BAC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328398; cv=none; b=GiWXFmUAtoO8BLZuB1+wDH9E4gGzAe0lUw0Z7GQVjiBf9VADjmuzulRlz0E0Osu/vmjwgQQNGd+HVWvvyn3ESbsf4c4S5jJeTnYYg2PQeCccmo8/QIWlykL0H12IdN1ggPAB+X9BXoML/wVgisLsYIx4btP6gGAdTaW87YbcLT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328398; c=relaxed/simple;
	bh=jaeUhKmdaL0Q8wyCM6K3w/b/KJCOUoiUciUDXJH5xe4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vFxzIqmpFcBIBzSgga5MH8sJvaiSyncxhbTo+NmRnaowdteIkY/Nq0w5ifPpanrY/PQXkrD4PwIAxOASkIcgP4e8uYo7jA6m4Hu8G8+UKcH49NGIY0XhkeFmTCcyu5YHZjWBxaNpmvn8KOQzLwBqWh7nANAdSmKiGP0SBc1bqKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nU9hOIEO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nU9hOIEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790328393; x=1821864393;
  h=date:from:to:cc:subject:message-id;
  bh=jaeUhKmdaL0Q8wyCM6K3w/b/KJCOUoiUciUDXJH5xe4=;
  b=nU9hOIEOhUljoFqN79B15uqrw0sTEqyzF4lKqNR8TpQjJrNCViV3+11Z
   U0ACGVsxpluIYiWWMjWrbnBANWJhZekPAdoR9zdUgDgRfKYHoVygZfWZU
   BPykZgNoe6nYxNgx1IEU0AdN+aGguWX0s0gBdYU8yPanZ6mhi7+NRivLp
   dkG/ez3q5wNxAkWSBPv2pRpmlHuWw8KsufDSczNKcROdCSWR+quZ66117
   o0Qnl4OuSO9gpLnzY+8QOpen4A9gUBqNyk/GY30SqDxjrnDifE5i0VO+r
   y1r+W55HCx0M3CqRSGm5gV4nqzZTLjdEBOCikxpAr7lrI4Ktpl+tWeBsk
   g==;
X-CSE-ConnectionGUID: iIZvbbNpSnWUaPhBxcqJ+Q==
X-CSE-MsgGUID: I6B4ntsWRrO2qKAlHDuoaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94930045"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="94930045"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:26:31 -0700
X-CSE-ConnectionGUID: uRUXLwfPT/OmI6I4pQyZ1A==
X-CSE-MsgGUID: dTLw1DRgTDKAmfYgTxmoWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273842045"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 25 Sep 2026 02:26:31 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA2CK-000000000fi-0n9w;
	Fri, 25 Sep 2026 09:26:28 +0000
Date: Fri, 25 Sep 2026 11:25:35 +0200
From: kernel test robot <lkp@intel.com>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>
Subject: 
 drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c:25:32: error:
 'struct rvu' has no member named 'rvu_dbg'; did you mean 'rvu_dl'?
Message-ID: <202609251130.hAOAXoIz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Ratheesh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   165768bb70265b5c38cf0b73fafd75be235f8b14
commit: 1396771b0b7741d517d591cfb63333d3f97a8f6d octeontx2-af: npc: cn20k: Index management
date:   7 months ago
config: s390-randconfig-r2103-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251130.hAOAXoIz-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251130.hAOAXoIz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1396771b0b77 ("octeontx2-af: npc: cn20k: Index management")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251130.hAOAXoIz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c: In function 'npc_cn20k_debugfs_deinit':
>> drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c:25:32: error: 'struct rvu' has no member named 'rvu_dbg'; did you mean 'rvu_dl'?
      25 |  debugfs_remove_recursive(rvu->rvu_dbg.npc);
         |                                ^~~~~~~
         |                                rvu_dl


vim +25 drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c

    22	
    23	void npc_cn20k_debugfs_deinit(struct rvu *rvu)
    24	{
  > 25		debugfs_remove_recursive(rvu->rvu_dbg.npc);
    26	}
    27	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
