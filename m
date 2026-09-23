Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CAC3C2BB9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197853; cv=none; b=uFUopGrmNh1WlQPUGR9gskUJLSGYRA46aN/pMMb0WmXhKyYwI9oHvr1sck9UpZ496c7DEH3tp7fbKopbpHnCIJv9zJM/avRnsuqfHvVIj4CNlTIGTIGJqD0bUJ3MdjZ9kadOS78dS3enDmER4g3GLSkY1+vuwDzcURBRRvgUCpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197853; c=relaxed/simple;
	bh=6+p9c16JaWvd1hm6n4rhzqJqBx/gTTw/01UKuroqhmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o4iG4/EZNs8B7hhYYB0nYm7zZuDQcYvstZtnQzChdKzGt87hgCRPAMDTHfO8mgQHCjR6AOnult6kfC21nrHB07Zk1jXqFbGsWjNaM7WNeQgnam8LxjjymrJd1gnCP0jDeFudI8FyJQxWcsJkr5QXWn3e4moObd+lR/6wpXb+r0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=uz8sfil1; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="uz8sfil1"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910cc46c4so134834785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790197849; x=1790802649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVr7KuSWyr8CUJERgbEEA0iI2fqWk3sHPjbcAbZFfj4=;
        b=uz8sfil1N48qs4SpM6831TG710nH4VNPJXmYySjrhJ7Cy6EkA2UyinpfsnKx78dT3D
         vJE+NdFypAXQw/W9ej1lKkKJo34nrU4y/Jk9sKIL6gAEpothK17WdBx9qk9fcHGwXAin
         0eKaooFB6VYEq5Ar8IZ+pism6w7GZkEQwtR5Uzk/XjM3FycNSzqYlcNQdu0dFEtTVa9K
         8z7v4NxGjnAHVx3Ul5l229ndO6zO4cCe41VmzXVRhfVDA4rpnx13W5A5txqwvjQsPvV2
         CbMG5KqL8NOptIPnKp6pYuiHvmLZC5h7kCfr3F0dXgf2x7kZG3Ho/NjzCZm5NM8fDTIX
         KDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197849; x=1790802649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xVr7KuSWyr8CUJERgbEEA0iI2fqWk3sHPjbcAbZFfj4=;
        b=StKi5P0vaDUOHMGNHJFQJCku/0cTLgL9avzl2hcWTdiGqKMprRyFSluGvSDuGQ4aN3
         jedePc75DV4GOj9YO5KLmd/w4Qs3EaVr69Dj325E+ZK+vtwTSs4OalhfMuUD3rz6TDgj
         Vd8R/ACbIwukAKYZ4PhMxW4pkcQfk+di6xZVl2Q95RXXCXx2GHbp96SZXvrI+0zjtXgk
         jD1IyZ++P5iszinkpk8FQSmVD/aJQ74FntX13iF2Fuspam1JlzvOtPRvCVAOJsqt4YSA
         HxssikMzn6JO9SubFvKAt6KP9rI8Uqf6xh2OMDjRKNVG8guMtaF/pFePfG4THn+PQkSl
         9t0Q==
X-Gm-Message-State: AFuF++le10XeIFj5C58ucc0yB7YDENsUsraQWc1REr80JptqaFoUO6jH
	/ACWCJ+gaRK0mnIZkqgMfsMUNAqCdj5jHhhgWTr/jnyUcQO+ZAgsUtOeO/UzMIShboI=
X-Gm-Gg: AYBFou1DD/UqB3pHk1G+LntKv6GRBcookxBjBpSfXgGD1Oj987AhWH6Fnna7ztUhY5f
	XoTlfEZme60LRGOT/KDNkn6zc6CIDSZnC1GwCn1yKhMNb9+QSU6m8kOx1nI71BhWrwBigcopdj5
	Lr0zHXeGJkZpxA5KsPe3iPDDowlcTbQQzS8MN6YN3etzojWMiXe1RBxm3YAnqAizlKS8HRWlrY2
	Ckz1F+RD5RbYmG2J7BEer4UOdodlJH6ny947Ss7YnH1L7ES0zv3woYAbObWfopOURpUYQ9IYneh
	JuA9MqdmddcentYMeg9+UeO7aOjNdzr2IGRjRuEz5ggxlduYPi/tmX3KSGDiDIgWiYAi81Kdg+/
	eT5425OBQhf9eXgQlE3pzs+9VYcrMC7X6DEQ3cO5G1z+ggvQRx3FZ+en0rvexL0DfIwFASg1tcQ
	3Z7jMpHNMvrDyg/ikjR3o8ooGHmZHhsSoUMZJeyQcb46feNJ43mvR9RKJZWfyt1zws/hP2YcelQ
	xU4hppSCEISTgS3RHLU+PIa9oCr/ZVpBkrO/yuGIV1IpEr/tCxmWbtXYHn3
X-Received: by 2002:a05:620a:880a:b0:934:ab73:ac53 with SMTP id af79cd13be357-93c34573b4fmr67685585a.0.1790197848646;
        Wed, 23 Sep 2026 14:10:48 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2485926esm305893085a.19.2026.09.23.14.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:10:48 -0700 (PDT)
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
	hannes@cmpxchg.org,
	Brendan Jackman <brendan.jackman@google.com>
Subject: [RFC PATCH 3/6] mm/page_alloc: add an alloc_flags-aware folio allocator
Date: Wed, 23 Sep 2026 17:10:37 -0400
Message-ID: <20260923211041.3127588-4-gourry@gourry.net>
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

From: Brendan Jackman <brendan.jackman@google.com>

The low-level page allocator accepts explicit allocator behavior flags,
but the folio helper hard-codes ALLOC_DEFAULT.

Add an MM-internal folio allocator that accepts alloc_flags. Keep the
existing exported folio and node interfaces unchanged as ALLOC_DEFAULT
wrappers.

No functional change intended.

Signed-off-by: Brendan Jackman <brendan.jackman@google.com>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/page_alloc.c | 14 +++++++++++---
 mm/page_alloc.h |  6 ++++++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b4a021fad183..feb9c64efd84 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5510,13 +5510,21 @@ struct page *alloc_pages_node_noprof(int nid, gfp_t gfp_mask, unsigned int order
 }
 EXPORT_SYMBOL(alloc_pages_node_noprof);
 
-struct folio *__folio_alloc_noprof(gfp_t gfp, unsigned int order, int preferred_nid,
-		nodemask_t *nodemask)
+struct folio *__folio_alloc_flags_noprof(gfp_t gfp, unsigned int order,
+		int preferred_nid, nodemask_t *nodemask,
+		unsigned int alloc_flags)
 {
 	struct page *page = __alloc_pages_noprof(gfp | __GFP_COMP, order,
-					preferred_nid, nodemask, ALLOC_DEFAULT);
+					preferred_nid, nodemask, alloc_flags);
 	return page_rmappable_folio(page);
 }
+
+struct folio *__folio_alloc_noprof(gfp_t gfp, unsigned int order,
+		int preferred_nid, nodemask_t *nodemask)
+{
+	return __folio_alloc_flags_noprof(gfp, order, preferred_nid, nodemask,
+					 ALLOC_DEFAULT);
+}
 EXPORT_SYMBOL(__folio_alloc_noprof);
 
 /*
diff --git a/mm/page_alloc.h b/mm/page_alloc.h
index b9259deddb59..986e733b586e 100644
--- a/mm/page_alloc.h
+++ b/mm/page_alloc.h
@@ -258,6 +258,12 @@ struct page *__alloc_pages_noprof(gfp_t gfp, unsigned int order, int preferred_n
 		nodemask_t *nodemask, unsigned int alloc_flags);
 #define __alloc_pages(...)			alloc_hooks(__alloc_pages_noprof(__VA_ARGS__))
 
+struct folio *__folio_alloc_flags_noprof(gfp_t gfp, unsigned int order,
+		int preferred_nid, nodemask_t *nodemask,
+		unsigned int alloc_flags);
+#define __folio_alloc_flags(...) \
+	alloc_hooks(__folio_alloc_flags_noprof(__VA_ARGS__))
+
 extern void zone_pcp_reset(struct zone *zone);
 extern void zone_pcp_disable(struct zone *zone);
 extern void zone_pcp_enable(struct zone *zone);
-- 
2.55.0

