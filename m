Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871430;
	b=I6Fxvw9yPB4SpPMkyDce7szZTAEepdGN3ogb+52gGWPuGuAD362c3iNVjvRHk/KA5HUl
	 rkFf126x5vOjeSM5XmlJAzkKzPMBUcm90A/RFFMqO0blz+z72IPGlyH8F5VJzUJeznY8x
	 0jhUbmsnN/aDifDxmByvnuHdoTop9r1lkCY7UAEKVMLPRoOZD7qtQZ+fujPj0roVRWsDs
	 yIHyTslpfMBr0HQ3a8J+4+2vvjNQhME1mRf9nHdw5+LtwHw4vRbUqas8ZTaoZlarHJ+3G
	 r1xIXK4LeiwcEkrl7MFn8L/yIgMTABqMN/mNXPtJVa6ZoQj6RT1KaXE7SNhYTtIRpnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=389tp1/miXi0Na+zQKVdQniiWFMCbw1dAreIa1rH3JY=;
	b=gKsM+eItuA49+W0VDh1p1sHhweCBxgoi836m2IA/rjvw34MpFhbfINQmlJe6FWF5XEct
	 kzIasRY+AN/r9QZUUAchO5dfkImDBEJ8rjfOdtWZbW5+FfCV45Mj/JaHYFlSB2Ich1Yqr
	 h5oDgd0PALqifw6UOm1rWrdDPL53zCPGdFggQMQtr800LXUU2SCz8H/q9V6fyeCTpwZMJ
	 fMTMuW1sa14VJMLmeqB5mOOu0Sd5UW7kIlgXZAL2wuENgHFmNdw219ri6KFzs3HENyQ2i
	 pxYjqjGVlMwa2fTs5nAhflHqt5Uy2qUD0AZMnXBTDuQ8tSWd8rsv4xCeunuwCgft2Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rxbmweXk;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D32C606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D32C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rxbmweXk
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4877837890fso2564697fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794871428; x=1795476228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=389tp1/miXi0Na+zQKVdQniiWFMCbw1dAreIa1rH3JY=;
        b=rxbmweXkvZKec0+PEuoMRRzAht8om0SGdIfL1Qt6XAQXN/RYT/T2iZf+/lFy8ZVGJW
         VOXrrL/wfWhs+oCJg6PFKTIH00L0iowgCWjK6bPzv/WHtt/Ggpy9G868A+yAqfmuef8+
         Rzl8ocgECsX134x4w6WblitJeEskJMMetv0n2tutcSvgRW1Q6qJtZ0m+zFJ4sIG84s7p
         3fVUbJrleiMx6TpsCIJKe5yC0KN9RoxcDgg0KPcztYZiP6O8lmkjEZVOQOe0WBlwrCRs
         Veqx84qOXqrDrbcXzege7VHaLmAlTTVxIOLj0NJ2r/fUANhxOFkYB/rhNA7yNh9taX9+
         /99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871428; x=1795476228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=389tp1/miXi0Na+zQKVdQniiWFMCbw1dAreIa1rH3JY=;
        b=aQ+3Peg6FKeGZ7ZPUdQnmHKK3711Ep2VK76bCN2nMlTjMcYmDzwN1Uom8qPOV5hGow
         yzaTLSB2pKshabHW7XeWdiMsSQxM91+tO1rc0Upn1olJSHKJ5hsFsOtA9H2ujyooy2eW
         93iK24lpWylLqT9mB/lAqIFkk50tFX9LZ85Tcalhjh8mvcIJfXxipGZImkTgLhkyPStu
         kI7BV89Uhvin0y/x8Wdwns6inBfLU4bjoRX8Cy146YoI+uOmsIIlftn/HVXKUs+vRZSU
         Lc9dq62os54n7XQ7klk3eRSc5Y6RiP5xgD7/mUevvr3ma1Er5FB1yzzHNX7xIKj4BZzv
         9LWA==
X-Forwarded-Encrypted: i=1; AL+hErFnf8hW3osRdkI2WL35imjCTHTLw7guLtzotxc2vbCeN4erwDiSrx6SvAfwZX975pYj98cdr5JX+YCoxkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m1cOOcAAskoNPiEbp3JJcxM5SbbJyTMEgOka06qtJtJzdbPfo
	ohop7Rnvu6Oa+mzflwH9AmWY5PoyQ8cHJ6Gta4CsQ4xvtCsEGt9kBdEg
X-Gm-Gg: AYBFou3DMGbq9pucetloQHOtLC6edO+z+LgLu8ngfk/c1MYXFV6glgl084Qi5JqhudQ
	6p1TG5Ylkb0Z4/UVXbxN8VSK9haqQ2KtQopQLEAg2RtmCb1xdHiTSd6oKg5GnLq2lbydck85vHm
	OgH0woWPW+SuMKuJTUWJsY93lWK+8WcWWd7UtSuJs0COx1oH3PYAlyuFarIQDW1rCOm0fJtLPhW
	KyYnuRk801dbFXA1RzLQwQ2NEtSCBHDkcOBo+OYnEQpm3MYBdqJhE3Aci7ODUdCf1SCiPY9Avtr
	kVucvOJ0Td/OdDGoajd/q1B6nD2DuDOcom9wkdlJt+RdFuYOrlZzggQtFNyUsqi0jur+6jvK3xJ
	CYK/cbcv2t/b9WjqvEM3AmoQ4qSozabx31PGoO4d7EHU9RukEo1wgko83yxW65A3KVmr3diCyet
	3QP58Eb3lBFAymWUgUQSkpmntQl76r8A5ZAZ5oNmkEycLShvYvYsU1Cwky7xk373krMvJ/Vw/W1
	HVk+tquqWflzxlvVltyS9H2XBfv3voqu3IbFwsZ928eHl24VkGP6O4l7Leb1FyLlkZ9PWJiVneM
	vT/0bC3QLf9rGSv8hXrGtB3gXaTJvBVixiU5sIGEL2lqZJkj0avsGwly
X-Received: by 2002:a05:6870:328a:b0:459:fe2:ef54 with SMTP id 586e51a60fabf-4afdf0c3b63mr9465970fac.1.1794871428595;
        Mon, 16 Nov 2026 15:23:48 -0800 (PST)
Received: from localhost ([2a03:2880:10ff::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe200ffc6sm7539556fac.1.2026.11.16.15.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:23:48 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v2 1/3] mm/page_alloc: drop unused gfp_mask from zone_watermark_fast()
Date: Mon, 16 Nov 2026 15:23:43 -0800
Message-ID: <20261116232346.788145-2-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261116232346.788145-1-joshua.hahnjy@gmail.com>
References: <20261116232346.788145-1-joshua.hahnjy@gmail.com>
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

zone_watermark_fast() has not used its gfp_mask argument since commit
2973d8229b78 ("mm: discard __GFP_ATOMIC") switched the watermark boost
check from __GFP_ATOMIC to ALLOC_MIN_RESERVE.

Remove the argument, no functional changes intended.

Reviewed-by: SJ Park <sj@kernel.org>
Reviewed-by: Chris Down <chris@chrisdown.name>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/page_alloc.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 9e1261521b6a3..4d829e5eac49d 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3675,7 +3675,7 @@ bool zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
 
 static inline bool zone_watermark_fast(struct zone *z, unsigned int order,
 				unsigned long mark, int highest_zoneidx,
-				unsigned int alloc_flags, gfp_t gfp_mask)
+				unsigned int alloc_flags)
 {
 	long free_pages;
 
@@ -3877,7 +3877,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
 			mark = wmark_pages(zone, kswapd_watermark);
 			if (!zone_watermark_fast(zone, order, mark,
-					ac->highest_zoneidx, 0, gfp_mask)) {
+					ac->highest_zoneidx, 0)) {
 				skipped_kswapd_nodes = true;
 				continue;
 			}
@@ -3897,8 +3897,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 
 		mark = high_wmark_pages(zone);
 		if (zone_watermark_fast(zone, order, mark,
-					ac->highest_zoneidx, alloc_flags,
-					gfp_mask))
+					ac->highest_zoneidx, alloc_flags))
 			goto try_this_zone;
 		else
 			set_bit(ZONE_BELOW_HIGH, &zone->flags);
@@ -3906,8 +3905,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 check_alloc_wmark:
 		mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK);
 		if (!zone_watermark_fast(zone, order, mark,
-				       ac->highest_zoneidx, alloc_flags,
-				       gfp_mask)) {
+				       ac->highest_zoneidx, alloc_flags)) {
 			if (cond_accept_memory(zone, order, alloc_flags))
 				goto try_this_zone;
 
@@ -5245,7 +5243,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 		mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK) + nr_pages - nr_populated;
 		if (zone_watermark_fast(zone, 0,  mark,
 				zonelist_zone_idx(ac.preferred_zoneref),
-				alloc_flags, gfp)) {
+				alloc_flags)) {
 			break;
 		}
 
-- 
2.53.1-Meta

