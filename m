Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A5A44E66D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249042; cv=none; b=AVWLtp1zvziCCxynweYyGyLwrvH3JD1645aS/PDcyF4EfAyZ8RdqW83RUYFplnHCei9q8VjgQD14bq8AK5uZwvSVWaWsKNL1uZXulfEp1PQOc+JwEA161qaMC506sEynxFz2OmnHy7w3+njuFqJu9EpwRC1VRZ3/ouDDJHoALN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249042; c=relaxed/simple;
	bh=2QTwZeicuBqIZnQxI5R11SHQxg2Y25iPU5VryuEgcEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iWFOHIZK2rBHZk+K38MI4CPcdzUOK8OZMBdyyMra8CVSCpCd6DMmGP+MNOu3IRT08kH8Tf5dbiQ/GZishiSRvN+tjnlbeRFQkyK6L0x8MjLjayWO2I+Yutcj2SZApuuefM9OxcLw2p8qvzIb7YaF1YTtABNtCm/1lBYl+oE4cEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBhtm8oH; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBhtm8oH"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so778232a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790249040; x=1790853840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVZyQuOx10W8AoQP9MzIvUBAsru1Ry+CJZYSEvVQ+/k=;
        b=BBhtm8oHUEwbb8X4Qush/tl9/2i2bKnu47OvMcajlnDm2e7Ue9umezuTT5eWtN7I5h
         Ow91BDBiiJMszyBhNYR2DwRxWNhz0Qasyn2yr6n5201X9Ugwm5YsOTNgBBS0R1KdD/QI
         ick8a25iVhstb2W9V/2fPQkWdVlWHPiIbde7livSwk7E57jF2xEdOrkmsBoCGv7Au7fP
         tvKMBYBxcMtDZiLZN6SNfKFSPHten0kvU34inX+rW39mcizCKd89HCTwfcEnc9NaHLlT
         BpHpp5jMz1Px8R5aGGj8TQsIjUE4Gq9wqI7f6fQS5cWoEeBXmztLbsi1UrzslBtGhyab
         xYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249040; x=1790853840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVZyQuOx10W8AoQP9MzIvUBAsru1Ry+CJZYSEvVQ+/k=;
        b=JU0u8alomh/D4xT1BPVhGBlxaThp6Q5Hb8x8hOdcbjJ3pjceoiqxbUstVnzLMMUsfJ
         OH9BUj20XklFThIxKyznFSHy6FQ/t35SEn+1uZx83rUmncECU40XgW3dWACnSwQWdAC9
         DIP2tJl5WKq4Jslx1ng2kALkKs/e5QhfNT8hKPYscGp79eX3kF3JUBEB4IvoB5SqhE83
         ukgXS7C3cPSsVCqJPo9LqbiWJ79QslpFwB/beiw25+Zxz9GEl/004Z0X2/uFNQRxVhxD
         fqElK9HcdCPK/hz0MzUaQ8nwDI00Sb1kSFu+Dr1GfM9RqQke687DiCw8sQnmROaNS5kz
         Iarg==
X-Forwarded-Encrypted: i=1; AKwUvBy51H/bPFluTUJkaJTO3F8bpO6CiG1llazHUv+nZ+p9DtGzbMI40FklDA/J14pbOSKy4o6R5XAGU52b/nQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lO/xCyxdUYgXGVnMgtfq4S6eMu5t3MwScFGuEkwkzan+idbpZf
	Zh5++Uyv4Ue5qPuX+exOEeTYBCYUqjBbK8/MRPOvFAyE7t0AqiBSObXv
X-Gm-Gg: AYBFou0oyIxdifjW1mxia0whSuG6aJ7EjpsixJLC6vWs0kFBQtGOnPbHr+JCF8S7gWf
	c59bpxZO1aSEsGEfshFfV4kihVmRhlBogaS3U61RZpdZKlw1EFhtfciRRKJN+CYBhF7aPwuTo3g
	yzWqWWugdSqbmz7t294G8MJyjFAZFggl3XJGr4UOoSn10RWpGNp1fa36COWPs+RJpo4RwLXZqJ0
	SW76VHrILyp1Og1li0NlLrBtCa/KeBDoXQ53zL3MH0/NF4YaJyMtXrBaU/oZqIbMYyJX+CJ8IUo
	BdnppqlEgqVytx2tH8mUL2FiS8jjyX6AjlNuDSOGXPNOQ2VMOsW14zN66l4LY7cu+4IOxLPIu2G
	5M4KMr5kFPxwDQ/ENQ/81h9desHopyJGsEFj9n+Sa7kZdRXsXi7y4A4/5eTI6czQIYc9YOwHMtE
	mQZ4CjOn9BvJ3YgiVlXmeztjQa/qJWFOC8iF2n/djf53mFiHke/9GV5Q==
X-Received: by 2002:a17:90b:1a82:b0:3a0:8050:2ecf with SMTP id 98e67ed59e1d1-3a098ac556cmr1232198a91.25.1790249035317;
        Thu, 24 Sep 2026 04:23:55 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0813318c1sm3586800a91.4.2026.09.24.04.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:23:54 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	william.zhang@broadcom.com,
	kursad.oney@broadcom.com,
	jonas.gorski@gmail.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	jon.lin@rock-chips.com,
	bcm-kernel-feedback-list@broadcom.com,
	noltari@gmail.com,
	lgs201920130244@gmail.com
Subject: [PATCH 3/3] spi: bcm63xx-hsspi: Disable runtime PM on remove
Date: Thu, 24 Sep 2026 19:23:29 +0800
Message-ID: <20260924112329.1566051-4-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924112329.1566051-1-lgs201920130244@gmail.com>
References: <20260924112329.1566051-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcm63xx_hsspi_probe() enables runtime PM before creating the sysfs
 group, but bcm63xx_hsspi_remove() does not perform the matching
pm_runtime_disable() after a successful probe.

The probe error paths already disable runtime PM when sysfs group
creation or controller registration fails.

Add pm_runtime_disable() to the remove path after removing the sysfs
group to balance pm_runtime_enable() from bcm63xx_hsspi_probe().

Fixes: fb8695e3749e ("spi: bcm63xx-hsspi: fix pm_runtime")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/spi/spi-bcm63xx-hsspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-bcm63xx-hsspi.c b/drivers/spi/spi-bcm63xx-hsspi.c
index 25f169a2a81d..80bf02bc324a 100644
--- a/drivers/spi/spi-bcm63xx-hsspi.c
+++ b/drivers/spi/spi-bcm63xx-hsspi.c
@@ -882,6 +882,7 @@ static void bcm63xx_hsspi_remove(struct platform_device *pdev)
 	/* reset the hardware and block queue progress */
 	__raw_writel(0, bs->regs + HSSPI_INT_MASK_REG);
 	sysfs_remove_group(&pdev->dev.kobj, &bcm63xx_hsspi_group);
+	pm_runtime_disable(&pdev->dev);
 }
 
 static int bcm63xx_hsspi_suspend(struct device *dev)
-- 
2.43.0

