Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593743;
	b=HwEkr3zAOJrSgrfcrlLKGKfM555m/BzYrjTrH77YdE+7z2os145INoD90NX+hNMO9lI+
	 KUEvIlRf3ZbQ5tUgTF/vsP1WjHjCgemeW5fIuaZneFypQH/lxMh8tSjh8bZw+++GKTjpd
	 jTPO31HEUuCp+WV1xvr4ayb1wnqSrzP01e+jXh5sLotpVtnpZNFyU+F1lFr1aQFa4DDsY
	 iFO3ApHEHMjxAORP+ia0Kk4ipZOyiJBaJ9/ZI0looyS9mqT3y2nhKNosyp2/aVIFsE4ZI
	 pdA8TW8u+wf4lzaXESmWkr3usOmGGLB41T5hfvFRqQ1wZs/5RxqQ2KFE+AJGQIiGPAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=;
	b=KpV+xWcfQp1yfDIEVVHIBaRK6ysWksXcAwKWtTlnJjxjOEr/zoXP65qUfIaPZDh7QPT1
	 IZNOPKXsRXS9bX5hBDOzsxNc1s6NmXVRZTr4BwtY+4a55lj/4h97spG1oxKgvc5TYY+1s
	 hpaCpGcZBHFFEZ91/Flp+kKeCn8o0gWlRgz3UNcPgbvGVWeNqZln94AXkmq+c32xJ7oYC
	 uoVqLv2k9A0ZB4LztFfZ5936T14vnRSkAv+mwX6kWSb4oXOoFuR+CK5phxR9UwPD/lfdj
	 kDqmQSR8kfAiDA8xi/4abY3kPcxeo3WNy4kUGGuc9hEEJpqHzroNqj8Q0LVMxA1bDHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sZWmfB6q;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B16D607E87D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B16D607E87D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sZWmfB6q
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-84e513877a3so1983273a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593742; x=1795198542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=;
        b=sZWmfB6qDWHIcbVn3/69rVMTAdyfrW3ibSBeDkSyQ0Z495L0AduD1MdVJiWkkZlBpc
         uZ1iZcBL7UThzfG12mr78O1vIhEQ1Oakp5XUJEK6BKnTRItu2kxnNbav17FkxV/RmTTD
         hEPTIGWhwN3F/ctqKgIBVnyUjP4wHn502ILjoE6A54+A6mC3VV9juRhbNtZj1xnhIycK
         VDoYaLzYBYnVE/De0U/Q8c04Nl9DYaLk2Cay6zSRlCYZ4w3chsvw8Fu1GNguJfaORAQR
         403ydnKI9QUiO0zCh3r6sclq30wrIc6wsdSI7Ick7y7CgjLlzXmRcjMhc1I7Wanx2n34
         cKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593742; x=1795198542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=;
        b=f2rym8OxQM87KGlMAdgRtr6X8CQpks1lkT/QdSX/vKZme91QjICgqkO3DN3IU7UWy/
         e7tBJzGHYA/SNcLHmBrEjjkCRot5nlpZwkPGsftQUz2cKXkfZBnFrvE5cHXjpuJtE+O4
         QxZvuIQqtXpmB6DfhzZU1Y+0VQfj6fSiS2TP+QB0vL71lXQdXG+I10vefeRI8Oq+VQnl
         RT+IGJ//L3GozpAfnO9N7q8vbpSa8CPug5NaaquGXXtAGUi7keUykyR/MkOU67Ham58J
         dEJWxmPnKHvOjRiDSG1bmtACd4xLiWC3mCYR3I0JUsGlOShHO9zpaRGucKXRO6SP+/Du
         tZwA==
X-Forwarded-Encrypted: i=1; AL+hErFhzihXr3Q+oR/JX010l6nB3QZ4tZgZZDaysqg8qECk7Li6VqUAaIRY/6sG019Ek07S9MBCW6g4ASodELI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tzDpFZsWvDXE9xkGC55iVTMHAlZqDjbUtkrFmL6NXUXu9iE+T
	twlQHboJDnzbt4Seb67bjJ0c+5blqMWvdh2vyIKVrddSZROjoEyJNwjRRkQQrz7J
X-Gm-Gg: AYBFou3zx+dvYDwFMk2avnbkkvcwtUnU54vTuG398VcfAsARLOBcR8K3RRS1ZBRz6v3
	7Ul4GDfr64KurqJm+k0dg+Qxv3138M9ycai9Totb5SVvm6NlbxFLgGEnlYZI5T2QbpNl7LFbVlX
	sXPiZanYyW3iDaq5S7ZZx86OQIEzkO8v7sAQM7DCua3+utDU0/sKh7yR8Gjf7sjhWo51lWHBXbk
	S/g1lJ/ov1qX4IU4ygekIXpkb4vCvEbrn8vsKQ0114+2P2yCRt89kAv5OPPRumgrtvxkEI3WiHy
	YSC8TvYZ2XCfBE1KH2LzH2xSmGVVjJBTmylg+HsajNebcHNEWrJ/lkZZte8dRmMKCK2PSsrkyZ3
	TZ413SZl63npG2jdZuwFrXTtmLQjgwSU8o9ibFawoTHEAAJwMB30ZwxxXhl1iryo3DAnK9e3ttj
	Xvw9Bt48/2Oxb5GbrF+4oTtV8hg5muWGg/l7H1CMZArvpOiIJOXa426MpEtJ9tUbAihpks6zTK8
	06RENipkqTEl9QpGklIMNMRVemG/DJpdJKwTc+2NAUPCJW07cEaSwZm2GoOIoH/l0MQm4tLIe96
	os1SbqybjAl7gkdKSkbb6SujQr0WmsiHab/tFL9D9EVBpY8arvj0RxeSaGcqOjI2LCsjQX9kr1B
	ZKXPJyuAjPk73eSlIvDRuPRnF4d5LPzO0WgUfgI9casQ7jOIwlmUDk2Kko3cQiIJ4FJgSKhuSuu
	a751BQ2HsQd7Qaa6wpNcTP4stmGt+j804wtx9+AeAfpYaRBSEiMhY=
X-Received: by 2002:a05:6830:2695:b0:862:8871:5bd3 with SMTP id 46e09a7af769-862887160cbmr2427683a34.37.1794593742493;
        Fri, 13 Nov 2026 10:15:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:39 -0700
Subject: [PATCH v4 23/58] mtd: rawnand: ams-delta: retain open-handle state
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-23-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Apply write protection after unregister notifiers finish their writes.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 1afeb38145cd..af3641550b2c 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -250,10 +250,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_nand),
-			    GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &priv->base, priv);
+	if (err)
+		return err;
 
 	this = &priv->nand_chip;
 
@@ -355,7 +357,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	/* Initialize the NAND controller object embedded in gpio_nand. */
 	priv->base.ops = &gpio_nand_ops;
-	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
 	/*
@@ -382,9 +383,15 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partitions, num_partitions);
+	err = nand_set_lifetime(this, NULL);
 	if (err)
 		goto err_nand_cleanup;
+	err = mtd_device_register(mtd, partitions, num_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		return err;
+	}
 
 	return 0;
 
@@ -403,13 +410,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 	int ret;
 
-	/* Apply write protection */
-	gpiod_set_value(priv->gpiod_nwp, 1);
-
 	/* Unregister device */
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
+
+	/* Apply write protection after draining outstanding operations. */
+	gpiod_set_value(priv->gpiod_nwp, 1);
+	mtd_put_master(mtd);
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

