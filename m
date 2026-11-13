Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593768;
	b=cbl5DktxhKmQkOZjA0Q+5dvj0iNS4VWIY3UwJFbF5uWqDsd1yPXBBaV6bz8DxzKA+aHe
	 kliIsYJVjKJwySPVAizA3i4n7ED6OYBtpF6fqeGWMxYZ3qeCPuQg/G4Ta7rrLrskNLFyg
	 nlce6ST5RhsDawiHuc9GEBJp1FKvDNU+aMwp7joriIBDvgB+M5s6NQGu8yy/AJYzIlSCX
	 8q0oFPk4oyIbS7Xvc/aKkaPYlk4rAYe5WsSKCnpk3eDP6r7UXBzYfGxJBCMq+yDy2R1Lh
	 yMPqhDjXCLNjnH4PyeFmVPuiCbOGn4V0IoMJURL7QxjEfYMaHJH5vNy4Guql+X1WMiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=;
	b=SVz68OLUlgEvjAgpCwriLN6dJj/dgFceMGAMVqHdHJAD37oHF7RTOSMTvpWkFuWbprpH
	 gJB/mS9NeNwmG3Q9QjJ/+EEeZFuae5ozbSMWWYskctV0IvlYgIDy2dYH/24/1Y6JMzbh3
	 HGuLQaagP2KaLQhGlFSvzhnN1GdhuhWbZdFjabeDWjZwFvCTB6Uhl5v4eOum4iE98zCYy
	 PQRkVtoSNl/2lVpS90j8z1keCj4MiHLT0aEaEd6sqi3uVmgsZSqAUOzVpaEbQPmz63qei
	 W9VH1Z1iPAX57/lhDe4QvdpEHzVnooSLwgT3ceO04snxGW/WqWOMKMllZ689D/ttH+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0awNWC7R;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD6F60A262B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD6F60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0awNWC7R
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-843b6f8e2c7so2090283a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593767; x=1795198567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=;
        b=0awNWC7RVuCpOAgWNgvDVhYZXFwCa7ARosYVsfy8GQ7ufRg5xsNVx3icbKx2YIhHnL
         uPySGhrLeTMW75j1hPkM93O/+zMmhLLR6wav+qHB0C+GYyqJ/Qs2W56u5bD45gQpegEz
         zzr9CelbZ4fZKJQ7owe9zh0+G21l14thS7X2tBCIkeD7VQ/mi+Ki04geb5tALGcSQi7Q
         yD2jjIeDt9leQJoG7M/B044WhTCrdXQOt29OHfZ3W7Sy3/i8HzHdntoAGTKTpEMJZSZ1
         7HVqnvllNAi37tQnL3naGwqc2tOZXh+fGh6P/TK+dJ0gO/QaZOJaHgSU9csoLdRd05y4
         BBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593767; x=1795198567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=;
        b=DpsoJ42hLQfIVfpJZRzO0n2ZjmdKsNGNBvV4XJb8ED+QfX2u1kqhTQShb9N8OX/YB9
         A3eHT2I0gIcFmOiAdALiuGeg7rLCJAh73LiNEC9aI6MsjjzKzlBXlPZ9JiinHabdNToo
         Cg6+GR3Wu1/H4C4OSW8fQfgVQ705mY59qs5JW0JS0D6lqqXldSce8sgzpT7/ozuvhYoW
         sswVWA2cAu8B+jxofjtJ6hSEyTRv+ikqfhbaGxt39xua266UvJbPkl59JzhEcbK+u/1P
         UrP4F/mG7fdgyJZQivbQ4tw/71mmVPQrJDDhwHTMAoFpg/DxVcM65g7q2E3Rh90weep5
         9ZmQ==
X-Forwarded-Encrypted: i=1; AL+hErFuObG85IBx84V3fUis+aCLMW4e+hdDcyJUIYH3rDlZSMUPrnvWz9LhTF5CpfsXfLleszhF9htTct3CD+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sVE7bZVQQaHrBvjZ0jY9wUh9bDV/T784cxF1U/y8l64Ub16pB
	U1qyqIAGfgLKhVy3FPrHjqqZ8sLTW0KaaKC3a5Ve92s3LqJf0xY925Xo3/0jA9vt
X-Gm-Gg: AYBFou1swU4QSCJZ3qN2f1vR9OHelMSXNi0Sl42tc7OqtwuVLJ3lPcJpNsnKU0KFioa
	y5zVO86D+mLqQ1LsT2k7K+4TICroMIH1Nrah4yo8ko3ophb77N7mABNARbHPurO1afh6F/c0o9/
	xjxuIAF91mPCwFXX0ybA0CIidXpkTSuVxFPo1o0O6rQ0WBYpyF+GxU9fO8aFtHqfC7jWGes0ZWp
	FqrA1Lx6IKQL28ZjbQ3C1f7OyxgeFHpQgULn5W/4whZnqiPOOFM2Ac9TQmXMijBsGH/A/cysYCU
	qTz/cW7HpiXtOOMOWU05X0WsfsmEGLu5BdVxeg/NtR1piwOo052VK8TLwvHzyHVeCFFg8S+us1x
	4y6UzZOZJiYHuPvh60sTjHbFPbkQK55K9/+/JJRwHcP6X1zEMJ/HSxEFIIpSYV+MihNKJ4K6uyx
	zhclzosELMEBygR54J1j8InRpxDv0g2VjrmVpXPdp/FlJAX++Z9WJFC7IDFeMXBJ3vCXGCqlYkZ
	yhR/8JYCL2VJjkO1smdt2O02bXyeS2/26F+RVw5pPWrZRtR7SWm4358ODPh2bXJuf7VIifFjLh+
	txtYXRD45Q71jHPr+XeLJdgU7WREd4VZg1NRvzNL+i2lMfNYlPw3tmaInFhfLmvwo50CDYgMqYp
	qHsd4M0fPw2xYtJGdsPQGiAzJmIT8yAwpjeN0JZP6A4Fi/RfMY8VE3vZbgwQ1QAqhNAjbELIvLF
	z00GKwqDuWlfGaHN4Z4nh3gh5FqzQrb+xRJpjAt8/vYp0D0V6bB+k=
X-Received: by 2002:a05:6830:4423:b0:828:f59b:35d with SMTP id 46e09a7af769-862898a4646mr2918798a34.22.1794593767210;
        Fri, 13 Nov 2026 10:16:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:48 -0700
Subject: [PATCH v4 32/58] mtd: rawnand: fsmc: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-32-556b1d7c6221@gmail.com>
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

Disconnect before controller disable and DMA channel release.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 3cd25395d791..264a2570f40c 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1037,9 +1037,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	int i;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &host->base, host);
+	if (ret)
+		return ret;
 
 	nand = &host->nand;
 
@@ -1128,7 +1131,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		nand->options |= NAND_KEEP_TIMINGS;
 	}
 
-	nand_controller_init(&host->base);
 	host->base.ops = &fsmc_nand_controller_ops;
 	nand->controller = &host->base;
 
@@ -1140,9 +1142,15 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		goto release_dma_write_chan;
 
 	mtd->name = "nand";
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto release_dma_write_chan;
+	}
 
 	platform_set_drvdata(pdev, host);
 	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
@@ -1176,13 +1184,14 @@ static void fsmc_nand_remove(struct platform_device *pdev)
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		fsmc_nand_disable(host);
 
 		if (host->mode == USE_DMA_ACCESS) {
 			dma_release_channel(host->write_dma_chan);
 			dma_release_channel(host->read_dma_chan);
 		}
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 

-- 
2.53.0

