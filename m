Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446916;
	b=TRZcvGKDWGJrDBc0Qz1hI0dOL2xVu2xyvoll17OemHsK1m+jvIun2l7hL4+blaCmDyqz
	 hF2uE7vHoW0NnUU9s8HyDIbx3pU1kkkRW4CIDwIyvzdLUeNlbVbg2/e8s6nGwp5CEHJy3
	 R28avMUB59YYTum70tQQR1lRkwqH3ee+D2VQ3XuHjnLXh7X2UiWAfSgdVB1xbX3+cAja0
	 +sd9+k1iDHIfqWxL+bMOqOwuOERj2Yd2hT3LbYjKKsh4XmWFLV1iEqZxisVwnUXYRDrN3
	 t7vbMftYtQI9Lwg5EvzDjt+2rWm5F4+ZKNiJK3u4zA0TsqR++tTyxF/oRvGyZCi1Jew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=j/FhPWUdLG1qHDBbvBHhesyHiD6YUo9x8OX9klaiqEs=;
	b=GVjvR6+Sxjg7fQSIKhhKIUYEEz10l1WdCVCAxTI27NBpavlQ86DwscGVqz4brt+8IBb8
	 kHmq7ym1fuzv+01bXH7wToj4RR6vVDC6XCaiwZDU7Ui50176nMP8cEV2lqTC5rdfMq4mt
	 Xds3Gt5ZEh1F5AtmYjob09z6zNRCezz32ZY7nsmjHxbgwcj4xvwwOHsFI8bA/IIyVuVhF
	 CSGfh4m2CUdwtPX2ENBxU5v02s/ndc4K6pmZ1PYuwGk+Mqvi0f3Ox5JchvyuycmORjzVU
	 3lkYOAC4Svm8tELAsDdRBrzzFaiVKRrUTRZX/sd7HKn5+NToT9H53q5nuc8cGkPJnCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axAQNWSA;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97931606A880
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97931606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axAQNWSA
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-85f39332862so1540320a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446914; x=1795051714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/FhPWUdLG1qHDBbvBHhesyHiD6YUo9x8OX9klaiqEs=;
        b=axAQNWSAYEje80YBKsLYmqJmG4XVvgc/2wtdR6HlElUxMTiAl8tOfoutv6YRz64wgM
         tM1HleSYXnXieneF+j4SzCO/DrJUxomQK+VLQ8agaN5+MnHbsi6bZESYIdZHKVOByWfB
         8YJ+KVW8CGMbtaDkfYAUsqCfmcyB5BtfYDYJPDAOQG9JW+9bqFW2gtIZBK9lCo+snuQD
         zrQSIzDO1QoOdn1SAADJ2wmSQygE+9R9xL1qvSKC6sIe9JvNDNkjGLrBdJGVAKs/qiJC
         UFnoWcNJBJfsKMSERAjJKwSqNfzSWilvoMYz2ysKE3zWVDyS828vOlCooimyPOzzzkr1
         ydtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446914; x=1795051714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/FhPWUdLG1qHDBbvBHhesyHiD6YUo9x8OX9klaiqEs=;
        b=uWQAVXtWXGmnQrqsvzXN+vao9deBk2mrdk+kkkQnvJhan1Td3u1l6AiJHQrRFYVIFD
         As0OW3lbqx7ltPttH6R5WWeLcGxrj0Wfxy1Ymd6cUX2iteTLaD+liR7FP1igBG9KqEus
         FIY1CRor6BjHUBM2Tl12XBhSueNPqPFYF+aNNLCZx/oE50pFDAbSDsxKmJ73CfmeSkGf
         mpAk7p1ZsJfUEdUkavd+dRCWcpNYpiclh61oeNaeCx3+LdDaMC9bISNCrznv40NVp62v
         xEsjUu+bO8DuZwL4hE5g7XTMTjO8655SX0M/ZRukNwW0cVHiqaA/KmCBvuZUOI2LkaRC
         qWog==
X-Forwarded-Encrypted: i=1; AL+hErEWZHsvMKiTgecOizMKdF2ZAhRWtiV0eRCNAlgJs286mjHvcXYAxSXukRo+QVtnbLpp7fogdEWemjL1v9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kQvLz2+O3kkbhD4fCFF9HVT+x47Vk7T/TkkTw2YWTcnO8m3rH
	jT6yF9ZcGT6lPr6YrE6sWkvoKypjkK0B9bUrwTlEQt0MuFUZ30br6II/
X-Gm-Gg: AYBFou3WdgfX5/IyOhl7Yn1JyGrB4vhSjLNz3Gkz9T5A8aWJwbLdA+LbyGffYzesSYk
	TWvUKrD+q30T4CxkqLOjXbJ3QkoTZNHW8JNGTGZAvnmBvgdeoX0oHlFwqNBwYruSjLOE0XS/SLg
	Zit0/xOmUIEJUualpSfXvcjRv8ENF+uVJycqOU/iM0iNHy3gPawEjDP0t9I6OEpuXbfRgGXnL2f
	Gm6sHgGqR+N6gPsPkiR1WmAytgF205WklLe5eDidh2b3bEHabCt81uihES3MvpSEVo8g07u7yUq
	NidimZYfVFUngw3tB+07Gyq5HkcUwqP+Wu7ZQuZW65/A+BOw4ZL0eZrGfevdpE+zLfoJR2aNdE/
	nXFGredx0NqySS2SoLGHhFzxAui3oEsDEfsGQcpQ/6cIodENEGIkGGR7N1Q/NtqFNEWSriCZZS1
	8ShJf0lcYUzHYxo/BvFIELr6tbv8IiZr82xEABimqAni2A8520oT4pqGnGZvRWYBTWjpNfDD16K
	r8iShJKsUOsHuIq8yAHzPsXODj4/mY+JAMCs2qKkdU9y2N7pybJW/Yv5G5M/udXKZzlxZX4vtke
	nmy7W/71LKrHLoHWlWxQR0bnBTSPNX32Bz/GWifFkxwlByhkAXixGyn4NfW0xpuwXU3mWlGDqew
	1KTmfAPZQc4ZzoJS6JbKPBbtuEbq7npYkD6hMPSTS6RrK8Cn+JEreBZIZgIwtqgSlv7s4M4f7e4
	1Jsn7oZaAp0BVS8OkKAo1BrFm4b7eAQuBSKs2fGwzP7YgJJcW/fnotG+1Qwcs4f+A0NSrZfmB1d
	w==
X-Received: by 2002:a05:6808:448b:b0:4fb:ac9b:b076 with SMTP id 5614622812f47-56b9852398bmr3912125b6e.67.1794446914344;
        Wed, 11 Nov 2026 17:28:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:45 -0700
Subject: [PATCH v3 06/58] mtd: rawnand: share retained chip and controller
 ownership
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-6-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Tze Yee Ng <tze.yee.ng@altera.com>
X-Mailer: b4 0.15.2

Retained MTD handles need chip locks and immutable metadata after their
controller is removed. Run NAND cleanup during disconnection, while
manufacturer, ECC and controller callbacks are still available. Leave
only core-owned allocation release for the final MTD put.

Copy the chip name and snapshot its OOB layout before publication.
Retained layout queries then use NAND-core callbacks and copied regions,
without touching driver-owned tables or working buffers freed by cleanup.
Use the NAND core as the MTD operation owner so an open handle does not
keep the hardware driver loaded.

Provide reference-counted controller storage with an initial managed
reference, acquired before hardware resources. Each chip holds another
reference, allowing devres teardown and the last chip put to release the
allocation independently. Support separate chips and chips embedded in a
shared allocation without controller-specific final-release callbacks.

Serialize complete bad-block marking with cleanup: its BBM and BBT steps
drop the chip lock between operations. Disconnect and wake suspended
waiters before waiting for that sequence to finish. Protect reserved-block
queries and secured-region checks before freeing their backing tables.

Cc: Tze Yee Ng <tze.yee.ng@altera.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/Makefile        |   1 +
 drivers/mtd/nand/raw/nand_base.c     |  29 ++++-
 drivers/mtd/nand/raw/nand_lifetime.c | 246 +++++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h          |  28 ++++
 4 files changed, 297 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 619760138d32..7ea275a40fcd 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_MTD_NAND_NUVOTON_MA35)	+= nuvoton-ma35d1-nand-controller.o
 obj-$(CONFIG_MTD_NAND_LOONGSON)		+= loongson-nand-controller.o
 
 nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
+nand-objs += nand_lifetime.o
 nand-objs += nand_onfi.o
 nand-objs += nand_jedec.o
 nand-objs += nand_amd.o
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 720da4174833..dec9615c2900 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -363,8 +363,8 @@ int nand_get_device(struct nand_chip *chip)
  * Unregister the MTD device first so removal notifiers can finish their I/O.
  * Call before releasing controller resources. Operations waiting for resume
  * are woken and fail with -ENODEV.
- * The chip, controller lock and NAND metadata must remain alive
- * until existing MTD handles are released; nand_cleanup() is a separate step.
+ * For chips with retained storage, run NAND cleanup before returning. Existing
+ * handles retain the disconnected chip and a core-owned OOB layout snapshot.
  */
 void nand_disconnect(struct nand_chip *chip)
 {
@@ -374,6 +374,11 @@ void nand_disconnect(struct nand_chip *chip)
 	mutex_unlock(&chip->controller->lock);
 	mutex_unlock(&chip->lock);
 	wake_up_all(&chip->resume_wq);
+	if (chip->lifetime) {
+		guard(mutex)(&chip->markbad_lock);
+
+		nand_cleanup(chip);
+	}
 }
 EXPORT_SYMBOL_GPL(nand_disconnect);
 
@@ -639,6 +644,9 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
+	guard(mutex)(&chip->lock);
+	if (chip->disconnected)
+		return -ENODEV;
 	if (!chip->bbt)
 		return 0;
 	/* Return info from the table */
@@ -4569,15 +4577,17 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 	if (check_offs_len(chip, instr->addr, instr->len))
 		return -EINVAL;
 
-	/* Check if the region is secured */
-	if (nand_region_is_secured(chip, instr->addr, instr->len))
-		return -EIO;
-
 	/* Grab the lock and see if the device is available */
 	ret = nand_get_device(chip);
 	if (ret)
 		return ret;
 
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, instr->addr, instr->len)) {
+		nand_release_device(chip);
+		return -EIO;
+	}
+
 	/* Shift to get first page */
 	page = (int)(instr->addr >> chip->page_shift);
 	chipnr = (int)(instr->addr >> chip->chip_shift);
@@ -4703,8 +4713,12 @@ static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
  */
 static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
+	struct nand_chip *chip = mtd_to_nand(mtd);
 	int ret;
 
+	/* The BBM and BBT updates acquire the chip lock separately. */
+	guard(mutex)(&chip->markbad_lock);
+
 	ret = nand_block_isbad(mtd, ofs);
 	if (ret) {
 		/* If it was bad already, return success and do nothing */
@@ -4713,7 +4727,7 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		return ret;
 	}
 
-	return nand_block_markbad_lowlevel(mtd_to_nand(mtd), ofs);
+	return nand_block_markbad_lowlevel(chip, ofs);
 }
 
 /**
@@ -5617,6 +5631,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	chip->cur_cs = -1;
 
 	mutex_init(&chip->lock);
+	mutex_init(&chip->markbad_lock);
 	init_waitqueue_head(&chip->resume_wq);
 
 	/* Enforce the right timings for reset/detection */
diff --git a/drivers/mtd/nand/raw/nand_lifetime.c b/drivers/mtd/nand/raw/nand_lifetime.c
new file mode 100644
index 000000000000..f2746ef9ea65
--- /dev/null
+++ b/drivers/mtd/nand/raw/nand_lifetime.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Storage lifetime for disconnected NAND controllers and chips. */
+
+#include <linux/device.h>
+#include <linux/kref.h>
+#include <linux/module.h>
+#include <linux/mtd/rawnand.h>
+#include <linux/slab.h>
+
+struct nand_lifetime {
+	void *allocation;
+	struct nand_storage *storage;
+	unsigned int ecc_sections;
+	unsigned int free_sections;
+	int ecc_end;
+	int free_end;
+	struct mtd_oob_region regions[];
+};
+
+static void nand_storage_release(struct kref *ref)
+{
+	struct nand_storage *storage = container_of(ref, struct nand_storage, refcnt);
+
+	kfree(storage->allocation);
+}
+
+/**
+ * nand_storage_init - initialize shared allocation ownership
+ * @storage: reference count embedded in the allocation
+ * @allocation: allocation to free with kfree() after the final put
+ */
+void nand_storage_init(struct nand_storage *storage, void *allocation)
+{
+	kref_init(&storage->refcnt);
+	storage->allocation = allocation;
+}
+EXPORT_SYMBOL_GPL(nand_storage_init);
+
+void nand_storage_get(struct nand_storage *storage)
+{
+	kref_get(&storage->refcnt);
+}
+EXPORT_SYMBOL_GPL(nand_storage_get);
+
+void nand_storage_put(void *data)
+{
+	struct nand_storage *storage = data;
+
+	kref_put(&storage->refcnt, nand_storage_release);
+}
+EXPORT_SYMBOL_GPL(nand_storage_put);
+
+/**
+ * devm_nand_storage_init - retain an allocation through managed teardown
+ * @dev: device whose managed resources use the allocation
+ * @storage: reference count embedded in the allocation
+ * @allocation: allocation to free with kfree() after the final put
+ *
+ * Call before acquiring resources that use the allocation. Takes ownership
+ * even on failure. Chips can hold additional references after driver unbind.
+ */
+int devm_nand_storage_init(struct device *dev, struct nand_storage *storage,
+			   void *allocation)
+{
+	nand_storage_init(storage, allocation);
+	return devm_add_action_or_reset(dev, nand_storage_put, storage);
+}
+EXPORT_SYMBOL_GPL(devm_nand_storage_init);
+
+/**
+ * devm_nand_controller_init - initialize retained controller storage
+ * @dev: controller device
+ * @controller: controller embedded in non-devm storage
+ * @allocation: allocation containing the controller, freed with kfree()
+ *
+ * Call before acquiring managed hardware resources. Device teardown drops its
+ * reference after releasing those resources. Takes ownership even on failure.
+ */
+int devm_nand_controller_init(struct device *dev, struct nand_controller *controller,
+			      void *allocation)
+{
+	nand_controller_init(controller);
+	return devm_nand_storage_init(dev, &controller->storage, allocation);
+}
+EXPORT_SYMBOL_GPL(devm_nand_controller_init);
+
+static int nand_mtd_get_device(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd_get_master(mtd));
+
+	guard(mutex)(&chip->lock);
+	return chip->disconnected ? -ENODEV : 0;
+}
+
+static int nand_retained_ooblayout_ecc(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *region)
+{
+	struct nand_lifetime *lifetime = mtd_to_nand(mtd)->lifetime;
+
+	if (section >= lifetime->ecc_sections)
+		return lifetime->ecc_end;
+	*region = lifetime->regions[section];
+	return 0;
+}
+
+static int nand_retained_ooblayout_free(struct mtd_info *mtd, int section,
+				      struct mtd_oob_region *region)
+{
+	struct nand_lifetime *lifetime = mtd_to_nand(mtd)->lifetime;
+
+	if (section >= lifetime->free_sections)
+		return lifetime->free_end;
+	*region = lifetime->regions[lifetime->ecc_sections + section];
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops nand_retained_ooblayout = {
+	.ecc = nand_retained_ooblayout_ecc,
+	.free = nand_retained_ooblayout_free,
+};
+
+static void nand_mtd_release(struct mtd_info *mtd)
+{
+	struct nand_lifetime *lifetime = mtd_to_nand(mtd)->lifetime;
+	struct nand_storage *storage = lifetime->storage;
+	struct device *parent = mtd->parent_dev;
+
+	of_node_put(mtd_get_of_node(mtd));
+	kfree(mtd->name);
+	kfree(lifetime->allocation);
+	kfree(lifetime);
+	if (storage)
+		nand_storage_put(storage);
+	put_device(parent);
+}
+
+static int nand_prepare_lifetime(struct nand_chip *chip, void *allocation,
+				 struct nand_storage *storage)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_lifetime *lifetime;
+	struct mtd_oob_region region;
+	unsigned int ecc_sections, free_sections;
+	const char *name = mtd->name;
+	int ecc_end, free_end, ret;
+	char *copy;
+
+	/* Keep layout queries independent of controller-owned code and data. */
+	for (ecc_sections = 0; ; ecc_sections++) {
+		ecc_end = mtd_ooblayout_ecc(mtd, ecc_sections, &region);
+		if (ecc_end)
+			break;
+	}
+	if (ecc_end != -ERANGE && ecc_end != -ENOTSUPP)
+		return ecc_end;
+	for (free_sections = 0; ; free_sections++) {
+		free_end = mtd_ooblayout_free(mtd, free_sections, &region);
+		if (free_end)
+			break;
+	}
+	if (free_end != -ERANGE && free_end != -ENOTSUPP)
+		return free_end;
+
+	lifetime = kzalloc(struct_size(lifetime, regions, ecc_sections + free_sections),
+			   GFP_KERNEL);
+	if (!lifetime)
+		return -ENOMEM;
+	for (unsigned int i = 0; i < ecc_sections; i++) {
+		ret = mtd_ooblayout_ecc(mtd, i, &lifetime->regions[i]);
+		if (ret)
+			goto free_lifetime;
+	}
+	for (unsigned int i = 0; i < free_sections; i++) {
+		ret = mtd_ooblayout_free(mtd, i, &lifetime->regions[ecc_sections + i]);
+		if (ret)
+			goto free_lifetime;
+	}
+
+	if (!name)
+		name = dev_name(mtd->parent_dev);
+	copy = kstrdup(name, GFP_KERNEL);
+	if (!copy) {
+		ret = -ENOMEM;
+		goto free_lifetime;
+	}
+
+	lifetime->allocation = allocation;
+	lifetime->storage = storage;
+	lifetime->ecc_sections = ecc_sections;
+	lifetime->free_sections = free_sections;
+	lifetime->ecc_end = ecc_end;
+	lifetime->free_end = free_end;
+	chip->lifetime = lifetime;
+	mtd->name = copy;
+	mtd->owner = THIS_MODULE;
+	mtd->_get_device = nand_mtd_get_device;
+	mtd_set_ooblayout(mtd, &nand_retained_ooblayout);
+	get_device(mtd->parent_dev);
+	of_node_get(nand_get_flash_node(chip));
+	if (storage)
+		nand_storage_get(storage);
+	mtd_set_release(mtd, nand_mtd_release);
+
+	return 0;
+
+free_lifetime:
+	kfree(lifetime);
+	return ret;
+}
+
+/**
+ * nand_set_lifetime - retain a scanned chip until its final MTD reference
+ * @chip: successfully scanned, unpublished NAND chip
+ * @allocation: chip allocation, or NULL if embedded in retained controller storage
+ *
+ * Copies the name and OOB layout and retains the parent, flash node and managed
+ * controller allocation. On success, unregister MTD, call nand_disconnect() to
+ * drain operations and run NAND cleanup, then call mtd_put_master(). Use the
+ * same disconnect/put sequence on registration failure. Final release only
+ * frees data in the NAND core; it never calls back into the controller driver.
+ *
+ * Return: zero on success or a negative error, leaving ownership unchanged.
+ */
+int nand_set_lifetime(struct nand_chip *chip, void *allocation)
+{
+	struct nand_storage *storage = &chip->controller->storage;
+
+	if (!storage->allocation)
+		storage = NULL;
+	return nand_prepare_lifetime(chip, allocation, storage);
+}
+EXPORT_SYMBOL_GPL(nand_set_lifetime);
+
+/**
+ * nand_set_shared_lifetime - retain a chip embedded in a shared allocation
+ * @chip: successfully scanned, unpublished NAND chip
+ * @storage: shared allocation containing the chip
+ *
+ * Like nand_set_lifetime(), but for a chip whose allocation is independent of
+ * its controller, and must also outlive other device-managed resources.
+ */
+int nand_set_shared_lifetime(struct nand_chip *chip, struct nand_storage *storage)
+{
+	return nand_prepare_lifetime(chip, NULL, storage);
+}
+EXPORT_SYMBOL_GPL(nand_set_shared_lifetime);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 90b2169cc745..e6b78d0f2deb 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -22,6 +22,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/types.h>
+#include <linux/kref.h>
 
 struct nand_chip;
 struct gpio_desc;
@@ -1104,6 +1105,22 @@ struct nand_controller_ops {
 			       const struct nand_interface_config *conf);
 };
 
+/**
+ * struct nand_storage - allocation retained by disconnected NAND devices
+ * @refcnt: references to the allocation
+ * @allocation: allocation freed by the NAND core after the final put
+ */
+struct nand_storage {
+	struct kref refcnt;
+	void *allocation;
+};
+
+void nand_storage_init(struct nand_storage *storage, void *allocation);
+void nand_storage_get(struct nand_storage *storage);
+void nand_storage_put(void *storage);
+int devm_nand_storage_init(struct device *dev, struct nand_storage *storage,
+			   void *allocation);
+
 /**
  * struct nand_controller - Structure used to describe a NAND controller
  *
@@ -1116,6 +1133,7 @@ struct nand_controller_ops {
  *			changing the column.
  * @supported_op.cont_read: The controller supports sequential cache reads.
  * @controller_wp:	the controller is in charge of handling the WP pin.
+ * @storage:		optional retained controller allocation
  */
 struct nand_controller {
 	struct mutex lock;
@@ -1125,6 +1143,7 @@ struct nand_controller {
 		unsigned int cont_read: 1;
 	} supported_op;
 	bool controller_wp;
+	struct nand_storage storage;
 };
 
 static inline void nand_controller_init(struct nand_controller *nfc)
@@ -1132,6 +1151,9 @@ static inline void nand_controller_init(struct nand_controller *nfc)
 	mutex_init(&nfc->lock);
 }
 
+int devm_nand_controller_init(struct device *dev, struct nand_controller *controller,
+			      void *allocation);
+
 /**
  * struct nand_legacy - NAND chip legacy fields/hooks
  * @IO_ADDR_R: address to read the 8 I/O lines of the flash device
@@ -1266,6 +1288,7 @@ struct nand_secure_region {
  * @buf_align: Minimum buffer alignment required by a platform
  * @lock: Lock protecting the suspended and disconnected fields. Also serializes
  *        accesses to the NAND device
+ * @markbad_lock: Serializes complete BBM/BBT updates with disconnect cleanup
  * @suspended: Set to 1 when the device is suspended, 0 when it's not
  * @disconnected: Controller resources are unavailable; reject hardware access
  * @resume_wq: wait queue to sleep if rawnand is in suspended state.
@@ -1285,6 +1308,7 @@ struct nand_secure_region {
  *              independent devices
  * @ecc: The ECC controller structure
  * @priv: Chip private data
+ * @lifetime: Core-owned metadata and allocation references for retained handles
  */
 struct nand_chip {
 	struct nand_device base;
@@ -1327,6 +1351,7 @@ struct nand_chip {
 
 	/* Internals */
 	struct mutex lock;
+	struct mutex markbad_lock;
 	bool suspended;
 	bool disconnected;
 	wait_queue_head_t resume_wq;
@@ -1345,6 +1370,7 @@ struct nand_chip {
 	struct nand_controller *controller;
 	struct nand_ecc_ctrl ecc;
 	void *priv;
+	struct nand_lifetime *lifetime;
 };
 
 static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
@@ -1598,6 +1624,8 @@ void nand_wait_ready(struct nand_chip *chip);
  */
 void nand_cleanup(struct nand_chip *chip);
 void nand_disconnect(struct nand_chip *chip);
+int nand_set_lifetime(struct nand_chip *chip, void *allocation);
+int nand_set_shared_lifetime(struct nand_chip *chip, struct nand_storage *storage);
 
 /*
  * External helper for controller drivers that have to implement the WAITRDY

-- 
2.53.0

