Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793411736;
	b=OSPeS9dOcnYVuw2cZ6qi7tfNFrY6I5LdZmGfx9Z17yWc+aGhatNVByxKfj5kGB6C61pu
	 b3vPOXFIwDaPaC/08GWgCFH+QTcSnqyw9q3IdyCpaf5VCxtGraHe/9SjXCoTl1lDriDkq
	 AJ3wODWM7DzhjSP6qyeM7RWhO1bLuKt+DaY/6QfEBdNjuvW2t4sVm1rS3ozwgKbqODp35
	 +NU9lebFLZYKRW4Zv5cOrqAvOLU3ZZ4rh2Y+WUFDS9j7umXN1w8Q4u1/Z1LqU3INzHVox
	 jvyoIXuFYmtU3fMiYXCaW+Lo770XlukqrGct2NFX2gOWzMfWmgq6uoJybnJp5h37BqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793411736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=L2o29doa9iweGy825AZDWyjKjFpPQ47IdlCL02by6zg=;
	b=E/yX9DKz3CaAHmP/403oGXdguB6XbA9VUXFWeT99bAShBGlWUM4LlPOSod6hHlSxEflM
	 SzhNcObd3YJVjzucYRqdC48OzLMmL8sRxHtMWfeGOxxFslJYeWyMQ82o62GeJ6J3zmlVz
	 PG61faMwRrJjK8NoiWVJV1RlE23F7/eauTXv/Ai+bo+HVs36LiJOQqw/jUdvD5C0goM+i
	 pqeYTT5ftz94CdqYx6nAtW8xnYIKF8OICVH4pPpf0nlAXXyzOAGQwhzLTDl+mZJgvAO1g
	 DOLWZIR89Us0TIBXVL6deJXPMAG88SWjeuTvEJ7k0lUiAYtpu0wTHLubQhOd0R87AxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F96tyXGV;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888DF606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 888DF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F96tyXGV
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so16125ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793411735; x=1794016535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L2o29doa9iweGy825AZDWyjKjFpPQ47IdlCL02by6zg=;
        b=F96tyXGVmJkDVU46Xzh9DewGvE3vfWZ7yJmgTzVsmi0CoIQZtkXJtpCSsq8gnwnqaI
         aoSBql31GrHSp4jTBb9lhxs8B7jkI6Jz8mzLvXlcCjM58XXuSsgIL/Yz3nOf789q5a7G
         OS1nCEK5GG9d058MSfOfdJ0FXGNyhwJAAjT0GQD3YrOFed4MeCK+kYzI8m1WtIfk3cWj
         KVVm8Dn0NYB11xlsMD6swOhAaCqaHt3kJXN+CkhdDEaaLAWjObz7Bfq/8+xkNUHSIqVX
         yCksSeYaSdWZVry+US2Kiia1SV2Z6njlrKVMKe7EZWcavVZXvR2jyOD30DXKs5T4qdEk
         rA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793411735; x=1794016535;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2o29doa9iweGy825AZDWyjKjFpPQ47IdlCL02by6zg=;
        b=bHB6YNVstEztywI4xneA4X27k22knNdRnOBlWnBLx8r/QwqkrJWnJK5RL4AYZxN6Uh
         F8+55M8Y9nk+v5Zhh9IyelW01WhLtksqmZ2c6DeBw0Nvr7fwy/nqtfXrXtOKk7ORRkL+
         1OsL6OQJgOvwYocdeuO/J8hVFIknRXI1lHh/e6ro6rs+4XpOvAPJagRL2VnOn9zTBVDh
         QA5S5cpEZMFUUaSCMGf/60E9KiYgF+D24kVCpf5OVORNVUCvHfd1wweng9dufEnfaVmT
         EEdyT5ZVmChDCtfNK/cb2JINNVkW0ir7VplObObmMOOvdSSzy8DZH8dS3XlPREgvijcW
         zuiA==
X-Forwarded-Encrypted: i=1; AKwUvBzsCaZem+aJoJvKK1o4fwEzg4miKidM/9YwNXtcsigN0db/C4GODl2SjlXAI+vkiT/yRpkU2g+HHJiIrfM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJP0vwLntgcsK8UXRVJUa82Kbsj+/Jme+YkPouDQFzzGeEjKX54
	f0hrJ+bPdrm/8K1C9tFSTY/dCULSrmSBPSbIX7/Ix6OQQysS3D9n1fQSduoa/6/47g==
X-Gm-Gg: AYBFou3DBS7sAipVKhSiE72BWJjKaYmD4a6i3SUX4OAZhMyYb5YqF4YKcnqpTPnQrG6
	XGlkNLg5ZWRAv1mhuYr9x7QqSJHc8XlJXj1iPWoDx6Nr3Vpqrho2jOEE0DAESF+oUpL1RDUDhBT
	k/pleYgm8rPVkjFWnJy1qhmXQu//ZyXxKlatWhTBgU/h4Z73KKf7gE5LyCy27yJ7DZiBiR9jbQT
	H70ERBjsGGtm2IFikCYGQOcwrjDo8YOCB5rhHgq7OkSLTCJum7J0oL7HoAkMU4SBZvpXT+WN0BA
	yEvSKqBu3ptV35hK/kfqFwq7A/PnLSJFG5FzVOVSfHL1+OFhUKhtEgjXLvFy/sfhONFXgMxHai3
	hOc1Ri+lyfPNRxetsqW6LGrnym3ChNgxJa1EEPQvyknVC05fq82MGc90XYm/AC3th8415xrPg0x
	pEQZ175WonFYzXcm7nrmq6MJVgC/Hs8ovSKDX44HeCcv7YHCJLUwG8fqGguFNvojxH7uaPtq9GS
	SNSi5sSkoUPALxs/PjpzzBJMWra7oi9t4jnl8pFggV0zHmOgXNY9XhPZ+sRJR3Ql//sMWWnTiYz
	Y4RruFx24kgpod1CO9Lx0nfQQyVUsHUTy65amX4B9DGFU761yPk77OJJe4Q5K8WAvseeb8r/uO3
	vPedshHhvCEMTQ4lUcoeLXZlPfU18mKpl64YSOWQccBs=
X-Received: by 2002:a17:902:fdab:b0:2e6:f400:5655 with SMTP id d9443c01a7336-2eb1ebe3d33mr14502875ad.3.1793411734199;
        Fri, 30 Oct 2026 18:55:34 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e98afe3sm10181261a91.12.2026.10.30.18.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 18:55:33 -0700 (PDT)
Date: Sat, 31 Oct 2026 01:55:29 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, David Woodhouse <dwmw2@infradead.org>, 
	Pranjal Shrivastava <praan@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, 
	Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Ankit Soni <Ankit.Soni@amd.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	John Starks <dev@jstarks.net>
Subject: Re: [PATCH v6 08/18] iommu: Add APIs to get iommu and device
 preserved state
Message-ID: <auVJWkRz7C_Cs78m@google.com>
References: <20261025021930.674647-1-skhawaja@google.com>
 <20261025021930.674647-9-skhawaja@google.com>
 <7e73da77-3cd2-491a-9ea2-68263f2b5d71@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <7e73da77-3cd2-491a-9ea2-68263f2b5d71@linux.intel.com>

On Fri, Oct 30, 2026 at 02:03:01PM +0800, Baolu Lu wrote:
>On 10/25/2026 10:19 AM, Samiullah Khawaja wrote:
>>The preserved state of the device and IOMMU needs to be fetched during
>>shutdown and boot in the next kernel. Add APIs that can be used to fetch
>>the preserved state of a device and IOMMU. The APIs will only be used
>>during shutdown and after liveupdate so no locking needed.
>>
>>Reviewed-by: Pranjal Shrivastava <praan@google.com>
>>Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>>---
>>  drivers/iommu/liveupdate.c       | 88 ++++++++++++++++++++++++++++++++
>>  include/linux/iommu-liveupdate.h | 70 +++++++++++++++++++++++++
>>  2 files changed, 158 insertions(+)
>>
>
>[...]
>
>>+
>>+/**
>>+ * iommu_get_preserved_data() - Get preserved data for an IOMMU HW
>>+ * @token: Token used to preserve this IOMMU HW
>>+ * @type: IOMMU type in preserved state
>>+ *
>>+ * Gets the preserved state of an IOMMU HW using token and the IOMMU type.
>>+ *
>>+ * Return: struct iommu_hw_ser on success, NULL if no preserved state found.
>>+ */
>>+struct iommu_hw_ser *iommu_get_preserved_data(u64 token, enum iommu_type_ser type)
>>+{
>>+	struct iommu_hw_ser *iommu_ser;
>>+	struct iommu_flb_obj *flb_obj;
>>+	struct kho_block_set_it it;
>>+	int ret;
>>+
>>+	ret = iommu_liveupdate_flb_get_incoming(&flb_obj);
>
>iommu_get_preserved_data() returns the incoming state, while
>iommu_preserved_state() returns the outgoing state. The naming is
>confusing.
>
>How about using "preserved" for the old kernel before kexec and
>"restored" for the new kernel after kexec? For example,
>iommu_get_restored_state() would be consistent with
>dev_iommu_restored_state() and iommu_domain_restored_state().

Agreed. This makes it consistent. I will update this, and rename
iommu_for_each_preserved_device() the same way since it also walks the
restored state.

>
>>+	if (ret)
>>+		return NULL;
>>+
>>+	iommu_ser_set_for_each(&flb_obj->iommu_set, it, iommu_ser) {
>>+		if (iommu_ser->token == token && iommu_ser->type == type)
>>+			break;
>>+	}
>>+
>>+	liveupdate_flb_put_incoming(&iommu_flb);
>>+	return iommu_ser;
>>+}
>>+EXPORT_SYMBOL(iommu_get_preserved_data);
>
>Why are different export macros used in the same file?
>
>  EXPORT_SYMBOL(iommu_get_preserved_data);
>  EXPORT_SYMBOL_GPL(iommu_preserve_domain);
>
>Should these all be EXPORT_SYMBOL_GPL?

Agreed. Will update.
>
>>+
>>  /**
>>   * iommu_preserve_domain() - Preserve an IOMMU domain across live update
>>   * @domain: Domain to preserve
>>diff --git a/include/linux/iommu-liveupdate.h b/include/linux/iommu-liveupdate.h
>>index cdf8a82b7f1d..10fcdd41c7a1 100644
>>--- a/include/linux/iommu-liveupdate.h
>>+++ b/include/linux/iommu-liveupdate.h
>>@@ -13,6 +13,16 @@
>>  #include <linux/liveupdate.h>
>>  #include <linux/kho/abi/iommu.h>
>>+/**
>>+ * iommu_preserved_device_iter_fn - Callback for iterating preserved devices
>>+ * @ser: Pointer to serialized device state
>>+ * @arg: User-defined context argument
>>+ *
>>+ * Return: 0 to continue iteration, or a negative error code to abort.
>>+ */
>>+typedef int (*iommu_preserved_device_iter_fn)(struct iommu_device_ser *ser,
>>+					      void *arg);
>>+
>>  #ifdef CONFIG_IOMMU_LIVEUPDATE
>>  int iommu_liveupdate_register_flb(struct liveupdate_file_handler *handler);
>>  void iommu_liveupdate_unregister_flb(struct liveupdate_file_handler *handler);
>>@@ -52,6 +62,46 @@ static inline void *dev_iommu_preserved_state(struct device *dev)
>>  	return NULL;
>>  }
>>+/**
>>+ * iommu_domain_restored_state() - Get restored state of an IOMMU domain
>>+ * @domain: Pointer to struct iommu_domain to get restored state of.
>>+ *
>>+ * Return: Pointer to restored state on success, NULL on error.
>>+ */
>>+static inline void *iommu_domain_restored_state(struct iommu_domain *domain)
>>+{
>>+	struct iommu_domain_ser *ser;
>>+
>>+	ser = domain->domain_ser;
>>+	if (ser && (ser->hdr.flags & IOMMU_SER_FLAG_INCOMING))
>>+		return ser;
>>+
>>+	return NULL;
>>+}
>>+
>>+/**
>>+ * dev_iommu_restored_state() - Get restored state of a device
>>+ * @dev: Target device
>>+ *
>>+ * Return: Restored state pointer or NULL.
>>+ */
>>+static inline void *dev_iommu_restored_state(struct device *dev)
>>+{
>>+	struct iommu_device_ser *ser;
>>+
>>+	if (!dev->iommu)
>>+		return NULL;
>>+
>>+	ser = READ_ONCE(dev->iommu->device_ser);
>>+	if (ser && (ser->hdr.flags & IOMMU_SER_FLAG_INCOMING))
>>+		return ser;
>>+
>>+	return NULL;
>>+}
>>+
>>+int iommu_for_each_preserved_device(iommu_preserved_device_iter_fn fn,
>>+				    void *arg);
>>+struct iommu_hw_ser *iommu_get_preserved_data(u64 token, enum iommu_type_ser type);
>>  int iommu_preserve_domain(struct iommu_domain *domain, struct iommu_domain_ser **ser);
>>  void iommu_unpreserve_domain(struct iommu_domain *domain);
>>  int iommu_preserve_device(struct iommu_domain *domain,
>>@@ -88,6 +138,26 @@ static inline void *dev_iommu_preserved_state(struct device *dev)
>>  	return NULL;
>>  }
>>+static inline void *dev_iommu_restored_state(struct device *dev)
>>+{
>>+	return NULL;
>>+}
>>+
>>+static inline void *iommu_domain_restored_state(struct iommu_domain *domain)
>>+{
>>+	return NULL;
>>+}
>>+
>>+static inline int iommu_for_each_preserved_device(iommu_preserved_device_iter_fn fn, void *arg)
>>+{
>>+	return -EOPNOTSUPP;
>>+}
>>+
>>+static inline struct iommu_hw_ser *iommu_get_preserved_data(u64 token, enum iommu_type_ser type)
>>+{
>>+	return NULL;
>>+}
>>+
>>  static inline int iommu_preserve_domain(struct iommu_domain *domain, struct iommu_domain_ser **ser)
>>  {
>>  	return -EOPNOTSUPP;
>
>Thanks,
>baolu

Thanks,
Sami
