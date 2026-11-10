Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296663;
	b=3AQSRzHPnEicnRQqyKmVQ/6Edwh7aDsCmxvY+e5tJ6PL3CXnNRVkmTle4w8Xb1Q8005q
	 K541leUiiNWnKNtJRPHubyWZUSxtzQoLgqPlK4OUzlcvL+OPSFdkta1zr187wJs6LpZG9
	 l4Ozcp/oplQ8JwvL8cxuD6aeq+Yl9zB6xmeMEkj3epQV7M0SnPiQV+jKeT3q9uf/JC7iz
	 XdT468lUnaDqvlxgiOyJf+oEXZZtHeHIKG29tiPm40RT/pALC9rm1KKwbJw+TNhZLemEF
	 O5iu7ALKvvV+iyLksa+gY05CSMeQgCEmxu0RPx/IITi8zok8RQNHI9CnM2HI8mxChcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Q4Npotuz+vf92zyWk0dS+G8jQDeJZBCIwSnu3ob9NFI=;
	b=uWkcKApWQPDfvB5s/13YfR/o1GLR8m/U0xWhIHNgHMJc9zDXVicqxcAXcTn4fwlFs0if
	 7GoVGsrWgXsRw+3y4MXTlkj8GuTIxj11TbZYtUKJX81aEoejXkR2yQXo/K+9PU8WmAwu3
	 548cy715hitfb0wQrLws2pFzTuZWg6sG+IsyGFo5EnOlseW2Uegt9iF2GwlxpZo7PwxKV
	 rPcOPf+nw3SWe/oDtxVb0H/eOr+aATLTeWUibtgDMcOZvBVa1cBd/FZGlpL1zUa19ub63
	 Dj2CmulKMNj/Y47FkmdWblpGl84C9xoOWi1LBwxbVkosAk+m824COtUR1f6XK26QkOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O2k3qJNE;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB1E606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB1E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O2k3qJNE
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4d7034a99a9so956057b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296662; x=1794901462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4Npotuz+vf92zyWk0dS+G8jQDeJZBCIwSnu3ob9NFI=;
        b=O2k3qJNE+PSfTTubK6T8YjFk21kVkTsoRM9ZgOwqcInJMIan+E5MIij94c5UrijXAU
         /kqgOwYnAEqgUnoewlLTOuDRMU1BzbikMMjgQjkJ8h2hwM4Y6RG8ob0YFkEUy5E2TnQR
         zXGLkaFVkbBEcA1Jp1qINGS9xrVvocsMwH1+uXiJBybenLfi8nkx/NQxzVotsTcGlhcS
         VTZbFrhB9I5efQzGl78duBFSwFj6DYiOj2cB0SkNGBVr6ATcfeNsbCeeDtZZEscTlCm0
         OmHyxXU59D8gaIxha4kSKogLI6FRKkjTrqvGSbKh2VEihvISVHboUrXkAkei9yS0lNGN
         tCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296662; x=1794901462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4Npotuz+vf92zyWk0dS+G8jQDeJZBCIwSnu3ob9NFI=;
        b=hSm2+OHuqBylEQ+Sc3RjeOpGLn4UG2Kw8sfU5CeRiAQtjdJYc0vIuGKRmLnWw0IM5t
         uS86WATKsX7kOShX98PxIQPqG9WCUU/AlB+Zw+DeBIhz21tFyZiO3Zx95Ue8/w1lWnCk
         G04OPrzPRadho7imBk0ALesjA8oXQq6SGdCAxIMtEEsw+E+i5QPxWdsQ/tpU/LCAEz/r
         eFZ62B/BU0mef7WyyrgeTFtLD5TpJ+5/34oky/qUNLwBMTlizOKvV+QjJ6G+M+gjyXwr
         q9M88E5remH0i0Tq933UTLoq1xXkZA4KMk8xEzc1mpbpdkVMydX8Z2TPguWlW67c9hAa
         /NHA==
X-Forwarded-Encrypted: i=1; AL+hErFPPphb5UfqST1H1iu/LcfYIhQVjswk8ak3hEyJjNxl9zO/oU3QQfXl8H2BCoz7VGotwEY8HjO5yBwIyw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zCusgLXuKPUZBHUWLJZvLDLFPs9raWA6W8kGPQt0CcjHZJRrW
	UDQhr9abfDctAqsVSk7tDBQXVCOKMfV29tE8P/Bg07MnkuCo537XxfNg
X-Gm-Gg: AYBFou0srjDP3bVnEONSKBZqSkmheR7N+2BxlS/HofsYBp6kJ+RWzds/bjc+HZ4yJum
	zO7/6uMxhr1Wrwi+QcEgdZz2e5TAoxyS59fGnjARnGe3i/h7n4s7Bf/pA30SGKu+hSQufAzFQ+l
	yZLE3yMCXiaMDIuMOTTKhqBfkTf+X66/5tKPYQ5a3KDPX61O3y8bFpTqQUXhCfiqvepgBTaAD0Q
	rJe0j//4Qym4+f+f50MwnyPt8+WtNDmba6ONtY+ndScDodTbK2lcBZInKbVv+zhIsuDdYGskr0T
	u9bjbaPtNdZZyd0IgbpM/jE3bjUqXr+DihUiyBV+yD59ot+AvPpVZbltGi/k7acModBB8eRjlWE
	LmEVhLS69w07R+T3L1iNMyddBMyjfrPBy/paYefqohIgKTLRhoaAGdhS3FvzELqwS7dKR9L0C7T
	p2zYy5GQzKTxhdEr+upGChrN098CAHssLcfuyUuq6r8RcmHMISCGya2jXWpLIevvK6n2nM6r0ed
	vZrDmz35IQjJ81rFFD4WAQLY5EcNgdvFDtcH8mj4iEWQlvz/PunCb8G5zirWNMc/U4Lq0TXvO6W
	FfQoDsbifNwPTdlwd8JnIdDfzrsSkdEfLltpcFZxBO7knHRW+adbLnatlX4pnEK6OAEp4G9cXfK
	pK3KEWB1skv9kGwPP0PF31FbP6nAta4VbEYc5YLJEjbbvOIKFOEG877bDaddYBxTETgUxMyU0Ex
	0jSUWGTJ8qNyu1aalN8em43Uv4P7HIB6a7HfgMMD1rZGQ8sJobnsnO
X-Received: by 2002:a05:6808:159c:b0:549:ef3b:1a90 with SMTP id 5614622812f47-5683ce4a928mr1595474b6e.54.1794296662184;
        Mon, 09 Nov 2026 23:44:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:05 -0700
Subject: [PATCH v2 02/58] driver core: retain the owner of device release
 callbacks
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-2-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 driver-core@lists.linux.dev
X-Mailer: b4 0.15.2

Device references can outlive the driver or subsystem operation that
unregistered the device. A modular release callback needs its code to
remain loaded until it returns. Dropping its last module reference inside
the callback permits concurrent unload before the function epilogue has
finished.

Add an optional release_owner to struct device. device_initialize() takes
the reference before the device can be published. The built-in device
core caches the owner before invoking the release callback and drops the
reference after the callback returns, allowing the callback to free the
device itself. This also covers initialized devices that were never added
and device_add() failures.

MTD will use this to keep its release callback available after retained
device references outlive driver unbind.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/base/core.c    | 9 +++++++++
 include/linux/device.h | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4c0c373998a1..03f8bf69219a 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2617,6 +2617,7 @@ static void device_release(struct kobject *kobj)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct device_private *p = dev->p;
+	struct module *owner = dev->release_owner;
 
 	/*
 	 * Some platform devices are driven without driver attached
@@ -2642,6 +2643,7 @@ static void device_release(struct kobject *kobj)
 		WARN(1, KERN_ERR "Device '%s' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.\n",
 			dev_name(dev));
 	kfree(p);
+	module_put(owner);
 }
 
 static const struct ns_common *device_namespace(const struct kobject *kobj)
@@ -3225,11 +3227,18 @@ static void klist_children_put(struct klist_node *n)
  * approach is to use kzalloc() to allocate the structure containing
  * @dev.
  *
+ * If @dev->release_owner is set, the caller must keep that module loaded
+ * until this function acquires a reference. The core drops the reference
+ * after the release callback returns, including when device_add() fails.
+ * A module whose initialization fails must still drain its devices before
+ * returning the error, since module references do not prevent that unload.
+ *
  * NOTE: Use put_device() to give up your reference instead of freeing
  * @dev directly once you have called this function.
  */
 void device_initialize(struct device *dev)
 {
+	__module_get(dev->release_owner);
 	dev->kobj.kset = devices_kset;
 	kobject_init(&dev->kobj, &device_ktype);
 	INIT_LIST_HEAD(&dev->dma_pools);
diff --git a/include/linux/device.h b/include/linux/device.h
index aee79fd6b32b..cd39ebf47ee7 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -683,6 +683,9 @@ enum struct_device_flags {
  * @release:	Callback to free the device after all references have
  * 		gone away. This should be set by the allocator of the
  * 		device (i.e. the bus driver that discovered the device).
+ * @release_owner: Optional module containing the release callback. Set before
+ *		device_initialize() and leave unchanged for the device's lifetime.
+ *		The core holds a reference until the release callback returns.
  * @iommu_group: IOMMU group the device belongs to.
  * @iommu:	Per device generic IOMMU runtime data
  * @physical_location: Describes physical location of the device connection
@@ -787,6 +790,7 @@ struct device {
 	const struct attribute_group **groups;	/* optional groups */
 
 	void	(*release)(struct device *dev);
+	struct module		*release_owner;
 	struct iommu_group	*iommu_group;
 	struct dev_iommu	*iommu;
 

-- 
2.53.0

