Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296677;
	b=kPY97LUol9p2m9WG/7+xe0l4gpV6K6DstBnSVrYQRBlJmfcUIvhJCzPiG/dMufRO6NNU
	 KptsNotUVfI9LbHFKm9gNfeiReej08Bqdhsm64yOTv8OtXD0d7Xp1D9nA6pQ+rE6eeZdb
	 g8I8vWwG9iN89Prp3n8ORmAHDh7zf4duePL1dKjqix/dYZdf3lzMy74K6T739OYiQI4hA
	 UD40uVHAAGQQYoi/8382mPVqJY7gqRVoZVy2E927JgHoQro+piLMc/U4Iaenf3fW5VVKU
	 PWewGCE1Iqf7hzXZywMkysTDH89m5xmM6xaDe5UDKxlg1Xf9h9l3CDqL19OVcx/51xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NYvGWnQTx9nbWejmcA7tm6oPyaxtb4Fa0G1aGGB1q2Y=;
	b=KYBQXnXeaPsZm5On3XamPKcCrxydmYMCSXHJMQEzJKF+40gASjJOhZVUDzcG4r5m6rt1
	 rQNK2GVXeXUKwxP/U7mHvKbQb8XF9tanqtJp1BO2IAzo5uM19KbSGe/6CKpioKAdcOZCM
	 OlruGlssXWumRVY8sfWxaybZ6Pe3t+PN6qbgV/sT/27HlYae7U/274zwHayEp+i/iSojS
	 4do2NBXXoGkW4LEpwja4pn8BKmoVJXdzsZsipvULkzqKkglvhdk2Pgu2ThzIkyKrdlp15
	 MHnsBvKbCx4fyKJY5TaJ1BjISWvnVYLapmjUPEJbc2YHZ3o905WdjmxxB2jeSbcouEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mvlo8nmp;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9443460A5BC9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9443460A5BC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mvlo8nmp
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4a451915d8aso984557b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296675; x=1794901475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYvGWnQTx9nbWejmcA7tm6oPyaxtb4Fa0G1aGGB1q2Y=;
        b=Mvlo8nmp9I27BoVZ6aA252zbGRgF+UfB4CuLVTC1gNENJOYrgs9y+GWL8wsaNNBc1n
         bGUc1Y9h7XB63Zrc4kKzTIK96PTJ46v6G8Lp8fAyaHrc1qqozGZMh8uGlNoRll0aQPpH
         wzZHVvUv4kp7e+MfsD/tGx8xmvOjcchBKi5tc48SY8HhjOz96J0HZUXSjJ65DZUijDIa
         VV7vhVSHnxGlwUUl9goJfIeghTkXLlytNywupuig0lf0XMvvDJFIIipG+wsQTaMmwwdS
         EmYs97+GnG2t5UaocCIwcqY2bsE3Dw2+pADD2kkeuar46iPH4A68LSu93snBaPKUYlgA
         +qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296675; x=1794901475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYvGWnQTx9nbWejmcA7tm6oPyaxtb4Fa0G1aGGB1q2Y=;
        b=EXl0JTQ25JY0ozwNJtAXkuKQw3tTw4SeaNwwS9+bB9XaZ40ViALbeWw7O74JvXDUbP
         fwPc3opptF8Z/6D29enWcZTyFs+zfQv+nJh8XLiRRVZS2llPPQesHGXIxVkETieYAxGY
         6CdAcwFAu86g/vg0AVe21YF3zJmmmlFJSdtJY3LF2uoXTOM2MxbRskukZ02TKAAwn12s
         2x8/iZFLGy3GFuE6mZdOkczCcb4ApBNvXNN/WYkkvd8SMYFeKEo5nqnOUEUxfkUPjzK/
         +2wJEZTcmyTMeVVvD318rcuF48xq5tBhdQBvwavxvzET9Y0zEk2c4iw2DIV76feUD7m8
         VWlw==
X-Forwarded-Encrypted: i=1; AL+hErG9nfMvh3LS00i/1NEo0IPye70NMMD+zKYpso1qsgPPdue8I2VVQhgJuNhsKywtlIhwTKBnammta0T5+LY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PJVckiI09xjirClwCQN5tCq1dIDEpkW4d39tTlT/8OTnTbf3h
	aacDOjGyFZDklSXESVNjHg0ZAGE86L56VZ+6oXg8FwMAInrCqzBf3Hps
X-Gm-Gg: AYBFou284iyZ1efxMo1NOuhdkrslu9okmunTR4I2ZpO/RvEOBXGy3pHdvchwGWLtjFX
	6N5yuJN8wd8WSci0Z9o5zaLeRLI9g2RB1TwS93Ca29sD2TSMR6V0PeHt/eynNLVcIrmindSBTgE
	i5JcqHpKTZ4pWIRcIpFFJW1mby0YFBQHLSFW2EEDA35NmPzJmu1J9KNJVnA97k8MVEyJYt9K29n
	MuQ38X3sxk6uYnoIrLsRws1Lpk7m2ZOY7meiMrkv7SkSzSUzBvHOJUtklhVSjAutgE0qUtjwG3B
	zkPkO8nydPFbnRg+2k2WELbVevlBZBsaKPoxgXBl+GlVzosekEfO45p7TkOqu8na7b+wcAb3UYy
	wbNfNiYsu8LI8ud2s2rC0XvsVA1WF3q+K1HcvreQq3X6JWVATjlrtbUG6p3QKydjXk2LsA0vkqN
	cUXRJqnAC53YXT4Y1AIz6np143o4l5IUvYo6wxeD61K82RfelNQO5kigCFpAYU/Za8Y71CnV0yO
	C04ZyAUgHtCMuCKQ0/CeUFmCDgpKbvxpdNGP+SI88HRP/geok4i8WK/3Z2WpeV1DhjNlNpGLzSs
	ypiJeEMCbdFLgaVdSGRmv/DeGAcnk3p2weLq6jFXmmjMIZta5N184UDPlWBnvjaGi8o3shIFevT
	t8wYOOAnlJEg7YvStVMvA6aWlgEnO3k5NFJP6h05UzEAhjMjGnNQoocd2LwNaLf/R9lCM1UMRSt
	C9r1YjMTjVSOLl6zCTwz025RwIE/abfCKKkW5p8Q9UWf2gNUt6/syI
X-Received: by 2002:a05:6808:1524:b0:4c3:4e34:c69e with SMTP id 5614622812f47-5683c9eae0bmr1259810b6e.8.1794296675364;
        Mon, 09 Nov 2026 23:44:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:16 -0700
Subject: [PATCH v2 13/58] mtd: rawnand: mxic: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-13-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Mason Yang <masonccyang@mxic.com.tw>
X-Mailer: b4 0.15.2

A retained MTD handle must not access controller storage freed by
unbind. Disconnect NAND operations before disabling clocks and defer
NAND metadata and controller storage cleanup until the final MTD
reference.

Release scanned NAND metadata on registration failure as well, using
retained ownership once publication has been attempted.

Fixes: 738b0ca55f4f ("mtd: rawnand: Add Macronix raw NAND controller driver")
Cc: Mason Yang <masonccyang@mxic.com.tw>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxic_nand.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index 92de26697359..0d20e6ba76a2 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -15,6 +15,7 @@
 #include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "internals.h"
 
@@ -483,6 +484,11 @@ static const struct nand_controller_ops mxic_nand_controller_ops = {
 	.setup_interface = mxic_nfc_setup_interface,
 };
 
+static void mxic_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mxic_nand_ctlr, controller));
+}
+
 static int mxic_nfc_probe(struct platform_device *pdev)
 {
 	struct device_node *nand_np, *np = pdev->dev.of_node;
@@ -492,10 +498,12 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct mxic_nand_ctlr),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->controller, mxic_nfc_release);
+	if (err)
+		return err;
 
 	nfc->ps_clk = devm_clk_get(&pdev->dev, "ps");
 	if (IS_ERR(nfc->ps_clk))
@@ -523,7 +531,6 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	nand_chip->priv = nfc;
 	nfc->dev = &pdev->dev;
 	nfc->controller.ops = &mxic_nand_controller_ops;
-	nand_controller_init(&nfc->controller);
 	nand_chip->controller = &nfc->controller;
 
 	irq = platform_get_irq(pdev, 0);
@@ -541,9 +548,17 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	if (err)
 		goto fail;
 
+	err = nand_set_release(nand_chip, NULL);
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
@@ -561,9 +576,10 @@ static void mxic_nfc_remove(struct platform_device *pdev)
 
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

