Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5F14AD4A3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385461; cv=none; b=Mje6tODtwg0h5eFIBel/nE3CIuV6EYOy8bnT+Rzox/xcIYIpQf/LThM375Sd8j8SDyhQaKVtyRvjWHtMWMPwxSV3b+CaKq9J0/P4zBsUierrPboO5AYlfwzO9mg8YT6bFKjmi/ScIgi87cJeyLjszIxOvMW6tKfylarfwhMGh44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385461; c=relaxed/simple;
	bh=D1ZVCoLCHbfakll2oeEtpkPIBc4ICoHzc/DRrdV7d+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K9ulrJ9bB37+ioSmLDl3c+Jkt6lPLC031neIfn18tdZjbsY34J5cx5TuHl+NWicc8OEL1HKlcrB8GJ4d+LfpOlFatXXpw4qsiYJAWPHHarzZc+OCD+wvbvpD+b4Z87uE/inCLc2YHt1zS2PUNJvRagbSqMoN0+CTQJL7+SJhzD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvxoef/5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvxoef/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788385456; x=1819921456;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D1ZVCoLCHbfakll2oeEtpkPIBc4ICoHzc/DRrdV7d+w=;
  b=bvxoef/5+HN0dAcLHBul+v/SBbhaDPn3f2M2AZhVbp5kbCJhj1R2EJdx
   hbCTkFfsZMh+BoPnSn9R4KSvm50tEatvJnahLmuD8lTnElnfbnE6Bxp/I
   HOrzNITGMNDP5WuqOIlhpDsaijeztKjKm/dQiym1CoIE3E49rSLLnii88
   tSLqHw9V0XzkGgqwmIHcTc/9CfBO8Y6FcwOwBJuVeMFWlJwhrgqQEPstG
   tGhYFrmztumDHD0cBA5HebXlHx9pIzHwxgxJKQ3BH6eFzvlgu3hDwm/YF
   nlEeiorsd8+K6qUQCy9qLbWYlVCcoy4NxW3WgRH/zBLDV/fkE2emenRvr
   Q==;
X-CSE-ConnectionGUID: OwRJlNvFQfKOOveC9RefpA==
X-CSE-MsgGUID: Ke951sMnS0C/LITApKFztg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="87997769"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="87997769"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:44:05 -0700
X-CSE-ConnectionGUID: FxczQ9hjQFStbMwqQwn3yQ==
X-CSE-MsgGUID: z7aqw4TxRmi7XoVYg1mfnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="266929172"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:44:01 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: alex.zuo@intel.com,
	jonathan.cavitt@intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	Rodrigo.vivi@intel.com,
	matthew.brost@intel.com,
	maarten.lankhorst@linux.intel.com,
	thomas.hellstrom@linux.intel.com,
	tzimmermann@suse.de
Subject: [PATCH v7 0/2] drm/xe/pagefault: Add SRCID to pagefault reporting
Date: Thu,  3 Sep 2026 05:43:56 +0800
Message-ID: <20260902214358.348399-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add SRCID to the xe_pagefault struct, which reports the ID of the
faulting hardware unit.  This will be passed on to the
xe_vm_get_property_ioctl for reading per-vm faults and will assist in
diagnosing pagefaults.

v2:
- Readd pad check, as the pad in the ioctl struct was not changed
  (jcavitt)

v3:
- Rebase

v4:
- Squash SRCID with ASID to keep the struct compact (Matthew)

v5:
- Use BUILD_BUG_ON and move ASID definition in one function (Matthew)

v6:
- Rebase

v7:
- Various formatting fixes

Jonathan Cavitt (2):
  drm/xe/pagefault: Add SRCID to pagefault struct
  drm/xe/vm: Add srcid to xe_vm_get_property_ioctl fault report

 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  8 +++++++-
 drivers/gpu/drm/xe/xe_pagefault.c       | 24 +++++++++++++++---------
 drivers/gpu/drm/xe/xe_pagefault_types.h |  9 +++++++--
 drivers/gpu/drm/xe/xe_vm.c              |  8 ++++++++
 drivers/gpu/drm/xe/xe_vm_types.h        |  2 ++
 include/uapi/drm/xe_drm.h               |  4 ++--
 6 files changed, 41 insertions(+), 14 deletions(-)

-- 
2.53.0

