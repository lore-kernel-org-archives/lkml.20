Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D471A4AF697
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788384365; cv=none; b=V2pRPE2xaZLN5fjgVHJIuJvXBcZJ/ObRKf0nBYTnOlA+FL0YqYdmwfCKhDPCs6YUsL29HSNRkSVL0z3Y2kS9VVxAkXaGMi0Nt8imLVWTOBXhf5t2BWGh9U9rvEaNDIpZbCm84dXs2ZnsTfRi06v40QaL/5NkzXLo4qX87fb/RdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788384365; c=relaxed/simple;
	bh=9plz0XMHhAyOu2ZX1hqD1SDBlhuggjIuIAitC4JszVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sGvWKvZ0gkAXB1s/jINowQeTVvq2toRezDIoyOvJPVZTraZWyoCoHOf6U1fPWJrTZw69gjNTqIUsASTMgCW5T2FyE3qeClGol9P56X29GU6DffHy7+6phhzKdidT6DBsE2WJfmPmx/S37tmk1oFcKK6xo1fBJtOdrd8MJwckXQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGpK/Vc0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGpK/Vc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788384358; x=1819920358;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9plz0XMHhAyOu2ZX1hqD1SDBlhuggjIuIAitC4JszVY=;
  b=TGpK/Vc0bl/SUxRm/8zXVu/iiqSvfRKTsKhAWsyk2lHIk9tYoXuAT90X
   skP+24ZKwOm2kfSs8nPhP7/D0XO0G0db9Pa2MvFnApRIZgQdGt3zbWGoQ
   AQNpTW3jtImj6AKnN1+7Ww/UouI0/nNOjj+qG27v0uU7hIdGJy0AZtgA5
   AS1HX6XBeaCtAEk27e5eSEujFT4iO39h/4VHOj04uFQRvy1fgk9pzV2Te
   zO/eI2TSgozY/C7jtTPaZ64SrXL8Nhp+sH5CCgB7daJXgROCBOJEMyMZx
   Wsoe1pQ+NjoKxk0hAk+y02PUeg1ATQAmuArSOmfpFahlsuXQfzcmZY1VB
   g==;
X-CSE-ConnectionGUID: 8u4SoCDgSf+C0xfeWqVJZA==
X-CSE-MsgGUID: BaYcDjMRTimKRPnLgQwDWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="111629916"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="111629916"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:25:54 -0700
X-CSE-ConnectionGUID: GozhQi6dRBC5wsqgsYHdEg==
X-CSE-MsgGUID: 6u0LtjKlR4e62Cr8+nXZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="273682838"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:25:52 -0700
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
Subject: [PATCH v6 0/2] drm/xe/pagefault: Add SRCID to pagefault reporting
Date: Thu,  3 Sep 2026 05:25:47 +0800
Message-ID: <20260902212549.347805-1-jonathan.cavitt@intel.com>
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

