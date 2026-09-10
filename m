Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE083B4E9F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022021; cv=none; b=BRQH5/yvR0tDN3j9c4J8nh8auNMXkv0CNsEr28WmHoBLpzfiRZduV2ZpxRU1S0/uOHRRPhjzoG6FfBvcfZIXnukjHH1258zf7pj6flqYfGORzAeEqNMiKRv2gr/yx232R6OmbxpHdK3FDARW+jy32rk48fKcgTMfxNhN1A7Q4zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022021; c=relaxed/simple;
	bh=r3eTsuegrmSjsVbobf7YQYE9D/MuS2nV0nnJ9e4pThQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crWa96tEWeeps7l3rn8T6nynYfmtazcawlV3uAqXAKDVSNDSCVJmVtr+JrVDAhkjhZk6HwaE2DQBURNtNb8Bri/RHYgFdtXKqCS3Jx7xSM5OI/30hiFOT8rQdDWrgx4LF8uMgLadINETyfVZW6XwC1qTBhc7wcHeZ+W7vegXIq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=gRPilKV/; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="gRPilKV/"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39675172593so5694540a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022017; x=1789626817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnePsJhsQF7eMOx8C/uEqh/ex5Od6EnmeZ+DbGqwr5U=;
        b=gRPilKV/EsVz6/f9c6vUvzF/hTBGHurk8rUwMiUSNKRcixmulnqQ/CrT1eA3rNOwh6
         8FvR49Z8f0tgLpvmsJQkYRxP/pUxv6HQo9WzPe62x3hlAmZPDtChQ5Uu0AoIir7eTAB1
         Fm9S4AJzPbC9NbbXmj6zQXu71K6U9HUVuOdrTfHUhTA2DFyf+yhj+/HeBVU1zOU8K4LY
         HC5OG2GcYufOxwz0f4gY/9FYWYp+SS8wTriv6+KKQQYw03+Bge7UgAeM0ByGs/iotfkU
         G6grG46LLraRzDP0jZ4U57Rpx4e7hFB6IzosnXakj77HeCO/Q/T5rIlzBXzG0l6WRjNk
         7Hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022017; x=1789626817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EnePsJhsQF7eMOx8C/uEqh/ex5Od6EnmeZ+DbGqwr5U=;
        b=V35XCpu5J05WYD5g2/SHzfu4PqgoTRn7eZt9OX3CleFXG4546agHF3pHH1SM1zvapD
         CPDI4b9nUAxY2kC7GtFVHEh8zfXvaulLnFi17aULRQj41O+7Ea2e37dn4GNp3s9Voaf0
         OYRRPx30qDD1fnI1BjIjtcJGM+8jMrf5LlF2RG/xgvWuuyg1HfDn9tqny3SseVyte+jY
         ZtAvNrRA8EFXOMKYu/MPFvZNYSoshVjI0fYRvHZrq5f0i9MJ/ECz4iZ6QJ4ouCXMjA0j
         URs+1xhViRDsYuIGx72QHpdLe/BHclu5J00yxB2dut0GDmHuXhtrbTBmeALBUb+WdN9m
         PriQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+dbZAFe+DGCc3Xx8MQpmF2+J8pqP++9B2Yofczq/Vvi6pU+10VBIvDoI4AK1eHGe7PeE0uvhIomSPQZA=@vger.kernel.org
X-Gm-Message-State: AFuF++lDeloRo2RAWo2ulN1Ed3jLP+ZreomNiAMXlJCDizYLaH0H5TZJ
	hNn+eLqp+/3gYqT4nFUPRCovJS6AvCHJlvn2St5Okkk898y+IBft1xl9UiK3uRxhz1g=
X-Gm-Gg: AYBFou0DKwJZiTzQTpM/+Vg3iwXfFg6s5z8LqFve7P2rqz7Tb1QScdJGAZ+plyIWd4r
	ykl1077NuBt5/UYsWFJqrpT6JvGNrelFQFmMrbc/ApO1YtECmow7z2GI3TIOEgkrjLP3GrXL+Mu
	3UZRui9BfeDyWi9NeIM06mbc/qX2+cKMS/2Sv7emfF0f6uZugs+xgkxncz+DsqfkzjWvnEk/P/S
	1K13+biVLUv/n8yxsL5fyPWcPB8bfSFQDJt/CEM46IUfUixMoR3CAJu3L9Yw9q49eFGr5WGupA/
	4dhGXsTVZ7U+LqVHEK8SLnZ3SomMjKC6HxFwpwr7TdczOmjSVGegCyzIeS1T9pXIp62f9sfHVaQ
	PmX/tk8ATlzbtRy9qqXD9/uAz8S7DmrSvkObdUfjnEra2aJN41UnoSSXaWDfk3krELJTbzXarY1
	XVCFcsog6L8iQjrrwLi/6GIYfa/beF1jGmcli2+Rv7S0emsKs5/CH2XH7JuS1CHg1Hb1oHan4mQ
	YP2DHt7rdTq9VYDk2Dyq/M6ETsiyPrI9jA=
X-Received: by 2002:a17:90b:50cc:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-39b26202ebamr61814255a91.14.1789022016692;
        Wed, 09 Sep 2026 23:33:36 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.33.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:33:36 -0700 (PDT)
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
Subject: [PATCH v6 04/17] mm/sparse-vmemmap: initialize shared tail vmemmap pages on allocation
Date: Thu, 10 Sep 2026 14:32:43 +0800
Message-ID: <20260910063256.64386-5-songmuchun@bytedance.com>
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

The shared tail vmemmap page allocated in vmemmap_get_tail() used to be
left uninitialized, because memmap_init_range() would later overwrite
it.  That forced users such as HugeTLB to defer the initialization to
their own setup paths.

Now that memmap_init_range() skips shared tail vmemmap pages, initialize
them immediately in vmemmap_get_tail() with init_compound_tail()
instead.

This adds initialization at the point where the shared tail page is
allocated. The existing HugeTLB initialization remains necessary until
the compound page order is set and memmap_init_range() starts skipping
shared tails. It is removed when HugeTLB switches to the section-based
mechanism.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v6:
- Clarify the timing of shared tail page initialization removal
  (suggested by David Hildenbrand)
- Collect Acked-by from Mike Rapoport and Qi Zheng
---
 mm/sparse-vmemmap.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index aa6a4a2fae98..107215cf8488 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -338,19 +338,11 @@ static __meminit struct page *vmemmap_get_tail(unsigned int order, struct zone *
 	tail = zone->vmemmap_tails[idx];
 	if (tail)
 		return tail;
-
-	/*
-	 * Only allocate the page, but do not initialize it.
-	 *
-	 * Any initialization done here will be overwritten by memmap_init().
-	 *
-	 * hugetlb_bootmem_struct_page_init() will take care of initialization
-	 * after memmap_init().
-	 */
-
 	p = vmemmap_alloc_block_zero(PAGE_SIZE, node);
 	if (!p)
 		return NULL;
+	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++)
+		init_compound_tail(p + i, NULL, order, zone);
 
 	tail = virt_to_page(p);
 	zone->vmemmap_tails[idx] = tail;
-- 
2.54.0

