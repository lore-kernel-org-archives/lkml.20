Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599285;
	b=28SFMZIIh+o/UTlWqkcYfAUF1X8IHG3M2YjuNoMbPdcp9nX98HLDVAMvfi+joDA3/IjQ
	 1fd2taiKWNDnEGxq0C6m1MZdHYNvYP2obP19e6Ne+ry/owLdgPGM69oYzzLNQqNncDOm2
	 IYTkdD+iyrSTk3J5yyjRZdDW8xKgctwYvXwGPeDZsdestHnqnfdgAJgkHXKyJh9c9Ilq7
	 gAbInwgQAwMM3dwawbdOCFZ0HDcaNH7ND+qfXtRDXX9gEjWoYFQyelFyYkjnhp8EZTwQW
	 I8ICCUtvilfimBY7YobxfZswblek5dXMbX5GQwucU7/0be3mhu8N30NJunJdzZ7S8xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+zkWB/cOtydtBhPPyDLXOtqau6H5u3XxrtiKgDnaVXk=;
	b=kMNowWYW39p/cjRnfHCmsoZPt31L7xHB/j6DhJIH3y3inVXZjDLObaD56ubY5AIwDrBF
	 x1SPgGOoYfMtRTWSMNEDDls0BYmi3v1tfN91icxAoujEVYYQ8mAVFXS/cNpHEIzSkHX6z
	 SnqC857Q1A8mRaodIP+8nlOIfp13EV+Q8lD438uqLPjc81ZxC4hFBvy5f64P36UsNXHhz
	 h0ZXNdSnGVvjpnkBY2+K+yHacWDEJ+WRCtRvaNrFM2Y+YmLJW6aE2uq5f1VfPKxSpBJUX
	 lARYUArFMPo7VERSkrDDTP7RRZ5O3qIdAZ53w7icIL280HGLCchDLU7YZ/wtbqKcAAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XTZX7lIB;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FB2606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7FB2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XTZX7lIB
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so4967799eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793599284; x=1794204084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+zkWB/cOtydtBhPPyDLXOtqau6H5u3XxrtiKgDnaVXk=;
        b=XTZX7lIBaoAPj5VrMrEz8l57687FHIq9XfgylCMB3PVYgw83l4tOliEOnWp1qETLLQ
         vDY8C9hZkmDrUwzgmJjwa61wTqliYNOZRUIxw+N2W+DiP3htuW60BfSBJXeBFHfppd+E
         EWaZJxTAc3DNi9tsBV2HsfTojNKCIc+C0qmZ23qv7HnRzFmKO6wFN8WrK2M9WCxr+4bk
         lEvUuxnxcSi754AZfcyYyIjrZS4GBW4Wglrp8I4cAgix2GV17S5j2qWi8sTTa/rYndqa
         RfzMwxLSUpNgz5nLdBypg24n0IL8Lrma26Ei2arTOIzxUPSJ3/zprGFf0qGEmtyHRiEe
         bZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793599284; x=1794204084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+zkWB/cOtydtBhPPyDLXOtqau6H5u3XxrtiKgDnaVXk=;
        b=hGp2x1DtWRjWWc+wFEgNhBdQ0KTLTUPGOt1ylT3SYsYboWCOOXBjJenN1oQ+BDaRCw
         SD9V4k1ouMVRyai6mJrG+3YXvqMfvNueGezxQDNG+xnGKtLbUlF7oQvAkadoqOFO0xIk
         99X5UC9ezuPwZRHLx6rlDz9xxxCxcs6DEbYk7ZBbEbHW6O9oEjJVJD2miQrenH4C0O4h
         a5iu41rHbgVGTEscDSGsZDwnk4GDE4omRZLii75LdK+p3P2+yDa7+vN9nUpCaUMmOyHn
         BjzYOP9v1A1HiZjzgTsqKd+Gib6Y45dM8d/96ZxJtYFCK9FlDd+FTEQcIVuAvU4U1ApV
         kIGg==
X-Forwarded-Encrypted: i=1; AKwUvByIqfLsztDcg2iEj65udvv/raFDK7bpw1RJDo6r6tH16BZwW8OAKIlUBVlQCSJGUozmJ2hHHhdtLB4Q1bo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhzkdF4B5wZlx46J0ld8/E2GjSW7MjKBK6clwuQ4pk4TZitgej
	BzK67DnJ6DoZg5fNOi3D/gnbAaLMweLuVc79PBniOJmSsTnoR8vYyPso
X-Gm-Gg: AYBFou3o3bdUxCxWPPo6QchVdB36LXFiIfV8iS47gr8EOZbcqxtVOekRJpwdZ847AMT
	TIuYK3T4jdDcCh0B52vZFDwsPndGTLK+OIbqLbSxCXVIgXOl0uG4+zM8yDGUVEtJnPVc6gWXWHa
	ZTzNpZPqjVQLdFh0U8kUwzuiil4YFmgx15vGEKuPZ5h/oYGVLdPtqbbkxLCr3ZFKzSPf6kVg/rD
	15BGrFUCeBEhFAF+dwt9JqtIUvHBpRCEaDG1ijnNVREUm/efOG0G1DQnk+6+Rhr0psQOiOfPKdq
	ykTxzgvsdhVieNoio/69R0XZxnW8STFp1+TTvONgMgjrafSts/fITOV7ImZ375dHS5RKtgwJ6nD
	CT/bbI8P66+RJEKuUuNtrhaW3hUUhGS6oI65PEy0N4SPcyEl8WNBmUgqVVUZwFmrPYXQBsgMqgw
	AIeKAC45t46b7cKd5ItiuT7HdCg0ukS/Khz7v98lzR/GVjvgIG/LhQ+YYpr0QMGvtaRdBvrIdU8
	bQPtvza/qQLYEj+ZSaGG8Uie1e/TyPBX96wETHrefDJ1yO0SBm+bJI+ZH8HFRvFZZUS7kDUUNl6
	iGDTOb9pOZ5RLkYZgjAX0/UymH4YJXYs/EommUzC1/0uNA==
X-Received: by 2002:a05:7022:eb44:10b0:154:dc96:c1d8 with SMTP id a92af1059eb24-1ac56c9fda4mr14180646c88.2.1793599283639;
        Sun, 01 Nov 2026 22:01:23 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm28755363eec.4.2026.11.01.22.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:01:23 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 01:01:07 -0500
Subject: [PATCH v2 1/2] mm/compaction: keep compaction deferral state per
 migration mode
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-bug-mm-thp-async-compact-defer-v2-1-b407e974db54@gmail.com>
References: <20261102-bug-mm-thp-async-compact-defer-v2-0-b407e974db54@gmail.com>
In-Reply-To: <20261102-bug-mm-thp-async-compact-defer-v2-0-b407e974db54@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

A zone keeps one compaction deferral state, compact_considered,
compact_defer_shift and compact_order_failed, for all migration modes.
Only sync compaction failures defer a zone, so a failed async direct
compaction is never deferred.

Deferring async compaction on that shared state would defer sync
compaction along with it, though sync compaction can still succeed on
the pageblocks async compaction skips.

Turn the three fields into arrays indexed by sync, like
compact_cached_migrate_pfn, and pass the mode to the deferral helpers.
All callers use the sync state for now, and a reset clears both. Add a
sync field to the deferral tracepoints, and emit
mm_compaction_defer_reset once for each state a reset clears.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 include/linux/mmzone.h            |  7 +++--
 include/trace/events/compaction.h | 27 +++++++++--------
 mm/compaction.c                   | 62 +++++++++++++++++++++------------------
 3 files changed, 52 insertions(+), 44 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index ecd1ebd49756c..73da870fff975 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1150,10 +1150,11 @@ struct zone {
 	 * are skipped before trying again. The number attempted since
 	 * last failure is tracked with compact_considered.
 	 * compact_order_failed is the minimum compaction failed order.
+	 * Indexed by sync, like compact_cached_migrate_pfn.
 	 */
-	unsigned int		compact_considered;
-	unsigned int		compact_defer_shift;
-	int			compact_order_failed;
+	unsigned int		compact_considered[ASYNC_AND_SYNC];
+	unsigned int		compact_defer_shift[ASYNC_AND_SYNC];
+	int			compact_order_failed[ASYNC_AND_SYNC];
 #endif
 
 #if defined CONFIG_COMPACTION || defined CONFIG_CMA
diff --git a/include/trace/events/compaction.h b/include/trace/events/compaction.h
index d05759d185389..23ac6e1750623 100644
--- a/include/trace/events/compaction.h
+++ b/include/trace/events/compaction.h
@@ -238,14 +238,15 @@ DEFINE_EVENT(mm_compaction_suitable_template, mm_compaction_suitable,
 
 DECLARE_EVENT_CLASS(mm_compaction_defer_template,
 
-	TP_PROTO(struct zone *zone, int order),
+	TP_PROTO(struct zone *zone, int order, bool sync),
 
-	TP_ARGS(zone, order),
+	TP_ARGS(zone, order, sync),
 
 	TP_STRUCT__entry(
 		__field(int, nid)
 		__field(enum zone_type, idx)
 		__field(int, order)
+		__field(bool, sync)
 		__field(unsigned int, considered)
 		__field(unsigned int, defer_shift)
 		__field(int, order_failed)
@@ -255,15 +256,17 @@ DECLARE_EVENT_CLASS(mm_compaction_defer_template,
 		__entry->nid = zone_to_nid(zone);
 		__entry->idx = zone_idx(zone);
 		__entry->order = order;
-		__entry->considered = zone->compact_considered;
-		__entry->defer_shift = zone->compact_defer_shift;
-		__entry->order_failed = zone->compact_order_failed;
+		__entry->sync = sync;
+		__entry->considered = zone->compact_considered[sync];
+		__entry->defer_shift = zone->compact_defer_shift[sync];
+		__entry->order_failed = zone->compact_order_failed[sync];
 	),
 
-	TP_printk("node=%d zone=%-8s order=%d order_failed=%d consider=%u limit=%lu",
+	TP_printk("node=%d zone=%-8s order=%d sync=%d order_failed=%d consider=%u limit=%lu",
 		__entry->nid,
 		__print_symbolic(__entry->idx, ZONE_TYPE),
 		__entry->order,
+		__entry->sync,
 		__entry->order_failed,
 		__entry->considered,
 		1UL << __entry->defer_shift)
@@ -271,23 +274,23 @@ DECLARE_EVENT_CLASS(mm_compaction_defer_template,
 
 DEFINE_EVENT(mm_compaction_defer_template, mm_compaction_deferred,
 
-	TP_PROTO(struct zone *zone, int order),
+	TP_PROTO(struct zone *zone, int order, bool sync),
 
-	TP_ARGS(zone, order)
+	TP_ARGS(zone, order, sync)
 );
 
 DEFINE_EVENT(mm_compaction_defer_template, mm_compaction_defer_compaction,
 
-	TP_PROTO(struct zone *zone, int order),
+	TP_PROTO(struct zone *zone, int order, bool sync),
 
-	TP_ARGS(zone, order)
+	TP_ARGS(zone, order, sync)
 );
 
 DEFINE_EVENT(mm_compaction_defer_template, mm_compaction_defer_reset,
 
-	TP_PROTO(struct zone *zone, int order),
+	TP_PROTO(struct zone *zone, int order, bool sync),
 
-	TP_ARGS(zone, order)
+	TP_ARGS(zone, order, sync)
 );
 
 TRACE_EVENT(mm_compaction_kcompactd_sleep,
diff --git a/mm/compaction.c b/mm/compaction.c
index f1b2060eb2016..e7a450b2be757 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -124,35 +124,35 @@ static unsigned long release_free_list(struct list_head *freepages)
  * allocation success. 1 << compact_defer_shift, compactions are skipped up
  * to a limit of 1 << COMPACT_MAX_DEFER_SHIFT
  */
-static void defer_compaction(struct zone *zone, int order)
+static void defer_compaction(struct zone *zone, int order, bool sync)
 {
-	zone->compact_considered = 0;
-	zone->compact_defer_shift++;
+	zone->compact_considered[sync] = 0;
+	zone->compact_defer_shift[sync]++;
 
-	if (order < zone->compact_order_failed)
-		zone->compact_order_failed = order;
+	if (order < zone->compact_order_failed[sync])
+		zone->compact_order_failed[sync] = order;
 
-	if (zone->compact_defer_shift > COMPACT_MAX_DEFER_SHIFT)
-		zone->compact_defer_shift = COMPACT_MAX_DEFER_SHIFT;
+	if (zone->compact_defer_shift[sync] > COMPACT_MAX_DEFER_SHIFT)
+		zone->compact_defer_shift[sync] = COMPACT_MAX_DEFER_SHIFT;
 
-	trace_mm_compaction_defer_compaction(zone, order);
+	trace_mm_compaction_defer_compaction(zone, order, sync);
 }
 
 /* Returns true if compaction should be skipped this time */
-static bool compaction_deferred(struct zone *zone, int order)
+static bool compaction_deferred(struct zone *zone, int order, bool sync)
 {
-	unsigned long defer_limit = 1UL << zone->compact_defer_shift;
+	unsigned long defer_limit = 1UL << zone->compact_defer_shift[sync];
 
-	if (order < zone->compact_order_failed)
+	if (order < zone->compact_order_failed[sync])
 		return false;
 
 	/* Avoid possible overflow */
-	if (++zone->compact_considered >= defer_limit) {
-		zone->compact_considered = defer_limit;
+	if (++zone->compact_considered[sync] >= defer_limit) {
+		zone->compact_considered[sync] = defer_limit;
 		return false;
 	}
 
-	trace_mm_compaction_deferred(zone, order);
+	trace_mm_compaction_deferred(zone, order, sync);
 
 	return true;
 }
@@ -165,24 +165,28 @@ static bool compaction_deferred(struct zone *zone, int order)
 void compaction_defer_reset(struct zone *zone, int order,
 		bool alloc_success)
 {
-	if (alloc_success) {
-		zone->compact_considered = 0;
-		zone->compact_defer_shift = 0;
-	}
-	if (order >= zone->compact_order_failed)
-		zone->compact_order_failed = order + 1;
+	int sync;
+
+	for (sync = 0; sync < ASYNC_AND_SYNC; sync++) {
+		if (alloc_success) {
+			zone->compact_considered[sync] = 0;
+			zone->compact_defer_shift[sync] = 0;
+		}
+		if (order >= zone->compact_order_failed[sync])
+			zone->compact_order_failed[sync] = order + 1;
 
-	trace_mm_compaction_defer_reset(zone, order);
+		trace_mm_compaction_defer_reset(zone, order, sync);
+	}
 }
 
-/* Returns true if restarting compaction after many failures */
+/* Return true if restarting sync compaction after many failures */
 static bool compaction_restarting(struct zone *zone, int order)
 {
-	if (order < zone->compact_order_failed)
+	if (order < zone->compact_order_failed[true])
 		return false;
 
-	return zone->compact_defer_shift == COMPACT_MAX_DEFER_SHIFT &&
-		zone->compact_considered >= 1UL << zone->compact_defer_shift;
+	return zone->compact_defer_shift[true] == COMPACT_MAX_DEFER_SHIFT &&
+		zone->compact_considered[true] >= 1UL << zone->compact_defer_shift[true];
 }
 
 /* Returns true if the pageblock should be scanned for pages to isolate. */
@@ -2855,7 +2859,7 @@ enum compact_result try_to_compact_pages(gfp_t gfp_mask, unsigned int order,
 				continue;
 
 		if (prio > MIN_COMPACT_PRIORITY
-					&& compaction_deferred(zone, order)) {
+					&& compaction_deferred(zone, order, true)) {
 			rc = max_t(enum compact_result, COMPACT_DEFERRED, rc);
 			continue;
 		}
@@ -2893,7 +2897,7 @@ enum compact_result try_to_compact_pages(gfp_t gfp_mask, unsigned int order,
 			 * so we defer compaction there. If it ends up
 			 * succeeding after all, it will be reset.
 			 */
-			defer_compaction(zone, order);
+			defer_compaction(zone, order, true);
 
 		/*
 		 * We might have stopped compacting due to need_resched() in
@@ -3111,7 +3115,7 @@ static void kcompactd_do_work(pg_data_t *pgdat)
 		if (!populated_zone(zone))
 			continue;
 
-		if (compaction_deferred(zone, cc.order))
+		if (compaction_deferred(zone, cc.order, true))
 			continue;
 
 		ret = compaction_suit_allocation_order(zone,
@@ -3141,7 +3145,7 @@ static void kcompactd_do_work(pg_data_t *pgdat)
 			 * We use sync migration mode here, so we defer like
 			 * sync direct compaction does.
 			 */
-			defer_compaction(zone, cc.order);
+			defer_compaction(zone, cc.order, true);
 		}
 
 		count_compact_events(KCOMPACTD_MIGRATE_SCANNED,

-- 
2.43.0

