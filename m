Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C369F3D331D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022053; cv=none; b=Yo+ALkfYTM4hOfZzfM98E2IGcLC37RrTU6d+/pW65wezeMcbkWbWhmH+EF44qc647w64I46hHflC3fQZJL0MkV5xe2L4QiU5GMPZrUS5sB5rxbBB+019WLvrfeSaJ03NhBxiD8dZxdyl7jVa+8azq/TXuTBwAdLaGX2BhtxIhxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022053; c=relaxed/simple;
	bh=Y9vZ+gOhWiHRFF/Y8/hSuUDgngwlFLAbCpMDhndoP8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PO34BtHNU3z6LCGN+Nkgu/xcUZ3tg4A0XyStQbaYanrXcpPTMmZwVlz+KE+Wjh1VGROQ9IPURcVbHlrgAxHCJ7kaBrzdb27leMeRGyZJpspkMuOcqkRxLOe7NQQbw7KEWYKyDh4sNjl6RBlBArxzo6coEpCwvtI/iHVMbD/yrAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=h3w3/fBF; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="h3w3/fBF"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1074372a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022050; x=1789626850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcVbDCPba2ZtcQZxfLWU2CmbcXM9gR7gcXJIOZ63SMc=;
        b=h3w3/fBFJnDeAYNrd63odEzxtKG0+DcCB3USnQz5q4CPA5pnZxFS/XJDcom+Htqjhj
         YvMP/4zvU693l9qp2WxuXYbS0xwHmXWC5oN2gkdXbYo58hXBa3oPL1Wq/162BPIjnaQF
         7KPtGvX2iflmZFJzpEWr00tItXWsQ2zEmfPZjf3fInhJYq/1KyKy7vNW7KIYzROwJ9qE
         tgZbe2i1CdTt1a+/n8FQ0bxqoOBBRpBZjptp2qwV6LV9JXn8IiL6nyDJhfyJ/RFFdhJu
         2uNJLVbWK0oyKdiTUv+UbeSqDAn5v8PRMEZDq8xcER+S4gDFN5XCsoFtk1uV+mw+yGFm
         1Gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022050; x=1789626850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fcVbDCPba2ZtcQZxfLWU2CmbcXM9gR7gcXJIOZ63SMc=;
        b=J3gQLEufeKD8bck8oJ94W5r5uktmu/osHrnIMnSLFAJZxQGOI6sa7yxKxbsSGNeooX
         s+7ReI+OLP4PQcwMj1K3TQ33oV125EY2WjbQ3VUGtSb7av6HaIqXSRXYNdwtfye0Wp6X
         4yUYoT1t8U1LeT+Wcf8506ryoo//VuFXnZQAzi18cUKO6dQQGSeceWxUT0gbrG88yU+1
         cMnSjmRcqfUyYwTF5rZGqszXVsHkCPjI7b4g+o1/U1a8N7duVc6mH2sxWKJWiXLKH095
         8m51RMkV56t+KoyeF6Up3JZDBtVjN9Lr9daPLLzdgDX7DXZKSDF7xJ4E4xsvGCVTDVkF
         YnwA==
X-Forwarded-Encrypted: i=1; AKwUvByhOlHb8gn8mCkrMU8+l+67ytxOLOfVoYEm5xdqBIgmxuFVGClrm5Fv5zEi3Pteu/4Y8B2Sf+/5KUMsE8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l9h15G9RgeON6HV3EJ9a0KPH/AwB2OcurqM8LfvsAwsBQOsVht
	TsWs5+5HZMl3F5QXzlwABOmSuWqbVr4I1CasP4yXZP2/IxoSZ5DNLVZvocn6T+RVppM=
X-Gm-Gg: AYBFou25MCML9mF1TPHKJWWD+bcH4f+YIVbaKPxoP5s1eIevg0RL2nF0csynK0cukbr
	jHBaop2CfHiMWwi8bhKpdGYWUMixtDCgFZ8FnIT5T6bBVWyourujrOh7xTFeqHqg+tZZLCoBdPX
	HTHBIOp2mo1pcrcyeiRtcyWxb1asqXs9Y7nLTG+HOgV+/qMoeiGkhYBBuwnrp9wHfB0WSDvIsik
	pfzcd5L5sk54HMQud7goOMHOgvMyiUte9GqlbCvzlhscBSfK1GL+6EQDT8uRwVrYWOomCfWR+xG
	kGPb53D7dzK2U0sFK4D9RV4PyxWerEBbPO7FKty2ihjjfuTNV+Qa2Omjz/A8qg9UCd8cK3Zc6eR
	OA2kGylb12YYGzOrJGeCc3+/CF+YNtANMuGW+79242Q5/C0hujE7PPJY6A+f/rgQja44lbzjcXw
	rT8nZJh+5AsPf3bPmvA7jNMTmVXPDHPtbWwhRQbcKawXFDhaPhV4G4V0PscHDNPZSWEaV2niUG6
	SOiVPpcgu6wP/THZQOvy96iUVopZF5bzfA=
X-Received: by 2002:a17:90b:4d82:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39d70b1c7demr7779886a91.19.1789022049796;
        Wed, 09 Sep 2026 23:34:09 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.34.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:34:09 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	David Laight <david.laight.linux@gmail.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>
Subject: [PATCH v6 12/17] mm/sparse: inline usemap allocation into sparse_init_nid()
Date: Thu, 10 Sep 2026 14:32:51 +0800
Message-ID: <20260910063256.64386-13-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260910063256.64386-1-songmuchun@bytedance.com>
References: <20260910063256.64386-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removing SPARSEMEM_VMEMMAP_PREINIT, sparse_init_nid() no longer
needs the transient sparse_usagebuf state and its helper wrappers.

Allocate the usemap buffer directly in sparse_init_nid(), pass it to
sparse_init_one_section(), and drop sparse_usage_init(),
sparse_usage_fini(), and sparse_init_early_section().

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v6:
- Collect Acked-by from David Hildenbrand

v2:
- Collect Acked-by from Mike Rapoport
---
 include/linux/mmzone.h |  3 ---
 mm/sparse.c            | 46 +++++++-----------------------------------
 2 files changed, 7 insertions(+), 42 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index f2d39a888eac..6acc14b169bb 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2223,9 +2223,6 @@ static inline bool pfn_section_first_valid(struct mem_section *ms, unsigned long
 }
 #endif
 
-void sparse_init_early_section(int nid, struct page *map, unsigned long pnum,
-			       unsigned long flags);
-
 #ifndef CONFIG_HAVE_ARCH_PFN_VALID
 /**
  * pfn_valid - check if there is a valid memory map entry for a PFN
diff --git a/mm/sparse.c b/mm/sparse.c
index f4f393a033a4..d19c173b40fe 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -234,42 +234,6 @@ void __weak __meminit vmemmap_populate_print_last(void)
 {
 }
 
-static void *sparse_usagebuf __initdata;
-static void *sparse_usagebuf_end __initdata;
-
-/*
- * Helper function that is used for generic section initialization, and
- * can also be used by any hooks added above.
- */
-void __init sparse_init_early_section(int nid, struct page *map,
-				      unsigned long pnum, unsigned long flags)
-{
-	BUG_ON(!sparse_usagebuf || sparse_usagebuf >= sparse_usagebuf_end);
-	sparse_init_one_section(__nr_to_section(pnum), pnum, map,
-			sparse_usagebuf, SECTION_IS_EARLY | flags);
-	sparse_usagebuf = (void *)sparse_usagebuf + mem_section_usage_size();
-}
-
-static int __init sparse_usage_init(int nid, unsigned long map_count)
-{
-	unsigned long size;
-
-	size = mem_section_usage_size() * map_count;
-	sparse_usagebuf = memblock_alloc_node(size, SMP_CACHE_BYTES, nid);
-	if (!sparse_usagebuf) {
-		sparse_usagebuf_end = NULL;
-		return -ENOMEM;
-	}
-
-	sparse_usagebuf_end = sparse_usagebuf + size;
-	return 0;
-}
-
-static void __init sparse_usage_fini(void)
-{
-	sparse_usagebuf = sparse_usagebuf_end = NULL;
-}
-
 /*
  * Initialize sparse on a specific node. The node spans [pnum_begin, pnum_end)
  * And number of present sections in this node is map_count.
@@ -279,8 +243,11 @@ static void __init sparse_init_nid(int nid, unsigned long pnum_begin,
 				   unsigned long map_count)
 {
 	unsigned long pnum;
+	struct mem_section_usage *usage;
 
-	if (sparse_usage_init(nid, map_count))
+	usage = memblock_alloc_node(map_count * mem_section_usage_size(),
+				    SMP_CACHE_BYTES, nid);
+	if (!usage)
 		panic("Failed to allocate usemap for node %d\n", nid);
 
 	for_each_present_section_nr(pnum_begin, pnum) {
@@ -296,9 +263,10 @@ static void __init sparse_init_nid(int nid, unsigned long pnum_begin,
 			panic("Failed to allocate memmap for section %lu\n", pnum);
 		memmap_boot_pages_add(section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION,
 							       NULL, NULL));
-		sparse_init_early_section(nid, map, pnum, 0);
+		sparse_init_one_section(__nr_to_section(pnum), pnum, map, usage,
+					SECTION_IS_EARLY);
+		usage = (void *)usage + mem_section_usage_size();
 	}
-	sparse_usage_fini();
 }
 
 /*
-- 
2.54.0

