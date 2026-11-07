Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018575;
	b=w8E+bDuq88dZOzYgJJvx+2dJjyFZ/D+Jtzk40OuOX2w20gqVraA34JKPfR2xEdafmi6S
	 3Z37iiZsi6ZT+cKiE7L6UrczwlpfoloieyxH9fPyEQeXiztkeN6gnnvbqvRmwsxoIaDjK
	 5fTBs61a6wLsJJDw4S5ljEEVPYYd2HmPA1ty91w8bHh7P1Yw0E4o9qu2Q5FWkpLMv8t6U
	 YElGXwqog3U0nbwqid4qoa/vxsE9DLa/EOGpVYy+LL4eYQE3EDIoAwrJWTnK1MIB+AJYN
	 dVOLYuShH2LqRgy8sVjyHNrMuTaFpFtyeOt60CdI60rF1+HvF28AQqdTJmaez+UZTzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D84DQ1ZFsGbaB0tFJcBVbDhJujxa9iUHJke70Js0NP4=;
	b=SNJ/1rvgFN9IBwKJRe/FvcOsBTQWtB6rjfM44cSWbGJzeUS6DJN4darf1b6hWL82fbFm
	 ysEibivqLTMkk5vNsG0GIN1t9z5Q6yOPOAZe0QQR7IH+vADT0x5O+F5rO9uGdIl6fFsWy
	 4UmcrGmgtlpPd9h3wQQF8ZFX6EZRpndJbWB3SGufCmu6piv2vx6xcranfmmLObGZChBmy
	 TO7UI65aohYk9Gb56X81iJlYw1nxgMA9+xmPYfhptiruVtSm7HgJ2Gy5hSKqz5mkIRmho
	 mgeQsUbGYazL7eoV5f/bUClNYF98PryNH2iy0a04jowacJBd7OpMSY6MyJvQ9SgAlnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=FpsvZDCn;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36075606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36075606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=FpsvZDCn
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso1898826eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794018574; x=1794623374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D84DQ1ZFsGbaB0tFJcBVbDhJujxa9iUHJke70Js0NP4=;
        b=FpsvZDCnpwLxPlKbMtjb0pFmWN9ueeO9pzSM1o3gCEqAXa+dW8PKAeHLnDyUknPYVF
         pwG9CBCbI3svJzeIPxaEGy3TKRu7ABoWWg+aA6z4RiIFnpwsVItBNmC8i6jp/fP3/YUL
         u5y53wetyivT6NyOhbmLrmPaWPTQJv0D1yHa5MUXhp3Iv1tOobwplXR+lspPfpALAnK8
         /GYmCrtBLHLEyw0lZ91S/NfSmhs9CyzbXVl4AE5RFZiaddTbJLMhkXmlJDzqJxm0rHzm
         PgNyFoWHbtis/Tdv+jysQSceaKZwwZ/FDCO/ZAxYaPhLhdd0fxB5Dpis2HppWpQ6oiqW
         Dayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018574; x=1794623374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D84DQ1ZFsGbaB0tFJcBVbDhJujxa9iUHJke70Js0NP4=;
        b=lCDvU0IVHC3hB5YK4C7q05hTaAMj0X50hRJbzGku4NHf0gaJyQwol9FWLBXsX2GT2n
         BlNK1Y9aihBhk1zK0I3LLOFNnOk+WftXtRjEPMaL2FQs8k/4T+iTQQmW+AeX96PogY8+
         q6Y/2C5xFv+CVj11o5rIrSojguaNo7+0Yzw2PFRKD1T1t3hunvzt6zyEzkoJib4+OsY9
         TEDo7eM6/4ndXgJtjkAK9I1/hPvEpFwIgNULHeCsvtsYVGDL23ijBjYA7dx+JuB5sZGU
         BuNSiqjDdppKIvgVIgLQQSeC2vGpGvmKCx0fptaN3MGu5UEMWPFF6i19y6P73vt+KKx1
         x6PA==
X-Forwarded-Encrypted: i=1; AL+hErH4rC9hpqD3REeQWH/GZqG8Hp4DS6OMD03jTsM1DFjDHXnj8P88SWF4HR+Hz5gsdSjFTXqT9LmVi8H3GvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+30bJDFhapoein7Vo0Bm8+mvM9wnO1G9l/gNKf0ECNKFrC8ISb
	MEty41JAoV1h7H9y5e71Snj+DTd+CxBoexjcnR6xvToGm6oaiZbCMVPVKpiqrcwUaVU=
X-Gm-Gg: AYBFou3wy6wX9HdnkCc9nLz+lHeN2Zrh/rjZ8slVpYyrVUiZYfhHuDroqX2LirVVPwH
	VU+YuEl+f35wK5FAAHDOHMFt/tEKZb/SMr48rfFF5mv5/NZLNPt+IiWnjkVkpV8tBTDpuzEnMzw
	nx5Um/G3njQf2t6Oxavvl4v3tcy6uV9e6UnXjhyu0wMhuGHSLFEoOF8L8/CFtEtPj7UCv0t5o01
	N583t4Jfd6d8R5rePLlWhVjh4OFVpjMBR6SmNsF7cp1y5uiwiC9hIdQ0i1WTJLoUqyXJsqSTkFQ
	T14YbL6Ml+u0rsb+BSSTunsfJTOBS3MlZrFhYk/PeW5mxIB6GJr1EUYJs5dlNRSKcII5k7mhiGQ
	I19fAOYK8A4ijZu+unaSFsMM/hhpiefk55IDiCsluzSpJMer0wiplFlCnD7TFKptZIduAdt0i08
	m95wUANb2IVCmZjipHeJjM9n7oaJr/wqD177GEMLqudXSBOoi8FOT78EqEJZNzINZR46ra2Nhlw
	G25pPb7JzdTbJQgQz11Tc/FT9PSvIVSiKS0wB3d8KkMpz5Btpw3KqhvzEsp+Nd4eG3muc5/Pfl2
	qN6xGyXbbCwA08EDMtm7IxgAPyN/nrZDAoyEzVq2137d2I5XykGalFhb3/j4
X-Received: by 2002:a05:7301:c88:b0:36e:1fbe:357a with SMTP id 5a478bee46e88-36f75443c1cmr5569721eec.13.1794018574075;
        Fri, 06 Nov 2026 18:29:34 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm10457077eec.23.2026.11.06.18.29.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 18:29:33 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Yili Zhang <zhangyili01@baidu.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 04/13] mm: hugetlb_vmemmap: simplify vmemmap head page handling
Date: Sat,  7 Nov 2026 10:27:47 +0800
Message-ID: <20261107022756.77731-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107022756.77731-1-songmuchun@bytedance.com>
References: <20261107022756.77731-1-songmuchun@bytedance.com>
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

The new head page is already tracked on the vmemmap page list before
remapping starts.  Passing it separately gives the remap walker two
ways to refer to the same page and unnecessarily complicates its
interface.

Use the page list as the single handoff mechanism for the head page,
removing the redundant state from the walker.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
---
v4:
- Collect Reviewed-by from Oscar Salvador
- Collect Tested-by from Andrew Morton

v3:
- Collect Reviewed-by from Mike Rapoport

v2:
- Remove outdated head-page wording from vmemmap_remap_free() kernel-doc
  (suggested by Lance Yang)
- Document the vmemmap page list contract (suggested by Qi Zheng)
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index c436db31c6c5..beb420c57ddc 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -25,10 +25,9 @@
  *
  * @remap_pte:		called for each lowest-level entry (PTE).
  * @nr_walked:		the number of walked pte.
- * @vmemmap_head:	the page to be installed as first in the vmemmap range
  * @vmemmap_tail:	the page to be installed as non-first in the vmemmap range
- * @vmemmap_pages:	the list head of the vmemmap pages that can be freed
- *			or is mapped from.
+ * @vmemmap_pages:	list supplying replacement pages for the remap and
+ *			receiving displaced backing pages for the caller to free.
  * @flags:		used to modify behavior in vmemmap page table walking
  *			operations.
  */
@@ -37,7 +36,6 @@ struct vmemmap_remap_walk {
 					     struct vmemmap_remap_walk *walk);
 
 	unsigned long		nr_walked;
-	struct page		*vmemmap_head;
 	struct page		*vmemmap_tail;
 	struct list_head	*vmemmap_pages;
 
@@ -208,10 +206,13 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 	pte_t entry;
 
 	/* Remapping the head page requires r/w */
-	if (unlikely(walk->nr_walked == 0 && walk->vmemmap_head)) {
+	if (unlikely(walk->nr_walked == 0)) {
+		struct page *head;
+
 		VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
 
-		list_del(&walk->vmemmap_head->lru);
+		head = list_first_entry(walk->vmemmap_pages, struct page, lru);
+		list_del(&head->lru);
 
 		/*
 		 * Makes sure that preceding stores to the page contents from
@@ -220,7 +221,7 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 		 */
 		smp_wmb();
 
-		entry = mk_pte(walk->vmemmap_head, PAGE_KERNEL);
+		entry = mk_pte(head, PAGE_KERNEL);
 	} else {
 		VM_WARN_ON_ONCE(!PageTail((const struct page *)addr));
 
@@ -284,23 +285,20 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
 }
 
 /**
- * vmemmap_remap_free - remap the vmemmap virtual address range [@start, @end)
- *			to use @vmemmap_head/tail, then free vmemmap which
- *			the range are mapped to.
+ * vmemmap_remap_free - remap a vmemmap range and collect old backing pages
  * @start:	start address of the vmemmap virtual address range that we want
  *		to remap.
  * @end:	end address of the vmemmap virtual address range that we want to
  *		remap.
- * @vmemmap_head: the page to be installed as first in the vmemmap range
  * @vmemmap_tail: the page to be installed as non-first in the vmemmap range
- * @vmemmap_pages: list to deposit vmemmap pages to be freed.  It is callers
- *		responsibility to free pages.
+ * @vmemmap_pages: input/output list whose first entry supplies the new backing
+ *		page for @start; replaced backing pages are added to the list for
+ *		the caller to free.
  * @flags:	modifications to vmemmap_remap_walk flags
  *
  * Return: %0 on success, negative error code otherwise.
  */
 static int vmemmap_remap_free(unsigned long start, unsigned long end,
-			      struct page *vmemmap_head,
 			      struct page *vmemmap_tail,
 			      struct list_head *vmemmap_pages,
 			      unsigned long flags)
@@ -308,7 +306,6 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 	int ret;
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= vmemmap_remap_pte,
-		.vmemmap_head	= vmemmap_head,
 		.vmemmap_tail	= vmemmap_tail,
 		.vmemmap_pages	= vmemmap_pages,
 		.flags		= flags,
@@ -550,8 +547,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 * they can be freed by the caller.
 	 */
 	ret = vmemmap_remap_free(vmemmap_start, vmemmap_end,
-				 vmemmap_head, vmemmap_tail,
-				 vmemmap_pages, flags);
+				 vmemmap_tail, vmemmap_pages, flags);
 out:
 	if (ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
-- 
2.54.0

