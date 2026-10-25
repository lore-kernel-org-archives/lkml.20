Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894797;
	b=XxEQBu9F8qhPOEZ59qEqFnt8bb5ICd43P95FFfqVVCLb3HUINwsgD3UOS+oe6AywC3w1
	 mfqDTiQ6v1gdMdal3apu+R2CfiOMx9gMzhIEcsJ6N0xoSWWu5nseyaFQku7c6kre68iNh
	 gY7hNTli7oqS5x0BkXV+F3HeGwoeE848AcMRnpquc/DUZpcvRXka2apygdlAgI37gG9n7
	 uNN9/aA2D1oCrGxeGUF1aherVJuBPHNhX4hWCP606DCeTtdD5WveZdxS4Gfh00OU3iifm
	 3OchG7I2ZUgTgY6yVzRkNRHv9LgPjHWex3xCT8opVp308SimcogKB32R8Azru3G3Vrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RisrFF04hwyIe3tAIC+08Z8PAu7uAcFhadSZbUURClU=;
	b=4T0TMFIMJOdHndeUjneyf99UusaZ/Kjea/XxlQURJ18wadbrIqo3t5HAAu33Omtf+gO8
	 MDQlw++qEuET5oOebWRkQtPiEcU4sCjc1cIXoGdMpK348AjeiglOamO0fBfY1hynp1F3G
	 kRNrZxKJl950ON2UIME/HoylXb2bNYSAlDm1YRlteSHCXjjb4I8cs1eIxTFQZDPTwvyzj
	 luPwUFf/t21is92Ic/YYdo5Oh7osmFc+5c7Gy5hd9SMFRGx+5MDVb61FmlqpEYJM+OEVa
	 TD/pxsniH8TluWrsUM+L722Wh18zK70QMOSwO0xtJyKbniqjYxA9f9pFjwyf11Zb1hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vHaiECp0;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7598D606D6B5
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7598D606D6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vHaiECp0
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea785a4decso20825155ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792894796; x=1793499596; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RisrFF04hwyIe3tAIC+08Z8PAu7uAcFhadSZbUURClU=;
        b=vHaiECp0gDf+Rb2yySjlW3SHkVbbFpK/ZUrg9jcz6CogZoht7AIvcMs3tluBLn5h1c
         tW2msWCwwFRBS5Q0Cf8A7vJKl54A3t2wPTz+lR3N2dIuNWylxDyVtZCfiN4p8SMTV3N9
         d3YnhIPg3xWD/LRsxHSyPDxENtvcJjCee6XIMnyKqgjv/2ZNJ76QY2B2s/mWGk5hMWmu
         pmBOt+PCey4fvZmL0xz9p5SnsoRaA2o94trbzLUrowmo4xvL6M+MKPRFe6mZR2aj8JY3
         T/pyF7VyS1N99n2+Wxe30rpmkoeBZe4DIsF1obv19Stt/j9nUMZe5C6v9+QlrQVfwgEn
         LlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894796; x=1793499596;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RisrFF04hwyIe3tAIC+08Z8PAu7uAcFhadSZbUURClU=;
        b=rA4JghlqXE6kc1JuIY0DxfWdKYVkhIfdgHqLG/OKA6mZWPJm5k04U2DfiMLSQa0wX2
         371/IiEeH0Qz8RAu9LEFEZF1CH+yqzaYXSDAAaqSnOSHP4YxyypiEpyCwJ0p1MpPIeg7
         dhzTQme0QMCbb8GPRfx6pBTdQN4Q2yk7Y7Vq0+npDuvT1Gu06pcNHlE7aWavBSK8yWm/
         XzhJh72oSayOjG3RvUQhbWd6m0TX916blyDmgSI55pjtBwH6rbTpy4mphl9UPzERbeoy
         ccyHKDDKDMcs30tK/BwhirekWvgYMUCmH9cmNNcvw6vmRDawoOR3eSavMqQzqj5Rwp5l
         Rt7g==
X-Forwarded-Encrypted: i=1; AKwUvBxQb+Ur4aPNfeb0g+cObcL5UotHFFRqFvxQNxDPXbLZGzrOOd1Tz4iUx7z9oB8NGpEk4Tiz9cYW3zKd/p8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0yilKm3VM4hyVw6M8RZ55wob6TWDkqyH3OaOdn8fg7egSeLbZ
	thnOJB2QGMh9Ed2VZm8abAfZacyqR87lN93Z9NKxiziUUgh9gdVvSwOTJi6wR4LjPsJF5628p8C
	fNNO5jjbhhhcDIw==
X-Received: from plge11.prod.google.com ([2002:a17:902:cf4b:b0:2ea:775d:de30])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:c949:b0:2e9:569a:214d with SMTP id d9443c01a7336-2ea9cc866e0mr18938485ad.43.1792894795505;
 Sat, 24 Oct 2026 19:19:55 -0700 (PDT)
Date: Sun, 25 Oct 2026 02:19:27 +0000
In-Reply-To: <20261025021930.674647-1-skhawaja@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261025021930.674647-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261025021930.674647-17-skhawaja@google.com>
Subject: [PATCH v6 16/18] iommufd: Add APIs to preserve/unpreserve a vfio cdev
From: Samiullah Khawaja <skhawaja@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	David Woodhouse <dwmw2@infradead.org>
Cc: Samiullah Khawaja <skhawaja@google.com>, Pranjal Shrivastava <praan@google.com>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Matlack <dmatlack@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vipin Sharma <vipinsh@google.com>, Ankit Soni <Ankit.Soni@amd.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, John Starks <dev@jstarks.net>
Content-Type: text/plain; charset="UTF-8"

Add APIs that can be used to preserve and unpreserve a vfio cdev. Use
the APIs exported by the IOMMU core to preserve/unpreserve device.

The LUO token of the preserved iommufd is fetched and returned back to
the caller as that can be used during restore to get the restored
iommufd.

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 drivers/iommu/iommufd/device.c          | 156 ++++++++++++++++++++++++
 drivers/iommu/iommufd/iommufd_private.h |   6 +
 include/linux/iommufd.h                 |  29 +++++
 3 files changed, 191 insertions(+)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index a664c70a6fe7..c8ea2e288240 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -2,6 +2,7 @@
 /* Copyright (c) 2021-2022, NVIDIA CORPORATION & AFFILIATES
  */
 #include <linux/iommu.h>
+#include <linux/iommu-liveupdate.h>
 #include <linux/iommufd.h>
 #include <linux/pci-ats.h>
 #include <linux/slab.h>
@@ -686,6 +687,10 @@ int iommufd_hw_pagetable_attach(struct iommufd_hw_pagetable *hwpt,
 	int rc;
 
 	mutex_lock(&igroup->lock);
+	if (iommufd_device_is_preserved(idev)) {
+		rc = -EBUSY;
+		goto err_unlock;
+	}
 
 	attach = xa_cmpxchg(&igroup->pasid_attach, pasid, NULL,
 			    XA_ZERO_ENTRY, GFP_KERNEL);
@@ -868,6 +873,10 @@ iommufd_device_do_replace(struct iommufd_device *idev, ioasid_t pasid,
 	int rc;
 
 	mutex_lock(&igroup->lock);
+	if (iommufd_device_is_preserved(idev)) {
+		rc = -EBUSY;
+		goto err_unlock;
+	}
 
 	attach = xa_load(&igroup->pasid_attach, pasid);
 	if (!attach) {
@@ -1747,3 +1756,150 @@ int iommufd_get_hw_info(struct iommufd_ucmd *ucmd)
 	iommufd_put_object(ucmd->ictx, &idev->obj);
 	return rc;
 }
+
+#ifdef CONFIG_IOMMU_LIVEUPDATE
+static bool _iommufd_device_has_pasid_attachments(struct iommufd_device *idev)
+{
+	struct iommufd_group *igroup = idev->igroup;
+	unsigned long start = IOMMU_NO_PASID;
+
+	if (xa_find_after(&igroup->pasid_attach, &start, UINT_MAX, XA_PRESENT))
+		return true;
+
+	return false;
+}
+
+/**
+ * iommufd_device_preserve() - Preserve an iommufd device across live update
+ * @s: Live update session
+ * @idev: Target iommufd device
+ * @iommufd_tokenp: Pointer to store outgoing iommufd token
+ *
+ * Return: 0 on success, or negative error code.
+ */
+int iommufd_device_preserve(struct liveupdate_session *s,
+			    struct iommufd_device *idev,
+			    u64 *iommufd_tokenp)
+{
+	struct iommufd_hwpt_paging *hwpt_paging;
+	struct iommufd_hw_pagetable *hwpt;
+	struct iommufd_attach *attach;
+	struct iommufd_group *igroup;
+	int ret;
+
+	if (!idev)
+		return -EINVAL;
+
+	if (iommufd_device_is_noiommu(idev))
+		return -EOPNOTSUPP;
+
+	igroup = idev->igroup;
+	mutex_lock(&igroup->lock);
+	if (idev->liveupdate_preserved) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	if (_iommufd_device_has_pasid_attachments(idev)) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
+	attach = xa_load(&igroup->pasid_attach, IOMMU_NO_PASID);
+	if (!attach) {
+		ret = -ENOENT;
+		goto out;
+	}
+
+	if (!xa_load(&attach->device_array, idev->obj.id)) {
+		ret = -ENOENT;
+		goto out;
+	}
+
+	hwpt = attach->hwpt;
+	if (!hwpt_is_paging(hwpt)) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
+	hwpt_paging = to_hwpt_paging(hwpt);
+	ret = liveupdate_get_token_outgoing(s, idev->ictx->file, iommufd_tokenp);
+	if (ret)
+		goto out;
+
+	if (!hwpt_paging->liveupdate_preserved) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = iommu_preserve_device(hwpt_paging->common.domain,
+				    idev->dev,
+				    *iommufd_tokenp);
+
+	if (!ret) {
+		igroup->num_liveupdate_preserved++;
+		idev->liveupdate_preserved = true;
+	}
+out:
+	mutex_unlock(&igroup->lock);
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_device_preserve, "IOMMUFD");
+
+/**
+ * iommufd_device_unpreserve() - Unpreserve an iommufd device
+ * @s: Live update session
+ * @idev: Target iommufd device
+ */
+void iommufd_device_unpreserve(struct liveupdate_session *s,
+			       struct iommufd_device *idev)
+{
+	struct iommufd_hwpt_paging *hwpt_paging;
+	struct iommufd_hw_pagetable *hwpt;
+	struct iommufd_attach *attach;
+	struct iommufd_group *igroup;
+
+	if (!idev)
+		return;
+
+	igroup = idev->igroup;
+	mutex_lock(&igroup->lock);
+	if (!idev->liveupdate_preserved)
+		goto out;
+
+	attach = xa_load(&igroup->pasid_attach, IOMMU_NO_PASID);
+	if (!attach) {
+		WARN(1, "IOMMU_NO_PASID attachment not found");
+		goto out;
+	}
+
+	hwpt = attach->hwpt;
+	if (WARN(!hwpt_is_paging(hwpt), "Attached HWPT is not a paging HWPT"))
+		goto out;
+
+	hwpt_paging = to_hwpt_paging(hwpt);
+	if (!hwpt_paging->liveupdate_preserved) {
+		WARN(1, "Attached domain is not preserved");
+		goto out;
+	}
+
+	iommu_unpreserve_device(hwpt_paging->common.domain, idev->dev);
+	igroup->num_liveupdate_preserved--;
+	idev->liveupdate_preserved = false;
+out:
+	mutex_unlock(&igroup->lock);
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_device_unpreserve, "IOMMUFD");
+
+/**
+ * iommufd_device_is_preserved() - Check if an iommufd device is preserved
+ * @idev: Target iommufd device
+ *
+ * Return: true if preserved, false otherwise.
+ */
+bool iommufd_device_is_preserved(struct iommufd_device *idev)
+{
+	return idev && idev->igroup && idev->igroup->num_liveupdate_preserved;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_device_is_preserved, "IOMMUFD");
+#endif
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 69d902b69b82..4760fffd2512 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -507,6 +507,9 @@ struct iommufd_group {
 	struct xarray pasid_attach;
 	struct iommufd_sw_msi_maps required_sw_msi;
 	phys_addr_t sw_msi_start;
+#ifdef CONFIG_IOMMU_LIVEUPDATE
+	int num_liveupdate_preserved;
+#endif
 };
 
 /*
@@ -524,6 +527,9 @@ struct iommufd_device {
 	bool enforce_cache_coherency;
 	struct iommufd_vdevice *vdev;
 	bool destroying;
+#ifdef CONFIG_IOMMU_LIVEUPDATE
+	bool liveupdate_preserved;
+#endif
 };
 
 static inline struct iommufd_device *
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 6e7efe83bc5d..80382aceca18 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -9,6 +9,7 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/iommu.h>
+#include <linux/liveupdate.h>
 #include <linux/refcount.h>
 #include <linux/types.h>
 #include <linux/xarray.h>
@@ -213,6 +214,15 @@ int iommufd_access_rw(struct iommufd_access *access, unsigned long iova,
 int iommufd_vfio_compat_ioas_get_id(struct iommufd_ctx *ictx, u32 *out_ioas_id);
 int iommufd_vfio_compat_ioas_create(struct iommufd_ctx *ictx);
 int iommufd_vfio_compat_set_no_iommu(struct iommufd_ctx *ictx);
+
+#ifdef CONFIG_IOMMU_LIVEUPDATE
+int iommufd_device_preserve(struct liveupdate_session *s,
+			    struct iommufd_device *idev,
+			    u64 *iommufd_tokenp);
+void iommufd_device_unpreserve(struct liveupdate_session *s,
+			       struct iommufd_device *idev);
+bool iommufd_device_is_preserved(struct iommufd_device *idev);
+#endif
 #else /* !CONFIG_IOMMUFD */
 static inline struct iommufd_ctx *iommufd_ctx_from_file(struct file *file)
 {
@@ -397,4 +407,23 @@ static inline void iommufd_viommu_destroy_mmap(struct iommufd_viommu *viommu,
 {
 	_iommufd_destroy_mmap(viommu->ictx, &viommu->obj, offset);
 }
+
+#if !IS_ENABLED(CONFIG_IOMMU_LIVEUPDATE) || !IS_ENABLED(CONFIG_IOMMUFD)
+static inline int iommufd_device_preserve(struct liveupdate_session *s,
+					  struct iommufd_device *idev,
+					  u64 *iommufd_tokenp)
+{
+	return 0;
+}
+
+static inline void iommufd_device_unpreserve(struct liveupdate_session *s,
+					     struct iommufd_device *idev)
+{
+}
+
+static inline bool iommufd_device_is_preserved(struct iommufd_device *idev)
+{
+	return false;
+}
+#endif
 #endif
-- 
2.56.0.257.gf7497c7d27-goog

