Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A758399036
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787989676; cv=none; b=qJ9uzH28rOa5vrzmSHyCclU9tQd7rce9rozxr2inS3l6ArantWa3ikPIVql9eGKuJCWRAHk3KtZat2wDjpqNLCNforQGUQDfFIqOJ5VQBs6qhL6zOZZfXLD2zZ+zDtHlFeWUy21kq9eqd+SpJz2HKeSB0HffCrWfmVO81regW2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787989676; c=relaxed/simple;
	bh=dMc3mNca30GEB/rfUITzpe5+BKZBQefCWx5qUlrHu5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eG0GxCY2BzlkjvJGmFXeXdtyweHb5OOL4o7bDuSF6XUtVw3psZkmxw4qaoSrJLALKn3Aglt9eWJ0JJWIRbT9eWvgnFqqSQzTkvPBuR/qVvkSG4LnYWLPPXQnhauxWpUtfVif2PEPXMKGNlIK0Hr0CiRN6KJPJOpQXAzQCzjz8z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/Pc5yVI; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/Pc5yVI"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-853e2610bb4so2043603b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787989674; x=1788594474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vGEGo1ju5lk19uFkoLxptYJ6h4M8dZ1YyQasiBTx1o=;
        b=c/Pc5yVIlFfj5+aRIiVot2qFlUco28PM0nOqxQa9jAL//t9YB9GJlfdvSWb+fr97LH
         urtReq5ELi4/Kuv8//ct+TqSW5CnX0HoyqySO05ldaWT+0QQt+Kt+oWNr3mmwbCkqtvx
         fnydlNkso0mdIuzLOKhXH4swzi676+lORK0TlrxE7E3iHD5Qud/bcgRT1liRiEZX17D4
         Wd/5Hliwxb3JSDSlVm31jL/+t6ZGBncXB1Nytr3ljuMfwLVO4nwt4qMBsH9NRbP9yNw8
         1+Hm71VV8cbyqnWMqC6xvXOpXqgCr4ddsxh8IGlz0lZNQr3le4HmTTleZx2zWvssCH5o
         VUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787989674; x=1788594474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7vGEGo1ju5lk19uFkoLxptYJ6h4M8dZ1YyQasiBTx1o=;
        b=awcTt/dB5kn2CBd1ptFyf7hxCju/yI/jAZKPFYRIlRouOpW32q/9HVEyNKsyxjCB4B
         w91FKy6CstSM2dbegJOeU2IMIUK09KPehiRwYz38I9v/J6aSra+tWOwE8mJ+XSektcmR
         cZLsugdkruWZJROwBY2T7IPxkYVNsw+fcRvbmNsXlTq8AKW9NdDw9m+UtHIs7SYGbyr1
         26S92aZt42afx05Ee2dCBLWDQZ0WrgFw8eDfWM2FD4K5+6UZ3PGArKlEoM4dBH0thvWV
         e/OimII+7eyoD5VmmfB4qT2vANzKkULvy4dKqxKssR9yXTpHUb1SiVNg+vLKEpPwazao
         kH0A==
X-Gm-Message-State: AFuF++m9cQyCCzOoziKrzIbRvjSY4WOnrgSr/lbZ+RYcUmiqKDWs0gvW
	BaXMcKz3vCtcS+agq2IcM/tcaQTv5svZoFTd1+pGoWNB8yeJUn7iT9FK
X-Gm-Gg: AR+sD10Y5oOfAFee+MXbaqL4pwmcyAAGFkYGUGZ/GoHu5K2edB3fp5vX49zrtVjt57H
	InH9zQyfNiWp7DwUVX/VmcW5NAPejQiE6TfxLGjM5Af+snkVPifQuXbxUBMIczDyRpABNqCUcuO
	IEJ5d1KcER0rC9Wz/ow0l2yKNm6r++ieWADFnICYwJwfHlpVmoR06qvPsVdw66rYvY74fP7yvdR
	5giWVT647Eed0gjY4LHhc3+V9DYjy4PDFMctL/Qm837KufSmWodYYOSKnwKJ3zc7SBAmHQbDAWg
	PhnITHx2FDU1b4ZJYHFE6hiTtwLPrfXmOFro1sE1cmoA2i9iTPSCvKmMYOXxUN4LINFAFrQq/0V
	4PT8xUPw2S8HpNz9AhGPF+26180EGY9oW3CArtiFTQiSf+H0WkKHrNgVrZS0JhHFddpB7knQER4
	gzIz3ZinaAN4ILpkFGPUR6F/r1+qIVkLaAX1BbSxjy2UaayxXL3brdl9Q80F9L0uuF4JqY7tZbj
	uO9BHphThBLiHlRzuGW9ROFx8Xn
X-Received: by 2002:a05:6a00:ae07:b0:842:63f5:d097 with SMTP id d2e1a72fcca58-854c6485ba9mr21043098b3a.3.1787989673723;
        Sat, 29 Aug 2026 00:47:53 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569f49ed7asm1340256b3a.8.2026.08.29.00.47.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 00:47:53 -0700 (PDT)
From: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>
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
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [RESEND RFC PATCH v2 07/13] mm/swap: consolidate swap inuse accounting helpers
Date: Sat, 29 Aug 2026 15:47:44 +0800
Message-ID: <20260829-swap-pcp-priq-v2-resend-7-68d3d925578c@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
References: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Inline the swap_usage_add/sub helpers into their only callers and
rename the callers to better reflect what they actually do: track
per-device inuse page counts.

No functional change.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang (ProcessMission) <lianux.mm@gmail.com>
Tested-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 mm/swapfile.c | 64 ++++++++++++++++++++++-----------------------------
 1 file changed, 27 insertions(+), 37 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 6809c099eecc..1fa6945d6415 100644
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
@@ -984,7 +984,7 @@ static bool __swap_cluster_alloc_entries(struct swap_info_struct *si,
 	if (cluster_is_empty(ci))
 		ci->order = order;
 	ci->count += nr_pages;
-	swap_range_alloc(si, nr_pages);
+	swap_device_inuse_add(si, nr_pages);
 
 	return true;
 }
@@ -1292,53 +1292,36 @@ static void add_to_avail_list(struct swap_info_struct *si)
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
 	unsigned int i;
 
 	for (i = 0; i < nr_entries; i++)
@@ -1362,7 +1345,14 @@ static void swap_range_free(struct swap_info_struct *si, unsigned long offset,
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
@@ -1975,7 +1965,7 @@ void __swap_cluster_free_entries(struct swap_info_struct *si,
 	if (batch_id)
 		mem_cgroup_uncharge_swap(batch_id, ci_off - batch_off);
 
-	swap_range_free(si, ci_head + ci_start, nr_pages);
+	swap_device_inuse_sub(si, ci_head + ci_start, nr_pages);
 	swap_cluster_assert_empty(ci, ci_start, nr_pages, false);
 
 	if (!ci->count)
@@ -2834,7 +2824,7 @@ static int try_to_unuse(unsigned int type)
 success:
 	/*
 	 * Make sure that further cleanups after try_to_unuse() returns happen
-	 * after swap_range_free() reduces si->inuse_pages to 0.
+	 * after swap_device_inuse_sub() reduces si->inuse_pages to 0.
 	 */
 	smp_mb();
 	return 0;
-- 
2.55.0

