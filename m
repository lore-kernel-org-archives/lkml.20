Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296694;
	b=lxhA/ryR4teSFqRc2USPYLUdgrUd3Fx1kyyvYnqEA5PST5H4VppgXH8U3lS2oUwW0ecC
	 LnQdL6IFh7NS3b9qDgKpxoKkv0BgPF3MCHoIeK8rJVyk1Pb99XaYEUdJr7NH7d1rYL+Fw
	 KAckml0PNbY7Mrk/Fo39ntY6gHh9muCggqiWohETocgmHYDRZYg2qCocRVAQHQ6xucRDa
	 rsXdKv9YRefU1EDHVNoOt8RRel7uTcPdv9e/qldAZ0PQApuJX8vEhClBufW4vV1uB3GPn
	 S0VCmC57EDJabNK3FIpm2F3R/wOh422Ba6wGO3j04006XJCvFqILk2ck7VUk0pAJl/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nMm4jGEIZaA4cihNMjFshhJxfpyyNdRfUomgpOxFZno=;
	b=Y+A8NvKCE5Zl6a/MEnKF7aV0aSuI+dD7lbreGR6wO+ANVrtmngw0HIE5QNZbvPwgFAqu
	 iwfa2lyhwrNzdaXJRb8aQpMGT7RffLB4AA6MkIN2Vl8dym5HQzLE0FHInx5eDjZCYm0A6
	 QnsEuSgSNs7gl1OO5DHYHG+1Aa/MvAjy6jpIqCvoe4RRc1xerpIaiix5fb+Sz9WB36rkg
	 h9GACkhMcsNa1VyjxiRcgjPn9dVQr/18Z83AUZwmg8jYj03CwROddI+IZ95lNFMkqwKNg
	 DYsKuB3KuFxMs4qv9yiASjU28Z9R/4iBXYSh4cwr1d49Ttc0amQ6wT+Oc2ydVJwfs4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="04Uqft/J";
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C22C606D281
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C22C606D281
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=04Uqft/J
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-55650fe1f0dso890946b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296693; x=1794901493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMm4jGEIZaA4cihNMjFshhJxfpyyNdRfUomgpOxFZno=;
        b=04Uqft/Jh94xFzmh00vlwqUrojBLuI/Igca4shtRDyjlb2sqedRaHeVbCkngoBZ2s7
         LSiOzrLyO/ekLFRdVe+RMRdc2LJ3H8P0DVBHpV5Y1dudd3Y+15NXHmMy5ZOdXk7VN+f2
         SK38/FODitXP2iA44IMldnBRg6NQSyuMlfklz8bGTzL6rbngGkS7I8ZT92whXAKSdkSR
         tV3iEoVLqEwOP6c2TUuCIhQKIhAiea4xvg1A0yWecYVJtqGbmxxETDgMMg0yuQsyWLD+
         qfUnzFWwpbyMow/0pbB9aJhEW+nWoblNpZMhdKPt6jztNUwM5gOAIKPQQOBEHlW4Nwrl
         q0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296693; x=1794901493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMm4jGEIZaA4cihNMjFshhJxfpyyNdRfUomgpOxFZno=;
        b=MJ1/zOc02U5M54ANQ4LfG1BPCxW4R/YqXi+ViajdZ8ld9jj61Pt9KI1F16R/WfxqXu
         9i/o0s4UOVr1tI/liiBg7KHEIgFGCu8DnaSXLHPnhvMJ8y4G1wIjB6kuzVyMyFbjHYZX
         4IcO2TGv0W+87z0n6lJyUqlw5w0cA8h0Kbz71t1tBqXZpZhFYONDOaN3s3SCWhushbMu
         HJE6kHqFUnY5RpW+W+cJTCRXvSIW433yvVnlOlZ/P6Nj06/iSQxjWk0pltzpWVE/tsBz
         BLpIfQ/wD1O67hUurOvzlEJOw+r1wWkE/AzLDkfN88sjlTAC8Yp6AN5eKo/7ixVEc/jk
         hrow==
X-Forwarded-Encrypted: i=1; AL+hErHJNawhZZA1SlVwLHTamwHkOiM2WY8aWbqtZjHsp2yx2ibLDY0AuQiPG2XvchB7g6CnAqJmiMraQbWgZr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BRsWEn6eaEgKyO9ZkfBDG0a0TmmuvZC6craJKdyQvhUVvMwNs
	DJVATuVVgfwhXYJbQCgMwsoNIAS+aGqCvMRCAv2tK0jSNT3Md2xJIH0POdYi0Xpy
X-Gm-Gg: AYBFou2k8BQUott9pDzIVkFNvr4O5rxRNSpunup9VI0IRDioD3Zh/2l28uwsix27U0m
	73MsMGFF9XSIC3F+L4M9PObpXaP3MU/NOwyH8lux+p0QLVRMX8KVsh8wHyDrTZVw4kmS3Vj0XW8
	kdH/a5GAr24XfllS28XPMBjisWC7RGN/10IWQMXBpLObkEdzbaEepbcXyAUjpz/NajkyMGdKVj1
	0c79hviYBlpYmeW1Li0m4K2g0ht5Ck6z+Jjx9nwrcgDxZ5/qTNrgI14fhcslI3xes78cSo0mrvt
	01ukhU1YWucT4qDLuS0hril6Ia7H8Y/BzasNNohi0IL/LYx5nt75nn44+8zocK1iD3paWLfgxy9
	oklnthRpZtsstOeo9HynHz62/ElGy3aEejj+2p5tuLvfHfgDsaXxnznj0HwY2DZ8ej5AP0l6dSv
	iRjQqVQc+NJHSxh7ymDNK3GGde99XiUdNDxXw95PSaZu7kwpWe2HGrcV/muhf7E8PeDzm2ptJJF
	n3jiUNhIfK9NQLhGutKkKG7KT4LhngEY17DkA3kket2OfTOllX/GrUuOPPUWfrtUx4f+6CiZ9MT
	UFXEUKZVl9gYIiv8hj1A1CHWfq98CeDfLkRa6PtyHDsXCFwNUITNHuufc0ZBo56YhVVPoCzL8+V
	yAUMQ29pU9lJw+gKAl2rmyZ8mZz9Ram2fS1KwD1sorCbhYb9lKipgzQhW4WchOUq6iwfAeL8VpP
	irsE9YrvbKt4mgRH/az4MFDvNDfllH6XgMDsPC9asqKBrOOT/ZWRk=
X-Received: by 2002:a05:6809:1d7:10b0:56a:608:c445 with SMTP id 5614622812f47-56a0608ce7fmr477636b6e.51.1794296693511;
        Mon, 09 Nov 2026 23:44:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:33 -0700
Subject: [PATCH v2 30/58] mtd: rawnand: pl35x: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-30-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Unwind chip ownership on registration failures as well as removal.

Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 46 ++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 26b61d856143..952fe5dcc84d 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1049,6 +1049,11 @@ static int pl35x_nand_reset_state(struct pl35x_nandc *nfc)
 	return 0;
 }
 
+static void pl35x_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct pl35x_nand, chip));
+}
+
 static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 				struct device_node *np)
 {
@@ -1057,22 +1062,24 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 	struct mtd_info *mtd;
 	int cs, ret;
 
-	plnand = devm_kzalloc(nfc->dev, sizeof(*plnand), GFP_KERNEL);
+	plnand = kzalloc_obj(*plnand);
 	if (!plnand)
 		return -ENOMEM;
 
 	ret = of_property_read_u32(np, "reg", &cs);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (cs >= PL35X_NAND_MAX_CS) {
 		dev_err(nfc->dev, "Wrong CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 		dev_err(nfc->dev, "Already assigned CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	plnand->cs = cs;
@@ -1089,23 +1096,34 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 					   "%s", PL35X_NANDC_DRIVER_NAME);
 		if (!mtd->name) {
 			dev_err(nfc->dev, "Failed to allocate mtd->name\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto free_chip;
 		}
 	}
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, pl35x_nand_chip_release);
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
 
 	list_add_tail(&plnand->node, &nfc->chips);
 
 	return ret;
+
+free_chip:
+	kfree(plnand);
+	return ret;
 }
 
 static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
@@ -1118,8 +1136,9 @@ static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
 		chip = &plnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&plnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1146,6 +1165,11 @@ static int pl35x_nand_chips_init(struct pl35x_nandc *nfc)
 	return ret;
 }
 
+static void pl35x_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct pl35x_nandc, controller));
+}
+
 static int pl35x_nand_probe(struct platform_device *pdev)
 {
 	struct device *smc_dev = pdev->dev.parent;
@@ -1153,12 +1177,14 @@ static int pl35x_nand_probe(struct platform_device *pdev)
 	struct pl35x_nandc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, pl35x_nand_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &pl35x_nandc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0

