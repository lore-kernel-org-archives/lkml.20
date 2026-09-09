Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1C249BD77
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788993535; cv=none; b=gyB1m8N+QUxGXaTynKsvfa/zQrVSk99chHlgKsmkN5NbWmLYS6d0dAQROldHBxrGWUnQ/KcFqKqVE5HMwbvZT17/YSl9lN+VIofkL5ecQMGdhttrnXldEVFIJKjykq9bU5r2vz6Hh2eyWd5txQgkMVKZLqew8CIZVnI0G1YScZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788993535; c=relaxed/simple;
	bh=MRsC2Z3mhHdtIXZCk0cGdCJl3NGhwkr0WolW/xUHU5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+UsqL+hkqoGGdD2pxCGFLF4G9mX3kWntV7yNlGS94hywyf0Ffcpl858NcEFrmzGXGYu07UZizhzQijeyNwUikbLtFZX2KvT339rVkgMJ9mHglLDc/ORDocXA3POZW7fWxR8ctRKyWBVdJQD/2gXquzo2gbIshdOdDZHBlzyuxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrt31GxU; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrt31GxU"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398a5aad413so5393686a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788993496; x=1789598296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0TDN1ENNBP5/KFE2zuUcIYLjDMC8n7M/eAXUlfMDRo=;
        b=hrt31GxUAAFDCcoxvqaXtlFOn7xsw6dJMHTawGBbBU83XtV/KKMYiZ/Ii3DWBRbHWb
         ETEYZbmDnwMrm8+DyiLSCphedoEfsDWW/5SnI9IQfegk/wAJuPAZji8YiwtMGt4U3CB/
         KbRJrwU/Pb3d8jqP5lS2n7XBIP4t7pvT9PlEnjl9ZP11BequaKHWcyyuPZ9vSoiytNtn
         x+9PG4s3bFVMOs1j0vM16jvOqZZ813WkHbwViMHWf7UuSgVc34Qo6eJOou98yVKOEXRk
         9Uf8ysCtk7qYLHMKdHe4dc0Vn6+DXT2V1jNm6bijzZ+SCNdsc/QYMBGdjBNxZg9FCeLH
         CiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788993496; x=1789598296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0TDN1ENNBP5/KFE2zuUcIYLjDMC8n7M/eAXUlfMDRo=;
        b=QCwxNad4pDObU/KSoAKHxkY/E07M8sHC59sK8nvBGQtYIfDOMrGidSTxX1o7/OIum7
         S/wNWf9UU43HWyP8JFsH8s2j9imTVxRqniMXKt5Tg4OWRfKLOUf95+s6xLg3BAR6kJKi
         TJWudfo3UFdCVCVBEeHnbu+7HXM2JQY29/M7/SNbgVhpLwManY+YQtUnlFbQ4CUDTumZ
         5XL5evs5W+m33ws2Tj99U6diqfsmimmOTiwOwmEq5mQ8Fpm5zhmrmgsSD7Oe5a6wz+Vm
         lSSa2LQexK6HuwSQs5VTecrvGgxl8cSuWtvO6QAkr1kG3dp9JzvKL1RSishjEEKiQEuW
         0cug==
X-Forwarded-Encrypted: i=1; AKwUvBzIFtIlAuJCueoNwfHlYArdlXO7QS6H1edWunzAAWdH0lX2Q2ta1aoxWBZCDvJUwVveJBs7q3AXeOBH3ko=@vger.kernel.org
X-Gm-Message-State: AFuF++n8B/oy2LGPTft1has+ADTmEPgT1LIPgD04WkzWLT0ppN+0PiV3
	nchOL5tXD2hBQ9G6PFcnOYQDZDFZ5ojMM2V7Sjk5F7eZAJ8CjIWohFtqbhz1JA==
X-Gm-Gg: AYBFou1uZxeN96AGNU9VNrKzXm0N0w6oLLcnLJdZ28HbjPIi3f53Q/5UP5adTaCFhc6
	tw6b8JFhnRTtL0vxdOae4W3kFyhUuiKIFo6A2XOhN3HE6rvltwuwxvpcJcU6mZz9NtkCdAQ+Y6/
	Z+FsLCYOOnqc6URDzXpvfYeZNFCOCipQDIc0oh0EpdusKv65979dwc8qMl9v+RROV5K50XPbNEv
	KYk3dyOdz8BJbZl7YUt8gzCObZlVwGt+a9yu8FblA6g/UR4v8FVOsfUcW1UNo071xDF5AsNXn1w
	Mv3SOC7t5G738BNGtrZfkh5CZ23KZFlUX+ZoiwaZybBQelvcofQXQKCIEIXyQ01Y9+b1fqlZHKS
	EoVDO51RzDAWYkxo8iN3OOyLh61jB2MZGSr5LPy0DCnXvwAKswWpos+PIq0jGjLS+du1S25x491
	HAblDLrtN/D11amr7cx73wsoEZtpoP5h9Q/jzVmijbHSyH7MqxMO761au07U5ScJQ1KXTRsTcl7
	rBIAb5mqxG5DrxlcCSe5eIaALVoC2grG63cEHbOnH7qF38Rsgf1Xrd4gnwI2l1D8yyPFJ8JWkBG
	6zW7VyIsLn4N/3VrCvTZ/RXN81vgrWyojmyGkkQgyRiPZgUR4GlWp6SNCDs=
X-Received: by 2002:a17:90b:1643:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39b26272f04mr54469922a91.14.1788993495918;
        Wed, 09 Sep 2026 15:38:15 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e82fa21sm266638a91.9.2026.09.09.15.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:38:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: fsl_ifc: use devm_kasprintf for mtd name
Date: Wed,  9 Sep 2026 15:38:13 -0700
Message-ID: <20260909223813.69028-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual kasprintf() in probe with devm_kasprintf() so the
name is freed automatically on driver removal, and drop the now
unnecessary kfree() in fsl_ifc_chip_remove() and its leftover mtd
local.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 469b233db73e..cc75b6a67e07 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -963,10 +963,6 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 
 static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
 {
-	struct mtd_info *mtd = nand_to_mtd(&priv->chip);
-
-	kfree(mtd->name);
-
 	ifc_nand_ctrl->chips[priv->bank] = NULL;
 
 	return 0;
@@ -1061,7 +1057,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		  &ifc->ifc_nand.nand_evter_intr_en);
 
 	mtd = nand_to_mtd(&priv->chip);
-	mtd->name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res->start);
+	mtd->name = devm_kasprintf(priv->dev, GFP_KERNEL, "%llx.flash", (u64)res->start);
 	if (!mtd->name) {
 		ret = -ENOMEM;
 		goto err;
-- 
2.55.0

