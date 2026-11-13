Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593729;
	b=hc3yKHc4gkhAQL508FWXN4H4Yf6OTe9cGPTnL2rmr9eUffvXfdqVt8CHdEi9eSPZOVGb
	 iyysTV+DbWw41Aw1jLkVdNi0uRUANcvcXU2tQ8vl51TmhdXct/3BUSbb9hGBf15fhjY2i
	 etkfSYmejm2k+oiJ/Q5RN7pWhKUlmC2nuLpEVN9UqFWYhBJVWJ0zqHYYSxGUd3QMheXjt
	 R3hhxkFxgy1e+8zbDE1hpJSTUQSdz9wIihzik8f/gXp5sPWyP1A0bUvtnaZUkmJGx8r1q
	 35JpzrwjxMupD+lC2B9LE918HVSemiXXoEa0ZGCW6M3ZKBWQsqZa3RhwHvb4ZeVxaOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=;
	b=SPN+98CA5nTShia0HOOqTUuCZQmxtFphxmWWfGT1rzme7zKM+n9YH5FBU+cjIVO7uUjV
	 C2vR6I+3EIHjamm8gQigaYd506+LSBr1vBf1VnM/ThVvlwOG3Hi8NwdBbHtHKj6xZ6Tfk
	 lsjHF67MIeZbajU76/XqMgOdVotAHyG35rF5W2PL6c43xlMtgpSSI/6Oepp+KXL86AafU
	 wIUryYv8qL0/4BG6S97X9jfX8cW67RyRUB25lQQJpKVDxCeVJBjd1w7WJ6c4AT05tQmZR
	 +CGrG0T0eqhSeXtbaO+6nN7lKIrhlxiIBlJdhXtsX6su8Smbp9/XHHMeOp4ePW3QVkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z/qWOR/C";
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FB860A261B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70FB860A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z/qWOR/C
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-70bf1671c21so1705400eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593728; x=1795198528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=;
        b=Z/qWOR/CEk4rEMt5O0Mesxt6cnL62udagZYPzg0oYEVF2/VoPPJsELFjZaKcPFK8lS
         6NwS7hujpbeYIM/FpKsKBSY05DSjl4v6larT0B9AItEYtDiMXPEFlontxJNXm/rHdK82
         mtooh5uIZs0Utf59Dd9oQM3h2MY29rYRl4xxREkb0yOQpFIiNC2HhvuaaaFQ+TsKyReb
         36fZgiJuhQdzjzNcUtL1sIHmLhjWWTPAXEM8EWbvlu9omH2wE54b6vm43laITW0cxEUy
         CZfC1+rrYISyDA5e+R6+5P8OZa7nvZ65e0aRC+6/zdShy/Mk5lvvbS15W+Zly5YgwAA2
         16NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593728; x=1795198528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=;
        b=x6bEssYxg1K7SwYmowlNwOWnHYhIeC6M8O6nyOHyX7ul9Xis/IzoGHmaY0C8TOdYhY
         EBEHh4aaVYF7gc0UJmt7kC6ttgP3qx1VNjbKTQxcy5FPyt5DbO2DUnkpmm4tGpefZWRA
         9Tqd8rRqZSH5evn8rkS5PxpV6YhraKgNrsmn+xoKU0jPQZOhHQiQ9ZpgspjHEiyyL1Pw
         l7I5Z0OD4Y9LUafTsKBRBYF4x0kC3SYEeZt9Z1N3dYpf/HXAW4ZGsNCkuI/hFCoCJy7F
         ZAO2QDgfFb8qjW3Xh//umPHhJ2zD1gZ1CdSMbTWfsDNOL+AFkXidoOaVTq4mt0Lmslvw
         xhvA==
X-Forwarded-Encrypted: i=1; AL+hErG3Zv+YUOjggmF1FrWJwCInEVKLfM4LNQifOVo/gRDxqbJoSb3mBcxKFRLUnQKPyCARVQqWu2k8kMja+0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sYldibQqfgKz7nJCuQr9pTIMAgkBSkq67RNT9K/GS5J/TRccs
	hZaMAmsAds5FZE1AV3f1jWDU5ZV1wH2W3pinsXS9qtc3qCA1I1XcPA06
X-Gm-Gg: AYBFou2jJVMX9mNGEdd5s85rT9tIlPLQmZ8ZtBo2+iZMvkHN+/SiX64otpNED0xhh5t
	l/RlSlZSyHwCF/4/rwxKsAXSr5S1JIzLglrGgBxPMxEbra+AMTE5z5nrIwvr60NhKyfeN1VTyzs
	0Md5OodKbg+eeVCttBnGmRCpOLxKWmvRx8zk1I95Q2ZLe8KkbLsIWmUQKpBi7A4viJJ6gN/brkJ
	Hvh0QpU4G/vpdG/QEUvAqEtm8yZUox3aWcKsvBpa2qQRnix+seI1RaKrQM0q9hetP+wEeD5ceGf
	Q+KuUWtmVECplVGkQkj65SpzQDtD4+3EUNVo2zBmxx9lMJ/vKa1vutG2C/Srgi5+6i67ZSNDALa
	aTVYnmbhFgdqXQ3ynvePgRfSWwq6YC7uIx/pk6700MW479osFnNAkqLIjVyzaQGhThPPP4bAAN7
	ZVbeEoimrQaJpiHqqoXZLGugtQtBo/8he5rrYpCN7EwYayHls9IQmqJ7NAO+EcjOwv+55SOEscP
	7RNWiTdtSFp7f5UB1x5IIJEqcHDnJ+FqCWjG7WtQIPDF+7ycxja/tNp8XsV/ad0vPoT8muk3Rl/
	8/+edr4/k8KsIM8PB89VxhuWIkjDXrFiuFc0UVZcqNKYK5l0i316L2ePn8X1bKB65HaNbXkC7IO
	KDxil+pncCGOViLxHN4/fg+WZ+p5hGyRbO3esKI82ZoTYT52QIpdgR50a3K/6AWEsLHMt8+YwP8
	BhhZunP9SSA4youV9BXjRYahjXWFDtxmnnWKmhCymLKEKRDO0eWfI=
X-Received: by 2002:a05:6820:1381:b0:6d7:7f22:f59e with SMTP id 006d021491bc7-71ab5069789mr2248583eaf.38.1794593728266;
        Fri, 13 Nov 2026 10:15:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:27 -0700
Subject: [PATCH v4 11/58] mtd: rawnand: denali: retain chips across
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-11-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

