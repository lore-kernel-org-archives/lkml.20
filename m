Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E044A387E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792098349; cv=none; b=fZqzgtIlH3a+UXFSCAXERsdolca7xRa9dhkzT5f2ndowna14vD6YZfWC8OfgiHvUnKIKn8qY8Ir7ZSbH2e6oE/lgOsQQmOwJ5IAIPXh3Euz+Oa323uU6W98lBhIeQCvNczJpZ+D4gCLeWfCUAiu9PmetwOpob/mZAcFFHK79PRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792098349; c=relaxed/simple;
	bh=aOCBkB1ohjW/2eEMaXRNHBXwAny3o8OCwYXHqgLf9H4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kI6HroGr9keHnknKgiI+GVogoHAyq2BU8YQ+MiQfWyTX2zdf0/dPzdVekVSQiOGPnDciDX0ynMthS2DPjCEacKeQil1ZWoJ8qyEoTpdjfhNWwSuVves4LnCtT6AQW6o+NvcPEGZPYygEZ06Dtm8pRzCCEpIB82r0KMrdEKuwwQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=EjIbK7Kj; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="EjIbK7Kj"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-917a20e9efeso80522296d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792098343; x=1792703143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ncaxmlrNNhxOdRmkKnio/byckek+qNzzNxHvBVY91N4=;
        b=EjIbK7Kjpxf2YT3DyE7L4UfEkLVCRY0Qg6K3INUyj/eQFCirmHGP1SuYRpRjFdO/Dv
         V4oAnjnMB1hTl0B4nQQEy9eyWm6o/0wjGFSKL+qVhuxAi2qKrBqPyMeoHBRqXTzROEbw
         tg8vJ7elASquQJyzWDjT7jhXYBtVC5TXIScesmvn6CZ+QGdpLvElRhyLyiyg07MpBcps
         hOq1CjzsIii3AjApiV+IfthHGfy8+TdUZ7ptYfmxKXvlm1YUaYKnU8N7sxHRmicMSyM3
         onLZ66xe3y17rRcC4WA63lfz+gFBPkWfuxpmf8veFfZsppS7zkeneGDuwX5l+IPKaNqx
         6nTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098343; x=1792703143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncaxmlrNNhxOdRmkKnio/byckek+qNzzNxHvBVY91N4=;
        b=m9CA+sDKuuuTJtOzRtG+D3ugNqkvsaf4iPDZjyYHgZNfGfaLf27WIEjckEPKy1QuOZ
         HndAbhLcvuBNWlXambxj2VyNraNT/jx/vmA4asVQ85xXC5W+4jwVsWWYn0O/zNhoOcxN
         82qwoyLVijTacznAb7nwPSEe5W4p5bfeF3Sy17oEfgwQRJVdK+mHM6LVLsO8khxhksM4
         HOKVEVE9zTvONA9oErZF1gSDw+NWTTrx6XciJt2oVo61xsEpCnKRz97Pxit6OKVXM7bt
         2zs9yYz4ysVR6uazsQRH8LkXK1tCrixFZO4vkmm8JF1/GbQep2wVUiA/FVi7ENTO34wm
         bWHw==
X-Gm-Message-State: AFq9FYKh8jLxOrdri5fq/YGoIyFtBA+BpWSTo4wFLH8sbfYlf69HPwuD
	GI3cv/dMjtOZQt8MYfv8XYvJTmDpVmrsoMj57Sv2slsfiX6i+Ocouv/MKCr7uikeU8o=
X-Gm-Gg: AYBFou0uaysn2xsDJVo0mDOYxAk0lxmk0dKqWRk/KOceah320hbJIdhxDo6i+kI2D4h
	egmWMiWsGk+dU/g3DWIZbTkg0zqEffvmGuNTKlH8ma4+yrm5glFMDGZeNVVbKl3jh5SxAmbW+9y
	Kt60QiosjAHgtReJbqYu5m1C6W0Fbu7wNpBjwiOIZQmSnH0BSTdC8H60QPpL21F24+OGS8KYxJD
	QYnScbxVHg9BLcHN1AQXXkOkZlim0MEgCK2DeJKs26uqAOdMC1LcrLdbZSKtjlZfc58a86wvS7+
	NGaOO+Bdjiun0eoZUv5VQSLLy4kkMsZlR4pfjUJmb3COWl3iRveizcPcZ7uXwjRQ5tv/GL246Hm
	JaWPRx0c/e0DsmPTVCNIGWLx6YtCtyKiVnwLpORvWffp6VqzaFpXfPKErJaecnxmd26svdx4LBP
	wFUzc2V1mE+T4Lzc7n5LLvOEGEexCKYuTE9XN7cGUKQW1KfCca0mS+QI/laT8rfZyydoUQPEznC
	DC4GLAl0Aj5WnKT5LWIyhfcam/IVOkodEza3HiAwDW/ViFcCOU4BwCrb+MC
X-Received: by 2002:a05:6214:4497:b0:917:edd4:d1d5 with SMTP id 6a1803df08f44-91b557bd604mr362771606d6.42.1792098342597;
        Thu, 15 Oct 2026 14:05:42 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbbb0d44sm5187326d6.47.2026.10.15.14.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:05:41 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	mgorman@techsingularity.net,
	stable@vger.kernel.org
Subject: [PATCH] mm/page_alloc: validate zonelist slots against concurrent rebuilds
Date: Thu, 15 Oct 2026 17:05:39 -0400
Message-ID: <20261015210539.3243563-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Onlining the first block of a zone (e.g. via virtio-mem or a DIMM)
rebuilds every node's zonelists in place. An allocation in flight can
then be served from a zone it never asked for: a GFP_KERNEL allocation
can get a page from ZONE_MOVABLE.

The allocation succeeds, so the zonelist-retry logic never triggers,
and an unmovable page in ZONE_MOVABLE breaks offline of that block.

Recheck each zone the loop visits against highest_zoneidx and the
nodemask, using the zone pointer itself. This covers both cases and
is a no-op without a concurrent rebuild.

Reproduced with a kprobe harness holding a GFP_KERNEL|__GFP_THISNODE
allocation across the online.

Fixes: c33d6c06f60f7 ("mm, page_alloc: avoid looking up the first zone in a zonelist twice")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 6ed36ba4d055..a1254f2e1892 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3782,6 +3782,19 @@ static inline unsigned int alloc_flags_cma(gfp_t gfp_mask)
 	return ALLOC_DEFAULT;
 }
 
+/*
+ * The zonelist can be rebuilt in place while it is walked, so the iterator's
+ * filters may have passed a slot that now holds a different zone.
+ * Recheck the zone itself before using it.
+ */
+static inline bool zonelist_zone_valid(struct zone *zone,
+				       const struct alloc_context *ac)
+{
+	if (zone_idx(zone) > ac->highest_zoneidx)
+		return false;
+	return !ac->nodemask || node_isset(zone_to_nid(zone), *ac->nodemask);
+}
+
 /*
  * get_page_from_freelist goes through the zonelist trying to allocate
  * a page.
@@ -3810,6 +3823,9 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 		struct page *page;
 		unsigned long mark;
 
+		if (unlikely(!zonelist_zone_valid(zone, ac)))
+			continue;
+
 		if (cpusets_enabled() &&
 			(alloc_flags & ALLOC_CPUSET) &&
 			!__cpuset_zone_allowed(zone, gfp_mask))
@@ -5234,6 +5250,9 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	for_next_zone_zonelist_nodemask(zone, z, ac.highest_zoneidx, ac.nodemask) {
 		unsigned long mark;
 
+		if (unlikely(!zonelist_zone_valid(zone, &ac)))
+			continue;
+
 		if (cpusets_enabled() && (alloc_flags & ALLOC_CPUSET) &&
 		    !__cpuset_zone_allowed(zone, gfp)) {
 			continue;
-- 
2.56.0

