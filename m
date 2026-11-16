Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810623;
	b=RzmYqCWukHBwcXSbNYRJKdvlWBT0/2owgLL94yC0YLDzb56Ujyzml50qdOsi5Z9Bnu3Z
	 x0AAZaQSToCevfG7Yqh2SAMLNO1INBZXakl5xN2PCMfC4aADQVjwi4dBDuP8rDEaji2zp
	 vIWPTLPrNpPLwwiah7GBxFdfImMfxWKLYKKY6/IO6O+OzhB3yUQEgBQLut+a9nduB522/
	 JEAiZf7vbTE8w0xKi36IlZ2NEr42vdw7zl9wfnDdp1HeQIk7i6ujoaDC+WgNjgdJe5B5U
	 Kj7hxF1AYKSZupJ5Ha9b5J+hYpO0n51Z6ZYMbzwaLLA6rmJxME9Ilt0Xp/FeVwUgtAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
	b=yYapMjn2V77ijI5LzbQSQCWYysX+huaQPOcxhz7F2LQaJh7DAAHOCud7d9eK9kK2U6U2
	 4fsqa5UOlTAE1tax0cgqlXLFc3BIWxyudZNreUkAxDuvSLjvxKMQlgCec3EdfGVJL43gJ
	 JHegDunsI87SF1Q/aknb1FGJmQ8Aei1JESHucEyg22z5Cvqzpk1x+djRZ66gybiliriwL
	 WU+Z+Um0uKy4KLAp2SojS9lQmQ8BTHJ6ApkEZA9WVvJtmdCXfOJ4/J1iIplSSOnVYc4cd
	 qi+6zmem+lZHC2WAue5C7pzQxUTK4z5JjSXSjAJ25+4NRmPf/kJLtGIMijf/i0nNbOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DEVeYMj4;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF95160A5BDA
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF95160A5BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DEVeYMj4
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-862b3938d98so559110a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810622; x=1795415422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=DEVeYMj4YWpjw7Iv56w+0eTQMvUB+PRxJBpUEoohJ/jx93hcunwCXdmoLlFH09pQBj
         ENwGlsgrikp/5ogxEnkXjS35Q2X3GGow8Bj2nsIZb+nRH368ld0/21IabfkMm8becBis
         aik+QObPtWwpe0Wm2855HfET9Ww04egYK2AcvntfZXy4EoD5fgG0zjti6WqecH0exZj5
         AGkV8IYhcGCm+/6a58W2H9t9cqtbWQ8I1nOKVc4lltOwNfl4W6oM24+Wb+O+P/QAp1Wz
         qAFgXkkRgi1sj/e5JmJsoHA79EecL/s2SIOAgdOscTLUth3KBAt93kAqZareONp9TcYp
         XPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810622; x=1795415422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=ZSzmi3AWoVBO3YiYshE7aHRxlRmVkikTlwEiSN+OJ9vdez98fD+BnsmMaul0NFoWYe
         aLAVGrX8VocND6kXkdsSZhaZXIwMeAtHd8IkG5TpVOjTbTm0RBnyvMvOh0zWjJOI6DJA
         0uet2WHcnjxkSZZmksqokirOTjoxmlOWWUE0cRTjzy6vPT0A7u3nXw0U6x//jJb/+pW5
         bIbGl7gRzs1S/gDzkIbu61ia5Vs+g7U2bSCD93G+q4zo6dGHz60uaVFNm1trX9zMWgEH
         zqV9ZPsQd/0xW/Y52aGwChlU7hIl8Dwh4Yo/2tX2zFy7cEFZ0sclPM6JZQUT8rS4Ge7O
         qCag==
X-Forwarded-Encrypted: i=1; AL+hErEDh7kD0QVAF4UEiZnsdD1TdcXtP/7Ofc2quyuSy6nVq4IAQYk+qOHqCOtV9FHR4ZDsUWNqrPVa37Bb4K0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FpzqE+y8YSQxPN0JtMHbFkIkI/+hUgQLQFFGrjr49N3GORKtf
	B2wJFIwsin/c5LowA5DFN/7nk1U5uzDvCiOxPYRo2d8lkvDpH4NxZiQC
X-Gm-Gg: AYBFou2KSumhSdIrmtm+vQULy4VOXSZDCwWCPAYwubDmeCsL1sP0o4v66OmF0iYwE3c
	0At6tgrF/d1SeRMgt1A4LSg0rD8jrglY2eFlC1Q4z2Orsf3XZdnzsEAHOZq86Ff6VrqHjrazpZ7
	G2V0H/JA5uXrxWfuAuIpnOYNeOh7XB7iMiFnptUJJAzW5u9Q6nzUHFNvybBNjdv99PRDYAmyod2
	poTegOVifSUBJSSDz4Z138rGudjc+M/+YtIHaM7KKQHr1mUoHGfwyLJP3J2SMXEL8+i1hEoMKui
	wERYLD84ca/Vt7ONrlxz/sU6eKQN9C7NTDR2tdnZARWdvpPAEJWU2OW1RDsWFUhyyOs2+v68mtb
	MIBQDtshLXFEgyqyTec91Uh5gxQlQB4UuZxOUs9UYv2SnTAnfFQB2454FWa7MgXZ9pQUvnBK1VY
	7GK5iPmJNll50JBnqwI6/LEbCO6JXol4tsxzgXmYX4JjoE2FkRKo1KZi6pl1Yk7b6dz9P5Kw39s
	yElfDG5pLY+jjAuo7p6GFb7cPEKlVP54/9p7pL9+98Y3vNh1+ggdlg7fG2W5/EsbnA+xjofBLjg
	pkRKcHSrD0txRmNbvPI4DWfSri58oQRqIFUjjyvb2q7F/hrf86tW9JTTDRSUK716D8dBk0XA6re
	g1t5ye9zLqfXgq2BxpE6ALq4z/Sg2IGilzF8ANb/Y3F9SIv5rHmOPUEabe5lEITLcHdkry06W1C
	TKEIsLCh7nJ5KmkzZS8ZVEJh8rOvKEw1zQtCvxsnSNPUVnOVlNUEQFlWF9jQc3TsZt7Hb5yFkq
X-Received: by 2002:a05:6820:1c91:b0:71a:e9eb:6ba8 with SMTP id 006d021491bc7-71ae9eb6f4fmr2091389eaf.45.1794810621709;
        Sun, 15 Nov 2026 22:30:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:44 -0700
Subject: [PATCH v5 29/58] mtd: rawnand: ma35d1: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-29-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Shan-Chun Hung <schung@nuvoton.com>, 
 Jacky Huang <ychuang3@nuvoton.com>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Unlink each chip before dropping its initial lifetime reference.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Shan-Chun Hung <schung@nuvoton.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  | 36 +++++++++++++++-------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index 23db2f4fefbb..9d89263ac09c 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -866,8 +866,7 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		return -EINVAL;
 	}
 
-	nvtnand = devm_kzalloc(dev, struct_size(nvtnand, sels, nsels),
-			       GFP_KERNEL);
+	nvtnand = kzalloc(struct_size(nvtnand, sels, nsels), GFP_KERNEL);
 	if (!nvtnand)
 		return -ENOMEM;
 
@@ -876,17 +875,19 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
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
@@ -899,23 +900,33 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 	nand_set_controller_data(chip, nand);
 
 	mtd = nand_to_mtd(chip);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 
 	mtd_set_ooblayout(mtd, &ma35_ooblayout_ops);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, container_of(chip, struct ma35_nand_chip, chip));
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
@@ -928,8 +939,9 @@ static void ma35_chips_cleanup(struct ma35_nand_info *nand)
 		chip = &nvtnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&nvtnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -953,11 +965,13 @@ static int ma35_nand_probe(struct platform_device *pdev)
 	struct ma35_nand_info *nand;
 	int ret = 0;
 
-	nand = devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
-	nand_controller_init(&nand->controller);
+	ret = devm_nand_controller_init(&pdev->dev, &nand->controller, nand);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nand->chips);
 	nand->controller.ops = &ma35_nfc_ops;
 

-- 
2.53.0

