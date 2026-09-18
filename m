Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28334E533F;
	Fri, 18 Sep 2026 11:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730793; cv=none; b=pDv/fPuw2o9eEZun0qrpmUuUaQB6gSWUkLL7xpSEwx8WA4xpy5NfY1vqlSCLE87GCc8ReGpzo4YoxiTUmHRs8iTKblizHPvZyWu48JP3Nz3RN4XqviiH95vamaAwUvNuCYehW4JgFkuBe+s5E733Ub0aaAfUEa+9izVzQQeFX3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730793; c=relaxed/simple;
	bh=tGRz+xcU5qGQznIZVXbWr3WfcKFpc6nf1I9Ey6LydvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldTdvAoCxWoiQU9IGvvo9I3GtxuUGSdD3UrhdN5y6bRll0a6+v6/q0TDCiyeuryixY+HzsCEh3YQTAI+DMtwdNwwPwVlu0Rr9mE0fP+Yuu4fL5EZroQPoCQi29S0+oBPefwzNKiajwLbOuACe0rUsTnwwubBb0RxaLJPXBtjwGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcDsxOEI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcDsxOEI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789730786; x=1821266786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tGRz+xcU5qGQznIZVXbWr3WfcKFpc6nf1I9Ey6LydvE=;
  b=lcDsxOEI+/P5y6Gh04GnQYcciKwxbSy0atw3nVgXIG6W8i5KVMwdUvSB
   b73HfsAIh6SuPPYFv+i+T+HOccoKkQ4H76zuB6rjBVdcfPqaDVr3KwIFG
   EZBHdUq+uVjl+G5twPf3JaTI7GhfzZKjSQDbQES0LUW2DRZKKoZsm85IE
   5cZ5J4rEK8X7GNJvkGMaO+Diswq4wofMx1w4DQNCMkpxs2Rtzsj/2OlqD
   /GhfdfBHQJWvAXHOkdd/s3fQO2NS37dnZT0Hinse9LwBk1xPLW/MA1bV0
   BBHpLVBmgxpwHxdHJfxK8ommGKKfX058bq7cYCAFLw2xSK3Ak7ZhAqIwN
   A==;
X-CSE-ConnectionGUID: 4I0E9XTzQPCmAg4ThQ6ciA==
X-CSE-MsgGUID: U4LxlvTdS1yQDcaGRpENfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89161967"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="89161967"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:26:19 -0700
X-CSE-ConnectionGUID: Bxn5rxPtQIKGT1DV6Rs8Gw==
X-CSE-MsgGUID: vYzwKo1pSIK7kKpuOq84rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="2776820"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 18 Sep 2026 04:26:15 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7WjM-000000009h7-1lon;
	Fri, 18 Sep 2026 11:26:12 +0000
Date: Fri, 18 Sep 2026 19:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Claire DuSoleil <claire.m.dusoleil@gmail.com>,
	Zack Rusin <zack.rusin@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Claire DuSoleil <claire.m.dusoleil@gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix GEM_CLOSE returning -EINVAL for
 PRIME-imported surfaces
Message-ID: <202609182113.RjRMgrW6-lkp@intel.com>
References: <20260917181312.12473-1-claire.m.dusoleil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917181312.12473-1-claire.m.dusoleil@gmail.com>

Hi Claire,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.3-rc3 next-20260916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claire-DuSoleil/drm-vmwgfx-Fix-GEM_CLOSE-returning-EINVAL-for-PRIME-imported-surfaces/20260917-111312
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260917181312.12473-1-claire.m.dusoleil%40gmail.com
patch subject: [PATCH] drm/vmwgfx: Fix GEM_CLOSE returning -EINVAL for PRIME-imported surfaces
config: x86_64-buildonly-randconfig-1001-20260918 (https://download.01.org/0day-ci/archive/20260918/202609182113.RjRMgrW6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609182113.RjRMgrW6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609182113.RjRMgrW6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:263 function parameter 'file_priv' not described in 'vmw_user_resource_lookup_handle'
>> Warning: drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:263 function parameter 'file_priv' not described in 'vmw_user_resource_lookup_handle'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
