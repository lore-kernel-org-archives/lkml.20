Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117605;
	b=t2J3MWs00mh6ziwnjZVJ410Tp1J/B0sDa4K08ne6UJBuM5K5F16ZIdbcR8fCh+QMEyrL
	 M7RgkYI5l5dTi+8AUHs13RDl1t9u98yvbI3yP/IwIMcur8JMDTZKqHWEcHhsEiDgPXUC3
	 JrO1iCufTotiLCZKwuG1wKadZHgG31c4RqAKV/2AFvHICfGzZlq6i8xIgl6ppC4rVTcQq
	 MqWSkUDor48lT+Ihw+NHqvjkOzwTvdpoWABNL+Zq4MjhcWHBz3VQwXJ0ss72XSQePWXg3
	 iS9pn1pQel1SaHI40WmRLaVuENIeW2WHrxQlO4ekvd2NcWnEtcYLGw5F7YnPPxc5E7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gSfoXLj/ogs4a9m4nRtbyh1f84TZ6iRvaVldSIlGJOM=;
	b=E4ZxAMEKdLHBjb7Fp/FjEsbo2XxjXGPqyw+w1bRXrEb/g8dWxZotZGjmVKwJLw9qHahU
	 bXOa3YOIuQd9XGsEkOXQDM8ZHj+by+9kiUUbaj83fiXFouVWODmNav3D0K7WBfg64ci0L
	 exkxA1Y69AK0pACzmf9VAC2TcLU6TAUpd3d6YEkfGYGcu5ozLozN92/ysarSWC9bf78fs
	 jkBbRZJSke3dJ44DskqzndvZAWoXlr4O61gERt7yZqb5kKuO19oXl552h14lwDaPqWiHY
	 C2rz5MaYXqgSJZvDFRsg9Fa53xRQf8rOQ9EM+MT4dD64iXoa99g8h+gt8lcBcf0Tn1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ogXCVqJl;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E436606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E436606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ogXCVqJl
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso66823a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117604; x=1793722404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSfoXLj/ogs4a9m4nRtbyh1f84TZ6iRvaVldSIlGJOM=;
        b=ogXCVqJlCBSo5wKd8aqd/WxaJKfyOOKRd2RKwKbE9w4rmnMQGFR3Vq/EnkXH/lr1h0
         2bXiw3ObIZ1Q9bHBHsP1kM+d/9d1vY26/i9Cf4A83g5o+CQyBLty08NiEVEk4UqKA/kv
         8p6Cp4KrX5WqJcNA1KHlc+P04lSW7fqDLMFMOyf/HHZAFYZuOyt2vmvGdltasg+dVigi
         Pk8BhBMkOyqHudRmodA50Y2bWpth3yPCiANcAzipR/2+7sohASu09ecblPNoIRnZ6D7t
         3a8HusPXa9Rwcks7NFzDTQGQcJj0arVSa3Tw+qOrtThjvMLFtQ1g+uWLkhQBRJ9teBy5
         THJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117604; x=1793722404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSfoXLj/ogs4a9m4nRtbyh1f84TZ6iRvaVldSIlGJOM=;
        b=bQ2oAYZJWMdN39er9U+Hlcb99JQ12cqdh3Owy4TJaalYBi3wVfdZ623Cjpyl3e0nje
         ee+VwhvyOKrgqnbdDQP7KTkqJJ0xyD9CCO6ZP9343hIYzmMTmTDxMxfP8HoBM4KZUllg
         K7/IIab9h8ShHs6Chymm1wu02tkAPLeGuZl1Z+xPSxfzxEvQ5Gw4YvO7P4lQpl9TcL2w
         Xk26RuCatPmBl7z4wwfYO88sKMmZg41uOs9hhwkGW+91XSYSVhWEiJg6i2Qs/hjw31vG
         zDYCJ/9rj0uOH9dspmDpyjLIS+OSlr9+aoAY1nQL1aF05mSDu0kJ2HzNe0inH83mbZN4
         TIuQ==
X-Gm-Message-State: AFq9FYIx3wTKooZs2H48YdOUVlKJeEWatjuImYixgIr3ECfWqJ99lHQH
	YY+8n3EPv3rWn+2b8WRFIcW9UffFgdqUpdjgVjF1oZRFC2z6yWdeTB8q
X-Gm-Gg: AYBFou1C/nma3Esk/YgpVQfDZOm/KRgL2aJ+KF4mgEbQd1Xx32+n3Y9RZv01ZGNJin6
	faoQvArYNq+yvYnAmR31GTmcXin0zl47OovAX10eHpwlyr0TS9y34dC36VhwCNp9B2XsP/6pNDD
	8Sj4hzXU/eRZ57xYzPZcyGIQ+JrhNGKmzSZYMwQ0iJBG30GRhRyqaMtM7IfFhGAQYnKaU/TonTg
	djhPZaMYjol5LhNUa02uVLQ1Mi9Keqc5v2BNIjflm5UCpDKoP5kU3QEncRNtN+8ja62KBcs+RMW
	lpZfK6Q/FN7lSoEpJYgS/kLNl7WD6h81LiXXaKhRejWfT6zKvn2ED+nDtB0Fsj7qPygwYNZLUSB
	/c5eTBKbBG1Ac8i6iGkJiih6R4Yw0KvFKics1AlZo+03EBcdqZ0WR0qHavrsSAtEJjK1DU9V0i7
	KQM3QinO/WXtgrjZOQs9zeUSTXfHxy4NN3T3bDRoouu6DURrB5FVXR4LOfnkzlAhhQN3vYVYMsH
	F9bX4PfrpA3zeaq/LyHdKci1ge5QkicZn5dLNDMRmPDXzt2tcyZUtlf0wxhwd3OuF5p59Rna5fF
	qHZUumTRBkX0ff5OMA0=
X-Received: by 2002:a05:6a21:1bc7:b0:3e2:3bc5:bb6e with SMTP id adf61e73a8af0-3e7bfc13b47mr7649508637.51.1793117603789;
        Tue, 27 Oct 2026 09:13:23 -0700 (PDT)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cccd4cfbsm3233902a12.28.2026.10.27.09.13.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 09:13:23 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	kasong@tencent.com,
	linjh22s@gmail.com,
	kunwu.chan@linux.dev,
	kees@kernel.org,
	gustavoars@kernel.org,
	tglx@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v3 16/18] mm/swap: advance the global queue cursor directly between priority rings
Date: Wed, 28 Oct 2026 00:12:56 +0800
Message-ID: <03c9f51439f1b457d7f9af40d6bbdf846f2776ed.1793106426.git.lianux.mm@gmail.com>
In-Reply-To: <cover.1793106426.git.lianux.mm@gmail.com>
References: <cover.1793106426.git.lianux.mm@gmail.com>
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
 mm/swapfile.c | 49 +++++++++++++++++++++++--------------------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 5b6492b1bdc6..bbd114f043ab 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -194,10 +194,10 @@ struct swap_queue_reader {
 };
 
 struct swap_queue_cursor {
-	bool valid;
 	bool ring_only;
 	unsigned int ring_idx;
 	unsigned int offset;
+	unsigned int nr_iter;
 };
 
 static __percpu struct swap_queue_reader *swap_queue_readers;
@@ -307,28 +307,32 @@ static void swap_queue_install_readers(struct swap_queue_reader __percpu *reader
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
+	ring = swap_queue[queue_idx];
+	if (cursor->nr_iter >= ring->size) {
+		if (cursor->ring_only)
+			return ERR_PTR(-E2BIG);
+		queue_idx = ++cursor->ring_idx;
+		if (queue_idx >= swap_queue_len)
+			return ERR_PTR(-ENOENT);
+		cursor->nr_iter = 0;
+		ring = swap_queue[queue_idx];
 	}
-	if (cursor->ring_only && cursor->ring_idx != queue_idx)
-		return ERR_PTR(-E2BIG);
 
-	ring = swap_queue[queue_idx];
+	/* Consume masked peers too, so every walk remains bounded. */
+	nr_iter = cursor->nr_iter++;
 	local_lock(&swap_queue_readers->lock);
 	ri = this_cpu_ptr(&swap_queue_readers->ri[queue_idx]);
 	/*
@@ -336,9 +340,7 @@ static struct swap_info_struct *swap_queue_get_device(long nr_alloc, int nr_iter
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
@@ -1794,29 +1796,25 @@ static bool get_swap_device_info(struct swap_info_struct *si)
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
@@ -1831,7 +1829,6 @@ static int swap_alloc_entry(struct folio *folio)
 
 	migrate_enable();
 	percpu_up_read(&swapon_rwsem);
-	return ret;
 }
 
 static int swap_extend_table_alloc(struct swap_info_struct *si,
