Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942815226A2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063901; cv=none; b=BzwwPDjtS3zW7efL3AyJL3kXjBmAGlLsrgYYFuXSj5hc57V6gSfGFyZrTpk98YVVu2CupGZowL+FupRU3rdSsDkzwD0tr8CVJe9I4cYXz/EgF2bgLv9iKIMf53NZD0faGCgo79eNaQtF84+XWRrev26CUttqFJ0NW/8wvRPHqUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063901; c=relaxed/simple;
	bh=st5zqvh5AAGmU926OyFQ7dzQZEV3MT6aFNUPe3AIhJA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TpyQ5wDyTYfoEKFQAUsoKH4vlpt0pvh6T6sVdyjbBtKrUd7/EDeGUZ07/F8XkZ9dNQO3CuaQrLXw6RQA8Ei6P97rJ78nmTQiA7LFGSJo5FOkX4uUj4RJbMfM27aZmB8dpKGWv1eZgitcCWvBXQLHbBAZcSLZaMHn+FkOa/AowRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kY2ZryBw; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kY2ZryBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790063894; x=1821599894;
  h=date:from:to:cc:subject:message-id;
  bh=st5zqvh5AAGmU926OyFQ7dzQZEV3MT6aFNUPe3AIhJA=;
  b=kY2ZryBweVodGrq698Fiq6w7nh6fU/A8wm3xlHQH5YJ97wHnWNNaOJHi
   HFIHiYkvWEqy2Do3NKDcgjjZiD2PevoXARalDdvLXnz2Q1THc1cqTLafq
   9Y8DpyECoedXD/QXAnGeebtQUhjYKVj/J4ZU4CA2TeGRVqeQ3EKleTiAf
   oQ/Id17sxleIW2atnU3floe/N/177IVlg9V0Dvz1fndvgOR7U7SyTuBan
   QU9esCxmtkCE3Csq9qOG9laBZY2UtRsGUgc1dmc7faQ88CX1ZMPSOI5Yv
   ZTvWT19i239QRPnmr/EhxxlEruUUfA/cu5PJrSKLItby+2YPtay+J4A2r
   w==;
X-CSE-ConnectionGUID: hn/AZrqXS2eJVSzIA6+7EA==
X-CSE-MsgGUID: OteuU0MiSq2ASKK3rl7cJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1151234"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1151234"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 00:58:09 -0700
X-CSE-ConnectionGUID: I5JJwG+0SyKoJ3iUHV8qIg==
X-CSE-MsgGUID: AnC3xvpIQeuhegzMjW/i0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="281092126"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Sep 2026 00:58:07 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8vO8-00000000FAC-3ZlA;
	Tue, 22 Sep 2026 07:58:04 +0000
Date: Tue, 22 Sep 2026 15:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: drivers/gpu/drm/rockchip/cdn-dp-core.c:321:25: sparse:
 sparse: cast to restricted __le32
Message-ID: <202609221523.NSIdRvjX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 0244539f9a4f3b564604dfe4d639f61cecec381a drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP
date:   9 months ago
config: powerpc64-randconfig-r1308-20260922 (https://download.01.org/0day-ci/archive/20260922/202609221523.NSIdRvjX-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221523.NSIdRvjX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0244539f9a4f ("drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221523.NSIdRvjX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/rockchip/cdn-dp-core.c:321:25: sparse: sparse: cast to restricted __le32

vim +321 drivers/gpu/drm/rockchip/cdn-dp-core.c

1a0f7ed3abe29c Chris Zhong 2017-02-05  312  
1a0f7ed3abe29c Chris Zhong 2017-02-05  313  static int cdn_dp_firmware_init(struct cdn_dp_device *dp)
1a0f7ed3abe29c Chris Zhong 2017-02-05  314  {
1a0f7ed3abe29c Chris Zhong 2017-02-05  315  	int ret;
1a0f7ed3abe29c Chris Zhong 2017-02-05  316  	const u32 *iram_data, *dram_data;
1a0f7ed3abe29c Chris Zhong 2017-02-05  317  	const struct firmware *fw = dp->fw;
1a0f7ed3abe29c Chris Zhong 2017-02-05  318  	const struct cdn_firmware_header *hdr;
1a0f7ed3abe29c Chris Zhong 2017-02-05  319  
1a0f7ed3abe29c Chris Zhong 2017-02-05  320  	hdr = (struct cdn_firmware_header *)fw->data;
1a0f7ed3abe29c Chris Zhong 2017-02-05 @321  	if (fw->size != le32_to_cpu(hdr->size_bytes)) {
1a0f7ed3abe29c Chris Zhong 2017-02-05  322  		DRM_DEV_ERROR(dp->dev, "firmware is invalid\n");
1a0f7ed3abe29c Chris Zhong 2017-02-05  323  		return -EINVAL;
1a0f7ed3abe29c Chris Zhong 2017-02-05  324  	}
1a0f7ed3abe29c Chris Zhong 2017-02-05  325  
1a0f7ed3abe29c Chris Zhong 2017-02-05  326  	iram_data = (const u32 *)(fw->data + hdr->header_size);
1a0f7ed3abe29c Chris Zhong 2017-02-05  327  	dram_data = (const u32 *)(fw->data + hdr->header_size + hdr->iram_size);
1a0f7ed3abe29c Chris Zhong 2017-02-05  328  
1a0f7ed3abe29c Chris Zhong 2017-02-05  329  	ret = cdn_dp_load_firmware(dp, iram_data, hdr->iram_size,
1a0f7ed3abe29c Chris Zhong 2017-02-05  330  				   dram_data, hdr->dram_size);
1a0f7ed3abe29c Chris Zhong 2017-02-05  331  	if (ret)
1a0f7ed3abe29c Chris Zhong 2017-02-05  332  		return ret;
1a0f7ed3abe29c Chris Zhong 2017-02-05  333  
1a0f7ed3abe29c Chris Zhong 2017-02-05  334  	ret = cdn_dp_set_firmware_active(dp, true);
1a0f7ed3abe29c Chris Zhong 2017-02-05  335  	if (ret) {
1a0f7ed3abe29c Chris Zhong 2017-02-05  336  		DRM_DEV_ERROR(dp->dev, "active ucpu failed: %d\n", ret);
1a0f7ed3abe29c Chris Zhong 2017-02-05  337  		return ret;
1a0f7ed3abe29c Chris Zhong 2017-02-05  338  	}
1a0f7ed3abe29c Chris Zhong 2017-02-05  339  
1a0f7ed3abe29c Chris Zhong 2017-02-05  340  	return cdn_dp_event_config(dp);
1a0f7ed3abe29c Chris Zhong 2017-02-05  341  }
1a0f7ed3abe29c Chris Zhong 2017-02-05  342  

:::::: The code at line 321 was first introduced by commit
:::::: 1a0f7ed3abe29cff8e652c69a8ad89aec2c40f00 drm/rockchip: cdn-dp: add cdn DP support for rk3399

:::::: TO: Chris Zhong <zyw@rock-chips.com>
:::::: CC: Mark Yao <mark.yao@rock-chips.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
