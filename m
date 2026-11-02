Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599294;
	b=RLswbBMJ5Imyy4ODKaZsdVxpWPVw9v18XHWSVP6qTL4n0DViBRRvCpMBHdfRDIkWlhXh
	 atkiJ6iRDch0/wjQMNOjrlYdtwZ9iPDRkqOW/Mw2FGf/vDc8Fg+d8n+OyPLEoI/xt3Rhi
	 oGa2rxgMp8qWiNx9Zwrmy5dq9eVyUIMrhSCEl+BUSE+ijOjCASTLosLkiF292ity2mwoX
	 RFjew7957HX3reyhJMg7We7MiT+PDmKijIpqTmmHj73b+V3IW2zsjFSPcwMAsLV9ru/Pd
	 TI/sk3oZBsF3eVirzZFue3wN5TTkFJK3FUOn3vlfI2GAeFve2LtVHe9CFNxDVEXS+6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YSkr4xPSOMpmzvdQfZBF00qXeylEmPR38zvgW8C7IJ8=;
	b=Qm1kmgaxMPVS0cNmp8H/rN6TTisMEDMyGhgY7/+hGT8s09/yeEKrUcE5zVdkMSswsnJQ
	 NQxR/eUhKnzY0TEjSqfEPgemph6kPW+jIiluSfPWjw/3m4R7dgwicZ0d7CI+7YZemuWxt
	 nHTJlT7w70lzKkcTEGyu+ebAqKGi4CjhsB0lqExahSZ49WkiYrlpVQGsMHeNm35XAdjPC
	 kLHJAGwofipOHdwqJ0tzSNjLXOQChC7Qlk9g5egG4kEOmR1SORR0ir6YG5Y1AelyUaLzg
	 s06RAnBe4C9usIqttVTfXDgQU6Fr2d+tszE0QejVqehR5iku5KLWTsCrPiljdls0Hrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GHQ5IcqW;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3D1606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F3D1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GHQ5IcqW
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso4642598eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793599293; x=1794204093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSkr4xPSOMpmzvdQfZBF00qXeylEmPR38zvgW8C7IJ8=;
        b=GHQ5IcqW+9yc6zu7keXLegvHakzJ9KBw47PpHJ1JEN7gnNdK1hN+lWL0pFpYdrEqnE
         CxhOrtjoGq+xSZOtRfL7iIVgLpU4+NWXtpV6pEeDosH280x4QYp86f/oHY+iUcUVDoK2
         V1PsL+mpoerv03+0iASGShcHVeM+eo8kt8rziFKM7tMtQeFIBq3BBFk4N2tg/ZTFYkH+
         bq6vL8KGFdWb8q36pnyD1MnGCUd3ufUVwraU6Ly/RLSrBiKV1vUxXvdceDvm3MeBVeSV
         f0FNujA1IPwl4pr3drrNho1ROvuYNJltW3lKKbxwU0D0m2iCO1X+JOH68WOU6eIB3SZ7
         h28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793599293; x=1794204093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YSkr4xPSOMpmzvdQfZBF00qXeylEmPR38zvgW8C7IJ8=;
        b=iNzuK3M+IUV4Bbobf46Sj+oQRDRL2irq87uX3W4URX7Wdt2baWFI5lUZTHWePv365S
         ik1YlvJZZcy1AwywUgcvLVPRLzedT5a0XOYEfrJw/qjy3uMZOC8bKT04Qo1tvYPM74E0
         bCNLilMQzhoK171+qVZOjFG2onIJnVQzK41ceOfPs9U/sySjATNNRTN4CfzR9FsEZo0h
         Z6ZHGJjw3X+sHk6phOnzzkE9UHeSFrc2h+girp/HY4StCRxTD5ZrO9AR+O6okgoQVCBp
         3LuMt6AY294I1Pyk5nuB20KahMg5DsZ+lf/3fwogaKjSnvDGL/X3LSiL5vUeFM837hlt
         AOeA==
X-Forwarded-Encrypted: i=1; AKwUvBz600YgAgqTvPP2Vee3g/aBl9Mdkr5wxMpLxTnA/5ZoXIjKcA9Pg+QsMSuOMAhpyaC4pED9I4gU4L7N8n8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZBu1HAxQsGXAiHZPoOGGYC1DtNdfyNCtPtvK6tk5tEopIPteg
	PBnpPY7GuspME/rAUo3Dx1MkGOkaa/b110DorAIHT9kexqmuoo51Su5+
X-Gm-Gg: AYBFou0OTjszSxeS14knJNlsCpZX4FwZksukJznu1BYOf/DbTz8AUJbAibseTMn5rjn
	PjEUa6TlodFph7H6n48/ECxtgaKNZmcCLYlOtnT4CRSuiZ7a7yrzCAnnHSLS6wFsbjQbKSP10MZ
	LSjw8s1/apWmlyFf6EEbHxfq4LncapsIV2wL+FkLWea4YXsIl4/tkHNWWtWwd2z5ulED/kIpMM7
	XD+YPBR7F7WKS18N6lXL9zpQ5iOnB3yyQzuj35hrWArDcXlw5gFCQnfIDshFJwdBxtFBVPb3DUg
	H99QH/1jH1hG00CVYrr/b3hY93cCqvikmodPIOORVmGVytURRcy5ZFUGsCUKBG/3yu4KqOVUrkf
	fzs7vJzszMT2llV0gE8VjstDobnz65gyMehaRQB+YXtTzFnmiAsr4LAUy3vuDdb60SrUqIcwGZc
	XSDkcgVXzn93SCGtLNRh555aKWOauONrm/WnCQ+yN0YupO+7P9bqIocItSHyvRV8NxdgtFtk132
	TSfQtoR3LZY9Zxe73hAbWQnuHXMLjXTlvPp6kFTKLAAjWByKqxboBtcb9vrdIoP6SfGaVqZHxWc
	LwZdSjc5nVjDrL257CGJwH1s
X-Received: by 2002:a05:693c:4154:10b0:369:f4d7:19fc with SMTP id 5a478bee46e88-36a424988abmr16343588eec.41.1793599292932;
        Sun, 01 Nov 2026 22:01:32 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm28755363eec.4.2026.11.01.22.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:01:32 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 01:01:08 -0500
Subject: [PATCH v2 2/2] mm/compaction: defer failed async direct compaction
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
Message-Id: <20261102-bug-mm-thp-async-compact-defer-v2-2-b407e974db54@gmail.com>
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

A THP fault on a MADV_HUGEPAGE VMA first tries the local node only,
with __GFP_THISNODE | __GFP_NORETRY, and runs a single round of async
direct compaction there before falling back to other nodes. A failed
async run is never deferred.

When the local node has plenty of free memory but no free pageblock,
and what sits between the free pages can't be migrated, such as memory
long-term pinned for RDMA, each of these faults scans the zone again
and fails before falling back.

Defer the async state when an async run fails, and check it before
further async runs. Sync compaction keeps deferring on its own state,
and a successful compaction or allocation resets both. Reset the
pageblock skip hints only from sync compaction, as async relies on
them.

Populating a 4 GiB MADV_HUGEPAGE buffer from node 0 of a two-node VM,
with node 0 (24 GiB) fragmented by long-term pinning every other page,
median of 3 runs on each of two boots per kernel:

                          before              after
  direct compactions      649 / 1473          9 / 41
  time in compaction      118.6 / 264.2 ms    2.6 / 5.1 ms
  population time         531 / 504 ms        390 / 261 ms
  THPs on node 0          1399 / 575          1478 / 727

With movable memory in place of the pins, compaction still succeeds
and both kernels get all 2048 THPs on node 0.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 mm/compaction.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index e7a450b2be757..390171370b046 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -2600,9 +2600,12 @@ compact_zone(struct compact_control *cc, struct capture_control *capc)
 
 	/*
 	 * Clear pageblock skip if there were failures recently and compaction
-	 * is about to be retried after being deferred.
+	 * is about to be retried after being deferred. Leave this to sync
+	 * compaction: async compaction relies on the skip hints, and clearing
+	 * them on its retries would rescan the whole zone each time.
 	 */
-	if (compaction_restarting(cc->zone, cc->order))
+	if (cc->mode != MIGRATE_ASYNC &&
+	    compaction_restarting(cc->zone, cc->order))
 		__reset_isolation_suitable(cc->zone);
 
 	/*
@@ -2858,8 +2861,10 @@ enum compact_result try_to_compact_pages(gfp_t gfp_mask, unsigned int order,
 			!__cpuset_zone_allowed(zone, gfp_mask))
 				continue;
 
-		if (prio > MIN_COMPACT_PRIORITY
-					&& compaction_deferred(zone, order, true)) {
+		if (prio > MIN_COMPACT_PRIORITY &&
+		    (compaction_deferred(zone, order, true) ||
+		     (prio == COMPACT_PRIO_ASYNC &&
+		      compaction_deferred(zone, order, false)))) {
 			rc = max_t(enum compact_result, COMPACT_DEFERRED, rc);
 			continue;
 		}
@@ -2890,14 +2895,17 @@ enum compact_result try_to_compact_pages(gfp_t gfp_mask, unsigned int order,
 			break;
 		}
 
-		if (prio != COMPACT_PRIO_ASYNC && (status == COMPACT_COMPLETE ||
-					status == COMPACT_PARTIAL_SKIPPED))
+		if (status == COMPACT_COMPLETE ||
+		    status == COMPACT_PARTIAL_SKIPPED)
 			/*
 			 * We think that allocation won't succeed in this zone
 			 * so we defer compaction there. If it ends up
-			 * succeeding after all, it will be reset.
+			 * succeeding after all, it will be reset. Let a failed
+			 * async run defer only further async runs, as sync
+			 * compaction may succeed on pageblocks it skipped.
 			 */
-			defer_compaction(zone, order, true);
+			defer_compaction(zone, order,
+					 prio != COMPACT_PRIO_ASYNC);
 
 		/*
 		 * We might have stopped compacting due to need_resched() in

-- 
2.43.0

