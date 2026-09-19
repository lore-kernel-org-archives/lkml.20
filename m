Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE19257435
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789826581; cv=none; b=Y6BOO48k0JjyactN5I0sh9lD+doLI943DN8g8cdb7Becu7Ot83kXJnrYErIosfQcr8NovW4KZ6CpT0ayHP2eOIr5KTPs96jGnC3REZVPAGZiU/SQBc92WsgXi2FXVqraXPns8jIAJhP/p+n1bovzuj6UK9lg6HLm/juCL4oTpeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789826581; c=relaxed/simple;
	bh=X7qzkjdC/wbTAVcRzMGg/Yezgi/bEQODoZ4+wEbsuvY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FGFWJt+SSgDFfyrN1Bmm06Xi/kyU6hx3CNaEHAL88t9I/aJbSUIxqxRLj0igArMLjOXleZWDehJPYMytpOatwvxtIKRPZgCVi/smqTSX3fRiAPqY4wY9QlsniiUManf869Xf08YLK7Hhr9CrP1t8Y67xjMZnvR2Ci/p3TcELBp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ac9nLPXm; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ac9nLPXm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789826580; x=1821362580;
  h=date:from:to:cc:subject:message-id;
  bh=X7qzkjdC/wbTAVcRzMGg/Yezgi/bEQODoZ4+wEbsuvY=;
  b=ac9nLPXmXwjU52+/b9r9xV0ekd3FbPG7aQYtIWrVAcVLIlQ7wnp50thK
   9StmZZMtxeIhjzoFixykHedetTYcY3wNTP0i7DMO5WHC1tj3JUVuWLlZL
   M1mCCL2EsyXLVl2/uUECE9in40Y+ru5oLrQMENRT1RCn9/UMGyvD0LezY
   IWxgDW9moefmb4MgZb8LVZ8YWZWPt16mHz4U0ZS+jLC4L90iTvWnInMYx
   Utd8Jzre51jnGgQOWnY1YNAKeXdKf7l+v7R6RqJ5tYaLb4JECrRhdz0F0
   YsFbxFEx4uZe2ZATBXR6POp0xpDwmQFinQO3wl+J/LnM8NO/KRKKwdz4H
   A==;
X-CSE-ConnectionGUID: Ohb0nIrBRLuPVf5YVD/t6g==
X-CSE-MsgGUID: FBv5tii3S0u58OqyMygsqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="863525"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="863525"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 07:03:00 -0700
X-CSE-ConnectionGUID: SlJISo5bS3KcktJOzdvfjg==
X-CSE-MsgGUID: XGsKXh8CTkqPfm2IVoBywg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="280023125"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 19 Sep 2026 07:02:58 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7veV-000000001T6-3CfR;
	Sat, 19 Sep 2026 14:02:51 +0000
Date: Sat, 19 Sep 2026 16:02:06 +0200
From: kernel test robot <lkp@intel.com>
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn60/dcn60_hwseq.c:1007 Excess
 function parameter 'probe' description in 'dcn60_update_probe_status'
Message-ID: <202609191538.mC8C4zZe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40288c9206c17eb66a603262e06a58d300d0f279
commit: 0d2f4cfa564355fcbbc71498fd8ec09243036109 drm/amd/display: Fix NULL dereference in dcn50/dcn60 init_hw
date:   2 days ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260919/202609191538.mC8C4zZe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191538.mC8C4zZe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0d2f4cfa5643 ("drm/amd/display: Fix NULL dereference in dcn50/dcn60 init_hw")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609191538.mC8C4zZe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn60/dcn60_hwseq.c:1007 Excess function parameter 'probe' description in 'dcn60_update_probe_status'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn60/dcn60_hwseq.c:1007 Excess function parameter 'probe' description in 'dcn60_update_probe_status'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
