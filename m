Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296674;
	b=LSK/+dUsOZIaMmsSfHFGRvWhG5rr7fHwblIo8JVW3fwPX1POPcprT0FKdHZFahMC8bnS
	 pdX2WNA1BiEoVSWYyHnhUz6gZNuNIvIXRK4N3xgGzDSwdW+T3qSw46sm/R+zMFdPTzazF
	 jiOZndO8ojREEegx7AWcht/9K3+A1Ldxolf/LRVbhDGuoKEXBgMo+vYNoviKzfOjZ8WvE
	 4r1lzRg83D2l58NVo/x1cXy19pnZVCG3Ec/fXRaHhLS+4lqfyixcK7DXrh29/trK89Xaa
	 jq17QgiBmdk5ubYVaG1NgbGIt4P+823mse1UEGm2Z8Lq8hRXge9tVUDzrpDd8C1XTIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NBjorQ9/iOTfxxDZxqvQ3932oKOZt1oFqCel4x70Msk=;
	b=EuF6kvbxNRV6m6VNUTCqUdu8PAuaAkkP//ZELi1SaKg4UElS4p3tb9mubOBoeds/QIf9
	 2itT/hQ545EgOgTI6ShKPbwWUrTO/OZ3FypjQfm5Er+G2VrnznuHtcRQQN1xhnYLyI07L
	 wOjKy0sJEdyzLYNvKLw8f+EQ3+TArsRRpyk+L0xW3suRXhqCgHn8dNeS8nWNx7iLcjK/C
	 rM3+xe1D1m8AkGQblKsyXudaQqipf7kW37wVruL0U2TQoJ/gz6bfLduaC5NDefpxZgQMa
	 WMZSsEBkLdd7vXzdg5FoAXsQ1oJBrn02FqK0ffbD2D9GPkrnIMWogVfJ6Tx1zbhCAtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ngFsXvIH;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC8160A2608
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBC8160A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ngFsXvIH
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4a451915d8aso984539b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296673; x=1794901473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBjorQ9/iOTfxxDZxqvQ3932oKOZt1oFqCel4x70Msk=;
        b=ngFsXvIHwMPdho6uBSMIK60kmezcjvO0TIbl4GqFnI5piVAXg/PTZBb7BSsdYmIaMs
         F6ZW9AVXSbNVNXJPXfgR5a6/UR0M+KrMSJlUOL03qNJmDuPmAlW/QajjLVJFul9SqDdg
         wGq492ckaCUZRBO6I853MHXMm+YOs2zs+nWeuAwJn8FnB1Bz9sEXBu7qVb9Oxvr/t5kQ
         u/jV8DZ/ufMV3oj5DngAJY1rbwrczQ7Wxop1iaca2aVKaAjRKytt7U5ovgQxO1GWZhVq
         /SyPCWXVJJHzoceUsnvNQOg/AKPm/4fxi63ShY8V7CbyKGTO8NhfrEMs1Q4SDJNIv7cG
         trkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296673; x=1794901473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBjorQ9/iOTfxxDZxqvQ3932oKOZt1oFqCel4x70Msk=;
        b=bUz8bTE/GxR7UoH22Ikrb9VRWfr1akxwQIrS/WFWxgyG5RkOysPvJxZEM1vf8+SGID
         zq/kShGiCUsES/SSnrJ3GjybfUyv0Y9c+yFanICTeqItbAbIXEHeQqr1UclXD4W0XEob
         i99Qxn8UEhKxCz4vtH9G++p61XkHzne8Cr23xYka06s07lVaki+NFsyGyAqVK1VUAhJG
         iFaoN87XhmWpEF1i/TdNCsDHOav02r/uu2KuKnHwU6iZyalON5XdroKiR6k548dD9ufl
         aw2ac7g2vnAEOBTeUr1AEb8LZtx6ENGMEQEiy+29xZY9h3qFQcshxi3aIHkugBzJw2MM
         hd4g==
X-Forwarded-Encrypted: i=1; AL+hErG71vyxsehklx3Nqpss/XjIq2TF04GtvB1hQUIVDoO3cBq3T7AT0Uyiu/uKs8OieW9AQlSFt5gwxR/JJNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zsIFQ4AZFyKFgYug+aUknwDf8WyN8zVjEbd8ZuZ334R7HtRQl
	8kUtURdyZmDV9n2F5b08YpssAffM6E5LbdVE7TkTY4RIxaYHTo3t5H+iXqLU2gn+
X-Gm-Gg: AYBFou0a9j5S9WTjUqCCd+cMcQsGHfCvFP0JKoQaU5ADHUb4PEselOYvzluIT1txOas
	XD0eTGYN0eXfcKpbjDR+mzuAkdstsfglYMvZZGrLFlklKCI2fKwJjWQ+OUabscBHx5UiX2LoRp9
	JPiJ9LjQJHEfEwuu76Texhg9NA4hZ+EG/W4x/cWrJtYzWSGSnapi0aVkRYLTz78EeyaIJZv5MLK
	ERnyPrKnEuIAqD8czRH0Sw+S30Sg3Z89LY2ozX07uTkucWYV9JylEOS+aLkNZKc2w/l0sBvcjP7
	WQGGb8SoyMK/6MhzZD05Lee5noNyhQ0LSIvMS+sUhmSjtO/th/07ramLSQt1hJZ6R7Gm8l3jYdf
	B3NH4PW5dRdj2DIQHiXxJNFNchCm+xyGnjbbtNa+3C6LTBrWSeQRCAwlHV+Rv9wCY/yeKouTL9h
	Fw6oIntuijpzO1GSXgfObs4his5pxFmEqsqMZd1SVbCG1Te4zMVaP7n2cgcUXgA6k7opKbCXOVH
	pPKyTSQMl2bwueuJEZ65sULJyfVcsBcePU1bkE8I8w12yz6P6hDIXSwcBpUhMuycvGPokOutDcr
	nDRVvquTKf0TRqU3XUap2WU2pORj7d57yI6YUDy5fmtX9pIc2xnUZRUhntYuS4rPcHSVhGvt6Q/
	aitB2fymA2BUQryNd4mdnDrrRsRQ03m0T/hkDZqh54ig7C8qE0AHV8Z6XqWws1XjgcKDRlANtkM
	Zaj4WEYpuLS54bV0EjRcb4A1WVIrKRWb1u2I9lBdh/5nSPvg/ePs4=
X-Received: by 2002:a05:6808:c40a:b0:4fb:a7f3:4211 with SMTP id 5614622812f47-5683cdc8145mr1336190b6e.58.1794296672603;
        Mon, 09 Nov 2026 23:44:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:14 -0700
Subject: [PATCH v2 11/58] mtd: rawnand: denali: retain chips across
 controller removal
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-11-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Jason Roberts <jason.e.roberts@intel.com>
X-Mailer: b4 0.15.2

Both Denali frontends allocate chip and controller objects with
device-managed storage that disappears on unbind even when MTD
references remain. Give each chip a retained lifetime and a reference to
the controller, and keep the initial controller reference until IRQ and
mapped hardware resources have been released.

Unregister and disconnect each chip before disabling the controller.
Remove its list entry before dropping ownership, and use the same
release path for partially published probe failures. Denali chip
initialization now consumes its chip allocation on both success and
failure.

Fixes: ce082596ae43 ("mtd/nand: Add Intel Moorestown/Denali NAND support")
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Jason Roberts <jason.e.roberts@intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/denali.c     | 31 +++++++++++++++++++++++--------
 drivers/mtd/nand/raw/denali_dt.c  | 21 ++++++++++++++++-----
 drivers/mtd/nand/raw/denali_pci.c | 15 ++++++++++++---
 3 files changed, 51 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index fa2439cb4daa..4525cec3cae8 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1176,6 +1176,12 @@ static const struct nand_controller_ops denali_controller_ops = {
 	.setup_interface = denali_setup_interface,
 };
 
+static void denali_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct denali_chip, chip));
+}
+
+/* Takes ownership of dchip, including on failure. */
 int denali_chip_init(struct denali_controller *denali,
 		     struct denali_chip *dchip)
 {
@@ -1192,7 +1198,8 @@ int denali_chip_init(struct denali_controller *denali,
 
 		if (bank >= denali->nbanks) {
 			dev_err(denali->dev, "unsupported bank %d\n", bank);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		for (j = 0; j < i; j++) {
@@ -1200,7 +1207,8 @@ int denali_chip_init(struct denali_controller *denali,
 				dev_err(denali->dev,
 					"bank %d is assigned twice in the same chip\n",
 					bank);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto free_chip;
 			}
 		}
 
@@ -1210,7 +1218,8 @@ int denali_chip_init(struct denali_controller *denali,
 					dev_err(denali->dev,
 						"bank %d is already used\n",
 						bank);
-					return -EINVAL;
+					ret = -EINVAL;
+					goto free_chip;
 				}
 			}
 		}
@@ -1250,12 +1259,17 @@ int denali_chip_init(struct denali_controller *denali,
 
 	ret = nand_scan(chip, dchip->nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, denali_chip_release);
+	if (ret)
+		goto cleanup_nand;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(denali->dev, "Failed to register MTD: %d\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&dchip->node, &denali->chips);
@@ -1264,7 +1278,8 @@ int denali_chip_init(struct denali_controller *denali,
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(dchip);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(denali_chip_init);
@@ -1274,7 +1289,6 @@ int denali_init(struct denali_controller *denali)
 	u32 features = ioread32(denali->reg + FEATURES);
 	int ret;
 
-	nand_controller_init(&denali->controller);
 	denali->controller.ops = &denali_controller_ops;
 	init_completion(&denali->complete);
 	spin_lock_init(&denali->irq_lock);
@@ -1368,8 +1382,9 @@ void denali_remove(struct denali_controller *denali)
 		chip = &dchip->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&dchip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 
 	denali_disable_irq(denali);
diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 8c822eae72e7..e75754bd6d61 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/slab.h>
 
 #include "denali.h"
 
@@ -81,7 +82,6 @@ MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
 static int denali_dt_chip_init(struct denali_controller *denali,
 			       struct device_node *chip_np)
 {
-	struct denali_chip *dchip;
 	u32 bank;
 	int nsels, i, ret;
 
@@ -89,8 +89,8 @@ static int denali_dt_chip_init(struct denali_controller *denali,
 	if (nsels < 0)
 		return nsels;
 
-	dchip = devm_kzalloc(denali->dev, struct_size(dchip, sels, nsels),
-			     GFP_KERNEL);
+	struct denali_chip *dchip __free(kfree) =
+		kzalloc(struct_size(dchip, sels, nsels), GFP_KERNEL);
 	if (!dchip)
 		return -ENOMEM;
 
@@ -106,7 +106,15 @@ static int denali_dt_chip_init(struct denali_controller *denali,
 		nand_set_flash_node(&dchip->chip, chip_np);
 	}
 
-	return denali_chip_init(denali, dchip);
+	return denali_chip_init(denali, no_free_ptr(dchip));
+}
+
+static void denali_dt_release(struct nand_controller *controller)
+{
+	struct denali_controller *denali;
+
+	denali = container_of(controller, struct denali_controller, controller);
+	kfree(container_of(denali, struct denali_dt, controller));
 }
 
 static int denali_dt_probe(struct platform_device *pdev)
@@ -117,10 +125,13 @@ static int denali_dt_probe(struct platform_device *pdev)
 	struct denali_controller *denali;
 	int ret;
 
-	dt = devm_kzalloc(dev, sizeof(*dt), GFP_KERNEL);
+	dt = kzalloc_obj(*dt);
 	if (!dt)
 		return -ENOMEM;
 	denali = &dt->controller;
+	ret = devm_nand_controller_init(dev, &denali->controller, denali_dt_release);
+	if (ret)
+		return ret;
 
 	data = of_device_get_match_data(dev);
 	if (WARN_ON(!data))
diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index f53df1b32dda..c39abe71941f 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/slab.h>
 
 #include "denali.h"
 
@@ -27,6 +28,11 @@ MODULE_DEVICE_TABLE(pci, denali_pci_ids);
 
 NAND_ECC_CAPS_SINGLE(denali_pci_ecc_caps, denali_calc_ecc_bytes, 512, 8, 15);
 
+static void denali_pci_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct denali_controller, controller));
+}
+
 static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	resource_size_t csr_base, mem_base;
@@ -35,9 +41,13 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	struct denali_chip *dchip;
 	int nsels, ret, i;
 
-	denali = devm_kzalloc(&dev->dev, sizeof(*denali), GFP_KERNEL);
+	denali = kzalloc_obj(*denali);
 	if (!denali)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &denali->controller,
+					denali_pci_release);
+	if (ret)
+		return ret;
 
 	ret = pcim_enable_device(dev);
 	if (ret) {
@@ -92,8 +102,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	nsels = denali->nbanks;
 
-	dchip = devm_kzalloc(denali->dev, struct_size(dchip, sels, nsels),
-			     GFP_KERNEL);
+	dchip = kzalloc(struct_size(dchip, sels, nsels), GFP_KERNEL);
 	if (!dchip) {
 		ret = -ENOMEM;
 		goto out_remove_denali;

-- 
2.53.0

