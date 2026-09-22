Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC37C36F421
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059569; cv=none; b=KJaJ75ArGfQZG+KsvbYF+mUBcvrxTb6VTdN/Mk3HaRb2vOTUrpoaFtxnkxFrsuqbZTQTDi+aAgNuTkxNfjyj2LnCCPqht/WJ5iio0m43N5iwVcN9RnFlQ8QRLWUoo+zlGzmhcp4zVx+LSPAg8Cd7WIwyJU6UpzPHq63iCkXalpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059569; c=relaxed/simple;
	bh=3ZYZEW562JbmVVBAR+b0hZdh9wMs9mRW6lAjzWP2vdU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gKZtENXooAfI1n/qG9bPC/wa7AQvnKBhWYm5IxyGEjKs0KvTdweYRMh/HJBCH6vs2TKQuIjsqo8NXIpMP9ArJPAnSyFzw7boZ3xx/wUfYsgclSwJfSTLyl+6oW9mbekzKUu0vD71lT5QrgK9sPu93OFW7X8f7AlOpG3WrLCNZwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbbvxVBL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbbvxVBL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790059567; x=1821595567;
  h=date:from:to:cc:subject:message-id;
  bh=3ZYZEW562JbmVVBAR+b0hZdh9wMs9mRW6lAjzWP2vdU=;
  b=DbbvxVBLZuaIkXqlnQCvhGMQad2TML9DtGXv+E+PNDJVOcdcSXJWAzV0
   LCjROR9a4B2HHBUGEkfrj4FIlZuZjrH6RDptZbuRXR2nTxv5+7jR591vw
   WXgLv4RyRoca62tRht3y3u5MBWSliBlle8v9BSUCf5YxvdqBmKak+FKXm
   DLT/874mAUgQSd+9VeH+cZbLDbMrdMN2fqeQGR/e6k9kNxk47lJZRcqTy
   fSEgJyRmAc9xtCE+ulcOEoofwIwyXoUOuO940MgDtOauZeUAKv8HaXQP/
   YTwSHGXwgKiuweBmfYUou6s3BsdP1kV5xXznBvWk6tmJggo+V3cYPWDIs
   A==;
X-CSE-ConnectionGUID: /cg+zqvLT7WWcHGUEpC9JA==
X-CSE-MsgGUID: IxQ5PO/gSZikx3eLHw30Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="108131490"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="108131490"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 23:45:35 -0700
X-CSE-ConnectionGUID: D7O639NiS8KlFPvhNJggOQ==
X-CSE-MsgGUID: SsUubfzDTyywfPnX3sKWiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4302201"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 21 Sep 2026 23:45:33 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8uFu-00000000F6C-35D6;
	Tue, 22 Sep 2026 06:45:30 +0000
Date: Tue, 22 Sep 2026 14:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/thead,th1520-aon.c:173:22: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202609221307.brMpIrTW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 88c4bd90725557796c15878b7cb70066e9e6b5ab firmware: thead: Fix buffer overflow and use standard endian macros
date:   6 months ago
config: microblaze-randconfig-r1301-20260922 (https://download.01.org/0day-ci/archive/20260922/202609221307.brMpIrTW-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221307.brMpIrTW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 88c4bd907255 ("firmware: thead: Fix buffer overflow and use standard endian macros")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221307.brMpIrTW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/thead,th1520-aon.c:173:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [usertype] resource @@     got restricted __be16 [usertype] @@
   drivers/firmware/thead,th1520-aon.c:173:22: sparse:     expected unsigned short [addressable] [usertype] resource
   drivers/firmware/thead,th1520-aon.c:173:22: sparse:     got restricted __be16 [usertype]
>> drivers/firmware/thead,th1520-aon.c:174:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [usertype] mode @@     got restricted __be16 [usertype] @@
   drivers/firmware/thead,th1520-aon.c:174:18: sparse:     expected unsigned short [addressable] [usertype] mode
   drivers/firmware/thead,th1520-aon.c:174:18: sparse:     got restricted __be16 [usertype]

vim +173 drivers/firmware/thead,th1520-aon.c

   143	
   144	/**
   145	 * th1520_aon_power_update() - Change power state of a resource via TH1520 AON
   146	 * @aon_chan: Pointer to the AON channel structure
   147	 * @rsrc: Resource ID whose power state needs to be updated
   148	 * @power_on: Boolean indicating whether the resource should be powered on (true)
   149	 *            or powered off (false)
   150	 *
   151	 * This function requests the TH1520 AON subsystem to set the power mode of the
   152	 * given resource (@rsrc) to either on or off. It constructs the message in
   153	 * `struct th1520_aon_msg_req_set_resource_power_mode` and then invokes
   154	 * th1520_aon_call_rpc() to make the request. If the AON call fails, an error
   155	 * message is logged along with the specific return code.
   156	 *
   157	 * Return:
   158	 * * 0 on success
   159	 * * A negative error code in case of failures (propagated from
   160	 *   th1520_aon_call_rpc()).
   161	 */
   162	int th1520_aon_power_update(struct th1520_aon_chan *aon_chan, u16 rsrc,
   163				    bool power_on)
   164	{
   165		struct th1520_aon_msg_req_set_resource_power_mode msg = {};
   166		struct th1520_aon_rpc_msg_hdr *hdr = &msg.hdr;
   167		int ret;
   168	
   169		hdr->svc = TH1520_AON_RPC_SVC_PM;
   170		hdr->func = TH1520_AON_PM_FUNC_SET_RESOURCE_POWER_MODE;
   171		hdr->size = TH1520_AON_RPC_MSG_NUM;
   172	
 > 173		msg.resource = cpu_to_be16(rsrc);
 > 174		msg.mode = cpu_to_be16(power_on ? TH1520_AON_PM_PW_MODE_ON :
   175						  TH1520_AON_PM_PW_MODE_OFF);
   176	
   177		ret = th1520_aon_call_rpc(aon_chan, &msg);
   178		if (ret)
   179			dev_err(aon_chan->cl.dev, "failed to power %s resource %d ret %d\n",
   180				power_on ? "up" : "off", rsrc, ret);
   181	
   182		return ret;
   183	}
   184	EXPORT_SYMBOL_GPL(th1520_aon_power_update);
   185	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
