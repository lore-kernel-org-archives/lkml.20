Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686614;
	b=LHSRpBMHTzIU6LyPclZydPW6AYkyPQ7uhAFArz0CruGr67nq40Y/J6MR+QfHid6/UcoJ
	 wFas2/Y4j4nU+PZqUfrGekld1PCiMUg2trlQbWAlU0WK2ONK02Bx4IdNA9h8THV1bryab
	 u3m7DtBF9ExYX3GxugclFQJGL4pm9bdE5U696levimB1hXeRS8JhYykvD2JsorFZ2ghJE
	 0DW+8z+zh8J6eoYc++MOm+TyrI+f/SNYlWBjH13gDMbIorh7ljT+zFt9IFwv+NcQweyBG
	 0l769UZD27Qq+fhBjIMfKl3u1JARnvsWzxJtKLYU6by+c4VmuP2BMjf1tMIT2ZHoQqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686614;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=v4p39RZoowMOxt9+KNmCTQhPcx47symeLsQa59zTEfM=;
	b=xkg+AQsHtd9ImtBf6LrqmiTDhFa2X+N+9afv0+GNM24ZI8euHHdrrIxYNgOUDEtS+O69
	 KuSuc/5HdagdpSweuirpXGMAVBRFX9oTkcziEUHnpYMj4ZnMOYJp2q+AFMso77p5h34gY
	 JpX9IVlCzLaRxGKK2nRqIMnG1xfn1cNjanaitZc89IBfgzV4/Lm6U5/xx7DmOeAG3To2h
	 PnQ6Z7hJGiVuiYViu7rBDD1aaukPrZeXYexzUXWMxpjmrvXwihmPJEF5rCK4z2isoj9LM
	 RAAF74rbCCcaL2YWv96hr7UdePF/9lpyREl2rMANfoiZYQyp30vOiGge4rM8xxMy/Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LcAwLQJS;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Tt24CrzL;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61747606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61747606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LcAwLQJS;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Tt24CrzL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793686613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v4p39RZoowMOxt9+KNmCTQhPcx47symeLsQa59zTEfM=;
	b=LcAwLQJSeHNr2Qr0E3jZ4/iQOUT1jM3PLbYge2MxtGbFPuYoIgmp5HxvDvFPs1w6YT0EUs
	zp5JS5cwuh5dj67caCLyGvIQmVjw6R57mAp0yGrOGCDpg1nAtAninc3NPc5k4Kp00Gjdjg
	UdGGPoyfxnVNap5NKU4FfVgz2rkQeuI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-d0697_5CPZ6SaRM4vnnXMA-1; Tue, 03 Nov 2026 01:16:52 -0500
X-MC-Unique: d0697_5CPZ6SaRM4vnnXMA-1
X-Mimecast-MFC-AGG-ID: d0697_5CPZ6SaRM4vnnXMA_1793686611
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5be3e17e9ddso1448519e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793686610; x=1794291410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v4p39RZoowMOxt9+KNmCTQhPcx47symeLsQa59zTEfM=;
        b=Tt24CrzL6O165wmB3wGHqF8ms5AqJ0fTzwATJTELKOaTwIHVgRou4EN64L8y6uIbZ3
         esiEamMYrNe7w5aulLo8rwdOmRZsjV7TxCiR3TSkF9eOtaFIuwBe2d8NA+0hmg2yHbxc
         V102xK5YBVIr7JDxebknVOBgXivHJfeUvSHjU3qPWN8Jrf0jX8eE2Inta8kT27gYlL6n
         9sdZcYNMv/aJ9Phm2H9xD7hMqvyKHdcfqeUVgpSl0u9aeLs0NVhaaZPxW1tC6rHBpLDn
         LEAVKd7Jb1uLSiyGP9A6ZW0GfxQ5c9rBJE9rzY8b870uf57B9/qBiy05Dc5/NgOEId/y
         jthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686610; x=1794291410;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4p39RZoowMOxt9+KNmCTQhPcx47symeLsQa59zTEfM=;
        b=pvOM+NCyf4/6miv2Em7ooyQYooqchdKlAK7HksfbJPuVjdby91bNazMOxtgxMibk0i
         QtzEh07caDz+DQb3kTE+jFbqgbyhW23+XNlJu7cWP4+7LWzjlX1AnHCR/ntNyt2mNzBT
         X9EpehlICj4/AvfjwZnILUQdfNA8hYvDrHlQiT2iQCBogY4Gw2FV8KWlque+EU+/An4J
         3M3Bfc725lcaXvvH3on+TZmbT24rKMxP9U0pmgBADiwsGX+oBSrRwOCM6YIUfeis8atk
         RhY4bXwuhlM+l6YlZTKg03RyVHztxwWklkkPp8vgU/OXEt2a/PqcxOhWT/Td1moSYtqN
         1U/w==
X-Forwarded-Encrypted: i=1; AKwUvByXAhzPgAFcU2+4tOyK7TuRQTNlIepIeLMNmiEvCgbbzJS6utTxw9J0Q0ELFbi0gDuIrkQ2dKGIWwWZfJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ij8le5gHzBc8S8yUAFN6LfBXr0Nw6Ou1g9Uv2UIAQldNkjRVO
	spGh6NQzzOeV8SxBdlU8yf0DvKYGcyZpE2Xk8oeO6tfIYu2LeGnNnKLFzVrLplUbvgaduATd9aL
	kf/vIh8qB4Wxzuzf6YuNAL86sLlNM2gtJRFNyigQPpNG9WrWKmdvr3+bkiExkH7gN
X-Gm-Gg: AYBFou3VMSg9mA30woSlDV/DP2KXNkcSzUbtFGNPyJC5JlfL7FqLxTtI/+GEHO44MpO
	JYDnSr7YeIZBUtw4/rlBd2sQaf6dHcrD+jHE1DRTaoqi3ZwHqOkykp+5/oMziwtOlQ5W56USGge
	UckWnlvfU0CMV6b7wYBJ7kFSLZtQHNpefKQ6U3yHMiiCf33jQQ1TnVGNOjdRofXTkPPs1XUQpFY
	h/wu1y/E/JDfnNdlNHlFAmaUm9Rz9ODgMh1cAgzUpMefDfRhk2SR2hk0NKMLvq1+ESvvIIE0Qep
	VXnRhVdgJni39/A7Ai/c5Ky3oq8J8aVlbo6ZPOkQ0V96+me9g9mrNMJF5TqpXUMZoJqBzheTAo/
	UxK24XTshsZxG8xwNWqikPLeUFLtqsez1E0vZJUwa4WK557iMvi3WyqbG3stTk06XR6NoJQ==
X-Received: by 2002:a05:6512:4607:b0:5bf:dc20:c3dc with SMTP id 2adb3069b0e04-5bfdc30084cmr3195647e87.6.1793686610524;
        Mon, 02 Nov 2026 22:16:50 -0800 (PST)
X-Received: by 2002:a05:6512:4607:b0:5bf:dc20:c3dc with SMTP id 2adb3069b0e04-5bfdc30084cmr3195615e87.6.1793686610027;
        Mon, 02 Nov 2026 22:16:50 -0800 (PST)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe073e0f9sm1964634e87.54.2026.11.02.22.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:16:49 -0800 (PST)
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
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v17 02/12] mm: add helper to convert HMM pfn to migrate pfn
Date: Tue,  3 Nov 2026 08:16:19 +0200
Message-ID: <20261103061629.972669-3-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103061629.972669-1-mpenttil@redhat.com>
References: <20261103061629.972669-1-mpenttil@redhat.com>
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
index 9e19fadfa65c..ba6775a0d37e 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -1530,3 +1530,58 @@ int migrate_device_coherent_folio(struct folio *folio)
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

