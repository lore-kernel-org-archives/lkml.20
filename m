Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446956;
	b=aM/iWOpafV3zz4K/+O02xYMogRgHPsEmlC1ARj62J//TZUbEGaVbPMXppiUE8mavDT51
	 zi8dD7Kd6t79W2ClRkw7Brft4Xznkb07jH7XEbm4xhrlfyYVQID8+49XeVYD77qkX74X5
	 yhNiLKEPHY4dxYAYn8vXBb3ZXdI2HjgE81j80yCo2gsUTj81mmSUj8q8WZAlKtR4d0Xdd
	 J/RHP36cduGD3D0r/oBL5pYvwi+j+Xfr9dfpMUJZ/CIKxs/RGzTlYPsovlYVHQjB/hZch
	 cqv6dBP9aKAXqY7BQwxPssumofhKThOM8dZF9JVvtzY6zfC06IsRk5Wu4FbbPHNcZVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=;
	b=v90bF4W+p740R3TrYZzNQNedJxXXh4HDuGRRjQkeZwNZ0LLJmNMBku6qMeaV0bu4E1Q/
	 IP2Cj7eLzEjb70rIP1nFovn+eEjRx9czyn3gJizeoX+hpmQdT//tXQGl2PbkhL9CholPn
	 Hn+AE7FaMUSDT09brB3vuuoNPjqG+EUlj0TEVawJIEYRUcDrHCS5ihrzTsmew5nxER7lb
	 z921UhFZNmYS1TzCpEzM33A04QMK+oPnezx9rLv7Blg43zZ4XikSH/MEM+SdrOSPjAeuV
	 YQ0Ht+V7dI2SeyyWKrMp4p2OIl0AG6QKamHb+a4i9/gDuw2QhUBGxoixLIvNbYpaDjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xz7IzdJS;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81095607020D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81095607020D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xz7IzdJS
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4ed6d69bdfaso2359743b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446955; x=1795051755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=;
        b=xz7IzdJSXhE4YciKzL/ap29NHHSfhmsg9os/6B08GLCG8rb+dz4wggd60KYQKFgtQO
         pLjrcb27CYUT+G48s9H2l7dKwZtDjMAkIl56r8ojco2bALiQCPOqPAINLXM2vfNsoWIM
         /GY/tAvoICSssp9YjoKNXj6bv1Hmmj0mgytp3OZlwhyMHtL9wK4TeaxvJBOnJKDER99/
         ctSoinOPpG4fFnLFwM37gfN16/8vbAIpcXcWXo/h6JITsAD2aN3n2oJHL91ZHwLBOLGB
         CBmqQBMQOBbg/JjcQsWC/WtJNxDFlQSWtMQhf+48V7MgcPsOkzhi5o6ZU3xjeSZ37h/G
         VyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446955; x=1795051755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=;
        b=ACaWzYlNi5duvwQHrc9wYVK//hvcsoAXF8uajGU5OSmMD5flnLDCccgocHbOECWKuD
         uoDUFXlbHGcpX0jThkCu+Ex8RFwnehpbsyTXxPDMcz9C9KIHaQNk0uSGpswq4iHSO+6l
         2r0XcPyUlH4wffaco7FGZVPA6BZ+ib5O0ulDR2tbCIAVpNvpMqDHiNXKsZDl1kjdKL1r
         7Gmj4lSPT19koC3fbFEH8J7BO2hjjTFM/fcTLqlTNa6teiIQkdYbQZF3irzxRVb5FVOa
         nAw0IsdxSf1Rm/i8jieOaISKGNBAEr9wGqt/prx9ggTeH0MJUhQg1KTx35IzA4nIW/No
         JHmA==
X-Forwarded-Encrypted: i=1; AL+hErFQvcrLyLRScKIDy/rIPiKdijvyubwk1CDK8ax5cZ5l7HdCW/slbMXrXwDCfBpKZYJlrv8PAYXPKa7iHoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5IlUnLuKfP63A9PUq5OfKqd4zE6FqVpURaNA0gyT4bhrb2xtq
	Uw+fifrDxcH681t6kUKUm6Ykw2qRS7z7dmHfX2fF5MnOj8KUPjN4gQG8
X-Gm-Gg: AYBFou0zOwx07yCPZE3UFSckh4GfI4oDFxlx4rnzzKMIbd7vjIMGwOffbjF/w1gd44T
	E8hhj0BIyO/yoSfZLfumHm5WRB97d4seNRdeoI0b6M4Li9Ir7gT5aEfVz/mLriSgk71YK7+mnjF
	XD5zUrP5PjebEv6r0OUfMfUnvsYwazxctP1rGVwHyPZb2+4KJdWUsEBvvqrsdzYZBWpiWrgpa5y
	v3gL5KPf7NI6w6WLi+r8Th5ohTf9nyfWapC5vaNtGUXoVsISh8G+wJ3j1x2zPi3tuifvsTb4kWX
	9xovS2qKigM8JgFxtXkESidHr34LrFU1zwGmXFds9u41RERX1vox5pjumWua8PA59GpaDuDBehe
	ZxxnZtyb5oNgn4M84B1bvVwW2eO0J8FYtVz/HhCx3xCSFuc1WJ4VhtbUx8hqKyJnJd6Or9xJxkV
	uCtzQU6sjB8GLFC1murDBVAGQDdKBhx2jm7rNx7PYwh+tq++kxkILi4CoEYnebPISeuY80PNLaM
	KTEy0RKEDLH0MB3Hn0suF+0+Jbi2dTD3fc02JKVZUbWijRaRlGkKIkR26/ps+mjgnVqcPcmWiSL
	7QDr4QUMm67Z20tI6vnHd+e0dRvPhAIECXIcmbj14l5ZKDiZwJ79WrC8HYvi9y9oS2VFoKaHzma
	S2eLr3ZI7Lt5zrhTXWZUFIjgTqmmncR4G/qBhzpwCBMBHvISuRSiQSqJGyKENBFy4F3aAq80f0P
	asG5vHHCJFYyh60Bw0z8vRlQLyvf6AqimvVlvz2DhMKNtWMDfwz7nt
X-Received: by 2002:a05:6808:1819:b0:55c:859:adc with SMTP id 5614622812f47-56b97710429mr4145217b6e.55.1794446950746;
        Wed, 11 Nov 2026 17:29:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:17 -0700
Subject: [PATCH v3 38/58] mtd: rawnand: cadence: retain open-handle state
 on removal
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-38-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Allocate the final shared buffer before publishing any chip.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 49 +++++++++++++++++---------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 05d0659e6527..4e365ffdf905 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -562,6 +562,7 @@ struct cdns_nand_chip {
 	struct cadence_nand_timings timings;
 	struct nand_chip chip;
 	u8 nsels;
+	bool registered;
 	struct list_head node;
 
 	/*
@@ -3007,9 +3008,7 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	}
 
 	/* Allocate the nand chip structure. */
-	cdns_chip = devm_kzalloc(cdns_ctrl->dev, sizeof(*cdns_chip) +
-				 (nsels * sizeof(u8)),
-				 GFP_KERNEL);
+	cdns_chip = kzalloc(struct_size(cdns_chip, cs, nsels), GFP_KERNEL);
 	if (!cdns_chip) {
 		dev_err(cdns_ctrl->dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -3024,20 +3023,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 			dev_err(cdns_ctrl->dev,
 				"could not retrieve reg property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= cdns_ctrl->caps2.max_banks) {
 			dev_err(cdns_ctrl->dev,
 				"invalid reg value: %u (max CS = %d)\n",
 				cs, cdns_ctrl->caps2.max_banks);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &cdns_ctrl->assigned_cs)) {
 			dev_err(cdns_ctrl->dev,
 				"CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		cdns_chip->cs[i] = cs;
@@ -3059,20 +3060,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	ret = nand_scan(chip, cdns_chip->nsels);
 	if (ret) {
 		dev_err(cdns_ctrl->dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, cdns_chip);
 	if (ret) {
-		dev_err(cdns_ctrl->dev,
-			"failed to register mtd device: %d\n", ret);
 		nand_cleanup(chip);
-		return ret;
+		goto free_chip;
 	}
 
 	list_add_tail(&cdns_chip->node, &cdns_ctrl->chips);
 
 	return 0;
+
+free_chip:
+	kfree(cdns_chip);
+	return ret;
 }
 
 static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
@@ -3083,10 +3086,13 @@ static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
 
 	list_for_each_entry_safe(entry, temp, &cdns_ctrl->chips, node) {
 		chip = &entry->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
+		if (entry->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -3127,6 +3133,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	dma_cap_mask_t mask;
 	struct dma_device *dma_dev;
+	struct cdns_nand_chip *entry;
 	int ret;
 
 	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
@@ -3181,7 +3188,6 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto dma_release_chnl;
 	}
 
-	nand_controller_init(&cdns_ctrl->controller);
 	INIT_LIST_HEAD(&cdns_ctrl->chips);
 
 	cdns_ctrl->controller.ops = &cadence_nand_controller_ops;
@@ -3201,9 +3207,17 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto unmap_dma_resource;
 	}
 
+	list_for_each_entry(entry, &cdns_ctrl->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&entry->chip), NULL, 0);
+		if (ret)
+			goto unmap_dma_resource;
+		entry->registered = true;
+	}
+
 	return 0;
 
 unmap_dma_resource:
+	cadence_nand_chips_cleanup(cdns_ctrl);
 	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
 			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
 
@@ -3275,11 +3289,14 @@ static int cadence_nand_dt_probe(struct platform_device *ofdev)
 		return -ENOMEM;
 	}
 
-	dt = devm_kzalloc(&ofdev->dev, sizeof(*dt), GFP_KERNEL);
+	dt = kzalloc_obj(*dt);
 	if (!dt)
 		return -ENOMEM;
 
 	cdns_ctrl = &dt->cdns_ctrl;
+	ret = devm_nand_controller_init(&ofdev->dev, &cdns_ctrl->controller, dt);
+	if (ret)
+		return ret;
 	cdns_ctrl->caps1 = devdata;
 
 	cdns_ctrl->dev = &ofdev->dev;

-- 
2.53.0

