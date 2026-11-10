Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296701;
	b=zZpaVUJicXtId+4sLgqzMQ6qjPlcMZ7Vj2uH7lZ4FkfZx0xDy89mu1V3F6X8rkLFpw1G
	 xU8nSYJjZd4kfs61CzW8R74Hgzs2PoFd7oHEqShDjiDNxrsKXaT6RgaJuUuymQje3ydEF
	 4aPFbKnKXxcw5IVPVcXyfexQawzE16Qy9j5NPTy3wb+YSHqzVBhWhhZeM26Wfw6NrLote
	 OeuTCs0r/Mmu4K/DFzStYPYZ8y9hQDi8+4Pugq8WahFugGxoXI4+l9fen/uVFpOm/gFfJ
	 D2cS99gFKcOe8H1wKrbAniS3U/igBqR7QqAgaDY+y6TjQLjS/tGYdhnPGIXsayXooDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=G4p84d6kmQsbShYbyTJT0Wg4TRDkWtUX1VnhI2g77QM=;
	b=OElA92G7hZqcXohQq65UkirrZfOei5L/c5lwXHxTTQKp0ld9vVa8f6puauOE8l5aiSUZ
	 oHVwfGtOmxp0pGL5BKVV1pH4LPcDsFl93NNUF3lOlys4fHr4VHN89UauYGqhCumXoWSu6
	 21CVF/UG2p+wB0vl7nHrmhh2eHmPeib2XxtU+v9gu+ptmRxrIMbRhLtwc6RWZL45sup/M
	 vUoVQ80gRI9n2gXRj0Ichaq2mF18pS055C+7OzqxrDCADU7lh1Gvp8G7IdDow6lYAzWn4
	 qNmzY/FxEnMvrGwUxx59Yy5MYjAzcv99O20vuFCf50GJwsHSpua0toneIxr68RK1NcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2CB9Pdi;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11EB60A262E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E11EB60A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2CB9Pdi
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-843ea301d60so970112a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296700; x=1794901500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4p84d6kmQsbShYbyTJT0Wg4TRDkWtUX1VnhI2g77QM=;
        b=b2CB9Pdi2KGdYd3XTwHCIhue90S8Rl0qIGulashxnwX7x5aaHQnN8Fw6Bvv12qDcRW
         1SG2fnaCPUNjywRvlLGyrGqFosCigIia1pymGokvRh/s5pH4aQRgJnZKKQrVWWNB+7Zo
         13t24kDwqT/bq+GbU4/xLDTnJohKcehOelvtJ67Wt0AsaNuK2NbSXGc2oSeDQULndhLA
         s6Kor1OaB6+WIzS4jPykCWjrj6PgW+ILtYw6BkkQUycyQSWB1CliQIzwOsXUr0ECPdn7
         LBDIHYlKyTLwOLeIMqxR2MtFoo3BMZwNvTgyvO+VXRLS95ZVocAIv6mYbZwZyC9PaEu0
         3Jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296700; x=1794901500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4p84d6kmQsbShYbyTJT0Wg4TRDkWtUX1VnhI2g77QM=;
        b=u1ZdK+Tlgy7Esl3Jbwa9MiXHB+fe73htZWyJjlPOSgbme5rR7um1mf6eWrqJ+Kvx2P
         gKj8R5Z0IIliVgFBpqxW7UgzrFkcy472dFVAnQKkLDRZin+j0dQH+o7Wz2JSFoHkQhKq
         G1Tu+WiPGy0xXlKU50hVJ8D9GTiahSKthhrNiodZ6Wg5ESRB5s1Zb4homgOWC9R+wZAw
         BlX267v692uj8/I3mdVC+6NESkaMs84u9Aspgy4EScm4FQ1PJPn9qHMN+EOkTZ9GkWgw
         W5kFE1Qr8TdGvfIV4QjJfCX9/VmsvfyvA9WY6UnsW3u3WiWt/+qVr5Xyd1iGN8E4FUAC
         1oRg==
X-Forwarded-Encrypted: i=1; AL+hErF18yAGagen4B3/1poHodLQwzcKqzlp6ji3M3tbysowCOf37wm+J2rnwW044b4zIlX+fTFH4ND1x79wpPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mqsdVUYxpEy0zVbLBsRSwyBJIpsRFs6KLUeU8ARilDBSJqUaE
	Vaal0L1C7Qrz61VLqpzQr0TrDoITyBtCUlsrNLz/4NzRxFVN+pEMsvXdH1pxKaUu
X-Gm-Gg: AYBFou2h9N0g1B3zB4TQHCbOtKQPqYBzmc8I/+lbK5oHoKmJ7EcPLvDqAWYKtDumw5a
	RhE+kYBknUg3pP7dM7OXKIdX6UnYPg7V76faR5NhwiN4qaoM3DIDy3k9mnzqEQMYNs8MgqvKKAo
	48Egt+qVmrEHBWwpibd6tFlaKNQ++aoMKScorxCatQsG15+TZfSGJfHfJ4hsbSJnXLzwgMb8ghb
	ymbNxGHMSjUx9D3h4v5rFykUeuAvLVOPI8B04DlBF1TgnV3hf1xVrLxywX2XP0cLDr9l/JdkGy6
	V7qzCNREAdnbz3aN9Z5KrjzNFY3k7ZQNeOMwiDtsNCsOwPqzl+LPxfgAt+QvSM9CdWXtDU+z/rL
	QquVvpdHIBaYTf96SmFXA9SOeb2TuEa39KYIyIlVrf4+AbujYRBoEEXZQuxgJYaC+hUuCV7rMNh
	55soImjDjsePl6gI+uEtklFuhiiWSe/MwlVuM04vcfLfZj0v13weVtVJhTXghi9hdv9mSJcIe4x
	Z2JcCaDjH3oZGhWKmU1Ssn4bqU0vBVGceX3IdlLg3ogEswNGs7pO7pHr0oXgaRk9KHrG+r0aDiP
	lLu86nHoj6FNVI6j4wlmCv0APWB+BjtV04n6h8tzbt0Ctg5GrYpwURDjbdf99Y/yvu5lLlOM9PG
	dWhL8nhDuob1ZilHQf5knwkwO0r5R7unqo8D32M1OY1z1+zu14sK5ZRq/coGUuUfdtuDSXon0Qd
	4a/wPSCzFmXYbT27prxAFJmJDIzbYzjs4yUXMDIjDlZRAIt2CK1Ao=
X-Received: by 2002:a05:6808:670b:b0:4d6:9283:1df2 with SMTP id 5614622812f47-5683cdd6dd5mr1430636b6e.61.1794296699815;
        Mon, 09 Nov 2026 23:44:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:39 -0700
Subject: [PATCH v2 36/58] mtd: rawnand: renesas: retain open-handle state
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-36-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect all chips before dropping runtime PM and transfer buffers.

Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 45 +++++++++++++++++++-------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 201dd62b9990..a8d9e701d7d7 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1201,6 +1201,11 @@ static int rnandc_alloc_dma_buf(struct rnandc *rnandc,
 	return 0;
 }
 
+static void rnandc_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct rnand_chip, chip));
+}
+
 static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 {
 	struct rnand_chip *rnand;
@@ -1217,8 +1222,7 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	}
 
 	/* Alloc the driver's NAND chip structure */
-	rnand = devm_kzalloc(rnandc->dev, struct_size(rnand, sels, nsels),
-			     GFP_KERNEL);
+	rnand = kzalloc(struct_size(rnand, sels, nsels), GFP_KERNEL);
 	if (!rnand)
 		return -ENOMEM;
 
@@ -1229,17 +1233,19 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(rnandc->dev, "Incomplete reg property (%d)\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= RNANDC_CS_NUM) {
 			dev_err(rnandc->dev, "Invalid reg property (%d)\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &rnandc->assigned_cs)) {
 			dev_err(rnandc->dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -1257,23 +1263,29 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	mtd->dev.parent = rnandc->dev;
 	if (!mtd->name) {
 		dev_err(rnandc->dev, "Missing MTD label\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, rnand->nsels);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to scan the NAND chip (%d)\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	ret = rnandc_alloc_dma_buf(rnandc, mtd);
 	if (ret)
 		goto cleanup_nand;
 
+	ret = nand_set_release(chip, rnandc_chip_release);
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to register MTD device (%d)\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&rnand->node, &rnandc->chips);
@@ -1282,7 +1294,8 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(rnand);
 	return ret;
 }
 
@@ -1296,8 +1309,9 @@ static void rnandc_chips_cleanup(struct rnandc *rnandc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1316,18 +1330,25 @@ static int rnandc_chips_init(struct rnandc *rnandc)
 	return 0;
 }
 
+static void rnandc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct rnandc, controller));
+}
+
 static int rnandc_probe(struct platform_device *pdev)
 {
 	struct rnandc *rnandc;
 	struct clk *eclk;
 	int irq, ret;
 
-	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
+	rnandc = kzalloc_obj(*rnandc);
 	if (!rnandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &rnandc->controller, rnandc_release);
+	if (ret)
+		return ret;
 
 	rnandc->dev = &pdev->dev;
-	nand_controller_init(&rnandc->controller);
 	rnandc->controller.ops = &rnandc_ops;
 	INIT_LIST_HEAD(&rnandc->chips);
 	init_completion(&rnandc->complete);

-- 
2.53.0

