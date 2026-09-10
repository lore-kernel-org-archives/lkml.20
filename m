Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B73D3DFC7F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032710; cv=none; b=ddiFFjcgYNczehdbdkz0VyK29tm+EePboNQSJvQravG2Dag1tY4TYI2Pm8LnKXkHr5G9jsGRJ2mQ6fTWi2jrY9lAw+IYab07oxcvi9GSI2X2pYqZowEgDdXDcSOMM5CzFjlAwNZ56QXB1fw83aLIUNnPVwjfZauMHFDlrUTNlug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032710; c=relaxed/simple;
	bh=je4IU/IAiNq5H5O0okakTCOl1tHQPQzrOgxF5PvigMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i6XCYqyDfMKmYW0Dumy+pGXZEWJSo17PzOHJzxF7l6/tdBoaTUq/W5zZkU9KYC8fz7naBwPar2g4z+bJWLT1zrCteA0qZIuSxFPK70l++DR3qvH4OKqbNQLJZ19oegms9D5kd91NfJcZMeRvo7R3lfkHdh7jnWCM7sfKbr1Rldg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iPguvP+N; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iPguvP+N"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso12512405e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789032702; x=1789637502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFwgLyL207NuimkwPEL2xJQg2+Ohyu6vwh5w42Gzx6g=;
        b=iPguvP+NW63TQQVoAi1QEklQzPKDfRTbC1S/rq+3ZyR97clMD7UZTC8ZeVlGOUUXEE
         kGqPrJHqzMdDdJAQB6kTiOq2roFzr+9+8C0X7bh8Yu2pP4biKNQqQGMpQPZ9TSKIWRNu
         mnxnO90v/1P6MK0SZuTFlmfOM7yvd3lwVV8zQW6+6Ik6K/wxhkkuvT6bTSk8xroxpkFz
         2sDsRY4TIj3c0OINoBXO+fVeIL+OIDgsrZo2sSn6IUe0i6lNrx401DPFEpLQgpZCcfVv
         R5yYT0O3RqAYQabqh6XHZ/KXfuWNHs0xDbRllBOg8+25hq7XCtS/XP7R/KN9Q6+ShiaS
         RFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789032702; x=1789637502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oFwgLyL207NuimkwPEL2xJQg2+Ohyu6vwh5w42Gzx6g=;
        b=XhSb+llpAdyNWN3d4olUfQp4TpArACMx2rPyH4YWB7QUGTFlqziV0KXYunhwBUXqst
         NesTOlHSUBKkq631GPqs0f471IctP8HOzco3Oyww8m296d5D3vlLorM6o0lqYWhkPPED
         2mVPqX3LXZ79V/eQyOrn+jcxPArgMP2KIY5QKyotO+kZjuZFL2xICvo/mpzuf2Qnquvf
         a/x0mBzitxzbOL1fWXmFDJWii4H35pVXH5yq3Yw51Ieqa9LbbtZyZhcBi84amTStV/EB
         a8rx3d7/PFKXlyrxMBLMcVSGAZS4rJlYmcl5JUGKetEywBxPMrpmAo/uVxSxny3KNeNu
         cMOg==
X-Forwarded-Encrypted: i=1; AKwUvBydQjz6pyWvYU1iO5/aNgwxRo7M/UHsUfPs5J4e8hrbbcwTOhveI10KNmmfYs0rGZ2WsS7cxq6y7QjLzps=@vger.kernel.org
X-Gm-Message-State: AFuF++lAaD03pwcHPwiTo30t8Q6yaeliXpPFNX4M0QwovFCgfBBySwrz
	l8064SIyOtr52zY0VYpxZxyZ0A9oMn6PMUvbR4Gf4TbdEs3vqRuJHXR8xQ+RmB4tigg=
X-Gm-Gg: AYBFou2QdXfkDeKqFGLO0aijUXXZm8YLtOxS0Dunoou3ys0O/bSuXFHkEgC6YTITs9R
	IfxxK4GHa2VrnTKPsHWmdeVUpF/x78kST+jq+bI2j7SoAujMtjd0jGooEJJi9Y3I9FXZS8MiRYw
	8Lh9jZHpbtwvnhTsGMDpufjdbSzC/1+SLol36lzg7CTI59ZpX5FeLMqvs4oab/4Ao61zeNUA+fs
	3a8TpE0/sGBH6GwURfeyLBXHnPMwRaibGxL84x0zxXFeBRjjFJ4VzUlL6YFPdUXZ0gJV2qAYxkw
	Qb2P85FOHegWa+VN7IKRkYrOTr2fmtSmZWQtng8w9/ve+bcbK3Qel87KRgtaQQXMZhzdlUgW+4J
	wWJp4GoCxIBWW0lTxDUVGp/pC6W3dN7jeR7cHlTX1xyfT7DgbwJxZHWqjHhi3KBLEm+87g+38HQ
	z3BOkMeBOElKi9ITXLTgYnfLfQFu0JxlOCM1l17t+fezLnSIvuD5IBbiHseFw6vUskaAcDla6Fy
	K53AVu+QbPdLC+5+Q==
X-Received: by 2002:a05:600c:4695:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49d258e3ce3mr54932335e9.15.1789032701888;
        Thu, 10 Sep 2026 02:31:41 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb02bffsm85117265e9.0.2026.09.10.02.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:31:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 10 Sep 2026 11:31:09 +0200
Subject: [PATCH v7 2/5] mfd: axp20x-i2c: Fix i2c instantiation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-axp318-regulator-v7-2-de720ceb9bac@baylibre.com>
References: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
In-Reply-To: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3852; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=je4IU/IAiNq5H5O0okakTCOl1tHQPQzrOgxF5PvigMM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqonjvRKinlEcCy4A0ri5MNpxfQ4L3yuLTNOmma
 AZwFQfELm6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqJ47wAKCRDm/A8cN/La
 hbHOD/9/LdCt1jO5+h/A3gefSQM7t6pVQOmanJ47AAd5LkCxiW4JLGe0jPxDa5BCqD8F3Vr1++E
 6k7SoMfIXGbch9uX96UfYaZkCoTCoD2CSl5I5brpbTPPTRIyNu/pApaqduNWvPxZD7EwTNFFOem
 gQWGNzonSdfP8+yk26GvQLda64r2Z22tNw1nQZMms7240xIxY2fRIONOgh98rR/WVZUgNgcqfa7
 CPl3ROEFUgyxDxeHEEPpyFYFa2s7XcST0PjUWQXt9znjRB2wAVFv2SIAK2CcH+kBJJvHHqn2pn6
 /IbCVNrxcKuIJgT5QMa3u2yfloJTsSitfZIV9w3D5WckqN7vsPDzBp7ApJW2BrDO9I/MFnrHuyP
 oJIzosn5xhDVPUgki6MepZumeiR+/KvJe6wBD/dklHZIa20tv166OGH3Dyx/dgvkkRu8+C23ouI
 /r1Fl38URbNHGdh9IDCaqODrWi5OiN/Vei9G3F6/3NPXAtqJagRhADCzXSmRCgcE55spOnSJi8j
 CyjVbZpbEF9m8VbBeC7ZkOaA1oA1+hvkrf0MGRGKcEczKtuF2KAcaPy2xlxo7Z+RuYpa/2r2g/P
 ervHbrYQIDdZJDRuMc8zdhaEp7vK4HE3sgf1TqcadnDNwXeRlAAFcGAFnQ7FLmLjlDOTfJ3RbQj
 Dw2CEPWme0N8LtQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Apparently this device never really supported i2c instantiation via
sysfs, because the driver does not even look at the i2c device data,
which are not set. It would only probe if the device matched through DT.

Fix that for correctness, even-though it is probably useless.
Add the missing AXP323 while at it.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
 drivers/mfd/axp20x-rsb.c   |  1 +
 drivers/mfd/axp20x.c       |  1 -
 include/linux/mfd/axp20x.h |  3 +--
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 5c93136f977e..a76bec5604c4 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
 	axp20x->irq = i2c->irq;
 	dev_set_drvdata(axp20x->dev, axp20x);
 
+	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
 	ret = axp20x_match_device(axp20x);
 	if (ret)
 		return ret;
@@ -76,17 +77,18 @@ MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
 #endif
 
 static const struct i2c_device_id axp20x_i2c_id[] = {
-	{ "axp152" },
-	{ "axp192" },
-	{ "axp202" },
-	{ "axp209" },
-	{ "axp221" },
-	{ "axp223" },
-	{ "axp313a" },
-	{ "axp717" },
-	{ "axp803" },
-	{ "axp806" },
-	{ "axp15060" },
+	{ .name = "axp152",	.driver_data = AXP152_ID },
+	{ .name = "axp192",	.driver_data = AXP192_ID },
+	{ .name = "axp202",	.driver_data = AXP202_ID },
+	{ .name = "axp209",	.driver_data = AXP209_ID },
+	{ .name = "axp221",	.driver_data = AXP221_ID },
+	{ .name = "axp223",	.driver_data = AXP223_ID },
+	{ .name = "axp313a",	.driver_data = AXP313A_ID },
+	{ .name = "axp323",	.driver_data = AXP323_ID },
+	{ .name = "axp717",	.driver_data = AXP717_ID },
+	{ .name = "axp803",	.driver_data = AXP803_ID },
+	{ .name = "axp806",	.driver_data = AXP806_ID },
+	{ .name = "axp15060",	.driver_data = AXP15060_ID },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
index 059656f2a1bd..8fdc870c1fe4 100644
--- a/drivers/mfd/axp20x-rsb.c
+++ b/drivers/mfd/axp20x-rsb.c
@@ -35,6 +35,7 @@ static int axp20x_rsb_probe(struct sunxi_rsb_device *rdev)
 	axp20x->irq = rdev->irq;
 	dev_set_drvdata(&rdev->dev, axp20x);
 
+	axp20x->variant = (kernel_ulong_t)device_get_match_data(axp20x->dev);
 	ret = axp20x_match_device(axp20x);
 	if (ret)
 		return ret;
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 4d770e718716..de6946d4bb13 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1267,7 +1267,6 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 	const struct mfd_cell *cells_no_irq = NULL;
 	int nr_cells_no_irq = 0;
 
-	axp20x->variant = (long)device_get_match_data(dev);
 	switch (axp20x->variant) {
 	case AXP152_ID:
 		axp20x->nr_cells = ARRAY_SIZE(axp152_cells);
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index b352661d99a1..1badb4868d17 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -997,8 +997,7 @@ static inline int axp20x_read_variable_width(struct regmap *regmap,
 /**
  * axp20x_match_device(): Setup axp20x variant related fields
  *
- * @axp20x: axp20x device to setup (.dev field must be set)
- * @dev: device associated with this axp20x device
+ * @axp20x: axp20x device to setup (.dev and variant fields must be set)
  *
  * This lets the axp20x core configure the mfd cells and register maps
  * for later use.

-- 
2.53.0

