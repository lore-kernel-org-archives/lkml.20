Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D95E4219E9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232827; cv=none; b=U22A5qDxIuJ3NzUJJOxPvpZIhS7SebsI58RxcmtH8tYVrzWfz66IvpwkFtkTnyjTn5L82LYqvoNdt95HuFSxJQoweUhIHczRa8cSrxpavTuzzpV6PgaWgRV02plljv5PN8LoLbUAyDczRPYi472ZQiPaMZnYMaXgYFnueXcqaLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232827; c=relaxed/simple;
	bh=Vw8DEcu9a1Jd1CJ9KWanGL9Yzn9S0TsNI8wC/ggW76Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oo1U9LxlYQMVAVCdSOlRlUkgn8Mza4r7kxqR2YUeiF9twnfGMBsMminQOeLdsFu7Ow/D277NVxcs9dv+mUkU2rZR5Bs9V885mcp9uNxuhuUtpbhJ/XxBPaVvqkzKfxxstFBazpA5FXvG6cT0k/g2gdjNe6mZrX97whEaXKyu0Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QlOlxhim; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sh1lDjT2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QlOlxhim";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sh1lDjT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790232818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHN2LiOQU7r0d0fe1KkDFs3khSrbeSD24b1q7hC8HmQ=;
	b=QlOlxhimajsjWWcWqWyw17Wtiaq1cUJmGLrnaWDDpXfZGlumGLQ+ejEtaKH0IHOIQVf37f
	X7unWH329T/dFwsv7gjc5hR6V7jfNTeXWNvXimHAwSpkSe0s4ONb0Ab1pcDYBY24Fo6JGl
	4FAKmfM1zCt36k0Uj9xEJa2mc6fWqBc=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-Z1tPTtFkN8O2fPuWQtHWiA-1; Thu, 24 Sep 2026 02:53:37 -0400
X-MC-Unique: Z1tPTtFkN8O2fPuWQtHWiA-1
X-Mimecast-MFC-AGG-ID: Z1tPTtFkN8O2fPuWQtHWiA_1790232816
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3a592f20c7cso8787061fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790232815; x=1790837615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XHN2LiOQU7r0d0fe1KkDFs3khSrbeSD24b1q7hC8HmQ=;
        b=sh1lDjT2DjiCcdZLEUS5MgMZgWMWTEMbcl5ynWdu2bPme6JVJKfm7gr4jjRki1MGAt
         mbXf3qqfBcmlseRyNdBrPydagG3mAG8SAZnRdQVagFw8OUfVrKjdlND+s34MehTlAEt4
         WtSW6+oEUSv6N/aVphcDeMOWVCFlqf45Y3HaRR+zdcS2zG3f0u1TQ6gUqta5wDxfrIwq
         70o1+TsqyFWZyrDhs0HzDzFxzy93gmPWRvETbLlc3AYoccITyWXCvodlH+dmutClBr8v
         HQHz33JHKn0unXhSpl36Fg4eIysxSS/4Cz5FIUpBqYypXD/asAoVSF3W7eLhYg2Pkjfn
         n+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232815; x=1790837615;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHN2LiOQU7r0d0fe1KkDFs3khSrbeSD24b1q7hC8HmQ=;
        b=MMj5TtNtELtJJCIbNcWRUjkMI/p7uClnwBrld/iN4Nz7qh65hw401R4HS+4LDY/JGZ
         R7QbgDKuxMQVUziZtAtsbPUdoRVLPSP2waaNsoYcqHcjVrQsc+qhRO73zglIt5n2XuTd
         Cm5raY9+nPvu0qgBuM6/28MUMJq0CvhEEAl5Kmx+O/DRxSIRQ1VcJyrxEcmX4vFOW+UV
         hE715NFdXDzq+tijbWourlxB2UsPCbwHo7elHogPTggXNKXBAWDCGGYvcDg4bGFwpSJu
         koewyAues0kT/cMm4pBr99dA2n1jUUv0MT+TO1v/e44Y0AXCVgAJApmgAEmUKjh23vsq
         fjqg==
X-Forwarded-Encrypted: i=1; AKwUvBzAGyM+npn6KssxhCI4wqNTvyOERyGVJ+/AActRYdbr2rxlWfVdzDXLQOI2Wnn1FCLSYQXB+rpmWIo0VZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++lNwK5xVKBjr2bkG782xztRPHJd8LvwXCsGH0QOJl7jXkT1YcHg
	5zA/++6s5zVulErsZA2fSYckKWNbWVWeHK1WQtaj01l8RBPtPOOQS+JIeymASsXIQ3YO48xOpHB
	0Zprd+rXuusZAIsbCTfQLhmII9WyCg76jmT9U+pWTQchb2pQfh8dPok/ZSmwbweQTAHkRhqSY4F
	0=
X-Gm-Gg: AYBFou1f+CvwoRgdW64P9a1fTz6zpnhCX15eMMQhoOB6NmryVWDpk88MXfd4PS5cwMB
	juOBUfflbBHU2QjrjyyulsaN1eayYSkPTg9zd6xQOIWPGnoU1+203gaQFYzIgU2aObx+2eIuX+L
	4Z41c+Mb+xfUAisDlTSOYlcC7/VdGtdaoWmZG9K5yKLYANdAiaDk/vlaAwuSkY61JdJztOUNdhT
	CHFl6fCJvqu/W+ohWN/hRrzdj8oLKaXacoovEgUfljnKyq9jDH8TyiD3tXuIR6AW6WJRdlBFDY0
	FGOBFul8aIDewk8U9pxqSpmh+GegmF0XCIM445NVzgEm6oDQvsX8vMugUT+CPtlHF1KyQkFESBy
	0JcL3gwYKTTg30xhesC15
X-Received: by 2002:a05:651c:211b:b0:3a1:980f:5907 with SMTP id 38308e7fff4ca-3a63c086e9bmr3379281fa.8.1790232815507;
        Wed, 23 Sep 2026 23:53:35 -0700 (PDT)
X-Received: by 2002:a05:651c:211b:b0:3a1:980f:5907 with SMTP id 38308e7fff4ca-3a63c086e9bmr3379231fa.8.1790232815017;
        Wed, 23 Sep 2026 23:53:35 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf57909sm4803141fa.29.2026.09.23.23.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:53:34 -0700 (PDT)
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
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v15 02/11] mm: add helper to convert HMM pfn to migrate pfn
Date: Thu, 24 Sep 2026 09:53:04 +0300
Message-ID: <20260924065313.899730-3-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924065313.899730-1-mpenttil@redhat.com>
References: <20260924065313.899730-1-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

