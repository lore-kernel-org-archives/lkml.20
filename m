Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296670;
	b=dhqRG+6rd30CFc9sSJgnRKfs6B38m/NpSoqybVk18yeE0DC50tzEFvuMEA1FLT2OKHLD
	 Xq+lLZZsw2gVB6H1DXQx/4P/OaRyJIRK93HGvnMrw1+3M4t0zk0Sl3SU03x04e/7ZHpYF
	 M+6FMiNjM3ASLEF0v7K747TpFb0uUiYygt6W/RxzIziP/kWk446yeJ3t/rF3kTq3sNGj9
	 ghWqMR3S4r2COldJDdDgrIE00ak1d6sl0lJ6TPrJkefNEeFu0x0n/RXmG+sHdFaz77mOc
	 KyJpF180hlHQl+tu8naWagd186KNiGC0WGz91XFuaXiqnYoq5xpBdWA+nW0ZYCFhFYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hUvf3ot4iqxrUfrMJh1JZkfv+SBMvHqtfVJ/dUW/YP4=;
	b=0NMJoO+arRlp2px7Z29NqbJyoQz9PUncM9xuJGNd3Llkho5o54kjEEFgq7E2KtgY7PWT
	 dxhlr18QMqUuQeR+yTbzaKBpBepgbsxdqS4aAnERNkZ2NQaipO9aQJxMyMr47zqYIRmqx
	 7Bjm2Rrk4R6ed/DzvRgXYNdLPk7ACJ8z/v61b02s21i3gtXoCRnQE7bXvvU+XUp/tsj7b
	 HqHQ96Um7WWRWloKMUPRx7IjN3Xgg4yk949ImjK1t0HczL11Cf5om0TYtX4P1miaUJNHX
	 ujN9USfEwLlQdcfxtQILA5Mu2wS30tyxbrL9Qjg3BbH16EoudOO4P9mAaxbPZEDl5lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=es0QAPhI;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7464860A2639
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7464860A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=es0QAPhI
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4b28d9537bcso1202788b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296669; x=1794901469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUvf3ot4iqxrUfrMJh1JZkfv+SBMvHqtfVJ/dUW/YP4=;
        b=es0QAPhI2+0EyQn83tTVGqUTDWZ7c+g3QYHPlZ/CNvTk59gquBM+ylzGkvlj5wDzD/
         dOrN/U5Pp0z/DfJbhq//zE5I+GN+qJnErjk2dn6ksTayH0UMzgshOJAy7kM7Sv/UYq2P
         VW8Z1mwe0eixoMtXwPJUmiD6pVG0uU05JSjQurFHPcjtdNRbzcfbMYCCXrsf0RABrFLt
         GFSKxSdM32ZSjjJxyKCQuve3J8PLVuWlN3g2dGSucmEY/r5/7cB1ziyl0xcjeRPcGSkg
         Fx9+53lgra6hXaGeeLIOw++3Z3/UOX5ASFuSxrtPXLSPm0Er9HdwUF8K7JtX8+fDxhXX
         pAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296669; x=1794901469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUvf3ot4iqxrUfrMJh1JZkfv+SBMvHqtfVJ/dUW/YP4=;
        b=S+3VNhZEKjNj2YzrTRh00TRqbUlON/f3o3ffNu5bEW3yFJpTFv5Id6kb0X2+yx6UBH
         uDbEGqIOKz6msHz5Lqsb2p5a5treblkhq2byT6CZZBp+enMuhEgOfF9Ex1HfT8ftZ/oT
         GUfhlBkACjDKhX6deKTXndhd9KA41+tTZvEsy92uLLyG8T/4eg8cVQvHgU5kHwbKmLIT
         zlNkZAKHWOFOecVl9Gzcby9A9uKdbDJuwOamEHYY3czyVNpZTHqPfgdUGCp/nebIjifZ
         AncADLzyZWIqdDRL4MpLmd2zKXW8tPx4uFWoTb+4oQM808VHPFN1Ft+fvOSLXElYDs/0
         tdPg==
X-Forwarded-Encrypted: i=1; AL+hErFWGx4J6jr1zallHKTUy1dcAqAX4L3qps3FP238lFWLsGdcjWO5+FP1mLeKL5rIdf3vkb8bKZXYf+6fC54=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f/XAYGzQoctlsmEdT45/C2nfbWy6Gy1Xc19bbX4YITiNxSIfd
	hqxHRzi8pKJtJN+HGBuQjr1e46SvNvmLXbsEjvUBg5z0VZuFcq8qJtKs/henmqDW
X-Gm-Gg: AYBFou2vSPkl0X3E5e/CoPyY42pej5REaqHc5GUgHQSW4vua4L5DzVoG79BsBYhsqd1
	AO54KgvntlF29qWZbM0tgsqEyu+CgI7RxAotMX5BFYBG0c3qfQmytBudmE739zrzXDyU40ICGjG
	wThL9ZGJUc6wHSwMnjuQFdP5ploaZwStTCX0UOqeFfP4GG6qHFgEfYBspBVt4Kh+Uz7j5DSLogi
	txIb67CH2qEDWnQ8ntXZPPOCsLOlQihmOvz6snHa0+LYj1cgYTkOaiYIBqxp/wBE89E5k46P2zL
	Ol3epjyGj4afqSOdn1TT1yP6iL8Pi76uFIxVXWdvdQj+3rCfxC9fSzNKYlBWkU9W5S8bWuPkAgV
	alZOkMQd0Tf1aPMyZpuWzi3+mprxYCnx2jwGzWT50D7ZCtj38grwtRId4NCf/qQ7A1MvOrFLp0i
	lNQHjVAjC7aACUOctug1B/8HBmdUOXTf/kNn+fMI8RKupqz40x2vg6OkDKNFwzzLwF5MzvJ7tBF
	hmx9vK8u2NHB3TwvmRo38uUElM4wofhw69BwoGQA+FKaWFLmOj1KeD5zve9IojWWcdOu/LYq+NV
	/zdS/kRFzR3WUxu+t+fKMPMoL4i11Qs1HhLhFv0gdCe26sshAyp+p6XiagwqpXGhaLUmBycKPEk
	S4Cg4jE7esN8HflgpV/OwbuAnm3eqe4MHNrnHFVXflj8oBzj+0ctfymg1gQSS0spktg5+aX2M65
	7RLy5wIYR9IFZy6F8ISzKktvFIrPJldLcc9EdIqaLv1jHYUfkLhhEDJMP5U8BjrX5IVAmnH8fD
X-Received: by 2002:a05:6808:3089:b0:4fb:c2dd:c7a5 with SMTP id 5614622812f47-5688127ca80mr843014b6e.31.1794296669298;
        Mon, 09 Nov 2026 23:44:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:11 -0700
Subject: [PATCH v2 08/58] mtd: rawnand: plat_nand: retain open-handle state
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-8-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>
X-Mailer: b4 0.15.2

Unregister MTD while notifier clients can finish their I/O, then
disconnect the NAND chip before invoking the platform hardware teardown.
Keep the chip, controller lock and software ECC metadata until the last
MTD reference is dropped.

Handle registration failures through the same reference-counted cleanup,
since partitions can have become visible before registration fails.

Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vitaly Wool <vitalywool@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/plat_nand.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index fe31551bcf5f..8321667fae2f 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -21,6 +21,11 @@ struct plat_nand_data {
 	struct gpio_desc	*ready_gpio;
 };
 
+static void plat_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct plat_nand_data, controller));
+}
+
 static int plat_nand_attach_chip(struct nand_chip *chip)
 {
 	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
@@ -65,10 +70,13 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller,
+					plat_nand_release);
+	if (err)
+		return err;
 
 	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
 						   GPIOD_IN);
@@ -77,7 +85,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 				     "could not get READY GPIO\n");
 
 	data->controller.ops = &plat_nand_ops;
-	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
 	chip = &data->chip;
 	nand_set_controller_data(chip, data);
@@ -126,6 +133,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 
 	part_types = pdata->chip.part_probe_types;
+	err = nand_set_release(chip, NULL);
+	if (err) {
+		nand_cleanup(chip);
+		goto out;
+	}
 
 	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
@@ -134,7 +146,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!err)
 		return err;
 
-	nand_cleanup(&data->chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -153,9 +166,10 @@ static void plat_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id plat_nand_match[] = {

-- 
2.53.0

