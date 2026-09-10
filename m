Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FC43C2774
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028119; cv=none; b=lShcJ37wHVOUf+EotuarHA2mkjfEsFVRKW+9G1blnvbb5aNiQJYr4PTsfiqld4kjYTWsVU2SdESvq+wj+z0ajSWJLhQfbLRrRnrJHAw7G1bulzSlqxFYD71sb/48swL0p2u75+AhQlJBmcSOXvuiLuQNOl3vr1UsnCHRsJROIQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028119; c=relaxed/simple;
	bh=PXHYwOwItDQlFMrJ/xI/Xbh8uJZqw2NeahZLyCOU46I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kQkfAmJ1AkZbPcRrVawiJYUmA/Z1X1LPaHu0nmX4KiiJODUcdQUh7P1poOmuDqq0jiXk8KT2odyr2YVKfnrYzhw6F6sGaBxveZdAnrNQ/DLMjNkAddY6TRg80472lkwlohd2rb8K4a1O1WFriYOB/mGpqQbXD9YjK/7BaqFl05Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXX/VS3u; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXX/VS3u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789028115; x=1820564115;
  h=date:from:to:cc:subject:message-id;
  bh=PXHYwOwItDQlFMrJ/xI/Xbh8uJZqw2NeahZLyCOU46I=;
  b=DXX/VS3uRGXBwXjde05/td0BnXjwLfadwkK6Cbs1NJkHkWEQMmBZLkEr
   X9ctcjoebSa44XkEKnRWSvPeqVTpeFYl5/3yFsJGIeaWdktN2Oo1mdVop
   VwxZ4UiXE23/5aQXAspQpyZVReWMoTXyQyTGzzF2pi9/t8toYRGSylhxb
   EMGbEZha6rBU9PMTZ81T2y//0sIHD63PyOextxj2kQt21WWn6v3Cjzaeo
   +KhIcR17Xc0vDvryHfxo3zC8fCJCKya2ahtfcG8KPvg4LR5ieQCQOzKOU
   aPck6mzcTfYTLE3tgSIg2GIjt9dtwYnUxg3JE5MNpHAsW+n79BtVVMxBR
   A==;
X-CSE-ConnectionGUID: 9LbT3HfOTBy+KbABiPZluw==
X-CSE-MsgGUID: 5U7CKv+KQbmonOCGHlpHEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="115016896"
X-IronPort-AV: E=Sophos;i="6.27,271,1787036400"; 
   d="scan'208";a="115016896"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 01:15:14 -0700
X-CSE-ConnectionGUID: wodMyq5rTVSgH2kMduquiA==
X-CSE-MsgGUID: 0JgJJNLTQCWAPG4IJTF5sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,271,1787036400"; 
   d="scan'208";a="273527779"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Sep 2026 01:15:12 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4Zw5-000000001ZS-3TQm;
	Thu, 10 Sep 2026 08:15:09 +0000
Date: Thu, 10 Sep 2026 16:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom_fw.c:115:68:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202609101657.kczNjTnY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi YiPeng,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: d95700604fbc6fd7534303796d005e6efbd1d591 drm/amd/ras: rename core ras_* files and update include guards
date:   5 weeks ago
config: csky-randconfig-r133-20260910 (https://download.01.org/0day-ci/archive/20260910/202609101657.kczNjTnY-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101657.kczNjTnY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d95700604fbc ("drm/amd/ras: rename core ras_* files and update include guards")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101657.kczNjTnY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom_fw.c:115:68: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom_fw.c:367:56: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:274:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:274:15: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:274:15: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:275:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:275:15: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:275:15: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:276:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:276:15: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:276:15: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:277:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:277:15: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:277:15: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:278:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:278:15: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:278:15: sparse:     got restricted __le32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:287:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:288:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:289:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:290:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:291:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:333:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:333:15: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:333:15: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:343:15: sparse: sparse: cast to restricted __le32

vim +115 drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom_fw.c

0d21084c02864f drivers/gpu/drm/amd/ras/rascore/ras_eeprom_fw.c Gangliang Xie 2025-12-12  107  
0d21084c02864f drivers/gpu/drm/amd/ras/rascore/ras_eeprom_fw.c Gangliang Xie 2025-12-12  108  int ras_fw_set_timestamp(struct ras_core_context *ras_core,
0d21084c02864f drivers/gpu/drm/amd/ras/rascore/ras_eeprom_fw.c Gangliang Xie 2025-12-12  109  				 uint64_t timestamp)
0d21084c02864f drivers/gpu/drm/amd/ras/rascore/ras_eeprom_fw.c Gangliang Xie 2025-12-12  110  {
0d21084c02864f drivers/gpu/drm/amd/ras/rascore/ras_eeprom_fw.c Gangliang Xie 2025-12-12  111  	struct ras_mp1 *mp1 = &ras_core->ras_mp1;
0d21084c02864f drivers/gpu/drm/amd/ras/rascore/ras_eeprom_fw.c Gangliang Xie 2025-12-12  112  	const struct ras_mp1_sys_func *sys_func = mp1->sys_func;
0d21084c02864f drivers/gpu/drm/amd/ras/rascore/ras_eeprom_fw.c Gangliang Xie 2025-12-12  113  
0d21084c02864f drivers/gpu/drm/amd/ras/rascore/ras_eeprom_fw.c Gangliang Xie 2025-12-12  114  	return sys_func->mp1_send_eeprom_msg(ras_core,
0d21084c02864f drivers/gpu/drm/amd/ras/rascore/ras_eeprom_fw.c Gangliang Xie 2025-12-12 @115  			RAS_SMU_SetTimestamp, (uint32_t)timestamp, 0);
0d21084c02864f drivers/gpu/drm/amd/ras/rascore/ras_eeprom_fw.c Gangliang Xie 2025-12-12  116  }
0d21084c02864f drivers/gpu/drm/amd/ras/rascore/ras_eeprom_fw.c Gangliang Xie 2025-12-12  117  

:::::: The code at line 115 was first introduced by commit
:::::: 0d21084c02864fc95df18c5cdd3bab6efafdd406 drm/amd/ras: add wrapper funcs for pmfw eeprom

:::::: TO: Gangliang Xie <ganglxie@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
