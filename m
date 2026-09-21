Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6282E2286
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789951735; cv=none; b=sJfciU8VpFxyHkWQcl5FgQzXZ5KjhflDNyp5M9xLuKxYSvr15XOblRilfk8XkhBQj65snX4ag21UcX/bvIU8LYmd69beXMMoNZN74LrGrReBl9mZZoHnfuE3PkTkjQZz/8jPliQJjCA5ISHQ9kNbBDcjGbXIhtJPZGiap/taE08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789951735; c=relaxed/simple;
	bh=Jv3iaex2JDtz3JgCAWlDmzXnCKQbniBZ71nQTC+bZ58=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hQ3CHT4VwVFGwY+Gt0hUBraw3ZBuv3yv8UiFixvtQlSL9aYnEn2JBOCIqUQXoKoNDpO7Be7qiG9Poe6cRnwSjSBo68Rdnea3jtVQX1EyZmU1BU25x+Y67pdLmT5ikhk1vjABKJLPcHGJ5edTYCRS30MiGA9k6NOUHQFGOstyuYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DzxwO3rs; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DzxwO3rs"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d9336581a2so45130675ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789951728; x=1790556528; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O5GxCZRn4tT/d2wdhRXzFHtH06EaWqTlMJbz+k/JmSo=;
        b=DzxwO3rs6fhBr2yKVbA5p9nNg6+NnQiBxtZz4w7ewqVc43Y9+Q67zU8cVgJpHaPtbS
         3iQ9YyL6ZCUd/fNkwB2/SlbSFxWGTeuwnM+88nrQpgZ6hWpazDdSpl4Wy/rkEoNik0yn
         WYvyoW0ykthCbjuDDUJS2Rbjte1Ma/HV3ykOVmWOBAnD9/wsFQBF573Eaqbtj8QVUvpg
         xpWccbdG/1D7ItdY7WkZJKPXxuNtnF/xBDwdL50z4UKFoaX9XiR66RuvQgXTMM2KVGxN
         C3gm8WGA+DSn5YlgqgT2sG92cQhmnarCatRtFD404bHGHalN6Ix7encUsvC5MM0NkBMR
         5hvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789951728; x=1790556528;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5GxCZRn4tT/d2wdhRXzFHtH06EaWqTlMJbz+k/JmSo=;
        b=SKXyUjtp4O1tBc53njp7xJgL2JqvvRfiuxS9GdpYykH1eLwYd9eFcSpsHc/7mWW8qu
         jbft3+2QFq18aptX8pZsUE/g6yrW8e2a6M70MVSlrRoAuz3Kxc4txdjeLLbYJyYytx+/
         WS/+OsB27Wk0Mxh6qsKAU2FvbqTqLHvIBipxe7juzEWrtJtdtFDunsI/x2uJVpi+CMOu
         E/2rSFOpMhzbhGfIfobMVl1m+likGUN1f32Ju+OwFsT9yAW684yAfJwYcdMqClnG3ltf
         COC5lTX5YbMRMUmpvg7I4kYrJ06pLQiRJ0vh9qDDNrMZM1/aSB8q1tmXG4I4geKGDvwN
         hjAg==
X-Forwarded-Encrypted: i=1; AKwUvBwPEWKZ2j7vIetehohkkLiJfJb5PsuLnt583y+T9DvhjEMgGKCc3XLoXKzecO93PSWWAFki7Kwe3IH/4QA=@vger.kernel.org
X-Gm-Message-State: AFuF++mVPS4HA3q1ShEAlJA2NJb48iEQuhR+p24qLoc1k11q7adRXc8i
	ofapfRPewAfkWK8Aescw+4Qdc/2kiozJ1OcQHt6uHoorRDEgvQk0KOfis54u2j1yM9raffkNsJa
	SwvhPsdK/TX3jHQ==
X-Received: from plas21.prod.google.com ([2002:a17:903:2015:b0:2df:4d76:bbc7])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:22cc:b0:2df:425b:3082 with SMTP id d9443c01a7336-2df425b3273mr28931155ad.57.1789951728436;
 Sun, 20 Sep 2026 17:48:48 -0700 (PDT)
Date: Mon, 21 Sep 2026 00:48:25 +0000
In-Reply-To: <20260921004834.2601285-1-skhawaja@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921004834.2601285-1-skhawaja@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921004834.2601285-10-skhawaja@google.com>
Subject: [PATCH v5 09/18] iommu: Add APIs to get iommu and device preserved state
From: Samiullah Khawaja <skhawaja@google.com>
To: David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Samiullah Khawaja <skhawaja@google.com>, Pranjal Shrivastava <praan@google.com>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Matlack <dmatlack@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

The preserved state of the device and IOMMU needs to be fetched during
shutdown and boot in the next kernel. Add APIs that can be used to fetch
the preserved state of a device and IOMMU. The APIs will only be used
during shutdown and after liveupdate so no locking needed.

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 drivers/iommu/liveupdate.c       | 125 +++++++++++++++++++++++++++++++
 include/linux/iommu-liveupdate.h |  45 +++++++++++
 2 files changed, 170 insertions(+)

diff --git a/drivers/iommu/liveupdate.c b/drivers/iommu/liveupdate.c
index 5f92a023ea65..ff76a23d9583 100644
--- a/drivers/iommu/liveupdate.c
+++ b/drivers/iommu/liveupdate.c
@@ -49,6 +49,17 @@
 #define iommu_max_objs_per_page(_array) \
 	((PAGE_SIZE - sizeof(struct iommu_array_hdr_ser)) / sizeof((_array)->objects[0]))
 
+#define iommu_liveupdate_for_each_obj(_arr, _obj, _idx)			\
+	for ((_idx) = 0, (_obj) = (_arr)->objects;			\
+	     (_idx) < (_arr)->hdr.nr_objects; (_idx)++, (_obj)++)	\
+		if (((_obj)->hdr.flags & IOMMU_SER_FLAG_DELETED))	\
+			continue;					\
+		else
+
+#define iommu_liveupdate_for_each_arr(_arr)				\
+	for (; (_arr); (_arr) = (_arr)->hdr.next_array_phys ?		\
+	     phys_to_virt((_arr)->hdr.next_array_phys) : NULL)
+
 struct iommu_flb_obj {
 	struct mutex lock;
 	struct iommu_flb_ser *ser;
@@ -259,6 +270,120 @@ void iommu_liveupdate_unregister_flb(struct liveupdate_file_handler *handler)
 }
 EXPORT_SYMBOL(iommu_liveupdate_unregister_flb);
 
+/*
+ * iommu_liveupdate_flb_get_incoming() - Helper function to get FLB state
+ * @flb_objp: Pointer to get the restored FLB object
+ *
+ * Return: 0 if FLB state found and restored, error if no data found
+ */
+static int iommu_liveupdate_flb_get_incoming(struct iommu_flb_obj **flb_objp)
+{
+	struct iommu_flb_obj *flb_obj;
+	int ret;
+
+	ret = liveupdate_flb_get_incoming(&iommu_flb, (void **)flb_objp);
+	if (ret == -ENODATA || ret == -ENOENT || ret == -EOPNOTSUPP)
+		return ret;
+
+	if (ret)
+		goto err_fatal;
+
+	flb_obj = *flb_objp;
+	mutex_lock(&flb_obj->lock);
+
+	/*
+	 * FLB version mismatch is considered fatal for security reasons for
+	 * now.
+	 */
+	if (flb_obj->ser->version != IOMMU_LUO_FLB_VERSION)
+		goto err_fatal;
+
+	/*
+	 * Array Phys of each type should be valid if the FLB was created for
+	 * preservation. This is true even if no devices, iommus or domains were
+	 * preserved.
+	 */
+	if (!flb_obj->ser->iommu_array_phys ||
+	    !flb_obj->ser->device_array_phys ||
+	    !flb_obj->ser->iommu_domain_array_phys)
+		goto err_fatal;
+
+	mutex_unlock(&flb_obj->lock);
+	return 0;
+
+err_fatal:
+	panic("Failed to restore IOMMU Live Update FLB\n");
+}
+
+/**
+ * iommu_for_each_preserved_device() - Iterate on preserved devices
+ * @fn: Iterator function to call for each preserved device
+ * @arg: Argument to pass to iterator function
+ *
+ * Return: 0 on success, or an error.
+ */
+int iommu_for_each_preserved_device(iommu_preserved_device_iter_fn fn,
+				    void *arg)
+{
+	struct iommu_device_array_ser *array;
+	struct iommu_device_ser *device_ser;
+	struct iommu_flb_obj *flb_obj;
+	int ret, idx;
+
+	ret = iommu_liveupdate_flb_get_incoming(&flb_obj);
+	if (ret)
+		return ret;
+
+	array = phys_to_virt(flb_obj->ser->device_array_phys);
+	iommu_liveupdate_for_each_arr(array) {
+		iommu_liveupdate_for_each_obj(array, device_ser, idx) {
+			ret = fn(device_ser, arg);
+			if (ret)
+				goto out;
+		}
+	}
+
+out:
+	liveupdate_flb_put_incoming(&iommu_flb);
+	return ret;
+}
+EXPORT_SYMBOL(iommu_for_each_preserved_device);
+
+/**
+ * iommu_get_preserved_data() - Get preserved data for an IOMMU HW
+ * @token: Token used to preserve this IOMMU HW
+ * @type: IOMMU type in preserved state
+ *
+ * Gets the preserved state of an IOMMU HW using token and the IOMMU type.
+ *
+ * Return: struct iommu_hw_ser on success, NULL if no preserved state found.
+ */
+struct iommu_hw_ser *iommu_get_preserved_data(u64 token, enum iommu_type_ser type)
+{
+	struct iommu_hw_ser *iommu_ser = NULL;
+	struct iommu_hw_array_ser *array;
+	struct iommu_flb_obj *flb_obj;
+	int ret, idx;
+
+	ret = iommu_liveupdate_flb_get_incoming(&flb_obj);
+	if (ret)
+		return NULL;
+
+	array = phys_to_virt(flb_obj->ser->iommu_array_phys);
+	iommu_liveupdate_for_each_arr(array) {
+		iommu_liveupdate_for_each_obj(array, iommu_ser, idx) {
+			if (iommu_ser->token == token && iommu_ser->type == type)
+				goto out;
+		}
+	}
+
+	iommu_ser = NULL;
+out:
+	liveupdate_flb_put_incoming(&iommu_flb);
+	return iommu_ser;
+}
+EXPORT_SYMBOL(iommu_get_preserved_data);
+
 static int alloc_object_ser(void **curr_array_ptr, u64 max_objs)
 {
 	struct iommu_array_hdr_ser *curr_array = *curr_array_ptr;
diff --git a/include/linux/iommu-liveupdate.h b/include/linux/iommu-liveupdate.h
index 536bea09d064..06f66cc8f526 100644
--- a/include/linux/iommu-liveupdate.h
+++ b/include/linux/iommu-liveupdate.h
@@ -13,6 +13,16 @@
 #include <linux/liveupdate.h>
 #include <linux/kho/abi/iommu.h>
 
+/**
+ * iommu_preserved_device_iter_fn - Callback for iterating preserved devices
+ * @ser: Pointer to serialized device state
+ * @arg: User-defined context argument
+ *
+ * Return: 0 to continue iteration, or a negative error code to abort.
+ */
+typedef int (*iommu_preserved_device_iter_fn)(struct iommu_device_ser *ser,
+					      void *arg);
+
 #ifdef CONFIG_IOMMU_LIVEUPDATE
 int iommu_liveupdate_register_flb(struct liveupdate_file_handler *handler);
 void iommu_liveupdate_unregister_flb(struct liveupdate_file_handler *handler);
@@ -37,6 +47,26 @@ static inline void *dev_iommu_preserved_state(struct device *dev)
 	return NULL;
 }
 
+/**
+ * iommu_domain_restored_state() - Get restored state of an IOMMU domain
+ * @domain: Pointer to struct iommu_domain to get restored state of.
+ *
+ * Return: Pointer to restored state on success, NULL on error.
+ */
+static inline void *iommu_domain_restored_state(struct iommu_domain *domain)
+{
+	struct iommu_domain_ser *ser;
+
+	ser = domain->preserved_state;
+	if (ser && (ser->hdr.flags & IOMMU_SER_FLAG_INCOMING))
+		return ser;
+
+	return NULL;
+}
+
+int iommu_for_each_preserved_device(iommu_preserved_device_iter_fn fn,
+				    void *arg);
+struct iommu_hw_ser *iommu_get_preserved_data(u64 token, enum iommu_type_ser type);
 int iommu_preserve_domain(struct iommu_domain *domain, struct iommu_domain_ser **ser);
 void iommu_unpreserve_domain(struct iommu_domain *domain);
 int iommu_preserve_device(struct iommu_domain *domain,
@@ -68,6 +98,21 @@ static inline void *dev_iommu_preserved_state(struct device *dev)
 	return NULL;
 }
 
+static inline void *iommu_domain_restored_state(struct iommu_domain *domain)
+{
+	return NULL;
+}
+
+static inline int iommu_for_each_preserved_device(iommu_preserved_device_iter_fn fn, void *arg)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline struct iommu_hw_ser *iommu_get_preserved_data(u64 token, enum iommu_type_ser type)
+{
+	return NULL;
+}
+
 static inline int iommu_preserve_domain(struct iommu_domain *domain, struct iommu_domain_ser **ser)
 {
 	return -EOPNOTSUPP;
-- 
2.55.0.1082.g2b9226bbc0-goog

