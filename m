Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222378;
	b=q9HE5Zj9o2wogUzNGrr+/J21bAvlVP7P+egCGdyY6smzhQ7F9kIgVLaobkYl4B0FOaZL
	 xcT3iHXiWfHOnf5GCF+2OtiX9hC0G5sN1LfeF0sKR9LYciEJg5JyZTVI3EsgoqX8hVJr5
	 OrQdJw/IPQsjn63PO3TThzoQv2u+CBRbX+dSgwmoNTDoX8qf/qSbM3j/PrGSckS/0gkQX
	 ChapPOBZ2K2CoBoEnbmRzxgEHUCNM+hzVNjmdSS22zsg2VS1CJE8sNBvTP0teg38WJkBl
	 3vOfuPlfIs3Pt+Rrmv56EDraMeYDSb/7vhxtP4EadA5qRjE6yCZdzq9t21Bo2NE8mxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1qDLFGzOABB53SqGvA4E/3rKuoqOq+XmM1bYUdpKmDY=;
	b=to6Vax8ye4N69K/mk7NDjpJ8zR8xfVE1LueccZdqBvAttsxZLrsqsy2bsxYg0ut+gXgK
	 5NbRey2xpsnOLIFBnYEJGGfVD4/zqC0zW4gpvxLzmPLILnAhp9pZozf+2ZU05C44x8TtN
	 JJZoaivEhSZX92HJ0ZM5H+n8pmc+y4/gUiUCMdXpFhfpKZmnHb4f+x75UYoAGS1SZXE9j
	 bauusEJAh4MfS9Zp7lUa1kcEBJBVLUf9un+4DhR8NDSuH6T8FMGtTl/769tvyfaPMTepl
	 ceEycsN8Mah9Dao4pCFwf6lrUkoRmETR51zzVUo8pljzr+KKacj0fHsj0Xq1tMVZ60A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=kTMhMZiQ;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E9360A260B
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E9360A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=kTMhMZiQ
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91c75be77c4so16464946d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793222377; x=1793827177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qDLFGzOABB53SqGvA4E/3rKuoqOq+XmM1bYUdpKmDY=;
        b=kTMhMZiQUOk6JHIFen4OY/F4++2LudKwXi4T5jGyrRqh8tEt7rzRNZ0l58e8RJVpdA
         uqMuSl+12qqva1eFLvNBNGxkJaA1fBFfKFxUYyZiqr9TH8EBZrWstCPQrHihExLfM7KD
         qjen8SgtSAeGu5iGQPOj5X6bZf1XS66N5uk/2/++zZ0kfrZBy0b2UKIidiOVPp3ssduk
         Eigt+jNLkcJRVgW05U+Bp3uWKkNNJyQgNxoCbYDDqB4IfBzttpvOGIiu348xLdCsXbIW
         A7e8zQOVQeDUE16NsyoW7T2nHo8Bf8B/rzEDSFLDjr4zI21tBIJud0p/VGds+Kv/jj1b
         QAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222377; x=1793827177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1qDLFGzOABB53SqGvA4E/3rKuoqOq+XmM1bYUdpKmDY=;
        b=2DKyhzBwDXTYgrzaUrlZ8P001zMcQw/Ga3q3wSgQ9W40ae/YOnwoByxcka5Q7pSLTJ
         YLdFw9EYQWHvq3vHHLlwfL/EWSrCUezFSmhStfu2xuS3ANQN54qb4/mVMkeKAqRHHI1y
         29SYKkvX0DyI7DLCaxlCByNu/JW3XhBAKpHYhcQ9HW0q+b0d5i04Ep3CAUIiEQ7Km69Q
         6pKLBwHvPYYe+E0CyxFATrKl3p2BL/FnuCEmVFyaD17QG8st2XLnno7LUHYfn25nnqcQ
         4TSWHyvaG8VpLKpHA87eWNkQz7zgV7sgir2S4aRC/zyQG5ONCyHN+hdna3baYXkmPJnU
         gjBw==
X-Gm-Message-State: AFq9FYL4UJA36dJndYjBVwn4IuIOmUikFVowPdCM6RM4a+nS1dhnCvUi
	/zFmY7cdOkvQA5SMXYOcS5S68uXu+KnFbCPr9f91rzRqXgCnp7syRMXdd+ozm11a1Eo=
X-Gm-Gg: AYBFou2Fz4gB4SihNZNzTarM10Nn3RPxVOE/nzNZl5xn2HYWoKa1PtJ5btvPwqhDSEY
	AluqI8O9duVxE9Vv342vSiZuVkXJMdP4udlhYJr5ek6WambSyWgBv5omiXdZoTX+m9c3hukwyYB
	o8WjPhm07zk2Tt31HtJt0h+PJeecasSQbyEURdfel01lxtIwViaf2rIwM5KSb4Ebhu7e80B+uC5
	Cgyd9svQA+iLSgPGAbWcvT7gAGrvOAPGLPaZCdCPanpli8Ukqe/7MIvuGNTIjgfeWqfAzBKVvby
	MgR2mLTSjjCU3+IO1waV81Kaz8XTfdtiYguR3bNK1+twlNLX1bPhVsX73f7Jj94q0ueFu16AbPq
	GBAz/RPMmgYrHw3CI7aRr578y2vBfGAf+SzPueP/H6KKoixRmf2mKAXG8G08OZcaTGa+3z2QCim
	yPbcqVqwrzryRk/Puv8DtILldVzDgLtfhFkdDZM0vERBnlBC8QzQYeq9uTK87MgBmQtUQ6/lbjb
	MWCjHA/m1uxbD70pjbIGRLtakzzaQ7ouK7RZ5VlZBFvpcYcDoq9Gc+PUB8AG9wETRnQZwwEGVmt
	01QPApQwfCx0MmTJRAM5LAR4VCNOUVU+DgHBekNkLW4lsxc+3cCvBQy8qwr3Xl8QI3H92uvjqfT
	nE4ada6dlI15+5mU=
X-Received: by 2002:a05:620a:3183:b0:93f:3646:7a57 with SMTP id af79cd13be357-94408cfbb47mr549993085a.57.1793222377269;
        Wed, 28 Oct 2026 14:19:37 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a6d598sm139778966d6.3.2026.10.28.14.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:19:36 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: [PATCH v4 3/8] mm/page_alloc: snapshot the preferred zone against shrink rebuilds
Date: Wed, 28 Oct 2026 17:19:25 -0400
Message-ID: <20261028211930.3504634-4-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028211930.3504634-1-gourry@gourry.net>
References: <20261028211930.3504634-1-gourry@gourry.net>
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
index 52533992ea16..24106c881ec2 100644
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
@@ -5184,6 +5193,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 {
 	struct page *page;
 	struct zone *zone;
+	struct zone *preferred_zone;
 	struct zoneref *z;
 	struct per_cpu_pages *pcp;
 	struct list_head *pcp_list;
@@ -5232,6 +5242,11 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
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
@@ -5242,8 +5257,8 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 			continue;
 		}
 
-		if (nr_online_nodes > 1 && zone != zonelist_zone(ac.preferred_zoneref) &&
-		    zone_to_nid(zone) != zonelist_node_idx(ac.preferred_zoneref)) {
+		if (nr_online_nodes > 1 && zone != preferred_zone &&
+		    zone_to_nid(zone) != zone_to_nid(preferred_zone)) {
 			goto failed;
 		}
 
@@ -5251,7 +5266,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 retry_this_zone:
 		mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK) + nr_pages - nr_populated;
 		if (zone_watermark_fast(zone, 0,  mark,
-				zonelist_zone_idx(ac.preferred_zoneref),
+				zone_idx(preferred_zone),
 				alloc_flags, gfp)) {
 			break;
 		}
@@ -5310,7 +5325,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	pcp_spin_unlock(pcp);
 
 	__count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
-	zone_statistics(zonelist_zone(ac.preferred_zoneref), zone, nr_account);
+	zone_statistics(preferred_zone, zone, nr_account);
 
 out:
 	return nr_populated;
-- 
2.56.0

