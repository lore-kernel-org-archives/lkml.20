Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489AB3655FC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789854718; cv=none; b=HOvt9A96v15/SM1IMEfvYJGIYHH//w1O9YvDLG2XpNJghn2MwmKzplWyjztNzNQ0/XU2lIIA3kubW8/bD6jn4E0AqbNg0fZOSqPOoKSh0wM9ykhZ3r1gS+b01AACOE98y4+lblR79Amri6qVmHatsv7YvtuvZFpsEpXBS45GeCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789854718; c=relaxed/simple;
	bh=ZoJFugfs4yBN5tEW2cIIHS7RAObaIV84ecoq9N+wlM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N834rj3eUJ4a0eiJySOBOahTzpvs4CU9rJoNjprQbQ9fEwj9GwC5jj7Rj06SS9dGliVsN/XrhzJRS5iQtFSnbFYOO/hsDoGKU33B7WJ9vNWCXMkVLVgmto1wH/mpyl8AI6iZSvGY4alImVzG2euy59CPTMMTtI1aD2jO3EcRhwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkxeRkQ2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkxeRkQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789854715; x=1821390715;
  h=date:from:to:cc:subject:message-id;
  bh=ZoJFugfs4yBN5tEW2cIIHS7RAObaIV84ecoq9N+wlM8=;
  b=ZkxeRkQ2kOXRJnO2QWOh5P3XMhVcPglnDenh/9CUhlzrBbyIsoHPkl5t
   0d9CGdPE+wgISobQABkRIIW9ijHBycvD8SAFOYQvTsXEwnFwbFry6wQHo
   K61G5pMuGWhSHngklDtU3pSc3EoQfeEuQsuwcmCgO0eLryE/Gy77gGTr8
   mLt4tcth1US2v3phmrPKfwDiGcmLvvlZhGF1/i+xyY0MzfI2WHGgjCxot
   BJVa8ydvsRQrPwYBzcNMpgcGYoedOqJMtWcg6JEzHt8GTRaoRrSTXdekV
   N0Xhxtb0Hv2ZQ99an20YFxhSxsX9dbdnD0fi4pw/vU/2V1iKDQq5KXlJg
   A==;
X-CSE-ConnectionGUID: rqa9q+kbR3SQi9kFe2XLqA==
X-CSE-MsgGUID: snnOdcyAT66N0NqqT49I0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="115903811"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="115903811"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 14:51:54 -0700
X-CSE-ConnectionGUID: ZBrJG9PUSYy2ygug796Klg==
X-CSE-MsgGUID: SRXK6fMGSIq5FljjecLeMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="270626124"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Sep 2026 14:51:52 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x82yM-00000000BQH-095Y;
	Sat, 19 Sep 2026 21:51:50 +0000
Date: Sun, 20 Sep 2026 05:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: drivers/scsi/advansys.c:4261:9: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202609200529.qhY0gUjg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: c7233b3d99db9760daf07c4e95daa9675c6c0cba scsi: advansys: Drop ISA_DMA_API remnants
date:   5 months ago
config: m68k-randconfig-r1303-20260920 (https://download.01.org/0day-ci/archive/20260920/202609200529.qhY0gUjg-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609200529.qhY0gUjg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c7233b3d99db ("scsi: advansys: Drop ISA_DMA_API remnants")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609200529.qhY0gUjg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4261:9: sparse:     expected unsigned short [usertype] val
   drivers/scsi/advansys.c:4261:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
>> drivers/scsi/advansys.c:4261:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4261:9: sparse:     expected unsigned short volatile [usertype]
   drivers/scsi/advansys.c:4261:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4261:9: sparse:     expected unsigned short [usertype] val
   drivers/scsi/advansys.c:4261:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
>> drivers/scsi/advansys.c:4261:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4261:9: sparse:     expected unsigned short volatile [usertype]
   drivers/scsi/advansys.c:4261:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4719:9: sparse:     expected unsigned short [usertype] val
   drivers/scsi/advansys.c:4719:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4719:9: sparse:     expected unsigned short volatile [usertype]
   drivers/scsi/advansys.c:4719:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4719:9: sparse:     expected unsigned short [usertype] val
   drivers/scsi/advansys.c:4719:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4719:9: sparse:     expected unsigned short volatile [usertype]
   drivers/scsi/advansys.c:4719:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4733:9: sparse:     expected unsigned short [usertype] val
   drivers/scsi/advansys.c:4733:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4733:9: sparse:     expected unsigned short volatile [usertype]
   drivers/scsi/advansys.c:4733:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4733:9: sparse:     expected unsigned short [usertype] val
   drivers/scsi/advansys.c:4733:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer

vim +4261 drivers/scsi/advansys.c

4b47e464510c52 Hannes Reinecke 2015-04-24  4224  
512193588db0d3 Matthew Wilcox  2007-10-02  4225  /*
512193588db0d3 Matthew Wilcox  2007-10-02  4226   * Send an idle command to the chip and wait for completion.
512193588db0d3 Matthew Wilcox  2007-10-02  4227   *
512193588db0d3 Matthew Wilcox  2007-10-02  4228   * Command completion is polled for once per microsecond.
512193588db0d3 Matthew Wilcox  2007-10-02  4229   *
512193588db0d3 Matthew Wilcox  2007-10-02  4230   * The function can be called from anywhere including an interrupt handler.
512193588db0d3 Matthew Wilcox  2007-10-02  4231   * But the function is not re-entrant, so it uses the DvcEnter/LeaveCritical()
512193588db0d3 Matthew Wilcox  2007-10-02  4232   * functions to prevent reentrancy.
512193588db0d3 Matthew Wilcox  2007-10-02  4233   *
512193588db0d3 Matthew Wilcox  2007-10-02  4234   * Return Values:
512193588db0d3 Matthew Wilcox  2007-10-02  4235   *   ADV_TRUE - command completed successfully
512193588db0d3 Matthew Wilcox  2007-10-02  4236   *   ADV_FALSE - command failed
512193588db0d3 Matthew Wilcox  2007-10-02  4237   *   ADV_ERROR - command timed out
512193588db0d3 Matthew Wilcox  2007-10-02  4238   */
512193588db0d3 Matthew Wilcox  2007-10-02  4239  static int
512193588db0d3 Matthew Wilcox  2007-10-02  4240  AdvSendIdleCmd(ADV_DVC_VAR *asc_dvc,
95cfab6c11180f Hannes Reinecke 2015-04-24  4241  	       ushort idle_cmd, u32 idle_cmd_parameter)
512193588db0d3 Matthew Wilcox  2007-10-02  4242  {
95cfab6c11180f Hannes Reinecke 2015-04-24  4243  	int result, i, j;
512193588db0d3 Matthew Wilcox  2007-10-02  4244  	AdvPortAddr iop_base;
512193588db0d3 Matthew Wilcox  2007-10-02  4245  
512193588db0d3 Matthew Wilcox  2007-10-02  4246  	iop_base = asc_dvc->iop_base;
512193588db0d3 Matthew Wilcox  2007-10-02  4247  
512193588db0d3 Matthew Wilcox  2007-10-02  4248  	/*
512193588db0d3 Matthew Wilcox  2007-10-02  4249  	 * Clear the idle command status which is set by the microcode
512193588db0d3 Matthew Wilcox  2007-10-02  4250  	 * to a non-zero value to indicate when the command is completed.
512193588db0d3 Matthew Wilcox  2007-10-02  4251  	 * The non-zero result is one of the IDLE_CMD_STATUS_* values
512193588db0d3 Matthew Wilcox  2007-10-02  4252  	 */
512193588db0d3 Matthew Wilcox  2007-10-02  4253  	AdvWriteWordLram(iop_base, ASC_MC_IDLE_CMD_STATUS, (ushort)0);
512193588db0d3 Matthew Wilcox  2007-10-02  4254  
512193588db0d3 Matthew Wilcox  2007-10-02  4255  	/*
512193588db0d3 Matthew Wilcox  2007-10-02  4256  	 * Write the idle command value after the idle command parameter
512193588db0d3 Matthew Wilcox  2007-10-02  4257  	 * has been written to avoid a race condition. If the order is not
512193588db0d3 Matthew Wilcox  2007-10-02  4258  	 * followed, the microcode may process the idle command before the
512193588db0d3 Matthew Wilcox  2007-10-02  4259  	 * parameters have been written to LRAM.
512193588db0d3 Matthew Wilcox  2007-10-02  4260  	 */
512193588db0d3 Matthew Wilcox  2007-10-02 @4261  	AdvWriteDWordLramNoSwap(iop_base, ASC_MC_IDLE_CMD_PARAMETER,
512193588db0d3 Matthew Wilcox  2007-10-02  4262  				cpu_to_le32(idle_cmd_parameter));
512193588db0d3 Matthew Wilcox  2007-10-02  4263  	AdvWriteWordLram(iop_base, ASC_MC_IDLE_CMD, idle_cmd);
512193588db0d3 Matthew Wilcox  2007-10-02  4264  
512193588db0d3 Matthew Wilcox  2007-10-02  4265  	/*
512193588db0d3 Matthew Wilcox  2007-10-02  4266  	 * Tickle the RISC to tell it to process the idle command.
512193588db0d3 Matthew Wilcox  2007-10-02  4267  	 */
512193588db0d3 Matthew Wilcox  2007-10-02  4268  	AdvWriteByteRegister(iop_base, IOPB_TICKLE, ADV_TICKLE_B);
512193588db0d3 Matthew Wilcox  2007-10-02  4269  	if (asc_dvc->chip_type == ADV_CHIP_ASC3550) {
512193588db0d3 Matthew Wilcox  2007-10-02  4270  		/*
512193588db0d3 Matthew Wilcox  2007-10-02  4271  		 * Clear the tickle value. In the ASC-3550 the RISC flag
512193588db0d3 Matthew Wilcox  2007-10-02  4272  		 * command 'clr_tickle_b' does not work unless the host
512193588db0d3 Matthew Wilcox  2007-10-02  4273  		 * value is cleared.
512193588db0d3 Matthew Wilcox  2007-10-02  4274  		 */
512193588db0d3 Matthew Wilcox  2007-10-02  4275  		AdvWriteByteRegister(iop_base, IOPB_TICKLE, ADV_TICKLE_NOP);
512193588db0d3 Matthew Wilcox  2007-10-02  4276  	}
512193588db0d3 Matthew Wilcox  2007-10-02  4277  
512193588db0d3 Matthew Wilcox  2007-10-02  4278  	/* Wait for up to 100 millisecond for the idle command to timeout. */
512193588db0d3 Matthew Wilcox  2007-10-02  4279  	for (i = 0; i < SCSI_WAIT_100_MSEC; i++) {
512193588db0d3 Matthew Wilcox  2007-10-02  4280  		/* Poll once each microsecond for command completion. */
512193588db0d3 Matthew Wilcox  2007-10-02  4281  		for (j = 0; j < SCSI_US_PER_MSEC; j++) {
512193588db0d3 Matthew Wilcox  2007-10-02  4282  			AdvReadWordLram(iop_base, ASC_MC_IDLE_CMD_STATUS,
512193588db0d3 Matthew Wilcox  2007-10-02  4283  					result);
512193588db0d3 Matthew Wilcox  2007-10-02  4284  			if (result != 0)
512193588db0d3 Matthew Wilcox  2007-10-02  4285  				return result;
512193588db0d3 Matthew Wilcox  2007-10-02  4286  			udelay(1);
512193588db0d3 Matthew Wilcox  2007-10-02  4287  		}
512193588db0d3 Matthew Wilcox  2007-10-02  4288  	}
512193588db0d3 Matthew Wilcox  2007-10-02  4289  
512193588db0d3 Matthew Wilcox  2007-10-02  4290  	BUG();		/* The idle command should never timeout. */
512193588db0d3 Matthew Wilcox  2007-10-02  4291  	return ADV_ERROR;
512193588db0d3 Matthew Wilcox  2007-10-02  4292  }
512193588db0d3 Matthew Wilcox  2007-10-02  4293  

:::::: The code at line 4261 was first introduced by commit
:::::: 512193588db0d38ae6aa78802bb15f3ef3104a00 [SCSI] advansys: Eliminate prototypes

:::::: TO: Matthew Wilcox <matthew@wil.cx>
:::::: CC: James Bottomley <jejb@mulgrave.localdomain>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
