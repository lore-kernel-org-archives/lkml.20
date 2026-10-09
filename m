Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2855E4C2241
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544954; cv=none; b=khsnMk3ojC1mP3Ss64h43XYrju9QaqT02D3WWeruXu1LTUI35/Nw3/Gg3Xmvj6FlN9qCUI9dhTjtIA0culg4BqphkXO6lvcT1kGj/U7d0m/EpEsVPT+aico5xzQA4nPPxGrbrq70X9jXq7bDc1xa7kfmH5mLE0Ay8PEGxDbrpEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544954; c=relaxed/simple;
	bh=Nrfy526swql1ij9G4gq9I/Gzn0+eqeTqdguk8EGDC4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yu4gwnOAOwlIvFJmjiBSb7Emm5gdGV+EtEKlUneAI9H5LFGN8ERcLWY4Lt4Z+1Q3SAD4qSRV5EKkWvggfo0INc/gJxa/pWVjJb1KHhfSaDvL6xgg777FMmrHkQmveNolOq7wuhTlBWQxve5ak6x1Zc4IRVdonosGgbJXty0SVUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+BA40Ir; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+BA40Ir"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1433e7b057fso4702535c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791544945; x=1792149745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkE/mtXxhD7ywmyvlYSqjpdIiOm8dtPe5CfShZ2eazQ=;
        b=G+BA40IrAZihdwBjzA1ZFDFE4NUaBbgzr8PMGEEcFj7jOpZxYLcYPkIF02mo5QAwWe
         XpfJ6vDOBzD0M6BqrJ+sDKImcsO8243B4lH2c+QfxggPUt3ELj2qPzIL4C5iHPrMvDQS
         9ZZvklRO8cl03eKydG0DATaPjlPqsJTIPib/MbkXwMq2jfNBPJQTzsWgZq365PE17VLz
         ro6p+PZYSd4pw4WN2sKFCfK6MS/TQW+23LaHfLhBBl4UXB3qBIMqDK+TyJfpe6HxK+9a
         OY4zwHxzpyLOVe7+igYAOEBaAdZWM9KO3Hm6DB610oI2YSKkNDT8qW6zWu89+o2UaZ86
         flTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544945; x=1792149745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkE/mtXxhD7ywmyvlYSqjpdIiOm8dtPe5CfShZ2eazQ=;
        b=J1/Eh6307rjdwus0pLk14o4uGshZL9v5rBloD+LjAg8ROBBFSCjNEeCP+7HxJCI0FE
         mljdQnvOX+XahWRYeu11yYCg4UnwGyl0ooDDDOg5cfa+sGSnBo+JIThGMAcUc7Q3xZ0X
         FAlgFedH+GrtvqVp215k3cwgNNHvH/2wtA8aVOq1tHsi6UgB67DBNu8Y5TI5LWtJjdYe
         ovtBZiDZHDOlvwkTQdZXoxPf0NHaJ23pf9/FUGq3j3fX+2VZUsXz49LiUcV5L9OG75ue
         bfZyW/KxhKyCFTStO6sRJ5Ny1kRH3Aenu8qGnGWFBzSMfAJ5FNA0RSP1YgpWnw9vxlpG
         3IOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxK9AkjQc3HH1trmt9W/9mjnWVvtLoK9dw8D8JdpkM/aOhlltxANS2vJQBobkgjqBWxO09kY4NX5f3LryY=@vger.kernel.org
X-Gm-Message-State: AFuF++nP3dd7VI/m6QcfbjxoQYRSObKmH4vkkoZ2FfXqeMNM3ZNhj/yM
	mAeLbT4fmMh2wpq2ri6/Nn1EAjbsnMJ9Y2trElrxoiQaMShhLHZRzUAY
X-Gm-Gg: AYBFou0xOCRKhcnIwv92Vi9/Q6x6p1S8qI04ysxrBUdGP4+tQR6AxUWNYU57UHZT8I5
	5VCbIr5aZEDeY4FJ91nCxrhaK2Lq1mSsok/oajvsyTejs0Am5pS1p9VV0+LNw3A/KW2CR8E90i3
	TKZenIRyaqx3y5BR0TKw0fpSdNSRAEwI46WW6MPhyqut6qBMm7IhMXyV9zr9qqe46vkSJ9wyizh
	BAKheHC0UwibFtBVB5BJwnh8xXDwarosN8Gnj5Cazv59jjwkEEJwvHVqEN74l6URKWDgqFRlU79
	2ZHJE1GaPN0lhjzKLciCNH3llErtXYMitJ/1OWmLUwd7my5g/CTEy/8tQX0dFIbVTgh7Kjlhvj2
	p4nqGAP3ujCRmFWT3+/rhaXks8S1Gujp4EPBrRQWSKfujaYIOde6gUqoSL9BKKOPPA7dzm875PG
	w9Fd9hX5N84KLQxhzHrGB5kNlLoLXrdTL7KOZ85EfIHeIU4BlUOcGZ4Umv2auUNGAQvm+RBliYV
	CIs2kpQwG9zNh1uQB/MGt8pSTuKfnh4I07vtk8ocaocepfKyISoQbfVulP6ixXkSUw9WSVvW34W
	3sX/fx/SZ/nWTg==
X-Received: by 2002:a05:7022:699a:b0:16b:1a1f:ed8a with SMTP id a92af1059eb24-16b1a1fede2mr1744976c88.39.1791544944883;
        Fri, 09 Oct 2026 04:22:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm7258752eec.20.2026.10.09.04.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:22:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: codecs: rt5645: Simplify optional GPIO error handling
Date: Fri,  9 Oct 2026 18:22:03 +0700
Message-ID: <20261009112204.33199-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

gpiod_not_found() converts -ENOENT to NULL before
devm_gpiod_get_optional() returns, so there is no need to handle
-ENOENT explicitly.

Use dev_err_probe() to simplify error reporting and handle
-EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt5645.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 7313ea71c958..ea58512a55b0 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -4032,26 +4032,16 @@ static int rt5645_i2c_probe(struct i2c_client *i2c)
 	rt5645->gpiod_hp_det = devm_gpiod_get_optional(&i2c->dev, "hp-detect",
 						       GPIOD_IN);
 
-	if (IS_ERR(rt5645->gpiod_hp_det)) {
-		dev_info(&i2c->dev, "failed to initialize gpiod\n");
-		ret = PTR_ERR(rt5645->gpiod_hp_det);
-		/*
-		 * Continue if optional gpiod is missing, bail for all other
-		 * errors, including -EPROBE_DEFER
-		 */
-		if (ret != -ENOENT)
-			return ret;
-	}
+	if (IS_ERR(rt5645->gpiod_hp_det))
+		return dev_err_probe(&i2c->dev, PTR_ERR(rt5645->gpiod_hp_det),
+				     "failed to get hp-detect gpio\n");
 
 	rt5645->gpiod_cbj_sleeve = devm_gpiod_get_optional(&i2c->dev, "cbj-sleeve",
 							   GPIOD_OUT_LOW);
 
-	if (IS_ERR(rt5645->gpiod_cbj_sleeve)) {
-		ret = PTR_ERR(rt5645->gpiod_cbj_sleeve);
-		dev_info(&i2c->dev, "failed to initialize gpiod, ret=%d\n", ret);
-		if (ret != -ENOENT)
-			return ret;
-	}
+	if (IS_ERR(rt5645->gpiod_cbj_sleeve))
+		return dev_err_probe(&i2c->dev, PTR_ERR(rt5645->gpiod_cbj_sleeve),
+				     "failed to get cbj-sleeve gpio\n");
 
 	for (i = 0; i < ARRAY_SIZE(rt5645->supplies); i++)
 		rt5645->supplies[i].supply = rt5645_supply_names[i];
-- 
2.43.0

