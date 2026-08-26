Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD10541DE19
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750546; cv=none; b=QN0V4/96hwZvWyMNzvzt4YMnaVmITHHmaxzy0j3Y9C1uNvOnFxG09qQG3HYvdufojk9UJf0Sw3SWYDPcAhGk6+PqK/JreRQFeM9kYmWSbsvKE6krZyLaiUEqZC61lA8TYn6JhQgedsmv0YBRxD9wwI0/Qoh/oR2/3Nodk5PZxLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750546; c=relaxed/simple;
	bh=TfRLd5l9OOostsSkUsmGRYqtZsyco1P25dGKTsbgTZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYOkY17uQG2ILbir2lIt7ezNokpO/V2a3e79r7dIdBuxarajiYbcnhjCOKwV9PQ9Id96sbR2lhhEUQG0Z3NDiGE6nVX3iJZKB05RDrMGi2pTMws6raCG8/3ixj8IaOiI6kOHlBphFeY9aArKt4ScLG+awFhyPP0vh3jhdzYm4RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxugNdPf; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxugNdPf"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so115917266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750542; x=1788355342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykbfK96z/RlPNdWy0bK0lNcVhnXAIGj1ew3ivLknti8=;
        b=NxugNdPfB+1BZuVt7Yfeam5TJ+fW84LiJ8L/9j/9fGvkd25TiVXKviOwN/tYOW6Yi4
         d36a99WwiNWO5qChJ9YdS4Humt/VVMjOoH2hByRewSsB1Cnb+lZnCB46p7qNwDoWSDn8
         MAvR16FTcdNyAKBnIEMfUSi52z2AOHZKVZxrgp7DaiSh5f6w5mIK6r/sRp1eYtwvVwgs
         ZUxJzui2RnAlD+SVnVHbKfJSSbF6qMXCIjDhqiue4KVkp/CdNJTXOclI/6R+5D5V2Cdn
         i3X1gM6w3uGdV9a0uyNRTp7g7mAzu3xPRBss771wihRfS6wUIu419fAOqi0c/+vAzKnA
         tYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750542; x=1788355342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ykbfK96z/RlPNdWy0bK0lNcVhnXAIGj1ew3ivLknti8=;
        b=hIk1WNca4tpUbSpGQBCJL9NJS3vitOCWOQXjxXTbsRv5J16v1nfF/8NAqJ096GmcmW
         HhBIIM8GunffUFP1pMzUhf9h6SmGXp3DDGaG0SRVCVyHm0/Tl/52lkqTFoWbO921oGp+
         Uv/0QM/TVLhavxFfodTQqRci65OJxm3dveaBzcYOiKcBF4FoyLT2qyOQ68lxCwrgQ4Fy
         2gBlcdlr7+M2Qz8Uda2C4aWSkefLfyBYsZeII0JA2YYCsiupr2XYOxdGjjd9BYQU7tTd
         vzfIh9pxeHB/U01bSdw4r1uDSQGo+riLR02Z0e7ZByT0Mp/km0jNOIK8Rv+skvfomQzm
         yq7g==
X-Forwarded-Encrypted: i=1; AHgh+RodgvGX5hBiW1/E4ksXiiRnjTQWBZZspNDAUgAb9RBrFLbYkmc//5q6EkWoXAM0XUSaKuHfW/Jo0sPGO4I=@vger.kernel.org
X-Gm-Message-State: AFuF++lhrys9GZBg2XP/H1hCPd7kqQ9WTgYH9wS9HuuwH9iWNzGA38We
	V570c136TgRK3nynmUvayhyDHKx7xSjuQjkwIPPm4RUw21UhWV+dRV9zTM8906X9
X-Gm-Gg: AR+sD11//lSaKmxS6hX7StsKkPleqelP5mApHxfvXCbOMGxeYCTPhfftjjmdGjBIQiZ
	V1s88KKUPkNwXD/p7kHYyW4wggjPpn22fELwtlg2i7zfQpUSIx5qx9yZHc/tA03N00Nq62zlf/s
	k3o42MlEndjQd0t1ti4osrQjfT0CqcZYtKn7sPe9+OHzoSJjXdijn5ZYE+PqNPoq2zBUqbCqHsz
	shF+OCFb5C+W6cjCdGCiqWBwAR1B2hLhapBZJLImXNw3vKqsv3U8OxSm28Df83UWzRFfk5EAQfS
	jBii170CnKIk5YXPbHu8OgP64wOe77rM1bA679C5x3OUSUgDyj/OAxntP2Ow3MfUr6sp1nygi7u
	jpoKW8EO8D7OujZL/OPEKeTJkzmid9DoqmRL7hl+90vl7UPuvkTqD4nQCYTVjxtF+GKFZqqXHGD
	cBqO7BVBb7/KqMkge8vFAgnRINg7zM7teguRAAl2+4JpcEmISDKwIK8icd8ugp6qdPZZ4ZwcgpB
	AjAMCQw0cv0M/raiY6J3lqEbYtzR5BT0Z5SYtlSkK8=
X-Received: by 2002:a17:906:ba83:b0:c25:544:3aec with SMTP id a640c23a62f3a-c250baf9b5amr980895766b.5.1787750541405;
        Wed, 26 Aug 2026 06:22:21 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a72d6dbsm435905466b.24.2026.08.26.06.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:22:20 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 1/2] Input: drv260x: Make vbat supply optional
Date: Wed, 26 Aug 2026 15:22:10 +0200
Message-ID: <20260826132211.3341936-2-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132211.3341936-1-mauriziocasciano7@gmail.com>
References: <20260826132211.3341936-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91L firmware instantiates two DRV2604
ACPI devices, but does not describe a software-controllable vbat supply
for either device. The generic regulator lookup therefore creates a
dummy supply.

Use the optional regulator lookup and skip regulator operations when no
supply is described. Systems which provide vbat retain the existing
enable, managed-disable, suspend, resume, and error-unwind behavior.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/input/misc/drv260x.c | 57 +++++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/input/misc/drv260x.c b/drivers/input/misc/drv260x.c
index 6c5c4c53753b..c4fbb10b254e 100644
--- a/drivers/input/misc/drv260x.c
+++ b/drivers/input/misc/drv260x.c
@@ -499,22 +499,26 @@ static int drv260x_probe(struct i2c_client *client)
 	haptics->overdrive_voltage = error ? DRV260X_DEF_OD_CLAMP_VOLT :
 					     drv260x_calculate_voltage(voltage);
 
-	haptics->regulator = devm_regulator_get(dev, "vbat");
+	haptics->regulator = devm_regulator_get_optional(dev, "vbat");
 	if (IS_ERR(haptics->regulator)) {
-		error = PTR_ERR(haptics->regulator);
-		dev_err(dev, "unable to get regulator, error: %d\n", error);
-		return error;
+		if (PTR_ERR(haptics->regulator) == -ENODEV) {
+			haptics->regulator = NULL;
+			dev_dbg(dev, "No vbat regulator found\n");
+		} else {
+			error = PTR_ERR(haptics->regulator);
+			return dev_err_probe(dev, error, "Unable to get vbat regulator\n");
+		}
 	}
 
-	error = regulator_enable(haptics->regulator);
-	if (error) {
-		dev_err(dev, "Failed to enable regulator: %d\n", error);
-		return error;
-	}
+	if (haptics->regulator) {
+		error = regulator_enable(haptics->regulator);
+		if (error)
+			return dev_err_probe(dev, error, "Failed to enable regulator\n");
 
-	error = devm_add_action_or_reset(dev, drv260x_power_off, haptics);
-	if (error)
-		return error;
+		error = devm_add_action_or_reset(dev, drv260x_power_off, haptics);
+		if (error)
+			return error;
+	}
 
 	haptics->enable_gpio = devm_gpiod_get_optional(dev, "enable",
 						       GPIOD_OUT_HIGH);
@@ -585,13 +589,15 @@ static int drv260x_suspend(struct device *dev)
 
 		gpiod_set_value(haptics->enable_gpio, 0);
 
-		error = regulator_disable(haptics->regulator);
-		if (error) {
-			dev_err(dev, "Failed to disable regulator\n");
-			regmap_update_bits(haptics->regmap,
-					   DRV260X_MODE,
-					   DRV260X_STANDBY_MASK, 0);
-			return error;
+		if (haptics->regulator) {
+			error = regulator_disable(haptics->regulator);
+			if (error) {
+				dev_err(dev, "Failed to disable regulator\n");
+				regmap_update_bits(haptics->regmap,
+						   DRV260X_MODE,
+						   DRV260X_STANDBY_MASK, 0);
+				return error;
+			}
 		}
 	}
 
@@ -606,10 +612,12 @@ static int drv260x_resume(struct device *dev)
 	guard(mutex)(&haptics->input_dev->mutex);
 
 	if (input_device_enabled(haptics->input_dev)) {
-		error = regulator_enable(haptics->regulator);
-		if (error) {
-			dev_err(dev, "Failed to enable regulator\n");
-			return error;
+		if (haptics->regulator) {
+			error = regulator_enable(haptics->regulator);
+			if (error) {
+				dev_err(dev, "Failed to enable regulator\n");
+				return error;
+			}
 		}
 
 		error = regmap_update_bits(haptics->regmap,
@@ -617,7 +625,8 @@ static int drv260x_resume(struct device *dev)
 					   DRV260X_STANDBY_MASK, 0);
 		if (error) {
 			dev_err(dev, "Failed to unset standby mode\n");
-			regulator_disable(haptics->regulator);
+			if (haptics->regulator)
+				regulator_disable(haptics->regulator);
 			return error;
 		}
 
-- 
2.53.0

