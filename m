Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667825;
	b=NYVB5BYG8zbROJSYPtnPKBhzz/zB7s366oR+Fu0zoldTJ8PppiwzQX30M5RXinfcrJRH
	 dbkC673ZV7ty5OylC+YBoSeJPqZyKKG2ZAst1+x2IvOH898Z0UhwRPe7K2Eb4FGrXFhY+
	 OQBmz6Uejxt/RQXcoVccqMLRIiXvXfQ2RIgPHZ1IivaKZGJxYWzgOw2wghzbZpL+kxNbl
	 WH2oPN2U9Txz1U6EdHBH3dAwxHBExi492OekddvjX4TaAfXyuRnrkOUZ/ESicp/lWKHnx
	 vv+KddC7H4S/3zb7OP0dcnWyI6QCQyi9WqsN5skChUMILwCsWR+OuAFmmGbAN0WxOMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lJc/y2I20WRTL00Fzg1UskbrU2jIAE41tHgcdSdOm3s=;
	b=heMDRmkPZdbNzFrSdEm1/t0dmwWzIXPDFrr0O+WY4qdxw6Tk5XOYlP3TL6xjMuHXR1et
	 yZzOuK9FynfoJhzrFiHS4Ni37PV/eMXIO8sj16WYJk750v077JzwqasloQV7k2R4D0YXO
	 i6iQHEVgZChnpfdtoTTppBJK5wV2YPfgiI2NYKRfEji2h2FY2C4U1KPwIb3LM/xP77EX0
	 XthCRp0OBO5eMtUVii5EaEPb1SXKToh32+KUmyUfQZm7qDo/Zph7tNmJSCQP+1nKo2Lq4
	 f6WgRd+O6ahppUTmHhfpXcA039/21O5UqLJHGuHzO8afL7nLuIGLe6igRdyBeu2OoHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLLkAUJD;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E887606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E887606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLLkAUJD
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ed28bac8d7so8552465ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667825; x=1795272625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJc/y2I20WRTL00Fzg1UskbrU2jIAE41tHgcdSdOm3s=;
        b=xLLkAUJDTDHEJoQHpNIrdy+PoX6LRe/m728FqSwreaZ0iOP3sWX7Xax9U+Oubfk7hP
         XoD86KvafsLvopW4xo1jtsuQXXJMp89qahgeZ1gVEk5LHcbPTE5rUAtqEEJqkdITK1Nw
         NIwolkWir4v1h9RmQRnxxmhgsdydS2WCXHn/BHskbMNLR9Ffwq6fuM6heT94ZqBKWUiq
         j5qPis9FNsNmnJnFtNEvR1c+oL9PKYTQskHOoNFFcC9VCMkl6i4TXnbTTdppbq3fmt77
         ST8xv7SRyGlqLlp9Huox2gk3HSPmdgAlmm1V15VPvuU+a4rR+TQdpJjxmyAluBWE1xKP
         JOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667825; x=1795272625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJc/y2I20WRTL00Fzg1UskbrU2jIAE41tHgcdSdOm3s=;
        b=y/pPljoNdv01wGhCJf66xTc7sRAmYMLi1b+7caWOJdP2pi/f68tyJfxCNfZhsvNeWA
         EcG4/vB7LNms52VA9wnYW4LlenXhlaSTkHOSNJDM1BpdQEYICL9C8E4olcdAqzKGTBs2
         0QH7L1gjywS78SAWSP8ceDtlROb0HUghLzdDTJ16ptRphpb0G+/g8neU2f9aSirmkPRq
         JmyrrdSuasNct9HIwGWKqFfXCrtSyJpb0eQOiXyBhvIsxnCI075bO4UqDymEiF1UUFlZ
         e0Bvdyn+1ZJIHtIWD+c3oqOMPOjIi8qdUEaT2HfJaXOCZPehpDNzXhU/s/9MfBSd4AHj
         opBQ==
X-Gm-Message-State: APuU4Z+8PKvc+cn5ZaVZhOGen8e4L5T74XIZCkNGvFQAL2xMBHIt4Kqs
	yxLXVz7IB5DL5KgkSX5DG+Zg1WR4AaToJZ/zz6YVhpFS1b5RpLOxluXH
X-Gm-Gg: AYBFou0dvvAvgM/9gVc62lLnT/B+Cr6K+QeRK0qsfWg+e2v34d5bx2AkYN1jchMH3YF
	hENFDf/yTQSkMb5qLajUcNMbZpZTEOzvGKlLiEYl4o76y/tS4tpAz/oSOCsuS2A2DgL0SgqVP59
	Shh6SeuxsnyRiYnr8xDx73rgooVT4rLP2lSYZ8hboIR3M1w4z5XIVH71YgDbTWBF4cApn+raChE
	wpUGSXkWPjGbD2e1JA3Ozmpkzuorfd2XOfOou7Ypc/W5N43ml00BElDsQRCvL87x0WSc3mWTwNj
	iCBGEi2tyFqZtrrdnmCt3c6uVTdo+fW1bwkASnD75ty7r+iQ84R8+g5VuebDfKgUwFu/aRAqZZn
	GDXYiJl9+O2aSMm1PSiMHJnr4Mh2/7xA/Mcnx3UrRZ/Cu0PjHG6LQh+TtRr2bhs7tGZf0X8WF9H
	yTZYFhOYxHtQHn6hWd0Yv8R0w16ZH6/XS7KobpOjPaeFvBeBAMVriQn2k8fS0tx+SRzSnxK/xAq
	nWW6uwapgEownAwuxHN+NUzRLbLB55rCptpLhSfIEuWv+BptvP9/iBU0U1hAJDuMaKbALt1npSm
	vbYUZF/X520DA30x0+aIodofNpJ0VyVN25qMknmTC7fxNr9ySy9m8HD24YZ9jTfWjssN
X-Received: by 2002:a17:902:c401:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2ee0d9fce78mr42048925ad.3.1794667824888;
        Sat, 14 Nov 2026 06:50:24 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d708fsm20733985ad.58.2026.11.14.06.50.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:50:24 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v4 07/18] mm/swap: consolidate swap inuse accounting helpers
Date: Sat, 14 Nov 2026 22:50:09 +0800
Message-ID: <4e554bbb557d0456c953d73f008875f6d983b12f.1794666741.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794666741.git.lianux.mm@gmail.com>
References: <cover.1794666741.git.lianux.mm@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Inline the swap_usage_add/sub helpers into their only callers and
rename the callers to better reflect what they actually do: track
per-device inuse page counts.

Keep the existing accounting and allocation policy. In the inlined
full-device path, reclaim work is scheduled before availability removal
rather than afterwards. Slot-free notifications and zswap invalidation
retain their existing order.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 64 ++++++++++++++++++++++-----------------------------
 1 file changed, 27 insertions(+), 37 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 277a5c749987..aa020f2706b4 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -49,8 +49,8 @@
 #include "internal.h"
 #include "swap.h"
 
-static void swap_range_alloc(struct swap_info_struct *si,
-			     unsigned int nr_entries);
+static void swap_device_inuse_add(struct swap_info_struct *si,
+				  unsigned int nr_entries);
 static bool folio_swapcache_freeable(struct folio *folio);
 static void move_cluster(struct swap_info_struct *si,
 			 struct swap_cluster_info *ci, struct list_head *list,
@@ -1045,7 +1045,7 @@ static bool __swap_cluster_alloc_entries(struct swap_info_struct *si,
 	if (cluster_is_empty(ci))
 		ci->order = order;
 	ci->count += nr_pages;
-	swap_range_alloc(si, nr_pages);
+	swap_device_inuse_add(si, nr_pages);
 
 	return true;
 }
@@ -1363,53 +1363,36 @@ static void add_to_avail_list(struct swap_info_struct *si)
 }
 
 /*
- * swap_usage_add / swap_usage_sub of each slot are serialized by ci->lock
- * within each cluster, so the total contribution to the global counter should
- * always be positive and cannot exceed the total number of usable slots.
+ * swap_device_inuse_add / swap_device_inuse_sub are called within cluster
+ * update critical sections and serialized by ci->lock within each cluster,
+ * so the total contribution to the global counter should always be positive
+ * and cannot exceed the total number of usable slots.
  */
-static bool swap_usage_add(struct swap_info_struct *si, unsigned int nr_entries)
+static void swap_device_inuse_add(struct swap_info_struct *si,
+				  unsigned int nr_entries)
 {
-	long val = atomic_long_add_return_relaxed(nr_entries, &si->inuse_pages);
+	long inuse_pages;
 
 	/*
 	 * If device is full, and SWAP_USAGE_OFFLIST_BIT is not set,
 	 * remove it from the plist.
 	 */
-	if (unlikely(val == si->pages)) {
-		del_from_avail_list(si, false);
-		return true;
-	}
-
-	return false;
-}
-
-static void swap_usage_sub(struct swap_info_struct *si, unsigned int nr_entries)
-{
-	long val = atomic_long_sub_return_relaxed(nr_entries, &si->inuse_pages);
-
-	/*
-	 * If device is not full, and SWAP_USAGE_OFFLIST_BIT is set,
-	 * add it to the plist.
-	 */
-	if (unlikely(val & SWAP_USAGE_OFFLIST_BIT))
-		add_to_avail_list(si);
-}
-
-static void swap_range_alloc(struct swap_info_struct *si,
-			     unsigned int nr_entries)
-{
-	if (swap_usage_add(si, nr_entries)) {
+	inuse_pages = atomic_long_add_return_relaxed(nr_entries, &si->inuse_pages);
+	if (unlikely(inuse_pages == si->pages)) {
 		if (vm_swap_full())
 			schedule_work(&si->reclaim_work);
+		del_from_avail_list(si, false);
 	}
+
 	atomic_long_sub(nr_entries, &nr_swap_pages);
 }
 
-static void swap_range_free(struct swap_info_struct *si, unsigned long offset,
-			    unsigned int nr_entries)
+static void swap_device_inuse_sub(struct swap_info_struct *si, unsigned long offset,
+				  unsigned int nr_entries)
 {
 	unsigned long end = offset + nr_entries - 1;
 	void (*swap_slot_free_notify)(struct block_device *, unsigned long);
+	long inuse_pages;
 
 	zswap_invalidate(si->type, offset, nr_entries);
 
@@ -1431,7 +1414,14 @@ static void swap_range_free(struct swap_info_struct *si, unsigned long offset,
 	 */
 	smp_wmb();
 	atomic_long_add(nr_entries, &nr_swap_pages);
-	swap_usage_sub(si, nr_entries);
+
+	/*
+	 * If device is not full, and SWAP_USAGE_OFFLIST_BIT is set,
+	 * add it back to the plist.
+	 */
+	inuse_pages = atomic_long_sub_return_relaxed(nr_entries, &si->inuse_pages);
+	if (unlikely(inuse_pages & SWAP_USAGE_OFFLIST_BIT))
+		add_to_avail_list(si);
 }
 
 static bool get_swap_device_info(struct swap_info_struct *si)
@@ -2059,7 +2049,7 @@ void __swap_cluster_free_entries(struct swap_info_struct *si,
 	if (batch_id)
 		mem_cgroup_uncharge_swap(batch_id, ci_off - batch_off);
 
-	swap_range_free(si, ci_head + ci_start, nr_pages);
+	swap_device_inuse_sub(si, ci_head + ci_start, nr_pages);
 	swap_cluster_assert_empty(ci, ci_start, nr_pages, false);
 
 	if (!ci->count)
@@ -2999,7 +2989,7 @@ static int try_to_unuse(unsigned int type)
 success:
 	/*
 	 * Make sure that further cleanups after try_to_unuse() returns happen
-	 * after swap_range_free() reduces si->inuse_pages to 0.
+	 * after swap_device_inuse_sub() reduces si->inuse_pages to 0.
 	 */
 	smp_mb();
 	return 0;
