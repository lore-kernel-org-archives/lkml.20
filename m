Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C661B4E8E06
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790626054; cv=none; b=sSBx2/sgVLwJMn8dIMCypxETSlYcJxTJcrp2PevzQKYiL+vKPGo83kdoiS1/jXS2mE+hhCBdwQaN3v1kLsyeZOAj9XkHDc0J3Z+dqoKR3vbNXFYw8lnJap+xVVyx9r/5G4UocLqPqNcNct3WCtFjGB+0/XULuVg4R/3giKixERU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790626054; c=relaxed/simple;
	bh=zSlnTdmY/LVYZuA9Yp7alfo1U2xpc2RSmIpP7NwnJng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZPpxOAfSpD4TPunwt7pLf1n3KrAEU9GOc5KtWZM0kqnK3SMxG89/aqPCzETb+wj5t7DkZM1v1ddeLBBe72GKCfwynPirqZhHWrOBkT1TgeayUx87c3GlYsrRXuPACUFB9EwJJu0PNJFTytWKmzUa75GLmQmPbeIuflsdDf0sLXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbDU6acH; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbDU6acH"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb751so1641661a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790626052; x=1791230852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2sy1qsX8pcn7E7lL+azvnbLtgf+hoPNwiBwLLJDeGU=;
        b=MbDU6acHOb7XXfWedTYrqs8vZNWVh2PuBaD9xkUBj6W3NIwHMCl3McO7LOyiBd7c3c
         87RN5sDuSKgCpmUszmJJM+suEgPsPfzyyC4s2KaWY9THn5p6h0QYhl77xKdNPyPxG9VR
         raPL4LrdUpC5rI4/wNng99MA2gqj+rPvBP9kCXKrdeWx7YhWnWnarct5RGk/PesmGc47
         j9GSN8ffXrwRwj/wUm7GBbKeT5AT9z8ZDXO16p/8pufQiC2ItSVY5ollyngqzdQXF1jf
         SGQ99BM34ByN98THZ4pL1Hg1oLQvBBJVmzffk/OjXMpWJK392ZcQEwQ8BW1XZ8J4UZk8
         o8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790626052; x=1791230852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2sy1qsX8pcn7E7lL+azvnbLtgf+hoPNwiBwLLJDeGU=;
        b=MjAFNUL5BLBxlOJOk9RjiZlL8C6hVOvQXvp6JYIMrEfc006EylOmgXXNSVvF93qO94
         69SCgXgqakNGecMDKs1jnlXTArb43k85zWVB3Td8SJAPN+ElOavUGI2LeaUsIhSs9uNO
         TywToS0na3y+cmrhqqKjGRDf7HdXU1LQdFYkr+b5BahYwGd9a8fqHC9cd6nOnf5djmMg
         m2xzw6KcGSwvFK2bZDpppIgclRkFaipBb9zcvayIYPFUcwAcfxNYLdgMQatvdZ0NJLhp
         +iDWN9T/ILra9zXMO6vZRAYoXlzPEXf/o6WyeJk3t3j/5tk/XUoYZVDURpn8GbWA2S7B
         d0Jw==
X-Forwarded-Encrypted: i=1; AKwUvBxLBOdST1TMFG93QRaUKGR0MRuCoYo8uKz2citi9kwwYkKZIk+WLNY/rEdjDtTkS2pWbcGQ5VW2EpVWkWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYITCIss8ITQO5hxDsLZKAfjVVwBrpOA7Ay3i+/+mwnizf1jO1Pm
	S+N/g6iBjCn6157Ej7e4g0SCasWqurtqUkKV4ypS+3wF5EAD7U0buPVMiAkW94gK
X-Gm-Gg: AYBFou2s7j44rhVkGXQvjTupG/+OcY+CBxTa0g7zqLCUSULlz+RL+zevHVVPrh1o+j4
	Zp8skynm+CpoWOIe/QToV10RWMlXb95rFhmWximwbfc6U5RCP+Du40ati2B6gYesQiS7Ed6lm8m
	gqCE/JE/brtnODGKhz9yDDetLsdWM1W/lJz2DtVQTdZCHV/7ynKVfQe9qTqyXaKrVW3QYLfiqBA
	PaJlC8LgNSC+BEjtjjY79myt5qpTUwgMHwYi2AuDbf5ak2VDMooiZmp/GwrfH2WSrnKfgdiBcYn
	3IMxbon52uY9S76Qg29oONoyVIe4PwGgLff/dYo7dEIJFAOZpHWWbXjKm5ycBD3Y+BtKmYxKk2w
	S+CQMa145LlLZ0Z0plAXUtedhuQ8hZOTmah87JVIedqIGay5zByaMvH2+UreWqA5qYAXorM30Y+
	GKrphgRBkxkgJsdonT/wTSMHjq55fc4ztnAtB7suVrLW1+O2YnEodcAQ7taYnd0t8HZh1RVGmfJ
	edUCq1dF9JjZFj2FKsKMjeUOBTTWM31SJ3xKeeiEPK3OsUU8ytnmPN8ozcwlzsMKAST4nF5+ZKQ
	Z7crIzGxtE2fnQSFIeBPr4gTxPSjQ80t7QjbpjYbdZ6DC8SkxWoZkyACTpQ=
X-Received: by 2002:a17:90b:35c4:b0:3a2:aebf:9211 with SMTP id 98e67ed59e1d1-3a2aebf93a6mr2865730a91.15.1790626051521;
        Mon, 28 Sep 2026 13:07:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498caf134sm433722a91.3.2026.09.28.13.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:07:31 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: fsl_ifc: allocate shared ctrl with devm_kzalloc
Date: Mon, 28 Sep 2026 13:07:29 -0700
Message-ID: <20260928200729.44594-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate the shared fsl_ifc_nand_ctrl structure against the controller
device, which outlives all NAND child devices, so it is freed
automatically.  This drops the manual kfree() and the broken chip
counter that was decremented in remove() but never incremented
anywhere, leaking the structure and leaving the freed pointer in
ctrl->nand on re-probe.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index be6bbc1c184d..cc75b6a67e07 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -49,7 +49,6 @@ struct fsl_ifc_nand_ctrl {
 	unsigned int index;	/* Pointer to next byte to 'read'	*/
 	unsigned int oob;	/* Non zero if operating on OOB data	*/
 	unsigned int eccread;	/* Non zero for a full-page ECC read	*/
-	unsigned int counter;	/* counter for the initializations	*/
 	unsigned int max_bitflips;  /* Saved during READ0 cmd		*/
 };
 
@@ -1023,15 +1022,13 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 
 	mutex_lock(&fsl_ifc_nand_mutex);
 	if (!fsl_ifc_ctrl_dev->nand) {
-		ifc_nand_ctrl = kzalloc_obj(*ifc_nand_ctrl);
+		ifc_nand_ctrl = devm_kzalloc(fsl_ifc_ctrl_dev->dev, sizeof(*ifc_nand_ctrl),
+					     GFP_KERNEL);
 		if (!ifc_nand_ctrl) {
 			mutex_unlock(&fsl_ifc_nand_mutex);
 			return -ENOMEM;
 		}
 
-		ifc_nand_ctrl->read_bytes = 0;
-		ifc_nand_ctrl->index = 0;
-		ifc_nand_ctrl->addr = NULL;
 		fsl_ifc_ctrl_dev->nand = ifc_nand_ctrl;
 
 		nand_controller_init(&ifc_nand_ctrl->controller);
@@ -1105,14 +1102,6 @@ static void fsl_ifc_nand_remove(struct platform_device *dev)
 	nand_cleanup(chip);
 
 	fsl_ifc_chip_remove(priv);
-
-	mutex_lock(&fsl_ifc_nand_mutex);
-	ifc_nand_ctrl->counter--;
-	if (!ifc_nand_ctrl->counter) {
-		fsl_ifc_ctrl_dev->nand = NULL;
-		kfree(ifc_nand_ctrl);
-	}
-	mutex_unlock(&fsl_ifc_nand_mutex);
 }
 
 static const struct of_device_id fsl_ifc_nand_match[] = {
-- 
2.55.0

