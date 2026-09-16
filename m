Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA4047728A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547704; cv=none; b=IdFK4nTObZOhLdZjZ6J+p8Pg6at54OVs9uHUX5AU5lOUyLSBMx1DK8XTi9ATRW04A8WUd+dMnaehf9DEY5TJH8XH24xVpzEyxUZ3k5hz849fc/ruJBenCR5AZNG56l3jhJlrk3z2PWu8/jERpj3JK1cohfbukZgGZeRsni+9Ark=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547704; c=relaxed/simple;
	bh=LLGHJprvvf5IFct8YRDj+FQLeKxfU0IihEH5GvT7EAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O0jWQ4+qkjmESxfyMnYa2luzLLKjgRW8l5uWg9dlw4ndaiP/rP03YiNO32MX+jZFV2q6dLiRBHKReGxR2ymWoCvcvyHmGSmKKCZzM9raYzmqM8say/uEaVax34Jze/XEpYFPGgrvr2Wr5+vebvBI5u9sjgCHTVZwN4DDRCR6ciI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cd2Z9Sxp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cd2Z9Sxp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E0B1F000FF;
	Wed, 16 Sep 2026 08:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789547703;
	bh=Y8u9M/CPrZ8uUGb5gcQd+lDUMbsBuT9RIoPai58SWkI=;
	h=From:To:Cc:Subject:Date;
	b=cd2Z9SxpnkTdH1y1FcHDR85THhmLg1DVK79MLRBdRCJ7jrGFGuHz3EOm+1lgjoxQs
	 P99byAnWaXD9p8xXn89E3AzOKhuN5gv6rX/ijcdxo1mvHXXstI97IPXci9EHoIty0A
	 isqHt8/ClvZCSfl6A5yvhD7YHpgMN55ji+BD5O9eebKd2KXYy5tu/NWH7xhcqkVbdb
	 y18ExV8YCpBN8+4yS+awIntit5R05/OZJz0DxEkozrbpGB0mQjWG/aaXiTabpqut/R
	 R8pMJ2qPPM1ZU0RPNQKllljAnYCy/i8aM2jnZF38cEzu4FpqLcx/PmhYWVHRLJulV0
	 ZZf+8RpJDObzA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ridong Chen <chenridong@xiaomi.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/vmscan: avoid false-positive -Wuninitialized warning, again
Date: Wed, 16 Sep 2026 10:34:46 +0200
Message-ID: <20260916083456.4136132-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

I previously worked around a false-postive gcc-16 warning in the
get_tier_idx() function, by adding a fake initializer. This happens with
the -fsanitize=bounds sanitizer when the compiler creates a specialized
variant of isolate_folios():

In function 'get_tier_idx',
    inlined from 'isolate_folios.constprop' at mm/vmscan.c:4982:9:
mm/vmscan.c:4934:9: error: 'sp.refaulted' is used uninitialized [-Werror=uninitialized]
 4934 |         read_ctrl_pos(lruvec, type, LRU_TIER_MIN, LRU_TIER_MIN, 2, &sp);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mm/vmscan.c: In function 'isolate_folios.constprop':
mm/vmscan.c:4946:25: note: 'sp.refaulted' was declared here
 4946 |         struct ctrl_pos sp, pv = {};
      |                         ^~

Adding another "= {}" would solve the problem as well, but to prevent
this from happening again after the next code refactoring, try instead to
prevent this by forbidding interprocedural optimizations on this function.

Link: https://lore.kernel.org/all/20260213123902.3466040-1-arnd@kernel.org/
Fixes: 3de705a43a46 ("mm/vmscan: avoid false-positive -Wuninitialized warning")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 mm/vmscan.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 11387a0fbeeb..626d2fc78cc9 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3274,8 +3274,10 @@ struct ctrl_pos {
 	int gain;
 };
 
-static void read_ctrl_pos(struct lruvec *lruvec, int type, int tier_min,
-			  int tier_max, int gain, struct ctrl_pos *pos)
+/* __noipa works around  gcc-16 warning for uninitizled use of pos->refaulted */
+static __noipa void read_ctrl_pos(struct lruvec *lruvec, int type,
+				  int tier_min, int tier_max, int gain,
+				  struct ctrl_pos *pos)
 {
 	int i;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
@@ -4924,7 +4926,7 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 static int get_tier_idx(struct lruvec *lruvec, int type)
 {
 	int tier;
-	struct ctrl_pos sp, pv = {};
+	struct ctrl_pos sp, pv;
 
 	/*
 	 * To leave a margin for fluctuations, use a larger gain factor (2:3).
@@ -4943,7 +4945,7 @@ static int get_tier_idx(struct lruvec *lruvec, int type)
 
 static int get_type_to_scan(struct lruvec *lruvec, int swappiness)
 {
-	struct ctrl_pos sp, pv = {};
+	struct ctrl_pos sp, pv;
 
 	if (swappiness <= MIN_SWAPPINESS + 1)
 		return LRU_GEN_FILE;
-- 
2.53.0

