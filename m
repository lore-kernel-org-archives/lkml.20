Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624F448F017
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905445; cv=none; b=lamZw3A3shbwPUg6cxszuJzBmYy0q/djlEjYMgXLJp7zWhzONZqWSh9jFhYu7+BEpUwjZz8AZLcreoOA+v7nIujKUJ4FuayHrC8DLugdS9fDRKUUoyWt6HjJmXaGSXcbCz4gAvcqApg12p4B3l30QV++SHeot1P+gSVrJcf+bcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905445; c=relaxed/simple;
	bh=xSXuhfSAFXS+zY/N2kEvJ2MzIV8SUjri3eMHXmdgoto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kMHzCCseqJeKSwYz2Jee4Yyv/qL1C4OoYfpX4PoMuPMukPmezpXqf/qHCg7yiidTHqm8xMSDNPRy1gX/JbYuZUPqRXh81IvPWqZklGB8NIESco+r0CKJvCXebCXKj9NmVMyXFddV/ihSoACcqXKGDprEboldHoP9YkAVauMUXsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkWf0hWQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkWf0hWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788905439; x=1820441439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xSXuhfSAFXS+zY/N2kEvJ2MzIV8SUjri3eMHXmdgoto=;
  b=FkWf0hWQUQ1G25czWaFHR/LVK1w0XjciII34tywA3iJAOv5tX6oCUA6o
   9lDo8wBhIsw/ZelpmdGjYhoH1czyQ7iXXFhtmw+MPXDpmkmig72Hw9ZSt
   3GSNPErnhtViqJjAtscehD4247i72jU0RqkwROCJ9Zq7xtg4ZdHytV6xb
   VU0AQ3V4jXjdXldUU5cVxj5kCnzZSkxMadkQFwlWw9c26TADk7EfmNYbZ
   6S24qIaRBFbKgQHY5Lka6yhImkLqzYqyuJKqlsFoYe5MkfPhBQ0fk37pa
   kt4HIIL8tEaTgMyp5JYYHuDw6VqU7mF+PJLRM4sDelvu7gqO8dTNPVpKS
   Q==;
X-CSE-ConnectionGUID: WJ5oReczTuup1AKOTpzWdw==
X-CSE-MsgGUID: hl0bmOjoTXC9zO19c6s/7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93017404"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="93017404"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 15:10:21 -0700
X-CSE-ConnectionGUID: yyp09S+4SPC9WzJTE4n/Gw==
X-CSE-MsgGUID: Pe3kuIPCRnqE7EF/SiSPPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="296067798"
Received: from jf.intel.com ([10.165.154.102])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2026 15:10:20 -0700
From: Ehab Ababneh <ehab.ababneh@intel.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>
Subject: [RFC PATCH 2/3] mm/vmscan: handle racing max_seq advancement
Date: Tue,  8 Sep 2026 15:10:55 -0700
Message-ID: <20260908221059.14777-3-ehab.ababneh@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908221059.14777-1-ehab.ababneh@intel.com>
References: <20260908221059.14777-1-ehab.ababneh@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When kswapd support is expanded to multiple threads per node, concurrent
aging becomes more likely and try_to_inc_max_seq() can lose a race to
another aging pass that has already advanced max_seq.

Treat that case as success instead of warning, since the desired state has
already been reached by a concurrent updater.

Signed-off-by: Ehab Ababneh <ehab.ababneh@intel.com>
---
 mm/vmscan.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index fbb04848f59b..ad2b398a68f9 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3942,15 +3942,18 @@ static bool inc_max_seq(struct lruvec *lruvec, unsigned long seq, int swappiness
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 restart:
 	if (seq < READ_ONCE(lrugen->max_seq))
-		return false;
+		return true;
 
 	lruvec_lock_irq(lruvec);
 
 	VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
 
 	success = seq == lrugen->max_seq;
-	if (!success)
+	if (!success) {
+		/* Concurrent aging advanced max_seq first; goal achieved. */
+		success = true;
 		goto unlock;
+	}
 
 	for (type = 0; type < ANON_AND_FILE; type++) {
 		if (get_nr_gens(lruvec, type) != MAX_NR_GENS)
@@ -4045,10 +4048,8 @@ static bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long seq,
 			walk_mm(mm, walk);
 	} while (mm);
 done:
-	if (success) {
+	if (success)
 		success = inc_max_seq(lruvec, seq, swappiness);
-		WARN_ON_ONCE(!success);
-	}
 
 	return success;
 }
-- 
2.43.0

