Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7213BB9E3
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791577852; cv=none; b=c6M+dmxbwra6qksPu6pwyFAP1yqE8mdUXYlxYwQNBtnPL6LflMRdwYqz0nOMGHO3S+PL6AJHKzy/mH9jOeWVNadHrDToJi4ogZQO1XsaqRT0ty+4jG92v5B22Uu0b7G8mEuvwy4e2/8vsoTdoWw2P5+zUytgAOkoC8Edl3HsFwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791577852; c=relaxed/simple;
	bh=hujIJUZ4rTi7dseLYz2hx4VmOA5gUj6Bw9iPs/6W+mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SVD/9LK+MPdsNgzr+M4pXC3lFV84qw1CbYlftttQF4C5k1xAZc7sHqWEpcMarxrMeLu2mIJ2uiznoVPjnZxN+HGTmUUWcKdYeHJcj6Ngi7A/X75A9aU9dFK/l0gfYmkwHVJUMjrpdZm7w7W2B8IYX5urrxctx0xDTaIfLJp81VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtGIO4nS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtGIO4nS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791577848; x=1823113848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hujIJUZ4rTi7dseLYz2hx4VmOA5gUj6Bw9iPs/6W+mo=;
  b=VtGIO4nSims3vr9FDodQXmS7+X7k4aOHafqS0qPTq+pqIe3PmRlXiU6b
   migsFl7PAoEJovbgQJePv+ln9Nrr7LcP/rfLe8+ZJnHbqvHrZG3+eC3t1
   IURHkAPK7Ltc5m8yQZ7bsLcQGETsh4/lx72Lo2E7/SrHANVyI0KbVVWNU
   MbW6Uk8Td81oQEhFx4VunckELPOskiz1GgQS1B7UI+8S0EB3pBYWKN2bf
   +IaTG61P71DIZtbIqfeZT3KstA+2EtB18IGAzZExXtFwqbr1j4+gYSSuW
   02NpobcXR7joCP9rKlG8IPdwbkdprsT60htuF9TSKPYfY6z2e7fZ9k0sG
   Q==;
X-CSE-ConnectionGUID: xlhsmLAGS2a1ilzn3k0gsQ==
X-CSE-MsgGUID: Fc25KleQQwK3PysRW9iLjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="284550"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="284550"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 13:30:48 -0700
X-CSE-ConnectionGUID: PGpDYAFsQI62LWoDEjC2YQ==
X-CSE-MsgGUID: x4gWQZfRRimLkmOaIPcDQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="2193191"
Received: from jf.intel.com ([10.165.154.102])
  by fmviesa012.fm.intel.com with ESMTP; 09 Oct 2026 13:30:47 -0700
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
Subject: [RFC PATCH v2 2/5] mm/vmscan: silence spurious max_seq race warning
Date: Fri,  9 Oct 2026 13:33:01 -0700
Message-ID: <d36878ce1bb144748505881db2f51edc0f2e30c9.1791577417.git.ehab.ababneh@intel.com>
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

When kswapd support is expanded to multiple threads per node, concurrent
aging becomes more likely and try_to_inc_max_seq() can lose a race to
another aging pass that has already advanced max_seq. That is benign and
not a bug, so drop the WARN_ON_ONCE that fires on it.

Do not change the returned success value in this case: a lost race still
means *this* call performed no eviction-enabling work, and get_nr_to_scan()
relies on that to decide whether to keep scanning this lruvec. Treating a
lost race as success caused threads to bail out of reclaim early under
contention, cutting reclaim throughput and leading to OOM kills under
sustained memory pressure (e.g. the Cassandra benchmark).

Signed-off-by: Ehab Ababneh <ehab.ababneh@intel.com>
(cherry picked from commit e14f205c5114bf2e9b13a733c71eb3372a1ba531)
---
 mm/vmscan.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 37ce6860c215..107011f51fef 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4116,10 +4116,8 @@ static bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long seq,
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

