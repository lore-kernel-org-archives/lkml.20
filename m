Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633827;
	b=jajueVygOhsQ5WxFvoFKhyYEvVfy0qDPvJJfV2NKHBb9sCpmTBI9s5ZySEYJc08aHBFa
	 cP0sl4BlDfUBANKVfYbLWJfOqQDdHkBV99U9ikSNziIRXcZsUSqRR2CPVsvKHhzFHPN5G
	 ZJ51wQamacbCPGE6dU2xv/Zzws/OnzZcXKEWErF9D4UHf7YEdXUxYE1DS1lAs1/nDybFk
	 Fj4Z6Qujlpq/D3taQItoM/RG3+k1HhOl7dHvyuHrTNPEwiRz8pkhRRdd+T13MupDMf6iW
	 JCYt3aBTG22vmcqmSRSClKd7bYgndR3NQeGYfAdU3J1GvbgNWorhJypT7DbPXvDocyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6CTI6wZf9fmjJK3hlmivlOQee38QTMnwowyyRsW/zh4=;
	b=fxV5FBbwQ2DXnA14T+aTYktlYTdEjpgK5sImB23Aq+AEVfUnX+t2rO4XOqtjHb+zC7o0
	 g/7r5u9lbtg0X5XlJt+ft2p21ofHxNfB+ETsz8qowCpeUaZ+6uZsbhL+/uj/GiHCE7gUn
	 VT7jCuCEl88quSEXs6uSBxWvqToImWn1LbvnCfZOFBLcVjl7i81s2Hy5zH3dGzv4HVb4j
	 qBayYEiWeB3dMJ05H1G6971+aZ2dJGWZ9G4631T9ukZBfFhZaWGJaLEmGqvhOTzChl6L8
	 xFcVGnSLqD0EgIv3GQd9Dqb3MrHrPPQt2IU8ylAXuMYi/M8xFtdkzd74AXrVYfqqZog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hn2t6mwi;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35E060A6C1A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E35E060A6C1A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hn2t6mwi
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8dd9b9743so38795965ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633826; x=1794238626; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6CTI6wZf9fmjJK3hlmivlOQee38QTMnwowyyRsW/zh4=;
        b=Hn2t6mwiCOCnKJYHbSI4r7YEIwDSLpmn+wdiodbT/07QFRFvMJkMrHiKk4CmStrEA0
         XV84XfE0Ppzrkm3RLpwzLkfwlXdZOODr/P0C900SEGtXO0Tyo2HUnp08E3pz+gUd+18M
         wZU+PIInbM0X7xctljZpdMkDf0gRTxqpf2BWlzRqzXS1ZfGF+UCTsDBz5AGzdOomDShH
         HxenHfUtDSgyBHAEV1k7a6oT+mCT38TZSVD4GLRGQT3hWAUYPRmQWyyW3RQ/4ow/Rv4S
         GUxURDRrKgwtY6zD5OerG4lx3xqNngfAbAnKpsqjE70cooyzL49iLh5K+uzpBfGt0e+7
         I7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633826; x=1794238626;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CTI6wZf9fmjJK3hlmivlOQee38QTMnwowyyRsW/zh4=;
        b=2oRf3NP8rd7jf0m0cqCiqipXMXdqGaQ4jk6IJ4iaEvVjDsrWEDXuLnuKfTZISaZ9B6
         btndL7XwvBQJ+zdptfvBkDwwYC42BgjTyvjGz8feuWjye3D5t7I1w8XdM5XmnqUwenKr
         0iA0kbXHOiBdMO5878RXnw75XUzwBqhmitI+71NzX5p1Jrlo7JiGAyFo1UfcYGZKjTmr
         KnC32YtmCjB+Vrg2epz/0YyN219Qrbrzvc4ep8N2c6BCx9GWVHyIZAAfB7ZTE1MbLdHb
         0Oq9RwSvUd6hUwuBDelc5zKFvBPiWGpiGEwaeFNOcIHa/Y8K+pdMpsY4ZWfDuwfCBByI
         Arrw==
X-Forwarded-Encrypted: i=1; AKwUvBz139PkqdXK2G/0p7xOOWlHTnGbngZe2ItTbVZhDxLzZ2BfxuXIRxSa6jBKQABllamknuyu9sjGM8gXTWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mPdCgetv+8tvKcFe/v//ZJCImy+iVBI4nOr7y3IQA2yMrazVl
	SzaqSGJsKQZBwTB/YgpP47jPrDbShG0q5OzgXK5ukuUbrKdhqUn2zMeiIuibxigU6xeVhULL66w
	F0PFp7dpOYA==
X-Received: from plct12.prod.google.com ([2002:a17:902:d28c:b0:2e5:712c:5c7])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b2b:b0:2e9:60fb:5e2b
 with SMTP id d9443c01a7336-2eb364e5a41mr100336855ad.44.1793633826227; Mon, 02
 Nov 2026 07:37:06 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:35 -0800
In-Reply-To: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102153656.1431701-7-vipinsh@google.com>
Subject: [PATCH v6 06/27] vfio: Add helpers to identify device files that can
 be preserved
From: Vipin Sharma <vipinsh@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rdunlap@infradead.org, rientjes@google.com, 
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, 
	schnelle@linux.ibm.com, skhan@linuxfoundation.org, skhawaja@google.com, 
	vipinsh@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

Add two helpers needed by vfio-pci Live Update support:

1. vfio_file_is_bound_cdev(): checks whether a specific file is a VFIO
   cdev device file that has been bound to an iommufd. Only the bound
   cdev file keeps the device open; the device-level cdev_opened flag
   cannot distinguish between the bound cdev file and a second, unbound
   cdev file opened for the same device.

2. vfio_device_is_noiommu(): move the existing helper out of line and
   export it so vfio-pci can enforce that only devices in no-IOMMU mode
   are preserved across Live Update.

No functional change intended for existing callers.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 drivers/vfio/device_cdev.c | 20 ++++++++++++++++++++
 drivers/vfio/vfio.h        | 10 ----------
 drivers/vfio/vfio_main.c   | 18 ++++++++++++++++++
 include/linux/vfio.h       | 10 ++++++++++
 4 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index 1d9515c967b0..23b229468151 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -200,6 +200,26 @@ void vfio_df_unbind_iommufd(struct vfio_device_file *df)
 	vfio_device_unblock_group(device);
 }
 
+/**
+ * vfio_file_is_bound_cdev - True if the file is a VFIO cdev file bound to an
+ *                           iommufd
+ * @file: File to check
+ *
+ * Return: True if @file is a VFIO cdev device file on which
+ * VFIO_DEVICE_BIND_IOMMUFD has succeeded, false otherwise.
+ */
+bool vfio_file_is_bound_cdev(struct file *file)
+{
+	struct vfio_device_file *df = file->private_data;
+
+	if (file->f_op != &vfio_device_fops)
+		return false;
+
+	/* Paired with smp_store_release() in vfio_df_ioctl_bind_iommufd() */
+	return !df->group && smp_load_acquire(&df->access_granted);
+}
+EXPORT_SYMBOL_GPL(vfio_file_is_bound_cdev);
+
 int vfio_df_ioctl_attach_pt(struct vfio_device_file *df,
 			    struct vfio_device_attach_iommufd_pt __user *arg)
 {
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 7728bc99b63d..12557d45dfee 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -185,16 +185,6 @@ static inline void vfio_group_cleanup(void)
 
 #endif /* CONFIG_VFIO_GROUP */
 
-static inline bool vfio_device_is_noiommu(struct vfio_device *vdev)
-{
-#if IS_ENABLED(CONFIG_VFIO_GROUP)
-	if (vdev->group && vdev->group->type == VFIO_NO_IOMMU)
-		return true;
-#endif
-
-	return IS_ENABLED(CONFIG_IOMMUFD_NOIOMMU) && vdev->noiommu;
-}
-
 #if IS_ENABLED(CONFIG_VFIO_CONTAINER)
 /**
  * struct vfio_iommu_driver_ops - VFIO IOMMU driver callbacks
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 73a5c4f3751c..291460102cd1 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1507,6 +1507,24 @@ struct vfio_device *vfio_device_from_file(struct file *file)
 }
 EXPORT_SYMBOL_GPL(vfio_device_from_file);
 
+/**
+ * vfio_device_is_noiommu - True if the VFIO device is registered in no-IOMMU
+ *                          mode
+ * @vdev: The VFIO device to check
+ *
+ * Return: True if @vdev is registered in no-IOMMU mode, false otherwise.
+ */
+bool vfio_device_is_noiommu(struct vfio_device *vdev)
+{
+#if IS_ENABLED(CONFIG_VFIO_GROUP)
+	if (vdev->group && vdev->group->type == VFIO_NO_IOMMU)
+		return true;
+#endif
+
+	return IS_ENABLED(CONFIG_IOMMUFD_NOIOMMU) && vdev->noiommu;
+}
+EXPORT_SYMBOL_GPL(vfio_device_is_noiommu);
+
 /**
  * vfio_file_is_valid - True if the file is valid vfio file
  * @file: VFIO group file or VFIO device file
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index de3fa6e6bf2a..3cfbf1d73479 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -380,6 +380,7 @@ bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
 void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
 struct vfio_device *vfio_device_from_file(struct file *file);
+bool vfio_device_is_noiommu(struct vfio_device *vdev);
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
 
@@ -431,4 +432,13 @@ int vfio_virqfd_enable(void *opaque, int (*handler)(void *, void *),
 void vfio_virqfd_disable(struct virqfd **pvirqfd);
 void vfio_virqfd_flush_thread(struct virqfd **pvirqfd);
 
+#if IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV)
+bool vfio_file_is_bound_cdev(struct file *file);
+#else
+static inline bool vfio_file_is_bound_cdev(struct file *file)
+{
+	return false;
+}
+#endif /* IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV) */
+
 #endif /* VFIO_H */
-- 
2.56.0.317.g454f8302e1-goog

