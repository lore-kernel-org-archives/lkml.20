Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871431;
	b=2CZId0FMmpZuc00T5/u3FCAg5y6Gmh9rz2tDWJUEh7iVN0m6WNLvBUxLFfFz5pTbtv+f
	 lPUQq1DrwTGuTs4dtslbjvDF0ri0r4a2knBSp6kLMO3QqIM8aqwgCBu5saS/t2wu0sv9K
	 mRqh0sLh0tacBnvl97N4VZ38FXi70s4T34LW3jLqBnPSQ1I21MQanUykMeTkajtUHVszI
	 fZHj0VT6ysOL+qM9ByW2w4Ab3EFy+8uQvGgg0KVENTv3DS7UDPcS0qSnyG96A2+iHmTCT
	 ciWMPui76v2UVOMQTtEHlF2L5MGJjJ6XEtkZHWPgcnvnGE4CBCyQ5NNt2sEXwcOGYOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XWFijJIoHdwN7Yjlw0VcOvBsbcmfGu6udAOAC1ItUeI=;
	b=KfIxKa/UchCdnWAt6fIm1gywSWsb715nUjKQOcick8sIIH8GblBLJgWX45nRmoxF/k6E
	 6xr99K5QAVP9I0aRyVq3SNCvRolMFIf+IL7Z3F7olXOQxOZRrAbUzYIxyIN2LwCy8Xc4A
	 ELvOItzrIe1jfv2hqRN42MpSH9X4Cn119X3V7D8Y3VXD87rEPar9wPKS6Fq86XmpqcIJ5
	 CuXG2297VW9cu+qbQGkF+pgKOcXCH6DtV9uE86gDYVWH7UbNZjtPs1qIOkPWsWK8s5rZT
	 4GIajFk9GdV+hYyQxlGizP8x+IFp0nt6KgMCO2LthDqMeMb+xBWUv6DEKTpw7bHJ66A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tWKqcGL/";
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A64E606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A64E606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWKqcGL/
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6d290b10a35so1555143eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794871430; x=1795476230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWFijJIoHdwN7Yjlw0VcOvBsbcmfGu6udAOAC1ItUeI=;
        b=tWKqcGL/IiMTFKN242dgcUG0sqfP85ICbq2MjM5Jo/B9ngHSybgKEVqUbIqDE2N+79
         unMli+pcmixiF2ztXNlltdFFI8xYW0+fQEAscu9YpwSmzhRjAS2etlsxkMhx1m0GCsjC
         9YH6qjDg32Hd3gj/iulvovMAb/rc77/ox4NrmCPY326AG9BAxIh8I23ldfbRA9+LdNEx
         JfcFty3IOCnUQaJr8LEdyiHQdwsFaSKzw/RITcKC5hofZ+7a99YqoRcPlLAcFrpKQX9F
         FX4PGpeO+QHgCEZE3qeWfHbsT2tj+sIFRvu8D2UjdU5eauE346LGA0pFv3sdEeeFOgGR
         bkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871430; x=1795476230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWFijJIoHdwN7Yjlw0VcOvBsbcmfGu6udAOAC1ItUeI=;
        b=iBuSiRtyRxtj3KBSGJqxpxDKPPWcGzTuBjEpM/r9PT4gUVJhdxHFtl6vscwq2F+pES
         easslyaik0YXBI5upShGJheREHqktw7sQQZVeG1jalh/eT7CQHbeHk7pvsggwv82tozp
         ByX58Yj86uLkL6MsH3NcL64CnjWVlGk1aMmvSrdvjCc/RgfL43RLdgDR/fp2aIMuMDvw
         CPFnWXqDenkdp+j+qgGYEdOge6q3DQf7QymdgtPTDUgFGXQA5q/8PwDH7+ht/CLz4SMM
         ZM6SKwCTUtHDGCkcfylVBogSGzQDwKFxhnVFRE0Hnd2XE1iNacPSmhzKH+Oqtu+I5ZmZ
         kR3Q==
X-Forwarded-Encrypted: i=1; AL+hErGfVu6It/RGX5rvwINEEgbJVmTZ3ABSK+V/vSMWWtJQv8IMphV3xvmTTGlKbpcjrVs5LpD9feLENOKHPXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hapN77faFDVzHbWxDv0etKNPnBHvF2c4AOlX3RoqPGgXymHnP
	AU8GhoIyaJMhZwNOKIP9Ki4CwIdl6o+BbigDiakwH2TUnbpjGPvHi3uz
X-Gm-Gg: AYBFou2oBsdrm0wFDFoWFBE0Ag9tDC8TauC3cUO2riJ0tI6gVcd78+3sS0fphK/I2Jy
	8bVWaLnoPwpHXOvC9at4yRdRQbufklC9XB417RQiM8q4Igyj/9FrPGe21SW0zwhMte0UQQ1SYeM
	iLK9PBjicW9fWYC5AhJUfo2+tWkoOYVdjC0hdPQwuFIU1Wuy3BAnZ5vyljyQf26c2VN9QdyL34w
	2E5agYvKrjv6oa/PevBFXe/ZLtLmbCeKPfnMYuh4mdtmxN4zptRXPARIXieymaG3f6DoBSOhQOV
	EkfxT3G3ePkfEIXnhj8LuemQDo39aeAxpgVQKlKgcvrjKfA7fkvwn73wtdAhhJhAeRsyZgrh2Wm
	pYpB24OGoBnHyU7dHDMfDzqg/dJQcTGVlkqO5wHH8b3idiFCvs3Bpc4XUdZcxVwvUluljpywcr6
	ZJ5bcuF0RwbP9ZHSHK18ee+ivIlQCTtuRJIFMvM230DpzVF/anfgN6+X3YFr8Nvx9grS4BcYVQ5
	Gu95h4rtYhhY3VDjpbZZ60dEUy3ISgFUnlqcTB5UZf3iDXwxO+ksHG43EEMTSCUaWy0xibGAap7
	4y4AzqEX3Z6HPBpFKEvcf2fck1TC4qSBxqA4lMxcd+A59w9J4eboG9/b7Fp+
X-Received: by 2002:a05:6820:1381:b0:71a:e932:868d with SMTP id 006d021491bc7-71ae9328a11mr3770709eaf.79.1794871430197;
        Mon, 16 Nov 2026 15:23:50 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:59::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ae6868fc2sm5390820eaf.2.2026.11.16.15.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:23:49 -0800 (PST)
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
Subject: [PATCH v2 2/3] mm/page_alloc: move the kswapd node skip check into a helper
Date: Mon, 16 Nov 2026 15:23:44 -0800
Message-ID: <20261116232346.788145-3-joshua.hahnjy@gmail.com>
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

get_page_from_freelist() checks many conditions for each zone, often
with a big comment block explaining the conditions.

Move the kswapd check and its comment into should_skip_kswapd_zone() to
make the zone iteration cleaner to read.

While moving this, also resolve a checkpatch warning which complains of
a waitqueue_active() call with no corresponding comment explaining why
the lockless use is OK in this case.

No functional change intended.

Reviewed-by: SJ Park <sj@kernel.org>
Reviewed-by: Chris Down <chris@chrisdown.name>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Tested-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/page_alloc.c | 47 +++++++++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 18 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 4d829e5eac49d..43929faffb989 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3785,6 +3785,32 @@ static inline unsigned int alloc_flags_cma(gfp_t gfp_mask)
 	return ALLOC_DEFAULT;
 }
 
+/*
+ * If kswapd is already active on a node and the zone is below its kswapd
+ * watermark for this request, keep looking for other nodes that might be idle.
+ * This can happen if another process has NUMA bindings and is causing kswapd
+ * wakeups on only some nodes. Avoid accidental "node_reclaim_mode"-like
+ * behavior in this case.
+ */
+static bool should_skip_kswapd_zone(struct zone *zone, unsigned int order,
+				    const struct alloc_context *ac)
+{
+	unsigned long mark;
+
+	/*
+	 * This means kswapd is asleep, so don't skip the zone. This is a
+	 * lockless check, since a stale result only affects zone selection.
+	 */
+	if (waitqueue_active(&zone->zone_pgdat->kswapd_wait))
+		return false;
+
+	if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
+		mark = promo_wmark_pages(zone);
+	else
+		mark = high_wmark_pages(zone);
+	return !zone_watermark_fast(zone, order, mark, ac->highest_zoneidx, 0);
+}
+
 /*
  * get_page_from_freelist goes through the zonelist trying to allocate
  * a page.
@@ -3796,9 +3822,6 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 	struct zoneref *z;
 	struct zone *zone;
 	struct pglist_data *last_pgdat = NULL;
-	enum zone_watermarks kswapd_watermark =
-		sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING ?
-		WMARK_PROMO : WMARK_HIGH;
 	bool last_pgdat_dirty_ok = false;
 	bool no_fallback;
 	bool skip_kswapd_nodes = nr_online_nodes > 1;
@@ -3865,22 +3888,10 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 			}
 		}
 
-		/*
-		 * If kswapd is already active on a node and the zone is below
-		 * its kswapd watermark for this request, keep looking for
-		 * other nodes that might be idle. This can happen if another
-		 * process has NUMA bindings and is causing kswapd wakeups on
-		 * only some nodes. Avoid accidental "node_reclaim_mode"-like
-		 * behavior in this case.
-		 */
 		if (skip_kswapd_nodes &&
-		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
-			mark = wmark_pages(zone, kswapd_watermark);
-			if (!zone_watermark_fast(zone, order, mark,
-					ac->highest_zoneidx, 0)) {
-				skipped_kswapd_nodes = true;
-				continue;
-			}
+		    should_skip_kswapd_zone(zone, order, ac)) {
+			skipped_kswapd_nodes = true;
+			continue;
 		}
 
 		cond_accept_memory(zone, order, alloc_flags);
-- 
2.53.1-Meta

