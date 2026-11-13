Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794613961;
	b=J0Y0etJR0kl645zhTT+07xgzBCkUVqTUqYkfbud6I0+piRb8PiplFE0TkC6rPdIHoYyU
	 lXK4y+ExEk3Lqlinj7EaCyYXH/anWrp2WvbQWa90v+abo5KVRFW+BJq60U4L6+Uyc6YOI
	 OpayKh1bdqpb4024r7FWY7WxfhIWHXLlu7Yt/u6C17ehvLppVLqe8/Fuhy2MrPMEOA8dp
	 7pd6/1onhAOF5jx6AdQXAtSUKnfE1VQ61YXIGXq/ly8AbOdG43L+XnbL04LRdJTuFLL0n
	 6zvWCGkMwMDatN2wXtyxBLxr75NkI/suL5rS+1RCCf7o8LvOWdzk5jrz9DFFx5kqaMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794613961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V6Dc06AwxOqv+YtietBML1RlnbCWLY7fPYdPiA+3csI=;
	b=0gUIPMkMw4lOHJuU8TmQ9BY00xKWhVFZPiWul0/pWsRNOkOZvK36IAgYELRhiF53W+QM
	 8E5QpaS7mudQjcDfpW8a+Fu2Afh3tk8FSDZeSflGCdo2CDdZUgFSAx4YayKtFjJSq1Lxc
	 YuYoC7Kg8WVZW4+Re+IJW/8iOpHZxdEa9sGQbnFghgpipab1kSX2m0i8khC8Gq7md8CW7
	 JooCIb/vWuJFYGqMgnUqr7cuclSUWOu8vUCNBqvYi/2Imkt4Y9RkMAghPsnipAdt+g3+r
	 O4Gh5PdLDv6XgbbqXHsfnJyOQBf/A1SiBdtE3m9z98i8cuu/WxSzqDO5v87s3DdwX5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w3ugJfw2;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362FA606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 362FA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w3ugJfw2
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b31261e8a9so11670357b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794613960; x=1795218760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6Dc06AwxOqv+YtietBML1RlnbCWLY7fPYdPiA+3csI=;
        b=w3ugJfw2ZTzMYbivsmi1uKf3npL493vWnoIGJmOy+ortWUWKDwjoM0SGo7bdErtOTY
         IJJwCKJKzcxJuVjxPaaQcK4ps9ySYu3f0/NHz3AvPfs945gSnfC2Shln8yUkzPZVg/bi
         2LfaqUzzNcbs58sNBreA2XKVgD4oqvtL9LtTkcxt8Xf2cqJaZJTbqfyZDCgwpn8pTk0p
         urGPHgeZT+92APrhELBmks+/D76Spb6L6ybqgBs9FuhnU+ZJbDX+533URmuLMkzHuzHK
         X53pv3OC1k/JyUv71TdFuGTmpph6Eii8RbHr7eTrxhCFoeWh/0bP8OKrREjXwTX7d8s3
         AVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794613960; x=1795218760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6Dc06AwxOqv+YtietBML1RlnbCWLY7fPYdPiA+3csI=;
        b=BP+rKAebzZwUT3WYZf79bXZky7XXqzlQ4LDpOgI1w490QEkr9NQ7asaEyrsapjxixn
         IeR+IueCPrq2OW99OeEfnLEs2O6zKYGRsL6z/DQdl7C4BOX20Tj2uRFNvxDT0ocdY/aK
         P2ga3lIR9a55v3KNrceeWCshZy3hRHstZydEsdyH66ACHy6qOxD5fiVUWmtytmmKXXZa
         55IRiyn0nYvzbWdhdgcfNZCD6n25Cb0hGt5vZmYPyjCRoAe0uW2eyCnO0xr7MeYdCC+n
         MHsTPcTpI98bKk5eD4SH6AXPtwybIPqXCc/nG2zMsH/RkRoTLycZnQWSLerczcujNZ0k
         mD0g==
X-Forwarded-Encrypted: i=1; AL+hErFp7TsVy8sojIYN6rCxlh5ieNUESh0q8q4Bt5wGvCOPzfFgDT1YnNJBVD9cpTXb2NHpHTZPcBG1ZDj/v0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W+3tBsTnnCmEgFrL9Y16cIDCAIlSh+w6M5Q24QvZ+Duz0pxHV
	xtdxeMtWZmglM1HuTvvYL+7Hq0T03ImZPqTfyKB8Zi+2gQgkol5zHQ+G
X-Gm-Gg: AYBFou1YvRoCL9UMPzbxnIz2qbYtoZRQmJbL9wHlil6E3ktvtQno7zxfBtyX6URUJ6V
	EynJN3xzaWK5Rlv/vJAtc+7C0VJ6/8+/M2mENn6TkOPLUckb8BClo/1odfXeaXpeSxpykZoc4q5
	gpGmsm9v9FeOClGhZ6y0lE7YkdR0yTdLAR4I9gYcqwoG/AjD1Yeng1hIMHo+I900DNvHZuAW7Ya
	7DWI+jKWeId4sDYSygpJD/Do8HAjcuvLoMhg1QEg/X5YJ9O83OsVH86beWtvB4OBMSmDXOvR7cB
	iDS21qE+yRNy4i8klNQbjrOk64Cvex9IQbEEYal41muPj1xVkCP4P2rLaetbmWL+I42UOSRHW7i
	ZWXMXDsdKl4laugtQimqP0E+u8DewG62bL8is3Qr/pnEr61hfcQuteAxOkvc4scini+A1JShsai
	CBTcPiBGneyH8vs//42Cc0V4pjeHyHax/5Jkxwv7AiW0Z1ld2EE4CS5+S34uWf0mU4i/8Qk28J3
	3Wxm/9ZGANjMivOlgOv6GjQzlx9zYn9GRNGsIRZcGOAvpxCXPONeaEABl6TZcYESs6KlGe5Zaug
	bz1O6uxAcoB4ww0z1MWEK9WKBvcNZctpp6ZYz+ji2z9RRAppYJPZW74jo06w
X-Received: by 2002:a05:690c:8d07:b0:8b3:5eaf:29fa with SMTP id 00721157ae682-8b4aa3d36dbmr26756697b3.55.1794613960093;
        Fri, 13 Nov 2026 15:52:40 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5c::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9870f7sm32719387b3.24.2026.11.13.15.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:52:39 -0800 (PST)
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
Subject: [PATCH 1/3] mm/page_alloc: drop unused gfp_mask from zone_watermark_fast()
Date: Fri, 13 Nov 2026 15:52:34 -0800
Message-ID: <20261113235238.3595412-2-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261113235238.3595412-1-joshua.hahnjy@gmail.com>
References: <20261113235238.3595412-1-joshua.hahnjy@gmail.com>
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

