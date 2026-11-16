Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810617;
	b=OZLH1fgxAJ8Gc435DOUZ3aWrGEjbcIFEYFv59vxP+lq45rn9X/ZXWH2zbtnkhC7Y1M5t
	 S4sU/stKKI5hcNUSFHCCFd+y31RxoG/scGJMUK3mG6SBOdYuJf+tWtf2FTXQEVSxTt++k
	 yTs/EbJmmPx1lK7H4NuwhhKq3JavWLjhV6m6wsA6fk3+fGr0YxpfN9RpRIxwFbPr0gY9o
	 CwOc5NRUWCSutsHO5HrzSYLaTC1CkCxo4ShugN7TQRcPB+wK8UoydYQweD/hVqa7GE+1K
	 /vdreLFTqNKlIk1Z81kgIsjamIz7apPCpm64+Z+BpEgT57dVGmgD9vHauevMnQmf5Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=;
	b=5LUehvVtnbbPS8Vl5/K8B49mYRLaAeMcTfEJ3/gM39GYUPGEZoGw4sewmeABMapb+CZN
	 UsyTxju/pVOzbMJc5MqtJaDzK7bm5lAdtF+Ij+9YugM/M7Frtyzzp4lqUljPMERf4Rnvz
	 DzcdD389bm9qKwo0iCDGtjXUzhC8oHvfFoEojDAlTlcen5b3H394v+RJG6storEUYypua
	 Xn21MBvR+ER7PHD8BHwgQe+fSfTomsxI3ITUa3B6JerlHazrz0NxvwWogSdL5PGlo/vJI
	 YIIzFpYyDjOyBkBZiMCnRJckrfPdCB0cXz+bRfRknw+rVSFJ/Vze5pv2rIZGW7cE9fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zjfhJGoF;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532FA606A8A6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 532FA606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zjfhJGoF
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6e560e00a86so2627225eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810616; x=1795415416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=;
        b=zjfhJGoFyfoLUTzbKfkhImYfTEg2okvIKRbGzmx56an4neavcT7kCFTeFmpzR6OSIW
         suZwJCKrbfli8Jk58B4aXiSyBpP4i4OufObViKPV2sq16NGw0eta8oWnweApJNfhldWt
         JxMgNglr3ZhKLzlWWNAFKt83EmiYyEDfnKaF5WMGRDgNd2lbprqCK+pc3/XxwfZgzRAD
         S1kzdsL7LRfkqYKj8n6B3jE7bkpHHvxLdsZ8gDwS4r9/ELu6/db4iIqsMzkx0xL+I8B1
         nLG1FB9TDWu85R74QLS/n65xEJJHodh9G8dgWWoKZmeL3KXMDnScJPyqD4t/VYuU1e5W
         jJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810616; x=1795415416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=;
        b=V41eFfB8ixN1Ds/LgyfZBSvVL01IEaaePEaKjZfAcr9yxMhyvnBjQUNWQp4VlujVGV
         Ay80HZULa+9OTnpCDsLQpZzQxpUg8bM5M4zvBZX5X/Cp1DBgvwykFs83EyVdGaNQaG09
         e1yKoAZCabAR8QrkOqhsW5oB2M8mjgA8Qm0KHnbH9pCmDfZrjjcTNXq0HcaGhprXbc+e
         f7/80ZM3WK1M2Y3fPL+jUHLmABWRtvinaVMUu0unf6VfcQUCXN2VVfUouEm2MPIOy/SI
         hK40C9xyoH2oUm+RH6yy/BKvzRkyawMaloSL4MFrZBvkfEM3097ldcupOh1ea+RlxUSt
         JIaA==
X-Forwarded-Encrypted: i=1; AL+hErEZj36rmo0OTUraGi0e95msug7WGaO+tKu0hulVp+HGs0LXwtZaCDAYX0U+0SJ9PG0TF9Dr94ETylqIzPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i+3k+uCO/HXcjSCs7DS++czv0xF3mSqGeGbRRyo9J5Q7GFkEQ
	myCVTEkdiC91eUiogbKJfXVsDBO+qZ8bghJw/MkiHU6zkew67zxS7HrZ
X-Gm-Gg: AYBFou0TL9GJmbDJuIlAwAwCQvyQ54RVW/gkOTCHnO8bfun/Nm81JTPPGnPFGiYrElH
	JXEGuUkJVytWMtH428eX30g/NaE/Ygqwsb3nlwIbQq+XJtDDSYK84JJqZgZVLLC/wR5diERrq1r
	XP0NAfp9hgVZIWaouPn4YuHhqy8dDzrbuQQi2FecPMt6wjJ6H71QH4ivm5Tnagq1vqTkM9yLR5U
	VCNDTIrcHcCXt00bKodqgeQDInTUdDV2DJNhFdpgLG74ZCnLASRizwRrtu4G03IlWGAzm4RJY+q
	JDkEE9bmVE3hONY7HD9C3Q9JXsKfxwSXAcS3k7xwDpDg0Q9bob5O5neUJ+g48m+ZIGpGXzB/ouS
	tA2BtJ5hFiy/MClqolNwMeuXIS4ldJBE/LlbGh18WRRABI6c4I8OpHAJxtK9LPYxKqrcXgCULh3
	xf9WUJuC5JTXU4XXNLNaXG+K+4Jci/cRATk9S1r2dYfuB7zvjikvH9ycbhfZeB/it/crMdpVQE3
	IgWclukmDUb93V/GL8ZPty1nYm26/r76UDnIDNn42pWl83yBUJchHqn6M2HvHD8bjmElQoRgKFO
	FdwQmi14EhN34kL1624Gx1x1wzhSCnHu7hzZtAn1CYCA6KGIJpbKC5BEeRiswm8ce8lUbYkYWte
	j0nX6vJ3LcOLQO1ZRHI36iKrCAikf+lveeS+yMBDVc0UoUx/t9rDoZm1M7FnfWEJ2X+4OdEiiJt
	6OWkGmxnp9AocaC7cnI+jpmx7D5FWojiWRrxKbpQA1o9mm91oJ/0Y=
X-Received: by 2002:a05:6820:1693:b0:6fb:b922:8d30 with SMTP id 006d021491bc7-71ab4d05c0cmr6181022eaf.2.1794810616246;
        Sun, 15 Nov 2026 22:30:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:39 -0700
Subject: [PATCH v5 24/58] mtd: rawnand: xway: retain open-handle state on
 removal
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-24-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded controller and chip across platform-device removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/xway_nand.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index 7fcefb24fc23..89c4cda08794 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -8,6 +8,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include <lantiq_soc.h>
 
@@ -171,10 +172,12 @@ static int xway_nand_probe(struct platform_device *pdev)
 	u32 cs_flag = 0;
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct xway_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, data);
+	if (err)
+		return err;
 
 	data->nandaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->nandaddr))
@@ -192,7 +195,6 @@ static int xway_nand_probe(struct platform_device *pdev)
 	data->chip.legacy.read_byte = xway_read_byte;
 	data->chip.legacy.chip_delay = 30;
 
-	nand_controller_init(&data->controller);
 	data->controller.ops = &xway_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -228,9 +230,16 @@ static int xway_nand_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	err = nand_set_lifetime(&data->chip, NULL);
+	if (err) {
 		nand_cleanup(&data->chip);
+		return err;
+	}
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+	}
 
 	return err;
 }
@@ -246,7 +255,8 @@ static void xway_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id xway_nand_match[] = {

-- 
2.53.0

