Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894789;
	b=hwINrSAKeMz2xOJ6aXxSztNbrSbL86179JzxbTB+H0x8YtKleJMRGBzq76Et5MWiQ+ll
	 w6SfKLjzblwY3soz8LJvXmG8IxdUwghJMFI1RPvlOJ3DhZBoQhyE9lX+iJX1dq43y29G2
	 tLFmrGF6RQwaflOhNcUUNSdvdt3VqrQCzYRL+KnMFHCyAho8XEyGa9hCPNdvoJ5h/7Fk7
	 8khSDY7haqSePJ7GMHXM/G/BLO9lVlhizCXt6ru+gxCJoGh8D0aPdyaAPcHhgTi7k5k+u
	 OyeGZ8FAFpB1UWeT1msED+sNO508eO5FPFH4DWyuba2IaO+68ZURK4GQ7DkjIuxfbig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=boNtUF4+mpdvOPsdg7jeCqJoiMH2+HIl/J9lg6nOjUo=;
	b=cKU26JF8Hfaiu9Y42VhW66vFqHcwTO48tJcbtYJultKS9GiWE9btqBnEYyoYni+h0+eM
	 WdELeS0FeRmq7Nw8Cf0SXiLVryW0SxDC2LbS8Kc4vJGq3mD+yQ0Gx/TEbLlFoeUkgvKiq
	 hA4xxa3tVFSNeR2x373qVf1N8anLRvD7wuEb/GUA1/wH4CYmvkYov0A5wQpq2vsBvzc+I
	 6nC1VI85CniqijDljP0P0DbxjsE9UFEubYyQcJOUlMphHYupBFWVfj+A8n5Evk4ltnOnT
	 +I+Qpb/YOPI/m+oJOuQm7jIvYFN+6/BzSBXhG+hdbRPq21yxG/uuKypO/sncizd+q5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WHLueoUZ;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A9D606A9A5
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A9D606A9A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WHLueoUZ
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e942b1cc86so21876435ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792894789; x=1793499589; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=boNtUF4+mpdvOPsdg7jeCqJoiMH2+HIl/J9lg6nOjUo=;
        b=WHLueoUZZtpXVwK89GzWEr3CRVQMNkQPBywQh4yNWnUvXwJYKPrF/2u/hXgVOaTFDz
         Q0ROy89BUKq6lLk9C/k5yC+3gEsNTQuRBPgHGycw4s7QV1llaWiNtzZQ3ymLf93tO6JW
         +UeIJE9dk2sZ63cKPpOhyjDE6TyVv/sVYSHj5dKCAqiTmhH/Ncax7UB6Sw1zM/ojPl6d
         KoH/z3svWkbKT6qJz5xFoOaW41EAHCVHDWuaFAB1c0qrfhp380nyf5Q3vv5Qyy1sERit
         69GBL0DI4SaEp8aSH3hHP1OgVtUcsyqs75NvXy4NRUvYfJB0kKheS6z5ot68c4zXnM4k
         AVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894789; x=1793499589;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=boNtUF4+mpdvOPsdg7jeCqJoiMH2+HIl/J9lg6nOjUo=;
        b=GS1kkIYc0M+bUJbxuvS9YUdPOtYFkhCJ1dd2VVdux+YWUPSZ80F3QBUvBwgERPQe2J
         m2HljSfSr0oKXkvJc93gB8KnD8M8AA49QwJ++sBrtvXJWG6L+2VRfMEZQakDvwKvl0PX
         u8UlJtyl/mC1EiceNvOujNP3RLS8B70v515AsUhfK3sXc5AUjFSXH4ia4feHsXjXZdpp
         5n0c8YoAaBn08TBtNWW1VgF+Mp88CnOxXdJbwuJwhH/sbv1VRyENzwd2ECjc2dVxfhFQ
         HD7lRpGZqKd2NDQFlFfrrdmX3yplM17ld00urttIxl50rpics+pHlUku05nQguSV9u/g
         +S8A==
X-Forwarded-Encrypted: i=1; AKwUvBxlwRFGKQxDUpo6OglOWqeKqvIYcdXv3RBeqpMVpK0MhkMLNhBuodpEhWMWjCjC14dJymsBYpWi/IcofPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGAzkeBpqcMxEmjA8exqwIdlG8V6G5XsVK7lvAWLcfiYZeXkFf
	2r8o24mgqt+v6RzcEkxdqnoMmO+RelImNy+K+Rf9e6CBDDxd+apmbymDxiqU//IkpP39xtuZRwO
	+GmeMcYIkNpxVNg==
X-Received: from pllx15.prod.google.com ([2002:a17:902:7c0f:b0:2e9:5595:2e3a])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:fa8:b0:2e8:3d48:4d80 with SMTP id d9443c01a7336-2ea9c695516mr24719045ad.45.1792894788947;
 Sat, 24 Oct 2026 19:19:48 -0700 (PDT)
Date: Sun, 25 Oct 2026 02:19:22 +0000
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
Message-ID: <20261025021930.674647-12-skhawaja@google.com>
Subject: [PATCH v6 11/18] iommu/vt-d: Preserve PASID table of preserved device
From: Samiullah Khawaja <skhawaja@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	David Woodhouse <dwmw2@infradead.org>
Cc: Samiullah Khawaja <skhawaja@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Matlack <dmatlack@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Pranjal Shrivastava <praan@google.com>, Vipin Sharma <vipinsh@google.com>, Ankit Soni <Ankit.Soni@amd.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, John Starks <dev@jstarks.net>
Content-Type: text/plain; charset="UTF-8"

In scalable mode the PASID table is used to fetch the io page tables.
Preserve and restore the PASID table of the preserved devices.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 drivers/iommu/intel/iommu.c      |   3 +-
 drivers/iommu/intel/liveupdate.c | 144 +++++++++++++++++++++++++++++--
 drivers/iommu/intel/pasid.c      |  10 ++-
 drivers/iommu/intel/pasid.h      |   8 ++
 include/linux/kho/abi/iommu.h    |  19 ++++
 5 files changed, 176 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 991ad9b2456e..ecec057f78dd 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3473,7 +3473,8 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
 			goto clear_rbtree;
 		}
 
-		if (!context_copied(iommu, info->bus, info->devfn)) {
+		if (!context_copied(iommu, info->bus, info->devfn) &&
+		    !dev_iommu_restored_state(dev)) {
 			ret = intel_pasid_setup_sm_context(dev);
 			if (ret)
 				goto free_table;
diff --git a/drivers/iommu/intel/liveupdate.c b/drivers/iommu/intel/liveupdate.c
index cf98b95bf8d2..36816d3651e6 100644
--- a/drivers/iommu/intel/liveupdate.c
+++ b/drivers/iommu/intel/liveupdate.c
@@ -14,6 +14,7 @@
 #include <linux/pci.h>
 
 #include "iommu.h"
+#include "pasid.h"
 #include "../iommu-pages.h"
 
 /* 2 tables per bus in scalable mode with upper table at odd bit */
@@ -393,6 +394,69 @@ void intel_iommu_handle_drhd_restore_failure(struct intel_iommu *iommu)
 		      iommu->name);
 }
 
+enum pasid_lu_op {
+	PASID_LU_OP_PRESERVE = 1,
+	PASID_LU_OP_UNPRESERVE,
+	PASID_LU_OP_RESTORE,
+};
+
+static int pasid_lu_do_op(void *table, enum pasid_lu_op op)
+{
+	int ret = 0;
+
+	switch (op) {
+	case PASID_LU_OP_PRESERVE:
+		ret = iommu_preserve_pages(table);
+		break;
+	case PASID_LU_OP_UNPRESERVE:
+		iommu_unpreserve_pages(table);
+		break;
+	case PASID_LU_OP_RESTORE:
+		iommu_restore_pages(virt_to_phys(table));
+		break;
+	}
+
+	return ret;
+}
+
+static int pasid_lu_handle_pd(struct pasid_dir_entry *dir,
+			      u32 max_pasid, enum pasid_lu_op op)
+{
+	int max_pde = max_pasid >> PASID_PDE_SHIFT;
+	struct pasid_entry *table;
+	int i, ret;
+
+	for (i = 0; i < max_pde; i++) {
+		table = get_pasid_table_from_pde(&dir[i]);
+		if (!table)
+			continue;
+
+		ret = pasid_lu_do_op(table, op);
+		if (ret)
+			goto err;
+	}
+
+	ret = pasid_lu_do_op(dir, op);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	if (op != PASID_LU_OP_PRESERVE)
+		return ret;
+
+	while (i > 0) {
+		table = get_pasid_table_from_pde(&dir[--i]);
+		if (!table)
+			continue;
+
+		pasid_lu_do_op(table, PASID_LU_OP_UNPRESERVE);
+	}
+
+	return ret;
+}
+
 /**
  * intel_iommu_preserve_device() - Intel IOMMU callback to preserve device state
  * @dev: Target device
@@ -404,6 +468,7 @@ int intel_iommu_preserve_device(struct device *dev,
 				struct iommu_device_ser *device_ser)
 {
 	struct device_domain_info *info = dev_iommu_priv_get(dev);
+	struct pasid_table *pasid_table;
 	int ret;
 
 	if (!dev_is_pci(dev)) {
@@ -434,6 +499,22 @@ int intel_iommu_preserve_device(struct device *dev,
 
 	device_ser->attachment.attachment_id = domain_id_iommu(info->domain,
 							       info->iommu);
+
+	if (!sm_supported(info->iommu))
+		return 0;
+
+	pasid_table = intel_pasid_get_table(dev);
+	if (!pasid_table)
+		return -EINVAL;
+
+	ret = pasid_lu_handle_pd(pasid_table->table,
+				 pasid_table->max_pasid,
+				 PASID_LU_OP_PRESERVE);
+	if (ret)
+		return ret;
+
+	device_ser->intel.pasid_table = virt_to_phys(pasid_table->table);
+	device_ser->intel.max_pasid = pasid_table->max_pasid;
 	return 0;
 }
 
@@ -445,15 +526,33 @@ int intel_iommu_preserve_device(struct device *dev,
 void intel_iommu_unpreserve_device(struct device *dev,
 				   struct iommu_device_ser *device_ser)
 {
+	struct device_domain_info *info = dev_iommu_priv_get(dev);
+	struct pasid_table *pasid_table;
+
+	if (!dev_is_pci(dev))
+		return;
+
+	if (!info)
+		return;
+
+	if (!sm_supported(info->iommu))
+		return;
+
 	/*
 	 * The context tables preserved during device preservation, in the
 	 * preserve_device() callback, might be shared with other devices, so
-	 * those are unpreserved in the iommu unpreserve() callback. So this
-	 * callback is kept empty.
-	 *
-	 * Once device PASID tables are preserved, the unpreservation of PASID
-	 * tables will be added here.
+	 * those are unpreserved in the iommu unpreserve() callback.
 	 */
+	if (!device_ser->intel.pasid_table)
+		return;
+
+	pasid_table = intel_pasid_get_table(dev);
+	if (!pasid_table)
+		return;
+
+	pasid_lu_handle_pd(pasid_table->table,
+			   pasid_table->max_pasid,
+			   PASID_LU_OP_UNPRESERVE);
 }
 
 /**
@@ -499,3 +598,38 @@ void intel_iommu_unpreserve(struct iommu_device *iommu_dev,
 	unpreserve_iommu_context_tables(iommu, ser);
 	iommu_unpreserve_pages(iommu->root_entry);
 }
+
+/**
+ * intel_pasid_restore_table() - Restore preserved PASID table for a device
+ * @dev: Restored device
+ * @max_pasid: Maximum supported PASID
+ *
+ * Return: Pointer to restored PASID table directory, or NULL if not preserved.
+ */
+void *intel_pasid_restore_table(struct device *dev, u64 max_pasid)
+{
+	struct iommu_device_ser *ser = dev_iommu_restored_state(dev);
+
+	if (!ser || !ser->intel.pasid_table)
+		return NULL;
+
+	/*
+	 * MAX PASID of a device should not change as it is read from
+	 * capabilities.
+	 */
+	if (ser->intel.max_pasid != max_pasid)
+		panic("%s: preserved max PASID %llu does not match %llu\n",
+		      dev_name(dev), ser->intel.max_pasid, max_pasid);
+
+	if (ser->intel.restored)
+		goto out;
+
+	if (pasid_lu_handle_pd(phys_to_virt(ser->intel.pasid_table),
+			       ser->intel.max_pasid, PASID_LU_OP_RESTORE))
+		panic("%s: failed to restore preserved PASID table\n",
+		      dev_name(dev));
+	ser->intel.restored = 1;
+
+out:
+	return phys_to_virt(ser->intel.pasid_table);
+}
diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
index e4f24d3f19a6..59cc69383799 100644
--- a/drivers/iommu/intel/pasid.c
+++ b/drivers/iommu/intel/pasid.c
@@ -13,6 +13,7 @@
 #include <linux/cpufeature.h>
 #include <linux/dmar.h>
 #include <linux/iommu.h>
+#include <linux/iommu-liveupdate.h>
 #include <linux/memory.h>
 #include <linux/pci.h>
 #include <linux/pci-ats.h>
@@ -60,8 +61,13 @@ int intel_pasid_alloc_table(struct device *dev)
 
 	size = max_pasid >> (PASID_PDE_SHIFT - 3);
 	order = size ? get_order(size) : 0;
-	dir = iommu_alloc_pages_node_sz(info->iommu->node, GFP_KERNEL,
-					1 << (order + PAGE_SHIFT));
+
+	max_pasid = 1 << (order + PAGE_SHIFT + 3);
+	if (dev_iommu_restored_state(dev))
+		dir = intel_pasid_restore_table(dev, max_pasid);
+	else
+		dir = iommu_alloc_pages_node_sz(info->iommu->node, GFP_KERNEL,
+						1 << (order + PAGE_SHIFT));
 	if (!dir) {
 		kfree(pasid_table);
 		return -ENOMEM;
diff --git a/drivers/iommu/intel/pasid.h b/drivers/iommu/intel/pasid.h
index 48d3bb6b68de..801768cdea16 100644
--- a/drivers/iommu/intel/pasid.h
+++ b/drivers/iommu/intel/pasid.h
@@ -301,6 +301,14 @@ static inline void pasid_set_eafe(struct pasid_entry *pe)
 
 extern unsigned int intel_pasid_max_id;
 int intel_pasid_alloc_table(struct device *dev);
+#ifdef CONFIG_IOMMU_LIVEUPDATE
+void *intel_pasid_restore_table(struct device *dev, u64 max_pasid);
+#else
+static inline void *intel_pasid_restore_table(struct device *dev, u64 max_pasid)
+{
+	return NULL;
+}
+#endif
 void intel_pasid_free_table(struct device *dev);
 struct pasid_table *intel_pasid_get_table(struct device *dev);
 int intel_pasid_setup_first_level(struct intel_iommu *iommu, struct device *dev,
diff --git a/include/linux/kho/abi/iommu.h b/include/linux/kho/abi/iommu.h
index 95354a12ba1d..08443f6cee6f 100644
--- a/include/linux/kho/abi/iommu.h
+++ b/include/linux/kho/abi/iommu.h
@@ -137,6 +137,21 @@ struct iommu_attachment_ser {
 	u32 padding;
 } __packed;
 
+/**
+ * struct iommu_device_intel_ser - Intel specific state of serialized device
+ * @features: Bitmask of Intel device specific features
+ * @restored: Whether the device state is restored
+ * @pasid_table: Physical address of pasid table
+ * @max_pasid: Maximum supported pasid
+ */
+struct iommu_device_intel_ser {
+	u32 features;
+	u8 restored;
+	u8 padding[3];
+	u64 pasid_table;
+	u64 max_pasid;
+} __packed;
+
 /**
  * struct iommu_device_ser - Serialized state of a device
  * @hdr: Common object header
@@ -146,6 +161,7 @@ struct iommu_attachment_ser {
  * @iommu_phys: Physical address of the serialized IOMMU the device is behind
  * @attachment: Attachment of the device to its domain
  * @reserved: Reserved for future common fields.
+ * @intel: Intel specific serialization data
  */
 struct iommu_device_ser {
 	struct iommu_hdr_ser hdr;
@@ -155,6 +171,9 @@ struct iommu_device_ser {
 	u64 iommu_phys;
 	struct iommu_attachment_ser attachment;
 	u64 reserved[2];
+	union {
+		struct iommu_device_intel_ser intel;
+	};
 } __packed;
 
 /* There are maximum 256 buses, so maximum 512 context tables */
-- 
2.56.0.257.gf7497c7d27-goog

