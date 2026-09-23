Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761763CAE7F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197851; cv=none; b=i4Cdjt/duEnIdWekVsdcvhBF38Mxdk1iVY/e7tcxjeA8Da7pN0k9piDNs9OkS69Izl51QCOH3p74APWP6zB5H+5q2Tk685J5LsmqYVJhTmtJsOHMuhumWGqeyiyG+5kFVPZ1VSOP2UQbJR0v872OeclnQEe07Al4MjN5SpD0duY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197851; c=relaxed/simple;
	bh=Tvs161wK/s6K/mulS/cEIE9S02EbKDqru6nU3kHzh6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBZrPchwZPUMtw4FlTu8PBzr0UklrqhGMndinaLjnah8AP6aLakXc6pd+EjsV4rt1L0ckKsHZBwEMPJJjvpTaLvXR2ZZdvPH6fuc2ifzwvxr4Vtt2A5O6a/I9UzPPIqxKxYVSdzf/f/JWc+ySDi1b4nItHyKmtIrVJzE52lVB8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Dc8mP499; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Dc8mP499"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d43db0c29so20634227b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790197845; x=1790802645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zePS8k8rZkvT//tsMfFKaNJkinJJhgZrZUtUQPvClt0=;
        b=Dc8mP499sNbmnrwOL4gT4CpT2VbCFbNCphPOI87/uJX5psAthH/0OoenOq4HkR3pnl
         /4vuPmJK1h2EUZWLzzkCYj7dtsIMwDQgAbkbO6MwZHl+J7csg8Yms2UkY/MurchPwKeW
         lX3KHT0jXNoWe1gCwXWhxSe82pFGtdLfTU50mQSXK4tKAbXavJtptfA2o6B+V60/Lp3z
         7qaDDrw19T4yDZqdQS9D9AVgGxG0PIXnbtMgAokmNTOATdUCoO3iuAq9L/7Wk6DJ96oC
         sYiSwzfiCbM5iwBLx1x+EOZhdkabnK46sBPexTtJ+PAaJePHG44m4v3iD/rx6vfmSAMk
         lLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197845; x=1790802645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zePS8k8rZkvT//tsMfFKaNJkinJJhgZrZUtUQPvClt0=;
        b=AjpUH4ClySE3DJPysad5Fyyn4KSYqia0W7rUJyXBbn5/tle/US78JB3MAS3165qG4x
         PDAEn2b4Rii6tGAFR37TlBa8KouwN/IcK+h5OdEp1bGN5JrBk8z3hDAJPw46SKBDjloY
         /afEZxzyyIrpRp2cBgFpjutp5gXvA0vzuyVqvS9qGeD8TTT3D7JmtHhM4xn1beO35X3/
         HlRMeZhdjXd7wPOFD/wGdrA4Wy/PVrc/X0KF/NuaSMUHJKuLsIGj1zuQd3jLFVj0nPMj
         PFUyzsArtXfq8PbA+Z2juEjnLweM/b8zCNq2vKaV/LVkjK/sZ71B2q4AXmzz5+GdzKGB
         dBzg==
X-Gm-Message-State: AFuF++mONppQ7k3n3stlMOzTuZo+XlXa0AT07U2V5osolWne7Koh5aoH
	3FqEdT+Dm0JSeFGFK4UgTwjkO8vWTjaSn8bS8udKal22ph2nhUcbQOdc9nJr6JELXYI=
X-Gm-Gg: AYBFou3DzUD+O5tAd9vO1WGMDGbD7fJkJYVmqNTKNwcgeKKSdHMZOnXwUm7urp6xfqf
	p9X0OKhFkIBBNkkjfdujx1NXGCP+my/9iRYF/pwcan8L2ZYmuIHP4HLQuhVGmqi0rOg1XcT9EBU
	PLwQKXtAh0BVqZfAmIZB0XVMxocFWwIElRG8SagpGKa+rCZkZ7fSIXklnU6SSPjY2NIrgj6ENvz
	o821US5woXnk0xKT9Vbn8Y9lRuuKFdBzZ9bk5djfv29QnCfweOLeBnf6JltMqxJ0mhvDmbQBlxn
	IFPXA+0KLaoApo2IwOc6OI+pzRjRkKJzgaP7OtmJEB5/VsP0TmXyV7fljH8W163/ZD2Ho2YwQns
	fBM16/NtSH3/bBBOv0KmTSs6ZpX8XwZKnKZ9LO5XVKIHpMXDtssknEfV+ZGDKRo2a8QH5f7BDNI
	f0etfvM7i41c+PNpXaywNWWkGJ/R4W8m/9rK1WYNjuyXh9gizT5RcKq3DB7ZxTeYvQV9nnEPx3L
	m7JmL+uY7B35IATCJWewBfIC9Vlg26QnukPFYV4ed70V5DhNEPQg+FgEtRZ
X-Received: by 2002:a05:690c:6610:b0:873:17c9:b054 with SMTP id 00721157ae682-8a648505a0dmr2839327b3.21.1790197845286;
        Wed, 23 Sep 2026 14:10:45 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2485926esm305893085a.19.2026.09.23.14.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:10:44 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kernel-team@meta.com,
	willy@infradead.org,
	jack@suse.cz,
	akpm@linux-foundation.org,
	david@kernel.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org
Subject: [RFC PATCH 1/6] mm/page_alloc: clarify bulk allocator flag scope
Date: Wed, 23 Sep 2026 17:10:35 -0400
Message-ID: <20260923211041.3127588-2-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923211041.3127588-1-gourry@gourry.net>
References: <20260923211041.3127588-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

alloc_pages_bulk_noprof() uses its local alloc_flags for fast-path
watermark, cpuset, and CMA decisions. These are distinct from the
allocator behavior flags stored in alloc_context.

Rename the local variable to fastpath_alloc_flags.

No change in functionality.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/page_alloc.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 07e03c7c7771..728dd1a36f0f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5169,7 +5169,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	struct per_cpu_pages *pcp;
 	struct list_head *pcp_list;
 	struct alloc_context ac;
-	unsigned int alloc_flags = ALLOC_WMARK_LOW;
+	unsigned int fastpath_alloc_flags = ALLOC_WMARK_LOW;
 	int nr_populated = 0, nr_account = 0;
 
 	/*
@@ -5210,7 +5210,8 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	/* May set ALLOC_NOFRAGMENT, fragmentation will return 1 page. */
 	gfp &= gfp_allowed_mask;
 	gfp = current_gfp_context(gfp);
-	if (!prepare_alloc_pages(gfp, 0, preferred_nid, nodemask, &ac, &gfp, &alloc_flags))
+	if (!prepare_alloc_pages(gfp, 0, preferred_nid, nodemask, &ac, &gfp,
+				 &fastpath_alloc_flags))
 		goto out;
 
 	/* Find an allowed local zone that meets the low watermark. */
@@ -5218,7 +5219,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	for_next_zone_zonelist_nodemask(zone, z, ac.highest_zoneidx, ac.nodemask) {
 		unsigned long mark;
 
-		if (cpusets_enabled() && (alloc_flags & ALLOC_CPUSET) &&
+		if (cpusets_enabled() && (fastpath_alloc_flags & ALLOC_CPUSET) &&
 		    !__cpuset_zone_allowed(zone, gfp)) {
 			continue;
 		}
@@ -5228,16 +5229,17 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 			goto failed;
 		}
 
-		cond_accept_memory(zone, 0, alloc_flags);
+		cond_accept_memory(zone, 0, fastpath_alloc_flags);
 retry_this_zone:
-		mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK) + nr_pages - nr_populated;
+		mark = wmark_pages(zone, fastpath_alloc_flags & ALLOC_WMARK_MASK) +
+		       nr_pages - nr_populated;
 		if (zone_watermark_fast(zone, 0,  mark,
 				zonelist_zone_idx(ac.preferred_zoneref),
-				alloc_flags, gfp)) {
+				fastpath_alloc_flags, gfp)) {
 			break;
 		}
 
-		if (cond_accept_memory(zone, 0, alloc_flags))
+		if (cond_accept_memory(zone, 0, fastpath_alloc_flags))
 			goto retry_this_zone;
 
 		/* Try again if zone has deferred pages */
@@ -5269,8 +5271,9 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 			continue;
 		}
 
-		page = __rmqueue_pcplist(zone, 0, ac.migratetype, alloc_flags,
-								pcp, pcp_list);
+		page = __rmqueue_pcplist(zone, 0, ac.migratetype,
+					 fastpath_alloc_flags, pcp,
+					 pcp_list);
 		if (unlikely(!page)) {
 			/* Try and allocate at least one page */
 			if (!nr_account) {
-- 
2.55.0

