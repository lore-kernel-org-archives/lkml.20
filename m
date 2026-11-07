Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018603;
	b=J3GkORM95O63CcnNjzbaCklX71VUlJoU5asKrXLYdwhm3o5q8NirU3COOk/dKh4ZEmrJ
	 O6OjXLfUnELlokg+dx7ZQsZDZ7/P+IC/i/rNwdpRgsdugDGQGMLnTohFFLJUgz8zvB8E6
	 zvIxrX582TsF6zOh+RzIFKrHP9Y/ZJYE1H88yfIOFV1KnKCf9dfgKzasNy5LKj6eUgfAC
	 eHH/RD6qVGp7qekw8/oK9e60Tlz6YubCVqmEg9aV6DtDVSHcQLVJTI6tVH+D3Mf2qg1Dq
	 P3z43SUrJxxSwx6Ns8R7MeSLr+aZdMwO6p5yYpXeX5CH+Moex8gMeyFAFkW6TRigo2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cNsmR0WvDvGFxNjwREIYmv5MbBRrNrv89Il3eE4jcuk=;
	b=LnUfNmw+lMMa2Gf8f1fi7SdabJkdvxmz1bBnVc7r9PmPFJto9Es5npcx9IQCmxgEXC1t
	 xY62vtcr30MZTrs6d4yGC/rcUqtHkjBJ46hx4X3rwWUOcNURVnY1vmG+Q9PLW2paMPBJZ
	 MRII2W6JP079zAb5ZEpZ8f0da9VLFwrCmXMqq8sdSYUPQ0wJo2roasQtoD/yvEcQVIPzN
	 nsem/aN6vbSWLNK3nGMjsRHZYZ29s1ON1/dLibRBZhSLTy1v3ohvqPtwcSWKES6FbU7wo
	 dftJSddMaHrsvwm0tfQ+oxj/XHPnd09DMmESCMgpLksac3gihZJVM+RWHtTAjoPkF5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jaJ6mX4a;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F9B606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F9B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jaJ6mX4a
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37000e7234bso1627990eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794018602; x=1794623402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cNsmR0WvDvGFxNjwREIYmv5MbBRrNrv89Il3eE4jcuk=;
        b=jaJ6mX4aWl3tV6sj4xVDBm2DekPOl7w9O+5PxmuvCUq4zWBZzQUhol8BS8Y/qyzvLZ
         osXYrRZkk5G1WK7x9WtGjbaORBMSnesQi+vcoHAuGJfQTrVsDN0HANjnaWBfKU//U4Ww
         r7PtBs/SI7FTaTVoXPrkLokUxjgr/dBK3EEo+uTJ0yX1Rr/jRp2X791qk4FKL2jnX3u+
         nXrbWFSD+IU0LDOMwFTzupc2t1eEtPUmb0a+lsiiSsoKRmiKuQ00/BZxa3QgLNi7IS7E
         4pPadVtLJmPDlCw81WgrYSvjc1sg5tzGfb+GFne8FyEs7W4JSpI4SrOk9xqaLLyIyNcZ
         dcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018602; x=1794623402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cNsmR0WvDvGFxNjwREIYmv5MbBRrNrv89Il3eE4jcuk=;
        b=wKpPRU0v7H0qIFiB3clT7kBLha+uatCNOxNXLbefJ7rp3S3IKub4vbm3+7wgHPSDKi
         z9CxDn/F4HOOKUQiRALx6jw63aXccguzWnVRyIzfcDL1p0hC5voSg3I750EgX5f52F2w
         LilyMMS/MY+kMcwtzNLFuOCMgyHtFjNiEkYsgenVKrYoBIdqTaXbXZl4m1OjCLqFjhbv
         e9b6yLVNzx2QYCYYCnkky/OAeJSryMoFI6Nn5s33CY2+vi1ieJAUL/gujJUMG0F4fFd3
         JicyR2uyDEqawN/OFfVJdIYE7Uv6rU+cwxbLxSHi8ELOQx0hRnIxgAT9sqTp3y9qd6vT
         CEnA==
X-Forwarded-Encrypted: i=1; AL+hErEWpeYukREDAE7F2LZi9mWRVObD9wlfVlnIDphcLZvo++ZQFY4o3HNrW1+ezYd+x0/uMb9+nsKISNjQzDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D07iEP6CGNIyHTFy0tNeGWmBIKENyjCTET1doWRNy8pTadBS3
	hwoNlTXnMSuT2a3JxUmd6awc6ZPrRZAC0j5P36XGbhlocKp3zen+izMAqvfhAWvB9dI=
X-Gm-Gg: AYBFou3oNdzdvpQGTVLzX2S5+8KLJVAU5qzUXiWsLFbJF3ir6pWMvChtbUFwhMxLN2I
	mrrgH/r0yzaE8E3PNYQU9wC8VyUUgDA8Zj6E+Dy6giftXxYb7AVncyp2ApuL/FeHWewcFdTSNFm
	dKinkA/CFZzMVz++kK29xXPvqqSQz6dCoOxuGyk/8GD22JPzUMDillglOz3/+cfgSQ7HklDIkRp
	Nx429sUIn3z89ucLR02LWdrUj6fHMDHPPQt/LxdNIVOJyoHIn8QN3Od7AX2VVmvW5nL39IAks/Y
	+MS6/u6C/hMI7eE6nv/PzphFd4lRbKS6etWnzw4yc8HCQGMkiU/Kadwwa1kkVYhm/gHi69RLt6Q
	JWQDkppBarJ6bHVjZLiBP1GgYpn1GIJ48s9opeb0yvoG69h7CvMuuEWwovaI9bYxZ6L5ijERuDh
	68RLkFDX99cY2ltT+sjfWcwNzoL8AZ92wjjfz4dltLUJlzPFADV4ITI32TqrGOxRbqX79xRbVBb
	KXPMv43YJuMEji6lD+LA5ssY1s4oyfmCtL4HHP6BrjbMrrfUuwTZJIXW88DkUm/6zubeVVZY22u
	YXnrZtL3kvp4N+VubdnTFiSIDBfYJ4u7ulFMM2lNKMlEf/0Klcl9n/07vWw2
X-Received: by 2002:a05:7300:c8c6:b0:36c:b138:651e with SMTP id 5a478bee46e88-36f767156a6mr6292051eec.22.1794018602204;
        Fri, 06 Nov 2026 18:30:02 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm10457077eec.23.2026.11.06.18.29.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 18:30:01 -0800 (PST)
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
Subject: [PATCH v4 09/13] mm: hugetlb_vmemmap: move alloc_vmemmap_page_list() next to its free helper
Date: Sat,  7 Nov 2026 10:27:52 +0800
Message-ID: <20261107022756.77731-10-songmuchun@bytedance.com>
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

Keep alloc_vmemmap_page_list() together with
free_vmemmap_page_list(). This also allows the folio-oriented
optimization helper introduced in a subsequent change to reuse the
allocator without a forward declaration.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
---
v4:
- Carry the caller-selected allocation mask through the helper move
- Collect Reviewed-by from Oscar Salvador
- Collect Tested-by from Andrew Morton

v3:
- Carry the revised allocation cleanup through the helper move (follow-up
  to review by Mike Rapoport)
- Collect Reviewed-by from Mike Rapoport

v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 3968dfe7f5a0..6c248e8fbdde 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -197,6 +197,28 @@ static void free_vmemmap_page_list(struct list_head *list)
 		free_vmemmap_page(page);
 }
 
+static int alloc_vmemmap_page_list(struct list_head *head,
+		unsigned int nr_pages, int nid, gfp_t gfp_mask)
+{
+	struct page *page, *next;
+	LIST_HEAD(new_pages);
+
+	for (unsigned int i = 0; i < nr_pages; i++) {
+		page = alloc_pages_node(nid, gfp_mask | __GFP_RETRY_MAYFAIL, 0);
+		if (!page)
+			goto free_pages;
+		list_add(&page->lru, &new_pages);
+	}
+	list_splice(&new_pages, head);
+	memmap_pages_add(nr_pages);
+
+	return 0;
+free_pages:
+	list_for_each_entry_safe(page, next, &new_pages, lru)
+		__free_page(page);
+	return -ENOMEM;
+}
+
 static struct page *vmemmap_dup_page_from_list(const struct page *src,
 		struct list_head *vmemmap_pages)
 {
@@ -324,28 +346,6 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 	return ret;
 }
 
-static int alloc_vmemmap_page_list(struct list_head *head,
-		unsigned int nr_pages, int nid, gfp_t gfp_mask)
-{
-	struct page *page, *next;
-	LIST_HEAD(new_pages);
-
-	for (unsigned int i = 0; i < nr_pages; i++) {
-		page = alloc_pages_node(nid, gfp_mask | __GFP_RETRY_MAYFAIL, 0);
-		if (!page)
-			goto free_pages;
-		list_add(&page->lru, &new_pages);
-	}
-	list_splice(&new_pages, head);
-	memmap_pages_add(nr_pages);
-
-	return 0;
-free_pages:
-	list_for_each_entry_safe(page, next, &new_pages, lru)
-		__free_page(page);
-	return -ENOMEM;
-}
-
 /**
  * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
  *			 to the page which is from the @vmemmap_pages
-- 
2.54.0

