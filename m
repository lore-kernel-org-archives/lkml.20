Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550389;
	b=RUAdIb1v2/PyjIxDI9afP0HvXNXWKZTK/R6uznRdU7C9+ejeQKMZpg1MXQGi5S8jUY82
	 dVj1jzcdORl7+BQSDyiYFyOiWCKEQy7AGtBvzAmtX6e2LdArm73kChs0iW/70WXqHrsbA
	 H+RClm04HNtb7Z2xY69xLeYuPyUup9kIVG5j4FGig2TAJo0xORB0QJtHmPhDLKr2/jZ61
	 KsCMbCJGsqDwJJ0mXgXO8PnUEi4W455wEdAIIzXaRHpo8PSLaufmEQqnjGusjUceW8O3e
	 9La9Axp2QLlDEV2b3ff2rt0K4PkZtPFqXpOBZkj9yig+x3LOecmW9deImPO6fjbiTYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wZzEJG+KuWuKC34TpbwLEcO6lDSRUEVZ4rjGM6mtgtM=;
	b=C4pEweKfmhHsBTLVviZI8vz67cvqIayvDzjLUZO3aAG+DONZzSGonPlYClKRmNf64Rnk
	 2/VZCzyoGp69t8BlKOaKHvjLvvxPC2570oRydOcAraQHrmi/oUgTFZiFF8HaegUTTZsZJ
	 srEVj6+BiDi83voQ/c5WBfHj/R5PwcYxNGlo5v1YTz58EyjgKMC/tfTPW5Sy6Yf2I0tf2
	 835/Zmzy0RSoCPntldpsXeccsAhsyEFtGH4aMlqJrKJpASekNbiRxTtvWT5KghKjOwwRs
	 bSqgp9KzyOW/87s+hm+LOdIdHE3qCR0dvC/TA8/YS9VmddMsthG/QOreJdTlWfkxlUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=H3FKdH7p;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B70F606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B70F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=H3FKdH7p
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5364042eecfso3787541cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792550388; x=1793155188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZzEJG+KuWuKC34TpbwLEcO6lDSRUEVZ4rjGM6mtgtM=;
        b=H3FKdH7pQ+Zcx3kdgD+0Sou2nJSOqubYd3/2EHfQ6oTc56ShplBnAUEMZQv1RcBoz4
         Wr+u3cPO3UbK8i6RCCalG3uIcNk5GfDTTjG+61Y9bXomJtLei2/J5boY8IxHngl9Y0Ba
         bzBkN0bSxvGwNo+FCshmHVaXqc/uQj98zF3TbK1MUtN6++wrynAwuY5etI8C4OyMGFEt
         9gTjjUfhYVs8X2N9OV9jvGSigm+HE24TW56AEly7m3H0YPkz64K5ifm7F7Lf0/Z92ymK
         QUDJo3Lq6ooqtCK5SXCRxeAe50ktyYOqtiNtGC3lyJZuh67XrnvDKoG8iTQ24eUWD92q
         OYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550388; x=1793155188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wZzEJG+KuWuKC34TpbwLEcO6lDSRUEVZ4rjGM6mtgtM=;
        b=2NbMKpiCBC4Xdb+R68gx0+e3WLB4zBj+Z3NNg1dt4xgF4VlARnRPac1v92aFSYJyql
         ISdtyQRoTqLoCYkH8Xq7/LjbuG0aR3CsSKnuOQq/FjYZl6Gtj/A1iUoqc7jCScKnAdAb
         yaou55DYaC9dq2dWV1SrfzQ6NUXFdtH9I9kX9EnxRC5VWURgcaKvewZE0GlAzkRFHcQo
         1PHxnfgGtmqYsLi3OAppsCuIXkkbCy7fcP047QSXbc9Ip/UTpYtUvYdlKD9N4XinLsiQ
         XYsyWzQzwylmsOfgpob9zy+0cbCaAagjjtAmqHxnXXTh3b7cjJzrMLKZUB1dIjDwS2I7
         M1iA==
X-Gm-Message-State: AFq9FYL5VxawqskXqstEc89msvE56nF74tBgmsv22h///6GolIP6Tf62
	6LgDkty0/kO3Jilef+bxZJUe+E0FOGA/3imcwZr9J/amklXec8caEUbFtLF96a7bSIw=
X-Gm-Gg: AYBFou0+hB4cu4oY3NaC4/YutLtc3JV39QCDsFiCZtJhdj4d2hGl/xKR59m/G6WfU1i
	Q+WPnA99PiV8WstCrW6tWF0ZL6fmFigwVQmni55mPFSMH8zpV+Cd5Hf2VzEeoAsvC0pRvsfsS7A
	NhMPIqVHhds4X8TxYo5IA5z0BSksnnlwAA7psdDOOvSjIeWZ/80RKcdqrRAPuacusPErR7Hctx8
	E0zb9gjqjLTmysq8raakexeTO23nJZKA5lNbJHlMJCcjD3geXVddu3cPUyc8E55qQmD+m+yR1FD
	UKs1xERj6hcBxJ3qpp5dHTjoF5Yzdct1Fml1/x38u9QLEzbCUItJGvfDFqltTJlDA75EIwft1CL
	srwYk1cJRnowcCJbKFwKO34vAe8jy60sm7C33Boedy7TGZxDGAbHDxbcpTY2DvE98Zedeeh/A2l
	gdYRDBj+fA5bAx4j8pPKCOTUL5fouiNRIr1s1Wh8PnyXl+0QoCWClSneNq9uyfEzu7DGP+dT3Tt
	R76MkLsEWTdv+esmoBYp90HDZMn4i02hWL99Vq8ZJMEuYsqfB7Kr/0QiNcDBCNqC+806UsWDbjQ
	5FiENm/3zCfLW7Z+znelVxieSjIW5C7WFC7eUhpbzUV0+tonKzWzYYfefLHA9lo=
X-Received: by 2002:a05:620a:28c8:b0:93b:db80:e0cf with SMTP id af79cd13be357-93f57f4bd53mr204750985a.60.1792550387716;
        Tue, 20 Oct 2026 19:39:47 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10a45336sm13819426d6.3.2026.10.20.19.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:39:47 -0700 (PDT)
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
Subject: [PATCH v3 2/8] mm/page_alloc: snapshot the preferred zone against shrink rebuilds
Date: Tue, 20 Oct 2026 22:39:34 -0400
Message-ID: <20261021023940.1940971-3-gourry@gourry.net>
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

get_page_from_freelist() and alloc_pages_bulk_noprof() reread
ac->preferred_zoneref->zone at every use. Offlining a zone's last block
rebuilds the zonelists in place, and the shrunk list's NULL terminator
can land on the preferred slot mid-walk:

  CPU 0                             CPU 1
  get_page_from_freelist(GFP_KERNEL | __GFP_THISNODE)
    zone = NORMAL (slot 1)
                                    offline_pages()
                                      build_all_zonelists()
                                        [MOVABLE, NORMAL, NULL]
                                        -> [NORMAL, NULL]
    rmqueue(zonelist_zone(slot 1), zone)
      zone_statistics(NULL, zone)

  BUG: kernel NULL pointer dereference, address: 0000000000000060
  RIP: 0010:get_page_from_freelist+0x6a5/0x15f0
  Call Trace:
   __alloc_frozen_pages_noprof+0x125/0x330

Read the slot once. Zones are never freed, so a stale zone is safe, and
a NULL slot fails the same way as walking off the end.

Fixes: 11cd8638c37f ("mm, page_alloc: remove stop_machine from build_all_zonelists")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index c7125f6693574..4cf2982c5b107 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3794,12 +3794,21 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 {
 	struct zoneref *z;
 	struct zone *zone;
+	struct zone *preferred_zone;
 	struct pglist_data *last_pgdat = NULL;
 	bool last_pgdat_dirty_ok = false;
 	bool no_fallback;
 	bool skip_kswapd_nodes = nr_online_nodes > 1;
 	bool skipped_kswapd_nodes = false;
 
+	/*
+	 * A concurrent zonelist rebuild can NULL or replace this slot. Zones
+	 * are never freed, so reading it once keeps a usable zone.
+	 */
+	preferred_zone = READ_ONCE(ac->preferred_zoneref->zone);
+	if (!preferred_zone)
+		return NULL;
+
 retry:
 	/*
 	 * Scan zonelist, looking for a zone with enough free.
@@ -3846,7 +3855,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 		}
 
 		if (no_fallback && !defrag_mode && nr_online_nodes > 1 &&
-		    zone != zonelist_zone(ac->preferred_zoneref)) {
+		    zone != preferred_zone) {
 			int local_nid;
 
 			/*
@@ -3854,7 +3863,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 			 * fragmenting fallbacks. Locality is more important
 			 * than fragmentation avoidance.
 			 */
-			local_nid = zonelist_node_idx(ac->preferred_zoneref);
+			local_nid = zone_to_nid(preferred_zone);
 			if (zone_to_nid(zone) != local_nid) {
 				alloc_flags &= ~ALLOC_NOFRAGMENT;
 				goto retry;
@@ -3916,7 +3925,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 				goto try_this_zone;
 
 			if (!node_reclaim_enabled() ||
-			    !zone_allows_reclaim(zonelist_zone(ac->preferred_zoneref), zone))
+			    !zone_allows_reclaim(preferred_zone, zone))
 				continue;
 
 			if (!node_reclaim(zone->zone_pgdat, gfp_mask, order))
@@ -3929,7 +3938,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 		}
 
 try_this_zone:
-		page = rmqueue(zonelist_zone(ac->preferred_zoneref), zone, order,
+		page = rmqueue(preferred_zone, zone, order,
 				gfp_mask, alloc_flags, ac->migratetype);
 		if (page) {
 			prep_new_page(page, order, gfp_mask, alloc_flags);
@@ -5183,6 +5192,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 {
 	struct page *page;
 	struct zone *zone;
+	struct zone *preferred_zone;
 	struct zoneref *z;
 	struct per_cpu_pages *pcp;
 	struct list_head *pcp_list;
@@ -5231,6 +5241,11 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	if (!prepare_alloc_pages(gfp, 0, preferred_nid, nodemask, &ac, &gfp, &alloc_flags))
 		goto out;
 
+	/* Read once; see get_page_from_freelist(). */
+	preferred_zone = READ_ONCE(ac.preferred_zoneref->zone);
+	if (!preferred_zone)
+		goto failed;
+
 	/* Find an allowed local zone that meets the low watermark. */
 	z = ac.preferred_zoneref;
 	for_next_zone_zonelist_nodemask(zone, z, ac.highest_zoneidx, ac.nodemask) {
@@ -5241,8 +5256,8 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 			continue;
 		}
 
-		if (nr_online_nodes > 1 && zone != zonelist_zone(ac.preferred_zoneref) &&
-		    zone_to_nid(zone) != zonelist_node_idx(ac.preferred_zoneref)) {
+		if (nr_online_nodes > 1 && zone != preferred_zone &&
+		    zone_to_nid(zone) != zone_to_nid(preferred_zone)) {
 			goto failed;
 		}
 
@@ -5250,7 +5265,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 retry_this_zone:
 		mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK) + nr_pages - nr_populated;
 		if (zone_watermark_fast(zone, 0,  mark,
-				zonelist_zone_idx(ac.preferred_zoneref),
+				zone_idx(preferred_zone),
 				alloc_flags, gfp)) {
 			break;
 		}
@@ -5309,7 +5324,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	pcp_spin_unlock(pcp);
 
 	__count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
-	zone_statistics(zonelist_zone(ac.preferred_zoneref), zone, nr_account);
+	zone_statistics(preferred_zone, zone, nr_account);
 
 out:
 	return nr_populated;
-- 
2.53.0-Meta

