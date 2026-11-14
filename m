Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667957;
	b=QXGUKXD5sGaR/CAYVgxNb9WQKRlh3CDALqhjCactCs/+c8Cw2RNURmE04wcKS3isoFB9
	 pOGEf7ZL4garBzuaN9mn63rKYu11X8LJcuTOJ1ETve4A5BMr8gBwlm9fInsqV6h7E7ffq
	 qFL9z9pqDOpkMihz6hWGD7vGkINA2GnArZGEs/ze841fXqW0MWI6uimRhy+FjfgbRMr81
	 3UllH1TdoATkjkmTaaNCl6XMhR/Ol39brDRgN8C02V54/G0nudv0O6yLeosXBwqjat9/M
	 QL5gNNnqPdBEkOrowrKO5jHLaMvXmPJdJ4nLBl3qufsAYUCILGsuXM+6fZfTxhcuiLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A3QqAYG/uE4i1SkonwP/uDxgDXolAyrEYNmgqxrP7PU=;
	b=fGGXtoUfs5RptxLlRu7hFC9eegr4LKWDhojwoPlfP3moFxYp/CDxZfheZ8BpiigJ3OSX
	 GRi95wD+FCScP5sMQTATw4k/kOOW/c8cfU6UycG4qhZZwYYQ20M2AH5B5todqKDrSvTwY
	 7txmdRuTJZ65D0t7kVF+jdGg4mRxkQPpeWoMR9S5u6I3E7twyvlsCBGROdM4UKy8kOkA2
	 sqa0maAMRPeD+gBrnWOyVtdZJLgV2QOEDMf1h1EWrVcfg+VBD5g6kANMAuwcWxncVsQqF
	 xcTkb6FvXpMHaB7yZK7nBoLf6RHSepO9y25M1c2L2DJl5WQVB0jUafl05hxbFv1fNOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ydcwPZto;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62770606A8AC
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62770606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ydcwPZto
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ed28bac8d7so8569965ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667957; x=1795272757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3QqAYG/uE4i1SkonwP/uDxgDXolAyrEYNmgqxrP7PU=;
        b=ydcwPZtohhbdg6yll3aXSA8PehfsJqyNMMy6Iaxzri/DJOz5kNXICNfBYDcjmz5aQy
         qk+Zsl/cgTwaACFiZj/Ceq4m9QMM7y/gkGD5OJ9KyNxVidtBHPJx8oDN0DApr79fpg12
         42Q4enSzZSuwRHIiGzABFK7Khq/NV/9dyMs1AxIfyWQv1w3b1gGf2JrnqLLBHqfAbWaG
         IlcFbTuHzNUxyCr4coxiYZwcJ7RyD4iUG9BGtzzRD8q1PjnMGE7odWk3GvwPLUkS7hbF
         sFvGmfV1MnA1FkGC4GSZscxPeF2FRhskyQp+o267R++ZRQzPd4N1Oz6Y8kDmhLWQiMzV
         IHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667957; x=1795272757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3QqAYG/uE4i1SkonwP/uDxgDXolAyrEYNmgqxrP7PU=;
        b=yvVNdzvQX+4G967jlEOGJ5gpJPINYBqhQCiz00/Myo3pDvgb82KI+UtHdhfyaHtY54
         eqAg5+oCwZ2eQyEbS5qMJabHSL7dcZHGcxcbTXq/145OaRptJ5AnRa6p1ovyKAjxTP5y
         m71Fy6mUECs4b7vKyFE2o9YeNPsFR+Ga7V/w3gdeDc3YH8Q+2SNOOgzBH0ei1F4pZFXa
         dZipwJlzdRhKbaIY3h7NnB36KEh7JxUky/fiLAEOco7edO5LAVmmPSqxu7zoLVrV+fu4
         kSI4ZI0FJmRIdqo+JVcfeFQyEvNCbjp/Hky5ivKZ5AeNLg9E9qK+VJS4wtYwmiyxNNKG
         ic7A==
X-Gm-Message-State: APuU4Z/tC2A9296Mao4zvEHCtc0PYSp8uawh9Xc3Bg8BzQVLKN/dU2eZ
	dG8vQc2QvUqzZfh5c+BQUU3jQ6Nz30a2BaXkLoakMrjlO2qG1REkzg6f
X-Gm-Gg: AYBFou1Ueave96/TPyFUu9h1VGHxslptMqj+ol/LFo2eSgIUhQG6ezt+ZOXT+IJAdje
	G4dUpR6MOQvsdYPXi9R2X6IFXYM00bYZvl63k1SmScx/Vho0SQm4bmUzRl4tRcQudVRMToI9upd
	EizlIXlku1LeC1c6Nm8QdLGKMusjWo7snwgxOS4nNRnSXItkhE/aUKN0kFC55VHPpewJniX63No
	Eaxh77OSpHdL8/0LLfH0YTSBSDiI+OFkqIVX59+WLbvq24rMqn4CCp+gkET0ryy1DbbvesXHX1k
	WUC3ZzaytIUzWWw+qjaKPTDZE41ogOeSr65hfoDUR4bxQ2QiT+3ZI+KfzbLWwh1MYZccQA6NzvI
	AD+LaveKL//p/pPJJ67fi8fhJgjhvyr+6UANX8M4rM+NjTg752+SoH9/JlyQoZr8U/GLdwwMStN
	WKYVksXEMBPAFMWj3Nressb5ASZfG9Hr69b97+gSbK4E3q6r2UuPf8gdh53iGcquy6rtnopWNKH
	rhFxpPWufTyXnvPpsJ8PtIS47aoxRPBHwbS3fs2GeGzxnA1/lrz6Jec1Tzjfc+On7n4qW42NBgd
	uVphFHR/SazVGhhHUXhi7tkC99sybGJYxPYurf0d7IKUes0QTbp14ykBuhPusZpZOBYF
X-Received: by 2002:a17:903:11c6:b0:2e6:f3ed:a551 with SMTP id d9443c01a7336-2ee0dd2a28cmr41758785ad.8.1794667956678;
        Sat, 14 Nov 2026 06:52:36 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f862426sm22028765ad.46.2026.11.14.06.52.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:52:36 -0800 (PST)
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
Subject: [RFC PATCH v4 16/18] mm/swap: advance the global queue cursor directly between priority rings
Date: Sat, 14 Nov 2026 22:52:27 +0800
Message-ID: <e72074ac198130494037e80655685cf25ff4bb5b.1794666741.git.lianux.mm@gmail.com>
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

The allocation walk previously passed a total retry index to the selector.
Each retry translated it back to a priority ring by scanning from the
beginning of swap_queue. Keep the ring index and the number of attempted
peers in the task-local cursor instead.

Snapshot the starting device only on the first visit to each ring and
advance each peer exactly once, including masked entries. Preserve the
large-folio same-ring boundary and the stale reader-offset correction.
The selector's complete walk is linear in the devices and priority groups;
device cluster scanning and availability updates have their own costs.

Keep the topology read lock and CPU migration protection across the walk.
The global selector uses only existing priorities and adds no per-memcg
device-selection state or ABI. Existing swap charging and limits remain
in folio_alloc_swap(), whose failure path classifies allocation errors.

The walk no longer returns an ignored internal error to that caller.

Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 51 ++++++++++++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 5e5c1aef010f..616339c5ae5b 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -195,10 +195,10 @@ struct swap_queue_reader {
 };
 
 struct swap_queue_cursor {
-	bool valid;
 	bool ring_only;
 	unsigned int ring_idx;
 	unsigned int offset;
+	unsigned int nr_iter;
 };
 
 static __percpu struct swap_queue_reader *swap_queue_readers;
@@ -308,28 +308,32 @@ static void swap_queue_install_readers(struct swap_queue_reader __percpu *reader
 	swap_queue_reset_readers();
 }
 
-static struct swap_info_struct *swap_queue_get_device(long nr_alloc, int nr_iter,
-						      struct swap_queue_cursor *cursor)
+static struct swap_info_struct *
+swap_queue_get_device(long nr_alloc, struct swap_queue_cursor *cursor)
 {
 	bool rotate = false;
 	struct swap_info_struct *si;
 	struct swap_ring_iterator *ri;
 	struct swap_prio_ring *ring;
-	unsigned int dev_idx, queue_idx;
+	unsigned int dev_idx, queue_idx, nr_iter;
 
-	if (!swap_queue_len)
+	queue_idx = cursor->ring_idx;
+	if (queue_idx >= swap_queue_len)
 		return ERR_PTR(-ENOENT);
 
-	queue_idx = 0;
-	while (nr_iter >= swap_queue[queue_idx]->size) {
-		nr_iter -= swap_queue[queue_idx]->size;
-		if (++queue_idx >= swap_queue_len)
-			return ERR_PTR(cursor->ring_only ? -E2BIG : -ENOENT);
-	}
-	if (cursor->ring_only && cursor->ring_idx != queue_idx)
-		return ERR_PTR(-E2BIG);
-
 	ring = swap_queue[queue_idx];
+	if (cursor->nr_iter >= ring->size) {
+		if (cursor->ring_only)
+			return ERR_PTR(-E2BIG);
+		queue_idx = ++cursor->ring_idx;
+		if (queue_idx >= swap_queue_len)
+			return ERR_PTR(-ENOENT);
+		cursor->nr_iter = 0;
+		ring = swap_queue[queue_idx];
+	}
+
+	/* Consume masked peers too, so every walk remains bounded. */
+	nr_iter = cursor->nr_iter++;
 	local_lock(&swap_queue_readers->lock);
 	ri = this_cpu_ptr(&swap_queue_readers->ri[queue_idx]);
 	/*
@@ -337,9 +341,7 @@ static struct swap_info_struct *swap_queue_get_device(long nr_alloc, int nr_iter
 	 * iterator can move between retries, but the cursor must visit every
 	 * device in the ring exactly once before falling through.
 	 */
-	if (!cursor->valid || cursor->ring_idx != queue_idx) {
-		cursor->valid = true;
-		cursor->ring_idx = queue_idx;
+	if (!nr_iter) {
 		if (ri->rr_counter < nr_alloc)
 			rotate = true;
 		else if (ri->offset >= ring->size)
@@ -1847,29 +1849,25 @@ static bool get_swap_device_info(struct swap_info_struct *si)
 	return true;
 }
 
-static int swap_alloc_entry(struct folio *folio)
+static void swap_alloc_entry(struct folio *folio)
 {
 	struct swap_queue_cursor cursor = {};
 	long nr_pages = folio_nr_pages(folio);
 	struct swap_info_struct *si;
-	int nr_iter, ret;
 
 	percpu_down_read(&swapon_rwsem);
 	migrate_disable();
-	for (nr_iter = 0;; nr_iter++) {
-		si = swap_queue_get_device(nr_pages, nr_iter, &cursor);
+	for (;;) {
+		si = swap_queue_get_device(nr_pages, &cursor);
 		if (IS_ERR(si)) {
-			ret = PTR_ERR(si);
-			if (ret == -EBUSY)
+			if (PTR_ERR(si) == -EBUSY)
 				continue;
 			break;
 		}
 		cluster_alloc_swap_entry(si, folio);
 
-		if (folio_test_swapcache(folio)) {
-			ret = 0;
+		if (folio_test_swapcache(folio))
 			break;
-		}
 
 		/*
 		 * For large allocations, try every device at the same priority,
@@ -1884,7 +1882,6 @@ static int swap_alloc_entry(struct folio *folio)
 
 	migrate_enable();
 	percpu_up_read(&swapon_rwsem);
-	return ret;
 }
 
 /*
