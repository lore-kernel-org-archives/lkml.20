Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563443;
	b=0Q9NLObmcwt0SDiyxb7PtkOoF8auyp98I4Q4MmIcQSkaiRjFLvD3P8o8G3sbWFpqq+jU
	 vlmq6t81VGDbxIRMchrYDHxj1rSXMMzNdF/6hIC5+I4EwAPnF5Pr92joKIz039O7maOXA
	 +HWnyru86mSSscSZUoMLz+U6jcCKvaRRRPIkzUxo5XQFS/MBiGwBTm5FWemuZ8kY0FYy7
	 RSclY3YEJN2fciwuDOljKzzvro9MbM/n+Diq9EJ4u/eJ6iTN5NZ5XMWIbgkKeC7vtAFLZ
	 LxaeTOv//F7X2CQyoF9weni/fbThBd9vQg2eUKh4jjZSgf2ljPM7Mf1wyhxDObW0RZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563443;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hHT2umhe5/VsYXvEBOQ+ZmvRrEXfOlaHgHKhtcHGoQU=;
	b=r8zlj4WYb7ahEKJueRZy0LnBVdPhQBhqfBNK+eohFS/09KVtc9Oq2j40jj3jwTKLVXs6
	 6EhZ00cRd4e9DMCKcuSQFMuY8tqfRTpNjDREoaVGXXNJkrO7nusJFskmFaWnGZIAbQZol
	 H6E4fiOrr0AIvrFuP5Fee23sxC7hHBUTAryQ2EoGMKmM6Omc3vskotrhp4j51yKFd+nQd
	 WOtjC1WVAwOT2wpiAFBlGa9yqPXoGAKvKpSl9eYYKDMy319vF8V0ADYoclauNjUYiNkOw
	 a99CUGSaiMerJJi5ypLvAimjYKPzidBop6TIUTYc3+Bztw6xZTnAIxxyLNxDiJ/8nhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=oO+aCfK8;
	arc=none smtp.remote-ip=115.124.30.112
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B63606A88D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4B63606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=oO+aCfK8
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794563435; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=hHT2umhe5/VsYXvEBOQ+ZmvRrEXfOlaHgHKhtcHGoQU=;
	b=oO+aCfK8TswiBukJFuUPcaiUNCTJW9WupwXZAPdazsl7yZwghC+94HxAPOo26ogAJXR4wn7RGn1YP4K43Qog4St3RKFdrztvs9FsdIb2eukhTg1l2xpa3v+/V8NcGGOgaJ1s79UZeS6BXTCtm1ZMgmu+69WNfbHxnXkVf4IvnCk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEefzuT_1794563434;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0XEefzuT_1794563434 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 17:50:34 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: joro@8bytes.org,
	vasant.hegde@amd.com,
	suravee.suthikulpanit@amd.com,
	will@kernel.org,
	robin.murphy@arm.com
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] iommu/amd: Reuse device data for IRTE cache invalidation
Date: Fri, 13 Nov 2026 17:50:17 +0800
Message-ID: <20261113095017.1835921-3-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261113095017.1835921-1-guanghuifeng@linux.alibaba.com>
References: <20261113095017.1835921-1-guanghuifeng@linux.alibaba.com>
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

Switching an interrupt route between guest and remapping modes, changing
IRQ affinity, and enabling or disabling an IRTE all perform a linear
device lookup to invalidate the IRT cache for DMA aliases.  Nested VM
entry and exit can repeat this for every posted interrupt route.
A reported workload with 4334 device entries shows median lookup
latencies of 22-33 us per invocation.

Save the allocation-time device data in struct amd_ir_data and thread it
through all IRTE update paths:

 - modify_irte_ga() and modify_irte() accept a dev_data parameter and
   pass it to iommu_flush_irt_and_complete().

 - The amd_irte_ops callbacks (activate, deactivate, set_affinity) are
   extended to carry dev_data, so amd_ir_update_irte() and the
   irq_remapping activate/deactivate chip callbacks pass the cached
   pointer.

 - amd_iommu_activate_guest_mode() and deactivate_guest_mode() pass
   ir_data->dev_data directly.

 - free_irte() receives dev_data from irq_remapping_free().

 - amd_ir_set_vcpu_affinity() reuses ir_data->dev_data for the vCPU
   affinity capability check.

This eliminates all search_dev_data() list walks from IRTE update
paths.  For non-PCI interrupt sources (IOAPIC, HPET) whose dev_data is
NULL from allocation, iommu_flush_irt_and_complete() skips the DMA
alias walk and invalidates only the single devid, which is correct
because these sources have no DMA aliases.

Device data is retained in the segment list across unplug and reused on
reprobe, so the cached pointer remains valid throughout the IRQ
lifetime.  Continue resolving the PCI device through dev_data->dev so
that later device association is observed.

The invalidation path still skips everything when IRT caching is
disabled and preserves DMA alias invalidation, command ordering,
locking and completion waits when it is enabled.

Fixes: 5aac28784dca ("iommu/amd: Invalidate IRT cache for DMA aliases")
Reported-by: Yifei Ge <geyifei@linux.alibaba.com>
Co-developed-by: hr567 <hr567@linux.alibaba.com>
Signed-off-by: hr567 <hr567@linux.alibaba.com>
Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/amd/amd_iommu_types.h | 10 ++--
 drivers/iommu/amd/iommu.c           | 74 ++++++++++++++++-------------
 2 files changed, 48 insertions(+), 36 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index f98770db0090..da6d90f3a574 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -1029,6 +1029,7 @@ struct irq_2_irte {
 
 struct amd_ir_data {
 	struct amd_iommu *iommu;
+	struct iommu_dev_data *dev_data;
 	struct irq_2_irte irq_2_irte;
 	struct msi_msg msi_entry;
 	void *entry;    /* Pointer to union irte or struct irte_ga */
@@ -1045,9 +1046,12 @@ struct amd_ir_data {
 
 struct amd_irte_ops {
 	void (*prepare)(void *, u32, bool, u8, u32, int);
-	void (*activate)(struct amd_iommu *iommu, void *, u16, u16);
-	void (*deactivate)(struct amd_iommu *iommu, void *, u16, u16);
-	void (*set_affinity)(struct amd_iommu *iommu, void *, u16, u16, u8, u32);
+	void (*activate)(struct amd_iommu *iommu, void *, u16, u16,
+			 struct iommu_dev_data *);
+	void (*deactivate)(struct amd_iommu *iommu, void *, u16, u16,
+			   struct iommu_dev_data *);
+	void (*set_affinity)(struct amd_iommu *iommu, void *, u16, u16, u8,
+			     u32, struct iommu_dev_data *);
 	void *(*get)(struct irq_remap_table *, int);
 	void (*set_allocated)(struct irq_remap_table *, int);
 	bool (*is_allocated)(struct irq_remap_table *, int);
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 8f5a38ae2e29..6876de9cce71 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3291,19 +3291,18 @@ static int iommu_flush_dev_irt(struct pci_dev *unused, u16 devid, void *data)
 	return ret;
 }
 
-static void iommu_flush_irt_and_complete(struct amd_iommu *iommu, u16 devid)
+static void iommu_flush_irt_and_complete(struct amd_iommu *iommu, u16 devid,
+					 struct iommu_dev_data *dev_data)
 {
 	int ret;
 	u64 data;
 	unsigned long flags;
 	struct iommu_cmd cmd;
 	struct pci_dev *pdev = NULL;
-	struct iommu_dev_data *dev_data;
 
 	if (iommu->irtcachedis_enabled)
 		return;
 
-	dev_data = search_dev_data(iommu, devid);
 	if (dev_data && dev_data->dev && dev_is_pci(dev_data->dev))
 		pdev = to_pci_dev(dev_data->dev);
 
@@ -3579,7 +3578,7 @@ static int __modify_irte_ga(struct amd_iommu *iommu, u16 devid, int index,
 }
 
 static int modify_irte_ga(struct amd_iommu *iommu, u16 devid, int index,
-			  struct irte_ga *irte)
+			  struct irte_ga *irte, struct iommu_dev_data *dev_data)
 {
 	int ret;
 
@@ -3587,13 +3586,13 @@ static int modify_irte_ga(struct amd_iommu *iommu, u16 devid, int index,
 	if (ret)
 		return ret;
 
-	iommu_flush_irt_and_complete(iommu, devid);
+	iommu_flush_irt_and_complete(iommu, devid, dev_data);
 
 	return 0;
 }
 
-static int modify_irte(struct amd_iommu *iommu,
-		       u16 devid, int index, union irte *irte)
+static int modify_irte(struct amd_iommu *iommu, u16 devid, int index,
+		       union irte *irte, struct iommu_dev_data *dev_data)
 {
 	struct irq_remap_table *table;
 	unsigned long flags;
@@ -3606,12 +3605,13 @@ static int modify_irte(struct amd_iommu *iommu,
 	table->table[index] = irte->val;
 	raw_spin_unlock_irqrestore(&table->lock, flags);
 
-	iommu_flush_irt_and_complete(iommu, devid);
+	iommu_flush_irt_and_complete(iommu, devid, dev_data);
 
 	return 0;
 }
 
-static void free_irte(struct amd_iommu *iommu, u16 devid, int index)
+static void free_irte(struct amd_iommu *iommu, u16 devid, int index,
+		      struct iommu_dev_data *dev_data)
 {
 	struct irq_remap_table *table;
 	unsigned long flags;
@@ -3624,7 +3624,7 @@ static void free_irte(struct amd_iommu *iommu, u16 devid, int index)
 	iommu->irte_ops->clear_allocated(table, index);
 	raw_spin_unlock_irqrestore(&table->lock, flags);
 
-	iommu_flush_irt_and_complete(iommu, devid);
+	iommu_flush_irt_and_complete(iommu, devid, dev_data);
 }
 
 static void irte_prepare(void *entry,
@@ -3657,50 +3657,57 @@ static void irte_ga_prepare(void *entry,
 	irte->lo.fields_remap.valid       = 1;
 }
 
-static void irte_activate(struct amd_iommu *iommu, void *entry, u16 devid, u16 index)
+static void irte_activate(struct amd_iommu *iommu, void *entry, u16 devid,
+			  u16 index, struct iommu_dev_data *dev_data)
 {
 	union irte *irte = (union irte *) entry;
 
 	irte->fields.valid = 1;
-	modify_irte(iommu, devid, index, irte);
+	modify_irte(iommu, devid, index, irte, dev_data);
 }
 
-static void irte_ga_activate(struct amd_iommu *iommu, void *entry, u16 devid, u16 index)
+static void irte_ga_activate(struct amd_iommu *iommu, void *entry, u16 devid,
+			     u16 index, struct iommu_dev_data *dev_data)
 {
 	struct irte_ga *irte = (struct irte_ga *) entry;
 
 	irte->lo.fields_remap.valid = 1;
-	modify_irte_ga(iommu, devid, index, irte);
+	modify_irte_ga(iommu, devid, index, irte, dev_data);
 }
 
-static void irte_deactivate(struct amd_iommu *iommu, void *entry, u16 devid, u16 index)
+static void irte_deactivate(struct amd_iommu *iommu, void *entry, u16 devid,
+			    u16 index, struct iommu_dev_data *dev_data)
 {
 	union irte *irte = (union irte *) entry;
 
 	irte->fields.valid = 0;
-	modify_irte(iommu, devid, index, irte);
+	modify_irte(iommu, devid, index, irte, dev_data);
 }
 
-static void irte_ga_deactivate(struct amd_iommu *iommu, void *entry, u16 devid, u16 index)
+static void irte_ga_deactivate(struct amd_iommu *iommu, void *entry, u16 devid,
+			       u16 index, struct iommu_dev_data *dev_data)
 {
 	struct irte_ga *irte = (struct irte_ga *) entry;
 
 	irte->lo.fields_remap.valid = 0;
-	modify_irte_ga(iommu, devid, index, irte);
+	modify_irte_ga(iommu, devid, index, irte, dev_data);
 }
 
-static void irte_set_affinity(struct amd_iommu *iommu, void *entry, u16 devid, u16 index,
-			      u8 vector, u32 dest_apicid)
+static void irte_set_affinity(struct amd_iommu *iommu, void *entry, u16 devid,
+			      u16 index, u8 vector, u32 dest_apicid,
+			      struct iommu_dev_data *dev_data)
 {
 	union irte *irte = (union irte *) entry;
 
 	irte->fields.vector = vector;
 	irte->fields.destination = dest_apicid;
-	modify_irte(iommu, devid, index, irte);
+	modify_irte(iommu, devid, index, irte, dev_data);
 }
 
-static void irte_ga_set_affinity(struct amd_iommu *iommu, void *entry, u16 devid, u16 index,
-				 u8 vector, u32 dest_apicid)
+static void irte_ga_set_affinity(struct amd_iommu *iommu, void *entry,
+				 u16 devid, u16 index, u8 vector,
+				 u32 dest_apicid,
+				 struct iommu_dev_data *dev_data)
 {
 	struct irte_ga *irte = (struct irte_ga *) entry;
 
@@ -3710,7 +3717,7 @@ static void irte_ga_set_affinity(struct amd_iommu *iommu, void *entry, u16 devid
 					APICID_TO_IRTE_DEST_LO(dest_apicid);
 		irte->hi.fields.destination =
 					APICID_TO_IRTE_DEST_HI(dest_apicid);
-		modify_irte_ga(iommu, devid, index, irte);
+		modify_irte_ga(iommu, devid, index, irte, dev_data);
 	}
 }
 
@@ -3946,6 +3953,7 @@ static int irq_remapping_alloc(struct irq_domain *domain, unsigned int virq,
 		}
 
 		data->iommu = iommu;
+		data->dev_data = dev_data;
 		irq_data->hwirq = (devid << 16) + i;
 		irq_data->chip_data = data;
 		irq_data->chip = &amd_ir_chip;
@@ -3964,7 +3972,7 @@ static int irq_remapping_alloc(struct irq_domain *domain, unsigned int virq,
 		}
 	}
 	for (i = 0; i < nr_irqs; i++)
-		free_irte(iommu, devid, index + i);
+		free_irte(iommu, devid, index + i, dev_data);
 out_free_parent:
 	irq_domain_free_irqs_common(domain, virq, nr_irqs);
 	return ret;
@@ -3983,7 +3991,8 @@ static void irq_remapping_free(struct irq_domain *domain, unsigned int virq,
 		if (irq_data && irq_data->chip_data) {
 			data = irq_data->chip_data;
 			irte_info = &data->irq_2_irte;
-			free_irte(data->iommu, irte_info->devid, irte_info->index);
+			free_irte(data->iommu, irte_info->devid,
+				  irte_info->index, data->dev_data);
 			kfree(data->entry);
 			kfree(data);
 		}
@@ -4008,7 +4017,7 @@ static int irq_remapping_activate(struct irq_domain *domain,
 		return 0;
 
 	iommu->irte_ops->activate(iommu, data->entry, irte_info->devid,
-				  irte_info->index);
+				  irte_info->index, data->dev_data);
 	amd_ir_update_irte(irq_data, iommu, data, irte_info, cfg);
 	return 0;
 }
@@ -4022,7 +4031,7 @@ static void irq_remapping_deactivate(struct irq_domain *domain,
 
 	if (iommu)
 		iommu->irte_ops->deactivate(iommu, data->entry, irte_info->devid,
-					    irte_info->index);
+					    irte_info->index, data->dev_data);
 }
 
 static int irq_remapping_select(struct irq_domain *d, struct irq_fwspec *fwspec,
@@ -4134,7 +4143,7 @@ int amd_iommu_activate_guest_mode(void *data, int cpu, bool ga_log_intr)
 	__amd_iommu_update_ga(entry, cpu, ga_log_intr);
 
 	return modify_irte_ga(ir_data->iommu, ir_data->irq_2_irte.devid,
-			      ir_data->irq_2_irte.index, entry);
+			      ir_data->irq_2_irte.index, entry, ir_data->dev_data);
 }
 EXPORT_SYMBOL(amd_iommu_activate_guest_mode);
 
@@ -4166,7 +4175,7 @@ int amd_iommu_deactivate_guest_mode(void *data)
 				APICID_TO_IRTE_DEST_HI(cfg->dest_apicid);
 
 	return modify_irte_ga(ir_data->iommu, ir_data->irq_2_irte.devid,
-			      ir_data->irq_2_irte.index, entry);
+			      ir_data->irq_2_irte.index, entry, ir_data->dev_data);
 }
 EXPORT_SYMBOL(amd_iommu_deactivate_guest_mode);
 
@@ -4175,7 +4184,6 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *info)
 	int ret;
 	struct amd_iommu_pi_data *pi_data = info;
 	struct amd_ir_data *ir_data = data->chip_data;
-	struct irq_2_irte *irte_info = &ir_data->irq_2_irte;
 	struct iommu_dev_data *dev_data;
 
 	if (WARN_ON_ONCE(!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir)))
@@ -4184,7 +4192,7 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *info)
 	if (ir_data->iommu == NULL)
 		return -EINVAL;
 
-	dev_data = search_dev_data(ir_data->iommu, irte_info->devid);
+	dev_data = ir_data->dev_data;
 
 	/* Note:
 	 * This device has never been set up for guest mode.
@@ -4226,7 +4234,7 @@ static void amd_ir_update_irte(struct irq_data *irqd, struct amd_iommu *iommu,
 	 */
 	iommu->irte_ops->set_affinity(iommu, ir_data->entry, irte_info->devid,
 				      irte_info->index, cfg->vector,
-				      cfg->dest_apicid);
+				      cfg->dest_apicid, ir_data->dev_data);
 }
 
 static int amd_ir_set_affinity(struct irq_data *data,
-- 
2.43.7

