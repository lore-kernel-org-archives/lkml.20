Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446941;
	b=zLWj0ubyfHqggRy4Z5EgCqlFYe8JoXvxtQlJbhU4PF+4kvVLrhsAkd0XOqOIA9EZ0qJN
	 wh1hmnCvammsbrTs/yiBnTKje4kKr/t5xx7qCrYLx8OW+DnOWkuGUBL529ys79qCMO86W
	 nLT2RTPBUtSiwbUaersr0i0Gl/FU1ND8aUxmCAvmZZeVk7IgKmi6Ou04VBm9O+Kisb7mi
	 gMcjq9XM5WVTOEU5tZ183j+bg5+43MTrQmCnjP1nN7k6jfYLeS8G7+x5z5xDwgew3tva4
	 P7Vb5G9StVMcnjgDdVvDK3FknU2XS1Tn9OqKRE4OHI3oMcWqnNcCs3ZF+/2OvO0Ec6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
	b=Pm4rWHqT6Rgt1zCnQvc/HKX85fsFZgPrJt3vWpGPgvBfrGh186mY7DReQQaIC4JKeFcK
	 0tk46x0K6dt+hFI3givo/r7kFAOsAsGNx2fK+R6FmA9mwa2J+IXwVeM6N90I8KT9YWBGs
	 ++jTpGK2G0Ylyd9G8fV+SxxM37oYZv01oRXSyEKRItkgzGdF8JZF+dQM2SfNs94SK4zIN
	 y1QICLSoMO3G4uVmzH5GcyTiFJ1evvLNQZImZ+W8No+LfiPyvpc0MDdecdbSw+w8awqAB
	 QogUL3GdYojUZ4r8bHISMVYT+kkindTVyLFPypvR+pXhu0wg3Efd9mV3PiVuZgir+/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YylywvDI;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01262606C18E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01262606C18E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YylywvDI
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-82380b0f55dso1692369a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446940; x=1795051740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=YylywvDI+9BsgfgTCX+bgZKhw9bhcGCzVCy2t3SAHHCj6x2XKrHUWx2WBwRMEZjGXB
         8rlpdEKakZvGi4F4ZGelyEcAYlpnH/Yj0AYHkbX1gecM7XxGCJYU9pO42vaeyCmHnWkh
         kuBjl7oxsK7v/7a613xRXf88b8lxuUmaM+rzAU60DqYeAAROqgtRACdRz9+MBtRerzLb
         z6qwCFrls5UEBI7kLDLLnBGHWuhSxJ5xnr1PTbI+VCpy2wvJPrqTIJF2w9kQd1OhwEH/
         JGRmp5RUksh3oeLJ5BY7HqbFbhIAo8F9SlJct1y6i+lw+IhwvBPOGz0N9s4DQKn1ku36
         up2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446940; x=1795051740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=AkatioI9XvXPaz898ZWAjWvhwTJaC+B0oweg0J1GqH3lna/p6XFMwNXfMMaDGJV7u5
         +MTWsR1VV9X9otc6YbYaOhYSpFOU++eaf1Zf4NzXslDs76FqTK7ftjdAxAQ/FA9ZH4hz
         wJ39+Bv6O4Rwx+WerPSqKM15wqQufXls7cg8kLR/g5TrotYzeInUzLbpJNaD/hovo1xj
         C+U5la4jtLaSWBBMko34oFVxwiC7I+HFn0hwBOrmGr9f5rmBESigLAq5hm001B1A6lH+
         m4DWZmVuqMJgQAMBQMsh549anfXh5+D6S5pm+74p8lVrJf/Aavg73zIFZEyvon1GTgAV
         fUIQ==
X-Forwarded-Encrypted: i=1; AL+hErFfYMiRLVTouOD+TBSsVCF5yaVM8e+pbk/75qG1SKL2hs6M8EreXVdeweDAc1jr6ZMh1J2CtmXJAZA/cLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CeKXC/eIp9HasxXi4tefnfx4C6nDI7ep5bl3f2L0PTRIe4pMw
	2z6V4gpbt5Ssv+Gh2h7dY/CEXC/PUqNPnPVAFhenP1a20G/AcGmAR3dhnV4+PRAG
X-Gm-Gg: AYBFou0A+m1uBYjf23+U69X93e78pbUxYh6E/pZmD2g5dFtBkiBz5IZApRvoxXKn68V
	kotd3L+G0spkyU004j+exYSlkTz04dCdkRke93NQsxg6P5gXL6EM/PtNMaEGrzCeJvvosrscGoz
	sMCky+NSC5ep/Mqwdehp8kXKMqiS/wxO/J53nEFYxOv1mlBS7a/Jvt9zIQlhdlCEL8nOVQ1+Col
	50/BeyeZTZmQ6rDuYh9VLI43hJuiUPjh2zdbSs8XjAbT+2oSoREOoowOyZEBt+Gumgs2A0CbNrV
	8EieOV+/XqqWZA5TJ4IameWV444s05/lJXixrCeZsZFkJoFXctLJyIUSTPQN4r3YGUPJlMrYANB
	wZC/aqz9T6GRMZIAPMbYSdoascNOciyUhRVon6lGiu/IdmgiFtzEWNFrLrx9tKN6mcK94dXBN5h
	5te9qZIyeB9i3awQ5w8YzvIm6ZNFjvgwMjq0NbyPiryGHU1rH64Su2hp6vZOP+cBM6DtX7QeNKV
	c0uYxxP2Aa77TXUkcoVixvlUguXU4NTreLXTqvCRbBM6VHe3vMm64FiHS4z68yNf97s5d/R1pz+
	H/P6R6GDtBHSEIOyYCfxs7ftbFRmf0YK+sXk26sI4Ydm6+1EGhKno9PbanpM6uzJx4sUNOxGcl6
	69bToVJbQ6ULLoHv5q4G9KjHB5w/jia1gK5vuLFmMGvjZEDkxHvgkagOx2aAXtg7eqzKq0XwZNY
	oH8y50uZQz+ayPdysB/Jkt3BRWnFn4/r0O5H+xwfB4kO23egksZsfP
X-Received: by 2002:a05:6808:30a4:b0:53a:3533:10d7 with SMTP id 5614622812f47-56b96298e4bmr4442109b6e.14.1794446939678;
        Wed, 11 Nov 2026 17:28:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:07 -0700
Subject: [PATCH v3 28/58] mtd: rawnand: loongson: retain open-handle state
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-28-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect the chip before DMA resource cleanup.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/loongson-nand-controller.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 741e19f351d1..7f8ea6819097 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -863,15 +863,20 @@ static int loongson_nand_chip_init(struct loongson_nand_host *host)
 	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
 	chip->buf_align = 16;
 	mtd->parent_dev = dev;
-	mtd->owner = THIS_MODULE;
 
 	ret = nand_scan(chip, 1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret) {
 		nand_cleanup(chip);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return dev_err_probe(dev, ret, "failed to register MTD device\n");
 	}
 
@@ -890,9 +895,12 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &host->controller, host);
+	if (ret)
+		return ret;
 
 	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->reg_base))
@@ -911,8 +919,6 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	host->data = data;
 	host->controller.ops = &loongson_nand_controller_ops;
 
-	nand_controller_init(&host->controller);
-
 	ret = loongson_nand_controller_init(host);
 	if (ret)
 		goto err;
@@ -938,8 +944,9 @@ static void loongson_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	loongson_nand_controller_cleanup(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct loongson_nand_data ls1b_nand_data = {

-- 
2.53.0

