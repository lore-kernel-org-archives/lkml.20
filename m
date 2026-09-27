Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7593E0C67
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790524694; cv=none; b=tVI1C1fLENCbzhp0cUe4pVoWalABVuHRnXD9YkH5B4Y/wXvTzabnRqaTf/am1HtJcDl6qtmTzvgd5tIMb94qK4DZkf/J3f3c8k2p9N2E6Yey9sy/x0Pk4/SfyWeveCZTE2qQHQnGD4Eq/FjzVn8eh10nKK+Gt5Iv51FTIExjR+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790524694; c=relaxed/simple;
	bh=rBTDTnXA47KWca5ByUBPMKJKcdvVfMOrQhxxEmNQ9lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbxXNEp06PHx1ntc4cYSGwaRcth96DqSu7ILtxaWuwJ4OvRe4ud1DbFzz1R/4Vcq2HWeiXf46ZaUdUqWb+KWgecn+yGBm13QwXCd2iLXM5H13qu7U4zOX7LURtLKGg9IoB4nWtEOiJO/KwPDEg1aCWcA0DRZgDbPY0vd3FUPTKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qqyQjG0q; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqyQjG0q"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so1285553f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790524691; x=1791129491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTn/cHN3s2yPPF9gEgjAzLW+xUByQWmQpTOnwkpxBoc=;
        b=qqyQjG0qE8kzOMU79AvotybwEkHZBHMQQ64X5xp5f3kM8UHGIOsk4DqixWDob49Ykw
         ef5kayX6reybN4Uln5oDL28el7DU03a8N7g/qv6PIsmd23kvhevf3+5KvSgsfQ5XvzX6
         boO3kfF9dE8C1ijXfScF7Lrf/gLQNNKxvwxFu4V5zimblELXGyYfft8nfr5dAe9fdkI3
         pKXfIAm8L2D+qCSXWPsNHNf/FaTsQq/W8xC80hw3WNfOUOa454p+DxlqP5si0UFDgBor
         XPMf3duaQ/9rGKSyLUPAw8554G79p0jSWknbj6/fj6U7pQg8yPRYFx9vrLlHX20F2ROg
         ih1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790524691; x=1791129491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTn/cHN3s2yPPF9gEgjAzLW+xUByQWmQpTOnwkpxBoc=;
        b=KOYUZteUAODpFnSVEN3FAXHknysKuPCvrjLUJ3GE5vr2P6en4GL6PiBys37FPc1e17
         ytRBZFt/gpzdmO1nxjdEiyPzWJpWhA8mexk/rmfUY6+k2MbacJgnb7WXuhAYP8JhpRl+
         RXe4Arw+ZoQelmol5YnAkLMF6xHm+AeQY92JVh2ATcMIE4ursP6n0TGqnoL0jBoJ/EJT
         NGbQdbOJsoDDaKE6YP2999NeJPycSh5Jojs+zS4T6r/7pMcbYaOHmPW4PlW3neMTkZCK
         +NWbFswkKTplyzdN03UWcPOrv0z+a1lppmNicqvgUEhaZ0TPTZ/aVDZxulwGEOPRHF4I
         kcaw==
X-Gm-Message-State: AFuF++lXH4N6eRmUSU8Bo8buv9X9kElXZ+8U61jwWmdivNEvJiGSfEAg
	P/3I2uPpljol0z5xPvz1M0x98Bna+11eCa63JmFoY3RvzO6Y2bEbDiTj
X-Gm-Gg: AYBFou1JgLdtv8ccsINTbwv1R4p6qJ/dPOlCwWiPg1ZrssxbHBm56MOxZiCj8Ka1KOj
	OrXuqwY7axSvdusMguWzA9OlSQLhP80SP50TNQReUE9FdB7Z2LywzKMCJuXXfFnuUDmULuYx1Cg
	6aFCP7LyVDxk4Q72ksJH+LXTIdIr6NDEDFSjLpvMLtm3ep7zmVe8pXYGskBZqDl6oG3G1z8DLVf
	QcA8Mj8zhHX5FHYDUS9yQ5qvjRTxkOYXsN4gSyWSP8vKeH6XD1ZRFEofgmwoKmZNFrNlDPcDHW4
	yHGNzhEZAekeuj16YOnjRutfrNEO7yed7aZ70u1Lma30kypu2TEt0Jn94CeLJ5dM9GLZgKUEwh2
	UGDF4e66AVBOpW2kXfe7LmjwNpYwULl0jYBlrpUY4XDvaIvq6x9n94u85/xwBrMIiZcrVGZ6vIe
	VWKm9oej2JhDrciAbbc9NhgiZGX5YTHoyCoQ4MCp8Dxqb9JcbInJiLm8L3JsoNUR/RHn+BWtbl8
	QQVYrbbSI0d8RwhHlI=
X-Received: by 2002:a05:600c:46d4:b0:49f:ec98:f030 with SMTP id 5b1f17b1804b1-49ff06f839dmr126988445e9.33.1790524691256;
        Sun, 27 Sep 2026 08:58:11 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018dd5easm66708625e9.3.2026.09.27.08.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:58:10 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 3/3] mfd: max8907: Convert to use device managed poweroff handler
Date: Sun, 27 Sep 2026 18:57:44 +0300
Message-ID: <20260927155745.187758-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927155745.187758-1-clamor95@gmail.com>
References: <20260927155745.187758-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the legacy global 'pm_power_off' function pointer assignment with
the devm_register_sys_off_handler() helper.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 363ac80c0593b..0cecb53b62078 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -15,6 +15,7 @@
 #include <linux/mfd/max8907.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -173,19 +174,18 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
-static struct max8907 *max8907_pm_off;
-static void max8907_power_off(void)
+static int max8907_power_off(struct sys_off_data *data)
 {
-	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
-			MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	struct max8907 *max8907 = data->cb_data;
+
+	return regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+				  MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
 }
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(i2c->dev.of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc(&i2c->dev, sizeof(struct max8907), GFP_KERNEL);
 	if (!max8907) {
@@ -204,6 +204,16 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		goto err_regmap_gen;
 	}
 
+	if (device_property_read_bool(&i2c->dev, "system-power-controller") ||
+	    device_property_read_bool(&i2c->dev, "maxim,system-power-controller")) {
+		ret = devm_register_sys_off_handler(&i2c->dev, SYS_OFF_MODE_POWER_OFF,
+						    SYS_OFF_PRIO_DEFAULT,
+						    &max8907_power_off, max8907);
+		if (ret)
+			return dev_err_probe(&i2c->dev, ret,
+					     "failed to register poweroff handler\n");
+	}
+
 	max8907->i2c_rtc = i2c_new_dummy_device(i2c->adapter, MAX8907_RTC_I2C_ADDR);
 	if (IS_ERR(max8907->i2c_rtc)) {
 		ret = PTR_ERR(max8907->i2c_rtc);
@@ -250,11 +260,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		goto err_add_devices;
 	}
 
-	if (pm_off && !pm_power_off) {
-		max8907_pm_off = max8907;
-		pm_power_off = max8907_power_off;
-	}
-
 	return 0;
 
 err_add_devices:
-- 
2.53.0

