Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547750;
	b=BIsFcHp8z2xroauOJ30Ow2zQQXeOWpAtJTvvAR+hhb58tPntwXYQCGu6HG5Cc7qPO2Lg
	 Cp+XYyqUNyhwYU7TpFyEs7Caj+i/2nYgiA6FkmZfmUcsBZZaZvQbz3Nn/J++p+8N07qKL
	 +c7mz6T9lbblWdS1DpV2q1VuC0h1n0EFm9K/UOpGsddA8/49k6XuTxgUkcHS/AnMI8bFM
	 GNGGn2xUMOnQLehVBt/BK8ZTE/kpnZljmBkHp31BJxSJ7hLz9v1lp6+KAZJosF5eynPpd
	 PRnuvZOootPJ1TaeGe2s/4xC7dX8fpse5ETJv28N8MR+OfkIrP9+XypQxtv9n/GMWRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=+cbGdzty0Be5iX/0odAUgwQdHjrUYqcWpVwGe9DdZsU=;
	b=BZPdl/ZN+62QHAKABTiFqQfVyYQ6vmTC5fHhlwAYSvaznIT1J+4v7v5MZBVPogntOkj8
	 636Cuzo/ClS2JWgcr3gWBQ8Mgz03jHNzEKwGEtGjMhCLysW86bHz/4YqlOconDZklWGC8
	 AxMQTPqF+rcqNF+qCq8vPhbs7w/yHCH2N12CtOGDavY5CkAle4ynM3DgaOZtYhpuxOdyc
	 p97WwF4VZx45s3ZZf4EkzbCef7qtIzZOPmxZ3Ixi3PVyZDYmaZSkPe34+ZlRbS2PL9v6z
	 2Jk5sWB8fSOisTrq2CG1jGhrK+IfbDuP8B0tbwquUob/xMJt3/sd+FoY3tfIONK4PUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nuDb05wM;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DFF606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DFF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nuDb05wM
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so3588875e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794547748; x=1795152548; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+cbGdzty0Be5iX/0odAUgwQdHjrUYqcWpVwGe9DdZsU=;
        b=nuDb05wM8tSVk/INX8fUBYDhM6xMOtiC6nePWwjK47bDKQR8vHWbethb+2hVR21wor
         2LctxYz05PWWXdRkemyD8CPS94jg+MnJYVI0RQMYZ5DKToSn4qE1ETlbSFXB6iesYLn9
         NpHAl4+pjKM+ETmqU9A9KmnJauU5TGCs4Z2dTwEfKuaK5AqH5EvUvfv5Yfbe9fI3PZI/
         QJLx9CJEA3Ifbr+aEqm4DRuD5cfnqMa4LjDRfVd0Je6irROjrAYASne+B+fwEk3wtDeO
         ZvGnI9GAz/dHh7xOtkFqjWyAGVFOKqHi5abURAabQBsLT4pCgdiXWisY5+qrMbjXrj9p
         pFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547748; x=1795152548;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+cbGdzty0Be5iX/0odAUgwQdHjrUYqcWpVwGe9DdZsU=;
        b=OcSx07+ZZIqN+lzcMe3qTUjVm62PKbEaoUhaHyuPwlnQQ/aWnzWEtI1ZbeRJnTInxE
         5zIabuRKmb13W2XlShaG+2ssPbarex4AQHV7lr0Vtyepvk6nxGp3F3RPHmdmwWvbUulw
         b3eZIjNd4VUIodZVZLzGh50JEzO8eOZbu6+9Wnuv5hDRTHWfqze3z+ks9tZsoMtysRDf
         4UO1yT1vf/K1GDIuAg1vkev7BG5HAE0ET1QhSiTazn4yLrg+Tv6r+jzi4zPN7baeEU8Z
         IqG5bpgjc0JXJjACPurLLlMTl50QrAM9JqZdlqoDr1pXzIvypDRsin5qqkZ9igxoXe0W
         BSoQ==
X-Gm-Message-State: APuU4Z8/Rz1JC+iGFUqO+Hs/VwulxpEhF4O2zZIo2aDLHXUcY5SvLBM5
	bHhdu13terqNnvrI5/8u5F8661Poa0BFedH74RNWSapNPYPeYxGfu/prexDPkYi36xs=
X-Gm-Gg: AYBFou0gHE0KoHr8PSW9l7qLHfoEzmAJLnoX4iCcbsgh6BwKCrByCyxshEsKUaRPP1P
	TiLBfAkmZ5s+zDNLqn/Va9L49s7/vTgCboSrIvrrOsS4RstkPcFVdkPQago8zRLTbqLfDUjzx43
	gQcdFAVv45bXEGaErQkhsneQmOcGeP2oiuQwG4Y3c+2g9zNPEEWfTHGbpHozwTkXr1o1afwuQQY
	HyGcndKvq6X5H0pMlNgtNRIThLai9jEUBRYDG2cDZl7GrkANY8o5ZxZbYnnk6WIZ7t0AOaY0Jj0
	kdxI9C6taMAIUXw+Lcard0bLA3Dq0xZj9ejbJXuprFWvxGC6cENvzzx+fwSBqVVoZdEADG1UPub
	KcLDL5gRmRvITKSA/0qR80PxA17uJ0rMJ6pxYduJlYLe3+2W6ay1xf2dO1NnPsWbrSRhR+0+yF6
	mHNX722GQijQG+pbK4f6A+P/05EKU35Xgz5swO8JyQ9grtaBy4iiU691LWxeRcTS12jNxeNvBKg
	Z6AFEcLbRAzYXqqFWYJmG1cJLzuCKR/0U3AbJ74IDoMDjaSdDj4+8HURLc1VciezKqgE7AHTi7M
	P/gyWn5xlcE2LUpy3CNy9lzZejNkVcd+hyMQce5uN/eKQOUN0MFV2xK+
X-Received: by 2002:a05:600d:2:b0:4ba:761:c0c5 with SMTP id 5b1f17b1804b1-4bb55a581e6mr21673295e9.5.1794547747666;
        Thu, 12 Nov 2026 21:29:07 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm11572365e9.3.2026.11.12.21.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:29:06 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 13 Nov 2026 05:29:02 +0000
Subject: [PATCH v2] regulator: mt6363: Serialize BUCK_TOP key access
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
Message-Id: <20261113-rgp-91-mt6363-key-lock-v2-1-adbd48f0f830@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAB2g9moC/3WPy27CMBBFfyXyulP5EdsZVvxHxcJ2JuBCCLVN1
 Ajl32sC2y6vdOfcMw+WKUXKbNc8WKI55jhda5AfDQsndz0SxL5mJrk0QnAN6XgDFDAWo4yCMy1
 wmcIZjPUaUfakXcfq8S3REH838NfhlfPdf1MoT9q7kejnXhfLq8a8ywRhGsdYdo1F3irVBdW10
 vRWBj3Y0GPLZfDoqo6SzrpBsyf9FHOZ0rJ9MYsN9hbG/4RnAQLIKc+VswbR7r1bLtEn+qwK7LC
 u6x969KygHQEAAA==
X-Change-ID: 20261105-rgp-91-mt6363-key-lock-67b5992de5a8
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

The bits that select the FAST mode of the bucks only accept writes
while the BUCK_TOP key is unlocked. mt6363_regulator_set_mode() unlocks
the key, updates the bit and locks the key again, but the regulator
core only locks the buck being changed. When two bucks change mode at
the same time, one of them can lock the key between the unlock and
the mode write of the other. The PMIC then ignores that write, and
regulator_set_mode() returns 0 while the buck stays in its previous
mode. mt6363_va15_set_voltage_sel() unlocks and locks the same key,
so it can also lock it during a buck mode change.

Hold a mutex from each unlock of the key to its relock, in the FAST bit
writes and in the VA15 voltage setter.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
The race was reproduced on hardware.

The new mutex is static because probe already stores per-device state
in the static regulator table, so the driver only supports one PMIC.
A follow-up series could make that table constant and move this state,
with the mutex, into per-device data.
---
Changes in v2:
- Drop the gotos from mt6363_va15_set_voltage_sel() instead of mixing
  them with guard() (Mark Brown)
- Include linux/cleanup.h for guard()
- Link to v1: https://patch.msgid.link/20261109-rgp-91-mt6363-key-lock-v1-1-ea3b03a76997@baylibre.com
---
 drivers/regulator/mt6363-regulator.c | 53 +++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index e6c4bd851fef..b4f5f33779b5 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -4,6 +4,7 @@
 // Copyright (c) 2025 Collabora Ltd
 //                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/devm-helpers.h>
 #include <linux/err.h>
@@ -12,6 +13,7 @@
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
@@ -114,6 +116,8 @@ struct mt6363_regulator_info {
 	int virq;
 };
 
+static DEFINE_MUTEX(mt6363_buck_top_lock);
+
 #define MT6363_BUCK(match, vreg, min, max, step, en_reg, lp_reg,	\
 		    mset_reg, ocp_intn)					\
 [MT6363_ID_##vreg] = {							\
@@ -388,6 +392,23 @@ static int mt6363_buck_unlock(struct regmap *map, bool unlock)
 	return regmap_bulk_write(map, MT6363_BUCK_TOP_KEY_PROT_LO, &buf, sizeof(buf));
 }
 
+static int mt6363_buck_top_update_bits(struct regmap *map, unsigned int reg,
+				       unsigned int mask, unsigned int val)
+{
+	int ret;
+
+	guard(mutex)(&mt6363_buck_top_lock);
+
+	ret = mt6363_buck_unlock(map, true);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(map, reg, mask, val);
+
+	mt6363_buck_unlock(map, false);
+	return ret;
+}
+
 static int mt6363_regulator_set_mode(struct regulator_dev *rdev,
 				     unsigned int mode)
 {
@@ -400,13 +421,9 @@ static int mt6363_regulator_set_mode(struct regulator_dev *rdev,
 
 	switch (mode) {
 	case REGULATOR_MODE_FAST:
-		ret = mt6363_buck_unlock(regmap, true);
-		if (ret)
-			break;
-
-		ret = regmap_set_bits(regmap, info->modeset_reg, info->modeset_mask);
-
-		mt6363_buck_unlock(regmap, false);
+		ret = mt6363_buck_top_update_bits(regmap, info->modeset_reg,
+						  info->modeset_mask,
+						  info->modeset_mask);
 		break;
 	case REGULATOR_MODE_NORMAL:
 		cur_mode = mt6363_regulator_get_mode(rdev);
@@ -416,13 +433,8 @@ static int mt6363_regulator_set_mode(struct regulator_dev *rdev,
 		}
 
 		if (cur_mode == REGULATOR_MODE_FAST) {
-			ret = mt6363_buck_unlock(regmap, true);
-			if (ret)
-				break;
-
-			ret = regmap_clear_bits(regmap, info->modeset_reg, info->modeset_mask);
-
-			mt6363_buck_unlock(regmap, false);
+			ret = mt6363_buck_top_update_bits(regmap, info->modeset_reg,
+							  info->modeset_mask, 0);
 			break;
 		} else if (cur_mode == REGULATOR_MODE_IDLE) {
 			ret = regmap_clear_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
@@ -508,20 +520,17 @@ static int mt6363_va15_set_voltage_sel(struct regulator_dev *rdev, unsigned int
 	struct regmap *regmap = rdev->regmap;
 	int ret;
 
+	guard(mutex)(&mt6363_buck_top_lock);
+
 	ret = mt6363_buck_unlock(regmap, true);
 	if (ret)
 		return ret;
 
 	ret = regulator_set_voltage_sel_pickable_regmap(rdev, sel);
-	if (ret)
-		goto va15_unlock;
-
-	ret = regmap_update_bits(regmap, MT6363_RG_BUCK_EFUSE_RSV1,
-				 MT6363_RG_BUCK_EFUSE_RSV1_MASK, sel);
-	if (ret)
-		goto va15_unlock;
+	if (!ret)
+		ret = regmap_update_bits(regmap, MT6363_RG_BUCK_EFUSE_RSV1,
+					 MT6363_RG_BUCK_EFUSE_RSV1_MASK, sel);
 
-va15_unlock:
 	mt6363_buck_unlock(rdev->regmap, false);
 	return ret;
 }

---
base-commit: 7904338c38426d72c5f7cd9402cb9a20232a7af5
change-id: 20261105-rgp-91-mt6363-key-lock-67b5992de5a8

Best regards,
--  
Alexandre Mergnat <amergnat@baylibre.com>

