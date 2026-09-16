Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334484E06FF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789600419; cv=none; b=KPkmUVxZ8rkUxOLDvLfCUF43kRbZ/gZwkD2/JLIF0WIg/WC/3qKRqMwtY2K9lpEDY9w4X9i3QNoEvQ+4XwUoNxsxvOoz3t8Pnbg8VbkPHhpZREtCV7LX/Ed/KJizTuh0aY5j/eUZCl4nfw0Rj1Uztv2f2VpmLLHMMGt2wjjpek8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789600419; c=relaxed/simple;
	bh=mQ1zUO7cuhKE1nxW6bs53CfGHgz37yQzw7l8uP4F3Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=equa2HC9w3TuUI2+dg5/TaUAy8OoBEAR39QrUkqMQDjIi69tFMyq3ZP0YcR3S2yKMxZrFwtcL9zQeLtDt6XK+9xd5YeYTxoqqbpIBh1AqwA8pvp0dXHIzlV87/Lq0d1IbTiladJVhFyTLfHGQfQV3zrM3sT2CP3ig6/PYPhJzSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CH+i4/DB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CH+i4/DB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789600417; x=1821136417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mQ1zUO7cuhKE1nxW6bs53CfGHgz37yQzw7l8uP4F3Q8=;
  b=CH+i4/DBHYiYFyo99SCJ/jCoyrjNXjLHQSwEVJntR9kYoMjX16iVr+d5
   0K5Knf5cBpiqD9yXB9ZRTjZPWE7X/gI114C0YCTVt5PoiaEVAX2FA21YH
   q8airQ1vct4qAtAqspNljPM3zfRNulRZGuHumhDzOfn8ZcH4jSKj2znwV
   lEdbD+lOoGrd1cygDpEUNp5rmfFrWkzWYBJ7yAUFuTGc3twSsVHAsrSw7
   WabUUU1gsmfcaeigY+Ue90qHlW+xQsIF6FUsoae9UkhUDGEPhNQTHrytz
   Xv8wqqUK8FsZ+IU8tpMaIoIkGjYG7GhCBMUJa025iHO3TIQ38Gg4Jk/pa
   w==;
X-CSE-ConnectionGUID: WjcCpxQqQquUszGOHiggvA==
X-CSE-MsgGUID: E5o9Yaq+RPut2Qt95SiXQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93861372"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93861372"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:13:33 -0700
X-CSE-ConnectionGUID: HzjHhHkkQPifTRhKz9ZJkw==
X-CSE-MsgGUID: 3u4kX2keR/6YkA0Q3mj+Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277231446"
Received: from khuang2-desk.gar.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.223.219])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:13:33 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Chen Yu <yu.c.chen@intel.com>,
	David E Box <david.e.box@intel.com>,
	x86@kernel.org
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v12 07/25] x86/resctrl: Update special case for Intel Haswell enumeration
Date: Wed, 16 Sep 2026 16:13:02 -0700
Message-ID: <20260916231320.14502-8-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916231320.14502-1-tony.luck@intel.com>
References: <20260916231320.14502-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Certain Intel Haswell CPUs have support for resctrl L3 cache allocation
but do not enumerate the feature. There is a quirk to check for support
and provide hard-coded parameters. This quirk sets rdt_alloc_capable
to indicate to get_rdt_alloc_resources() that normal enumeration is
not needed.

Drop setting of rdt_alloc_capable in cache_alloc_hsw_probe() in
preparation for removal of this global variable.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v12:
	Remove the new hsw_alloc_capable variable.
---
 arch/x86/kernel/cpu/resctrl/core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index f0cfb37482d3..f2bf160d01c1 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -177,8 +177,6 @@ static inline void cache_alloc_hsw_probe(void)
 	r->cache.min_cbm_bits = 2;
 	r->cache.arch_has_sparse_bitmasks = false;
 	r->alloc_capable = true;
-
-	rdt_alloc_capable = true;
 }
 
 /*
@@ -930,7 +928,11 @@ static __init bool get_rdt_alloc_resources(void)
 	struct rdt_resource *r;
 	bool ret = false;
 
-	if (rdt_alloc_capable)
+	/*
+	 * On Haswell systems cache_alloc_hsw_probe() already marked
+	 * RDT_RESOURCE_L3 as alloc_capable. No further enumeration is needed.
+	 */
+	if (resctrl_alloc_capable())
 		return true;
 
 	if (!boot_cpu_has(X86_FEATURE_RDT_A))
-- 
2.55.0

