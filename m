Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446925;
	b=t8HqF1uTahOzClEuAgbVuLrD0nQ0jghOzEKDDtI1TLgiTeJC11sXc9R0Qyu5e+06HKPN
	 POdEWTgonPvoBKJxJTKb9P/UQhGeSwf2KknJBG4JsQAzuJ1cdaY88I/tpEoXVhvmdHYuh
	 2zY27OE/pE4Kq4EpwxeuYPFO24HUTOh4O0K4dgsLFu+W0rWyXHlbgccCcpS3Zn4uUGHQm
	 xSkobM7oMQ/ge3sCs490D0houU+rYicEe5fSBwNfiRuEM0ZW5M5rVwMMlevpZ8TX3wMYv
	 JlZLqRMeaQftr1x5GZp8QXYi30fh9Kj4o5vghEK1AReN2P9a+6pndfpZCeKJmdsjtlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
	b=hP4z/3eIyFFxkwWljdmFAyA4p73LRbS+aeXRCXsSrAaijygHkzeeGwhnB6RJFd421O2V
	 FiyLNhmCwrW7zB8AEp0xOlr3DBCpLxx33AOCuDGVvdjeOE7UiaxR4h9ifAGOPMY2+0tl2
	 nw2VSr5vfbbGqlemaVJdwgByJNMWFunfUpZ8v5W+bb1eVImWLs98BUR2gRYgMtFvv9Idz
	 NdG+Y3RPXfqTtxDys240By+Ln9aTfzqEpEoNaF22StWE0eUfVGXdXMzjimVlujlvmhSeP
	 +V5Dx128buF+KxOo/b3C1/mYpB/05Xj/0CH6kXWbAE5sOdnlLLlYhXdH8NjbV5Azo3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oBvWveSc;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2004860A5BCE
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2004860A5BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oBvWveSc
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4f55a53898cso1775168b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446924; x=1795051724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=oBvWveSczJ/fMs78dGu4ItdIsRLxQDFNNf3L+2UyZuiQr063AT7O759OypxSZA6IBF
         GpkgggGV7JYfuO6N60+vMR6gb9yU/lGEUh0snpfqKJwa6aU2PrpIAiDmdHGwnaAI13ig
         nBYLR/q43SjnMaiPDIW5ps3rTZeib58mfHrBlIwZHEkmrn+eN7sUbX3rcNfOKOrJp02D
         OYhOcmkSJOCunHG0SSIjOh4fEgYozTSRTj+HtnnRsNYbzueYXEjaKs+UQCku0XjMSfsu
         zka17DopcIhWSGUjGMsZBmgqL6FeqqSnMvTf24uurrPmdtWryJqckpBbNy5Ie2XKU4UG
         tcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446924; x=1795051724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=t9qbjVK2MWyUOq89vAbzWq46zG69u9l5xOybueDLc6WMMjQyKaFhJMRCkeONTHTjVR
         eF7LHjGm+MdLFBxTha4roT7swlgIHHNiMPA+ve5zcaH7aC+cNszjZ7ne0irPi2vO6LEl
         x9d9SYixEI6ykUCj8EbaO/mKAsw6lSLXroFv6QN3J9yl5flZh4f5G3+EE6QLt7MCKKmY
         /GDcZA8YriIN7zqH0g34ufU1XmfjLM+N3O5FRWaAIym1N/YXW7BHK/moioWSUSH/qF8M
         UQiPAH1fqjHHb7gACD6IP5oeQ/qD6H1k2tRXs902BkVeg/JdUydWrk1/FjARsqdobHw6
         4V+Q==
X-Forwarded-Encrypted: i=1; AL+hErGoRBzkunzbJC1fHrIbWX3PoJFTO0yyhEKs4S+LJ+skOj5colOUap2rcDWJiZ6INeoUXFBswvnqLPTjPso=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rD+hKEPxYDY+oOXZuilJ7DVPKPcTZ9dupLp8nxlY1NWnOqHbc
	/uq25So567kv6bgk+FfOAOr1+TkF0QjOlh6r3ogUAc8yAFyEu53Fmr9f
X-Gm-Gg: AYBFou0WGwMA4qg15x3XIdifsnpxwSIVeUkbJRxONq7C26V4ZbmNo4xzTIqUmobhwyD
	gQCezdA/mJvyZXEfL84VvF0yEY5BAkWRMMuwZpSx/BmOY6VWv/yij03dABAko3LTQ3I8ivxF+k+
	tfsgGC8XUJr3wi5542cs3P6EcpoC0kb9pJ66g24ghqF7KiqNNtpuDHp2uYRIEVHZo6C9+6kBCeH
	qgLS7YzIz/oZXPC38x2ycUvrjI6WOWpVxbM6/b6B0bEdL8X+r/eMbnR6ylw4avSIGmXkYCVr+aW
	XTejrSegxgZTsZO69G7VEk1Po2WcUIojrMzVanJMff8ZlFWXVH6Y1r4KfhtNsk4xnQKe5on+aHY
	OeNPLcjh29Y1zNqVvoH/HgpwSybGgMBHWAsWuXbnFKYUvNWl6dSMR4k+CN3UVmgZFTEFnDZdXXr
	XmpJkh0CRRBRHu3Lw65dUwz9J7GWtYRKVCnOGBsp/KfvO6N/yZDLpIo0FOI04xk7TGlIMVrAkNg
	fNevIIbcWt3saV1BrQvpslyPi588/9flRlZm2HJk/DkJpNJpjyjzucoczbOK5mglQCvd6d13By5
	BZoCsfnlbgkk/QyV37mM+wiv1sqF1wyo62dfMLZ2Lv6GD46BzmyPJlLqkI3VuB6cO3w9FKiSOxv
	/yihO6aiBk7RheaT3Krw/nzQ6CqkA3jqRFBnAa6YM+bSZNXHoHUIvMB0nWRN4OBkWTZJpxXczTe
	vin6nifBa9++zHjU9DKRccTtrhLnVhPWB8pjfwHeCbbrWDaAW5oEhQ
X-Received: by 2002:a05:6808:198f:b0:4ea:18f:64b0 with SMTP id 5614622812f47-56b98c1b3e4mr4154573b6e.67.1794446919315;
        Wed, 11 Nov 2026 17:28:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:49 -0700
Subject: [PATCH v3 10/58] mtd: rawnand: stm32_fmc2: retain open-handle
 state on removal
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-10-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.15.2

Keep the embedded NAND chip and controller serialization state alive for
MTD references that survive unbind. Disconnect operations before
releasing DMA channels and scatterlists and asserting write protection;
run NAND cleanup during disconnection and retain the core-owned layout
and controller storage until the final reference.

Preserve immediate cleanup before publication and use the retained
lifetime after MTD registration has been attempted.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Christophe Kerello <christophe.kerello@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 78af58d87960..2b8c0b467f7b 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1915,12 +1915,14 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	int chip_cs, mem_region, ret, irq;
 	int start_region = 0;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->base, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
 
 	nfc->data = of_device_get_match_data(dev);
@@ -2024,9 +2026,15 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wp_enable;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_wp_enable;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -2061,7 +2069,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	if (nfc->dma_ecc_ch)
 		dma_release_channel(nfc->dma_ecc_ch);
@@ -2074,6 +2082,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	sg_free_table(&nfc->dma_ecc_sg);
 
 	stm32_fmc2_nfc_wp_enable(nand);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int stm32_fmc2_nfc_suspend(struct device *dev)

-- 
2.53.0

