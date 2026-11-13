Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593756;
	b=LY519gXavya38wk6Chk4/fUBJlGJdtv3WwkSjHcbvitD2czypXR20R5rym9DfDAzD84c
	 qKMWmOukN1VmKaFJ5uQA1UGj38UYxxJc0QPqo8iJ8cpqzCbue73NOiKJ31EHEVmbIc1dX
	 f5gpZBQ2ihl26CFaPjHoEapKPsu4V0hgVcW5z41HkMOyum8+oi28CyqI+XjPB8ax3T0lt
	 ACjj/H8Poe0Gio4rsQPL93QJTPEK4fMxlO5A/klYIz/7ufTbfKQv9Uzu3gk7iIXipBJWc
	 vAT5DYoBIjllKN3j8FwL+Xi7TZyt3w/73JrgQzNjfSNHiaGuRAlMm0qeF+VKMZoy4+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
	b=CZvpr5vp/af0C3YD736zO00ooJ1Bp1Rg3HKAFdAcGAHIY1CXiH14fBgn47vC5j/YQL7L
	 73yMHtj7CKMj+OHYpqyy9UohT/VuS8sUXT4oVSP/Ay7Ho5ABbsJpA1O0ATfEy3bnqp49i
	 XXvhTS04K2cVCo+74eQH8bZg9hOgPS5Ue65WkcSPFHFNfoHkGj3h4197THVwkn/7+0/im
	 Vlo73ZPM+MXZ7m6EVsse70pHqrE1IyRe6GRB3WD2iZCK7zvyGEviqjK3kw12TS8fXSZbW
	 3DyPZQqjMFiqRXFM+nk/WfV6WfutCqduKFBD/X+4DSWDoqsXNYLOdZY8rtE2XX04BEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0v3ekNe+;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792EC606A8B4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792EC606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0v3ekNe+
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b19e291cc6so2162374eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593754; x=1795198554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=0v3ekNe+cVvjdKUQRgEVBWyJYiWHxDXmNi1zVnQ3AiV/13twBU26eOHjPvEt+FCsFx
         eOqz26tk3P3gQXV8m1LkVRBDjUNoK+X06TmPfcubHoI9/JuM468EuYkUcEzrsoPdyMmy
         ZbMXHAM2MZIW86k2CbTBCeM73fTnjhX9ffGJ5EHA9ULhxX+FPagdPFwjC3sP3nfZ0Erx
         ytoO9CfVLGkTERC+Hn7PdayhJm4Un2A7BauSZorIQpit/tgpxmRXHo3q50mwElIMpl6N
         ch/Dc/ff0pH7oLJiGJyMZq/9IZ7Bqd4TQLGoZ7PpWeBvGm1F65WUwfqUWTAL2KE2jbdI
         vf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593754; x=1795198554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=Sz2b+SOlpAWT/y/OMA+/wwu+068cJdARHR/tAmvSX4/PceYzW2CQDgB6GVISEP2fOG
         oi+PD+GNx3oYTOhEEnRNruqHo604h9fhsfNUf48ocSa4RZvE58NCLbe7qMVY8GMARr01
         nhIdP8yLm/7OBGAsTmTqzjF8PuEK3it5AtVW2/M/tRy5b1E3e2sj4JqHs4QqMur6wpDR
         DeTCs9Wrs+4srOcqau13Y70XzLeuJMzDBQZPyO89PXxD9grnxL+3K+bnMZb+oeX4EguP
         STSyZUKyS/6M6VZ7F3cT8VMAgTtHvXMhHTB913GFAaoor3i4mSljNwROfgctHqVmIaaG
         Q4vQ==
X-Forwarded-Encrypted: i=1; AL+hErHpbCr06N7TXdBf3MQrftH2khoLvzlMe4MMFstcc2dmd3BVJ3tN7mrs9GX/9wyNRBzWpF0BwMemnEhcplo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WPfGE2u1eCNaIw35fKlHviL1sctwCGEJHPBRAC6GUu2gDeFyq
	McwOph2qNKgHw67pbEuFb4M6Vdb+BhEAxzxSuXgcysM1puGuXXBQiIc6PewCJRKG
X-Gm-Gg: AYBFou0rNXaM30QQ5qcNYs3q1D62IQEcXBlHi2IigaWapebST/jXE5dhk4qslvnDWoc
	q9z41lfkBJpMtfuqQNMU+5azvXXMmIjznniy8Mt2RaRWHkjw0hxe3B+uRMojsCrhy8weqwAscfF
	d0Ui1o0a9Z6C/+Jq3G3e6sDDA/Yx3CTYcGTnQkahgtfA0F8mqidHloE83QV10lLdgs2vL/u87q5
	MWYUj78Xp9BRbFA9vYRTTZCOTTUpV1ldCiVOJLVsZz1GUxqR8ugJ4dmfH12zkNgY3FVPxePVEPD
	eubW830QoTtsoiyIHEB1BgnE1WhF3dMkWKg55znb64D6iEJ1sqx6ic+BgQjO+llrWb+bevOOZcl
	Q03r/bv+AYfL0lPK1zNeZuMZqqNnfuKcEo01HOpdyBNJ65/ecxpVXjgHjTi0YFxNVjilZmOCFvO
	cK4h1qufS9JEVCnfSXsiKFJxdqrofTTWjOjcziqVz/9JQzgQmdRVLeynmszxbxc+jq97vTYksTw
	lFg4AuU6kLs4kh0xGNaz5mT3qsm/38BZipSeO5Ji09gz4A9Yk8kI2V/NXD/WRzdToOJVZhFFDo9
	HVKm+/x2py0Spq0d0opziVGhbyvaeQyIOqi//kKjyLPdM/O2eVEhqJkcW0qm4uSeSeyup9MeQIh
	w5Blr2FRE1IfV1tEvkHCJH8NF9omKtu648y1MzUTctqfkFcfYZp3i1DQ2vk1lgqezhDEbeWfEjE
	13FrgcQO1t4kubfAgHeOGH0lUqEJ8FWf3tTpybHc7VuHF/SSEyDTE=
X-Received: by 2002:a05:6820:1517:b0:6d7:4af6:e292 with SMTP id 006d021491bc7-71ab4cd94a9mr2120429eaf.2.1794593754457;
        Fri, 13 Nov 2026 10:15:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:45 -0700
Subject: [PATCH v4 29/58] mtd: rawnand: ma35d1: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-29-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Shan-Chun Hung <schung@nuvoton.com>, 
 Jacky Huang <ychuang3@nuvoton.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Unlink each chip before dropping its initial lifetime reference.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Shan-Chun Hung <schung@nuvoton.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  | 36 +++++++++++++++-------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index 23db2f4fefbb..9d89263ac09c 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -866,8 +866,7 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		return -EINVAL;
 	}
 
-	nvtnand = devm_kzalloc(dev, struct_size(nvtnand, sels, nsels),
-			       GFP_KERNEL);
+	nvtnand = kzalloc(struct_size(nvtnand, sels, nsels), GFP_KERNEL);
 	if (!nvtnand)
 		return -ENOMEM;
 
@@ -876,17 +875,19 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= MA35_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &nand->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		nvtnand->sels[i] = cs;
@@ -899,23 +900,33 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 	nand_set_controller_data(chip, nand);
 
 	mtd = nand_to_mtd(chip);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 
 	mtd_set_ooblayout(mtd, &ma35_ooblayout_ops);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, container_of(chip, struct ma35_nand_chip, chip));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nvtnand->node, &nand->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nvtnand);
+	return ret;
 }
 
 static void ma35_chips_cleanup(struct ma35_nand_info *nand)
@@ -928,8 +939,9 @@ static void ma35_chips_cleanup(struct ma35_nand_info *nand)
 		chip = &nvtnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&nvtnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -953,11 +965,13 @@ static int ma35_nand_probe(struct platform_device *pdev)
 	struct ma35_nand_info *nand;
 	int ret = 0;
 
-	nand = devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
-	nand_controller_init(&nand->controller);
+	ret = devm_nand_controller_init(&pdev->dev, &nand->controller, nand);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nand->chips);
 	nand->controller.ops = &ma35_nfc_ops;
 

-- 
2.53.0

