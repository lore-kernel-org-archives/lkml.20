Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810648;
	b=T/UjtIQepKebs6scNQFNC33+GbPYrwz5E+Kv9q5cogvmUYeVEhfEifN2RUxnFk/bOvOo
	 80jYt9vHwf8NLNkoBEwjt1Wc8OrKLafmpIHZfpAeZn9M1Cm2S8WcWpn+dYhjxHiJ8z/EK
	 oD3ODp2oXUi+LDXdTQPhlDha+VfGcurFTYAQWIMe7xcBbzZnvJYZVhbOeXovSXXVpUl7P
	 RfB65Co8r4lesV9Chh5KiI6/6ykvfpWu3qUShITqqgOqy/oBbXcXZOqroaHCOMLcxdkG4
	 a5vx0nHNyjDRJ6U+1EkdnvRSMUAOw4hAYrqZ+p6+n8jRAxZ89otkDuBJQdLuHGmTOPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=;
	b=w855aX8Brxfl0UYQgMIRL7qxkXu6PHNLBdWx2D1wblinQbyN4OJhw81y++pFDmtiuU5k
	 7cmdqg4xX8UD/sht11CNEmh8r3a9s/a7MJCRTV68CmYbuUIpBHqRSamm34mjtmLbqv4MB
	 ZXfZXnTrY1wm4uLAOWGsDMqo+hxt8/Wol+J58vZLM2WEAFZvRHuC1pzdZejnPfc72+9jD
	 c9pHvJyzDlBG3GRKgF8GwlNCWfTrdcTTFWCU1615Gj9Lu8Hpj0021Wcl5CS4aZplgvCNx
	 Qq+nAXeKBA3mjlzr9v+/CtNLlLQ4IsGt5c1UAWBF1CZT3XlQM5T2zHfeWC79Sljd4cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xTzaLxYs;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E79606A8BB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67E79606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xTzaLxYs
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71aed54d4c5so464780eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810647; x=1795415447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=;
        b=xTzaLxYsK5z5vzLefni3IsCzw0FqpHt8nkiToUjoWi/Y0yLeLujafwFf1fNGrOlMxL
         bP5RP4JP3WgjzcXuNYfvmRbiqxBGZa+LcSc9A7z/3M9Vl5cmHy8Edg9kZKiWdjOtmJHU
         kQOb9rXEqGfOpHO7EjB4JPmKEJ90fe1JhWKqsEXZt6ELaINydE0jORDJooDeEoj//9cm
         uFWxIuRtfR/C8fWtq0o5/iSLQ7zTQltfqi+Wrvm//JknOucNmABH9xyXQfPJboeHs+4N
         MfvG4chB9BoOetqpBJNVZgA+T0qWuSXhgU+fdgeckSFBpkKsa/ME2DuOG9IXNO1NqD6Q
         nkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810647; x=1795415447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=;
        b=18fO6NSwzht0LDN5Nc8DTwQR0f14PZRwIxOyO0V/ZdVHAFFtFtY2/68T6X4p2zvCm8
         ttM46FzlwkV2X+oGyp34h8dBKCxzVIV7byKY/X5ueKbY98X7lvJmVy4C4XfXZtz5ORD5
         DZPELP+GAwOKZVWeCVSdxck8ab7G0DlrncJ5REt14DDh6uGsAPkOU2063OkWASNmBXKD
         0Yi/viH6/2P0dGjEUKysLUKNO6/4iEzX/pyEg4K3i/yMnp/JA16jR9beFvFbQDnoZiYv
         fKwKqXEe2XQr9tpGYAppTM7xcEGuw4r0XDO1e0h7lwvE/dRinJ5Wc3y5BzDfgnkI2/Pi
         b6vg==
X-Forwarded-Encrypted: i=1; AL+hErGqqjG/8H7cRC0DE7lsq5M959+AGBC1Qb37ioBrr/3ZF64H3K3J22noYFPqYM8RJ6bPQVQEKdx0fSeOfQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G/jMeK5ynol2ah99BIAxq6I4bC/QvRruY1EvdJBq65Jb4NJQP
	Jg9yOTb5ZzCJ5I5X1471q1zxA8jNzOyURuYohtOoQ9nUv/OuwOUOKKI7
X-Gm-Gg: AYBFou1V6aDFpxq3T0uA1uM6ULigRU7W90UovxDlHMQSD9PpWf2M2gfCLX5W+1JFkSs
	+/fjWZYFZ98YNT8MVOUjFqVV/2IaSXSLvN/JiWy0ZOTz2SLpiAmEpF/6Z/c0kvhKbr4gdNEZlcG
	kFHh6xGDbDIkTWxdZX+K+XlWHraGFea+FytSpwQ1LyfX/5LcjGl1a8zYwv5Jdp7jk7dvlsin0Kc
	adTIQnPMwrg/v74OJfbZgD7bQ4pWctFUSfaaNnJgFZTdVdapUsLWoBgI2tiPyMZpJV9YHu66kzS
	VQjM+KiY3dd3+NbvsZF8DgYlVFwZFAW1Hofpcbtt1ve+87LFluLy3ZMwrv7TmFnxPQj5BEDVPBg
	zNKqeCFooqWC+pHzGiki7Zcvwb6u01nuqMXucBj5hlG4TI0eDLGIQgoojnWhRBeCmPBvKJyvVYV
	9OObugpV8xP++07xIZl1pgX9xMbrV3lSWKonD0jxCodbU4C1wgCt1JowBWQP4oD2hOVJ8519J04
	D8WGREqjhetsoXKU1Cy3teRPu8/QpQOzrxX4bDmXVu6jOGIJCOdzyl5hCxoKIPLvM+o9MPO/n5e
	P+nrA8JlD0TW8L6SpRWX7aCo2BOxqlYS7xvTjyIXo9dq5PQK7Qdwi3EiFHf4qWJINmn2fJbni8R
	Gnl/mCLV7/Rm3XvFZ1unsagugfwn2Z4wE2Yk0joUFurXSc/wQEuLTL/AbyyKjZNswm1wJn/OLgD
	l9sa3J3SXyUBWYmCCn3QZA6AaE0Zfn+Q+RsPTuFAJIxsqkTHmOxww1agcLbHdgl1AWNcART5Tp
X-Received: by 2002:a05:6820:1caa:b0:70b:9b1f:e896 with SMTP id 006d021491bc7-71ab518e4a6mr6545615eaf.77.1794810647281;
        Sun, 15 Nov 2026 22:30:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:06 -0700
Subject: [PATCH v5 51/58] mtd: rawnand: mpc5121: retain chip state across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-51-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Drain NAND access before unmapping the external chip-select registers.
Keep the embedded chip and controller alive until the final MTD
reference, and unwind scanned NAND state on unsupported geometry and
publication failure.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: bb315f749f8c ("mtd: nand: Add MPC5121 NAND Flash Controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mpc5121_nfc.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index 0aeeb6327472..42e167e1db7e 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -636,6 +636,13 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return -ENXIO;
 	}
 
+	prv = kzalloc_obj(*prv);
+	if (!prv)
+		return -ENOMEM;
+	retval = devm_nand_controller_init(dev, &prv->controller, prv);
+	if (retval)
+		return retval;
+
 	regs = devm_platform_ioremap_resource(op, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -644,14 +651,9 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	if (irq < 0)
 		return irq;
 
-	prv = devm_kzalloc(dev, sizeof(*prv), GFP_KERNEL);
-	if (!prv)
-		return -ENOMEM;
-
 	chip = &prv->chip;
 	mtd = nand_to_mtd(chip);
 
-	nand_controller_init(&prv->controller);
 	prv->controller.ops = &mpc5121_nfc_ops;
 	chip->controller = &prv->controller;
 
@@ -782,19 +784,26 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	default:
 		dev_err(dev, "Unsupported NAND flash!\n");
 		retval = -ENXIO;
-		goto error;
+		goto cleanup_nand;
 	}
 
 	dev_set_drvdata(dev, mtd);
 
 	/* Register device in MTD */
+	retval = nand_set_lifetime(chip, NULL);
+	if (retval)
+		goto cleanup_nand;
 	retval = mtd_device_register(mtd, NULL, 0);
 	if (retval) {
 		dev_err(dev, "Error adding MTD device!\n");
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		goto error;
 	}
 
 	return 0;
+cleanup_nand:
+	nand_cleanup(chip);
 error:
 	mpc5121_nfc_free(dev, mtd);
 	return retval;
@@ -808,8 +817,9 @@ static void mpc5121_nfc_remove(struct platform_device *op)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
 	mpc5121_nfc_free(dev, mtd);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id mpc5121_nfc_match[] = {

-- 
2.53.0

