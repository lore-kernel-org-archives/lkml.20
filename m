Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794613963;
	b=IsFV2tnHP92u82a8RGE8J41ZsUktDkcx6yd+v5wKzJUfysBy3rJEu/q9ylS/aQRl0lTC
	 UnoJI2DsZ/uAvWALMvq9UoDKhXA7Ezbt4V+RRH+aj8pZsYboYhil3eu7O0KvWKLfB895a
	 y/hvNss7XaE3otwx+twyVoeRrzJdRikMuh58Uzcy1Eulg9rNuztXBxM0y0wrCUECHnTKK
	 hlyqTfWeujE6bCN0O472OPhxFLfMPPCyfJ4lWyZN09LZ1eCU9ojzPTxkA2EyBdG/kv9KS
	 VgXmw4Dis38IIFf7X6LCavhCFWfF8gdzHy2buFbql6kygv+cUenutD8QZP4zWXmojYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794613963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3p/H7+3mLYBSagCd63fdFoeAPEOAgkODxSqUC7rZWUE=;
	b=VV3d6bs1GlJojKhG+Ma9iwUl58e5qvJn2ndVx7D4p07sUrsUnihjm7uWjDIqhqMD6Emt
	 iYeAuCSgIdQUpA6JbqqC6gPsj944reVMf+ZMZ2WQannXRDQUzU56NBR2cWqrDMCIlXEwA
	 0npqIqmG02R0sM7dRJWOtyyoO2//q5+DPhCRkLnpGXnRuIs8AW2VZWktGLuw2AugaP1Fd
	 fsDlFWrpURhbiPFMAKW7tMCGW2UgQvTvba7cyHdrRZr1ynH9ejECkLv91U/HO9ye1/oN9
	 0fECBx/K5W3+dJzh1GO+31XTpl4tGd8EkhXv+R2qxfgzYiSVLJehaWXZkKj1CIMr79A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O4NDFoxd;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04721606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04721606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O4NDFoxd
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67c6f1019a3so1955781d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794613961; x=1795218761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3p/H7+3mLYBSagCd63fdFoeAPEOAgkODxSqUC7rZWUE=;
        b=O4NDFoxdiwuh67ucR34xOGFoDKcH+10vhdASzWIUCDUkbfgYgcg4dGRlpeqIiBG1Ex
         +kpk5rKpN+BhB5JNu3KzH7W7OFZo/csKBNr+7kc1Q+Zx4C/qDsJhHbK20A6AYDH9kU2x
         YZGd6rO2YAvp7fPMpxEO7+z+pA26Ia5CBXSP5W5xTT+F1CaCyCv5YtlCY9QKlMrEBKBx
         0FDZbnW6ex9JmNEuXJRQcezMrJFbLrLyo0XF/XaOdPTsUg417pczMmyFo17/u1V1oHr2
         JKr0tTrrSkbfJggWwm/2YwtOKy47FenWk2BeC6ShwQ7zJ5c32IURvRSNNJKExz4FaFuy
         nltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794613961; x=1795218761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3p/H7+3mLYBSagCd63fdFoeAPEOAgkODxSqUC7rZWUE=;
        b=wD2tTUthauzIIHQeRRBios38CFD+XKupQiEhVzeA7QVuY3zO7psm/5aXKPJ65MWKKm
         n8RD5L00bUhDB5DqiHBVNaMQ4oVyZoNLrFcsVtxQZ5viTvr8csRnC+S63h9Yc4tZ18a9
         iijWd6ov5iaoDvU4L1rxO4Wzko4R7yxv0dDJwlHG7kQeQPB0qlFBl7VE/dwWid32SRdL
         FI6PpAmm4ucWB1I0WehksA161PgGDQawCGitc0RSL+KR20FeDWewjvYF6y9kz3C11oFG
         ras/U2vaM9vBZ+4d2dHy7vqg+RBp2GiMnOIOJDKA+9h306aU1/cCgEhMU4DFdFfhhUaW
         8g1Q==
X-Forwarded-Encrypted: i=1; AL+hErFE/owcCTb6pii2YJrZosyHN2V6YQR531A5SKF/B7uLfz0TGwD8/2Ei4Mk2VBUtIg9ubMyWUDI9+F0tIks=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DK3j8RXl+8G7eZgweFXba2rQEtxtzyawQ2GZ1UMTLz6AFXPJI
	bOSiRzz9DBXNNuPilXP7JfwVHOlAeF+7TOZMKlG+zHrccWxfieg3tF0S
X-Gm-Gg: AYBFou1RS9itFbdAZ7Kbj+Px47AD7FMjdOUiqPNm49T7ifZ/Qa+Ah0BuPPtmntujPcP
	fNcrJ1sOaZrquU+oj/luwDCb+3YRWN2hGQdHwEFlY5ZZbdr5I8v3jSwo+/k9D5uWcfEzW94XAnf
	nwlCXqDM0Xr+54YDtIeYBh3AeUTdDgq8duvXYnopAfxI8Tv9L+jK0dbhpnpLyl6i2Mmcm1MKHBp
	Gcjy76xnVAi9zklFQaACwkDJncs1gK2i6wLdLugxH8F6PQvqdX6kkfXObGR3LmkZeUkF4yDZUeW
	1p6UATLO+tq0NIHE5P63NAlCcB15q4rQO7zReXnRmoJUbaFxMjV4reNo+wTpf1vll4eh59hjjHP
	wWEXBH/M30OGM4b5jQnOW5VBd/y+cdyX8FSTJ7WsS2HRUoU1FVloRENAu5R1dUmS+Gcc87fLfO5
	5KornTfzLhZ1vakxSFUVl+Snmr8X/cdb83b/NWvh2HLiGjY2c9WcCU3V2exucp9jHP+F+JIQpW5
	egj4fUTFQGIlseOKtT8Ukb9e+7GkOafP5nx4A50IJsFFMLEttXEQNlqkA6SZ6VM1+9sfG/baiA1
	pHKHHEtLuSbEkx1iQfj3qy+6HOIJnYeQa+9l/vupHAr9mBwon3OwvXFuGpeu
X-Received: by 2002:a05:690e:168e:b0:679:ba40:efab with SMTP id 956f58d0204a3-67d895e5acfmr2112919d50.29.1794613961145;
        Fri, 13 Nov 2026 15:52:41 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:45::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a5cac43sm3428687d50.14.2026.11.13.15.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:52:40 -0800 (PST)
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
Subject: [PATCH 2/3] mm/page_alloc: move the kswapd node skip check into a helper
Date: Fri, 13 Nov 2026 15:52:35 -0800
Message-ID: <20261113235238.3595412-3-joshua.hahnjy@gmail.com>
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

get_page_from_freelist() checks many conditions for each zone, often
with a big comment block explaining the conditions.

Move the kswapd check and its comment into should_skip_kswapd_zone() to
make the zone iteration cleaner to read.

While moving this, also resolve a checkpatch warning which complains of
a waitqueue_active() call with no corresponding comment explaining why
the lockless use is OK in this case.

No functional change intended.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/page_alloc.c | 44 ++++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 4d829e5eac49d..2fe49f3c0de13 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3785,6 +3785,29 @@ static inline unsigned int alloc_flags_cma(gfp_t gfp_mask)
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
+	/* Lockless check, a stale result only affects zone selection */
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
@@ -3796,9 +3819,6 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 	struct zoneref *z;
 	struct zone *zone;
 	struct pglist_data *last_pgdat = NULL;
-	enum zone_watermarks kswapd_watermark =
-		sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING ?
-		WMARK_PROMO : WMARK_HIGH;
 	bool last_pgdat_dirty_ok = false;
 	bool no_fallback;
 	bool skip_kswapd_nodes = nr_online_nodes > 1;
@@ -3865,22 +3885,10 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
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

