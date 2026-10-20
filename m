Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497549;
	b=0EGwyeFn2gPh1ODa+L84r4ewcpHRT+20uCxUNCR5K/pRBZc2mqbn31x7IQ0Xy/ClvTaf
	 EC22NCpAlpfHz2PKOeu7qB6b2xykHKttec+7VlQ4WBnLLR96lS2sG89N96ACij57z0nrJ
	 8fnaTtX71x3t0wMk+Tff49V8oPnXJBKvMuyz93K8sBWDsOYL7sc6W9pqSHir7ZhlrbqkR
	 JPT+zgqZzlgRVF+eA49uUnJHPU4W2uZtlSM6aAI4kM6ou8oiKIGaHnrHB/6dJTUAwaciG
	 BxmWArtQaZYCQ6PkqtafXibAMDSqREZNaxECWPKTV2RVPvcMe+b79SSaQHVZQJmWIpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MSxyw/b1Z0I2OC6ruxOoDkUE/7o8+/pL3xgR5OEullg=;
	b=zfOqVLNTuhLP/t/VHfoYY4D+qa4f8cAIvL/JDbHGQxMGxdmDt3ArPyyZYf1Q0t+gvwu4
	 Wd4LQZ189QVl6VAQBf8/XZ55346mrgvIiTDUXKbRIYvgklV+MAAwA+DE6oXQRavMxUs08
	 lHMP46q5/NKpgndrHAontgvCbn/Sg+AV7BeJelGbWmjd4axRL5dCbFLZxJLIgX3NFNKJ7
	 IuJQoS7l1LorVI43EIK5VvJZuMSWKudr1rVZ230KG3wQCAS8WgMBL3G4Z/RgDh9Cw+2i0
	 OE3dbaV2qHHqf9UA3zlvSVjUAaC0kLEJBfJGEpHwWAU2nNrj1CGQvrAfO++i/xrXXcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="i8CM/Abr";
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4DD606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C4DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=i8CM/Abr
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso4190a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792497548; x=1793102348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSxyw/b1Z0I2OC6ruxOoDkUE/7o8+/pL3xgR5OEullg=;
        b=i8CM/AbrzmnYRldtDl9iDVtL/RTOOPIXfU+zsohGreXSq9SQMlIz7wHtj6YBbfwZul
         xtf3dZqZU4IU00akFq33+rP7ZLcpNe6we84RZ7SWdR9ZPSrtGglfVNYKu3rGbaU96soV
         iedF2b2WaQf3gxQjBH3C7le4mggTPkL9o78OSoMZvbKSMZD3YYOljBl06DCVFpj4e5fS
         EqUFFn1x/yg6KzBwsON141Ghlk19nk7KeS43iS8tIHhGdV2TAkIWVewSMF3ozd9OzPkG
         Ay+LWpVk7O5M4hGzOTQrknYz6LRe+DYcDjSKZ7DIbnSyh/F8mHmNj5UHlwprCzIlpW2B
         JPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497548; x=1793102348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MSxyw/b1Z0I2OC6ruxOoDkUE/7o8+/pL3xgR5OEullg=;
        b=TBDxAVoZPKe8zsL9R3+Ga9bhPCzr9tWAN8N9896oN69NeNm5cSbV2heDvODCOpi8lb
         +wjYgApVdHpncmXbzM1EKFrkva7P6o93zj3XCgYQCv0uLR/hpw1vrHAiM9OZHyNrLc79
         6sKv9F14QyWv637leP8y6knb62ELEzuIYCTbPLFjiAD4tpwMbctWqZFwDklTya11+LmZ
         JLCYbGgOZ511DwxRa7suFRK+niCwRKaYdnG4s6GQVM2LDodiPiCXdwwLaXysiF26hvVN
         zOy3bop+ny5v7rcIuxAov0KrxNe7+f38hS1+NbyipYjjAFyMt+ECLmTVdmOJonDutVvv
         qXHw==
X-Forwarded-Encrypted: i=1; AKwUvBwNxZxGEWczD//ITMuB6QLHXLfJNcyN/YVODABVs5s/dCvkEOom43aKi32XOVJbFkXb+/qtC7zfwsHErwY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkEGnZ4LE107bKmdT84/sYDQ7Pb+zi7RR3F1Qu2Ph7w4Bh6psA
	HSyqt5JZSOgqiIBrYwGTNXKVrfanUn63PVR5FYQzDSrhZh4qJVoPcJJeAPxyoZSTZQI=
X-Gm-Gg: AYBFou0D5aLUEwqlPv6L8SUqDdmFRoSK1Ftv688FG/YeFoJVA8u8tVfZk/tM40nBEX7
	29SZIoW/vN9pUSq1QeUrGOWPyOsyz54v2iumIw8Sxe/kG9Fv0FAOcQuelAZEKDdEONaxuRqbM6W
	Kjm7Gsuoxwhs/NCnpld+jQK1sQ7+JmwikMNN+bGxuNtWav3YGLAP8KGPKIYucqZcVbS7PA13wTQ
	cnbCpVUZHEo4haECSNQKdNwr0l+9gXhxUbX11mYwZ8EB76zUOkd7OnHcTWaCBgF57SG0MagMFnn
	LuJjulJpstvzute//WvKEOf9cWna+TWJMgEU3gN8kdPELyNrkNfmpkzErqUeYVP7X+foEivN8k0
	NaMQgBviNpxFFjpPYEwXWm9RtV5NGOp25T853psVwMy8JgwpHZ9W7RnkZxADtzZVMVz12q6qkv0
	U1TNPo9hJO7sOa3DgWHpJDOAA745UyeiKPJ8uEFodohHPl6zGjRaVlRB06wl4j8pjfzg5OgPDEU
	Kz6qfez+mdMmu9BekyUkdbKuvVaun/kq3okbX5MzY3HtGVG7aIJcfi5OY7WLeKgEkO5Iw45JL4l
	RnE9wFlH9JYt/bV+p5LZH0I=
X-Received: by 2002:a17:90b:3b46:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3aceebc55e4mr8770103a91.18.1792497547969;
        Tue, 20 Oct 2026 04:59:07 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60274fc1sm3448095a91.0.2026.10.20.04.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:59:07 -0700 (PDT)
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
Subject: [PATCH 11/12] mm: hugetlb_vmemmap: unify vmemmap range restoration
Date: Tue, 20 Oct 2026 19:58:23 +0800
Message-ID: <20261020115824.823278-10-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020115824.823278-1-songmuchun@bytedance.com>
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
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
---
 mm/hugetlb_vmemmap.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 97748a9cefe2..2cfb88dc4fba 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -284,6 +284,18 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
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
@@ -342,19 +354,7 @@ static int vmemmap_optimize_folio(const struct folio *folio,
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
@@ -376,17 +376,12 @@ static int vmemmap_restore_folio(const struct folio *folio, unsigned long flags)
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

