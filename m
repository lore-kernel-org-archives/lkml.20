Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296673;
	b=C7EOOeMX3rMilWY7XkcJwZtcHvoR0VjXwr2lQ8VQmnN80aqgThTN7DjmKXncVdbWVWtB
	 JWqjgiP0qW9qKI1y0BNH+5pjFTykdYkE03YyqDA+bGa+iMgjdSbMENCAblycd1Mq5VuV6
	 DonRGvN+77epCsqeomuatyZh2Zs/u9Fkb/G6GuFAj3bKbcKJtvhM/xfFmQ8J8kaDh3B1s
	 XP0VGuHsrwKsf5em+LP3MI5ycQNG1MC6wMEOQ1ll1vv2g2dd34jf6DoAvGV/OD0zaE078
	 VT5JmFDGfuEPFt6XjNd59OqGxU/0Ax4TP3W9aLhYgPBJsrCctgUFqaU41/Fnp0h9mcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gaUjU6rZJ1LzqNl1x0+DJrNeQht0mR0DpJgGLhNES4Y=;
	b=txqJIKqxLhlhMmygjg5YnpOmPqE/uM9PprlpX7DJuxg5NYAR8MZ1363WMqB+YREL+Nrq
	 zW/e9XCbDhclpQm6KCwis/dWyq14w3guiDDZWv0dHJJmAkdi6wTAdvEcfS+NZ5i2h2qqP
	 mBXBL9dlhz4I7vo35A4M+uNDokEXEq6CRVK80bJYRIsCptI6it7y48gr++ukCtHXCeqYV
	 fr/9kaKneJqd7jnHUY8w/WljBy/rBu2E2CxKP+Y8YYWQiNJT9IVbD6ZVL7ozxz2GFLCoP
	 jJslOBafEtdT9/BT9HsDx8a+R0+t3H8l1EP6h6ih2gF9/RZQ4DTj8hE3jLir8KcGPkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zZV42IJc;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C136D60A2602
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C136D60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zZV42IJc
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-53a448f86e0so907969b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296672; x=1794901472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gaUjU6rZJ1LzqNl1x0+DJrNeQht0mR0DpJgGLhNES4Y=;
        b=zZV42IJc3/1/zRsoXD8n4DQpsy0Zz3l1hs4vkGMkl2TUbgY+8dktwEWJsjewzB8oTF
         OPpLoy5wXK5I52fS4DXePekH6IaXj6KxA2y0lcB5BMwFxxYA0Qz0LxpqL1IXvmlG0Tqz
         pQI9PBMEDpuq76XU53ZXd5md67stc5f/ru3kqgH7mU1I0R7AFjTNDWUaX2ydhElfsbT5
         mKD/6BcVmkzbNEI0SKqpdUDY9I1iBUtd+EtDD9JgiH0e0OCWH6hQ6TsDkMIv/4xY4OI9
         c1pQ7J57mtM3gkD3iqSvNiahL3Xgu8ZueDC5Ght4kH8AjwWOa7KHEIPCCYGQa9Uw1vbO
         +ZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296672; x=1794901472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gaUjU6rZJ1LzqNl1x0+DJrNeQht0mR0DpJgGLhNES4Y=;
        b=GbFGondJQQiHDdo7kl8qFR1puG3e1Nt5sdeh6kOdFJGirJ81I/ryvtGU7TX/Y3qC6Y
         9c5diTLgtoJNnoS9ZiBEG8ae7v1kIIuaPDr3XowMeRWFcWYcbGmiaLu4kC+i+mjn6EU8
         sCCKG6R5X/W5f11eEFVUvkN82bDysBm/evdjDOwr/Tk91eHJbcBnm9MLekXF0FXoXOdL
         pMHaMKvNGNr2wC/N1Wk8GBnSUapCvWk0wWq3PVmCaeH9SDnIR4B5RRf7dWqRAzMIgGdK
         UuyWi/nXUHYC/IPxd8f4xI0RVDIKjmqtovyMwCCRzZi8k5vtKWsN3JgliEllWFXG0fmx
         qK3w==
X-Forwarded-Encrypted: i=1; AL+hErGPZXcWM160WVt7aN33JbeHqMTWJhLcSpTodHeUm2Enah2IRoXe4vPwoTnrk8Mci1IrspZZ8w1yo43XoMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cGnUmSKzP3ZHyja/li/ttL4ILBSfmWptI+GdLbxb+fwC7eyne
	fKGwrJW8RKK6lu7RmE7Ezi/LFvwbKiUh4jT+fRTge3ATxCKdV2oaZ6MnkV29fGwC
X-Gm-Gg: AYBFou03Lto4xzYBts05xn42mqmdhakum6WPP866s5pQM0uNFuUbMgQ+SW3pnTm26Ap
	NHHFwkV+GNCrVLnWu0N6R+iH1Ky4rSxfl8mqHdjy9qAtCz+I5CifJXBRJp9MJ94h8+ekfLzCo7X
	ol9dmxZQizAImblKdLacB2p0egBCvSBzhf+tKMNo2k/iZvzc+4AvlJEPLZECGiXoFsbmj+oTqI7
	l9KvVxGj52/gzpn3Fr/bJjpIe4cxFwrJ9LGas0/hK6usqvRlabMN3ZmzWUVIHvyLie564+2/u87
	lX/xEGdMS1H66NeS+3itXZnA1x10y3WR5Ij2prvhNtxEt5JrIokPRmExVLNmDyD0gVxodYvfh6t
	4k63/UCE67eo3s4KQG1DXeuHR75uOn+9FqxpjTymjoIfqa8eTm+P6MQffd72NZuUezxLIzxcmN/
	Qo4Oq3yMlee7dwS0Ny15gccVdcpAxt6M8jKxTy+tNVuoOCrBsUe90Pz0Egk2Bca41le0r85H8+9
	PX2OJssAFG6j4NIqryZC08jhr8I4gKzTAzCUY3i6tgLphYhP/gAGbxMzD+ovyBUDgwGeSjosHKC
	Ycs+Ahztk5J3B0kefGzjT8Z5JNpGzgfdczI1lgSAcOwrHEIK0M2J9joGh2WRnmNGHVFa3ws2ZxR
	ZhI3yLslsvO3Qb+HrgRgi/EmK6q8oLZVZPpMNd7WG6t5bre1FcBCuo1ymOjbfmqg8iEx6AYy/lh
	ibT5srZ/c+ySOdeIaX3qWNfb042n7dV7pO9hXaH+3ZeZ6i162diXE=
X-Received: by 2002:a05:6808:192a:b0:568:3866:d1c8 with SMTP id 5614622812f47-5683cd1afa7mr1399971b6e.42.1794296671626;
        Mon, 09 Nov 2026 23:44:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:13 -0700
Subject: [PATCH v2 10/58] mtd: rawnand: stm32_fmc2: retain open-handle
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-10-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
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
defer NAND metadata cleanup and controller storage release until the
final reference.

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
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 9f42f8ab3212..4b89094c89e6 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1902,6 +1902,11 @@ static int stm32_fmc2_nfc_set_cdev(struct stm32_fmc2_nfc *nfc)
 	return 0;
 }
 
+static void stm32_fmc2_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct stm32_fmc2_nfc, base));
+}
+
 static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1915,12 +1920,14 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	int chip_cs, mem_region, ret, irq;
 	int start_region = 0;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->base, stm32_fmc2_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
 
 	nfc->data = of_device_get_match_data(dev);
@@ -2024,9 +2031,15 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wp_enable;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_wp_enable;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -2061,7 +2074,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	if (nfc->dma_ecc_ch)
 		dma_release_channel(nfc->dma_ecc_ch);
@@ -2074,6 +2087,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	sg_free_table(&nfc->dma_ecc_sg);
 
 	stm32_fmc2_nfc_wp_enable(nand);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int stm32_fmc2_nfc_suspend(struct device *dev)

-- 
2.53.0

