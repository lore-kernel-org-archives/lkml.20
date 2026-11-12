Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446922;
	b=0Mn46rI+AXt9XxNiPFsuxm03ExxbbUQQNF+mcLhhJifgMjkRvMOH5CHMkO6SXRaLW1+c
	 Y9y8NfpTLmO7qZN/WkhTZCGCeWsn9Q3ImEZ4uMOEmSYYCN2d6ij3SKaq+XnZ0qqzzUP87
	 enkw8Cys7Gp7FPiPhr0illWP/okL2oV157hOmCBQ05vMKdDnaUnKhN/XZBx/EYwJ4y7pD
	 zvwloOXQ4Lwpxanw8GKaN2VW3GyInYhEJhVwhJaH6x+MUZTCRpirv57V8pSOGgXQyud/y
	 fYot+ET7FsmDP//gSUvV1cCJhqTHhXBfxZ+NES4WuZWfomLe1k97QWcn4XhNzMve+kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=;
	b=E2PtMzAiFUTDbDrMWeblVF7MWC/+VD4JDbvs9GZE7kY8U0UeUCqRd8ICg82fuL5idjMu
	 yPw8UZTqB1TeyNoNnwB/N2DLmztXpHFxrPD1ITW7Br1HsYo1Kn6d/xgZq2qhHnR8YCORH
	 0IkrFu4DdK0pVVcR5MEhJgiuRT6zAWhyYaff3m90R+usmlHby2IHfoNQD2BTPFUcRPhyN
	 GhoU4VS2u3Bu2JM2H1Sq7A4gc9LKjgxbjKFTUJWjwrP/NZktRDXbKa1pUejKlKiVJreqm
	 pe7GSyloXc3/prISVIbZxtAww8sA4IzSMH4yXsBTIIQ3rI2mGP11fbKcy4A0hrJI2aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MO3Re8Kj;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA87E60A2630
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA87E60A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MO3Re8Kj
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-451a49abd8aso3574389fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446920; x=1795051720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=;
        b=MO3Re8Kj5ZWadjK6bkFmc+zfKqn+2s7c8c6kdngbqCWROOQFrC2Ed1DDuCY+g/LIbp
         SG3hds/MEspqhQee3kAenjcIkVm/IZZLjXwWKeklOBQB2TqETK02PW2t864Ih3nGdvMc
         Yx6uFn7AHgvT5qS/XFZpQa2/H4lXOU6zn5CFrVbLJ+8Thxv7nSlPfBBwFG136j+KNxRw
         OPrYLAzqescAdSqCLgSXDwTysEOi0Pm6d+7hzOYkrIonD/FQtQFJzecg4vEJMkzMRLjm
         GzjOKAcxaSUTF+aUiYdIj2Gc3vSA61h7FYH4T5hbZxJGpxvkGnTl2qG/bW9cACWyqQdx
         tZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446920; x=1795051720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=;
        b=A3i4tbOQ97cc05aVBJvv/IA+DrUR1vJmS+LFXiFmQA1qW3O2V95O4kBNFsnHnf2fMh
         tFIzt8rzadncpgEFM8/reSC12TCeMrJxj1rsRXS2coznVYaltUJNMWzNVcZmKWjy/67V
         fZ1igFkv5VEdalScqRg6lJm46LUdhl5qPx/pRuDLdq/BNKPa/Q4wVWo8k6baz4Ex3CvL
         tt18NW0CpBbMQ2EkQiXe0dvtQgPK85CH8fB7FpDb5RMPUSQH6DiQDj/H92MXeahijuKu
         JE5djkI/LDcYzQdEnzXozssUUU0cuPyq+o3F3irEhImrUxDzv/0fUqddn5NvOd9HR5Qi
         VJcA==
X-Forwarded-Encrypted: i=1; AL+hErE0N0Zt1jZorRscl31KaflLGmHdi0Kir4AId0U2j975Yfzi2X5qEOZAgTHAvm3s+SohhSLIFFrkFixLSwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z87QRHyAfLnWJ7XdB9Pdk25nwAGyz3cHcVTAzvhjesWgxLZ0DSH
	F28RrcMiyrZIk9y6PxTcoqDJ5FUAt+tOIKAbjhMpV/sb7CLIElQ09/F3
X-Gm-Gg: AYBFou0D5AN++2Jp7niT9pMqpkNkEiOD4hzjZr6Y9uT81CzGCSlCAKJkdF4KKdKly4Y
	ytCQV110Ppv4b3zy84N6B2kqg43ihX0PF5K/ZgfQbD2+cPc1FZvLUC2w83zvndraM307KJ08e0n
	tQnx/BKrQmJxjbviwZsoDMBVMYIiA8S5AlJNjMFbA/28wDh/c3fw/BdZCA+VOqZtipAOBDIm9tZ
	HEvGEmHvL98eXVKpOKoHxjktPGWx64IOtbUAFvIK6lggd7aWTDGAThlaFw0Z9MbbBS1TNvnKRPS
	bn+Fqb6J+i5mqsmX138CznBrIXYA9jNzeDWbNjO8XkZdO3Zf9LJ6bybtmU2jZcFkSbEbr6c1dUF
	8KMXqXDgGYuK4sy4CSAn1OLuC4+mlGOtCH4tUA8cih60RPIVRBdyi6ExY/y+CHGansITz0igJLS
	mlWWkZtMQpETTYtIWAsaRc4CbxFzinImzrspLDXzSQ0ksjGlz0Si59gj8AmT87uX1semk87eE2n
	HF3ThkQmmKMawLXDLkaj2I9Mm3zF/4m+ZOWmFA2nq5TCSnjQlwEZ2l3roczqYcm/FRHFaSHNmhJ
	Ctkjy6yJagJunpmZGpRV3BEsfNCLX4PbE09hCr4+kBRMKbK9GZM6vMxrIQT0mL/O+8E8gW1OwGC
	AXhIkAzjVN0Lv2H9imG8ml7ZglbXKgc4quXfnHfMnqNQAXLmCOTDZc6ca7Ey2chM5BMwzYew+wp
	HlHbGlijxYaed+tJaS+DGAA0zm8huRUCsEe+wrzKvFr7biDgsxLipI
X-Received: by 2002:a05:6808:1691:b0:4e8:e664:f268 with SMTP id 5614622812f47-56b96ac9cfcmr3918949b6e.25.1794446920494;
        Wed, 11 Nov 2026 17:28:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:50 -0700
Subject: [PATCH v3 11/58] mtd: rawnand: denali: retain chips across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-11-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: ce082596ae43 ("mtd/nand: Add Intel Moorestown/Denali NAND support")
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Jason Roberts <jason.e.roberts@intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/denali.c     | 26 ++++++++++++++++++--------
 drivers/mtd/nand/raw/denali_dt.c  | 13 ++++++++-----
 drivers/mtd/nand/raw/denali_pci.c |  9 ++++++---
 3 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 9c07e4e25a27..098b00724bee 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1176,6 +1176,7 @@ static const struct nand_controller_ops denali_controller_ops = {
 	.setup_interface = denali_setup_interface,
 };
 
+/* Takes ownership of dchip, including on failure. */
 int denali_chip_init(struct denali_controller *denali,
 		     struct denali_chip *dchip)
 {
@@ -1192,7 +1193,8 @@ int denali_chip_init(struct denali_controller *denali,
 
 		if (bank >= denali->nbanks) {
 			dev_err(denali->dev, "unsupported bank %d\n", bank);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		for (j = 0; j < i; j++) {
@@ -1200,7 +1202,8 @@ int denali_chip_init(struct denali_controller *denali,
 				dev_err(denali->dev,
 					"bank %d is assigned twice in the same chip\n",
 					bank);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto free_chip;
 			}
 		}
 
@@ -1210,7 +1213,8 @@ int denali_chip_init(struct denali_controller *denali,
 					dev_err(denali->dev,
 						"bank %d is already used\n",
 						bank);
-					return -EINVAL;
+					ret = -EINVAL;
+					goto free_chip;
 				}
 			}
 		}
@@ -1250,12 +1254,17 @@ int denali_chip_init(struct denali_controller *denali,
 
 	ret = nand_scan(chip, dchip->nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, dchip);
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
@@ -1264,7 +1273,8 @@ int denali_chip_init(struct denali_controller *denali,
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(dchip);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(denali_chip_init);
@@ -1274,7 +1284,6 @@ int denali_init(struct denali_controller *denali)
 	u32 features = ioread32(denali->reg + FEATURES);
 	int ret;
 
-	nand_controller_init(&denali->controller);
 	denali->controller.ops = &denali_controller_ops;
 	init_completion(&denali->complete);
 	spin_lock_init(&denali->irq_lock);
@@ -1368,8 +1377,9 @@ void denali_remove(struct denali_controller *denali)
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
index 8c822eae72e7..9abe607fc7e7 100644
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
 
@@ -106,7 +106,7 @@ static int denali_dt_chip_init(struct denali_controller *denali,
 		nand_set_flash_node(&dchip->chip, chip_np);
 	}
 
-	return denali_chip_init(denali, dchip);
+	return denali_chip_init(denali, no_free_ptr(dchip));
 }
 
 static int denali_dt_probe(struct platform_device *pdev)
@@ -117,10 +117,13 @@ static int denali_dt_probe(struct platform_device *pdev)
 	struct denali_controller *denali;
 	int ret;
 
-	dt = devm_kzalloc(dev, sizeof(*dt), GFP_KERNEL);
+	dt = kzalloc_obj(*dt);
 	if (!dt)
 		return -ENOMEM;
 	denali = &dt->controller;
+	ret = devm_nand_controller_init(dev, &denali->controller, dt);
+	if (ret)
+		return ret;
 
 	data = of_device_get_match_data(dev);
 	if (WARN_ON(!data))
diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index f53df1b32dda..37ef153ad8d8 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/slab.h>
 
 #include "denali.h"
 
@@ -35,9 +36,12 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	struct denali_chip *dchip;
 	int nsels, ret, i;
 
-	denali = devm_kzalloc(&dev->dev, sizeof(*denali), GFP_KERNEL);
+	denali = kzalloc_obj(*denali);
 	if (!denali)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &denali->controller, denali);
+	if (ret)
+		return ret;
 
 	ret = pcim_enable_device(dev);
 	if (ret) {
@@ -92,8 +96,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	nsels = denali->nbanks;
 
-	dchip = devm_kzalloc(denali->dev, struct_size(dchip, sels, nsels),
-			     GFP_KERNEL);
+	dchip = kzalloc(struct_size(dchip, sels, nsels), GFP_KERNEL);
 	if (!dchip) {
 		ret = -ENOMEM;
 		goto out_remove_denali;

-- 
2.53.0

