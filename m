Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444DF2E54B6
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787989340; cv=none; b=M3i7sYVmX/q0ezM3LyW0pJT+xciiKla9/7OxWXIFyNlH1D23+Gx+Eore5Ep2wjqaCC1m5Xrc7ySHu0OhbJW+HgqwprGQvrXXUBRjtfXLNbGo9aloghxo2GN4VkWCQkhBeso2qfvFUkGKqs2ZQX9FngI3vAib9qEut/cYL5fY37o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787989340; c=relaxed/simple;
	bh=bxI5llQDDHwdoVi7ZJ4fOKKs1z0W++CUOXMmbVQH9Ww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SNjAVZ+6RaZdCHiDSljJs95fsBMMfu83apjpL/WFP7DnNk2C8JlJ//w5n3RBrJaSz4blRjPbkq1ssMenIJ6mHmbK6/MOkkDqdZXNYHzkH8cP7Lm//VTbbzGkMaHj8XHHjcxScXBElCpUKJ0hbJDX727dFVjBP3GJwkNq6Pjq3Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ln6IGQ3W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ln6IGQ3W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851F71F00A3E;
	Sat, 29 Aug 2026 07:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787989339;
	bh=Ae9c4vZDXmNsxI4AdcLQro9NNVm5MPBZzf84/REbvA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ln6IGQ3WV6IeHmrg10U5ceIy56PEPVtGtpAAax24IdWmKpTzpp+86hL3xcu3AaJqL
	 INTubcliazpz9aoUI1sdyqJJ0+gULgCpcq07nzu5PWTc9rXbONFKfOPoeBVmuoi6nP
	 jSoI+bKv0JTaeppyswbN02SjOZFC9N0FKhd7zXmHJchIjeWpLOgnlCxhkS2FFKJQfy
	 i4x10maRQcYmjeY6+3JqjMvB2aKeIv0Q4FCgaGVoy0W/1cm4c9TZLl8wZLS5AxINJ3
	 r8ttq56E1GZfaWlBBezM0HVFmf2iZC83RSqOu1nKBfbbdONpI+bT7O4icpvyrgt0kh
	 fzmmEZFuN3ZVQ==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	Barry Song <baohua@kernel.org>
Subject: [PATCH v2 1/2] mm/mglru: make type fallback logic explicit in isolate_folios()
Date: Sat, 29 Aug 2026 15:42:03 +0800
Message-Id: <20260829074204.45304-2-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260829074204.45304-1-baohua@kernel.org>
References: <20260829074204.45304-1-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ridong Chen <chenridong@xiaomi.com>

The for_each_evictable_type() loop in isolate_folios()
is misleading: it does not actually iterate over each
evictable type. Instead, get_type_to_scan() selects the
type to scan, while the iterator `i` merely bounds the
number of attempts.

Make the fallback behavior explicit in the code and remove the
opaque for_each_evictable_type(i, swappiness).

Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 46 ++++++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index fdd13299a04a..35a233623368 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4838,35 +4838,41 @@ static int get_type_to_scan(struct lruvec *lruvec, int swappiness)
 	return positive_ctrl_err(&sp, &pv);
 }
 
+static inline bool is_single_type_reclaim(int swappiness)
+{
+	return swappiness == MIN_SWAPPINESS ||
+	       swappiness == SWAPPINESS_ANON_ONLY;
+}
+
 static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 			  struct scan_control *sc, int swappiness,
 			  struct list_head *list, int *isolated,
 			  int *isolate_type, int *isolate_scanned)
 {
-	int i;
-	int total_scanned = 0;
+	bool type_fallback_allowed = !is_single_type_reclaim(swappiness);
 	int type = get_type_to_scan(lruvec, swappiness);
+	int total_scanned = 0, scanned, tier;
 
-	for_each_evictable_type(i, swappiness) {
-		int scanned;
-		int tier = get_tier_idx(lruvec, type);
+retry:
+	tier = get_tier_idx(lruvec, type);
+	scanned = scan_folios(nr_to_scan, lruvec, sc,
+			      type, tier, list, isolated);
 
-		scanned = scan_folios(nr_to_scan, lruvec, sc,
-				      type, tier, list, isolated);
+	total_scanned += scanned;
+	if (*isolated) {
+		*isolate_type = type;
+		*isolate_scanned = scanned;
+		return total_scanned;
+	}
 
-		total_scanned += scanned;
-		if (*isolated) {
-			*isolate_type = type;
-			*isolate_scanned = scanned;
-			break;
-		}
-		/*
-		 * If scanned > 0 and isolated == 0, avoid falling back to the
-		 * other type, as this type remains sufficient. Falling back
-		 * too readily can disrupt the positive_ctrl_err() bias.
-		 */
-		if (!scanned)
-			type = !type;
+	/*
+	 * We are running out of the current reclaim type. Fall back to
+	 * the other type if allowed.
+	 */
+	if (!scanned && type_fallback_allowed) {
+		type = !type;
+		type_fallback_allowed = false;
+		goto retry;
 	}
 
 	return total_scanned;
-- 
2.34.1

