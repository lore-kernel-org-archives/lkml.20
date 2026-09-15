Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A733921DB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490751; cv=none; b=OTrS2Bd2SdiuanXl7dPfP8CSNiV8q7sgnSKf5TQzpKNbzNWTy/iRFFgDz0sKFfrvwoTJozmSsOBaqGh/vJfC6D88V+aWNblnNNEEf1HYUKdOcb5bKoSaXjPwEGGA9Cgf9oFhFU0vdjY5mhqpMkQ3BEk4kNdAZ3mvyqyVAEWrw2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490751; c=relaxed/simple;
	bh=yPg4ksan4KvZAnUxvVEesaEuZZd4bO5TG5Os+ey0WO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BinlaF50UjdexSnWumbgUVFKaJ87/LAsB/h+7ErIqv2qyTG2qcZcmuT419gfsxKQGeTxwl/fJAt8QhSwFHXDBdKNmWEd3C3ivFgjkMSh2aLTsxbOqo7bEd+yyhYQjZW6ISeknKgfkTEaKXdME9fFe8HjmPW+Sy1uUwLSdkdZqfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbfG9ggP; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbfG9ggP"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d20963so370998b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789490748; x=1790095548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvCnDXZrWO8TEYbuW/IRJAcni3hfewokDsrz8A4uCCc=;
        b=cbfG9ggP4RkELB0gjpRUhaUtJ0QpqfCVb58K1puIqsnr465b6JNXN4KGvDTQ1D8Y1m
         l8rz8wXoEsNEbOLWGC8MxsECQwpzbwWbUQxfROynpp4/7vNq0NrkwaQVIF1B+uamqCgJ
         RDRYZTNKglDX5pTgo4LgdfeE7dPM4wXrf4aTorqw4cjhdnDTsUCs/RZCL0tHSYR1uw2m
         /bLCaCaOZYWKj++m7esJBx0eHqMI+RrcP9YoAsgRqDfU0AHCAQrCAj5XyIAiEVzVhokz
         1rI+cRbWZ7p20/jyzTnP1necRgSjyKW3McXH5v8JaRmKccIE7VIsOkpMBPKoKf9ZnpyY
         WhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490748; x=1790095548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvCnDXZrWO8TEYbuW/IRJAcni3hfewokDsrz8A4uCCc=;
        b=hIZKWdfVk7pJpoJlffzHwmRPehtOOfEMnSj9eH9SCw0pzTpAMggdt7/ojrKYq0EJc/
         44Jbbm/jqS5hvOEkkL/7+hhahmycy8+um9FyiSfV1gxRu1gVf/wEl9SMBPvbeYPukmlD
         enaocI0r+hYJeIRxn8zu4mukiZohv7WhRR2yMu1J3ylNb9zPgW5ouvu6qJrmwma4iWRe
         JYi82ONCNSI6T92WToFnUIqy11WEj3HSFZJMwoTPBe7IglcwI+pPkJltcHmiudBc+8uR
         Lzm/dqZeE9BcpCmarU8uzzyUcyw2wZRZgdxpS74ZihherbhVJ4fSjODVxUOl4Vt4XAPG
         2ODQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWfUM9EwX4XeyePKPrC6JbzJFzTwXNOh76QNjWbFxTL8X931aU6fv2cMnHiV1LlZ3Y4FHACx0LaYYu1Yc=@vger.kernel.org
X-Gm-Message-State: AFuF++lNEcNaEiEt0ki4KpGg2Xnacg2PbTFu06Uy6migiaK0hddT4CN3
	+yOttUeVhv3/nsbFb8zbT0WC33bAxEMhn11SEHxZlmXR5SYFuuddWFIl+Q4esDPq
X-Gm-Gg: AYBFou3rdFf0uU4695pxihcm7s2hMtLQmJYmnRA624V6eJEL352nmnC3nfK506RuGkS
	O6Z8RfPUvzPDz2hLfavkfvKTRNgKRUdqWdzD2e/PdvdBAJ+bMWMCdpEQir8kDTHDUZ/swkDhkFW
	Cu6MZi7kHVsTP0JzNPsgZAPsWb0uN5RcKvsexj/zumYkRafJ4M+tRVrAJe9lNnpUcT491ezQC99
	Xta1gJgVzQShAoIP5WmWOxVOzWTIvZC1vOD9vOOuEqAKh/Mw0H/oBjrl40kumOv3bHJrHhOaPIE
	uaImClx5nTpkU6yKtLTdz621vqOrtbvyr9jOd6bTtkOdmzfu362dtP1pF8ShEU5pUycU5ahaF/i
	ecKBw1H0MkOVsa41gc6z/MntvMU4QHIvGhMxqHw15Y7VTx1U0/GTXPFYdpekSnhMDun/CIARnru
	fL+HOPA2nasG4u0oQdhXw7a+fXBypORWfZVFhAcRDs2Z1R4m5lE3j9Pw==
X-Received: by 2002:a05:6a00:e18:b0:86c:f33d:e3d6 with SMTP id d2e1a72fcca58-8717eadc194mr2942536b3a.9.1789490747845;
        Tue, 15 Sep 2026 09:45:47 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29dc09d4sm6481081b3a.47.2026.09.15.09.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:45:47 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: nuvoton: fix clock cleanup on probe failure
Date: Wed, 16 Sep 2026 00:45:37 +0800
Message-ID: <20260915164537.2496540-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ma35_nand_probe() gets and enables the NAND clock with
devm_clk_get_enabled(), but the ma35_nand_chips_init() failure path
also calls clk_disable() before returning.

devm_clk_get_enabled() registers a managed cleanup that calls
clk_disable_unprepare() on probe failure and driver removal. Calling
clk_disable() explicitly first drops the clock enable count, so the
managed cleanup attempts to disable the clock again and triggers the
clock framework warning for an already disabled clock.

Remove the redundant clk_disable() and let the managed clock cleanup
handle the clock state.

This issue was found by manual code inspection.

Fixes: 5abb5d414d55 ("mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index 1a285cd8fad6..f659d3a6b9ef 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -993,7 +993,6 @@ static int ma35_nand_probe(struct platform_device *pdev)
 	ret = ma35_nand_chips_init(&pdev->dev, nand);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to init NAND chips\n");
-		clk_disable(nand->clk);
 		return ret;
 	}
 
-- 
2.43.0

