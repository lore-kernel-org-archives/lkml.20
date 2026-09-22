Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D8048E0E3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055292; cv=none; b=P1siPvI498nNdDUIhNrNJqm+1pfFq9eathm/Cs78rjPgmKu3ERuH5+TphSR1058ub+M6rhZiJuwj7dVIpRQmbXmNDhdngkZyLS5vWhS25lEE9hOsukk2qXft7VUKW53y05tDzxm0k/I8xOZ9Zy2/ZoBdSZrxux4ndMSz/mC+Qgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055292; c=relaxed/simple;
	bh=Vw8DEcu9a1Jd1CJ9KWanGL9Yzn9S0TsNI8wC/ggW76Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BoD/WwQONVQTaYBWhptQKYwvw25/VWzSFCVxcUcwCf759nBoIEIL5wrYYl0BiqoGoxkxpqvwTFCZBmx2Ip677Pxs8Gt2F32oQuBHYKyPwt2y9lyUW/okns+kxYIC5xXE5SaK8FSoHzZZGosEkzli4GUlTJt/TrBLToKq9n0tFsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=buc4URW/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WyPoC1UZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="buc4URW/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WyPoC1UZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHN2LiOQU7r0d0fe1KkDFs3khSrbeSD24b1q7hC8HmQ=;
	b=buc4URW/cSs9Mjmv1WYP1x9blxpske7TcKhzUHcoq5D64DH37EzGePjmXaJ73cNOwLvRnN
	xnCAOIKhMe7glelyxQxff8H4OXM12qSBuQX+WgL+k6TuRAqIf1YlhxHZQDJKFDDarrrpQt
	yW4WFTZVOgEJlI0ViGip0kv/BS4AnFY=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-0P50kFA2MKiKebBGKT1prw-1; Tue, 22 Sep 2026 01:34:47 -0400
X-MC-Unique: 0P50kFA2MKiKebBGKT1prw-1
X-Mimecast-MFC-AGG-ID: 0P50kFA2MKiKebBGKT1prw_1790055286
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3a58d16b9abso17422701fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055286; x=1790660086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XHN2LiOQU7r0d0fe1KkDFs3khSrbeSD24b1q7hC8HmQ=;
        b=WyPoC1UZ1H9kFJtsbz8ZyODvxujjaQ7mROUKAkqHsXhLTo+inzDeIq8kK8fqIP8hO1
         LBkK1tbinq8utm4I+b7QgrEA11UFjxDSyBx13diE2AbCZBgUPzEbuFfOf4vB9Sh4gPat
         67ekAZCVgjYcd33LzFK5S4nyruz6H2aEpEg8RvH69IGnqHE33x1UHkbeF/q1Zjct8A1N
         bOyZEp6WW/RFxvyXhCYjdH1hZOqVIUq10jGIUKsl+9pl5yP+Ey0Uyp1SGlMeeH7E+umh
         Tf4ZoFU6JpZ2N4gHC6Yw0FE0o5KbBsoN88Jf5xgslyL5DkjdhAXvKJvF507djS81gy9o
         eI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055286; x=1790660086;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHN2LiOQU7r0d0fe1KkDFs3khSrbeSD24b1q7hC8HmQ=;
        b=14XjWN0Xj9XP8QJTg5HxK1AzU4EKvDanaVZYqdfhKjZalzBJH6fK5D5hM7p9+NROvP
         x6o5jgZGCs0GcYIFNBieGEJ+2CTn8VOrn+1YqvZ8rbn09ZPHfDUJHknWSCr6CqVvQO73
         7LR5ovy1GGvDZVx/Mgom2Sg23NoPVqmyyW5FfhIOu27o2CP5pSr0Rtc/LUkRzkb7ab45
         YhDP0IgDBwhYmuXwT7d8FjiCQ95rnoQZRR8l8A0nwtol1EzE4eaNwwgMEONPhktk0KqE
         FCAP/L70QG3Exjg+pf0c8reFijzfrPrAMGAFTMhsPDhsVjnblI0rTWMrrl7Dr/zYOyt8
         jeNg==
X-Forwarded-Encrypted: i=1; AKwUvByblrmEbh+MoAvSuVJqc4wRLWQW9wWJmOYRin6S6+PWu26Vd6mTetBbvDnXfSH5gknwjWAK0MaKzyfgQtA=@vger.kernel.org
X-Gm-Message-State: AFuF++k0TXrfMZxCZKD9oFkrqimcXHU1/VxlOh9ttDg9WMPr2tBDLJbS
	YxwRrJP9gHc1K+LoeIfSN3SybYtsr7rPeI4u1FEebCq5mXZimndolRE0YZXMrOqho0kxa1R+hE+
	g84EdXnVzNd0OkzliZXQFwQFsSqH8Rrklvm8HZu/4em1uWUa+pH/jhnzpMnzLgLlB
X-Gm-Gg: AYBFou2XoeYtmR2AocCh+eiRMYM2f/w66E1yBRV+svLWeOfmNROo4S0MmVoIe18JGTY
	OdDArnw5/o7n1ihpVrss50yM7RKS2O19luTFR8+vXNec4M7mE55CI538N20RfXs1bmMQwGjC+CZ
	SxXq2uUKRILAwadTjBIYu3Rd2Wgz37ZcMZu7G8Mzv2iMwTkXcYIOAG1a/kGVQU0PGvcZoY5De3b
	cLBfr+Vd6nF2dBwWM0twsqod3RZIln/SqTY7uRpKFuCoNMZY6fJZo5sLj61Z/UfgtbSWQUJHvK1
	RT9CjF9hqzB3JY6kCBVwREbLsF2GAVrwjYzeCIS0o+SIahpHgtqvm8da6thHxcKUHXp6FymcfqV
	wGy7qa7Gk5S/qSSoRTxki
X-Received: by 2002:a05:6512:3ca7:b0:5b4:fdbe:ab4e with SMTP id 2adb3069b0e04-5b8c184e399mr3985139e87.25.1790055285988;
        Mon, 21 Sep 2026 22:34:45 -0700 (PDT)
X-Received: by 2002:a05:6512:3ca7:b0:5b4:fdbe:ab4e with SMTP id 2adb3069b0e04-5b8c184e399mr3985136e87.25.1790055285556;
        Mon, 21 Sep 2026 22:34:45 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46e0966sm191742e87.55.2026.09.21.22.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:34:44 -0700 (PDT)
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
Subject: [PATCH v14 02/12] mm: add helper to convert HMM pfn to migrate pfn
Date: Tue, 22 Sep 2026 08:34:11 +0300
Message-ID: <20260922053421.4092027-3-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922053421.4092027-1-mpenttil@redhat.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
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

