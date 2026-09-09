Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A4E37FF5A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788993348; cv=none; b=eiuiL74Xr4jKJTDmF+vgDa3FGMC/Kbv7pjJ/9BGSWSQVEL33huGGVczmjBuWhoRPjV5OATMpdnNoCTulUy+OgdX0G6bE1RxKIZeR0kBkWKMomAAKSgEyzKgt1VYaFfhqwTQoqMbhlI+QKyNreyNJvLCUypb5j2N0PPja+SXMZwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788993348; c=relaxed/simple;
	bh=2V/bTApWvXnVcZzt8OWfLMXyFfCUlDhbWBFDxeU/6kk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Od91s94O7oQsRc3P3NA2oGPi9vhqZHvo7s+koPKcaz1LBUbUuMkDB5TwTH+3ON90ASIdr6tZg6dzXpEiCPelTfBLz4ksE03qUHvxJlfWLFkTKPAK21Cyt/f1XFb3XShJO7XD9rUMNeceigzT4vpKH8qkQpEeSRYhzLBjO74pzNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5wd6EWG; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5wd6EWG"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d560775ca2so46331675ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788993323; x=1789598123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2mR7d/eCrXCqtnsUBaBZRSoRQmcpPDbLqLjlbgkBnc=;
        b=m5wd6EWGzZRbLeeAEZ8+kknh/kTOOPweMLBExnHuRxnXCdNJmSglvbthUFj86cs0PN
         d7V5PRLebjg2jmjmd9EoI3dT8iGiojswqJW+PMDlpVrUslfbRmsYmF74vMpGssrtJlTH
         LsSz5AJ7ci8r0irSoWusEOqxoZPi/xm/GiTmu5v2obkbDufs9KI8gtFvIXH+I0lmNBdR
         aukcGu+skjVR3UUOMn2xWn/kUggPxAvAFOc971eUfyNVisOLyj1KrIHUO/3WuQKOyO2f
         p7yCs0YplOmD9Tdvoj9RjDWHeEJntpyEh7z0rckipezKFzkL3qLwDLLDLHNodpHutjrC
         5Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788993323; x=1789598123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2mR7d/eCrXCqtnsUBaBZRSoRQmcpPDbLqLjlbgkBnc=;
        b=gTNMyUPd3a9Ns6NKkGZRebz/UpZLfmsX9UEN9W4/WMuzlq38SCIbyfRcSMgBUXz44a
         x+YfKCu9zRPoig1jjwwwOzYHbuOYF2EnXp6erpNao06/crNE0hT4pejVgyddQ67vVQXS
         y675/eQDIERyiDMfd8azBugoNkteYGgzKOZyVEnTNXKLOHSz2VvNSswEtra6JGWjjDMY
         ss5BdTjO60WC4T0WuvXX+T7OqnA4RCmww6j0r5BryUvoaQNmplxfuVL19I+E634OiK0K
         JGjqUY7MUvE9HA9Slrb+Pt+5oNt6U0UZxI2YIhUlKUhqoo8NnGh8paFmd2+SEMlrYVbL
         rkzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxUZViJhqS1i2RwWUdOaqSFI2PZoOe1iLSJF2eY3EvBRNt90Ck8Zse43XIVBcVymt0u4FoF3jYXqqtIbk=@vger.kernel.org
X-Gm-Message-State: AFuF++lUDER54qkk7oKB2gXFkkvB5nytMubTYStQimg22D1vT1Vjo2tv
	RtALzzbgl0i/VL/tl1PIkCg241aMcwikcBzHrluMoE3IsrS7c5aNr5QetPl8EA==
X-Gm-Gg: AYBFou0MDLWL2kNZS4ij0m9My019v8JqwI1RuZufu6/74LbY5L2nsAry0H4bvEpT2cx
	uVfz6K36jTYzYaoQWVXIbXiVhB/0DL00hRH1o8AQoRRMf1Z0/ZHgbogyRzKSluXILmbDlYT9ppl
	XCzxWismaD7vu5nwLYC/9gzplMrspyfL6CGY3MjxjZvju+IOXnD/ZRWB7zi7whls1cNb22fGD+h
	ApAhvdDr3fU4K4qOqMfvqnEZGZu6wnmV9tIHPVH9fI+zssBkGPGVLspXHJjbuA8J6S6JkvzvIOg
	+nSmLXp+zRseApqoMZinUAWXtMsV/pNaELhw7otFiM15qXn7EFzN6/NvzsR53t+qEKrpGhA70Ua
	Sexfi7dp+yIJGeflmwvCjKmCJQXB82wLuADpD9VRRGEhovh6iuXUCNz3MfLrSpYYUa2NZP9aCpU
	V2eexI4N1msqqpJHy7Wa29bIT073aMxYrXYbIt5c0wRQWC5x74i1GMexKBrtyEgg1AGTv3kSJzk
	nEP0R8iaKqapAFK2VLRWKTdS+nOYlxWoyPnN1UKSi7LhJTMZGZ5+2aYXlPsoEZ6M3NNuzkyuLuJ
	1UBMG8IEv8IalaJFVEqc3jwDKEuV2T68bsWp/yEF6L4Bnvl7
X-Received: by 2002:a17:902:7004:b0:2d8:d4d3:3fbc with SMTP id d9443c01a7336-2db12629346mr405572845ad.16.1788993322973;
        Wed, 09 Sep 2026 15:35:22 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497df04sm79247975ad.41.2026.09.09.15.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:35:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: ndfc: use devm_kasprintf for mtd name
Date: Wed,  9 Sep 2026 15:35:21 -0700
Message-ID: <20260909223521.67572-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the mtd->name allocation from kasprintf() plus a manual kfree()
in the error path and in ndfc_remove() to the managed
devm_kasprintf() helper. The name is now released automatically with
the device, removing the need for explicit cleanup.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index d6db04d48c45..d7b119028a71 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -162,8 +162,8 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 		return -ENODEV;
 	nand_set_flash_node(chip, flash_np);
 
-	mtd->name = kasprintf(GFP_KERNEL, "%s.%pOFn", dev_name(&ndfc->ofdev->dev),
-			      flash_np);
+	mtd->name = devm_kasprintf(&ndfc->ofdev->dev, GFP_KERNEL, "%s.%pOFn",
+				   dev_name(&ndfc->ofdev->dev), flash_np);
 	if (!mtd->name) {
 		ret = -ENOMEM;
 		goto err;
@@ -177,8 +177,6 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 
 err:
 	of_node_put(flash_np);
-	if (ret)
-		kfree(mtd->name);
 	return ret;
 }
 
@@ -246,7 +244,6 @@ static void ndfc_remove(struct platform_device *ofdev)
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
 	nand_cleanup(chip);
-	kfree(mtd->name);
 }
 
 static const struct of_device_id ndfc_match[] = {
-- 
2.55.0

