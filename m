Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593733;
	b=BSUlHUBTpAc/pef/MCwNBZ9KszgRXlXx12SSVczo8VnVaImcDtlgm7/PORNZh0TmCSAV
	 JjJ+6sgdlHe3nGkLWqjLRTIN48JEkYk82RpoPGvmchm9wpDy7gKh2VY7r1kaneJljCHoh
	 YiD1IJeGptl4gjx4GujqpEhrt/w4KEKx1QW64lhGN80gKImI6OprwOxbyW6SgCnokzVua
	 0I90sICdGeX8H2Jdx2sdw0PG228U0elsfB100lgawelrgx4MkXfAuBcsmo/kxehcrZ60C
	 pSKpRsRClCYaQ6GBLEmaWuWmHfCufmYKAVUNNaIG8c3Joc65fSFEsmb1niw4R89LOKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rpvaBkXowcKJNbTZUWOnZy485cqImxbSHRthpUHU0/M=;
	b=NpMAC73G96Pn22AGEJIv78upZNYU3OWS7RWIVmj9UP53IRdADN4tlpbLAaY4VvdzDPhT
	 NxB/vuAcjTTbxVaWsM8dSeoXqHfIdFTQNcsgf5ISHLfPQlX2caeN5fJ5M9IlRq36JWBKR
	 +b33WRGHCdp5vCSVECT3rT9k4zEoKjaWguixqPwxJLGx5GydfD2F0ELglT4YOf4knCsY/
	 vrmWDKVzfF+qco1fiS1RT5EkvO99cENqdOiAF/NuGoDcljdktbm5Zc5C+6d3pGMe7DBzB
	 Nw8KMFyr5GOnYFyL7YwaOt5d3cUA+CitApnpVnMEk1Yag1YkIJG3GsXYoEHiG2ZdZ1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hPlLsfew;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A74606A8A8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A74606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hPlLsfew
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-716d052dc23so490689eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593731; x=1795198531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rpvaBkXowcKJNbTZUWOnZy485cqImxbSHRthpUHU0/M=;
        b=hPlLsfewOnEiA+++0aLAnev/QaHY7hfv9nQomaRTPEqjnmb7IrxJ82ZprnJIZTMmkk
         IJlKGC8OpOOwKUqTqgf7zJ3ngWtgi6bCF/URG7xxB3loxH7zG+mcLECEL54IoQAiGNoP
         kIP8yAEY+PP6L3PQc+KlFc308MvRDiYLwsEbf+halWIP8V1eohuJrxwrRCoDerSBSwum
         a45tBaaA66GcNruLfXWekj3ij2cBIqCzE1NxOrxiHMXlQvfKrrIrk+BFEet1UuJfYgrU
         Y9JvTH80tSE8I26WseAiwA8Y8SaaybEfBjfXD70SkrDfz1lEn7xjvJXLc9D7RPZPGsmq
         r9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593731; x=1795198531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rpvaBkXowcKJNbTZUWOnZy485cqImxbSHRthpUHU0/M=;
        b=YyGW9Um5lihooyGWiilVtZPzA1EhilRjuk9cwGgPnSdkCVitay7i8ZciBx2/r3D5Ae
         abuj+keFbVFV6nv7uVNblKSWIPG3dViwvoYAyR02GQ63wrfizw2isRfxD1KjhhJ87ROx
         cylZ1IOhOr2LsPpIYbmBloTK5shCVOZEitUFTVCqlcVHmVBsdfIjKLoslG13auLSQrsI
         kiEXhzj+sx+jkVRvGlelWQWx+YCic+xTqT1wetr4YFq95AnLR841GFWCFteHC+iKxkQH
         NvXaWAc37ZmnLZErkbzP/FFTpQK7Qpav+DyBPJ5SYbFEz+JjrXcIoGc+4oq6T005c9A9
         oI9Q==
X-Forwarded-Encrypted: i=1; AL+hErHLKfK6//QNgCsPjkcoNu0UU1o0WtIgauOegJ4RD9WEKkycngXeYk1vkl6S0lBMVXSLyWlskaFHjuhmYC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hfRRto6fq2DmbY+b/9UTVMbtK1zZrKTQVQaKuDv4xPke8fVID
	jwEUrxxKySxJOnAil4y4YQH2VH+yPyDnT85u0WdDen571xZEmB8fhzpHGPZg5Fdj
X-Gm-Gg: AYBFou3CnmDJBnf+BXNiYiXZjkyaVs3frjYpeu9kDlkkfUsN4p/vRHZYaG3xZA/sWFd
	AAAAPQJe989MUisgz0tl70yVa2cY8LCysT8y0JgD9lkSBMEiAZgQI4WL69Wc1IPCZtX8ksRAxd3
	sDlob/88c4zHo3FcsO1am/up/lU3jpvGoaZqJJCCo4lplqnLmHr9q4GqS4cz2eZJaYX7toXdhiK
	wMCSqx7g8h5WyDtERLg5cVC4437KUaeDHeuA129wuzZYN+PXo4DyuaA8Fb4Kk9Jq86QrOXZ9Mzg
	oxMX3hlHcrZv+IgsejeEMwS6m8FBYcIAf0A14AGD7zyWUaKy1Et2tPqzQzVSF1GqyLGlNlUebll
	vdkPF2cqvuKDMSb/vR+DetxXmp/V9uj8VJmYNuHGiEN9Qj7xgySkbEBsQnR8BN3wjTOS2TBTQQY
	1htdFBY33h/CPz+W0fMijXlf5SbTzR2GO55IliWz0zHzjVf2Xs4+6rcBvMKfGXKf8KbXf3M9tFD
	Rhg6XOwGZX9hPlRQCOAjoKbLaqEdv2tscs/rrRhyMYH/hgCzEU28VO4o/bCTZah9QtGJJsxip0J
	trzg1YWBj1ppXdbhxE6OabOobL+M5JkNgDG78GuBDL/1C2iCXWXBCm7MlqbO1EkcutOe4bKHZqt
	ZuXMec4pJ1uSnPQ/p6v9++wCtpk0EHYRN1h2dJbejE2BnN2/hhrXgekTliAtDhlZ/W/I6xZdR3A
	USjpBxHmYXhQMjagdb849cHgOuwWzAxQlcno5njCzYKnfo8E7WRLnZFg+g819uqxw5H2tyTOrL
X-Received: by 2002:a05:6820:1505:b0:6b9:8413:89b8 with SMTP id 006d021491bc7-71acc96e8a0mr413056eaf.57.1794593731545;
        Fri, 13 Nov 2026 10:15:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:29 -0700
Subject: [PATCH v4 13/58] mtd: rawnand: mxic: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-13-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Mason Yang <masonccyang@mxic.com.tw>
X-Mailer: b4 0.15.2

A retained MTD handle must not access controller storage freed by
unbind. Disconnect and clean up NAND operations before disabling clocks.
Retain the copied layout and controller storage until the final MTD
reference.

Release scanned NAND metadata on registration failure as well, using
retained ownership once publication has been attempted.

Fixes: 738b0ca55f4f ("mtd: rawnand: Add Macronix raw NAND controller driver")
Cc: Mason Yang <masonccyang@mxic.com.tw>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxic_nand.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index ce9fe27fb4ac..9b666a2c0a8d 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -15,6 +15,7 @@
 #include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "internals.h"
 
@@ -492,10 +493,12 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct mxic_nand_ctlr),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->controller, nfc);
+	if (err)
+		return err;
 
 	nfc->ps_clk = devm_clk_get(&pdev->dev, "ps");
 	if (IS_ERR(nfc->ps_clk))
@@ -523,7 +526,6 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	nand_chip->priv = nfc;
 	nfc->dev = &pdev->dev;
 	nfc->controller.ops = &mxic_nand_controller_ops;
-	nand_controller_init(&nfc->controller);
 	nand_chip->controller = &nfc->controller;
 
 	irq = platform_get_irq(pdev, 0);
@@ -541,9 +543,17 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	if (err)
 		goto fail;
 
+	err = nand_set_lifetime(nand_chip, NULL);
+	if (err) {
+		nand_cleanup(nand_chip);
+		goto fail;
+	}
 	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	if (err) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
 		goto fail;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 	return 0;
@@ -561,9 +571,10 @@ static void mxic_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	mxic_nfc_clk_disable(nfc);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id mxic_nfc_of_ids[] = {

-- 
2.53.0

