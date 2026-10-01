Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4942D6E5A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790813676; cv=none; b=nzEP2rHT9Vbi+CLDCpa2WEtgqpV63d6rPHP+FRAmnRx+IkOZWR1Qwa5iqZJvijtk85/6TSqmY/Q/N5jwacpfFVP4SefiTezDfS4dhS/zMpQfm43N8AoRDh0U+uW5iuDNJrEV9JX9amj3Jl/Dl861J2QiQp9XtrKhKM6tMXYRL4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790813676; c=relaxed/simple;
	bh=PnQ9mYkenHs9iO3rUgzf9t5qAwJmI94kVI1iwCicS5o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DQYgsfbw8ZfzWCEYbTPTG5TunM+VT+UNCtl/mw3x72aZyrnJzYOnaBr/DZ7CMKqxCriXoZNhdVNPk5KHzCcsff418su8p7X3+1NzP995qWE6fUux2uPhnDo0BRQL7ONUPBJG13+yYtaLVxfGwX/duhEi33AylYrtDGXXSGc3/n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SB+qrDLy; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SB+qrDLy"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88379342f7fso2638022b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790813674; x=1791418474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DThzymHkL9wnq5SXCYvzVRPWszN2sf2yPmrh709iilw=;
        b=SB+qrDLyxXjiEU+FGtrZgU1xlhQyYFX1O3pXTlgPdwAOBtkoxSsGeAevPrFyoTm/IF
         /MpYNjPJAfOTt2Cx4wy0AGB1aKheCBfci6RO4QPcncOCJAPVwEdFQmDHno+taYqJbh/X
         8Ytkm6/FmVuQXMpR6HBB/UlLORbW3+4hywCXw3DFRUr4dABldrTHqqcsUIGaWsp4DjZR
         3DGBoF0WU95HM5BpJ+CffiH5yRsSerJjLcFY9SVid/tTMsRtEFbSH8g82CtTHJJdHyxc
         XaB9hoonlsvnF6IRAFro902Yau58ZWwfLp3RM/apEVk5v0x496lPwTsl9gkK8sj0/12/
         nStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790813674; x=1791418474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DThzymHkL9wnq5SXCYvzVRPWszN2sf2yPmrh709iilw=;
        b=QlN94VDc/I+pwMGRpRdnOBCRVsp08QaS3s8xU06SAth15lwyCu8r2EVl8aK8bewN9R
         BvqTug8061iM2QM5ZAWMJMrXffnRnTLmmRsgU0Y8SOg4VlZVCqjgFLRZj0Mp+l62OFf8
         XOWbhtj+Yi8LeZV0Lf0IY0IdG3Gs+LVByN3Sa3ozmxXl3b1xxUwNXXqeMhqJqReUHmci
         inCoMBnPZxilIKy47/Nb8nTFT7p0QlmEBUVzeXyiDAFsfvihEIdfmDungg+bx8B4s/WI
         RmZgj+9acLWbreTQUVVEcaa2F6X0ZGVAu9mQq664nLbtMAQ91DoQIsc230JN77cv/kY9
         +3YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsS0g04+8lmoRLXpNCUFZVe3QqNHYpQaqCvyo0VLaDIv1xw4wwwf0ZgrbAQsAjkDLqQukPJ/qXzUCD+iw=@vger.kernel.org
X-Gm-Message-State: AFuF++mhP7t7iFNyGh9KF1Nr4N1BFP0Oqs1RM0Ym8Ms8507G1DRyOjON
	VZ+gZq+xLDLQOq2jmIPFE5p9d3A0a/JJ8Wx8VSCMAySaS7bj5qKS8J8A
X-Gm-Gg: AYBFou0t/UVptXtavqNASlXudb5+MWNFLL8GdfTrDtIcdLQGl8GdftD8cUK2HdNWMBi
	z7N+Q+nshEW9btMmaZff3H0MFLPLbWjSjiRkQJQe6CTvCMLHfUP3HxrR3jaObcTIZELBCJ5MnBs
	INsdCuayp2ffRQ4/DLKnKNsoqnf9NX/j3V1iSxYeN/9K26aiqdU/C5l1SBLtpr1uwHhHBCze7YB
	Omv04dbRy45m1SlMUrlCp7EkcXE2/jp+IDh4MyWNaVpqaP72zg3WS/wfBYzzOjDq8zA1o6CGmZt
	PIFSmdn2Lt292Q27ViI6s2+sdmT4MUuO3Zrjd0rmJBHv1mFj+BA/o652hFlWMj1I4j/1PYRvBFf
	DMt6qRjqFtWoTTd0kR46S+6MUzOvKPz3rUo3JiJqdoKbHcT/7Vs8/Ffz/fWZJvUybuZUOEIIbHa
	RDlZycxMvp9HPyEJrl5DGfVsZsCppidrkkDmdDEHM7MmSKu8S8WM6nLwHLshgM5J3XoZYxAGZXA
	u4WP48V4ru8yjvt
X-Received: by 2002:a05:6a00:4518:b0:878:1aee:fa43 with SMTP id d2e1a72fcca58-8874a7a12b3mr2206721b3a.33.1790813674273;
        Wed, 30 Sep 2026 17:14:34 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818814b2bsm253287b3a.19.2026.09.30.17.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:14:33 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org
Cc: surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: [RFC PATCH v2 2/4] mm: compaction: target mTHP order for proactive compaction
Date: Thu,  1 Oct 2026 08:14:10 +0800
Message-Id: <20261001001412.3837085-3-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001001412.3837085-1-zhangbo56@xiaomi.com>
References: <20261001001412.3837085-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Proactive compaction triggers against COMPACTION_HPAGE_ORDER (order-9),
which is too heavyweight and misdirected for mTHP systems where the
pressure is on smaller orders like order-2.

Add compact_hpage_order() to return the highest always-enabled anonymous
mTHP order, and use it as the proactive compaction target in
should_proactive_compact_node(), __compact_finished() and kcompactd().

Fragmentation scores are not comparable across orders, a small order
scores much lower for the same state, so scale the proactive watermarks
down in proportion to the target order, otherwise order-2 would rarely
reach the order-9 threshold.

Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
---
 mm/compaction.c | 40 ++++++++++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index ecd3e6cf54fc..3928a5483efc 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -24,6 +24,7 @@
 #include <linux/page_owner.h>
 #include <linux/psi.h>
 #include <linux/cpuset.h>
+#include <linux/huge_mm.h>
 #include "page_alloc.h"
 #include "internal.h"
 
@@ -81,6 +82,17 @@ static inline bool is_via_compact_memory(int order) { return false; }
 #define COMPACTION_HPAGE_ORDER	(PMD_SHIFT - PAGE_SHIFT)
 #endif
 
+static inline int compact_hpage_order(void)
+{
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	unsigned long orders = READ_ONCE(huge_anon_orders_always);
+
+	if (orders)
+		return __fls(orders);
+#endif
+	return COMPACTION_HPAGE_ORDER;
+}
+
 static struct page *mark_allocated_noprof(struct page *page, unsigned int order, gfp_t gfp_flags)
 {
 	post_alloc_hook(page, order, __GFP_MOVABLE, ALLOC_DEFAULT);
@@ -2257,24 +2269,36 @@ static unsigned int fragmentation_score_node(pg_data_t *pgdat, unsigned int orde
 	return score;
 }
 
-static unsigned int fragmentation_score_wmark(bool low)
+/*
+ * Fragmentation scores are not comparable across orders: a lower order
+ * scores much lower than a higher order for the same fragmentation state.
+ * Scale the watermark proportionally to the target order so a small order
+ * can still trigger proactive compaction; COMPACTION_HPAGE_ORDER keeps the
+ * original threshold.
+ */
+static unsigned int fragmentation_score_wmark(bool low, unsigned int order)
 {
-	unsigned int wmark_low, leeway;
+	unsigned int wmark_low, leeway, wmark;
 
 	wmark_low = 100U - sysctl_compaction_proactiveness;
 	leeway = min(10U, wmark_low / 2);
-	return low ? wmark_low : min(wmark_low + leeway, 100U);
+	wmark = low ? wmark_low : min(wmark_low + leeway, 100U);
+
+	if (order < COMPACTION_HPAGE_ORDER)
+		wmark = wmark * order / COMPACTION_HPAGE_ORDER;
+
+	return wmark;
 }
 
 static bool should_proactive_compact_node(pg_data_t *pgdat)
 {
 	int wmark_high;
-	unsigned int order = COMPACTION_HPAGE_ORDER;
+	unsigned int order = compact_hpage_order();
 
 	if (!sysctl_compaction_proactiveness || kswapd_is_running(pgdat))
 		return false;
 
-	wmark_high = fragmentation_score_wmark(false);
+	wmark_high = fragmentation_score_wmark(false, order);
 	return fragmentation_score_node(pgdat, order) > wmark_high;
 }
 
@@ -2306,7 +2330,7 @@ static enum compact_result __compact_finished(struct compact_control *cc)
 
 	if (cc->proactive_compaction) {
 		int score, wmark_low;
-		unsigned int order = COMPACTION_HPAGE_ORDER;
+		unsigned int order = compact_hpage_order();
 		pg_data_t *pgdat;
 
 		pgdat = cc->zone->zone_pgdat;
@@ -2314,7 +2338,7 @@ static enum compact_result __compact_finished(struct compact_control *cc)
 			return COMPACT_PARTIAL_SKIPPED;
 
 		score = fragmentation_score_zone(cc->zone, order);
-		wmark_low = fragmentation_score_wmark(true);
+		wmark_low = fragmentation_score_wmark(true, order);
 
 		if (score > wmark_low)
 			ret = COMPACT_CONTINUE;
@@ -3239,7 +3263,7 @@ static int kcompactd(void *p)
 		timeout = default_timeout;
 		if (should_proactive_compact_node(pgdat)) {
 			unsigned int prev_score, score;
-			unsigned int order = COMPACTION_HPAGE_ORDER;
+			unsigned int order = compact_hpage_order();
 
 			prev_score = fragmentation_score_node(pgdat, order);
 			compact_node(pgdat, true);
-- 
2.34.1

