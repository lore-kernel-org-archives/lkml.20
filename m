Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550392;
	b=Bom9T3dFDW4qBP32EAiFCTXrffQf96oJMoCLI8C86KIVVCTrYqvmw+aZVP7T0pG9QkzI
	 umCNWbL8QqWKRYQaqXTBryqP+Uz1FbjHOYLxak/w9STROEglvI3r2gJ9gqz4G5C6JUT1m
	 oIJp45hZhRw025K8uVmXkTWidhfm4iz+ZXlBO9lYglIyAaoMd0ZfKQOgpuQC9FTOdQr4W
	 flyKBJUkFOhhSrU1Kf4fGFGg48tI+w4xCMAXk4wHc0Hgp5xWLicnVKIwTatMwOJKASfpO
	 LSxi5OE9yAFODyIc2PuYVUAm8SwmJJpd5yyAoCyD+LUZOgLKCZSFmLatHseXj+YKyTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/jQfbSOqJoBgAbQs/XcGflZND2lk7u6m7SNdjISK0qQ=;
	b=5AMu951ubMuf9t32cIxIl/1Tx6HRCXn0o1ugosNormIjQgT4W7YgEXO/PqkPCcdxwDHS
	 A6O5gBHEHjQkjz1uEaQxCRAW9jOT+oR5o7KpPp2UqBXkiXWiclS9KPsx+nOAUFwa7Gx9F
	 bXyqMhy2mIaagrMOMDGWUFFb26J0ItoTC84H/ynS/06PI9R9F3b6XW9FXw+xoeDsdKB0G
	 dRpkuSxce7lvcteHfv5Bfrj/0IKULu5CUfPz3b7tU4gwNKBhAPaLjG1RaO82JHkcanbWn
	 uaQGT9yWIHg7Qe1RhChMEpFp/oQb76V4FWCwj0Qo3pmMZHiAFBOjhbsCo3W5yciJe2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=tXtLa8Qd;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E06606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3E06606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=tXtLa8Qd
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-9178aabd30dso2681236d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792550391; x=1793155191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jQfbSOqJoBgAbQs/XcGflZND2lk7u6m7SNdjISK0qQ=;
        b=tXtLa8Qd+5H4BLnuhYCgGRiKqa/+CB2oVa4de+b6PggqP1vB3KsBeqB/OpxRq76saY
         pXbYMMKKe7WzVa8oxIqheSce+yaA+59vjz/eiJFf+yDj5lAfeZC8qSUWakGL28OkSvCf
         JvvH6tU7Ll1b9OO/0mjTfeGy+0hC0oPBq7djPm3K7m0Hb7gyo7e0sPcHC0WUtsglwIBd
         TmR/5EXQHocCd9CM8C4Jdb6zq7ljg+2vNe+fuLfFQe1Heh8616A83GZmqW9Z63jS24bp
         UqzTXas+GfPQ9U2aeYN9d6VkySR7ahNOOnY/UFb2gwCpQs37Fv8t10uq2jg752BToXJ2
         VR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550391; x=1793155191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jQfbSOqJoBgAbQs/XcGflZND2lk7u6m7SNdjISK0qQ=;
        b=kJZbfaIO3957qJ7oBy6hGu1nquKc321TIl0bYvulF+/aoMODPTw5G6SI7MCyhXV35k
         AriD/PXDho19PfxInIlPrWHlWZuzssuSvySs9AU5qrb3HK9rUWnO3epuifbzCPhdRO3J
         jrUekb7JxXNtB83NUOAEkh2TjqvRdHhZV6rwy+AfG4bLDX3kgHqueKMxg7Ab3Yb2E4DB
         WuQ0Ot8PNsQNLc7hO4RolQQrLoi+JGCKVntf3fsZaF1T3TghM1I1aG599DRfiP4KMBHG
         SHSQCSY7jnE0bhry9YxaAxB2qXVlUeHcQlgdFHfrxqcF59KjTEPNSzdTrHIsWAOsQXBl
         drzw==
X-Gm-Message-State: AFq9FYJWBdx/DR0GB0SxC2b7FVzh28b7Cha4sdf65+boqfEoaJX76jHi
	uF9r774SYeMewrMd16vo6HMhsTTVSoeAugHFNUSIzHPsXHVUs8fdeltrbqrz9aJ5e/Q=
X-Gm-Gg: AYBFou1t+PM0bP1npsusiF+9zZ/w8H57Wbe1ej/MpYw+9PsECznzzXXI3QD+K2D+0j3
	a6SQ38zllOtvScJTqiKk/qCQpQFym2Q0xJvCJCy0JTUrQSiQRmFfygyjvtVNx3+Bu1h8KD084ZT
	A0/LPoi7kteZdHWn8COOqxJbiRX/QY10ZEx414zAU5X+d4TjTSe2zzkj/CbIaSChTJ6HRBXeqy0
	w50cMteLqDkvtCGOoW3451CdVoOraaLKKPtSDo61H15xrrrhNBi+9G12NhcfylDArZWvUQzLxQE
	y0W8HvGb92PdktTeok9+l6zcYSNDlV8jVTK7A2/SZ0W+UozszULmt4EjMfpP+exeW6J1zCH3sxg
	t0+Qjk12TyQgI3+Hl3HVMRgJuXykYmTH3BLzOX4J0TbvAeSwnm6lpryGGVdOAmwVg8wpWt1csUt
	zkaSsnZ6wo6JHhrBvfiQ6CqST83w680P0DYLrGNqUT8TijXdVG41HFN5cfUtNNtfPSeCFOaDeP+
	PXvhQmMS0TxIWS6ON2bIvqDkDbHHVjeb2rtxz2d0XyPZ/Fnv+bMp69ynVUDF0MUyU5Evis3zKFR
	XagwmUsMf0RYF3bsltDuwhEXK+Q3BKIljcbxG3PoRg==
X-Received: by 2002:a05:6214:20e5:b0:919:5a24:d77c with SMTP id 6a1803df08f44-91c12f1d462mr11333536d6.31.1792550390950;
        Tue, 20 Oct 2026 19:39:50 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10a45336sm13819426d6.3.2026.10.20.19.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:39:50 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	mhocko@suse.com,
	rientjes@google.com,
	shakeel.butt@linux.dev,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	Bessel.Wang@huawei.com,
	jiang.liu@huawei.com,
	stable@vger.kernel.org
Subject: [PATCH v3 4/8] mm/page_alloc: pass the zone, not the zoneref, to reclaim_retry_zone
Date: Tue, 20 Oct 2026 22:39:36 -0400
Message-ID: <20261021023940.1940971-5-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021023940.1940971-1-gourry@gourry.net>
References: <20261021023940.1940971-1-gourry@gourry.net>
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

should_reclaim_retry() hands the reclaim_retry_zone tracepoint the
zoneref it is walking, and the tracepoint reads the slot again for the
zone's node and index. Offlining a zone's last block rebuilds the
zonelists in place, and the shrunk list's NULL terminator can land on
that slot in between:

  CPU 0                             CPU 1
  should_reclaim_retry()
    zone = zonelist_zone(slot 1)    /* NORMAL1 */
    zone_reclaimable_pages(zone)
                                    offline_pages()
                                      build_all_zonelists()
                                        [MOVABLE1, NORMAL1, NULL]
                                        -> [NORMAL1, NULL]
    trace_reclaim_retry_zone(slot 1)
      zonelist_node_idx(slot 1)
        zone_to_nid(NULL)

  BUG: kernel NULL pointer dereference, address: 0000000000000060
  RIP: 0010:trace_event_raw_event_reclaim_retry_zone+0x57/0xd0
  Call Trace:
   __alloc_pages_slowpath.constprop.0+0xa80/0x16d0
   __alloc_frozen_pages_noprof+0x2d5/0x360
   alloc_pages_node_noprof+0x53/0xe0

The second read follows zone_reclaimable_pages() and a per-CPU vmstat
snapshot, so unlike the iterator's double read no compiler merges it.

Pass the zone the loop already loaded. The event's fields are unchanged.

With the tracepoint enabled and kprobes holding should_reclaim_retry()
across the offline, the base kernel oopsed in 3 of 3 runs and this
change in none.

Fixes: 11cd8638c37f ("mm, page_alloc: remove stop_machine from build_all_zonelists")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/trace/events/oom.h | 8 ++++----
 mm/page_alloc.c            | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/trace/events/oom.h b/include/trace/events/oom.h
index 9f0a5d1482c44..cbcf6fe4cc615 100644
--- a/include/trace/events/oom.h
+++ b/include/trace/events/oom.h
@@ -33,7 +33,7 @@ TRACE_EVENT(oom_score_adj_update,
 
 TRACE_EVENT(reclaim_retry_zone,
 
-	TP_PROTO(struct zoneref *zoneref,
+	TP_PROTO(struct zone *zone,
 		int order,
 		unsigned long reclaimable,
 		unsigned long available,
@@ -41,7 +41,7 @@ TRACE_EVENT(reclaim_retry_zone,
 		int no_progress_loops,
 		bool wmark_check),
 
-	TP_ARGS(zoneref, order, reclaimable, available, min_wmark, no_progress_loops, wmark_check),
+	TP_ARGS(zone, order, reclaimable, available, min_wmark, no_progress_loops, wmark_check),
 
 	TP_STRUCT__entry(
 		__field(	int, node)
@@ -55,8 +55,8 @@ TRACE_EVENT(reclaim_retry_zone,
 	),
 
 	TP_fast_assign(
-		__entry->node = zonelist_node_idx(zoneref);
-		__entry->zone_idx = zonelist_zone_idx(zoneref);
+		__entry->node = zone_to_nid(zone);
+		__entry->zone_idx = zone_idx(zone);
 		__entry->order = order;
 		__entry->reclaimable = reclaimable;
 		__entry->available = available;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 4cf2982c5b107..1bb308296fcdc 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4679,7 +4679,7 @@ should_reclaim_retry(gfp_t gfp_mask, unsigned order,
 		 */
 		wmark = __zone_watermark_ok(zone, order, min_wmark,
 				ac->highest_zoneidx, alloc_flags, available);
-		trace_reclaim_retry_zone(z, order, reclaimable,
+		trace_reclaim_retry_zone(zone, order, reclaimable,
 				available, min_wmark, *no_progress_loops, wmark);
 		if (wmark) {
 			ret = true;
-- 
2.53.0-Meta

