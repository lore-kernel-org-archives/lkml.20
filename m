Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810599;
	b=zpJmFawtHVjlORi/ySTkmVZfprg9VjQlJs42/ivHnuo31DThBiTKSnD5uJtBzhgM+MRf
	 Zn9UDd5v51lZ0gObthxH2923JPSWeMpSiaCJ5VB0BQV2yXtZV76tCO7OjPUHTIc3ILqAF
	 U98dS/z9vu6qQD4qFfFi8LqrI019Ar+ivTTNGCP9+yQue/Zu5kZ6aUVfhq5jmlpSV5sY4
	 AsLGOs0DeKY6EQSH+frmEqA+V1A3kccTpGQFZWcL7QpddfBcnqbeWBFxGkVUO9Dt97kav
	 Pb+3KpRZjEwp3504f4P+LWrYKJBMXhVxAVHp5kt53zkb2g2L+rTW2ovsVQurLqdiwKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=;
	b=xnJTwxLG+61nPR/jDvjrkveD6JgvkWiysuSBP1D15osxUWKNUFOUq/2yW6FzwdFH5dQ9
	 bt0nwrJHCo7Y18vKWzcnyFrcvzAMAZs4SZ4xpAcpb4BGPUWGqiWfmPnWenyRRdQJG8zTq
	 y1qBJ2vOJQjuTZnp3uHjD4akIUdSBIH8/vc2RZlwI0fbZ6oUfllmw9Zs2Vwwg4jeh+6Qi
	 YdAqUNSQARsM3Evk1yJqACbNVpIEIhVlTpWYQETOfrS3xPlGJAZ4fF0rVsj+nmElcquL0
	 COd4l8z7lKXO/B7pbAGpj+hWUXmnrduUtvOOIHtmqarXSezvmh9zJdtRcKQR+oBndrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuVTb64P;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D365606A89D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D365606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuVTb64P
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71ab5e64742so2622265eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810598; x=1795415398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=;
        b=MuVTb64POJt8qL9Rw6+VRca2x89DwhAsqvfbOCGCKPndtY74hES4zWKnTg6SeCT/3F
         7Uys8vR0JbAaBBrVYhYj+Nfpsabp/BLageP7P9lXafZMz0CfB/ZVZqDUNl17a4QbOeyQ
         N6kOX5kL3rgyp+/I1HuvW2az6HgTJgQv2VXlkfvI8eY1iEat4ioWvkMsdoiAOP8OFQR8
         Rjok9/k8cCO0hYYgajiuQDBfWfgxBVpCoqL00luTKduUr9NeQnjVge0fqCLryT+bc+CK
         EXvLlGc2TSRHFItqUFJ42a+gg3fPJzNA/sZMROZW+ywXgDgZiXv4bPY7x4grX2c31XcI
         40dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810598; x=1795415398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=;
        b=eu/ugxMC3j5fqreAW4FpE2P71en4H7DQkn4TkDzIuPalDwxWtw15iF+c+UNl6+qmRM
         QxAxiabFxn2Gh8K5jyiWZgcsorIzgurp95C1WwCQgYmpRTNikalcBpY30Dsbi0KCPt9p
         nkmgUxcdekWV7V2mAMcliY9vohN2WctEq52aF+guEgTwKBN8BkKkaHAy37XH9ugLlTve
         /l4HAWfIx3ACD010xnUZceDKLUBZLVhW7VDOOgBdNh9NDAmkV/e7OgZ+hGJUKTH2UEdc
         F57fRunqUlumMA9ezz5REp1DZHvqGboigTPedKXYG2VPifzwv5UjuDE3492SiWWI4u+6
         wNUQ==
X-Forwarded-Encrypted: i=1; AL+hErHUAfZU3dGlm8QUmejQ8IzH5p0IvKqWMbDm2H2VShy0pscw4Rk177nObf0BJ49nDypd0dLVK9EzqTRH2o0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8p/O+ESz6cZ+qigL6Vyd5IjA33Dw6k1mnqHS0hzJxi2VYkbXbc
	KjTreFju0849oVWSI8ErBq5XEMe+vWkinrxAnl16HMe4XL77prKW+GtbWa8kuOg7
X-Gm-Gg: AYBFou1UA97OE4oo9kIE5z6V7f+GNsYw4LcUq4YADOaP/yEuYrvjgz0Br62XsT2A4IS
	6uu9YmOLnWG8EIjylDJNIClY+8r3s/sIdvPsafat5f5FC5mc0lbNZ9JygiN4URUSPZBGqII4OoT
	PHbviZCXOFadYxAWI6klkFY8Mz/7jnfxibZaMuoYO6/Bz+1gD6ne2mR/A+mliO6TXrm1zO+RQrS
	fjTz+1r4A6MqlmxZkLiUG+2yDMVg5dt6r34TWBOAUOeP2FS0tpMm+7lE7Rcq8GI1zPDtrnoK9z5
	PoCQqY68ZZuuvjAlVtPHAfXRJYfqjIqQlH0AWU4y7+B485q7CcUpQOmznJ4RzitEA+LFueTqzYm
	0Qc40V1/rCJfSu9YQR+aPxUbhXctMKD6MQp5tZi8PHFOR2fdrwG8/5iI+OeIysNlnk7zXnG6Dv3
	4PAVFiupgcIOXc5O4B6KKy9lkk/N4OoJRl2bnM9dPEzO98UvAocELCqHXSTQWuFadGF3iP0SGmr
	8LTIue6HaUF0uICclp/F5b2OCmoAF5ZxNhIH7ej6/194RXItiOOBspqrW0WsrVhxwWlW6u1acMd
	B52hTL0Gg4YQb5Y207uyOPeysZ+8Z4GZE0dc7TboHuIYKYQqfOQcGA/B9AAirUqLUdVQBto94nN
	K8hjKpgEa5W0D1zljkEIGkWw9/hWxe0Gchzy2UfT8KBWrWDq43nKYV9DbQo4mvHPEAQoZwrx0u3
	VR32n47CG5OBHJRTGS3dPs+rJjaTUzQqacuJLpatbIoVgyFBqTw1Y=
X-Received: by 2002:a05:6820:570b:10b0:71a:fa49:2f33 with SMTP id 006d021491bc7-71afa49313dmr331313eaf.41.1794810598414;
        Sun, 15 Nov 2026 22:29:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:26 -0700
Subject: [PATCH v5 11/58] mtd: rawnand: denali: retain chips across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-11-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Jason Roberts <jason.e.roberts@intel.com>
X-Mailer: b4 0.17-dev

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

