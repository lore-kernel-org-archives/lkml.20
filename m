Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666A13B27D8
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789820469; cv=none; b=uX97omMluDH4tAYPEwSdUyCIHYHqHXOWHzUbLEdhRhHhX1I7Y6kMmevgALuoGtZLQOMwlB7GtcyEdPe5MtUSK2yaBhMWx/XNjmDqTudqFs1SuNqDUxg7//GD2JCEYMk+LNbKF0NN9v+/H4Kayo86QPO/Ko4Cr9Cg+yWmkXuwkyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789820469; c=relaxed/simple;
	bh=3OK63u4c+3ce28aAgK/yJ0LA6QZFqmOCczIze6x4mF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wfr7ehJf9bkF2ZPMnNACNTz6GJ9Slkz428vZ9Bgft/Lizl/47um0ARWzOLqG5PTgzrQyagAIJTfzMfo0oVhCQvdw6n5K7twahGvwjUHJ816pr2YQgKkWGEsWs0+HcFTtX+1m+yl58ppb5Apa3B5E+z+vxOkiS1ZNl+A+9EtuGQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMAGTQqQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMAGTQqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789820467; x=1821356467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3OK63u4c+3ce28aAgK/yJ0LA6QZFqmOCczIze6x4mF0=;
  b=kMAGTQqQlrxoBQ7PratKxDC9QgCVCb0v83x+FLa4BL6Xy/mQ21QOMKnF
   rbS+3e0LTqsrKhMMt6099tlEvDFUGiMy94FSkFw8vCTvJHQRgk8fnO7Ti
   bqWlxqYOcpS/0hQ5LVRfKovRo6OINgzJrE1YPJ+WzvDNbDbHhhvFfSzYN
   lXfm+Ldg8cQuXzEa0xSw3pLL3f1QusjyzHmg8qaRNR+wcjrzUjEuDH3eY
   UyQxCLTQVw/oAtZOrW5IGaqVTYLLVlPygOrM+qoVuS0neysRwTD4DTPZN
   ypgQEeYix9V2ep9b5JK+VjYvW/wRKnSi9g7k2Rmjrv5jUu9SPfHoyAj1K
   Q==;
X-CSE-ConnectionGUID: ZACvARrlS1a7vm+pdEGArw==
X-CSE-MsgGUID: 8OxcyQxBSEmBWYi7Is2lOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="94175253"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="94175253"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 05:21:06 -0700
X-CSE-ConnectionGUID: 3iCDox7gSpGMmqig1UaGog==
X-CSE-MsgGUID: Yio+r8vkTRqpyyVMKtGtbw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 19 Sep 2026 05:21:05 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7u3v-000000001Rw-0Qv2;
	Sat, 19 Sep 2026 12:20:59 +0000
Date: Sat, 19 Sep 2026 14:20:35 +0200
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:214:2-3:
 Unneeded semicolon
Message-ID: <202609191434.7ig2fg4E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40288c9206c17eb66a603262e06a58d300d0f279
commit: 0131a305886fa083e8be7b33eb22c5e25cd30472 drm/amdgpu: Remove output parameter in bo list handling
date:   3 months ago
config: x86_64-randconfig-103-20260911 (https://download.01.org/0day-ci/archive/20260919/202609191434.7ig2fg4E-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0131a305886f ("drm/amdgpu: Remove output parameter in bo list handling")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609191434.7ig2fg4E-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:214:2-3: Unneeded semicolon

vim +214 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c

   178	
   179	int amdgpu_bo_list_ioctl(struct drm_device *dev, void *data,
   180					struct drm_file *filp)
   181	{
   182		struct amdgpu_fpriv *fpriv = filp->driver_priv;
   183		struct amdgpu_device *adev = drm_to_adev(dev);
   184		struct amdgpu_bo_list *list, *prev, *curr;
   185		union drm_amdgpu_bo_list *args = data;
   186		uint32_t handle = args->in.list_handle;
   187		struct drm_amdgpu_bo_list_entry *info;
   188		int r;
   189	
   190		switch (args->in.operation) {
   191		case AMDGPU_BO_LIST_OP_CREATE:
   192		case AMDGPU_BO_LIST_OP_UPDATE:
   193			info = amdgpu_bo_create_list_entry_array(&args->in);
   194			if (IS_ERR(info))
   195				return PTR_ERR(info);
   196	
   197			list = amdgpu_bo_list_create(adev, filp, info,
   198						     args->in.bo_number);
   199			kvfree(info);
   200			if (IS_ERR(list))
   201				return PTR_ERR(list);
   202	
   203			break;
   204	
   205		case AMDGPU_BO_LIST_OP_DESTROY:
   206			list = xa_erase(&fpriv->bo_list_handles, handle);
   207			amdgpu_bo_list_put(list);
   208			handle = 0;
   209	
   210			break;
   211	
   212		default:
   213			return -EINVAL;
 > 214		};

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
