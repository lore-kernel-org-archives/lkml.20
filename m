Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296703;
	b=lECUPbJeTUEEvFfTH3Sd1/f6kZe0n8Pr7jCVDXychtbkCg8xZraFELHpip8Iumu9rvjd
	 JzaqaPO3IiIxClqy6n32U8Fv1l/vKdYkeCB5apR0bcb2aEghamykeztj4A8nLV3aVUM9v
	 4jFzOGltAdmUoJjwkcY2NwfztA+mJNV0dr0gqlLbTU6Kn+dsm20N61M/qdW/MxqeooZpZ
	 wB7zoa8hll4p0s+m68i/14trYqxbFvScr0XA1E0Vrnu6e4azsxLQ/Zrr5rzuXVrItbfcx
	 oaz6g63wDCbxhx8i3zV8VBXOEwKnkn3ZEvt2jWFCAz0ja3+fJxI0NcxCtCd8GU67uMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=P6d55RypgZfTuo6Z+ldZnGqGbPs96Ff+heKOjw0B6/Y=;
	b=w9bXleogvy2qG9acZoOEdE2FeT807Flzc79s+9xmj1wW+8ZbO5aINNW5xKIrMPQw+QhJ
	 NOeUCZPKOuH5F5U6qeOs8jkpR41ZTiBzaZ8RDmW7yfeYpw+/szLjP/+lxxH9JtTJvEu0A
	 +CicI/6dk5pv1NB+YD9lsNeXmh3e2joBY9/ikHDBg186z8llUZ4PC8fUTph/zvKXARfNf
	 kgjbwl/nwKkXs5MmwBOGioxBnwtuSUqBCqvAHTt1bfwrTXNk61TqWYTCa3dnM4WspkP9p
	 Emj7H5rC/vF0tpc39pEBlsr5sL0tAvKmUiWeAc6AFPUmM9y69MQg1tE7FtakpOyEIpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TVt/tiN5";
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5522606F62C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5522606F62C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TVt/tiN5
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8470d7d430fso924943a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296702; x=1794901502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6d55RypgZfTuo6Z+ldZnGqGbPs96Ff+heKOjw0B6/Y=;
        b=TVt/tiN5MAXHNYdfHnDactrWnH/VNHU1UGUotzxeuNXshSUdlfkuFmU52kAF23R57o
         KMPgUAFLGc7ofu+CZ4DlRmXb0Fu91S/1dEuiomZqXkTLPZPWG7EFhbmZCnmW1s5iJKd6
         RQTBn6vBlo9CVLjRuQDQi8x0MR8HYWe7XDPDeGVa9jp4sE2IBtMffHN33ZJohOYyaD9j
         KYt62pzqPjq1KSA2KSMAuTEuzV73RLHFMYWEvTdmRg+hJ1dZXqGiO76eU1NIlc9sNV+v
         3GdMQV+5SkQGB9c8k88uWHOtGQ1n8Ffxzsjt+vGvpPcEoqUIi23YXwPAEzaJimuMW7+q
         CATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296702; x=1794901502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6d55RypgZfTuo6Z+ldZnGqGbPs96Ff+heKOjw0B6/Y=;
        b=n8jldiYDkzyTnD+QgdRmhtXqQec/QgxnHZV13ooa2yMGA2RM4nDHGrlmDb7Ky9vCiV
         /BL8gChAkUnxcMjibtj2mLfNbgWbZPR9iGMAwgUz4PdxxJk0S+6JZ/9w0PsmbbSLE6dC
         0KQbSTd0eAscpjSo4JK8pEgpQKcfvdqjw6lmUpdMCEj5C5sdIzR75ohvWifoaP7jPYYs
         RgLLvArUPRAJu6vNO+hUC0+3U5JnZUUEMkI81JOMLoXV/0Z+7fih6sU+JhWVoWYtFdXw
         N2YFkgw7ivJTOUClfJkvf7XOE2mhC2R/rLZ+NkGCgnxovkS7LOhOd3/Bur8lr4x1lAKM
         UBYQ==
X-Forwarded-Encrypted: i=1; AL+hErGZcAoeS5NvIGRRy/gS2AUQfi+FHfXfpCIy9brLFj3FPI616/cD1aEdPsr4rVgxdiFE5eIF8LQtJ10DDJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cdYxjg3U/1PCFNpkt1uIzjqFyNliArYtbrygudlmLCOBVoBZj
	fMXhVYczzBbTfHc88FdBJPXN/Hgj9X0yQYslOKPyoPExPSfXAmXoTH1+4PGBmaTd
X-Gm-Gg: AYBFou3Mx+xd0Lno06hOXOTy/sYK0H7NCmXGtjTbXC2+r3pFOPbJL5Az4cvEEFFof25
	eL+T8k0D9YshYsHERHH/hYQc3TKdhIoNChJ2CM/4cG1896wNdc+UyXkat1iHEDjkJ4wzCjJeSOC
	Gnmz4KVqS2bBJqsVgKIZN3gv2gUapeqsi5Ui81UNdhSDRbEwAPZp7NXWT0cbWtqSPxm0WbZd/+r
	xAsNknBeDytMSXsKQFYkXiY/+NzAa/9pYRK3kxYcfzykKWxbU/TMYiZDazDrylgYcTxKKVqmVMX
	8mEMuQT45Z3WwMaOefj6ylpCfVixi/s5WD8c++SQvmmAOoSF3g6BRfBgcFYL7hn73cNEfYhc5sN
	S/78RlylQW1KV1p1f6NbKy0gGXRNV4oGrgpsxGDi5vJlgaGDEXTdOEOKCtbwLehFUn9rpwBmetT
	XinQt3Uy4YueE2T5Rtu7RwUlfH5wqsZqRqrBgSlUxKiYJxcT3VmOuvM89+3PUSlpAe5fQWG7kXx
	oVSR3xboCzCtYkseiizhY7UziqvpasfDD8+XfKQ/X2OinX8c8mvnfIm8/WZ4rpK3XYF1TC3nAf4
	OUB6BgaGK2Oc9IE57MzZWDmi5kBdfvd6L1JhzMI8HZ06qfp3P6cjFR2gbNZAp8wKltI5Q9/DgIw
	I04rsLJNW8pawMgtwHfdqLaI06zN51hwGr9tyDLFytb0j2fpUPYKRY/WCaAHx9uNdAWZ6DDJk1X
	dLPsmc7qc6Wom3hqLy83Vsdg9XCEcpFGnnXqhLO2XqlU+tcPvGK8I=
X-Received: by 2002:a05:6808:c232:b0:4e7:c6f2:75a6 with SMTP id 5614622812f47-5683cbbd185mr1424922b6e.68.1794296701713;
        Mon, 09 Nov 2026 23:45:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:40 -0700
Subject: [PATCH v2 37/58] mtd: rawnand: meson: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-37-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Liang Yang <liang.yang@amlogic.com>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

The deferred detach callback only frees heap-allocated transfer buffers.

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Liang Yang <liang.yang@amlogic.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 55 +++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index b8834aa96e81..4f33ea7a1b4d 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1381,6 +1381,11 @@ static const struct nand_controller_ops meson_nand_controller_ops = {
 	.exec_op = meson_nfc_exec_op,
 };
 
+static void meson_nfc_nand_release(struct nand_chip *nand)
+{
+	kfree(to_meson_nand(nand));
+}
+
 static int
 meson_nfc_nand_chip_init(struct device *dev,
 			 struct meson_nfc *nfc, struct device_node *np)
@@ -1398,8 +1403,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		return -EINVAL;
 	}
 
-	meson_chip = devm_kzalloc(dev, struct_size(meson_chip, sels, nsels),
-				  GFP_KERNEL);
+	meson_chip = kzalloc(struct_size(meson_chip, sels, nsels), GFP_KERNEL);
 	if (!meson_chip)
 		return -ENOMEM;
 
@@ -1410,12 +1414,13 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve register property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 	}
 
@@ -1434,14 +1439,16 @@ meson_nfc_nand_chip_init(struct device *dev,
 	if (ret == -EINVAL)
 		nfc->no_rb_pin = true;
 	else if (ret)
-		return ret;
+		goto free_chip;
 
-	if (nand_rb_val)
-		return -EINVAL;
+	if (nand_rb_val) {
+		ret = -EINVAL;
+		goto free_chip;
+	}
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (nand->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "amlogic,boot-pages",
@@ -1449,8 +1456,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-pages' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 
 		ret = of_property_read_u32(np, "amlogic,boot-page-step",
@@ -1458,21 +1464,30 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-page-step' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 	}
 
+	ret = nand_set_release(nand, meson_nfc_nand_release);
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register MTD device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&meson_chip->node, &nfc->chips);
 
 	return 0;
+
+cleanup_nand:
+	nand_cleanup(nand);
+free_chip:
+	kfree(meson_chip);
+	return ret;
 }
 
 static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
@@ -1486,8 +1501,9 @@ static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
 		mtd = nand_to_mtd(&meson_chip->nand);
 		WARN_ON(mtd_device_unregister(mtd));
 
-		nand_cleanup(&meson_chip->nand);
+		nand_disconnect(&meson_chip->nand);
 		list_del(&meson_chip->node);
+		mtd_put_master(mtd);
 	}
 }
 
@@ -1544,21 +1560,28 @@ static const struct of_device_id meson_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, meson_nfc_id_table);
 
+static void meson_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct meson_nfc, controller));
+}
+
 static int meson_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct meson_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, meson_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->data = of_device_get_match_data(&pdev->dev);
 	if (!nfc->data)
 		return -ENODEV;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 	init_completion(&nfc->completion);
 

-- 
2.53.0

