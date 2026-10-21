Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562729;
	b=ZARbhPH9Fz00UouUJaIVVHNeOsPGX79B56ZmWKaiaT/AD5KZsDwmXLnUo43QyYBOJGD4
	 TMI81+bE9RVE+EUta3JnOaCmmNZv/q2AVGPvtqLGlHcWBwl66JES4GdhSq5NdrsjkHjcG
	 C53XpuIXp3T2SYtrrCm+LN8rwoEQGJJEYHomXI3FgapTcGBXmwIuVSc82eAuiCsuuzXC9
	 qO+7wy6JEpBfV48/a0YkqSkkM62d9o9W/1imhwQPuJoOQbpzvGiWdd0CVIxUGk8mK/Pbc
	 SmH3dqaSsO/uZBW3+OimTYqTmTYt9d8hkKKvAlGuYUDnY6AG3CpVOxZEVmZxr0Yjo1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562729;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XHN2LiOQU7r0d0fe1KkDFs3khSrbeSD24b1q7hC8HmQ=;
	b=Os8Wa1ojKnSs2GTd+EnCypz+1N+KJ4KNJJIlsomVp/lfB0Vrg5youlhzvMGEehA/Wfi7
	 pzq+n4P89i+Kz0jDb/3E0aUPqx5wcLTshLtTpdjuc1m+mNVYqq9tyb6HV+Fh+so2DEazE
	 ZMSwAlGmHS4/j7zfzR5bRZKWqegq+34RhhkBKLI842u4simiMOCnsLnLj/hmqMv852JeB
	 mmB7c7iZ0FlLX/UqcDov97kZDtKngfcrcFz6Ubnhh6nVqqO+NrKrqNHUzyBaq/rHd3UG1
	 qXsKkQ9FQVH4gTimysx3EEja3MMNOrv8AU2gi5REN196BeV6rm9DnzZVLoEdGaQBmHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WaAKpuBX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="G9Ch1CD/";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E36606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5E36606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WaAKpuBX;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=G9Ch1CD/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHN2LiOQU7r0d0fe1KkDFs3khSrbeSD24b1q7hC8HmQ=;
	b=WaAKpuBX+DP1ZT2ZqTjxKRAh+ZXwlur3MGTpKzHO5exrIESfcVj4XRRgecxMSFVoyD+uc4
	aHBmsHzgNa6DS1UDHJ/sRtQc0DzkoDtnqxpZ8Ez0+sh1qZv78iqK+h49zROC3dK+FzgWXe
	YctrRpQ+vS697zJs/b6FECj/WrDabWY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-tg3EI903O66ipz1bHQ1BCg-1; Wed, 21 Oct 2026 06:05:26 +0000
X-MC-Unique: tg3EI903O66ipz1bHQ1BCg-1
X-Mimecast-MFC-AGG-ID: tg3EI903O66ipz1bHQ1BCg_1792562725
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1de9dac94so3177635e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792562725; x=1793167525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XHN2LiOQU7r0d0fe1KkDFs3khSrbeSD24b1q7hC8HmQ=;
        b=G9Ch1CD/FYjjKAiO0XX0iiuQc/cBBrkZ8je8TNDE8HI3oRPj4TgVKgIKB5CT/OfmHX
         /9JIJAGelR7tNDI/A4Da0yptFT764Ax3BI6odj3UN3cAjZZi9frioMMljHnWs2B88GKK
         W332W3VfcuicioMiMKqw9pDNIrBPtmOy3aHUn9AHI+uE8Al9Q/ITg47fC2wPYYTRjpVG
         fCnG3pEYKtpJYtsa1GQz5IpvoNEaxoVMZ8QyiNAPvmZurk9BALgLeplOF1H2BShkCTeH
         x0P8IDZIF3HLl/epAaaUjwQh5FGUYJ7bOQwq8cSHL95pEXPF1WLnqsuRCBxfPJYvEw61
         tbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562725; x=1793167525;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHN2LiOQU7r0d0fe1KkDFs3khSrbeSD24b1q7hC8HmQ=;
        b=D5qz1b6X5xoIEGXDAhr8EEeOrnaSe9Rh+Fa7M/KhTrsleAuuKbddnAv7HakSBTxj1p
         6FtJybT0ypidY6HnoiT+nI3SDwCUruB8lajuJFJLq6bL+yTEces9zbeVufYtJBf56JuZ
         t8k7PYH0kloKfDK/bfvc0VIy1EJOlon6OV2/ayDimXaq81lN6ONDsooX3zYktDxJRg/X
         bphDIM1C6ZKaAsB4DFwbBfOcIecw++FCJFI2GIF8SupN50CBmID3b5kvutygf6Wi92/H
         8mMvlYRxvEzt3q0PqhTIaiDwZreKPeFeybZbwqWbDqfFB2/kqSDmrkEg1GBI3yNR+sG6
         SsJA==
X-Forwarded-Encrypted: i=1; AKwUvBwRdbiO4kzEYiYuAT2oZkn6FdrPbtkmpZqWEl0nBmDvY4vDQSDpyjehFzJvmHSCeSiUxG1buVhMECTXSmU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaDn6F/qCTd4b3MsvTZZ4VU8IaP+RccJidtiAmXcAXDUdYPN7Y
	DcecxKcqikMZ5l4yMHVAMaIoF4iLX0h+w6G/ScslLes6NzkNGJuOTdYPp4kTHa9pUDaN++6Ehei
	wXM1jgr/2JoH7y4QlwoWN2wUIvfmbPjGg00q6PEq4ehA0Ypg7Zo0IUPqDkFHGRUkf
X-Gm-Gg: AYBFou0rvw5VMjNYNVHofLZ5qtMQ/E2ntaucVlHYGX4awpUZ/hIvtYg0xu2xox+ga9H
	ODWS81IWyJeYdGjjUfGvWzkgMfGOIITTvNwd4F9tMULWEHp6ePmTMMk9qOxpj5FCfO2DaMT8kbN
	gMEecAGNX4zJd2e+SjuSvklyF3spauNqwraGQr4wX3RuzQddo8EL8qVivkupLUBHYz9TL1d0cp1
	4lK/+xF7Vmj9juw6CnSgt2E20XCZxWIHcCm4JFUTjuTfanKDBfQjmTDbuwkZ6ghuz/ubL/lMwgu
	nxuK/ZUZMC5ThcQzms60vwgpQMK3wNVE3nqxFXl5Kh1nhft0tYP8ZL2s4j4JPmYjFwbGJPzvrUo
	V46BVMWNpGYsIJuC2d6k/wD+HJ9hF38JxyYfS
X-Received: by 2002:a05:600c:a40f:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4a1fdd32796mr13913125e9.29.1792562724888;
        Tue, 20 Oct 2026 23:05:24 -0700 (PDT)
X-Received: by 2002:a05:600c:a40f:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4a1fdd32796mr13912565e9.29.1792562724382;
        Tue, 20 Oct 2026 23:05:24 -0700 (PDT)
Received: from fedora.redhat.corp (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f02f1sm3413741f8f.3.2026.10.20.23.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:05:23 -0700 (PDT)
From: mpenttil@redhat.com
To: linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v16 02/12] mm: add helper to convert HMM pfn to migrate pfn
Date: Wed, 21 Oct 2026 09:04:56 +0300
Message-ID: <20261021060506.2377545-3-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021060506.2377545-1-mpenttil@redhat.com>
References: <20261021060506.2377545-1-mpenttil@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mika Penttilä <mpenttil@redhat.com>

The unified HMM/migrate_device pagewalk does the "collecting"
on the HMM side, so we need a helper to transfer pfns to the
migrate_vma world.

Cc: David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
---
 include/linux/hmm.h     | 29 +++++++++++++++++-----
 include/linux/migrate.h |  3 ++-
 mm/migrate_device.c     | 55 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 7 deletions(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 6f04e3932f5b..4f56f3419cb4 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -13,6 +13,8 @@
 
 struct mmu_interval_notifier;
 
+struct migrate_vma;
+
 /*
  * On output:
  * 0             - The page is faultable and a future call with 
@@ -27,13 +29,22 @@ struct mmu_interval_notifier;
  * HMM_PFN_P2PDMA_BUS - Bus mapped P2P transfer
  * HMM_PFN_DMA_MAPPED - Flag preserved on input-to-output transformation
  *                      to mark that page is already DMA mapped
+ * HMM_PFN_MIGRATE    - The entry is to be migrated. Note, HMM_PFN_MIGRATE
+ *                      alone without HMM_PFN_VALID denotes the
+ *                      empty page.
+ *                      This flag optionally together with HMM_PFN_COMPOUND
+ *                      are indicators for migrate_hmm_range_setup() to
+ *                      setup the migrate pfns.
+ * HMM_PFN_COMPOUND   - The entry represents a > 0 order page
  *
  * On input:
- * 0                 - Return the current state of the page, do not fault it.
- * HMM_PFN_REQ_FAULT - The output must have HMM_PFN_VALID or hmm_range_fault()
- *                     will fail
- * HMM_PFN_REQ_WRITE - The output must have HMM_PFN_WRITE or hmm_range_fault()
- *                     will fail. Must be combined with HMM_PFN_REQ_FAULT.
+ * 0                   - Return the current state of the page, do not fault it.
+ * HMM_PFN_REQ_FAULT   - The output must have HMM_PFN_VALID or hmm_range_fault()
+ *                       will fail
+ * HMM_PFN_REQ_WRITE   - The output must have HMM_PFN_WRITE or hmm_range_fault()
+ *                       will fail. Must be combined with HMM_PFN_REQ_FAULT.
+ * HMM_PFN_REQ_MIGRATE - For default_flags only, request to migrate the range,
+ *                       according to hmm_range.migrate.flags
  */
 enum hmm_pfn_flags {
 	/* Output fields and flags */
@@ -48,11 +59,15 @@ enum hmm_pfn_flags {
 	HMM_PFN_P2PDMA     = 1UL << (BITS_PER_LONG - 5),
 	HMM_PFN_P2PDMA_BUS = 1UL << (BITS_PER_LONG - 6),
 
-	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 11),
+	/* Migrate request */
+	HMM_PFN_MIGRATE    = 1UL << (BITS_PER_LONG - 7),
+	HMM_PFN_COMPOUND   = 1UL << (BITS_PER_LONG - 8),
+	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 13),
 
 	/* Input flags */
 	HMM_PFN_REQ_FAULT = HMM_PFN_VALID,
 	HMM_PFN_REQ_WRITE = HMM_PFN_WRITE,
+	HMM_PFN_REQ_MIGRATE = HMM_PFN_MIGRATE,
 
 	HMM_PFN_FLAGS = ~((1UL << HMM_PFN_ORDER_SHIFT) - 1),
 };
@@ -107,6 +122,7 @@ static inline unsigned int hmm_pfn_to_map_order(unsigned long hmm_pfn)
  * @default_flags: default flags for the range (write, read, ... see hmm doc)
  * @pfn_flags_mask: allows to mask pfn flags so that only default_flags matter
  * @dev_private_owner: owner of device private pages
+ * @migrate: structure for migrating a range of a VMA
  */
 struct hmm_range {
 	struct mmu_interval_notifier *notifier;
@@ -117,6 +133,7 @@ struct hmm_range {
 	unsigned long		default_flags;
 	unsigned long		pfn_flags_mask;
 	void			*dev_private_owner;
+	struct migrate_vma      *migrate;
 };
 
 /*
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 78424b3824c2..280ec9a866c7 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -3,6 +3,7 @@
 #define _LINUX_MIGRATE_H
 
 #include <linux/mm.h>
+#include <linux/hmm.h>
 #include <linux/mempolicy.h>
 #include <linux/migrate_mode.h>
 #include <linux/hugetlb.h>
@@ -202,7 +203,7 @@ void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
 			unsigned long npages);
 void migrate_device_finalize(unsigned long *src_pfns,
 			unsigned long *dst_pfns, unsigned long npages);
-
+void migrate_hmm_range_setup(struct hmm_range *range);
 #endif /* CONFIG_MIGRATION */
 
 #endif /* _LINUX_MIGRATE_H */
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 009bfa8b212d..43e571e82cca 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -1528,3 +1528,58 @@ int migrate_device_coherent_folio(struct folio *folio)
 		return 0;
 	return -EBUSY;
 }
+
+/**
+ * migrate_hmm_range_setup() - prepare to migrate a range of memory
+ * @range: contains pointer to struct migrate_vma to be set up.
+ *
+ * When collecting has been done with hmm_range_fault(), this
+ * should be called next, and completes range->migrate by
+ * populating migrate->src[] and migrate->dst[]
+ * using range->hmm_pfns[].
+ * Also, migrate->cpages and migrate->npages get initialized.
+ * After migrate_hmm_range_setup(), range->migrate is good
+ * for the rest of the migrate_vma_* flow.
+ */
+void migrate_hmm_range_setup(struct hmm_range *range)
+{
+	struct migrate_vma *migrate = range->migrate;
+
+	if (!migrate)
+		return;
+
+	migrate->npages = (migrate->end - migrate->start) >> PAGE_SHIFT;
+	migrate->cpages = 0;
+
+	for (unsigned long i = 0; i < migrate->npages; i++) {
+		unsigned long pfn = range->hmm_pfns[i];
+
+		/*
+		 * We are only interested in entries to be
+		 * migrated.
+		 */
+		if (!(pfn & HMM_PFN_MIGRATE)) {
+			migrate->src[i] = 0;
+			migrate->dst[i] = 0;
+			continue;
+		}
+
+		migrate->cpages++;
+
+		/* HMM_PFN_MIGRATE without HMM_PFN_VALID denotes the special zero page */
+		if (pfn & HMM_PFN_VALID)
+			migrate->src[i] = migrate_pfn(page_to_pfn(hmm_pfn_to_page(pfn)));
+		else
+			migrate->src[i] = 0;
+
+		migrate->src[i] |= MIGRATE_PFN_MIGRATE;
+		migrate->src[i] |= (pfn & HMM_PFN_WRITE) ? MIGRATE_PFN_WRITE : 0;
+		migrate->src[i] |= (pfn & HMM_PFN_COMPOUND) ? MIGRATE_PFN_COMPOUND : 0;
+		migrate->dst[i] = 0;
+	}
+
+	if (migrate->cpages)
+		migrate_vma_unmap(migrate);
+
+}
+EXPORT_SYMBOL(migrate_hmm_range_setup);
-- 
2.55.0

