Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157FD3612EF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408124; cv=none; b=qCFdBhBRFCOcKbSl2x5179AMt9W2+RG7L5ih4KGIKaF7QaYgEzscq04HArkwaRA+ZYrkX9dcTHEKLjiGwbcKG9LOB8aHxC80DsR35stKyrm8dcxPxBNleyncMeEk8QB8LOgydJv69DGvFuMmxIxhn1wSwMTfZW6r8NmX3qElTBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408124; c=relaxed/simple;
	bh=FPC0LASKA8XZ+uJlJeSZb9xgQ7xAyua0+/Z3Jo9IRw0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mqgbObhdLtDnbhaI79LoRyx9wFOws44CPqTWgQqS7YLzeUcUeuzzAtc0TFpFIZvvT4+kFm+jWz+ZX5Cx2mDH19xF1ybUIqbLvS63AwSp5bvghLVoMpEnOHhkdihBiuL0Z/Adjs2UaCQDi8DkubsRsdj0h5WGhJcIz9qit5KCcDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sNlp3nUj; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNlp3nUj"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d9520b9155so17623835ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788408122; x=1789012922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c2j9BPK7EzJ6AgBVF36vfvt7WxuniwU8KIatWFyFN8M=;
        b=sNlp3nUjlbuNejoIZZq7zyaUfZEJJUEzD5r1nu7LqBMJsoG88H3EZvpBA5fz4VEDTF
         lXZf/BLaN4QHuQ1o9QmlFZPeo1vnKMNoKaf9naS+R8k7Hpbg2fI1UttOgvJIoJZv6e/x
         E0pzuwBngUYxHTmNOtVi3mtcJZOUOtGk43NGQgHvFlAYxOvyftm5LpaEfFoQUWAHtta9
         v5H+h/EWKZFtcAhpFsnXvoDrflhZPcvCFYYO4htZPFWZJXHitsVVH5Bm+fCuEE409Yo5
         yoGgzEvrS2OR2iNQ90GDQskpN+CtunjR5TOcd5/4Diw5yJnIMM0VD7Ab5GpasYdpL/di
         Gw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788408122; x=1789012922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2j9BPK7EzJ6AgBVF36vfvt7WxuniwU8KIatWFyFN8M=;
        b=IdN6yk3jpH+3OxIZBKgIosu1GYcwDeCjZdm8MuoK2oX4AgKxOzdchWDXP0gqdfiSjr
         N5l6lMVsrybvJBG721JtYpa7UVac7iHgEschTuxqfYKN1UsqvXW7Us3iuwa0eiBoPYcx
         2bo7VVm3o5mDlL7G/nzbxR1+NC4j3NZ/gSPQusK8Bh6Jo0S0NBRlteSHZ9IyX4W2N5Fu
         Z5ZdlIRqPHYdEv65/dCw9flL9N7fZft/qya11j1050ZxONCUqk+6QzH+gCimtmKP7w9w
         JLMt37xYE0h6rNH+P3lzBGSWFg+LgBSDFl09eghMNQ5n1fgERPmDXk8fcU1CW10Rcr51
         arCg==
X-Forwarded-Encrypted: i=1; AKwUvBxg9icF5j+pUo9oieJ7mJQ6Cn3SpEXW+uyecdCXRw62Xlqi6EJ4X3WIJRQ1IUHgNQUqFBNA/MEaKlyd89o=@vger.kernel.org
X-Gm-Message-State: AFuF++kl/0L7t1Gs4Itn3SWbe806dzIjwCjFkuz8tYF7GlodAlMrbcJ3
	Dl1L6JuqY/iJmuDQHJYUwvk07TPIobmHdxScBum9VoTwJdC+7KwxuABv
X-Gm-Gg: AYBFou02NOA4VehcsMI/lGNJMYFVSolDNFxZ6bZzn+OrdHt9IMB/7/QQb2Gyu0fU9ZT
	nSiKIN/PWhDYr2p0UBMMCbtFlM1KzX+dxCD6EKTTRORU1uVR/3kRiWBxaMOSvUCOme+QrjskT8n
	/GxTZk2PwQRbmrsxiY7wn8BsM103w+vCteTMHBuzs5was5NDqm6XnpPpqHwMQmu2UA6jtbxDliu
	4pMeDRbWq/dnYZAQpacS/ILlrg7/XZesQcW65ZnUMfFqDkK3gOLTjZPnfAry5GmwbAH6I7z36Mn
	pMkwL0SiBCUBsTNYmUQsdOYIpYSQm0z8gC6mG3LtEdiOJkK2+R/WRYsK8rvh5EjU6q9iu1BL7GE
	H1Z4v5bHS+tuRCsJwvYa8bSLzIhS90o1ktrrrmqiIACjIN4QvFwq5H3LN+yb2Sc91zablITYSWH
	j+WTMxjg5n7uYEA4nVzt+vvZp4mGA5kKzgJVDt+EnzczXGxBfT9kpClDZvYYLulflM+S/lPy9f9
	zaHOw==
X-Received: by 2002:a17:903:37c6:b0:2da:f7ad:cfea with SMTP id d9443c01a7336-2daf7add0a9mr82421215ad.8.1788408122363;
        Wed, 02 Sep 2026 21:02:02 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe62d1d1sm3185025ad.24.2026.09.02.21.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:02:01 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: akpm@linux-foundation.org,
	hannes@cmpxchg.org
Cc: kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	david@kernel.org,
	mhocko@kernel.org,
	ljs@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: [RFC PATCH] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache
Date: Thu,  3 Sep 2026 12:01:31 +0800
Message-Id: <20260903040131.4016290-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have observed some cases where memory is allocated with GFP_NOIO, so
we cannot reclaim any anon folios unless they are in swapcache. We can
end up spending more than 150 ms looping in `shrink_folio_list()` scanning
non-swapcache folios without reclaiming a single folio. This is pure
overhead.

This is particularly true on systems using zRAM, where swapcache is
relatively rare. So let's check whether anon reclaim is allowed by
GFP_IO and whether there is enough swapcache to make it worthwhile. If
the swapcache is extremely low, we're essentially searching for a
needle in a haystack, so let's avoid scanning anon in the first place.

Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
---
 mm/vmscan.c | 62 ++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 22 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 56708d1d2dfd..192bd0980121 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -339,6 +339,42 @@ static bool can_demote(int nid, struct scan_control *sc,
 	return !nodes_empty(allowed_mask);
 }
 
+static struct lruvec *get_lruvec(struct mem_cgroup *memcg, int nid)
+{
+	struct pglist_data *pgdat = NODE_DATA(nid);
+
+#ifdef CONFIG_MEMCG
+	if (memcg) {
+		struct lruvec *lruvec = &memcg->nodeinfo[nid]->lruvec;
+
+		/* see the comment in mem_cgroup_lruvec() */
+		if (!lruvec->pgdat)
+			lruvec->pgdat = pgdat;
+
+		return lruvec;
+	}
+#endif
+	VM_WARN_ON_ONCE(!mem_cgroup_disabled());
+
+	return &pgdat->__lruvec;
+}
+
+static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
+		int nid, struct scan_control *sc)
+{
+	struct lruvec *lruvec = get_lruvec(memcg, nid);
+	unsigned long anon_pages, swapcache;
+
+	if (!sc || (sc->gfp_mask & __GFP_IO))
+		return false;
+
+	anon_pages = lruvec_page_state(lruvec, NR_INACTIVE_ANON) +
+		     lruvec_page_state(lruvec, NR_ACTIVE_ANON);
+	swapcache = lruvec_page_state(lruvec, NR_SWAPCACHE);
+
+	return swapcache < min(anon_pages >> 6, SWAP_CLUSTER_MAX);
+}
+
 static inline bool can_reclaim_anon_pages(struct mem_cgroup *memcg,
 					  int nid,
 					  struct scan_control *sc)
@@ -348,11 +384,13 @@ static inline bool can_reclaim_anon_pages(struct mem_cgroup *memcg,
 		 * For non-memcg reclaim, is there
 		 * space in any swap device?
 		 */
-		if (get_nr_swap_pages() > 0)
+		if (get_nr_swap_pages() > 0 &&
+		    !reclaimable_anon_is_low(memcg, nid, sc))
 			return true;
 	} else {
 		/* Is the memcg below its swap limit? */
-		if (mem_cgroup_get_nr_swap_pages(memcg) > 0)
+		if (mem_cgroup_get_nr_swap_pages(memcg) > 0 &&
+		    !reclaimable_anon_is_low(memcg, nid, sc))
 			return true;
 	}
 
@@ -2674,26 +2712,6 @@ static bool should_clear_pmd_young(void)
 #define get_memcg_gen(seq)	((seq) % MEMCG_NR_GENS)
 #define get_memcg_bin(bin)	((bin) % MEMCG_NR_BINS)
 
-static struct lruvec *get_lruvec(struct mem_cgroup *memcg, int nid)
-{
-	struct pglist_data *pgdat = NODE_DATA(nid);
-
-#ifdef CONFIG_MEMCG
-	if (memcg) {
-		struct lruvec *lruvec = &memcg->nodeinfo[nid]->lruvec;
-
-		/* see the comment in mem_cgroup_lruvec() */
-		if (!lruvec->pgdat)
-			lruvec->pgdat = pgdat;
-
-		return lruvec;
-	}
-#endif
-	VM_WARN_ON_ONCE(!mem_cgroup_disabled());
-
-	return &pgdat->__lruvec;
-}
-
 static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
 {
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
-- 
2.34.1

