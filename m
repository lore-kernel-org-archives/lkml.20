Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226489;
	b=SMKECC+RZPfR4blM9cF4XrIU3N0rl/zZMvpc8n5jcF0/HAIkFVyPWzKJ+7mavRT8Fzdx
	 MkwKq9WJ4t9OkKNoJMy+Qxm39+VIx/Hv0e5ecHKyTkidFE4EUfcPSos3irhFH4Ks4A5TP
	 8tY8aBmCvdMwfvVzumt7v42fzdKtNU58s5OPY9CqPFaxVPxZ4UW2GjfyRXeZ4qY7MlFzJ
	 82aLCsOr1yCHN7NxzoCWhBlUkbO3V/yQUkHlRCc6d8CIviLnk51MsrDBuHIRZVf+TpPQP
	 0CeFkmY+zXTLRqCkH785O+AoJwzu+caE5kQ2JAKooBlIIMo8zNt4M5dlPeSA8kfINgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=2+V7YIy+ugL63jgP2uxhOpyvZ08G/pDMPRbZ7zomEng=;
	b=mOJdJoyTM+WJcN07E3mQgGq52Z1jTWADmKx6wJkKsrKI67ptt0QwaxDyLUuxgI7rw2Mt
	 7N+E250yH6WqlgtowN7KQ3JWSmXwA4y1F39JuPxDs1PWlpirrtA9xyF0BWR6NThYJxgU8
	 7T1QFijD79FPhBYTwK7/uUmq39g5f9mt9dqSDjT23bSMwQ74xRat2WkRjToSgLLW4dTrL
	 W9VVawBP+trJ/ZIZiQQGt5jQVM98Jf+1FNOwGIBOXei9M9CdRLvJo/HUcPdpEpghFzyWg
	 0p1Ck8K5SZoYvMeXLeelH00WvUPvO4FXP7LZ24NNCv8G9EGn2Qn61UTjRvUz8t9hg8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Wh7emoEm;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5D6606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E5D6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Wh7emoEm
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4919a880834so453838f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794226487; x=1794831287; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2+V7YIy+ugL63jgP2uxhOpyvZ08G/pDMPRbZ7zomEng=;
        b=Wh7emoEm7MekgKHkEJiOami3ZDW8jcZGn12IH+Fiwfto/jJLXTzqk9nr2nhfIjoTmh
         jSFC/JYlQ5CKo+e9GYyn4aK29V5rLi1aiZLzJJty1+ReDbCaUbZhDtfH6SnNv2372DUJ
         SPJPQ8iVnxpLbN6gj4GD2ni/XOA6/xJkM06gH5f3sN9jxs2Yp2a8FCDKmJA+TX0IXHco
         W2js8E4rZeAwt7XTVdQ9KdZw7htlnblEFKXQkwheG0EqcIqC7w3HFkccF4nLzNr4aGin
         Rk3R4YwpxyeIMRBpbEmio0LUkMZETLu3sM+ZjvjU3j75w4jgcU+X7PtZA1/eyCsgSgs+
         ZbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794226487; x=1794831287;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2+V7YIy+ugL63jgP2uxhOpyvZ08G/pDMPRbZ7zomEng=;
        b=XVRlj6tbhuLIdoBWvT9Qm9rQ6MPsx7Xyde4Ilp9DDKrucWGHB+9fdv6zNrYm9MlXQ9
         2+MSOgsUSLPi4+dil3RI0sA45kfaS1BW1qOCnxEzfzWcF7OyA811Ls1hHsCnXXwc5Iya
         fuOjpJSCce+D39bUODtV2qoDVJwWTzF2q/QG18oJF77bVmxSkkiLnE0qYAMOwEerGkzB
         S/jK07+llUoE7hTjfk6M2G77v9F073GypMmGmKrpZAzzngaU3Db7WvNxKgUbYNcusXNf
         P7DOtVMe4kKhskC040oA/6edjOFjnwubB1ovvA8LTxv6Y415byE8fLIXHJ/wI2W4AsLm
         TaAw==
X-Gm-Message-State: APuU4Z+TcBuZdY1GkIe2stXGNfoepq+TM5tb8vGNeFuwF2AtYqj7QXYx
	5YQn+UCyX6wlIyCX3ggp9Ye6cLcRA1RJ787Knz7DnVlt1a9yftPjKUYMo8ZapaeYFfk=
X-Gm-Gg: AYBFou1YO8YXz+sLcfuIZyi2eHc13k4RNGJzGnOTtIn8ESHzcHYBTpqZ15AgHQ3cS5Y
	EfOVTV6ImKqNlU3inFztfL5vGe7zV3BU1ex3oiZSkLWQZhXJKiugw9qQotR+7zFeMnxnGN8cXQv
	Goph1g/VnKAxzNwIav9hZo+MzkJec/vndMlfPcyscmLa6GGm0Fuj9KuJTkdVvCSZSyw37/mqflY
	r8OYH+O313GbZP8FUXj9ZQDJZxjruKYl2FESjVoS5Ys6Oc05RvnbsukmlAv0MhMGFnWr4QErxTp
	LX9Z8aLGtSygT8O+rJAykAzSu2wEPrV4dS72k5tt0Ht8v7NLCtqqXHo2UHrGOJsl2DSUnd7AAEC
	nARxuaNk4o/RAUOlz6/pu+vELNyrWKw52WcXr+LdLpEWiMdf1m9uXSROKoIFF/9vkBgEbSKv+PO
	yo0pIOsw8HWpB+XB1AwGZwvh/rzRUyhb5WSAX0tj716vyUfv1r68lAAl0BKPOZ990+oMRDKUY4X
	n44YEWcLJfQe7toz2d4eActvz+kFn7Jg40EW/GulX7SOFXTySw+8wquVcXCel/+ip/rXp9PUVpU
	yTWcwhqlRbEWOQSB8pAwgY0guVMacdtTjlt1e5t7LYPc+e+pTgA7MvPd
X-Received: by 2002:a05:6000:3c5:b0:493:2376:81b7 with SMTP id ffacd0b85a97d-49588ecc152mr7398751f8f.27.1794226486849;
        Mon, 09 Nov 2026 04:14:46 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49596f9ab09sm9313946f8f.28.2026.11.09.04.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:14:46 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 09 Nov 2026 12:14:32 +0000
Subject: [PATCH] regulator: mt6363: Serialize BUCK_TOP key access
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
Message-Id: <20261109-rgp-91-mt6363-key-lock-v1-1-ea3b03a76997@baylibre.com>
X-B4-Tracking: v=1; b=H4sIACe58WoC/y2O2Q7CIBREf6XhWRKWAsVfMX1gua1YuwjUaJr+u
 2h9PMnMmdlQghggoXO1oQjPkMI8FaCnCrmrmXrAwRdGjDBJKRE49gvWFI9ZcsnxAG98n92ApbJ
 Ca+ZBmAaV8hKhC6+f+NIenFZ7A5e/tn8iwmMti/mIIWsSYDePY8jnSmlSc9443tRMesWc6JTzu
 ibMWW3KHc6MMp1A7b5/AOf7X2HGAAAA
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

This patch applies to the for-7.4 branch of the regulator tree, which
has the earlier fixes to this driver.
---
 drivers/regulator/mt6363-regulator.c | 41 ++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index e6c4bd851fef..8ade92c59864 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -12,6 +12,7 @@
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
@@ -114,6 +115,8 @@ struct mt6363_regulator_info {
 	int virq;
 };
 
+static DEFINE_MUTEX(mt6363_buck_top_lock);
+
 #define MT6363_BUCK(match, vreg, min, max, step, en_reg, lp_reg,	\
 		    mset_reg, ocp_intn)					\
 [MT6363_ID_##vreg] = {							\
@@ -388,6 +391,23 @@ static int mt6363_buck_unlock(struct regmap *map, bool unlock)
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
@@ -400,13 +420,9 @@ static int mt6363_regulator_set_mode(struct regulator_dev *rdev,
 
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
@@ -416,13 +432,8 @@ static int mt6363_regulator_set_mode(struct regulator_dev *rdev,
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
@@ -508,6 +519,8 @@ static int mt6363_va15_set_voltage_sel(struct regulator_dev *rdev, unsigned int
 	struct regmap *regmap = rdev->regmap;
 	int ret;
 
+	guard(mutex)(&mt6363_buck_top_lock);
+
 	ret = mt6363_buck_unlock(regmap, true);
 	if (ret)
 		return ret;

---
base-commit: 7904338c38426d72c5f7cd9402cb9a20232a7af5
change-id: 20261105-rgp-91-mt6363-key-lock-67b5992de5a8

Best regards,
--  
Alexandre Mergnat <amergnat@baylibre.com>

