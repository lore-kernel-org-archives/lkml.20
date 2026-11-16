Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810601;
	b=IHvkSY0Pw2zszFD6pBnVLSxkZavejvVAdABIarpKfVuYj2Y9cKDQo2O4BgiUTicNM4Dx
	 e/cQ1mzN1UkD1JfpA796SDEHIdy8yvJYviFF9ceukBZ4uoHMevwz87Xlhx5IfC6dcaEs3
	 J3KfeWD/S4P7KmTcAFa2L08ElaOrblum2fa8Kzjp4o2CEk7EtkTpQplCmJNruDGF8obwd
	 dmVx/oX9OzBPpNM4BTAh3gN0M4dU8HSY0aoSgjTll/X50J/PF/75LR5JaBJnMkhc6+Lfn
	 93nJiQHTDzVFV3iN0qNF/Gd9651XYw3c11SK0tENhKn24ddZtMYsORkz4mZFsEJhTVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GY/HbGTlJH0mFAMxk43t2Nol/0RsWbJ0WzHGNlvzcOU=;
	b=FOxdcQDx7iNXSr96qP9swDFISmbz0Y3U/7sYrJiqUEVHcMF2a3QuC8/zFG0cCLZh5BNV
	 VG7lR0B3gqsENsqquK2qFbeYuxhGIFkytfYnbgqBCHsBC/tTQnSnEaFEFa4970UZiAZlE
	 lw289WiWG9S3aL2ataES7uF5tIvEa7eX+lbM9DbduJtY4op7V0tisDzK7fFbLQOjc+ycu
	 5kcc9WPJhFemG7J383uAWPMo6wfxArHEvPTrFCJ1HHdCwTiwFTlPfxsmVlw0PJ73T0iBu
	 iZHIVguS8sc6rNCqWkIDQeKqdmX7DvvOfZLGnIFhx9eH0p/BT1EIRDAyWnezFIl9tOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yhRQZqCC;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1714660A2627
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1714660A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yhRQZqCC
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b19e291cc6so3902664eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810600; x=1795415400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GY/HbGTlJH0mFAMxk43t2Nol/0RsWbJ0WzHGNlvzcOU=;
        b=yhRQZqCCRnZ/c3O3cuioL9hdyMCprez2q7cxVjhzN9wFH3UkHbjyllrUzDKyDViq7k
         KYGqo0jFmOofDsRsewlbxRtJsk/HisucOLPGgo2FwEZO2LIg8k8J1rTcMS3V2eAyboNC
         oUZG3EbRapcJHgCez1VuREjg49t5xm2PDVn+17ExLJd6kYNWrJsB4LVNWYO0yQDo9h4A
         bZ1do8mkgfQEOwwuJyh+5573TipEbeg+Q0box+OGSi6s1n6sySZFsTT3PyjAKqJXmK9v
         JEDzbBK61DQtukYHAs04k9nAnLXixNuFAS7u/6CUyyHzs+4LrzPtTKJO0EgEP4lFRIs7
         XE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810600; x=1795415400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GY/HbGTlJH0mFAMxk43t2Nol/0RsWbJ0WzHGNlvzcOU=;
        b=shGURbFzqXLR3KNQIV26hSAdQVBJZPZzfWP+vZ3jI093bjOb3iS7+b7wkLxI5ptVoo
         k/36o+zDA3TDyLz1Kf/HNudwic5lsIvyKkz/WdpPT6oxw26Gqm/KcAEbZJdHJ8yu7sfC
         hx5L9Dxbzzq40EFeqpvLYhAjptZokgaKClIqgKReM8hvHqpfD8w350RV43SQejucSYsX
         jB8oBuGs5FuvuCKDgxVORm96LawY2z3otHt7kZ9UgKWsfEmIQB4zNOBhMdvrJ241N7Ye
         6O3rZVyw3F2jnD9Pfjq7ptIURQ8wkNKrMxIIfg5OsfWN8xVqZHv7nwYaMAqwsrdzjJUX
         zYGA==
X-Forwarded-Encrypted: i=1; AL+hErECcyjDpYN8VsN9znHXTgSKfHKBh+4S/AbndHLipNsI4IP+rTue5PtmUTZF2V1/Hhry9xW2GGWla3V/rsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1JYL9CKX2ekrlXOQ/HU9jc0WYO8koHzvr4y+SkuP8ZbcqyNkQ
	suIAxq5nyEQkLmRjB3Pwr6b8AMvmo9wJUPIEy65BR5SiAo11FDhSew42
X-Gm-Gg: AYBFou2OqcnnEve1TcMP2cDjSKkv8gQCdozTRVxb4aqRFx78SJpkRicZfoP3ePkdBXv
	5uM8/e8/RGJwwy1TRwlcVuiv+86Y753hpFOSNWKTt7qX8VkinFRUoL2wDC/1/5Rd2GwfEBec/po
	9kBdxwgeaHHDEGLwzwNVJO0hS8iCrzTZ2ocr8QSjyINPBbeEy3e1CsgSuQweetRCvaA2Ud+jUBy
	KmqDYHXMPg3bDgg7xBB370YvWGNulBXYM+CeJiNvItIkB7K3/10wFJvpDAzEZHBVNhc5N6JrvtR
	jYR9W4X1cYZ80JoBJcvx27L9TyTYdQDGXGQJdl0PmM6a6tDWHVO0EbgKBwIpNWyixHxgNfQr0Zu
	G+uRaXUU/4hLXYFJgxIFazSDGJD6MsUxyY2yJ0i8p5Fwk95fhEAShvLmPG3AYqEaQhqYmLvModx
	rNA66UP99pvF05CrWuux84x3caacEuegk0MtaHVbmo4bb2wT7s6fWYhlznOWalRTnxgvZz7R4lv
	8FBDWxFB4RGsYlzZv/hG+o1meOyyfYk7aVzQ+pPxxx8KM+31LC0Rcw5bdqkTe3okOBaOde8lUrl
	wNxknuLUrFvpvKiJkb+QEUXzev3ipcL1tTTEnuO6CP9zqAnDbQvZkV9DdvzCYdYuKqmT8aOy+yK
	8tqh16ay9CSCNFH/HzHL5wU3BmTsv2KW+nK6Eeucvo/YpibhfRNrg4h+4jpuEuq6q2RrMPkkCyj
	l4aYLHAvA5Bv/3zE97MixB0p3Ll4Z0tNPoZb2rIfn/1BpdUGfT9Pc=
X-Received: by 2002:a05:6820:c2c9:10b0:71a:facc:5a3a with SMTP id 006d021491bc7-71afacc606dmr274481eaf.64.1794810599616;
        Sun, 15 Nov 2026 22:29:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:27 -0700
Subject: [PATCH v5 12/58] mtd: rawnand: arasan: retain chips across
 controller removal
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-12-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage until the last MTD reference
is released. Release BCH state during disconnection. Unregister and
disconnect the chips before releasing chip-select GPIOs, so notifier I/O
and active NAND operations finish while the hardware is usable.

Free unpublished chip allocations directly and use retained cleanup
after MTD registration has been attempted.

Fixes: 197b88fecc50 ("mtd: rawnand: arasan: Add new Arasan NAND controller")
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 47 ++++++++++++++++++---------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 839aef6c460b..a28daae30330 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1276,7 +1276,7 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	struct mtd_info *mtd;
 	int rb, ret, i;
 
-	anand = devm_kzalloc(nfc->dev, sizeof(*anand), GFP_KERNEL);
+	anand = kzalloc_obj(*anand);
 	if (!anand)
 		return -ENOMEM;
 
@@ -1284,31 +1284,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	anand->ncs_idx = of_property_count_elems_of_size(np, "reg", sizeof(u32));
 	if (anand->ncs_idx <= 0 || anand->ncs_idx > nfc->ncs) {
 		dev_err(nfc->dev, "Invalid reg property\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->cs_idx = devm_kcalloc(nfc->dev, anand->ncs_idx,
 				     sizeof(*anand->cs_idx), GFP_KERNEL);
-	if (!anand->cs_idx)
-		return -ENOMEM;
+	if (!anand->cs_idx) {
+		ret = -ENOMEM;
+		goto free_chip;
+	}
 
 	for (i = 0; i < anand->ncs_idx; i++) {
 		ret = of_property_read_u32_index(np, "reg", i,
 						 &anand->cs_idx[i]);
 		if (ret) {
 			dev_err(nfc->dev, "invalid CS property: %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 	}
 
 	/* Ready-busy init */
 	ret = of_property_read_u32(np, "nand-rb", &rb);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (rb >= ANFC_MAX_CS) {
 		dev_err(nfc->dev, "Wrong RB %d\n", rb);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->rb = rb;
@@ -1323,24 +1327,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	nand_set_flash_node(chip, np);
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, anand->ncs_idx);
 	if (ret) {
 		dev_err(nfc->dev, "Scan operation failed\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, to_anand(chip));
 	if (ret) {
 		nand_cleanup(chip);
+		goto free_chip;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&anand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(anand);
+	return ret;
 }
 
 static void anfc_chips_cleanup(struct arasan_nfc *nfc)
@@ -1353,8 +1368,9 @@ static void anfc_chips_cleanup(struct arasan_nfc *nfc)
 		chip = &anand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&anand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1436,12 +1452,14 @@ static int anfc_probe(struct platform_device *pdev)
 	struct arasan_nfc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &anfc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 
@@ -1481,13 +1499,12 @@ static void anfc_remove(struct platform_device *pdev)
 	int i;
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
 
+	anfc_chips_cleanup(nfc);
 	for (i = 0; i < nfc->ncs; i++) {
 		if (nfc->cs_array[i]) {
 			gpiod_put(nfc->cs_array[i]);
 		}
 	}
-
-	anfc_chips_cleanup(nfc);
 }
 
 static const struct of_device_id anfc_ids[] = {

-- 
2.53.0

