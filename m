Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590025;
	b=sqUaBsWu5iQdm4bz0NLKAqxJp4yP7byPQUrceggkEzGsJnzJBFSrHlFEc+cEDVDKf0+m
	 n1k3VLuromQDdslcvcwToFyZV+9j3tc+rCaYcks505Jx/pIeicpai6gGPegqoeFOcm6rk
	 tYTuLbvrcsvNjKo95mWBE83JyLKvYMjGHEETl98engelzhthoREFrRc+dS+G+ODDFhuyI
	 SsRwQVnwVlC1UpWkdeBbOjp32Fu8G7mDoGNwBfqG42SdhbsyK98bCVIfX0HQVHhZWuOlI
	 9atgK1Pna0dZ2UkH72cdoXBConBWIZa2jAULDo1fDlMRlvykdPUDb6Paig1xcdc9QQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wR4QS9sf5aXAy1p2aA62dnVU7cHMfl/lsPn7zq5mVb0=;
	b=QzjZA3/zZFv8Dkh8lp1R2XupAKsiGIUuBjrDEO6PliNh4iZqORZ1FbGAVnxtuRJbSqhD
	 xWQwj8toc8P08jvzog17NssAAqow7fc2oN0HFsk7gaZbmZTn4fKmGzB8RgUjG7VbU3iJI
	 BK8fGjI7E9Er+QgQRnA4ahu9t9vdqLKfB5YVlTjo8XgU+QMs9AXa2hUCSEemExQ04NLkW
	 eulji08ELKnvrs+z33DNclrVD1EQ3qXKxv48gfIbOyqBSR19ohBg1XDpl70mnqvr5j8uw
	 N3zQqWXA12vmCNKSeGWiMuAlQdOwv9ReW+d3n7N6WS+9Qg57ZcPZrxTg1xG803UHhkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Y82JmSD8;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3584C606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3584C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Y82JmSD8
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so1308136a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793590024; x=1794194824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wR4QS9sf5aXAy1p2aA62dnVU7cHMfl/lsPn7zq5mVb0=;
        b=Y82JmSD8lu1b1hhtUT7Fs0vgmlAaem7+Aa8eAeZtI7nWh1bgcNF0BAan9FU17dxjZo
         t/5atjgtg4rEUDEGHMETvpqJ/h4pNrxONs7zkTvoZUKbz7UMjibLgZlaOHUFfcgBPZK9
         cyrs+0koUO/A2PVhqFBeORCstZPKa2Jbo/28A4mfFPP8QklE2g3QVHEsFdBvmptBcY9X
         1gTPcuWwUM831lW4SoTSyOKbXDzPEjrdQWW6wFqjf2V5AU7GwEoX2tstSDEwMIG5gMeG
         OM5SRlagmxCvG1S1uzimoyhJd/hYcHk6WqPObGq5Nv2ev08G6amkighsQ8pxNdeAsepq
         LKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590024; x=1794194824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wR4QS9sf5aXAy1p2aA62dnVU7cHMfl/lsPn7zq5mVb0=;
        b=lWSDWg0LJEx9x5bvdWMcBw/merJzaQctV/ZQHMx3EBkjo0DOXUEJ3ZULsbI9QDmQrK
         FM9H9pdRhdxjS+8/8Vd7qsUNKUCFyKCwcyChsO+mcFnT6QxP9VcqDmu856bnDJUBA5T8
         BWWIchlQZ7eYAr0LTNOk2wI5TBRzlTZPnM3As0yyHt/xCZjxreMALY05SBf8a/xxWgoM
         phBuE3HTztJYzKnjq0Eh21Ogo195/kVlQ1qq16VLsSt53SCYV+4CWhA+NLOQLBeDC/qk
         RRLm0mm9Vf3fdlbpv4T1kqG71auXFbWeV/yMdV7bKsw69BD81D5X8TwAyOZmM7Nbs2xD
         8heQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqE6rC61kDz+LMrw43cZdMZcrlOGUIGuss3K+0TT1R3EPJuuLYIWufid7mhHC3058wLKEhrDdZv6+oieg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sW6G+g2uiwvH+KOCx7cX/2uiUQzafDJXAzwNTA7LzsKjSTNX/
	aXnXx5r46ST2x2NXbnQAtwGcmDWVOjktyYTx8X+BW7jXWy34Zh6w73Z2PDaaXRrbe8Q=
X-Gm-Gg: AYBFou0Hp6QXGI3tCSmdQBry6cwhp0SNfPaDEXm+MxKUg9eHrJs2GnA1JG4HES+U6iD
	uVLg7PrdqcbRDxAGSjsEPBgrLlwqcfsmahyxc4ROJOraFff1HvwuE1bYaU2d/XKRh/N/E94cxZ2
	IjkQ8vbPBDu3Jw7F9yXDkCqqtJKTQONYJZ68nWOqLoHNF4hXFnQEpSI4eHCV6JnKkD6uvSpTKN6
	zFqrzGq3zUw1NQ4earYZEK+IJSC68RHe+mAuCWdpakrAfQXq/u4j/+qais3LBGqthnVgdS46zCH
	sdGXGiAmq/znjCpFxbY75qaLNuIib04fwA6t+h9YYlV6MwleWxDmANpZR5yLYXSYcw1Fb+/s75W
	Av89vQj0Yfw3lmInUwNh4x6Y1vZrHWNDE79LI2i/JTCzp67M/u0OSyBpEy4HOMVlHmE4/aOQtcL
	ytMPwaipGL+QYSk6V9v0qDniQ7sK785fTsP3N0egX/o8/80zWGgsZq3KslpObWtDx4XxAd+KIos
	iEmehLqUYgSvNjyiPIGBFu7sNsG/+6HzTvs7iA13G4HfG50TIGuMXX7q+7tW2pPxCU3vVpujs1a
	7bzaveS3cfaUI2dbEM3gVxKge3ymEdgcs41MjOgwCFGEoRIa0w==
X-Received: by 2002:a17:90b:4ccc:b0:3a8:32f2:f4a5 with SMTP id 98e67ed59e1d1-3ae898385aemr7458530a91.53.1793590024278;
        Sun, 01 Nov 2026 19:27:04 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm12303317a91.10.2026.11.01.19.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:27:03 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 11/12] mm: hugetlb_vmemmap: unify vmemmap range restoration
Date: Mon,  2 Nov 2026 11:25:24 +0800
Message-ID: <20261102032525.3597743-12-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102032525.3597743-1-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
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

Restoring an optimized folio and rolling back a partial optimization
both restore a vmemmap range, but the operation is currently implemented
separately in each path.

Use a single range-restoration path for both cases, making rollback an
explicit bounded form of normal restoration.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 465a907620ab..370e604c8056 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -287,6 +287,18 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 	return 0;
 }
 
+static inline int vmemmap_restore_range(unsigned long start, unsigned long end,
+		struct list_head *vmemmap_pages, unsigned long flags)
+{
+	struct vmemmap_remap_walk walk = {
+		.remap_pte	= vmemmap_restore_pte,
+		.vmemmap_pages	= vmemmap_pages,
+		.flags		= flags,
+	};
+
+	return vmemmap_remap_range(start, end, &walk);
+}
+
 /**
  * vmemmap_remap_split - split the vmemmap virtual address range [@start, @end)
  *                      backing PMDs of the directmap into PTEs
@@ -345,19 +357,7 @@ static int vmemmap_optimize_folio(const struct folio *folio,
 		return ret;
 
 	end = start + walk.nr_walked * PAGE_SIZE;
-
-	/*
-	 * vmemmap_pages contains pages from the previous vmemmap_remap_range()
-	 * call which failed.  These are pages which were removed from
-	 * the vmemmap. They will be restored in the following call.
-	 */
-	walk = (struct vmemmap_remap_walk) {
-		.remap_pte	= vmemmap_restore_pte,
-		.vmemmap_pages	= vmemmap_pages,
-		.flags		= 0,
-	};
-
-	vmemmap_remap_range(start, end, &walk);
+	vmemmap_restore_range(start, end, vmemmap_pages, 0);
 
 	return ret;
 }
@@ -379,17 +379,12 @@ static int vmemmap_restore_folio(const struct folio *folio, unsigned long flags)
 	int nid = folio_nid(folio);
 	unsigned long start = (unsigned long)folio_page(folio, 0);
 	unsigned long end = start + folio_vmemmap_size(folio);
-	struct vmemmap_remap_walk walk = {
-		.remap_pte	= vmemmap_restore_pte,
-		.vmemmap_pages	= &vmemmap_pages,
-		.flags		= flags,
-	};
 
 	start += VMEMMAP_OPTIMIZATION_SIZE;
 	if (alloc_vmemmap_page_list(&vmemmap_pages, (end - start) / PAGE_SIZE, nid))
 		return -ENOMEM;
 
-	return vmemmap_remap_range(start, end, &walk);
+	return vmemmap_restore_range(start, end, &vmemmap_pages, flags);
 }
 
 static bool vmemmap_optimize_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
-- 
2.54.0

