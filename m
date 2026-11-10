Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296680;
	b=F+ljnJZezb2lUbSP+qXxbNVhiQkB5WbrGEPeIng8HMONRPTTWBbqJWNgfdTIKriEHdk2
	 wQIJck+yrqtPz4D1LGxLdwqtnHcwoMU4G42JmCY0bOyyRrCHGOtG9HL8f2XyC5UyaM4D5
	 2D3F5CDfJWwecuvvQy/irRFpU8OlUEUUaFl2YgcquANWRUxY1tQDbW7rjgFarRvq1q50v
	 08c83udOfBt0PPjy3OFicCgqocG5RtULR5uajTgoNFhCi2VAu2uu9lv8B9/eKtaZs9TyY
	 I79CTycS/4SXbUjMydxEFCMCgtG1/cMh9iuliNFu+XZbPg59KqB3rzEhZlAJPUSGQww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7EjuFvuceFQZNlD93lvfh5f/bqVD1JwGHOenVl+sfx0=;
	b=q1sSCrDjr7MiBAEMKsJuMD2K2Fv5Mc5aGYxBPoGhIGlFq00lGXvZ3MFypJRJWMfRhgya
	 iup0hpQNb8YUgH8qRl0+NUB7DfXN6hEK+w2MRpo9M0gqw60fjryTFLO4TnuoJyhbwsQR5
	 tYnyTnWYUPyO6y95j0DH8zQim2vOICuP0C+Gts/jiaGJEAT25NsX+QNNyDSPFUunO4MZf
	 bIy0b6z43K9wslLh+eN39oeNb0KAyvYI0VVZzk6HVuELmJ14AbDGpeVbHx7T6p4rJxwOP
	 qDitiK8Xt9oaBScQhLwhMCz1z6JergOmpU/4o0i22hqpAw66CZ74xvRNW+xErDKrp7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DxPytFD+;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E22606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1E22606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DxPytFD+
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-84d5e56f876so1094746a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296679; x=1794901479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EjuFvuceFQZNlD93lvfh5f/bqVD1JwGHOenVl+sfx0=;
        b=DxPytFD+mevNyROwnhg1oz8m3thi+2KwhKDOwtpje0O571Gq0XfX93mDw0NuNCmuHh
         lDkQWrG0JMXS7bow1qtnZZud2gcgP8jORA7qEo7T55iitepAnPce8hZpU0zEzHEMuuq4
         COOJSzs3u1EeLDdPusycTpzQy7sPoR2Xl6FdDpwcIZM+a1K6ykyE0yYBvR11W1G0ejb+
         Bk/+oeayZmZV2960zN/nAWgxyaoIBq4uf3cgGaC6Ad8aZmC0bLnvD6iEnW5w4/r3Pu8m
         QBpMTNxdWSLEMgRGLSntLridq6sYec+NJrE1q5YJC6kcA7FNEb49eo3w9SN2fV02KWB5
         FZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296679; x=1794901479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EjuFvuceFQZNlD93lvfh5f/bqVD1JwGHOenVl+sfx0=;
        b=BIj37mx+rsy3ONLMEViWbHUuzARqsb9yX7IFNzkQwIsqDpyNPEsvJEHB9vh9EREkUT
         skQPuzNcQVByF0kWoxqRlPUGuB4w3Nwy40jUS1w49BnYbDVrIoR9CPW0qCfHvynC1pxW
         tDc4/1w1guXRxtsHu48s8R6MNz5X9b6ZBGThR4rAP41Iy3pkwXj4svrkkXlLlC0VjOT7
         bpzkj1eAEdGdN9c0/WNiiY+Ez8o8FJed8YcSWWjpEIW/xrfWdESjUp5htZUzsTD8jimA
         Gj7IVrxaYtRSDI0EJfSlVcUzk67F7+EQ+2NbtPw3p+Id/tevK0Ruzkpf+SALe+pYD1iv
         Jlaw==
X-Forwarded-Encrypted: i=1; AL+hErH9ORFbmkmzabZjMaVNPUekFEwwO3sSRp3Qk7Juyk5jk4xk/g10ORZT4OF5ItWT34JGjg3wkENRmLCJaEQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KYrOGOtM48dxB8krWGBJrI8Dxhljq6YYkzQ1FGoRRKjmya1dd
	HOQ0scVtc0z3JS7vDBtMrIp8ctpXhIKpcUelG2SamlMz1PWOr9XY9H3nlln9w0mR
X-Gm-Gg: AYBFou0eXJkLkLqTv0xpjsJz3IghmjOoyAHwnKJMrw/rAF0lHGZYCXkxHy0a60UsGL/
	pMLusKsL9uGKCTjBJ67NOT0vgr5eBKyYeZ93SU3SpFaE97b+OX0VG74A/z/8wHsvNbaac0EnVBS
	qpGvtKQ5ZiiV5JgAzRT2mF++TvwNM0gdt/YWFgdy/hSoK637gCSgoFV8tMWzNe6G6/NjJCeu9zy
	HdESgZSU0/Ib9pETkB4u5wNkxdYI/vU6lWKEA9sMGkmtu+J20sHQghwzKJgHcSBBJG13pO4wBVR
	aP78OtaiiE9QNYZPTqGdVK3hpt4LZZOt6FVB8MCWKeBrVu0pBX5d4I9JgNPCctvNsptXuBRNAk7
	zWEHu1VNFp+T0itPPsKPCd1PMvRbLDQM8g/hIvEEYzNTbgGQG6l7fIwnjf5YSiX179lwxE3cmb+
	L7krj6ecQqV4aRUpyWW5xt3FTore9gk2DtmSHtGDwpYm5G1Fw2lssiUCy5f3HSZU98VNb0AL+Qs
	ykSuK8VnkfcVc6WzbpDV9amrMqXcfEH9ytcFTrFFg0wAoIlAbAL5Di9K3I9zUbPPqSPiDGNMbZA
	b1nkUvp6Z8b0ivm1volHx9Coc06Qbq1amfRFzK15jXPYyLvl0ZYX9CNW8L4HmMIicDXSndcNwqs
	56M0BlTo+wmtqy4kvDhWHZRD6PE02Y6J3+2kL5z7UO1zNOtUrd4SJjsAS3ZlhHndJ1eUz7g6VnC
	u5up/El+BPJrl/bAeQbDeddHpXURYEvMq1WOfZsI0bYfBs0AZaaw0zEODWKuwJmLFSzyKPRynA
X-Received: by 2002:a05:6808:c1f4:b0:54e:31cd:dcd2 with SMTP id 5614622812f47-5683cd3d902mr1873142b6e.44.1794296678725;
        Mon, 09 Nov 2026 23:44:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:19 -0700
Subject: [PATCH v2 16/58] mtd: rawnand: mtk: retain chips across controller
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-16-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.15.2

Give scanned chips their own storage lifetime and retain the shared
controller until all chip references have been dropped. Unregister and
disconnect each chip before releasing the ECC provider and clocks.
Unlink chips before the final put and unwind unpublished allocations
directly.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 44 +++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 21c7e1102746..bdc3d1519631 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1336,6 +1336,11 @@ static const struct nand_controller_ops mtk_nfc_controller_ops = {
 	.exec_op = mtk_nfc_exec_op,
 };
 
+static void mtk_nfc_nand_release(struct nand_chip *nand)
+{
+	kfree(container_of(nand, struct mtk_nfc_nand_chip, nand));
+}
+
 static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 				  struct device_node *np)
 {
@@ -1356,8 +1361,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels),
-			    GFP_KERNEL);
+	chip = kzalloc(struct_size(chip, sels, nsels), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -1366,17 +1370,19 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= MTK_NAND_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		chip->sels[i] = tmp;
@@ -1415,18 +1421,28 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(nand, mtk_nfc_nand_release);
+	if (ret) {
+		nand_cleanup(nand);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "mtd parse partition error\n");
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&chip->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(chip);
+	return ret;
 }
 
 static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
@@ -1441,8 +1457,9 @@ static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
 		chip = &mtk_chip->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&mtk_chip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1504,6 +1521,11 @@ static const struct of_device_id mtk_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_nfc_id_table);
 
+static void mtk_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mtk_nfc, controller));
+}
+
 static int mtk_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1511,11 +1533,13 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	struct mtk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, mtk_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &mtk_nfc_controller_ops;
 

-- 
2.53.0

