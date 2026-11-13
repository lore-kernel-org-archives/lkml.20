Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593724;
	b=eMe4nJr2ubPKT9caEvWsZrKxfXOEBKva6N4CXzX/i09TP3ng9sgbxeJ3wtln/s0CBOj2
	 YiCN0Guh73NwPfrqrwdXM9Xm4AQtDOSXJzdvW98zZqUT5nXs2WWsll66AH3NiEVpSqnJm
	 MFhHpmbFvNYh8z0tO4WVNjdyEWcwtobTTiQjmctJhOoPgnW2aCpRbHsiX2AUM0ki8QvrG
	 3kl1ooYbA+SY2bagxuS8gUw/rhn2Xp2NeOCqazkhXQnVYfG445pyAutxg7IFhr8urq96O
	 SGn2lq2+M6KaMZxpSqg0ZoYBqSxFMTWv/L35uzbdU64mTH6HrhZPYJCzGxvmFf1Mn4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JvDXsJc/tHKQ9x8Zd/OGcZR11iZ+N58MwVpjl8HFytk=;
	b=360ipgXwJCUPeJXgOvvJB2oph95sdxU0Q2fsVzkh3Z/PG2meY5foCNLWUcuQYvL4KDuZ
	 KyqGK+jjLTmKAjAw7PEPJMdUSDQC3bRGiwx/BDvVXBKCQGIVO0UVOi/mYcg+QplCpEhOZ
	 r59woAzfKm8gjWkXANycvtDKQNmNqz6rruQZtPmUYxpbc5CqwizVDUY0wztHl6EVR42fO
	 y6ohlkgjzCtljASPUfO/Ev4Xy48ryhqnrn+0O/gurjg1Kx5iNNVesinxgqZC5tpfqw9XO
	 aFDe3YlxuZ7FDyoyzuPfGG1GgaY6GcLaFEcj2HXH3rdvmW6LhmnKCNIFIuBclH4fi5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNInnYR7;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCC160A2617
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FCC160A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNInnYR7
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-85a5455bd3cso1378778a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593723; x=1795198523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvDXsJc/tHKQ9x8Zd/OGcZR11iZ+N58MwVpjl8HFytk=;
        b=kNInnYR75au0X0zi538RHNFkQEElJy4JflEevSDXgqWtYU5o1UlpgVLSfMRgh25roQ
         zHVK+wigYHWh7aXwHwh/Pl77Ecl1RNX5XqALfJhuZs7uMJkzl2dtyZ0N772Kfp2ZrLBX
         +XQ4Px04K01bm+pjDt/lHYPBoGjcH2qDhGRV2FUWjJkx3GzJovDxREtxvzZfPKrrHdvr
         5PE0aiUh5OdI0KHAMIdpkhv8dBXcmtij2GNYcUmKLpPYUGZkBGo2tczNdW0eNtOVxopo
         aAFS/trnng0WZGK38JVLOaLmRpc+ytLuLAj1pm1GMJpGmqiPlO0ePMbOIiCoMNtkTgpx
         dlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593723; x=1795198523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JvDXsJc/tHKQ9x8Zd/OGcZR11iZ+N58MwVpjl8HFytk=;
        b=q6peNC6UYlqce7OsoVSgi25dsy9srxdFkq65iHfLtWOLbk3KH8IzyssASvM3YNoPfS
         TIn0Qn5syQWXpzYYColzq4osU9CobaWIs+AnclB7ZExVMI1esJGqkCESgDdNfohF9ViV
         f1/V8IKAW/PXnpbdy82xrUWlmX54F/6JGmsU+TEXQnrMolzQjZSIrsVa5T7l8mhwUYTT
         ZKeIIuo6nFmnvV52JWx5bgUqabRyCAupZj4ApFbocrsw20bO8Jx/UNZromZcQmtSyigx
         q7skab4PyI2ZqPqTE0cI1iCj0sueBinpSqDunInXPqWdweKzylNMAW/LSYxR+NoCPHLF
         4kMg==
X-Forwarded-Encrypted: i=1; AL+hErFzG0KEklOrBEYGdFaDMO8nLGwgvz2iR1r5rwI1P09tWBJr2jTCKWmEsT0ooeffIQQs00u7NlYzpPtuuPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+QMGZ8elorweJ7ifmH3hd/C1W1j+QFi74ypIfUeVyTnUPZ7qw
	NaXvx0h+OhcT7hjDLDEidZpdhonfTqAlr2vXX7ot2JOOKm4Kf8T1IJEPQN21lBBp
X-Gm-Gg: AYBFou2XqFj2f6qtjsUOLprVIQDPlZYCNsf7tELLnBXbu8CfuUAwuafMTU/xCl1w0iQ
	Ik59wQT9oOaWW51qtySw+Z17XUlfEqbrKzmoQM4oyZdslpv9ZbN+8nqlI3p/ExaWEG8kh/eFWRP
	9Iax0H6GYuEJTkMRreuYutQAW+bKd5IdIC4cEtPwut84Toe5Tr2I/LtA7wqie3DHreQ9pmsQUZw
	Fl1yo0F69xjKQ+owmXqZVabpPobyHTVVzMeSEFStHBIfXm6MXMx0JiAS1yCx2WjlvRVkZS6HKzk
	ik6Lps9LDae9G7j+iAII+kYH1o+ev2Yni48BemGfgVIty7OXY+7PgP2LAO57C1+DA0OG7gj/Bd6
	qFTtNqmaZH0Bcfi8N9v2h2Bgggi5OUtalCiGIHozcp237DbiCAmsMlVzXVuCqx2E6UmiCWlIGsc
	mAhng0Ke6Wob0fzDiaPl6su/WlFQn3AEQPPI9JxGMGqIS3M53tP9Khw0T/Eo2xaQOS7u/duFkTj
	Mjoo1K6z4Tgpk6TredPB7sHaBz8CvYqN6kbiRG1IdjMtG2pF/e37SEff/JbV6nSz3GFSNWK6sGc
	PKWDPTTcCG2ymuxH8qZUMduLNNXhy3ABwt//Y/S9H6c/ICzMkBcgIWbowONhOyxc0aBMX0mDlZK
	3H1Q8IFbSInvxkds+6wR+EjEbEZ9ypuzFsaRqqx70ZpFg+6Ihu2bA/EN9IzC5C5W/0kdvfNLMv9
	pmnsGIGQvNjPSZ8plJHJedEgR0wVFpE1NT8scl1yFAUMHshtNFz9OZMq7oc6QSf3Jt3CyVwN+z
X-Received: by 2002:a05:6830:449f:b0:862:8897:b604 with SMTP id 46e09a7af769-86289904752mr2835539a34.25.1794593723061;
        Fri, 13 Nov 2026 10:15:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:24 -0700
Subject: [PATCH v4 08/58] mtd: rawnand: plat_nand: retain open-handle state
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-8-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>
X-Mailer: b4 0.15.2

Unregister MTD while notifier clients can finish their I/O, then
disconnect the NAND chip before invoking the platform hardware teardown.
Run NAND cleanup while the platform is bound. Keep the chip, controller
lock and copied layout until the last MTD reference is dropped.

Handle registration failures through the same reference-counted cleanup,
since partitions can have become visible before registration fails.

Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vitaly Wool <vitalywool@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/plat_nand.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index a2775886e7c4..7963ca2d4557 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -65,10 +65,12 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, data);
+	if (err)
+		return err;
 
 	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
 						   GPIOD_IN);
@@ -77,7 +79,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 				     "could not get READY GPIO\n");
 
 	data->controller.ops = &plat_nand_ops;
-	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
 	chip = &data->chip;
 	nand_set_controller_data(chip, data);
@@ -126,6 +127,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 
 	part_types = pdata->chip.part_probe_types;
+	err = nand_set_lifetime(chip, NULL);
+	if (err) {
+		nand_cleanup(chip);
+		goto out;
+	}
 
 	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
@@ -134,7 +140,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!err)
 		return err;
 
-	nand_cleanup(&data->chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -153,9 +160,10 @@ static void plat_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id plat_nand_match[] = {

-- 
2.53.0

