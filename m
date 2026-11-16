Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810606;
	b=N9jhN3m0NAWl4cnA5W0LnJtTupbwujTjXBGRIXwTyokS1Sqx8L8mPtaLckRWvxLUiKwn
	 N7qH3+G8/5g+OSg/vJytRLs4OPIB6tnb7nsLtG7QedPgCfZug0ePEk7BcbqtVmT0xQOWC
	 rkKZ64KuT5Q5mtuPuZYtv0T0UPtNlfq4LIpDf0hGDdfwe7oqc1/AXjIYG7BOshllojY+a
	 OAAwsznzktFcZGU8WtLSM/WeTtR2NZ3KmN7QVPfmy+UKtmmRVDklG45SvUpImEP/syM23
	 w1Ws0Sk4S7j+xlB0HjgZl+xvwMFKWuh4kwLaQD349wqAhhd5AZUs3rhNs0CsL5VJQkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
	b=R9YWV03bxKQMtNZrUrWDoZrQMr8LLgWIRD2n+hKTVir5uqem6EoYVGj3C755o3QRUZ9n
	 XcAMy0HrA3XE3zMej7UokmQWjw57ggATXOM9cQOXLWTSzzAaet0uufHolThWwHoIXxJwe
	 WHZFMo/DlHlPC7MRR6sW14cruxt4/1/b42ZWSSBCEwwVaKYxLQEPEROc/D+tQk8ZXDD+S
	 d1t8DkZDsuDZFFJS8OslC8MHmNzJaH4cF0wbQZvfjqvcHvYJJUFwnGTuFIC4cAFBrlr1+
	 JMgS7H2Dcn0QNedN1x+id72s/tN+7WUMemUdR/XxoabAYCbtAj/iqAbElzj2Ei5CLEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYkFSYPl;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290C160A2607
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 290C160A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYkFSYPl
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-717080a2d50so3388401eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810605; x=1795415405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=lYkFSYPlvYwAybNS9qtBZRHAmC4Fe/vBxXHKBnkx3Oe4q9YcIYjR8MBwela8c0f7Z5
         1YWAGKgMo6+a0dmkMGzp4mmFrtIwo/UBoGOuoltXo0YQdrBp8nUh3JSD52rOzn4Yn7Tj
         ep21/djvyWdtFY35sJYNqkwfN1ZP5SouTRk1oVSG3EFbOFG79M1+sSJZc3rqvGLPJVzo
         0Xp2yEwVmg/rj+d1JNIN5y5nkUq0fCSudIRMyHkqgBxSjNipYV1ZQGUuXQ6aotdH6Vrd
         Gx56I33Q+mONCHClkSDjnV07dYerVFgw7m0d4Hl0iK5n6FFLiwWumvDLlrAyCc+de5XP
         heIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810605; x=1795415405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=tGoHGSyVGd8AXtD6KN0QKB4DOBqn7wmJZc3w6ytowIrJQTkLR+vAqjKcDaxDGSqs4b
         qR9NzpIz/U2vzTT8ounouoF95xQnyTjfvIItkgK8ajlQDDiHFq0Yvqe/nWhdlf/iFily
         wf/JctXN5qy1oAaDuh/7pNiMMjbkzv9CXVbl4St8X2VTyzjSyfhcWJrVdx+SR3cpCjq9
         jM/xsvoUGyhNxoMisiJ6u9IXDVyew6TUndfGl4iYtXzl4owEF3HY1mucAyfmGrEGzRYU
         cNB12mCA3nMp3FyQltZvtMiTK+o6mtSvGIZwAm7KH6uIpUOJWxqWAc1wjPBfNZBmZZrm
         kiZw==
X-Forwarded-Encrypted: i=1; AL+hErGPDwgAzGg7wuPHmx/O7f5yksJgjKGZ+FOsxRymZAPta+ifsGyGo8pIi0lHZc/25mvl9RZpIbk3jU3Fbb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0esz2Ur1ri/Yr38LetDarwiN2Zy4jCu2/GceNV/+8PKbFTjs0
	/LVZENPLIbZodZ5WrnCo+AddLxNhQB3l3en52WNe2iK+DF0fgCaLkZ9X
X-Gm-Gg: AYBFou3gulFEmXNguhhTPGlYUwwug0NUts6M8DRhT7pFagIJ8XcxV++5i2p6IIbb1Cy
	up3BEUo+sVNzw1mqSRAvffThZ7Vd0SJ4l4wNscERUrG8HkHg/0/9YkaMwoiDuJtQ1smgp/8Q6UX
	tUD3/AlnClBp4Pxo+Edw8vMbCiVkMt9ifDHlBasJl3WL05rPTcCXrOAs1tjTB7lVHKExDdLAAZ5
	yGdIphOUgsVagkjdAujCICtx4kG9QJAXO8j2RAiw+bwNr2zFc715IbuZUe6XJnIGoOAjEuOYX2A
	3n3CyObYJk50IiOcxqp3SYoh4a6e0ZhowMEGbrRYLCDD8+W3puinTiPkbia4YMTgfa4bE8YOPCs
	QGV74HjxuEexe86tUriX2Qgz38yVbEXVEY7JaZgyxRRiTY3PkRhD4jjO/d/A6MFqnA4DUxm+qLM
	Ue0P6YzsBba+TMOsz3UpIO1BGOxl49zn9RYnlEaBSRnfqZRBbtvPD9ea/hJsITLYfTde9zopYAs
	htl8pc8bA+KRzLB1dJXHX9a96dGDVs0quzYiSLkRwVaO9rIozkLl5nYMfjsot3eqP7cqpQbxY8J
	kaOV8Y+DEJzHA3Pknh/6NOG/UqnlpeUaOHyARdrbacrpSrJ19IsouBf0WdgT9Vkr2s0YivnxaOJ
	9ETLXNVQ2p9b+LUtwpPiIpGX8IT2g6Lmt/slinav3eaB0obu+jEEAaWcgEWVpQXL/CvENwGrTmU
	qmW3Mr5Eys7kiYqjPEVAt4Kcs9aZwxee2N1yzGQywhJ4XyRyxQez0=
X-Received: by 2002:a05:6820:55d7:20b0:70d:7aa9:8618 with SMTP id 006d021491bc7-71ab5055d01mr4500855eaf.63.1794810605100;
        Sun, 15 Nov 2026 22:30:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:31 -0700
Subject: [PATCH v5 16/58] mtd: rawnand: mtk: retain chips across controller
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-16-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.17-dev

Give scanned chips their own storage lifetime and retain the shared
controller until all chip references have been dropped. Unregister and
disconnect each chip before releasing the ECC provider and clocks.
Unlink chips before the final put and unwind unpublished allocations
directly.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index a36a82d10aa7..010f614a2da3 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1356,8 +1356,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels),
-			    GFP_KERNEL);
+	chip = kzalloc(struct_size(chip, sels, nsels), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -1366,17 +1365,19 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
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
@@ -1406,7 +1407,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 	nand->ecc.read_oob = mtk_nfc_read_oob_std;
 
 	mtd = nand_to_mtd(nand);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 	mtd->name = MTK_NAME;
 	mtd_set_ooblayout(mtd, &mtk_nfc_ooblayout_ops);
@@ -1415,18 +1416,28 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(nand, chip);
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
@@ -1441,8 +1452,9 @@ static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
 		chip = &mtk_chip->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&mtk_chip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1511,11 +1523,13 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	struct mtk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &mtk_nfc_controller_ops;
 

-- 
2.53.0

