Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296694;
	b=bQmHdSztPTV4Dcn8fqebmzPY84kqAaLx+sl+sJe1JwTjm34xigmDNJtDlBrekXsnkwh8
	 NNObYPkY284/NKcfZB/VM1B73lDqxHoO1YZLGX1SGpra+R3UzVwEIP08zW7sfa70PWArd
	 5YZkX++CRbYVNUfvg9Xlb0DxIrXbzgD9BSNkRCSZe3pbKKSEHIXtmhiHyZW/emDjT5GOO
	 93nWDFSO3K9h9vQNABUoNERUxZj4Pafg+JYxlC0QAsJuSURZrfJCjET1TKKlIiz3jZQog
	 7dGdVOSwJ4HT0Ln/IR0Os/zoIFSDanO7R6+a9uM2jsZ/TXAficH2nuZObPkK99VdO0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=bnh3TknHRyJjUfEzBIn85QSgOvZKi43Q3OPNIGPlc2g=;
	b=ZgBG4D/YUROa8GE2dEXwVM/qM2he7Nu9FJreYUbNUT0td7tlQ5/tXXxweAN4UktOfwoc
	 lOCY9KB4leqqdanxmkwVqhx2aQcIZIAdUghtg0T+xgzBk9PutzLA6sUSSXHWh9yrc8GPO
	 4ciss2ddH08KUwDc0lxjsX2IkO+nKA/x8LEWpN4g236r6+kdNq9ERO0XWVOwVPHx//QHv
	 732mpq08qdHZE1dXgYqoRptMDqyt0QU19+SM0fBjU/pOruN4G7NjANJDFqH1o+MTU1S5Y
	 WJcQW0WpyXj11mEwglAcQCaq+hoDNnb6DKQwWnaAi0J3NDHgiIaaQrVxE+xJn7qvm6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VLuYuMOZ;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC8D606C637
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EC8D606C637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VLuYuMOZ
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-854e904005cso1127874a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296692; x=1794901492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnh3TknHRyJjUfEzBIn85QSgOvZKi43Q3OPNIGPlc2g=;
        b=VLuYuMOZxICyd6aPTjMu9JTtWJCljlVdQxkuOK1e/bLxHD+JQtyyrI9fS1YzvW7IIH
         Lno6T2yJg+PTW0Y2th/w2jqM8FNlgaZ7MPaIycBEEUZQMxBU9b9iNz75n+DB36oJBt5S
         VJ+kQVjjopz2OckRg/pGsHB5MmBVeWBJDHAxeNo22dBBKZyufFUQQDNmp2wzZcUDPJCK
         e5y75nsZG+0S2Qd+51+VQcAtejXeajt4bzc2C7HIO/iXyGgCjSVR1fbliI8h2Mx8IaAS
         YCheh2q1aCw9thE6GvHgoE+o9JZFBzL7zgljdBgEH/Jn8jH6o14vqhuzpafhGE9N23St
         gKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296692; x=1794901492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bnh3TknHRyJjUfEzBIn85QSgOvZKi43Q3OPNIGPlc2g=;
        b=yvqP4KHe5zj/ps3EeZ4NW5bUVy84prAFuhGWlBgDiX3u50VSsDEY3KbLAV8dutvynS
         WHvWSWnjoyQmHEfqO4wRJfkwqAR3duPWqzJRPBcaWM3FearkV+R4ca1ffWCzFXUanOe8
         hfsnxLIBrNtjG1cJSFYDgjA5n/Byqzp5NVEcvAa9FKsDAH5k5LT4qc4kIx33NqrDUhwD
         OpuhhNtU2DmhtB0roOXSgNXltqRBDNUTryte/AXJ88EsiqwxS1FAasqNgCZZvNtx0PUm
         A+bA2PfXdWZ+TpS2igLwymYf8hk+hf6rv+AArFqcNlG+n0L0JQbjWNBSHRO+OnUDKTS4
         GWcA==
X-Forwarded-Encrypted: i=1; AL+hErGhPyHvSXql/1SdFCqVZ/mE2lKkMdGCSTNlf/S4kRRUk7KoKHM99az19+4DtNbiIaOOjE37Uh3S2oZtxPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JHnok0XADmcY6feiPQZ/E6ilCs15ofYGhhO+Angv4hdJvRrVS
	Z9n4Y41ZaeqkCKRjPEsP34exoELrgfIkSSkhiZDHElLakuWLwA8gkwJsSaBVBrFW
X-Gm-Gg: AYBFou0cPSW629dMOKeoZSUe5Ffgd/Xat7X50YN3FkXAApyXHKhf0UCtE/C4dqBqhbb
	sO9iZoVkfv6+8q5m1QEBtoLWM3R3ESbnIcwssXAs0/rINm4g9QSj4HQLTUvu3+mEk99t6MKlu0Y
	RBV+/UD3nHRtCYKOgwtPSIDrYtWcTnEJT8LiDWbgdLbBG9ZjBINJuPL0jZ+QGeZh/oyqZm/jVTo
	85S3Jc8TJQgJ09VOlKPU9svH7ZdEuIXxfuecIBL7NqIXly8wttOeiOot9BNRI1naayCRV5Wx/M7
	Z0RrFH67M1QoCroLsRvUfvqmJBn0QkkSHXO9fkjsNeH5E56VIJ6J9Cws5rLkcbzQ0KtBQaIcgZK
	lU1L5KPow5yPwUHPudtRjAdq2q09eaCwKbFrxCnxdVSA1ztNk9MI3yZKVKMYI9YL6sMJglFNiX0
	fgx1wVruU2/XlqpHBzg26SI4IsP95yKZGNTm+fUzANscCCYCDgJcEMP47OscQIOu6mL5smLqVl4
	cziLpRRHHPToM1E4M5YcOFe9iilahekbq4X3/Jsf5+to3ZdBsbGKB7yQgI7iKU8uP1UIIt51iPs
	iLUml1FBA/udTO3a0SiyTgRGzvnLP6Rkml2znTNu8j+Ul6vjQ8dzMZDbYP9/jJPkbiNifiAzJWo
	ZYaCsrugh8FipEFJxW5ZNfsmgTJj+Lua5jcmHvIpBMpZL6l3z+4K30/Bcvig4kozc2x5VMI5Vrb
	fC2BhB9ikdX5drP9OQ+fVWRLH9gEEguvfjDyys633Z6UuMaYPlmtQ=
X-Received: by 2002:a05:6808:148e:b0:4e7:f052:460c with SMTP id 5614622812f47-5687294b517mr772256b6e.23.1794296692485;
        Mon, 09 Nov 2026 23:44:52 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:32 -0700
Subject: [PATCH v2 29/58] mtd: rawnand: ma35d1: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-29-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Shan-Chun Hung <schung@nuvoton.com>, 
 Jacky Huang <ychuang3@nuvoton.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Unlink each chip before dropping its initial lifetime reference.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Shan-Chun Hung <schung@nuvoton.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  | 44 +++++++++++++++++-----
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index f659d3a6b9ef..90bdf2635a44 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -849,6 +849,11 @@ static const struct nand_controller_ops ma35_nfc_ops = {
 	.exec_op = ma35_nfc_exec_op,
 };
 
+static void ma35_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct ma35_nand_chip, chip));
+}
+
 static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 			       struct device_node *np)
 {
@@ -866,8 +871,7 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		return -EINVAL;
 	}
 
-	nvtnand = devm_kzalloc(dev, struct_size(nvtnand, sels, nsels),
-			       GFP_KERNEL);
+	nvtnand = kzalloc(struct_size(nvtnand, sels, nsels), GFP_KERNEL);
 	if (!nvtnand)
 		return -ENOMEM;
 
@@ -876,17 +880,19 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= MA35_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &nand->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		nvtnand->sels[i] = cs;
@@ -905,17 +911,27 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 	mtd_set_ooblayout(mtd, &ma35_ooblayout_ops);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, ma35_nand_chip_release);
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
 
 	list_add_tail(&nvtnand->node, &nand->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nvtnand);
+	return ret;
 }
 
 static void ma35_chips_cleanup(struct ma35_nand_info *nand)
@@ -928,8 +944,9 @@ static void ma35_chips_cleanup(struct ma35_nand_info *nand)
 		chip = &nvtnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&nvtnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -948,16 +965,23 @@ static int ma35_nand_chips_init(struct device *dev, struct ma35_nand_info *nand)
 	return 0;
 }
 
+static void ma35_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ma35_nand_info, controller));
+}
+
 static int ma35_nand_probe(struct platform_device *pdev)
 {
 	struct ma35_nand_info *nand;
 	int ret = 0;
 
-	nand = devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
-	nand_controller_init(&nand->controller);
+	ret = devm_nand_controller_init(&pdev->dev, &nand->controller, ma35_nand_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nand->chips);
 	nand->controller.ops = &ma35_nfc_ops;
 

-- 
2.53.0

