Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296665;
	b=kzNTJLbfDdJXMc6mgKzVY6QXVWbbfLb1kX8gZpFEUOTD4e86/OxDQjnZ15IFOPelWGju
	 KBC+XcceVPaau0fgGbkDzGp2saNr6PUevqNQ1NQ7tGaw7H3nMAbkmaoJu6S+ZYYRYYGka
	 jxVYACT+n98MqFIfC+K+AhOM8grebktn1gcmPn0ll37cQVFB2EhqQCl9YSqixCLMuXhIr
	 uE9DOKEdHr8ZFSlcXXMGWZY+PZnK24hPeVAT6IeJiswxWZHnbzhfMtdSLuBH1pLqZM8Py
	 P/ph0t+SDzpUB2CRC7RcE4lOBo+RF8WI2I8zr0+RGjf3GVXkbZ7BWOhv0+K8ZBJRSjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=uBO5z5i9rnDcZlHEY1YWIv7/CQoOu4BHG/HftOGk0ew=;
	b=H+rOPHmA+x2luxMUliIBk0Qn9IK4Bl5/wIYa6x9llIg0o2sAumwpj54CDiuMwam9KMjU
	 jljkCqJmndKRFu4jCxh5e1uhUhFWsQYE47VLekE/Iu4Z43OqLiVexE4pjSGgaA6+U56h7
	 xDV9GeouwGdX5r8cfSvPog+bCiGIPCM2vgTr48nx15OHMRwZ8lYJix7/tNQQY9JhlyCFu
	 tO7EY3Z8bSaSyHd6y1xV2jOc3ak9aaGw4V00dFOrdNfBY/BrM8STDxcZpNxDOeNyD3iBS
	 r5hp/5Mi7BsRh4woBETxVdk4klj/0MlBSLRfXiU4rM5M6swgvilJjumXwXcbqlBsabA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ufGVJsoI;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C0560A260A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70C0560A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ufGVJsoI
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-847ac7ccd85so1040400a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296663; x=1794901463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBO5z5i9rnDcZlHEY1YWIv7/CQoOu4BHG/HftOGk0ew=;
        b=ufGVJsoI3Tqnf6/yx7GWowdtm/r87kQwGnxBL6vqu5gD2G0La1ggKGstFSocJTL3YO
         tLPf07DwMcpQY4IpbxXNdegmem8t3g2qGPL978ddfI7X+/gi3OS3/ljkHXAVovljcOXU
         /ikdDCpYEbdQ7/HSqkCIUuADvPZcjUqPz+2MhYZF8J4WTGGcO1ksPEIfF0+RfZFRd2l2
         AvjbLgvvYap+eak9YpnCIOZnkv2Stmj1N9bYw2jC2Kg5SyjPR2+YCyTqOn8peTqbrmCL
         haIaucO5QZ/x3N+k3OnQJ+wdNlK1xKH9p0NMUWf/+wyymcwfyneJk9Zmew7aYGKnfrN8
         0kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296663; x=1794901463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uBO5z5i9rnDcZlHEY1YWIv7/CQoOu4BHG/HftOGk0ew=;
        b=fcUG6Z/zngvrWOmnucU4iSf9zkvrak0RixcKdxoONagj8GJf+uu47pAbtfxlVmoJgz
         +l7opZvKBmZmymBe96+Juqk3ioPKF7JMSmk0xLMED6mQ0dMgB/XjqJtW9nWC4ZT9fsNS
         4zwb89O3FvIU3xUq18xJH/9L7T1E44NBcagajbNbGaU3FjggJocXM03b21sUwo2oy/WT
         VOGszT++ebmzybGya22CzmwtvJIKz9OpYcpVxSDVyEkOIJgzXOK2vyDdlnWFSunHjVP7
         aC5JEkO4EBaYVQlpo2llW3hQj2R/IBVV7qZePwqbkswTF3AboE6HRMRXT7Smz3Ju9hFB
         Gi4Q==
X-Forwarded-Encrypted: i=1; AL+hErHhzHd8+BHpf74GoLIjY2gbhrZRQJEMSKJYcoBZFksFZjBjKgXJ0YM5I9dUIB0oSn2mbHy3VuEqIHYTr/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yF6s9UI9o4JiX8kGOTTA8ZOryLLCc4t8Yn/uKS+1JKm8s1eoa
	ANFpUBe/0XTd0G9uYrBlZEObXe52CR9LOjtPUlcJ+a0FdxDg/slmMYMXtDzl+EGa
X-Gm-Gg: AYBFou0BHesXwzUX/dTg3TRsOjvpOhnkdWF7RcEiVybmp3UV4plAyNd7eViBnRPnAzM
	YW48pDnDgVB5l/H3BTXkEy5izvhqbohStOJjHGyk0RS03O0H8nOSZRiM7CTd0BmTyaabIQ8CbEe
	1aCZAenbhQrRAXRsMLJn9s+oFVly5+BUK6NFMxqC4yhIXkodYnto8b/Ru8aBeWa9razGWLamm/y
	LcyQaCLuKwg9ou82It16CfkZS0uOES3Ec6B248JFnfjwmPqe1Wr42dTSPNDUf2WT4CoR0nugWq0
	lOh8Qcl1vVQPFwyZFj+ogiZg2kC+PLmAbuLiApNLlEczBJYCKYsYXOw0S+UX2bGXpCrIy0j2Vt/
	rdFL16ez6vUV0rm04nni33s/6tz57vqaFfuVlY28JhCbTlsrU5HOEIuIZMQI4DFafFjEGcsUO0B
	i+ih4F7gvXkazMbBLkQa5xJeM2ihWIKc6IGLoeN+FCW/d6Jd/5+JTlSsLlMU3Iyz5fpdWZYW/ra
	Ih+blU/9HocO4prMjc9o54nVtYoQdHCgApooY560A2Kx3L2Gneo78htY3fZgQtcvmhXemba2DHi
	XibPc+IRqy6tWO+MBLzSNhcwyS7FvfZi0lzyNIb290/ABd98KVGD0jvInNI9et1j7WLovptksQI
	k2n8HfG1GBCjOmsTZuCeK7jCDv1DVtxokkWHxr6rVz9TUTayfVWOOkJAGyfH8EiTIqECUNhQoLo
	8IadvDOPm/2vBZdcOItPm+zFvVpO6gfQPakqoKFzL0UZygUwwK+tY=
X-Received: by 2002:a05:6808:4f67:b0:55b:ea1c:3ce8 with SMTP id 5614622812f47-5683c940da4mr1602630b6e.21.1794296663200;
        Mon, 09 Nov 2026 23:44:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:06 -0700
Subject: [PATCH v2 03/58] mtd: add opt-in lifetime ownership for backing
 objects
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-3-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Tze Yee Ng <tze.yee.ng@altera.com>
X-Mailer: b4 0.15.2

MTD references retain registered nodes, but do not retain the backing
object allocated by a controller driver. Keeping a partition open across
driver unbind can therefore leave its master and driver metadata freed.
Device references held outside get_mtd_device(), such as NVMEM
consumers, also need the backing object and the partition ancestry to
remain valid.

Add an optional master lifetime initialized by mtd_set_release(). The
driver owns the initial reference. Each registered node and acquired MTD
handle holds another reference. The node reference lasts through final
device release, and nested partitions retain their parent device until
then. mtd_put_master() drops the driver's reference after hardware has
been disconnected and the MTD devices unregistered.

Give OTP NVMEM providers their own backing-object references through the
NVMEM context callbacks. They are parented to the physical device rather
than the MTD node, so the node reference does not cover them. Keep these
references through final NVMEM device release, including after failed MTD
registration, and use the backing driver's module as the consumer owner.

Pin the release callback's module when the driver drops its reference.
If the module is initializing or unloading, wait for the remaining
references instead: failed module initialization can discard module text
despite reference pins, and unload cannot acquire a new pin. Keep the
MTD core module pinned through its device and OTP release callbacks too.
The device core owns the device callback reference and drops it after
the callback returns, including on registration failure.

Distinguish registration from retained references so an unregistered
node cannot be opened again. Balance master references for direct
opens even with MTD_PARTITIONED_MASTER disabled. Keep that decision
independent of later master publication, so an earlier partition
handle cannot drop an unacquired master reference.

Remove the lookup entry under mtd_table_mutex at the last MTD put, but
reserve its number until final device release. A retained NVMEM provider
still uses that number in its device name, so reusing it earlier would
make rebind fail with -EEXIST.

On registration failure, wait for the overridden device release callback
before returning ownership to the caller. This also covers delayed
kobject release, when an immediate caller free would be premature.

Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c   | 194 +++++++++++++++++++++++++++++++++++++++++-------
 include/linux/mtd/mtd.h |  16 ++++
 2 files changed, 183 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 30b16f135f07..1c31e2a5fbe0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -31,6 +31,7 @@
 #include <linux/nvmem-provider.h>
 #include <linux/root_dev.h>
 #include <linux/error-injection.h>
+#include <linux/completion.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -70,6 +71,7 @@ static struct class mtd_class = {
 };
 
 static DEFINE_IDR(mtd_idr);
+static DEFINE_IDA(mtd_ids);
 
 /* These are exported solely for the purpose of mtd_blkdevs.c. You
    should not use them for _anything_ else */
@@ -78,7 +80,15 @@ EXPORT_SYMBOL_GPL(mtd_table_mutex);
 
 struct mtd_info *__mtd_next_device(int i)
 {
-	return idr_get_next(&mtd_idr, &i);
+	struct mtd_info *mtd;
+
+	while ((mtd = idr_get_next(&mtd_idr, &i))) {
+		if (mtd->registered)
+			return mtd;
+		i++;
+	}
+
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(__mtd_next_device);
 
@@ -87,37 +97,117 @@ static LIST_HEAD(mtd_notifiers);
 
 #define MTD_DEVT(index) MKDEV(MTD_CHAR_MAJOR, (index)*2)
 
-/* REVISIT once MTD uses the driver model better, whoever allocates
- * the mtd_info will probably want to use the release() hook...
+static void mtd_master_release(struct kref *ref)
+{
+	struct mtd_info *master = container_of(ref, struct mtd_info,
+					     master.life_refcnt);
+	struct completion *done = master->master.release_done;
+	struct module *owner = master->master.release_owner;
+
+	master->master.release(master);
+	if (done)
+		complete(done);
+	else
+		module_put(owner);
+}
+
+static void mtd_get_lifetime(struct mtd_info *master)
+{
+	if (master->master.release)
+		kref_get(&master->master.life_refcnt);
+}
+
+static void mtd_put_lifetime(struct mtd_info *master)
+{
+	if (master->master.release)
+		kref_put(&master->master.life_refcnt, mtd_master_release);
+}
+
+/**
+ * mtd_set_release - initialize the lifetime of a dynamically allocated master
+ * @master: master MTD device
+ * @release: free the backing object and its retained metadata
+ *
+ * Call once before registration. The driver owns the initial reference and
+ * drops it with mtd_put_master() after unregistering and disconnecting hardware.
+ * Registered MTD devices and acquired handles retain the backing object too.
+ * The release callback must not access resources released by driver unbind.
+ */
+void mtd_set_release(struct mtd_info *master,
+		     void (*release)(struct mtd_info *mtd))
+{
+	kref_init(&master->master.life_refcnt);
+	master->master.release = release;
+}
+EXPORT_SYMBOL_GPL(mtd_set_release);
+
+/**
+ * mtd_put_master - drop the driver's initial lifetime reference
+ * @master: master initialized by mtd_set_release()
+ *
+ * Hardware access must already be disconnected and drained. Unbind may return
+ * while handles retain metadata. Keep the release callback's module loaded
+ * until that metadata is freed. If the module is already unloading, wait for
+ * the remaining references instead of scheduling a callback into the departing
+ * module. Also wait during module initialization, which may fail and discard
+ * the module despite pins.
  */
+void mtd_put_master(struct mtd_info *master)
+{
+	DECLARE_COMPLETION_ONSTACK(done);
+
+	if ((!master->owner || READ_ONCE(master->owner->state) == MODULE_STATE_LIVE) &&
+	    try_module_get(master->owner)) {
+		master->master.release_owner = master->owner;
+		mtd_put_lifetime(master);
+	} else {
+		master->master.release_done = &done;
+		mtd_put_lifetime(master);
+		wait_for_completion(&done);
+	}
+}
+EXPORT_SYMBOL_GPL(mtd_put_master);
+
 static void mtd_release(struct device *dev)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
-	dev_t index = MTD_DEVT(mtd->index);
+	struct mtd_info *master = mtd->ref_master;
+	struct mtd_info *parent = mtd->parent;
 
-	idr_remove(&mtd_idr, mtd->index);
+	/* Retained NVMEM providers use the MTD number in their device name. */
+	ida_free(&mtd_ids, mtd->index);
 	of_node_put(mtd_get_of_node(mtd));
 
 	if (mtd_is_partition(mtd))
 		release_mtd_partition(mtd);
 
-	/* remove /dev/mtdXro node */
-	device_destroy(&mtd_class, index + 1);
+	if (master) {
+		/* Nested partitions can outlive device_del() of their parents. */
+		if (parent && parent != master)
+			put_device(&parent->dev);
+		mtd_put_lifetime(master);
+	}
 }
 
 /*
- * No-op device release used in add_mtd_device() error paths.
+ * Hand failed registrations back to their caller only after device release.
  * Prevents mtd_release() from being called via device_release(),
  * which would free the mtd_info that the caller still manages.
  */
-static void mtd_dev_release_nop(struct device *dev)
+static void mtd_dev_release_done(struct device *dev)
 {
+	complete(dev_get_drvdata(dev));
 }
 
 static void mtd_device_release(struct kref *kref)
 {
 	struct mtd_info *mtd = container_of(kref, struct mtd_info, refcnt);
 	bool is_partition = mtd_is_partition(mtd);
+	bool managed = mtd->ref_master;
+
+	/* The table mutex is held by the registration or handle put path. */
+	idr_remove(&mtd_idr, mtd->index);
+	device_destroy(&mtd_class, MTD_DEVT(mtd->index) + 1);
 
 	debugfs_remove_recursive(mtd->dbg.dfs_dir);
 
@@ -131,10 +221,8 @@ static void mtd_device_release(struct kref *kref)
 	 *  Should not be done for partition,
 	 *  as it was already destroyed in device_unregister().
 	 */
-	if (!is_partition)
+	if (!is_partition && !managed)
 		memset(&mtd->dev, 0, sizeof(mtd->dev));
-
-	module_put(THIS_MODULE);
 }
 
 #define MTD_DEVICE_ATTR_RO(name) \
@@ -612,7 +700,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	config.id = NVMEM_DEVID_NONE;
 	config.dev = &mtd->dev;
 	config.name = dev_name(&mtd->dev);
-	config.owner = THIS_MODULE;
+	config.owner = mtd_get_master(mtd)->owner;
 	config.add_legacy_fixed_of_cells = of_device_is_compatible(node, "nvmem-cells");
 	config.reg_read = mtd_nvmem_reg_read;
 	config.size = mtd->size;
@@ -700,10 +788,13 @@ static struct device_node *mtd_find_of_node(struct mtd_info *mtd)
 
 int add_mtd_device(struct mtd_info *mtd)
 {
+	DECLARE_COMPLETION_ONSTACK(released);
 	struct device_node *np = mtd_get_of_node(mtd);
 	struct mtd_info *master = mtd_get_master(mtd);
 	struct mtd_notifier *not;
 	int i, error, ofidx;
+	u32 id;
+	bool wait_for_release = false;
 
 	/*
 	 * May occur, for instance, on buggy drivers which call
@@ -746,16 +837,28 @@ int add_mtd_device(struct mtd_info *mtd)
 	if (np)
 		ofidx = of_alias_get_id(np, "mtd");
 	if (ofidx >= 0)
-		i = idr_alloc(&mtd_idr, mtd, ofidx, ofidx + 1, GFP_KERNEL);
+		i = ida_alloc_range(&mtd_ids, ofidx, ofidx, GFP_KERNEL);
 	else
-		i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
+		i = ida_alloc(&mtd_ids, GFP_KERNEL);
 	if (i < 0) {
 		error = i;
 		goto fail_locked;
 	}
+	id = i;
+	error = idr_alloc_u32(&mtd_idr, mtd, &id, id, GFP_KERNEL);
+	if (error) {
+		ida_free(&mtd_ids, i);
+		goto fail_locked;
+	}
 
 	mtd->index = i;
 	kref_init(&mtd->refcnt);
+	if (master->master.release) {
+		mtd_get_lifetime(master);
+		mtd->ref_master = master;
+		if (mtd->parent && mtd->parent != master)
+			get_device(&mtd->parent->dev);
+	}
 
 	/* default value if not set by driver */
 	if (mtd->bitflip_threshold == 0)
@@ -802,6 +905,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	error = dev_set_name(&mtd->dev, "mtd%d", i);
 	if (error)
 		goto fail_devname;
+	mtd->dev.release_owner = THIS_MODULE;
 	dev_set_drvdata(&mtd->dev, mtd);
 	mtd_set_of_node(mtd, mtd_find_of_node(mtd));
 	error = device_register(&mtd->dev);
@@ -819,6 +923,7 @@ int add_mtd_device(struct mtd_info *mtd)
 		      "mtd%dro", i);
 
 	pr_debug("mtd: Giving out device %d to %s\n", i, mtd->name);
+	mtd->registered = true;
 	/* No need to get a refcount on the module containing
 	   the notifier, since we hold the mtd_table_mutex */
 	list_for_each_entry(not, &mtd_notifiers, list)
@@ -836,29 +941,38 @@ int add_mtd_device(struct mtd_info *mtd)
 		}
 	}
 
-	/* We _know_ we aren't being removed, because
-	   our caller is still holding us here. So none
-	   of this try_ nonsense, and no bitching about it
-	   either. :) */
-	__module_get(THIS_MODULE);
 	return 0;
 
 fail_nvmem_add:
 	device_del(&mtd->dev);
 fail_added:
 	/*
-	 * Clear type and set nop release to prevent mtd_release() ->
+	 * Clear type and override release to prevent mtd_release() ->
 	 * release_mtd_partition() -> free_partition() from freeing mtd.
 	 * The caller handles cleanup on failure.
 	 */
 	mtd->dev.type = NULL;
-	mtd->dev.release = mtd_dev_release_nop;
+	mtd->dev.release = mtd_dev_release_done;
+	dev_set_drvdata(&mtd->dev, &released);
+	wait_for_release = true;
 	put_device(&mtd->dev);
 	of_node_put(mtd_get_of_node(mtd));
 fail_devname:
 	idr_remove(&mtd_idr, i);
+	ida_free(&mtd_ids, i);
+	if (mtd->ref_master) {
+		mtd->ref_master = NULL;
+		if (mtd->parent && mtd->parent != master)
+			put_device(&mtd->parent->dev);
+		mtd_put_lifetime(master);
+	}
 fail_locked:
 	mutex_unlock(&mtd_table_mutex);
+	if (wait_for_release) {
+		wait_for_completion(&released);
+		mtd->dev.release = NULL;
+		dev_set_drvdata(&mtd->dev, mtd);
+	}
 	return error;
 }
 
@@ -879,7 +993,7 @@ int del_mtd_device(struct mtd_info *mtd)
 
 	mutex_lock(&mtd_table_mutex);
 
-	if (idr_find(&mtd_idr, mtd->index) != mtd) {
+	if (idr_find(&mtd_idr, mtd->index) != mtd || !mtd->registered) {
 		ret = -ENODEV;
 		goto out_error;
 	}
@@ -889,6 +1003,7 @@ int del_mtd_device(struct mtd_info *mtd)
 	list_for_each_entry(not, &mtd_notifiers, list)
 		not->remove(mtd);
 
+	mtd->registered = false;
 	kref_put(&mtd->refcnt, mtd_device_release);
 	ret = 0;
 
@@ -950,6 +1065,16 @@ static ssize_t mtd_otp_size(struct mtd_info *mtd, bool is_user)
 	return ret == -ENODATA ? 0 : ret;
 }
 
+static void mtd_otp_nvmem_get(void *priv)
+{
+	mtd_get_lifetime(priv);
+}
+
+static void mtd_otp_nvmem_put(void *priv)
+{
+	mtd_put_lifetime(priv);
+}
+
 static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 						   const char *compatible,
 						   int size,
@@ -966,7 +1091,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 	config.dev = mtd->dev.parent;
 	config.name = compatible;
 	config.id = NVMEM_DEVID_AUTO;
-	config.owner = THIS_MODULE;
+	config.owner = mtd->owner;
 	config.add_legacy_fixed_of_cells = !mtd_type_is_nand(mtd);
 	config.type = NVMEM_TYPE_OTP;
 	config.root_only = true;
@@ -975,6 +1100,11 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 	config.size = size;
 	config.of_node = np;
 	config.priv = mtd;
+	if (mtd->master.release) {
+		config.priv_get = mtd_otp_nvmem_get;
+		config.priv_put = mtd_otp_nvmem_put;
+		config.priv_owner = THIS_MODULE;
+	}
 
 	nvmem = nvmem_register(&config);
 	/* Just ignore if there is no NVMEM support in the kernel */
@@ -1332,8 +1462,12 @@ EXPORT_SYMBOL_GPL(get_mtd_device);
 int __get_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	bool master_ref = mtd == master || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER);
 	int err;
 
+	if (!mtd->registered)
+		return -ENODEV;
+
 	if (master->_get_device) {
 		err = master->_get_device(mtd);
 		if (err)
@@ -1346,13 +1480,14 @@ int __get_mtd_device(struct mtd_info *mtd)
 		return -ENODEV;
 	}
 
+	mtd_get_lifetime(master);
 	while (mtd) {
 		if (mtd != master)
 			kref_get(&mtd->refcnt);
 		mtd = mtd->parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master_ref)
 		kref_get(&master->refcnt);
 
 	return 0;
@@ -1437,8 +1572,10 @@ EXPORT_SYMBOL_GPL(put_mtd_device);
 void __put_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	bool master_ref = mtd == master || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER);
 	/* master can be freed in _put_device */
 	struct module *owner = master->owner;
+	bool managed = master->master.release;
 
 	while (mtd) {
 		/* kref_put() can relese mtd, so keep a reference mtd->parent */
@@ -1449,12 +1586,14 @@ void __put_mtd_device(struct mtd_info *mtd)
 		mtd = parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master_ref)
 		kref_put(&master->refcnt, mtd_device_release);
 
-	/* must be the last use of master */
+	/* Legacy _put_device() callbacks can free an unmanaged master. */
 	if (master->_put_device)
 		master->_put_device(master);
+	if (managed)
+		mtd_put_lifetime(master);
 
 	/* _put_device() runs code from @owner, so drop the module last */
 	module_put(owner);
@@ -2671,6 +2810,7 @@ static void __exit cleanup_mtd(void)
 	bdi_unregister(mtd_bdi);
 	bdi_put(mtd_bdi);
 	idr_destroy(&mtd_idr);
+	ida_destroy(&mtd_ids);
 }
 
 module_init(init_mtd);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index cd7b4671c456..eb9fd9ea0c79 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -187,6 +187,7 @@ struct mtd_pairing_scheme {
 };
 
 struct module;	/* only needed for owner field in mtd_info */
+struct completion;
 
 /**
  * struct mtd_debug_info - debugging information for an MTD device.
@@ -225,6 +226,10 @@ struct mtd_part {
  *		     sub-partitions.
  * @suspended: set to 1 when the device is suspended, 0 otherwise
  * @unregistering: removal has started; protected by partitions_lock
+ * @life_refcnt: optional lifetime reference count for the backing object
+ * @release: free the backing object after its last lifetime reference
+ * @release_owner: module reference held during deferred release
+ * @release_done: completion used when the owner module is already unloading
  *
  * This struct is embedded in mtd_info and contains master-specific
  * properties/fields. The master is the root MTD device from the MTD partition
@@ -235,6 +240,10 @@ struct mtd_master {
 	struct mutex chrdev_lock;
 	unsigned int suspended : 1;
 	bool unregistering;
+	struct kref life_refcnt;
+	void (*release)(struct mtd_info *mtd);
+	struct module *release_owner;
+	struct completion *release_done;
 };
 
 struct mtd_info {
@@ -382,6 +391,10 @@ struct mtd_info {
 	struct module *owner;
 	struct device dev;
 	struct kref refcnt;
+	/* Protected by mtd_table_mutex; false after del_mtd_device(). */
+	bool registered;
+	/* Lifetime reference held until the device release callback. */
+	struct mtd_info *ref_master;
 	struct mtd_debug_info dbg;
 	struct nvmem_device *nvmem;
 	struct nvmem_device *otp_user_nvmem;
@@ -683,6 +696,9 @@ extern int mtd_device_parse_register(struct mtd_info *mtd,
 #define mtd_device_register(master, parts, nr_parts)	\
 	mtd_device_parse_register(master, NULL, NULL, parts, nr_parts)
 extern int mtd_device_unregister(struct mtd_info *master);
+void mtd_set_release(struct mtd_info *master,
+		     void (*release)(struct mtd_info *mtd));
+void mtd_put_master(struct mtd_info *master);
 extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
 extern int __get_mtd_device(struct mtd_info *mtd);
 extern void __put_mtd_device(struct mtd_info *mtd);

-- 
2.53.0

