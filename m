Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900EA4582F7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552282; cv=none; b=t9AdtHqEORZX88QMPswdnZJlvkumvfZghuXqnoO6LggCOGNaAEIn6SWftlNrZbnKIJCIqgQkFEXRl0c/1mUQIPQmw2tofRb1DCE9D+qU1BUsTMtOqMs7voE5iMKLokMz4GspBgYyb+XwPaoIiIB6NCVKR86YptnEtokNURwauMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552282; c=relaxed/simple;
	bh=OP0lTXPApvGeiuwxg7E80kgKy/RRWWFcy+KfpyqNzRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQMihAS4PsYhGP0nSV5abgsavw3vd/2TStmDvoIiYR8IDrJ5GTzew+FNCVY4b9LZ0oDKWrqAkykw01hvdK12dq40dRPDwxX1FjfDcbTMe5+fbSB2vnoPy3rngMWzeT32x7pj3ZMW7ZmQ9OQwzJdraEotxyNrd80n9dDPZA4gVZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e5d0ee1951so24479865ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552280; x=1792157080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CXHf/FKh3ncskGhCp75YJz0EIF61+XX7rivRqa49b40=;
        b=G1MgOPCVao7IRRwIVZA42eqc0dGCEqatOL4DkiPCfQIyjaKnFJqsxvb7UgCkIO1e4i
         5tjHbqHV9TCLp9rcFtPlNDrpkDQRfxGTusQnBwowtPdj/gCR3I/KcNYqdXZZBr0S6fJd
         EcSQ1jxAzp+AArxWs7xyQM2ngc2oVs56fnEO+zKyjMtVKZ/SQIp6cyNVeYRezhlqDtzY
         MARNIQtANmMBBnnDQovdHnzU708Mqy/e0PVsa+ciFrfm7OfOgvnX0ZPEXlpVOtfPyjSC
         nAgSvzt6rKaoUNKCif4+K62LXNPenyaRARmVryqC5LK5WNYWi9hEHTaUnRLCMXNDrfQm
         AVbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwESHH/GblzIIJh+3YAC78qNPXwj56Uf1r3hy/vShfbxnlFKBN1HDTVb4dfh6dSs4gRe4IWHG1tmtzCJFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+/Rs0q92CsEALiPGH/g0QpPP/QeyrU+8okD7t1cNbsxFvS+Td
	6qfhYr4PLzri7LKJeocSNGcEHd/CTMifKXOxJw1B7K8V7cfrfYCMf73O
X-Gm-Gg: AYBFou0ObkyKjN43s0EXzDfTOfkGi2Vop+frdWUAQwq1OfX/b8BnqFXZq+UsJKJ93AI
	ikjMuL4SZKGSReUAB3HQ43ugB5C2NaAT1pOWS8yyhY/NaAVayh2um6GTTU+NGEENOo0gMG6wbOR
	SY7pRzUwToiCArsvIbFI+I25nV3LFNipg5YSu8FBOGqWfhqodHoZ83xavy0s1Vm98n0y+Cbod12
	NlMe7Laa3BA/3noGP4V4YZXVJ+j7tXdcWgLzqWKW9HvKOU7giOo+yMDleePA9vAtnoqeLlcBtPA
	KYdvQEQM+jNIWNACg3AlJdCNv+CBSOUvcOFTPAp5shl6jDAJTfYOZNzJv08gULXeguvBrG27766
	SD1RscB/ZoUDOEk1jvLnTe8/WZLbd/4RB9iJWKuGrMgdOJzLUFXinacjUXXbMUuoV2H/HQxuF2P
	h4V5+aUPRgAXhgifRKlFjQ5ggKlARFuzcC21RFXbmTMFgbhNBMHGRbbq+MtTk=
X-Received: by 2002:a17:902:cec2:b0:2e3:1bb4:611d with SMTP id d9443c01a7336-2e842ceddbamr17685635ad.49.1791552279907;
        Fri, 09 Oct 2026 06:24:39 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e2570sm9327705ad.79.2026.10.09.06.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:24:39 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <code@aayushk.dev>
Subject: [PATCH 2/2] spi: jcore: Use devm_platform_ioremap_resource()
Date: Fri,  9 Oct 2026 18:54:21 +0530
Message-ID: <20261009132421.557758-3-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009132421.557758-1-code@aayushk.dev>
References: <20261009132421.557758-1-code@aayushk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the devm_platform_ioremap_resource() helper instead of calling
platform_get_resource(), devm_request_mem_region() and devm_ioremap()
separately.

Signed-off-by: Aayush Kumar <code@aayushk.dev>
---
 drivers/spi/spi-jcore.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-jcore.c b/drivers/spi/spi-jcore.c
index a75cd61ec..df82e8adb 100644
--- a/drivers/spi/spi-jcore.c
+++ b/drivers/spi/spi-jcore.c
@@ -143,7 +143,6 @@ static int jcore_spi_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	struct jcore_spi *hw;
 	struct spi_controller *host;
-	struct resource *res;
 	u32 clock_freq;
 	struct clk *clk;
 
@@ -164,16 +163,9 @@ static int jcore_spi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, hw);
 
 	/* Find and map our resources */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EBUSY;
-	if (!devm_request_mem_region(&pdev->dev, res->start,
-				     resource_size(res), pdev->name))
-		return -EBUSY;
-	hw->base = devm_ioremap(&pdev->dev, res->start,
-					resource_size(res));
-	if (!hw->base)
-		return -EBUSY;
+	hw->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hw->base))
+		return PTR_ERR(hw->base);
 
 	/*
 	 * The SPI clock rate controlled via a configurable clock divider
-- 
2.56.0

