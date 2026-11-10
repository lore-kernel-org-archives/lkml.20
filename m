Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296668;
	b=xDJbRMC2478hyDGSi55ryqYSiH03+cfXkwbWht7wmSFfru7H9AreCj3Z3nWg8kFeT0XB
	 Tg81ZL5n2E1ifV1+PtoIzYzGbA2pCCaFP7Cw9kqOFCgZAxZcl3wcbB8V/5iNsPegdSF9j
	 loCnWSDktaoCYwo9P5HOSB6VyHdOu6nzRYV1+QUxWGrypJ5kDlZ0c+QtQYecNiw39TQ+/
	 t6j9mUk6ndxBgHyoJ2mcLFVT9gAfhhcHyYanaiL2UQBdkn9+JiLtTYv1CeN9UM60b8S/c
	 glhnux6vMpW9eOEhpGBk9L+bTqDLSJRrmK8Fc68EbDwKf23WBPF9pRjj05dd0neFaXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VIby35zT50yU+I8wiHG/mbaVDPcpxbeKRvU9uf9/5TA=;
	b=uZuEcwlAO0IfPHbsuanckSPyQUhGNAe8ICYP4ZxywrHeuxQnb7G8sb16MRCSnH2sAkGe
	 r7IdkYeXwaZMiOTd/3TLxyzy0dkzbw4cdRuaHxzi06f+Tm5Ekx4zKMleIacBQivaZjXQF
	 AlATHoMv2AnlIWBKYVBW65GxhvaNhohhrGFthbYu8YVjQtBnRPkatVrmyko4Dx+73QsZo
	 C8I3C+OhZkjM8+vNyIQPiny0T0NtEzp3ivDVbHWLGO++yjOHGv7PHahuHXjOVsrgT0x8j
	 pVicTFaRxBFs83VUbf0GqSBoisBshwi27qFOaAO5xqQQlrZDyVnlbgqG9jp2r/q5ngA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sg54HZXs;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B823A606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B823A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sg54HZXs
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4af81963f35so775006b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296667; x=1794901467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VIby35zT50yU+I8wiHG/mbaVDPcpxbeKRvU9uf9/5TA=;
        b=Sg54HZXsHlKl7ilUk25WwUzlNX/P9ZuGB0er3OOVx43faSUvZ6W75bQ/rETdfwLixK
         oc0uMhSvg3BX3SrxvZvqv4UppFlNfqlE6FdwI4oYOv1+tsXFELXDdDPW1S40A454aSWr
         hJdqD4f/MY1fyHZ335MLv5yVREVF+2leHYJMGFVc0PcpOXAWP68z/OrTDl+1rtSca9hI
         BWzElV5M7NUxJQEiQ+7E9agtMblsHXYeS/4uXPa0/KuaxdwezPfKjzD3kFFznFCjKR1Z
         3X+hvcPVUJREbYdgzs+WNfkiH4U8NH1EEswy03aPz4y0l+DT3mPrWXWyJ0t/8ydYp/N2
         jyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296667; x=1794901467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIby35zT50yU+I8wiHG/mbaVDPcpxbeKRvU9uf9/5TA=;
        b=0fGgPq5Qswo894lyjzzxuMScKmNE4MxyAN1BBBLw17qI1WZ577WmEhHcYMer3+skdd
         2k5o6L+9peEsXDhkpDfI7GqyT3J9AjtJtodEEdT085JSd1KYkXjD2ZNdWMW42Wktv4+p
         9WypNE26ZQV8Uy5IaPOz9+ziv+lIvGzyX+FHByYszmnbU/T4WPkhlzAjNNJ07GVH8eEx
         xtV+CO5NEkKbqpz/bmyGrigAX7WU57tqReRqAo3lsB41EKjzegXSNnCvwVtttICgv9yM
         Z9irjKnzbReW6rutf1vGeiHZAGSJazLaV8zVOyJcNNlz1aGFR9umHOXmkWlv6tPTef18
         bF5w==
X-Forwarded-Encrypted: i=1; AL+hErHU2MHH9Esoxd8nHmbSR2KRXYc0PIN29FvTNMaO/L5d3cQs0lrF9Xq1+g/DAjIfx7cxrlSJ0CEuIkF+EI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uSIuI3dHjaErHhva2QgqWIX6QeRRdiis1XSe88HMZyPpHAVAL
	IaS72BqehC8fhhtdMxYRQYaGrz8E7iIcVkQwbFjUQNFQcOmit6eDW5TdRm6enTHR
X-Gm-Gg: AYBFou3jDluFhrcAF/iCzYQ4HP/1jGJ3qEL8gV1QHrWtYnJS/Bfpg5JRUqByapoHwIO
	g+V/iE0ui92TIwjsD3trK3o78kQxF/ofcN3rpTsWXArxyOxMsjXY4ZZOxl+J0vEpDei62dbF4Ts
	xxFLy8sQQif+cECwYtVFeDbr/UKhHeBQ9RIgto6K/faY3oQMPaYo9PUvSegEsssJK32BeqZH/Tl
	ULM3J/xnoyINl0VffiOanAz06ZyfYWEfjVNAccPV15zwc7MjCeetlDGbTT2U9140iir4yK5R+ag
	Za8YB1ObaxO5reEZexZ4TeCp84yue+Z9/WYTx6EyVCNWOg/P6hD5XAQU6pkzEry2Xm+xzYFkZJj
	aFBp07Ra+63Tjol59/7LW5OV6vNSDbTzTSeus1AcPMGd8KTRcWUqs/ovxbPZAH88yttF/F3X3LV
	Y3lR4QP9WgYg1r1XZGnXMAVHpKxb/XtTUUb1WwC9UhKf66Ekk+11r9AQSEL15DKYtzUPHjeMRDl
	usrd30urnbU3zpInO4x6TaCe2Ezd5s8epM4t7IIz0Qit8dEE2NQ7pH2S/2ONzPM3Ff/oP9YaCzD
	Mywr5Nv8nMlQWGzW9CxksivLX6Xu1egN/11TCzpflh2dyo50PPOVxgRYjZw5FMxFD78VPuqUSV5
	6Cw5YFy+r84A79pM02LS722WLmdUQ6rZfroblsllFAk1AE/jSu1OK3GQTuNpm4ZznH1uOgwF8qy
	P2Ck8/Br76/58vmdvV4zZTfT5WuSYULoKGw0yTeJRfG4LzTR6OhvA=
X-Received: by 2002:a05:6808:13d3:b0:4f4:3790:6615 with SMTP id 5614622812f47-5683c9472bfmr1566292b6e.11.1794296666790;
        Mon, 09 Nov 2026 23:44:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:09 -0700
Subject: [PATCH v2 06/58] mtd: rawnand: share retained chip and controller
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-6-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Tze Yee Ng <tze.yee.ng@altera.com>
X-Mailer: b4 0.15.2

Controller drivers need to keep chip metadata and serialization locks
alive after unregistering MTD, without retaining their hardware
resources. Share the name, firmware-node and parent-device references,
the final NAND cleanup, and the disconnected-device open check.

Provide reference-counted controller storage with an initial
device-managed reference. Register that reference before managed
hardware resources so their teardown finishes before the controller can
be freed. Each retained chip pins the controller independently, allowing
multi-chip controllers and embedded chip structures to use the same
lifetime rules.

Cc: Tze Yee Ng <tze.yee.ng@altera.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/Makefile        |   1 +
 drivers/mtd/nand/raw/nand_lifetime.c | 118 +++++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h          |  12 ++++
 3 files changed, 131 insertions(+)

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
diff --git a/drivers/mtd/nand/raw/nand_lifetime.c b/drivers/mtd/nand/raw/nand_lifetime.c
new file mode 100644
index 000000000000..9518c9a4bc63
--- /dev/null
+++ b/drivers/mtd/nand/raw/nand_lifetime.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Storage lifetime for disconnected NAND controllers and chips. */
+
+#include <linux/device.h>
+#include <linux/kref.h>
+#include <linux/module.h>
+#include <linux/mtd/rawnand.h>
+#include <linux/slab.h>
+
+static void nand_controller_release(struct kref *ref)
+{
+	struct nand_controller *controller;
+
+	controller = container_of(ref, struct nand_controller, refcnt);
+	controller->release(controller);
+}
+
+static void nand_controller_put(void *data)
+{
+	struct nand_controller *controller = data;
+
+	kref_put(&controller->refcnt, nand_controller_release);
+}
+
+/**
+ * devm_nand_controller_init - initialize reference-counted controller storage
+ * @dev: controller device
+ * @controller: controller embedded in driver-owned, non-devm storage
+ * @release: callback freeing that storage, without accessing hardware
+ *
+ * Call before acquiring managed hardware resources. Device teardown drops its
+ * storage reference after releasing those resources. Chips prepared with
+ * nand_set_release() hold additional references until their final MTD put.
+ *
+ * Takes ownership of the storage even on failure.
+ * Return: zero on success or a negative error code.
+ */
+int devm_nand_controller_init(struct device *dev, struct nand_controller *controller,
+			      void (*release)(struct nand_controller *controller))
+{
+	nand_controller_init(controller);
+	kref_init(&controller->refcnt);
+	controller->release = release;
+
+	return devm_add_action_or_reset(dev, nand_controller_put, controller);
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
+static void nand_mtd_release(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_controller *controller = chip->controller;
+	struct device *parent = mtd->dev.parent;
+	struct device_node *np = nand_get_flash_node(chip);
+	const char *name = mtd->name;
+
+	if (!controller->release)
+		controller = NULL;
+	nand_cleanup(chip);
+	of_node_put(np);
+	kfree(name);
+	if (chip->release)
+		chip->release(chip);
+	if (controller)
+		nand_controller_put(controller);
+	put_device(parent);
+}
+
+/**
+ * nand_set_release - retain a scanned chip until its final MTD reference
+ * @chip: successfully scanned, unpublished NAND chip
+ * @release: callback freeing chip storage, or NULL for a controller-embedded chip
+ *
+ * Copies the MTD name and pins the parent device, flash node and, when managed
+ * with devm_nand_controller_init(), controller storage. The original name stays
+ * owned by its original allocator. The caller must set the name or parent before
+ * calling this function, and preserve any other metadata used by MTD callbacks.
+ *
+ * After success, unregister MTD, call nand_disconnect(), and drop the driver's
+ * initial reference with mtd_put_master(). Do the same disconnect/put on MTD
+ * registration failure. nand_cleanup() runs at final release, so controller
+ * detach callbacks must not depend on resources released during removal.
+ *
+ * Return: zero on success or -ENOMEM, leaving ownership unchanged on failure.
+ */
+int nand_set_release(struct nand_chip *chip,
+		     void (*release)(struct nand_chip *chip))
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	const char *name = mtd->name;
+	char *copy;
+
+	if (!name)
+		name = dev_name(mtd->dev.parent);
+	copy = kstrdup(name, GFP_KERNEL);
+	if (!copy)
+		return -ENOMEM;
+
+	mtd->name = copy;
+	mtd->_get_device = nand_mtd_get_device;
+	get_device(mtd->dev.parent);
+	of_node_get(nand_get_flash_node(chip));
+	if (chip->controller->release)
+		kref_get(&chip->controller->refcnt);
+	chip->release = release;
+	mtd_set_release(mtd, nand_mtd_release);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nand_set_release);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 90b2169cc745..313e0d88e19a 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -22,6 +22,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/types.h>
+#include <linux/kref.h>
 
 struct nand_chip;
 struct gpio_desc;
@@ -1116,6 +1117,8 @@ struct nand_controller_ops {
  *			changing the column.
  * @supported_op.cont_read: The controller supports sequential cache reads.
  * @controller_wp:	the controller is in charge of handling the WP pin.
+ * @refcnt:		controller storage references for managed lifetimes
+ * @release:		free controller storage after the last chip is released
  */
 struct nand_controller {
 	struct mutex lock;
@@ -1125,6 +1128,8 @@ struct nand_controller {
 		unsigned int cont_read: 1;
 	} supported_op;
 	bool controller_wp;
+	struct kref refcnt;
+	void (*release)(struct nand_controller *controller);
 };
 
 static inline void nand_controller_init(struct nand_controller *nfc)
@@ -1132,6 +1137,9 @@ static inline void nand_controller_init(struct nand_controller *nfc)
 	mutex_init(&nfc->lock);
 }
 
+int devm_nand_controller_init(struct device *dev, struct nand_controller *controller,
+			      void (*release)(struct nand_controller *controller));
+
 /**
  * struct nand_legacy - NAND chip legacy fields/hooks
  * @IO_ADDR_R: address to read the 8 I/O lines of the flash device
@@ -1285,6 +1293,7 @@ struct nand_secure_region {
  *              independent devices
  * @ecc: The ECC controller structure
  * @priv: Chip private data
+ * @release: Free chip storage after the last MTD reference is dropped
  */
 struct nand_chip {
 	struct nand_device base;
@@ -1345,6 +1354,7 @@ struct nand_chip {
 	struct nand_controller *controller;
 	struct nand_ecc_ctrl ecc;
 	void *priv;
+	void (*release)(struct nand_chip *chip);
 };
 
 static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
@@ -1598,6 +1608,8 @@ void nand_wait_ready(struct nand_chip *chip);
  */
 void nand_cleanup(struct nand_chip *chip);
 void nand_disconnect(struct nand_chip *chip);
+int nand_set_release(struct nand_chip *chip,
+		     void (*release)(struct nand_chip *chip));
 
 /*
  * External helper for controller drivers that have to implement the WAITRDY

-- 
2.53.0

