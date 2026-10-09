Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3491A3C8700
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791577852; cv=none; b=X921/A3bGNnirT41P640wm+hpMqkCYldct1cH8fRskXV7lAHv9P8vEfYG0X/yU0nlFpQI8xdomA3RCH9SLYTfyn5O+S2cz2GlpgYowMjQiN8iSClm+xUbjokUUyPDODTUuhQvhVeXL8RxGpmEgTbrHtW4zK6aE/5GdIA95lPwWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791577852; c=relaxed/simple;
	bh=IFIInZQhNe0bdNDONN0itzEk/3PUJZn9inDx3VVu3Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+96Fr8HZtq9xOkns4L/wvMVqGAx/IM1nXq87TIUOpdQkuoq1QlGn4AOOpQZT2O3R9pbnyhFG/fa+fNIrdOeD0oicNyd+idJ3S7SFbzT+pqdpaWPbUYm/XG0aBFB3QcvTqHE6Eg8lXhSf2yiogSx1Gvx5nRjs/rF3XgwQnoR/Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0N9NLt3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0N9NLt3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791577851; x=1823113851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IFIInZQhNe0bdNDONN0itzEk/3PUJZn9inDx3VVu3Es=;
  b=A0N9NLt3yrOHq+i/fpxBxgcx97n+rFCtTGGMe07QT1fJPYMze9XoJ7Yw
   5Dgswpv7wPdh8Ufxf4TEiKVPVaCRN5uUPpWnOVKREbIuplnyGkqX4HW9Q
   Y02gTNsp6kKEnfyAC+ZrgYW3CDilYUXb2gHjzzu5QnRTiywCUwg5UCCxE
   3Om2KZrxGOqx8Ht4LRI9dizgklETy8H74LJPfrUqNpEU+tiMy0HlouNS9
   oGnRccUnZg/GXpMTYDG4amEBXq1oLbHII/qXQKgc+pE25J9SXz9PcLmY5
   MJl9eOGLhFibVk2TcqHINj8QlTAdztLcflm9iFk7vkf2/ZmRTUeYnmRLR
   w==;
X-CSE-ConnectionGUID: fsCyjQCNQhygKh+EGsbSUg==
X-CSE-MsgGUID: 3i2bAPBhSaaXzKHG/AY7HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="284582"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="284582"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 13:30:51 -0700
X-CSE-ConnectionGUID: EK7VJCYxTf+XBcOm2hSGbg==
X-CSE-MsgGUID: 0oiAbEXpR+yHG6ULyitaKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="2193207"
Received: from jf.intel.com ([10.165.154.102])
  by fmviesa012.fm.intel.com with ESMTP; 09 Oct 2026 13:30:50 -0700
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
Subject: [RFC PATCH v2 4/5] mm/vmscan: let kswapd scan minimum-generation lruvecs
Date: Fri,  9 Oct 2026 13:33:03 -0700
Message-ID: <ef298caa858b365641b23367316e5dbfcc2a89b0.1791577417.git.ehab.ababneh@intel.com>
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

When an lruvec has only MIN_NR_GENS generations, scan_folios()
returns without scanning that type. Let kswapd scan the oldest
generation while keeping the early return for other reclaimers.

Under memory pressure, an lruvec can end up with only two generations.
That leaves an older and a younger cohort, a bit like inactive and
active LRU lists, though MGLRU tracks age differently.

This is a diagnostic change to see whether kswapd can reclaim from
the oldest remaining generation when aging does not advance.

Signed-off-by: Ehab Ababneh <ehab.ababneh@intel.com>
---
 mm/vmscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 95cf20183efc..9e051aac2203 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5017,7 +5017,7 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	VM_WARN_ON_ONCE(nr_to_scan > MAX_LRU_BATCH);
 	VM_WARN_ON_ONCE(!list_empty(list));
 
-	if (get_nr_gens(lruvec, type) == MIN_NR_GENS)
+	if (!current_is_kswapd() && get_nr_gens(lruvec, type) == MIN_NR_GENS)
 		return 0;
 
 	gen = lru_gen_from_seq(lrugen->min_seq[type]);
-- 
2.43.0

