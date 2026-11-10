Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296690;
	b=X/jfg8ZPlrboY7BJ3IGn/Vit2vpFidHYoehASWFAwJQHK4sELU93gFbAHccN4DdG+iey
	 6ufT80JorhYpnBM5Dpv65fCKANyl/99TL0KDeB8DIOw6aUfWk/50lLVphW7UDaEPDhwWU
	 UYH9W70s+Q8bW57H1K4XH2FfrEvZxxuW2qoR6FkeS7mx9k7K8ufWd6lp1aooPi0WvapDb
	 QHWr+7q2WPJVvEvflGouxz3ojpCIOPI16NEgylaFuZvXwIn3yh6sPk6iH66G2V2Tb5U7n
	 PNufm3x3T51f6N0L3htScrMQbq6Qtfi2Qtw7zP3qyxGoCpI7KHdXzOtu6okuOAVxPSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iv/6ZsmmLFxc/jyASLD4sobeWNDYEN/sj8IUC+djj6E=;
	b=QDBesZyp2CastAW7XenTog+Wa5wRkyjK2lptsKk0G7IH/5ywzpWCzR/FJK1q48CNNCDw
	 WmwDYns28v3yJ/h2eeH/pnTqeLE1NakmXN/dRycqx9DfGgxca78wsgYEm/af4F3FgeUGU
	 FpAPIYLUjFWeZNBDJryUR20/vfmJh+g+hgjFTmTOXaK5iRBlBmn1zLvmumKcHXMrX7Wdp
	 E0qizw0jhN8IOCSuRzWacRRtXNMffdl/EjWl+rF858K7p8lkn097s6Jc1XTrTyzFGIEeJ
	 t7RGnfCOTEuymVdHBSJ5LItj9V0vlSsxFEMZmL8QL1QK8oYNHU7TJcN4/ad8dvcklgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZHiqE9M;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2414606B519
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2414606B519
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZHiqE9M
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-85a6c747dc9so1108573a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296689; x=1794901489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iv/6ZsmmLFxc/jyASLD4sobeWNDYEN/sj8IUC+djj6E=;
        b=qZHiqE9MvJsKUuvzW4byYDVW0ovKpvOZJbymc6TWXSAEmlH5nOn1QFx9/fajrCq5j5
         6fM/OiB8JllZQHfluLM6DZc8RgtA1uKdFWmIAJZ9o2bCRrdAm7Y61NiPhLyjzPij5z6q
         r108rJopGdebWqGU+0ci51MbulawP/YVumOG9uhbv1+ZaBlHIBhtj92pWppvmAGHzwkK
         8lNvtsCKV431ADZapOH3t8uDgEqA0nUQlAhbMdKVOFtlnUVoi+DrX3c+CroxPK7I0SFk
         dK7QruRtpqdm2L7urvJ1w/MS5mvC7wCShB+RZEY3Po8dZ8UVmp7rky9rgVEbRdNnXZ0A
         FDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296689; x=1794901489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iv/6ZsmmLFxc/jyASLD4sobeWNDYEN/sj8IUC+djj6E=;
        b=pnOkAdVBziJqr0UCdnz6/6a/WWs4EGw1xCVq/XQ+bcRUJMZkMwsAV6VYbepg4opBPM
         wGoOZxIv4xrx1F5+0cEivsHSksaGBuGXpKXyC0jXQGSyVds8acPbCl8BQlQO0s0vVTDp
         /cH1WYUsWjUYq9pltBrCtKANGWK/BCEcIbws3dqck/nOHH/9cdNZdLZ8e60c0Cd6buAh
         R8wCRWVLbKAEdqG+riTfuZ/jDIKnDKTYiZiBJsOMc27wIV7b+b6iPKa8I5L0c+ws3o8r
         Cj5/YKr3TRhvQQAEfxEuvv2boDVZ7eBGe5g04X4GD32DTKIuyhzi9DCYqaWeHd/BqKrW
         cNnQ==
X-Forwarded-Encrypted: i=1; AL+hErHZuCjjwSR5pjcRxWhDWrzfO5L++fmbaFwh5m6Lp+wUYXKvSgFZZ/gmVEmONhngoe5O5JSdL5Q2ckH6L/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z938OuQZgNafPb56kalQvLhrBLHpfsdb8sqYuLVXsy3BjQmtUSg
	ypVLu8RF1waNRm9c6wKb0fuamYueIWzAE93FH+e4HOODxyQK4efToxtr
X-Gm-Gg: AYBFou3tGmuco8HTiq6H9DeJo7Ty4mNEgfs/grr3WwC+B5s9RbQ7jm6mZ02zEqk55xL
	jeFQNwfMM+U/3xhmudmLSaB6YU1EiGM9idXI3gn9NKKd0vVCbDbKnFsqJN7w4w4pHQplRa1QvR2
	0YAT0r7nrSvu6pPbgVxcCi9fDGmtl5D4X9Wy7bxSiAmpX7J/Vf1qekZcUHEm6Tu62FNrVtKtVCk
	Zn3hHyFc5fUotRU9s3T6reP6ADlm53K+U89k6mYXd836OGksMLSRBqS16v8sks6X6YR5z1vFfbT
	xA9bB95S9pehE9PN8A5YTnsoFVXx6JixoWHbGDeUy4S/De+Rpkbuso9CwsxRKGc3zdVx4ml+bK1
	1oj8rJ44gtZrbHZlXMNKyce3xCkrU5C7m5wdB06UIT1I2izSku/9wuNrx4Ias2EIMZ6DaW6GyE8
	A2ptUYwAJU5SYagnXk40ioKbJLp8Kt6KvmiPQRJlAa6cHoP3zs/umsS0RcAaK/M9RFHJyRf3QBF
	ybjW5zyxxiW+cR1jmZ9S4qWEmfNEy/VZpDOObUUFPxQdpTiZtVOTFICqTjEwTMdE1ZEblxEJKBp
	zGJ7/7vyi47u+sNLwJ0IExAk+OAxmaIQmt8eWlOz0Y+mh9diCIxLKyVgITTRGLK82DaqqEU8V/k
	M5siOBU1vUnrEABPey+Iy9q+UF1uN7dCLqLqHDVlnnwYP6zL9Tw2DD9GPmhkwQPFigcys1xDy2/
	M8vh7e5AN/jb4zcH3Mqx2wo/qnLVznAJGCqdx1wuaCclhoJMSKZdw=
X-Received: by 2002:a05:6808:13c4:b0:495:ca1b:7865 with SMTP id 5614622812f47-56881290bb2mr945678b6e.11.1794296688872;
        Mon, 09 Nov 2026 23:44:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:29 -0700
Subject: [PATCH v2 26/58] mtd: rawnand: vf610: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-26-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Stefan Agner <stefan@agner.ch>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep managed register, IRQ and clock teardown after chip disconnection.

Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..903a25c549d8 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -805,6 +805,11 @@ static const struct nand_controller_ops vf610_nfc_controller_ops = {
 
 };
 
+static void vf610_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct vf610_nfc, base));
+}
+
 static int vf610_nfc_probe(struct platform_device *pdev)
 {
 	struct vf610_nfc *nfc;
@@ -813,9 +818,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, vf610_nfc_release);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
@@ -873,7 +881,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +892,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +916,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

