Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686660;
	b=qkC8j1yIkeZxFOSX6xPcz5DtIuVor6lV/szeCntyzTD/K6qPHu+j8dd1Oiysswkeqwjb
	 JzxjTJWb+Nt2dspn7ZP+cVsdrA93EM+uC2xReZZemAjBg9sAx6sgjTl2jU9etYOwitzR9
	 2WXJIq/jdBKmMSo0j2VwDLlRAxDKeirUANKIEbdv0L/gCgTHrIg6DqFTzZbC0BmuHdo2E
	 ST/jNoMuQjEpeqUWoCg2F84Yuhpr369BrTOu3lx+6pN4OtbJKkIAnl0GSmb0+3HcUIezC
	 fKF5uSUE+i2gd2bsjX5giO6cFLXk9Sh1T985IYIyQJjCdNAi81icZBUESLrqLPAVePg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686660;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UHfPEjRKPdsJW7IrBNxsSO6qXPC4EAtWHHc5G1+Efgc=;
	b=1mii/nFxehgHkYGvg2TmIXvBlIUIIv80yldj3KZp4oUdhSUFEDD1DMMnYbFH1KPGTgZ9
	 l9cHE4l27dhXxXZNgm1MnfASRE3z70dSRvSMbkqY3/OMg5dj5RtjrHNl7YpQo9N7d9h1Y
	 Prvjblwu3AEhPla5EMZGERoBD+4wrgObx+PDdSnW3yHuD7BvHQhCjbSj4Wq5tfDEdAYJd
	 wJzTK4bTf56eFVxUtvMnW9TxASZtNsffJtc5AGFR+jU1sXraMA1wJqLQEA0EpWlzh/WB6
	 WtUW+MhczYoANixYFFHay+zoloAw4bPjfBaMzx01j5u+UrVy6jABXn6WCCuiEPkxA1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FlBscaK0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rtNs6eFy;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E028C606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E028C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FlBscaK0;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rtNs6eFy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793686657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UHfPEjRKPdsJW7IrBNxsSO6qXPC4EAtWHHc5G1+Efgc=;
	b=FlBscaK0bByyIcnR3gUg1z5g9WFQNb0Zov/b98cSQVFynqeCG3nawey0/ihw8QYDYeynwN
	UdMrSAzMawFs0/tiKUu+LR/FJTiHfIpXLG7m6Vc9iSrLmiZ3GMiw54jhMSuCOKbEWyvhj1
	ccJ+FXCMJTxGx+u6hbKob38SCHz9Z/c=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368--RgAasI5NFC7ra3MMu3yyA-1; Tue, 03 Nov 2026 01:17:35 -0500
X-MC-Unique: -RgAasI5NFC7ra3MMu3yyA-1
X-Mimecast-MFC-AGG-ID: -RgAasI5NFC7ra3MMu3yyA_1793686654
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5bcf03751deso2808426e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793686654; x=1794291454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UHfPEjRKPdsJW7IrBNxsSO6qXPC4EAtWHHc5G1+Efgc=;
        b=rtNs6eFyVsJXdVBTx4C/j/7VJiSs8Gx5NpZbZY7vVoyThmmKXr9OL36hIT1s4N9amX
         AVI1nymqgkxpXSA2p3/GpDZebrtSppO1I69lGDZFPecHwzPB1008Pj6bR0jOoqsKsPoC
         eeDc1BJJz0D5x9CS74RCz7x65pL0y6lOu8sdcN+XuLi1BhRYV9EPjvkEzC6hJD0YEDh/
         4OuDve4nbzZb96qvaY91opB7rYcYtU3VhxTqL2QZToHBvyynKzKY9+TSwQKD1TDa+e8V
         yL3hhgPnE0pHwXxgDt7xgvvAmEH6OmFadvS56+cSexVLqoFl8L+SiDIWq35iKeLBlfFC
         9mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686654; x=1794291454;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHfPEjRKPdsJW7IrBNxsSO6qXPC4EAtWHHc5G1+Efgc=;
        b=2bHu6oWu7KpWi6pRpfvq7HKHpKQbcnp2aQ0T8mBhkOkP5laXFwSPC+PHERCF/DJzlY
         mIJXRr5ySDJ3+1lDU3ldTdNICugZnTJo0W8ATNHMQugomhgIg7MLY/NJnLFAE31odHn2
         vCcP6mpjOQrtq6/VjHlLrq4ZUKPiRrE66eUrcPD1uu8wJg8PMQNgWYNzXdh9EOMDEQ0I
         0ZvAa/Gssh7Gi+qkZHMCuMamjvxjkvzndwIn+9NjijwNzL7I42+pN20fAk/yM+XgvzaP
         8kdxkb7fm8rcmUlG/t61YpBfGDG8NDkmo8sPLdxfmePBDRzjF4y4TivhL/dgEi8Qq1FT
         9NlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRQzLrQXcHNGxNKpmTy1TkpBvl1Wx+T34lSkMMtOFTqkT/UgbJvobXYjxfsSr1h7kBqr3TzqDQeGq5T9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TQ3DDhRkeu9uCOb/ThXX+3+f1BqBDa0zzJeq/0EADj8GJZzy3
	5rkpXNSuFumrhkkVNb/AiSGXSs8zUPrpBTy+EBBr7pLfJj0hdkAzuBHSrdfTJcVHIarbDfuQwMW
	VaymFU1dzHxo1UQlS8xHupZmT3cYYtkhbH+QfZrvgORBlaYJ8Ryr3SCyl8MYm+GjR
X-Gm-Gg: AYBFou1PsOg8IEIY03CwPydyuzq23pd+CB8xKh66YdxT+JxlR2WCXSUEie5QtsssIA+
	6g6OW/IEkyPlbPO+g0CCJ55XYACmWsFInV6UpkMH+NnmkiL9pLFfgR7dl7MGjKUg2a2aEPlVW9k
	TGb2m1mCHseNsxuLWvO/5EnvIpw33MU+/6BSbUIATYeBLrqhm8MrDMXDXLpAMg4kNwOpTbga2/0
	Yywp8BhnasaaiAGRhys+nO3diavca+nSn7mFSOcFN8KrZbDVtdiqseY8yQEbw4vkIrfjYAg0IpW
	feo5Fh+feIUIHM95gOizcB4/8yJTbN1uqI2QdLQlbHmRpBYA0LH0q5zreNpqQEjmZhQIXAYfdYv
	RU8GtIeKbw5DXwqc5dgUiQDtjhpIaB9unHPrlZz5R9mOj/aDpxhD9unLXCAFg+iEp8ihzbA==
X-Received: by 2002:a05:6512:400d:b0:5b6:1a7c:fd94 with SMTP id 2adb3069b0e04-5bfd95804d9mr4367346e87.58.1793686653753;
        Mon, 02 Nov 2026 22:17:33 -0800 (PST)
X-Received: by 2002:a05:6512:400d:b0:5b6:1a7c:fd94 with SMTP id 2adb3069b0e04-5bfd95804d9mr4367324e87.58.1793686653094;
        Mon, 02 Nov 2026 22:17:33 -0800 (PST)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe073e0f9sm1964634e87.54.2026.11.02.22.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:17:22 -0800 (PST)
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
Subject: [PATCH v17 12/12] drm/nouveau/svm: add support for migrate on fault
Date: Tue,  3 Nov 2026 08:16:29 +0200
Message-ID: <20261103061629.972669-13-mpenttil@redhat.com>
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

Add a direct user for the new HMM_PFN_REQ_MIGRATE flag and
implement migrate on fault for nouveau driver. It is gated
by the svm_migrate_on_fault module parameter, default off.

Added nouveau_dmem_migrate_fault() that faults a range in and
does migrate collecting in a single hmm_range_fault() walk.

As an optimization, a migration policy - deciding which faulting
ranges are worth migrating to VRAM and which are better left
mirrored in system memory - would be useful. This patch
establishes the migrate-on-fault mechanism as a basis for later
refinement.

Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 402 +++++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_dmem.h |  12 +
 drivers/gpu/drm/nouveau/nouveau_svm.c  | 155 +++++++---
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   5 +
 4 files changed, 503 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index e74d7bb975a8..0a5d04068321 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -40,6 +40,9 @@
 #include <linux/hmm.h>
 #include <linux/memremap.h>
 #include <linux/migrate.h>
+#include <linux/jiffies.h>
+#include <linux/delay.h>
+#include <linux/mmu_notifier.h>
 
 /*
  * FIXME: this is ugly right now we are using TTM to allocate vram and we pin
@@ -76,6 +79,14 @@ struct nouveau_dmem_migrate {
 	nouveau_migrate_copy_t copy_func;
 	nouveau_clear_page_t clear_func;
 	struct nouveau_channel *chan;
+	/*
+	 * Serializes the dmem users of chan (CPU faults in migrate_to_ram(),
+	 * migrate on fault, bulk migration, eviction): the copy and clear
+	 * commands they write to its push buffer and the fences they emit.
+	 * Held only around those writes, never across page allocation.
+	 * TTM serializes its own use of the channel with cli->mutex.
+	 */
+	struct mutex lock;
 };
 
 struct nouveau_dmem {
@@ -93,6 +104,41 @@ struct nouveau_dmem_dma_info {
 	size_t size;
 };
 
+static int nouveau_dmem_copy(struct nouveau_drm *drm, u64 npages,
+			     enum nouveau_aper dst_aper, u64 dst_addr,
+			     enum nouveau_aper src_aper, u64 src_addr)
+{
+	int ret;
+
+	mutex_lock(&drm->dmem->migrate.lock);
+	ret = drm->dmem->migrate.copy_func(drm, npages, dst_aper, dst_addr,
+					   src_aper, src_addr);
+	mutex_unlock(&drm->dmem->migrate.lock);
+	return ret;
+}
+
+static int nouveau_dmem_clear(struct nouveau_drm *drm, u32 length,
+			      enum nouveau_aper dst_aper, u64 dst_addr)
+{
+	int ret;
+
+	mutex_lock(&drm->dmem->migrate.lock);
+	ret = drm->dmem->migrate.clear_func(drm, length, dst_aper, dst_addr);
+	mutex_unlock(&drm->dmem->migrate.lock);
+	return ret;
+}
+
+static int nouveau_dmem_fence_new(struct nouveau_drm *drm,
+				  struct nouveau_fence **fence)
+{
+	int ret;
+
+	mutex_lock(&drm->dmem->migrate.lock);
+	ret = nouveau_fence_new(fence, drm->dmem->migrate.chan);
+	mutex_unlock(&drm->dmem->migrate.lock);
+	return ret;
+}
+
 static struct nouveau_dmem_chunk *nouveau_page_to_chunk(struct page *page)
 {
 	return container_of(page_pgmap(page), struct nouveau_dmem_chunk,
@@ -139,10 +185,12 @@ static void nouveau_dmem_folio_free(struct folio *folio)
 	spin_unlock(&dmem->lock);
 }
 
-static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
+static int nouveau_dmem_fence_done(struct nouveau_fence **fence)
 {
+	int ret = 0;
+
 	if (fence) {
-		nouveau_fence_wait(*fence, true, false);
+		ret = nouveau_fence_wait(*fence, true, false);
 		nouveau_fence_unref(fence);
 	} else {
 		/*
@@ -150,6 +198,54 @@ static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
 		 * the hmem object.
 		 */
 	}
+
+	/* 0 on completion, -EBUSY on timeout, or other errno; propagated. */
+	return ret;
+}
+
+/*
+ * Poll the copy fence instead of the lazy (interrupt-driven) wait since
+ * completion IRQ is randomly missed, hitting the timeout.
+ *
+ * Returns 0 on completion, -EBUSY on timeout. Consumes the fence reference.
+ */
+static int nouveau_dmem_fence_poll(struct nouveau_fence **fence)
+{
+	unsigned long deadline = jiffies + 30 * HZ;
+	int ret = 0;
+
+	while (!nouveau_fence_done(*fence)) {
+		if (time_after(jiffies, deadline)) {
+			ret = -EBUSY;
+			break;
+		}
+		schedule_timeout_uninterruptible(msecs_to_jiffies(1));
+	}
+	nouveau_fence_unref(fence);
+
+	return ret;
+}
+
+/*
+ * The copy could not be confirmed (fence timeout or no fence): don't migrate,
+ * so finalize restores the original ptes and the source stays valid. The copy
+ * engine may still be using the pages, so keep the destination folios (an
+ * extra reference that finalize won't drop) and let the caller skip the DMA
+ * unmap: leaking is safer than freeing memory a wedged engine might write.
+ */
+static void nouveau_dmem_migrate_abort(struct nouveau_drm *drm,
+				       struct migrate_vma *args)
+{
+	unsigned long i;
+
+	for (i = 0; i < args->npages; i++) {
+		struct page *dpage = migrate_pfn_to_page(args->dst[i]);
+
+		args->src[i] &= ~MIGRATE_PFN_MIGRATE;
+		if (dpage)
+			folio_get(page_folio(dpage));
+	}
+	NV_ERROR(drm, "svm: copy not confirmed, migration aborted, pages leaked\n");
 }
 
 static int nouveau_dmem_copy_folio(struct nouveau_drm *drm,
@@ -168,10 +264,10 @@ static int nouveau_dmem_copy_folio(struct nouveau_drm *drm,
 	if (dma_mapping_error(dev, dma_info->dma_addr))
 		return -EIO;
 
-	if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(sfolio),
-					 NOUVEAU_APER_HOST, dma_info->dma_addr,
-					 NOUVEAU_APER_VRAM,
-					 nouveau_dmem_page_addr(spage))) {
+	if (nouveau_dmem_copy(drm, folio_nr_pages(sfolio),
+			      NOUVEAU_APER_HOST, dma_info->dma_addr,
+			      NOUVEAU_APER_VRAM,
+			      nouveau_dmem_page_addr(spage))) {
 		dma_unmap_page(dev, dma_info->dma_addr, page_size(dpage),
 					DMA_BIDIRECTIONAL);
 		return -EIO;
@@ -183,12 +279,11 @@ static int nouveau_dmem_copy_folio(struct nouveau_drm *drm,
 static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 {
 	struct nouveau_drm *drm = page_to_drm(vmf->page);
-	struct nouveau_dmem *dmem = drm->dmem;
-	struct nouveau_fence *fence;
+	struct nouveau_fence *fence = NULL;
 	struct nouveau_svmm *svmm;
 	struct page *dpage;
 	vm_fault_t ret = 0;
-	int err;
+	int err, fret = 0;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
 		.pgmap_owner	= drm->dev,
@@ -233,10 +328,12 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	 * than just one page on CPU fault. When such fault happens it is very
 	 * likely that more surrounding page will CPU fault too.
 	 */
-	if (migrate_vma_setup(&args) < 0)
-		return VM_FAULT_SIGBUS;
+	if (migrate_vma_setup(&args) < 0) {
+		ret = VM_FAULT_SIGBUS;
+		goto err;
+	}
 	if (!args.cpages)
-		return 0;
+		goto done;
 
 	if (order)
 		dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER | __GFP_ZERO,
@@ -264,11 +361,21 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		goto done;
 	}
 
-	nouveau_fence_new(&fence, dmem->migrate.chan);
+	/*
+	 * Commit the migration only once the copy is confirmed. Without a
+	 * fence the copy can't be confirmed: treat it as failed.
+	 */
+	fret = nouveau_dmem_fence_new(drm, &fence);
+	if (!fret)
+		fret = nouveau_dmem_fence_poll(&fence);
+	if (fret) {
+		nouveau_dmem_migrate_abort(drm, &args);
+		ret = VM_FAULT_SIGBUS;
+	} else {
+		dma_unmap_page(drm->dev->dev, dma_info.dma_addr, dma_info.size,
+			       DMA_BIDIRECTIONAL);
+	}
 	migrate_vma_pages(&args);
-	nouveau_dmem_fence_done(&fence);
-	dma_unmap_page(drm->dev->dev, dma_info.dma_addr, dma_info.size,
-				DMA_BIDIRECTIONAL);
 done:
 	migrate_vma_finalize(&args);
 err:
@@ -528,7 +635,7 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 		}
 	}
 
-	nouveau_fence_new(&fence, chunk->drm->dmem->migrate.chan);
+	nouveau_dmem_fence_new(chunk->drm, &fence);
 	migrate_device_pages(src_pfns, dst_pfns, npages);
 	nouveau_dmem_fence_done(&fence);
 	migrate_device_finalize(src_pfns, dst_pfns, npages);
@@ -729,6 +836,7 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 	INIT_LIST_HEAD(&drm->dmem->chunks);
 	mutex_init(&drm->dmem->mutex);
 	spin_lock_init(&drm->dmem->lock);
+	mutex_init(&drm->dmem->migrate.lock);
 
 	/* Initialize migration dma helpers before registering memory */
 	ret = nouveau_dmem_migrate_init(drm);
@@ -764,13 +872,13 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		dma_info->size = page_size(spage);
 		if (dma_mapping_error(dev, dma_info->dma_addr))
 			goto out_free_page;
-		if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(page_folio(spage)),
+		if (nouveau_dmem_copy(drm, folio_nr_pages(page_folio(spage)),
 			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST,
 			dma_info->dma_addr))
 			goto out_dma_unmap;
 	} else {
 		dma_info->dma_addr = DMA_MAPPING_ERROR;
-		if (drm->dmem->migrate.clear_func(drm, page_size(dpage),
+		if (nouveau_dmem_clear(drm, page_size(dpage),
 			NOUVEAU_APER_VRAM, paddr))
 			goto out_free_page;
 	}
@@ -794,11 +902,12 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 	return 0;
 }
 
-static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
+static unsigned long
+nouveau_dmem_migrate_alloc_and_copy(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, struct migrate_vma *args,
-		struct nouveau_dmem_dma_info *dma_info, u64 *pfns)
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfns,
+		unsigned long *nr_dma_out, unsigned long *order_out)
 {
-	struct nouveau_fence *fence;
 	unsigned long addr = args->start, nr_dma = 0, i;
 	unsigned long order = 0;
 
@@ -820,7 +929,22 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 		addr += (1 << order) * PAGE_SIZE;
 	}
 
-	nouveau_fence_new(&fence, drm->dmem->migrate.chan);
+	*nr_dma_out = nr_dma;
+	*order_out = order;
+	return i;
+}
+
+static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
+		struct nouveau_svmm *svmm, struct migrate_vma *args,
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfns)
+{
+	struct nouveau_fence *fence;
+	unsigned long nr_dma, order, i;
+
+	i = nouveau_dmem_migrate_alloc_and_copy(drm, svmm, args, dma_info, pfns,
+						&nr_dma, &order);
+
+	nouveau_dmem_fence_new(drm, &fence);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
 	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i, order);
@@ -832,6 +956,238 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 	migrate_vma_finalize(args);
 }
 
+/*
+ * Encode an hmm_range_fault() pfn for @start into the nouveau PFNMAP format,
+ * shared by nouveau_hmm_convert_pfn() and the in-place map in
+ * nouveau_dmem_migrate_fault().
+ */
+u64 nouveau_dmem_hmm_pfn_to_map(unsigned long hmm_pfn, unsigned long start,
+				unsigned long *map_addr, unsigned int *page_shift)
+{
+	unsigned long order;
+	struct page *page;
+	u64 pfn;
+
+	*map_addr = start;
+	*page_shift = PAGE_SHIFT;
+
+	if (!(hmm_pfn & HMM_PFN_VALID))
+		return NVIF_VMM_PFNMAP_V0_NONE;
+
+	page = hmm_pfn_to_page(hmm_pfn);
+
+	order = hmm_pfn_to_map_order(hmm_pfn);
+	if (order) {
+		*page_shift = order + PAGE_SHIFT;
+		*map_addr = start & ~((1UL << *page_shift) - 1);
+		page -= (start - *map_addr) >> PAGE_SHIFT;
+	}
+
+	if (is_device_private_page(page))
+		pfn = nouveau_dmem_page_addr(page) |
+			NVIF_VMM_PFNMAP_V0_V | NVIF_VMM_PFNMAP_V0_VRAM;
+	else
+		pfn = page_to_phys(page) |
+			NVIF_VMM_PFNMAP_V0_V | NVIF_VMM_PFNMAP_V0_HOST;
+	if (hmm_pfn & HMM_PFN_WRITE)
+		pfn |= NVIF_VMM_PFNMAP_V0_W;
+
+	return pfn;
+}
+
+/*
+ * Fault a range in and migrate it to VRAM.
+ * Returns 0 on success, or an error (so the caller
+ * falls back to nouveau_range_fault()) if nothing could be mapped.
+ */
+int
+nouveau_dmem_migrate_fault(struct nouveau_drm *drm, struct nouveau_svmm *svmm,
+			   struct mmu_interval_notifier *notifier,
+			   unsigned long start, unsigned long end,
+			   unsigned long hmm_flags,
+			   u64 *out_pfn0, unsigned long *out_addr,
+			   unsigned int *out_shift)
+{
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long npages = (end - start) >> PAGE_SHIFT;
+	struct mm_struct *mm = notifier->mm;
+	struct nouveau_dmem_dma_info *dma_info;
+	struct nouveau_fence *fence = NULL;
+	struct migrate_vma migrate = {
+		.start		= start,
+		.end		= end,
+		.pgmap_owner	= drm->dev,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
+	};
+	struct hmm_range range = {
+		.notifier		= notifier,
+		.start			= start,
+		.end			= end,
+		.dev_private_owner	= drm->dev,
+		.migrate		= &migrate,
+		.default_flags		= hmm_flags | HMM_PFN_REQ_MIGRATE,
+	};
+	unsigned long nr_dma, order, n, i;
+	unsigned long hmm_pfn0 = 0;
+	bool migrated;
+	u64 *pfns;
+	int ret, fret = 0;
+
+	if (!drm->dmem)
+		return -ENODEV;
+
+	migrate.src = kcalloc(npages, sizeof(*migrate.src), GFP_KERNEL);
+	if (!migrate.src)
+		return -ENOMEM;
+	migrate.dst = kcalloc(npages, sizeof(*migrate.dst), GFP_KERNEL);
+	if (!migrate.dst) {
+		ret = -ENOMEM;
+		goto out_free_src;
+	}
+	dma_info = kmalloc_objs(*dma_info, npages);
+	if (!dma_info) {
+		ret = -ENOMEM;
+		goto out_free_dst;
+	}
+	pfns = nouveau_pfns_alloc(npages);
+	if (!pfns) {
+		ret = -ENOMEM;
+		goto out_free_dma;
+	}
+
+	/* hmm_range_fault() shares the source pfn array with migrate_vma. */
+	range.hmm_pfns = migrate.src;
+
+	do {
+		mmap_read_lock(mm);
+		range.notifier_seq = mmu_interval_read_begin(notifier);
+
+		ret = hmm_range_fault(&range);
+		/*
+		 * Snapshot the pfn before migrate_hmm_range_setup() overwrites the
+		 * shared array; used to map in place if nothing migrates.
+		 */
+		if (!ret)
+			hmm_pfn0 = range.hmm_pfns[0];
+		migrate_hmm_range_setup(&range);
+		if (ret) {
+			migrate_vma_pages(&migrate);
+			migrate_vma_finalize(&migrate);
+			goto unlock;
+		}
+
+		n = nouveau_dmem_migrate_alloc_and_copy(drm, svmm, &migrate,
+							dma_info, pfns,
+							&nr_dma, &order);
+
+		/* Only a migrated page has an in-flight CE copy to unblock below. */
+		for (i = 0, migrated = false; i < npages; i++) {
+			if (migrate.dst[i]) {
+				migrated = true;
+				break;
+			}
+		}
+
+		/*
+		 * Track a copy fence only when a copy was enqueued; waiting on an
+		 * empty fence would block until the fault's CTXSW_TIMEOUT.
+		 */
+		if (migrated)
+			fret = nouveau_dmem_fence_new(drm, &fence);
+
+		/*
+		 * The fault-in path must replay the faulting channel before waiting on
+		 * the copy fence: with the fault still unreplayed the copy does not
+		 * make progress. GPU has no mapping so it might refault, until it
+		 * gets the migrated or mirrored mapping.
+		 */
+		if (drm->svm && migrated)
+			nouveau_svm_fault_replay(drm->svm);
+
+		/* Without a fence (fret set) the copy can't be confirmed. */
+		if (migrated && !fret)
+			fret = nouveau_dmem_fence_poll(&fence);
+
+		/* Commit the migration only once the copy is confirmed. */
+		if (fret)
+			nouveau_dmem_migrate_abort(drm, &migrate);
+		migrate_vma_pages(&migrate);
+
+		/*
+		 * Don't map destination pages that migrate_vma_pages() didn't
+		 * migrate: finalize frees them and restores the source.
+		 */
+		for (i = 0; i < npages; i++)
+			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
+				pfns[i] = NVIF_VMM_PFNMAP_V0_NONE;
+
+		mutex_lock(&svmm->mutex);
+		if (fret) {
+			/* Copy did not complete; don't map a half-copied page. */
+			ret = -EIO;
+		} else if (mmu_interval_read_retry(notifier, range.notifier_seq)) {
+			ret = -EBUSY;
+		} else {
+			unsigned long map_addr = migrate.start;
+			unsigned int page_shift = PAGE_SHIFT + order;
+
+			/*
+			 * If nothing migrated might still be able to mirror.
+			 * In that case use the snapshot hmm_pfn.
+			 * npages == 1 always today.
+			 */
+			if (npages == 1 && !(pfns[0] & NVIF_VMM_PFNMAP_V0_V))
+				pfns[0] = nouveau_dmem_hmm_pfn_to_map(hmm_pfn0,
+						start, &map_addr, &page_shift);
+
+			/*
+			 * Nothing to map: leave the GPU mapping alone, the
+			 * caller falls back to nouveau_range_fault().
+			 */
+			if (pfns[0] & NVIF_VMM_PFNMAP_V0_V) {
+				/* On failure the caller falls back, then cancels */
+				ret = __nouveau_pfns_map_locked(svmm, map_addr,
+								pfns, n,
+								page_shift);
+				if (!ret) {
+					*out_pfn0 = pfns[0];
+					*out_addr = map_addr;
+					*out_shift = page_shift;
+				}
+			}
+		}
+		mutex_unlock(&svmm->mutex);
+
+		if (fret)
+			NV_ERROR(drm,
+				 "svm: migrate copy did not complete (%d) for %lx-%lx\n",
+				 fret, start, end);
+
+		/* After an aborted copy the engine may still use the mappings */
+		while (!fret && nr_dma--) {
+			dma_unmap_page(drm->dev->dev, dma_info[nr_dma].dma_addr,
+				       dma_info[nr_dma].size, DMA_BIDIRECTIONAL);
+		}
+		migrate_vma_finalize(&migrate);
+unlock:
+		mmap_read_unlock(mm);
+	} while (ret == -EBUSY && !time_after(jiffies, timeout));
+
+	/* Nothing migrated or mappable in place, fallback to nouveau_range_fault(). */
+	if (!ret && !(pfns[0] & NVIF_VMM_PFNMAP_V0_V))
+		ret = -ENOENT;
+
+	nouveau_pfns_free(pfns);
+out_free_dma:
+	kfree(dma_info);
+out_free_dst:
+	kfree(migrate.dst);
+out_free_src:
+	kfree(migrate.src);
+	return ret;
+}
+
 int
 nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			 struct nouveau_svmm *svmm,
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.h b/drivers/gpu/drm/nouveau/nouveau_dmem.h
index 64da5d3635c8..91e8910cadbf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.h
@@ -27,6 +27,7 @@ struct drm_file;
 struct nouveau_drm;
 struct nouveau_svmm;
 struct hmm_range;
+struct mmu_interval_notifier;
 
 #if IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM)
 void nouveau_dmem_init(struct nouveau_drm *);
@@ -39,7 +40,18 @@ int nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			     struct vm_area_struct *vma,
 			     unsigned long start,
 			     unsigned long end);
+int nouveau_dmem_migrate_fault(struct nouveau_drm *drm,
+			       struct nouveau_svmm *svmm,
+			       struct mmu_interval_notifier *notifier,
+			       unsigned long start,
+			       unsigned long end,
+			       unsigned long hmm_flags,
+			       u64 *out_pfn0,
+			       unsigned long *out_addr,
+			       unsigned int *out_shift);
 unsigned long nouveau_dmem_page_addr(struct page *page);
+u64 nouveau_dmem_hmm_pfn_to_map(unsigned long hmm_pfn, unsigned long start,
+				unsigned long *map_addr, unsigned int *page_shift);
 
 #else /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
 static inline void nouveau_dmem_init(struct nouveau_drm *drm) {}
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index c519c28164fa..6e109274bd77 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -37,6 +37,7 @@
 #include <linux/hmm.h>
 #include <linux/memremap.h>
 #include <linux/rmap.h>
+#include <linux/moduleparam.h>
 
 struct nouveau_svm {
 	struct nouveau_drm *drm;
@@ -78,6 +79,13 @@ struct nouveau_svm {
 #define SVM_DBG(s,f,a...) NV_DEBUG((s)->drm, "svm: "f"\n", ##a)
 #define SVM_ERR(s,f,a...) NV_WARN((s)->drm, "svm: "f"\n", ##a)
 
+/* When set, migrate the faulting range to VRAM on GPU fault (default off). */
+static bool nouveau_svm_migrate_on_fault;
+module_param_named(svm_migrate_on_fault, nouveau_svm_migrate_on_fault, bool,
+		   0644);
+MODULE_PARM_DESC(svm_migrate_on_fault,
+		 "migrate system memory to VRAM on GPU fault (default off)");
+
 struct nouveau_pfnmap_args {
 	struct nvif_ioctl_v0_hdr i;
 	struct nvif_ioctl_mthd_v0_hdr m;
@@ -182,9 +190,10 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 
 		addr = max(addr, vma->vm_start);
 		next = min(vma->vm_end, end);
-		/* This is a best effort so we ignore errors */
-		nouveau_dmem_migrate_vma(cli->drm, cli->svm.svmm, vma, addr,
-					 next);
+		/* Best effort; skipped when migrate-on-fault does the migration. */
+		if (!nouveau_svm_migrate_on_fault)
+			nouveau_dmem_migrate_vma(cli->drm, cli->svm.svmm, vma,
+						 addr, next);
 		addr = next;
 	}
 
@@ -390,7 +399,7 @@ nouveau_svmm_init(struct drm_device *dev, void *data,
 }
 
 /* Issue fault replay for GPU to retry accesses that faulted previously. */
-static void
+void
 nouveau_svm_fault_replay(struct nouveau_svm *svm)
 {
 	SVM_DBG(svm, "replay");
@@ -514,6 +523,8 @@ nouveau_svm_fault_cache(struct nouveau_svm *svm,
 struct svm_notifier {
 	struct mmu_interval_notifier notifier;
 	struct nouveau_svmm *svmm;
+	/* Task running this fault's migrate-on-fault walk, or NULL */
+	struct task_struct *migrating;
 };
 
 static bool nouveau_svm_range_invalidate(struct mmu_interval_notifier *mni,
@@ -527,6 +538,17 @@ static bool nouveau_svm_range_invalidate(struct mmu_interval_notifier *mni,
 	    range->owner == sn->svmm->vmm->cli->drm->dev)
 		return true;
 
+	/*
+	 * Ignore the invalidation of this fault's own migrate-on-fault walk,
+	 * which runs in the walking task; otherwise its MMU_NOTIFY_MIGRATE
+	 * bumps the seq and read_retry() spins to timeout. Other migrations
+	 * on the device (CPU faults, bind) must still invalidate.
+	 */
+	if (range->event == MMU_NOTIFY_MIGRATE &&
+	    range->owner == sn->svmm->vmm->cli->drm->dev &&
+	    READ_ONCE(sn->migrating) == current)
+		return true;
+
 	/*
 	 * serializes the update to mni->invalidate_seq done by caller and
 	 * prevents invalidation of the PTE from progressing while HW is being
@@ -551,48 +573,25 @@ static void nouveau_hmm_convert_pfn(struct nouveau_drm *drm,
 				    struct hmm_range *range,
 				    struct nouveau_pfnmap_args *args)
 {
-	struct page *page;
+	unsigned long map_addr;
+	unsigned int page_shift;
 
 	/*
 	 * The address prepared here is passed through nvif_object_ioctl()
 	 * to an eventual DMA map in something like gp100_vmm_pgt_pfn()
 	 *
 	 * This is all just encoding the internal hmm representation into a
-	 * different nouveau internal representation.
+	 * different nouveau internal representation; see the shared encoder
+	 * nouveau_dmem_hmm_pfn_to_map() (also widens to the CPU folio order).
 	 */
-	if (!(range->hmm_pfns[0] & HMM_PFN_VALID)) {
-		args->p.phys[0] = 0;
-		return;
+	args->p.phys[0] = nouveau_dmem_hmm_pfn_to_map(range->hmm_pfns[0],
+						      args->p.addr, &map_addr,
+						      &page_shift);
+	if (page_shift != PAGE_SHIFT) {
+		args->p.addr = map_addr;
+		args->p.page = page_shift;
+		args->p.size = 1UL << page_shift;
 	}
-
-	page = hmm_pfn_to_page(range->hmm_pfns[0]);
-	/*
-	 * Only map compound pages to the GPU if the CPU is also mapping the
-	 * page as a compound page. Otherwise, the PTE protections might not be
-	 * consistent (e.g., CPU only maps part of a compound page).
-	 * Note that the underlying page might still be larger than the
-	 * CPU mapping (e.g., a PUD sized compound page partially mapped with
-	 * a PMD sized page table entry).
-	 */
-	if (hmm_pfn_to_map_order(range->hmm_pfns[0])) {
-		unsigned long addr = args->p.addr;
-
-		args->p.page = hmm_pfn_to_map_order(range->hmm_pfns[0]) +
-				PAGE_SHIFT;
-		args->p.size = 1UL << args->p.page;
-		args->p.addr &= ~(args->p.size - 1);
-		page -= (addr - args->p.addr) >> PAGE_SHIFT;
-	}
-	if (is_device_private_page(page))
-		args->p.phys[0] = nouveau_dmem_page_addr(page) |
-				NVIF_VMM_PFNMAP_V0_V |
-				NVIF_VMM_PFNMAP_V0_VRAM;
-	else
-		args->p.phys[0] = page_to_phys(page) |
-				NVIF_VMM_PFNMAP_V0_V |
-				NVIF_VMM_PFNMAP_V0_HOST;
-	if (range->hmm_pfns[0] & HMM_PFN_WRITE)
-		args->p.phys[0] |= NVIF_VMM_PFNMAP_V0_W;
 }
 
 static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
@@ -728,6 +727,46 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 	return ret;
 }
 
+static int nouveau_range_fault_and_migrate(struct nouveau_svmm *svmm,
+					   struct nouveau_drm *drm,
+					   struct nouveau_pfnmap_args *args,
+					   unsigned long hmm_flags,
+					   struct svm_notifier *notifier)
+{
+	struct mm_struct *mm = svmm->notifier.mm;
+	unsigned long start = args->p.addr;
+	unsigned long end = start + args->p.size;
+	unsigned long map_addr;
+	unsigned int page_shift;
+	u64 pfn0;
+	int ret;
+
+	ret = mmu_interval_notifier_insert(&notifier->notifier, mm,
+					   start, args->p.size,
+					   &nouveau_svm_mni_ops);
+	if (ret)
+		return ret;
+
+	WRITE_ONCE(notifier->migrating, current);
+	ret = nouveau_dmem_migrate_fault(drm, svmm, &notifier->notifier,
+					 start, end, hmm_flags,
+					 &pfn0, &map_addr, &page_shift);
+	WRITE_ONCE(notifier->migrating, NULL);
+
+	if (!ret) {
+		args->p.phys[0] = pfn0;
+		if (page_shift != PAGE_SHIFT) {
+			args->p.addr = map_addr;
+			args->p.page = page_shift;
+			args->p.size = 1UL << page_shift;
+		}
+	}
+
+	mmu_interval_notifier_remove(&notifier->notifier);
+
+	return ret;
+}
+
 static void
 nouveau_svm_fault(struct work_struct *work)
 {
@@ -843,14 +882,26 @@ nouveau_svm_fault(struct work_struct *work)
 		}
 
 		notifier.svmm = svmm;
-		if (atomic)
+		notifier.migrating = NULL;
+		if (atomic) {
 			ret = nouveau_atomic_range_fault(svmm, svm->drm, args,
 							 __struct_size(args),
 							 &notifier);
-		else
+		} else if (nouveau_svm_migrate_on_fault &&
+			   buffer->fault[fi]->access != FAULT_ACCESS_PREFETCH) {
+			/* Fault+migrate in one walk; fall back if nothing migrated. */
+			ret = nouveau_range_fault_and_migrate(svmm, svm->drm,
+							      args, hmm_flags,
+							      &notifier);
+			if (ret)
+				ret = nouveau_range_fault(svmm, svm->drm, args,
+							  __struct_size(args),
+							  hmm_flags, &notifier);
+		} else {
 			ret = nouveau_range_fault(svmm, svm->drm, args,
 						  __struct_size(args),
 						  hmm_flags, &notifier);
+		}
 		mmput(mm);
 
 		limit = args->p.addr + args->p.size;
@@ -934,22 +985,30 @@ nouveau_pfns_free(u64 *pfns)
 	kfree(args);
 }
 
-void
-nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		 unsigned long addr, u64 *pfns, unsigned long npages,
-		 unsigned int page_shift)
+int
+__nouveau_pfns_map_locked(struct nouveau_svmm *svmm, unsigned long addr,
+			  u64 *pfns, unsigned long npages,
+			  unsigned int page_shift)
 {
 	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
 
+	lockdep_assert_held(&svmm->mutex);
+
 	args->p.addr = addr;
 	args->p.size = npages << page_shift;
 	args->p.page = page_shift;
 
-	mutex_lock(&svmm->mutex);
-
-	nvif_object_ioctl(&svmm->vmm->vmm.object, args,
-			  struct_size(args, p.phys, npages), NULL);
+	return nvif_object_ioctl(&svmm->vmm->vmm.object, args,
+				 struct_size(args, p.phys, npages), NULL);
+}
 
+void
+nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
+		 unsigned long addr, u64 *pfns, unsigned long npages,
+		 unsigned int page_shift)
+{
+	mutex_lock(&svmm->mutex);
+	__nouveau_pfns_map_locked(svmm, addr, pfns, npages, page_shift);
 	mutex_unlock(&svmm->mutex);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.h b/drivers/gpu/drm/nouveau/nouveau_svm.h
index 3fd78662f17e..c24b717819a5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.h
@@ -5,6 +5,7 @@
 struct drm_device;
 struct drm_file;
 struct nouveau_drm;
+struct nouveau_svm;
 
 struct nouveau_svmm {
 	struct mmu_notifier notifier;
@@ -35,6 +36,10 @@ void nouveau_pfns_free(u64 *pfns);
 void nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
 		      unsigned long addr, u64 *pfns, unsigned long npages,
 		      unsigned int page_shift);
+int __nouveau_pfns_map_locked(struct nouveau_svmm *svmm, unsigned long addr,
+			      u64 *pfns, unsigned long npages,
+			      unsigned int page_shift);
+void nouveau_svm_fault_replay(struct nouveau_svm *svm);
 #else /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
 static inline void nouveau_svm_init(struct nouveau_drm *drm) {}
 static inline void nouveau_svm_fini(struct nouveau_drm *drm) {}
-- 
2.55.0

