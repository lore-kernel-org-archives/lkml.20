Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190E839E17C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666974; cv=none; b=cGt7Xft60S4eYIqnNIfqBy3NJpEHOCyDIsb5t6h9Xo/Ns6rjpvlGfNmvZRomt8qwZkcne4F8UI2POuhQAEvHCZbAawz4yrIsfdM8tjkSnM8/ovOg36P+s1eJ9efuc9fLe+6G8D9luQhRkBGNKtm8GVK6HLfkDcPW6UF6Alb0mAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666974; c=relaxed/simple;
	bh=4wk5KKmKo4h2zsBW/4BfJqPIff7Vyg5W7vpSAdmPF60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6ImG2FG1Flr7VLC4cBifDRdXpTnEbP8e4D0OZ0yhmHgB34XSBsT+++gPfNXxyu1Ymzk2jGhyTFGl55DrQV03IPqUOBqD3Wf3zrdHF1pp5aMgD1Kw7+pNUW2NErn3XOALjUUcQ/0GliJwu9B/lVt9ltA1AE8dASDRFn80q9+8+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rDHseLAK; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rDHseLAK"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so1427135a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666972; x=1791271772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvhgplSZpkv24SdFucedZ8K8vw+xrsVtOmMflZvHgWM=;
        b=rDHseLAKGPNlV10AAFq3R52lTsDVMuU0uqNIJm3Crjlvp780fLjhhJm4YunEeJ+43C
         5RsSbzp/p5UajVmG4mwLk0BjaB6Sh8b7BAbdLWI+pa4FWyStYRJ4TySr6rEZhZ2oJXjQ
         A9r4ubJerLfmjdno4fl9QdNl5KoH+EjC1wZDJskL0XeigAbVieaA80An+cOdqqo8MhkO
         1DjOTkesQUx1MDNGUF2MAVjtJZ5kLc1jwNvleoSzsO0WxpT3/LX1yvAsLj5b47W95RNs
         mLOnc8c7l2Wt1RUmkK68H4aRFCMOSAxay03spqdDPeAUmRd+gGQDpbbqT+GaZdjtptBU
         kf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666972; x=1791271772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvhgplSZpkv24SdFucedZ8K8vw+xrsVtOmMflZvHgWM=;
        b=V+H6RxsHNKB5ssxO+Q9ObJdIyJHC+wulUPgTbzsrLfPygdh3QQR10PE6Tfg91UrR6w
         SYRQ1gEFej7S4q1fAhcfyrUGkipGQm4xhtutPfKJCtF89TzdjthL/YMe8NYqAU3DbhdQ
         E1x5VUvM/KoWEqTNoAp/XJ7tVA7X4ZPIgCzouHTZ3Mif6xDD0DopgakE+i9z0vHmwKx5
         lAmpmyKbXhAKOczrImt+cW4SViJsqg/ArdbOH2J6IvEZ9Ezjs6swjhgnRzHBHiV/6L+C
         hj/GCZpe9V3uqqDmNukzAtXMziKVkSBv/b/lYeUkUEinNsNTsSeoX0tx6rLRTuVhEB9S
         V9aw==
X-Forwarded-Encrypted: i=1; AKwUvByGioe7OLxyafajAfgHvE+ZVp49vcx1igj0eLSENJ5Qkdmgcj4ZR7XlB07gPIiY6SneqRBIsPSXtRWiT0U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBirUyM1KWOxV9k+YjhdwdSELD+Y5A4+5H0baiYI8FJVzoRFrJ
	NK4FIIVu83Q1rObvSlkFnhNPiwdnRo6pZoJlQfm7n0Sgmb9AOYetErYVhTreOwkQwIQ=
X-Gm-Gg: AYBFou3KHab0Ks6HANqUQDu68BoBm2EtZzjl3Rue5dQvAiyEg9OfhxWNrRvYbjD0UP7
	x4CIVuwXmnnnwyXXGgFjB2K0FZtJLc4DEsq9VVJ93ngLBrkP0Jw4oxib0YSEfERcjlWcyKnJSpN
	wSiiIw08z9U4M5/Yxlf8IS561JAEBINFpZZu1JXxolaArymb5n2HUbbR/K2fF9UNVBOXZzHDi7a
	yvrGN+poadqcosjvmH3TDd2JP0oyFtqJcaX8DncDlJnaIZGWVuL9dkC55V13MjavX7+xZZkx147
	vvf3Z8DnULe1KvIkWI4a0jvD4yIH+6vVC/5+3YZBM/PCwPkSKFVLby2dbmK4eOT86PcDhtBltof
	XbgTq6RaOEuAWeR54k9ZMwntoKIyapippqPfxh6K9Inb4kAyWDBTFI+cIMomsHQJo7pA52h3dMf
	QwOtvarpfP5nmsdF6P7629wkLNV8jIGWb438R4d8kn0TOQbiST3/W3FUjth9wdhQ+OSXtuANzBq
	3knsp7fHJgY7h8u4hSzk5U2hZfyyOQSdck=
X-Received: by 2002:a17:90b:280d:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3a49c11ea0amr976130a91.13.1790666972219;
        Tue, 29 Sep 2026 00:29:32 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49804220fsm3900170a91.12.2026.09.29.00.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:29:31 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Wenjie Qi <qiwenjie@xiaomi.com>
Subject: [RFC PATCH 1/6] f2fs: generalize metadata cache shrinking to explicit lists
Date: Tue, 29 Sep 2026 15:29:14 +0800
Message-ID: <7dc9f012e5d75603c38891ee71132b8ca445a5a7.1790665952.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790665952.git.qiwenjie@xiaomi.com>
References: <cover.1790665952.git.qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The metadata-cache shrinker currently operates on cache->lru_list.
Node-cache compression needs separate raw and compressed queues, while
keeping the existing isolation, truncation and refcount rules.

Move the common shrink loop to f2fs_shrink_cache_list(), and pass it an
explicit list, population and scan budget. Existing caches continue to
use their current LRU lists.

Also return the number of examined entries for queue-specific reclaim
accounting.

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/cache.c | 30 +++++++++++++++++++++---------
 fs/f2fs/cache.h |  6 +++++-
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 38fc5eb17f92..8f81aed132ed 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -547,8 +547,10 @@ void f2fs_destroy_cache(struct f2fs_cached_block_list *cache)
 	goto next;
 }
 
-static unsigned long f2fs_do_shrink_cache(struct f2fs_cached_block_list *cache,
-						unsigned long nr_to_scan)
+unsigned long
+f2fs_shrink_cache_list(struct f2fs_cached_block_list *cache,
+		       struct list_head *head, unsigned long nr_entries,
+		       unsigned long nr_to_scan, unsigned long *nr_scanned)
 {
 	struct f2fs_cached_block *entry, *next;
 	LIST_HEAD(dispose_list);
@@ -558,15 +560,15 @@ static unsigned long f2fs_do_shrink_cache(struct f2fs_cached_block_list *cache,
 
 	/* Phase 1: Isolate candidate entries from LRU list into dispose_list */
 	spin_lock(&cache->list_lock);
-	list_for_each_entry_safe(entry, next, &cache->lru_list, list) {
-		if (scanned >= cache->num_entries)
-			break;
-		if (scanned++ >= nr_to_scan)
+	nr_entries = min(nr_entries, cache->num_entries);
+	list_for_each_entry_safe(entry, next, head, list) {
+		if (scanned >= nr_entries || scanned >= nr_to_scan)
 			break;
+		scanned++;
 
 		/* If accessed, give it a second chance to rotate to tail */
 		if (f2fs_cache_test_and_clear_referenced(entry)) {
-			list_move_tail(&entry->list, &cache->lru_list);
+			list_move_tail(&entry->list, head);
 			continue;
 		}
 
@@ -620,16 +622,26 @@ static unsigned long f2fs_do_shrink_cache(struct f2fs_cached_block_list *cache,
 			freed++;
 	}
 
-	/* Phase 3: Splice un-reclaimed entries back onto cache->lru_list */
+	/* Phase 3: Splice un-reclaimed entries back onto the scanned list */
 	if (!list_empty(&keep_list)) {
 		spin_lock(&cache->list_lock);
-		list_splice_tail(&keep_list, &cache->lru_list);
+		list_splice_tail(&keep_list, head);
 		spin_unlock(&cache->list_lock);
 	}
+	if (nr_scanned)
+		*nr_scanned = scanned;
 
 	return freed;
 }
 
+static unsigned long
+f2fs_do_shrink_cache(struct f2fs_cached_block_list *cache,
+		     unsigned long nr_to_scan)
+{
+	return f2fs_shrink_cache_list(cache, &cache->lru_list, ULONG_MAX,
+			nr_to_scan, NULL);
+}
+
 unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
 					unsigned long nr_to_scan)
 {
diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
index 6c4db910d767..c4c3d09a0008 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -222,7 +222,11 @@ void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
 	f2fs_drop_cache_range(NODE_CACHE(sbi), start, len, true)
 
 unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
-				unsigned long nr_to_scan);
+					unsigned long nr_to_scan);
+unsigned long
+f2fs_shrink_cache_list(struct f2fs_cached_block_list *cache,
+		       struct list_head *head, unsigned long nr_entries,
+		       unsigned long nr_to_scan, unsigned long *nr_scanned);
 
 #define DEF_DIRTY_CACHE_TIMEOUT 5000
 #define MIN_DIRTY_CACHE_TIMEOUT 100
-- 
2.43.0

