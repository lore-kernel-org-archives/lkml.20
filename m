Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142173D0936
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791577857; cv=none; b=TnWpWrpsMeL1LdlzyMb7rmpxFNdcvUPptkZCT0phLngZRzIrVoeaHkL57K6w0zokalDmT4xOmRWHJ6cPGS4qjhm8fOYucew0JqYpxwSe2BiYjSpB/RDMHXGVabs5zw5XPzBbkDc8D4syTbzeMFaLu1DoxWquQ/biw3yZ/qme5iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791577857; c=relaxed/simple;
	bh=2saYmihXk4D+WDUzsfdgdw4WIv25gjM4R9HleabuRsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r92hNuQR4f2vjmYxPXSPzpYxKXeqbiozAwoUjMWMw+5GKJPpBQTywXdk/BxMMe2VupF9mdvyOk2uqLN5NU1p0UReDowemLscy/idasfyHeq3D7d+kBfflslWhB4sGmfz3FBE+0h20jVYEBwD7IKc6qn+8XXDxZdcpYfdltmoh7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HO9yAfKe; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HO9yAfKe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791577853; x=1823113853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2saYmihXk4D+WDUzsfdgdw4WIv25gjM4R9HleabuRsc=;
  b=HO9yAfKeHT8SMIi59pON7Cg3lkcjqebZdd4J8OLfPMR/UIET7A5NPHi3
   e0yrDObjq+knQ7T+J5jBQCVisqhWGQMh4of5SM9khaG3wnnYipaP87lCZ
   MnL+n2/klop4pnXdD3mVb3r2l+t4TpEYKG1dlnvbmdHi34cYR/oFDRhWj
   2QEBaqguVvBiqaJUiksxFE4gb+Xd9V7mvZiy+dlyO6bZ/SP+2kONT912x
   vIoyg9AhnvfpKAInhb1ecI2c6YIWL7GV0HyjJ69Efhl3TER28BvMIudqG
   Kv74kZUYdw7v/0pK079GisObb4UggUQfPK+vsDON2RyOO2BLk7op9sWpN
   g==;
X-CSE-ConnectionGUID: efK5aKAlRPGcbFJQidG8fQ==
X-CSE-MsgGUID: 2UmCC9PRRVequCrlP/6E4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="284604"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="284604"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 13:30:53 -0700
X-CSE-ConnectionGUID: MrsSyLoKRm2Bl/uDAFMiUg==
X-CSE-MsgGUID: VtdBHi3UQluX76iKLi18gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="2193215"
Received: from jf.intel.com ([10.165.154.102])
  by fmviesa012.fm.intel.com with ESMTP; 09 Oct 2026 13:30:52 -0700
From: Ehab Ababneh <ehab.ababneh@intel.com>
To: ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: buddy.lumpkin@oracle.com,
	akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	Ehab Ababneh <ehab.ababneh@intel.com>
Subject: [RFC PATCH v2 5/5] mm/vmscan: scale hopeless threshold for kswapd workers
Date: Fri,  9 Oct 2026 13:33:04 -0700
Message-ID: <ee792198db686d202c311e05c61cf5f45fcd8d86.1791577417.git.ehab.ababneh@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791577417.git.ehab.ababneh@intel.com>
References: <SJ1PR11MB6105E073723CFEEE8C8EDBF48C832@SJ1PR11MB6105.namprd11.prod.outlook.com> <cover.1791577417.git.ehab.ababneh@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-node failure counter advances once per worker balance pass
that makes no reclaim progress. With multiple kswapd workers, it can
reach MAX_RECLAIM_RETRIES while others are still reclaiming, marking
the node hopeless prematurely.

Scale the threshold by the active kswapd worker count so each worker
keeps the existing retry budget.

Signed-off-by: Ehab Ababneh <ehab.ababneh@intel.com>
---
 mm/vmscan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 9e051aac2203..61d46a376eb9 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -7940,7 +7940,8 @@ void kswapd_try_clear_hopeless(struct pglist_data *pgdat,
 
 bool kswapd_test_hopeless(pg_data_t *pgdat)
 {
-	return atomic_read(&pgdat->kswapd_failures) >= MAX_RECLAIM_RETRIES;
+	return atomic_read(&pgdat->kswapd_failures) >=
+		MAX_RECLAIM_RETRIES * READ_ONCE(current_kswapds_per_node);
 }
 
 #ifdef CONFIG_HIBERNATION
-- 
2.43.0

