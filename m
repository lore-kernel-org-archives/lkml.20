Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894786;
	b=2v6a0ZpQqQd8Kstu6BrkftTgiRS27e8xzfkGwvFBCyJHEcPrllT/W1T+NFQou20ej/f8
	 /wc10yPV7CorbEBsjKCaQvXk+xXeZVK3FJD173mbvn+kXetShBxRomjuBb7vkc6TwfC8Z
	 2BgmKailWUDMP8RzE67+/LjjqEccWHW+L3XIBDoazJypQXb0vDdJPdjrps3wA/vZKGgIy
	 9MHvhlRFaX8ELuvIY61NyW46aqy66ubYn8GPVVN/pmzvCDtmrCIoJlQDTeI0vuCquaFmV
	 FQ92suLmRluWBA53KeXFQhqfKclogFnxKr1osBh6MUfrSkXcJXG2lUUObPQC48eeG3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/RIAPOqL9hETjf54EaDpXVAyHqnHiFUIOigAQ/IbEpk=;
	b=WHxqyry6tRmSGzL7Y/sjPaClb5XEFqzhCBGA6LspLCgkPE5ehmyKcuVF21cMdbtEK7ZE
	 zld3nJO0n9ikP6gR8oiBh7F+p/eSjG3dM39w9EtUEcVoMkyX966kz0C+pDt41azChj68t
	 7i1F9p4ZbQcJZlj2qhdD37LOjurtoshfBmCzMhbs2+JIaehkkaQbwq3EXMMRy7AyDG+e7
	 xqm09MEENz6hTfs0BfGvv+5zwCV/GdOYcA3cUxSbOozPTodXoWhQyOxL5j81HCg9dY9Cm
	 pog9wWJEn7/JfTcY8xVFoTq85K4KJRFB1pkSO4YHyrQ12Gex2h06mHKDaTUrrLMypGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=SjD5PHHf;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921A8606BF47
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 921A8606BF47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=SjD5PHHf
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so1175587a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792894785; x=1793499585; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RIAPOqL9hETjf54EaDpXVAyHqnHiFUIOigAQ/IbEpk=;
        b=SjD5PHHf2ZxsSATmc8cTBXT3ZWUfhcR04eA+L3bS5bReO2wJQSJzEyspiAXzuTbeGN
         WlZeoVcxGV/WLbQqIrzkGAbrjWNr69j2ogs88B1BhyuNaKqd9JAScurxm1MMBIjfbZTk
         +eYa+x7mUaSocBUJKDo03ZKkEzRXxOGy8wX1hkyhCNXkEDhgHCoczDYEKCmb3/XU9HH+
         PYhdOMzxAK4CQeDAmCyhIrbNqZzajJvvoRTqBMWqLNLFt+d6J9sUOjQmpVjBPlJkVmg5
         4t4nIhsAyG/t11irIxKCrCWOFd5993qytkMlg1vMHcJ1Yu2YOUUDMXEDecWxeLc1uxV8
         llOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894785; x=1793499585;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RIAPOqL9hETjf54EaDpXVAyHqnHiFUIOigAQ/IbEpk=;
        b=RGb13bB7paSr4dYisJGebaS2OWELmjNbcGUk40cSlLnQPycrviNZ7e6lJr6QCh196N
         Zh4F/WFQLai+PeQRoa6PQ8UCoLlzoFVE04EPdVh9FkRej0uLiD5O50JKd3C7KFnJWahc
         gydGMfGT0Cr9eYILbJHZwZUbo/pdJ7oFs1QdrGfQyFb6vKkXkyJUp6I5lAXM1x6W2k50
         fJXyRjYg3CZb/7cI3NaBDUS3rWjezALz5ZLotdPxS3IXYWRYRXrpc3hLdqRcOBb2L/IK
         Ha+XMqy5irumaLk3zBrHR8tCaTXGlXJ+/FLKDZqGA8XwK7L86dKgyGB9YiZtZYJbQGBQ
         3LiA==
X-Forwarded-Encrypted: i=1; AKwUvByVJQad4NUbzI8/F39II9eaCO8ZtJpIupi8DKZiA4h+O/p3gWxkn1wxyny+C/Dl3gkvf2iD8fPif4KiDNo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6ucwd2GnMGFDAbVZ2MdpHdj/WOHIMkrWGELOliz5bgL2zp6Gq
	azrAT9RhVFpkmtc6NHW5+CLyez4YPeaKuDfcLBzKpb4gbkIi+lTK17Rkt++mGNl3027JhTzsKSg
	840kiseMPr2D4Xw==
X-Received: from pghk14.prod.google.com ([2002:a63:f00e:0:b0:ccd:4f9e:b577])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:398:b0:3e2:97ce:b571 with SMTP id adf61e73a8af0-3e7cd52340fmr2358508637.62.1792894784802;
 Sat, 24 Oct 2026 19:19:44 -0700 (PDT)
Date: Sun, 25 Oct 2026 02:19:19 +0000
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
Message-ID: <20261025021930.674647-9-skhawaja@google.com>
Subject: [PATCH v6 08/18] iommu: Add APIs to get iommu and device preserved state
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

The preserved state of the device and IOMMU needs to be fetched during
shutdown and boot in the next kernel. Add APIs that can be used to fetch
the preserved state of a device and IOMMU. The APIs will only be used
during shutdown and after liveupdate so no locking needed.

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 drivers/iommu/liveupdate.c       | 88 ++++++++++++++++++++++++++++++++
 include/linux/iommu-liveupdate.h | 70 +++++++++++++++++++++++++
 2 files changed, 158 insertions(+)

diff --git a/drivers/iommu/liveupdate.c b/drivers/iommu/liveupdate.c
index d1d11b28ae79..eace110322ec 100644
--- a/drivers/iommu/liveupdate.c
+++ b/drivers/iommu/liveupdate.c
@@ -61,6 +61,14 @@ struct iommu_ser_set {
 	u64 *head_pa;
 };
 
+/* Iterate over the serialized objects of a set, skipping the deleted ones */
+#define iommu_ser_set_for_each(_set, _it, _obj)				\
+	for (kho_block_set_it_init(&(_it), &(_set)->bs);		\
+	     ((_obj) = kho_block_set_it_read_entry(&(_it)));)		\
+		if ((_obj)->hdr.flags & IOMMU_SER_FLAG_DELETED)		\
+			continue;					\
+		else
+
 struct iommu_flb_obj {
 	/* Protects the serialized state and the object sets */
 	struct mutex lock;
@@ -273,6 +281,86 @@ void iommu_liveupdate_unregister_flb(struct liveupdate_file_handler *handler)
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
+	int ret;
+
+	ret = liveupdate_flb_get_incoming(&iommu_flb, (void **)flb_objp);
+	if (ret == -ENODATA || ret == -ENOENT || ret == -EOPNOTSUPP)
+		return ret;
+
+	if (ret)
+		panic("Failed to restore IOMMU Live Update FLB\n");
+
+	return 0;
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
+	struct iommu_device_ser *device_ser;
+	struct iommu_flb_obj *flb_obj;
+	struct kho_block_set_it it;
+	int ret;
+
+	ret = iommu_liveupdate_flb_get_incoming(&flb_obj);
+	if (ret)
+		return ret;
+
+	iommu_ser_set_for_each(&flb_obj->device_set, it, device_ser) {
+		ret = fn(device_ser, arg);
+		if (ret)
+			break;
+	}
+
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
+	struct iommu_hw_ser *iommu_ser;
+	struct iommu_flb_obj *flb_obj;
+	struct kho_block_set_it it;
+	int ret;
+
+	ret = iommu_liveupdate_flb_get_incoming(&flb_obj);
+	if (ret)
+		return NULL;
+
+	iommu_ser_set_for_each(&flb_obj->iommu_set, it, iommu_ser) {
+		if (iommu_ser->token == token && iommu_ser->type == type)
+			break;
+	}
+
+	liveupdate_flb_put_incoming(&iommu_flb);
+	return iommu_ser;
+}
+EXPORT_SYMBOL(iommu_get_preserved_data);
+
 /**
  * iommu_preserve_domain() - Preserve an IOMMU domain across live update
  * @domain: Domain to preserve
diff --git a/include/linux/iommu-liveupdate.h b/include/linux/iommu-liveupdate.h
index cdf8a82b7f1d..10fcdd41c7a1 100644
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
@@ -52,6 +62,46 @@ static inline void *dev_iommu_preserved_state(struct device *dev)
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
+	ser = domain->domain_ser;
+	if (ser && (ser->hdr.flags & IOMMU_SER_FLAG_INCOMING))
+		return ser;
+
+	return NULL;
+}
+
+/**
+ * dev_iommu_restored_state() - Get restored state of a device
+ * @dev: Target device
+ *
+ * Return: Restored state pointer or NULL.
+ */
+static inline void *dev_iommu_restored_state(struct device *dev)
+{
+	struct iommu_device_ser *ser;
+
+	if (!dev->iommu)
+		return NULL;
+
+	ser = READ_ONCE(dev->iommu->device_ser);
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
@@ -88,6 +138,26 @@ static inline void *dev_iommu_preserved_state(struct device *dev)
 	return NULL;
 }
 
+static inline void *dev_iommu_restored_state(struct device *dev)
+{
+	return NULL;
+}
+
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
2.56.0.257.gf7497c7d27-goog

