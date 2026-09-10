Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598693D9527
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022061; cv=none; b=Stf3n3jBz5vjZ82RPcrMXuSNfTUjZFTdh00/itA06NJDp33CjA71ZK4iitm7DC1i9QVna0C8XUnPR3w15Zv8wJ3jpxt87318AVzSxXnwrLuu7HFfLUd+u+KDwHQHL42q35eI3G0hphUO98jzqiReVEAFYu98lonJAYOM8q7aj3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022061; c=relaxed/simple;
	bh=EluCtYfIeVaNsl2YnpAaUuO+yO4gKROLtqulYwHTUaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nou69qJgY3GKnvRQ1TDeI7+QPwCM6PLklzu8x1raBgGl++zZMhBhAf138DV7vKqy5zX5WS0gLgqy9NXfazlVOQt3qR8WyW6qj4lPd5Ssib6N4/FzkYQ72CyTboL/p6kkC2FtqDuYvwRlWg35iICqpK5s3xUe4fQU+ZVI+4vFTqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UsICULqe; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UsICULqe"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb750so1848200a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022059; x=1789626859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mPTybuwUCG6mUc8qxpUjNdpd18RIivFekac/tDH8nBI=;
        b=UsICULqe7Q7onUEggBFcIxFgMDnYD3hvqOZMHHXgxoLG5kQCqz8/oi4E6uVrVdjbmI
         2rtGNbs5DRQmpXwYp1nyWvwrM9TR4fPJbQtHzl7yVmWX1vtJF7Ot4cyvDUNZDeRffwpr
         9xLU/78MUJSYHq0iXj6xEk37zyDaOBXJK+ETv+lmuhx9Ed3xVbjZXR3S9KWRPeL8iAPm
         ifdHJD/dBZO3w80XU9xnMkpkEAlzYMvgPQXJFvs875uzsIk2WvbPtH3U4to9CF6+ywMk
         i7Eu2UNpoQ8sCLwqoU3V3mocn/bgy9lwL9nECAEGtOv6f7pvYjthjwXuq1yHgTDWE2gz
         ce9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022059; x=1789626859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mPTybuwUCG6mUc8qxpUjNdpd18RIivFekac/tDH8nBI=;
        b=eAzBWKZuN9dZMfmbfkpSqZQyfoMlV+8FD55tm050v7LF2vt146BMy3MDSNW86BIKwD
         yU2aigBybU7yKzQSNhdfZyGuqXHkDgIOzxuAljMsyX8iREF+kN4awzWbkMSWIHbc2f0c
         KJ0hw5+aV9OCF7ijkHxEmaviW87fAvHdLTy41EGGhNixGhrOygPc9m/IjCHQP8VpJcNE
         M35+L/1Vx3IG8MarJjacwkpOCewcTT0wy4Hj/Dxj9cnoZCgMYVzP1H/Aj4RCk6TRHSdn
         ZkGGNiP+d6C1HKqqAgsLQ7iimBxlfq/bFsllNvR+sfmi/HXiCGG4WknezvM/IXxJLxKN
         mICg==
X-Forwarded-Encrypted: i=1; AKwUvByNnuAPh6Mzh02croAc0ngqI90Z8z5Rgk+va943OIiDYFj1bhN7stFGtCTzI6YZwgA6rQrKsI6yCS/ln6g=@vger.kernel.org
X-Gm-Message-State: AFuF++mT3Fsy7JupYKzX7K2SMajshxVqEDGv53zQg3n2/Ow5OtQoS3mT
	sOb+gUjWs/icnhTU5n0r2fNs0uyOSO7bkz9BsO/PpiOSIZ1p9+YjmaKI0d+FFsV4vFAhu2i4TIe
	tD+8i
X-Gm-Gg: AYBFou3UsV+0+lmOsLK8Hgk9sI5pRq5a9T/1qkbzWtXS7A00q2sbflebnUyCLbpANph
	Czem75utasHi+Ig8LSH3lb8cK+GQBwjt7o9OqQIQiW6oimmfIJw/J+cLMzYKnBBUDWvZC0bLCMp
	ZImmEPy4x9lvUMx39LYIODgAJ28kJboOJ/VR7iqavm/tTLgcw4vtn1PBCnboIOoxB9PMGT5awNc
	W49HdPuod7VeQhqqm9/CmPKxdCcouadXAFvl1jqswdG3/rhVGvtZ6wnZnc8LdNkeMq/tE2NGT8j
	7o9ArqExAicAJg42miHnsV3VZmGUV+qb/3I/38Rn+5QALPVCyKffSAPSpPVIcpbvP9PvbTzrsjh
	DzLthfBrw55hQtCACJNqazcmRKxCUa41JZ6y89Cwr1LIQVXEc0l/FYEU9N+jfA1pKOv2n8jHTFw
	OVg9+9dF+6uHBKRp6VU1sBiy9dXYfoZrRCYDEQPYroVKBMBffjLYuH4W5MckH3e9UDqdeKlFh43
	HBpc8cID10o535MetR+Yen2Q+qKufmxZto3LAmkf6snew==
X-Received: by 2002:a17:90b:1d45:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-39bac1d89b4mr15210275a91.9.1789022058554;
        Wed, 09 Sep 2026 23:34:18 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.34.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:34:18 -0700 (PDT)
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
Subject: [PATCH v6 14/17] mm/hugetlb: remove HUGE_BOOTMEM_HVO
Date: Thu, 10 Sep 2026 14:32:53 +0800
Message-ID: <20260910063256.64386-15-songmuchun@bytedance.com>
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

The HUGE_BOOTMEM_HVO flag tracked whether a bootmem huge page had
already gone through the old early vmemmap optimization path.

Now that HugeTLB uses section-based vmemmap optimization, that state is
already reflected in the compound page order stored in section metadata.

Remove HUGE_BOOTMEM_HVO and its helper, and use the section state
directly when deciding whether to mark a folio as vmemmap-optimized.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v6:
- Use the compound page order helper names
  (suggested by David Hildenbrand)
- Collect Acked-by from Qi Zheng

v3:
- Use the order-based helper for the bootmem vmemmap-optimized check

v2:
- Collect Acked-by from Mike Rapoport
---
 include/linux/hugetlb.h |  5 ++---
 mm/hugetlb.c            | 16 +++-------------
 mm/hugetlb_vmemmap.c    |  2 --
 3 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index fe28f98e1b22..3559041a5a57 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -675,9 +675,8 @@ struct hstate {
 	char name[HSTATE_NAME_LEN];
 };
 
-#define HUGE_BOOTMEM_HVO		0x0001
-#define HUGE_BOOTMEM_ZONES_VALID	0x0002
-#define HUGE_BOOTMEM_CMA		0x0004
+#define HUGE_BOOTMEM_ZONES_VALID	BIT(0)
+#define HUGE_BOOTMEM_CMA		BIT(1)
 
 int isolate_or_dissolve_huge_folio(struct folio *folio, struct list_head *list);
 int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn);
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ee5567fcdbe9..fbc2ecafef9e 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3220,11 +3220,6 @@ static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
 	prep_compound_head(&folio->page, huge_page_order(h));
 }
 
-static bool __init hugetlb_bootmem_page_prehvo(struct huge_bootmem_page *m)
-{
-	return m->flags & HUGE_BOOTMEM_HVO;
-}
-
 static bool __init hugetlb_bootmem_page_earlycma(struct huge_bootmem_page *m)
 {
 	return m->flags & HUGE_BOOTMEM_CMA;
@@ -3299,6 +3294,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 	list_for_each_entry_safe(m, tm, &huge_boot_pages[nid], list) {
 		struct page *page = virt_to_page(m);
 		struct folio *folio = (void *)page;
+		const unsigned long pfn = folio_pfn(folio);
 
 		h = m->hstate;
 		/*
@@ -3316,15 +3312,9 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 					   HUGETLB_VMEMMAP_RESERVE_PAGES);
 		init_new_hugetlb_folio(folio);
 
-		if (hugetlb_bootmem_page_prehvo(m))
-			/*
-			 * If pre-HVO was done, just set the
-			 * flag, the HVO code will then skip
-			 * this folio.
-			 */
+		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
 			folio_set_hugetlb_vmemmap_optimized(folio);
-		section_set_compound_order_range(folio_pfn(folio),
-						 folio_nr_pages(folio), 0);
+		section_set_compound_order_range(pfn, folio_nr_pages(folio), 0);
 
 		if (hugetlb_bootmem_page_earlycma(m))
 			folio_set_hugetlb_cma(folio);
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index d1b031dcd177..fba0c5a7d46f 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -715,8 +715,6 @@ void __init hugetlb_vmemmap_optimize_bootmem_page(struct huge_bootmem_page *m)
 
 	section_set_compound_order_range(pfn, pages_per_huge_page(h),
 					 huge_page_order(h));
-	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-		m->flags |= HUGE_BOOTMEM_HVO;
 }
 
 static const struct ctl_table hugetlb_vmemmap_sysctls[] = {
-- 
2.54.0

