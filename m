Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0A1288505
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789951734; cv=none; b=rKlaJWt47bjw8YwW6fT0khpTx/Iqep7+gQEZYpSoWtB3nNaLtGRxijvECDelFVcTyGH6lvccZdLYvZfnGfQZg+e1rL5AoeKX7tRniNUv3JmZIMjbAUKp1+haFVrVUP0nuqaWBYqi9xu336ngj3dJUfmlSw9pHa81vTpf96vIYKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789951734; c=relaxed/simple;
	bh=zjw0Tnp8stathm9nlmJFxU761/AklxkMadgSeSWjsjE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uTQv7eHsLFfYT+dEev3+f9TSVVDwb+v3zWBLXUB2Rf+fsJEmv3rHASx67Nf74r2w/JupOaUkECE6+S6UfoKEcidlxN5JLdwCCWoVw4TP9OtwZd3h26rnPsuYqe4stlCpu2b7xxS4qRj2hM+rvzsROSKt9OtpoUMeYQhpOW4583Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H0Nvy92a; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H0Nvy92a"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d63bad3d09so35784625ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789951731; x=1790556531; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6I3SvizF5qvgyNRrC3PScbaNSFdWu6HfLifwVu0oFvU=;
        b=H0Nvy92aCgW3Sjm5Gl47CQu9WN0/YH/yuDp/IynJv4+mUwUuRUcSu5Mbe7kM2hIeX6
         hDNFYr7iD59hzJEZRCPd6G03iHXbvwAmMyqiNlO/M8RkRkAzJUWvm61vzv5XbZooP81Y
         oHLJR33oavIiCeb3DS+GVVsP5iMuD2snricXhClth6vrO7+7fsksszt9hSeuwwu/c2BM
         3M8fjS3N7tCGDRua5eQayAIqQqOg+OWDgvmpDBX0Eb86ZpUjU6xbjvVHCgRK5IjRTK9g
         L/aBTP2n9y5hZ+jMLyWeZfyEJk1HtsZ0pdrei2e0UFJD3slk0HnH6GIY/tmH/muSdC62
         ZYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789951731; x=1790556531;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6I3SvizF5qvgyNRrC3PScbaNSFdWu6HfLifwVu0oFvU=;
        b=LIRchIkirmh+QxGeQcwYLstZzVQ48Gb/tsTV0oJAkg2qiNeeT1XllzASKaj6ucXy4L
         3BPBYp1RzMba2/PBknHVPhtfWhWbBCkWqoHMEuGmCBkf6wfHADkaj/qr48Lxq3gkGi5i
         /x0QDolH6Xht99l6dsEJiD6He5ftChWUUuGPbW3Um7+s1WWVBfC8FAQ4fHZVGbACoDtv
         rbRF0w9qtCXEJjLUFN5i1nUluk8lbJMZRPjpp7G1RZxXifNRxwBo+YqHbk7eZRGLXe5A
         iumLknUf+6FQS+uOMj6r5M4E18msgPBh2Q8MUmwGMIyYiw919aVVIKX6o8ww028Grqui
         XIrQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9NUTzUgrmmbqAnpBbBwTfZiOefcOrTJdPiYnsDu1fPVhUv7X9+254hHLgAzb7d2dEmvns7DHKO5T6bHg=@vger.kernel.org
X-Gm-Message-State: AFuF++kWsAN40jratP+4CO9g1EEi/3aX8qvhCUjaPCQ/ZxlGt+HrhCrf
	HAr6yxfcBvE09Bl5Pm6OAKsl4NKhFSG78ZYgppUyIpPU/MRuUtEtnVVXWZnOuob9YInU6YloC2i
	Ph+FBl3BCOvHzsQ==
X-Received: from plmm2.prod.google.com ([2002:a17:902:c442:b0:2df:4477:df93])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:bf46:b0:2dd:c100:4b79 with SMTP id d9443c01a7336-2ddc1005efcmr55134685ad.48.1789951730815;
 Sun, 20 Sep 2026 17:48:50 -0700 (PDT)
Date: Mon, 21 Sep 2026 00:48:28 +0000
In-Reply-To: <20260921004834.2601285-1-skhawaja@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921004834.2601285-1-skhawaja@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921004834.2601285-13-skhawaja@google.com>
Subject: [PATCH v5 12/18] iommu/vt-d: Handle reattach of the restored domain
From: Samiullah Khawaja <skhawaja@google.com>
To: David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Samiullah Khawaja <skhawaja@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Matlack <dmatlack@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Pranjal Shrivastava <praan@google.com>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Reattach the restored domain to the preserved device using restored
domain ID. While reattaching do not setup the context and PASID entries
as those are preserved during liveupdate.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 drivers/iommu/intel/iommu.c      |  32 +++++--
 drivers/iommu/intel/iommu.h      |  14 +++
 drivers/iommu/intel/liveupdate.c | 159 +++++++++++++++++++++++++++++++
 3 files changed, 197 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index c5044e834337..6d3cbe0745c9 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -2819,6 +2819,9 @@ static int blocking_domain_attach_dev(struct iommu_domain *domain,
 {
 	struct device_domain_info *info = dev_iommu_priv_get(dev);
 
+	if (dev_iommu_restored_state(dev))
+		return -EBUSY;
+
 	iopf_for_domain_remove(info->domain ? &info->domain->domain : NULL, dev);
 	device_block_translation(dev);
 	return 0;
@@ -3187,6 +3190,9 @@ static int intel_iommu_attach_device(struct iommu_domain *domain,
 {
 	int ret;
 
+	if (dev_iommu_restored_state(dev))
+		return intel_iommu_restore_device(domain, dev);
+
 	device_block_translation(dev);
 
 	ret = paging_domain_compatible(domain, dev);
@@ -3317,7 +3323,8 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
 	info->iommu = iommu;
 	RB_CLEAR_NODE(&info->node);
 	if (dev_is_pci(dev)) {
-		if (ecap_dev_iotlb_support(iommu->ecap) &&
+		if (!dev_iommu_restored_state(dev) &&
+		    ecap_dev_iotlb_support(iommu->ecap) &&
 		    pci_ats_supported(pdev) &&
 		    dmar_ats_supported(pdev, iommu)) {
 			info->ats_supported = 1;
@@ -3421,12 +3428,16 @@ static void intel_iommu_release_device(struct device *dev)
 	struct device_domain_info *info = dev_iommu_priv_get(dev);
 	struct intel_iommu *iommu = info->iommu;
 
-	iommu_disable_pci_pri(info);
-	iommu_disable_pci_ats(info);
+	if (!dev_iommu_restored_state(dev)) {
+		iommu_disable_pci_pri(info);
+		iommu_disable_pci_ats(info);
 
-	if (info->pasid_enabled) {
-		pci_disable_pasid(to_pci_dev(dev));
-		info->pasid_enabled = 0;
+		if (info->pasid_enabled) {
+			pci_disable_pasid(to_pci_dev(dev));
+			info->pasid_enabled = 0;
+		}
+	} else {
+		intel_iommu_detach_restored_device(dev);
 	}
 
 	mutex_lock(&iommu->iopf_lock);
@@ -3434,11 +3445,13 @@ static void intel_iommu_release_device(struct device *dev)
 		device_rbtree_remove(info);
 	mutex_unlock(&iommu->iopf_lock);
 
-	if (sm_supported(iommu) && !dev_is_real_dma_subdevice(dev) &&
+	if (!dev_iommu_restored_state(dev) && sm_supported(iommu) &&
+	    !dev_is_real_dma_subdevice(dev) &&
 	    !context_copied(iommu, info->bus, info->devfn))
 		intel_pasid_teardown_sm_context(dev);
 
-	intel_pasid_free_table(dev);
+	if (!dev_iommu_restored_state(dev))
+		intel_pasid_free_table(dev);
 	intel_iommu_debugfs_remove_dev(info);
 	kfree(info);
 }
@@ -3900,6 +3913,9 @@ static int identity_domain_attach_dev(struct iommu_domain *domain,
 	struct intel_iommu *iommu = info->iommu;
 	int ret;
 
+	if (dev_iommu_restored_state(dev))
+		return -EBUSY;
+
 	device_block_translation(dev);
 
 	if (dev_is_real_dma_subdevice(dev))
diff --git a/drivers/iommu/intel/iommu.h b/drivers/iommu/intel/iommu.h
index 3a2cb08c0ac1..25104644317c 100644
--- a/drivers/iommu/intel/iommu.h
+++ b/drivers/iommu/intel/iommu.h
@@ -1310,6 +1310,9 @@ void intel_iommu_unpreserve(struct iommu_device *iommu,
 void clear_unpreserved_context_entries(struct intel_iommu *iommu);
 void intel_iommu_liveupdate_restore_root_table(struct intel_iommu *iommu,
 					       struct iommu_hw_ser *iommu_ser);
+int intel_iommu_restore_device(struct iommu_domain *domain,
+			       struct device *dev);
+int intel_iommu_detach_restored_device(struct device *dev);
 #else
 static inline void clear_unpreserved_context_entries(struct intel_iommu *iommu)
 {
@@ -1319,6 +1322,17 @@ static inline void intel_iommu_liveupdate_restore_root_table(struct intel_iommu
 							     struct iommu_hw_ser *iommu_ser)
 {
 }
+
+static inline int intel_iommu_restore_device(struct iommu_domain *domain,
+					     struct device *dev)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int intel_iommu_detach_restored_device(struct device *dev)
+{
+	return -EOPNOTSUPP;
+}
 #endif
 
 #ifdef CONFIG_INTEL_IOMMU_SVM
diff --git a/drivers/iommu/intel/liveupdate.c b/drivers/iommu/intel/liveupdate.c
index c9e553379683..6e6707eefc8c 100644
--- a/drivers/iommu/intel/liveupdate.c
+++ b/drivers/iommu/intel/liveupdate.c
@@ -351,6 +351,165 @@ void intel_iommu_liveupdate_restore_root_table(struct intel_iommu *iommu,
 	BUG_ON(iommu_for_each_preserved_device(_restore_used_domain_ids, iommu));
 }
 
+static void domain_detach_reattached_iommu(struct dmar_domain *domain,
+					   struct intel_iommu *iommu)
+{
+	struct iommu_domain_info *info;
+
+	guard(mutex)(&iommu->did_lock);
+	info = xa_load(&domain->iommu_array, iommu->seq_id);
+	if (--info->refcnt == 0) {
+		xa_erase(&domain->iommu_array, iommu->seq_id);
+		kfree(info);
+	}
+}
+
+static int domain_reattach_iommu(struct dmar_domain *domain,
+				 struct intel_iommu *iommu,
+				 struct iommu_device_ser *device_ser)
+{
+	struct iommu_domain_info *info, *curr;
+	struct iommu_domain_ser *domain_ser;
+	struct iommu_hw_ser *iommu_hw_ser;
+	int restored_did;
+	int ret;
+
+	if (!iommu_domain_restored_state(&domain->domain))
+		return -EINVAL;
+
+	if (!device_ser->domain_iommu_ser.domain_phys ||
+	    !device_ser->domain_iommu_ser.iommu_phys)
+		return -EINVAL;
+
+	domain_ser = phys_to_virt(device_ser->domain_iommu_ser.domain_phys);
+	if (domain_ser->restored_domain != &domain->domain)
+		return -EINVAL;
+
+	iommu_hw_ser = phys_to_virt(device_ser->domain_iommu_ser.iommu_phys);
+	if (iommu_hw_ser->type != IOMMU_INTEL ||
+	    iommu_hw_ser->intel.phys_addr != iommu->reg_phys)
+		return -EINVAL;
+
+	restored_did = device_ser->domain_iommu_ser.attachment_id;
+	if (!ida_exists(&iommu->domain_ida, restored_did))
+		return -EINVAL;
+
+	info = kzalloc_obj(*info);
+	if (!info)
+		return -ENOMEM;
+
+	guard(mutex)(&iommu->did_lock);
+	curr = xa_load(&domain->iommu_array, iommu->seq_id);
+	if (curr) {
+		curr->refcnt++;
+		kfree(info);
+		return 0;
+	}
+
+	info->refcnt	= 1;
+	info->did	= restored_did;
+	info->iommu	= iommu;
+	curr = xa_cmpxchg(&domain->iommu_array, iommu->seq_id,
+			  NULL, info, GFP_KERNEL);
+	if (curr) {
+		ret = xa_err(curr) ? : -EBUSY;
+		goto err_unlock;
+	}
+
+	return 0;
+
+err_unlock:
+	kfree(info);
+	return ret;
+}
+
+/**
+ * intel_iommu_restore_device() - Restore device domain attachment after live update
+ * @domain: Restored domain
+ * @dev: Restored device
+ *
+ * Return: 0 on success, or negative error code.
+ */
+int intel_iommu_restore_device(struct iommu_domain *domain,
+			       struct device *dev)
+{
+	struct iommu_device_ser *device_ser = dev_iommu_restored_state(dev);
+	struct device_domain_info *info = dev_iommu_priv_get(dev);
+	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
+	struct intel_iommu *iommu = info->iommu;
+	unsigned long flags;
+	int ret;
+
+	if (!device_ser)
+		return -EINVAL;
+
+	if (dev_is_real_dma_subdevice(dev))
+		return -EOPNOTSUPP;
+
+	ret = domain_reattach_iommu(dmar_domain, iommu, device_ser);
+	if (ret)
+		return ret;
+
+	info->domain = dmar_domain;
+	info->domain_attached = true;
+	spin_lock_irqsave(&dmar_domain->lock, flags);
+	list_add(&info->link, &dmar_domain->devices);
+	spin_unlock_irqrestore(&dmar_domain->lock, flags);
+
+	ret = cache_tag_assign_domain(dmar_domain, dev, IOMMU_NO_PASID);
+	if (ret)
+		goto err;
+
+	ret = iopf_for_domain_set(domain, dev);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	/*
+	 * Detach the restored domain from device and iommu on failure, but keep
+	 * the hardware state intact.
+	 */
+	info->domain_attached = false;
+	cache_tag_unassign_domain(info->domain, dev, IOMMU_NO_PASID);
+	spin_lock_irqsave(&info->domain->lock, flags);
+	list_del(&info->link);
+	spin_unlock_irqrestore(&info->domain->lock, flags);
+
+	domain_detach_reattached_iommu(info->domain, iommu);
+	info->domain = NULL;
+	return ret;
+}
+
+int intel_iommu_detach_restored_device(struct device *dev)
+{
+	struct device_domain_info *info = dev_iommu_priv_get(dev);
+	struct intel_iommu *iommu = info->iommu;
+	struct iommu_domain *domain;
+	unsigned long flags;
+
+	if (!info->domain_attached || !info->domain)
+		return -EINVAL;
+
+	domain = &info->domain->domain;
+	if (!iommu_domain_restored_state(domain))
+		return -EINVAL;
+
+	iopf_for_domain_remove(domain, dev);
+	cache_tag_unassign_domain(info->domain, dev, IOMMU_NO_PASID);
+	info->domain_attached = false;
+
+	spin_lock_irqsave(&info->domain->lock, flags);
+	list_del(&info->link);
+	spin_unlock_irqrestore(&info->domain->lock, flags);
+
+	domain_detach_reattached_iommu(info->domain, iommu);
+	info->domain = NULL;
+
+	return 0;
+}
+
 /**
  * intel_iommu_preserve_device() - Intel IOMMU callback to preserve device state
  * @dev: Target device
-- 
2.55.0.1082.g2b9226bbc0-goog

