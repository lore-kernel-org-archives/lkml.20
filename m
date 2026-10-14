Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4764E36D6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980170; cv=none; b=qY7zDWQKNFnQTb28t4Od/MQ0HplFelEuE29zVnvjvn7fVwcVwSdHZHWGDVuztAS8c9X+f8USEX5DUasecdxxD7CGNStZXTSwTNQtKfGuZ9gHzVPF9vSjmWJ2pGZAD+Wf76kr7N4GSVMexYjOqc4Or8f5cRDI2z707YGtjWXoZg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980170; c=relaxed/simple;
	bh=KQQfKGP3gaA4IHCfke4mkG2Sh9hJChUtdoHtqWoQYAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5r1aYE+Ef6eGszZUL61d1CEONX+yP+YWPCwyW4moPmdHy9dYdhRu64WI0ttDCKjl0gdd5tIX0uEbz+X/O6TAKPkwTqQHMB6FI8ComX4W2LTbTySgD/Q1RpqV3r9Lvpf3Tve9Q0kylP4rpAQWzEy+O3bJh+NS514o2KUHHWXWrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrahaQjD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrahaQjD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48bbb06e746so261552f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791980166; x=1792584966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcXAqkrX5GplF7FfZE4ZaylSycLQ0FQ8MQuX8DWBiwI=;
        b=mrahaQjDFUe26VZZD1iMlfxvrcTpPxTeIx9DrEMnyIQEFnrQkS27fRIwOs25nTq+Qz
         JK2bxB8s7NcU8Pe/iNu8G+2ecBfxmJU3i4subXYguzv6SQUZUm+Aakjjciq+xHB7R+YV
         jMKDNAuWpUkeTSl0kq9RwPQkvg+TGJ0r+EdricCJ1cUq1dDGWUsnb4AATOn6JZPooZwL
         jgeTnWmsT8wWCSR9Ia2HZfPasPbSrRM2KU78nQ7Gk5aFVrYjlnDJHE7WL/2fOnhPQjht
         0LvKJqPOERHonnykFC5CzrxuP3Zn9CgR+SReXy5IzmSBm3hIH8ZIc3+O5aymoXlprh2J
         +eUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980167; x=1792584967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcXAqkrX5GplF7FfZE4ZaylSycLQ0FQ8MQuX8DWBiwI=;
        b=QvIl/MPevNLIaCH9qKw2/j3yp3BawebunwMozExrd2RqN3sF8JiC0+kqgcpYZcS43a
         xCUPoDG2Y/IJrgZJe3SujF7IjhfoM0lAiBgR9TFHYLyUPmdcj91x73kfjBRi2hdMbAjU
         0Le90Uwv/Hg1nNngSs3nQ7S9GJnATJG9SEs871KmVZdFQix48fYrPYQnwPtdOaIeSbcm
         iXsWEY8vWskQbcKIEhvt02R1WCBXQ2Y9or/rO8nbewgQcqMHrpUL8YJgJxLFreWgs9rB
         mQIkYdj5+olsLZPuSzDRQUjl21DTC4L6DICm/4Lu+jqHFQ0BOzQH0OtJ6Pf7fIjnGWTZ
         gSgQ==
X-Gm-Message-State: AFq9FYJYov5/t9aPrlDrStTcW/JM0wbuwMTdAHcgiPKZ4+SOwIyY4ozF
	n5G+5Pl3bCR/HTmdAg0fMhsVJjAs3krkFmC1iALaSIlHgIHLPWGzvBvM
X-Gm-Gg: AYBFou2i4EXNao9AT9MQETPMOwKhkXGXzFfOQeWjOCv9PXJDcuVuNYnyxN/ECtdXcvM
	aCQbTCKQ+MfW3X+nf7HXIK7VxdM3Xn9USS/Ja3pUF7T+qa1hjiPJhQRFRy5qmt9B96/M2yDPTjR
	AhUGSLI1Ze/K+f4SuZ4P7amr3JPSWAVzg6kZOREUo9jlf3KQAV+sZtSvcdFEKgSQ3gpC7BWlKRi
	K+zLZSoWIu7aC1J7L88gEVVUzj905MMkYd18XRNo6DrBTudgHcIFASl9xe15Ma5aQ8jycqDgnAc
	Cg8EaQQJofe1RtaE8A0DU2keVp33xbWHPu8haXTC4fb9Jvhb4+/j8iHRY78tA6xC7Y/vlI+ErlX
	Tdg/1eFamIV4l55FXoLEQVrwhCWbtCrQcDc8UySg+s+2ETZbe0u+gBgxE+A5k44DIttbOhR9F42
	cumzvRegG1BEzblQYrp/sgdBRdh9HBPSeIdBhP6xSOXVDdOc1LKqH6TBo5+kuouHM8KL+ZwQQMh
	jJv7CQNj0EIWDB2Z0Y=
X-Received: by 2002:a05:6000:11c3:b0:48a:f404:695e with SMTP id ffacd0b85a97d-48dbaaed106mr22506007f8f.50.1791980166578;
        Wed, 14 Oct 2026 05:16:06 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm11006660f8f.36.2026.10.14.05.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:16:05 -0700 (PDT)
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
Subject: [PATCH v2 3/3 RESEND] mfd: max8907: Convert to use device managed poweroff handler
Date: Wed, 14 Oct 2026 15:15:44 +0300
Message-ID: <20261014121544.138958-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014121544.138958-1-clamor95@gmail.com>
References: <20261014121544.138958-1-clamor95@gmail.com>
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
 drivers/mfd/max8907.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 363ac80c0593b..9c40f0551a8ce 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -15,6 +15,7 @@
 #include <linux/mfd/max8907.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -173,19 +174,23 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
-static struct max8907 *max8907_pm_off;
-static void max8907_power_off(void)
+static int max8907_power_off(struct sys_off_data *data)
 {
-	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
-			MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	struct max8907 *max8907 = data->cb_data;
+	int ret;
+
+	ret = regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+				 MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	if (ret)
+		dev_err(max8907->dev, "failed to restart device!\n");
+
+	return NOTIFY_DONE;
 }
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(i2c->dev.of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc(&i2c->dev, sizeof(struct max8907), GFP_KERNEL);
 	if (!max8907) {
@@ -204,6 +209,16 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
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
@@ -250,11 +265,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
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

