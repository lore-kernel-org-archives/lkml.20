Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A91C49EC53
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301493; cv=none; b=tmjuja7p0HMfF90Cnf1mN+6POH6klNfWl3tv1oaHgRW6zQ3a+yei9+H1oTExEePa+vYMig39Zj/n4KoPSsMc6LnXGMrCCFa8fORhc4DOhG0iErpz2tSjWyNTxj2heyAXKbV1D/xdLUM+NboPxi/dsDPpd/0oZb3utRL4AH0UxTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301493; c=relaxed/simple;
	bh=IilKprHN+dkOEjDRUlnznoimt/1NPDWwCTswIfyM704=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZI3vqo3gnZ1Y97d2rNBGos/nx+jK8j72vv8slXfNBsszt2plK3ZmyMm1YAZPYNj5UTnU1+fK874WL5aTE+Usw/jHQmBl6iFhV2qypoxkSdzqMYFlXKk6s/JOYax/Olvs7savwoD/34n/FI9pCQaggShQA3xiDOzl9uPcnQt2yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n26Qk0P4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n26Qk0P4"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b042c0759so755897f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301488; x=1791906288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEOhgVr/F+JRU2d8CsY4syExbw/P/EYoR8Pl4QIjlT8=;
        b=n26Qk0P4oKn4LubVE37xXeLcDaQSEjJxd5X+mrrBGWp+kNC/ONMVn5l7aoL9DoVzq5
         jJJNuwn2meyGDDAuuLHBVQ6/zxL2mT2sW+XHdekSC17arsPXJFULtD6hAI6f+76tdUxx
         hVnS7GOYOOBIErcKYhmdNadCwVrqL3Ebe+XC8HIVbGrLgzpmGkpKTKQPIWCn8tB27gbv
         tVkZcuYDoOZsQXLp+vFG8FJEVWODCizLS+1Z7+/orRvr4jIh/Dlitk4v+hrk7kYBKSwo
         aHoGjIGmcqOAIpgemZ8ibM++TYvbwc1sdT5X6j7gnZfyufiIv2fNLMD9aU+VdDbfkeuK
         iV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301488; x=1791906288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEOhgVr/F+JRU2d8CsY4syExbw/P/EYoR8Pl4QIjlT8=;
        b=fD93S2BdQmcpwWEtRiNLNw/L36557uqT8UYc08mMLMaJcONYJIs5N5pkxJEz6/evXb
         uWRV/tkA96cMIipCM5GVuQrPV/RcQ/iTbjXzjke/3xq8+dpPNuia97v1ThWE9ZzWW4mb
         ARjaBMVjwAdwED9e6P9OKeEq3fxECCGRgaRaMQ7kIPZJo/aXbpmIQUwx5cQwwzbCg5A8
         DQWx4EKxF1QStdd/b8Qe9e9tc9cT35SCvJIYqrG5zmRkQP4TDgxtguCK2g03+1J5+kmw
         UYeyT3cbF9qIUjD3vs9vm4JUls2OQjDKBB9hbgAwGyv9Go/l5n2yvRZtrRIDqGiS3mjB
         KEUw==
X-Gm-Message-State: AFq9FYKOjtPVET7rPDnKXLIRyJ40PvPcqnD50aDf1SiDGMlwQQaHS9vG
	Yd0UDLHu2k+rdkd2hQNyU8cI9nSWpvxn48JPeUmNxGbgRCMoMhEIE+lZ
X-Gm-Gg: AYBFou0aTspATuJV34fIj3/GAdF2/kl8afFQnOtcnAXcCR1VCZU5ZyPGLciM26jKscX
	3Q5WVaj9LfleqxOm1dLzFVcI9+ZigxP8RNTBeJx1+WGSqoIkGw6n0ZuR4EDL8ZRqQvodPXFjsit
	WNcWZMCsINdHK/OmeFyIamodaY4hlrU3CYyhjaufEjURO4S50vPrVo0vKz9IjDcgZuWaWm5Dydz
	s9ySjpg1U7UzOmeP1vYETsgqEKVikHfPb3Db3icbvSgS7C85SKUhT5aRQEpqFly9395Nz93/YfL
	2ntuW6naIuwY7p1qdWb0XQQjYtR7ZtEwtuU+wiAty8hQz5aJvivwXsen8b0N82t4Ym0kNdA7Ryw
	MiA4HwXy8i0PzV9HbF/Ihp2GizzQgOTXH1vUnPHZ0ku3mq9Mc3fyHRseaZb9l7XIjJ01kFkKxtc
	yTdBAX8HYz7FM0ayC1Qt8DfgKms6PQLGKbkvkeSfupd3R/L5LGg1cP0VM9BfKHv3WuM+ai4EYMT
	JTQGEBG1BFJLRuqDl/AVWB5/Ms1fw==
X-Received: by 2002:a05:6000:1acf:b0:48b:e54:84a1 with SMTP id ffacd0b85a97d-48c6d1b4cd1mr3391952f8f.55.1791301486877;
        Tue, 06 Oct 2026 08:44:46 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b6e6sm327615f8f.14.2026.10.06.08.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:44:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 4/7] regulator: lp872x: Remove redundant regmap wrappers
Date: Tue,  6 Oct 2026 18:44:28 +0300
Message-ID: <20261006154431.318936-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006154431.318936-1-clamor95@gmail.com>
References: <20261006154431.318936-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove lp872x_read_byte(), lp872x_write_byte(), and lp872x_update_bits()
helpers which are just wrappers around the same regmap helpers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/regulator/lp872x.c | 66 ++++++++++++--------------------------
 1 file changed, 20 insertions(+), 46 deletions(-)

diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
index 13dce4dcdbe14..1e16d7e8361a0 100644
--- a/drivers/regulator/lp872x.c
+++ b/drivers/regulator/lp872x.c
@@ -204,36 +204,10 @@ static const unsigned int lp8725_buck_uA[] = {
 	460000, 780000, 1050000, 1370000,
 };
 
-static int lp872x_read_byte(struct lp872x *lp, u8 addr, u8 *data)
-{
-	int ret;
-	unsigned int val;
-
-	ret = regmap_read(lp->regmap, addr, &val);
-	if (ret < 0) {
-		dev_err(lp->dev, "failed to read 0x%.2x\n", addr);
-		return ret;
-	}
-
-	*data = (u8)val;
-	return 0;
-}
-
-static inline int lp872x_write_byte(struct lp872x *lp, u8 addr, u8 data)
-{
-	return regmap_write(lp->regmap, addr, data);
-}
-
-static inline int lp872x_update_bits(struct lp872x *lp, u8 addr,
-				unsigned int mask, u8 data)
-{
-	return regmap_update_bits(lp->regmap, addr, mask, data);
-}
-
 static int lp872x_get_timestep_usec(struct lp872x *lp)
 {
 	enum lp872x_id chip = lp->chipid;
-	u8 val, mask, shift;
+	u32 val, mask, shift;
 	int *time_usec, size, ret;
 	int lp8720_time_usec[] = { 25, 50 };
 	int lp8725_time_usec[] = { 32, 64, 128, 256 };
@@ -255,7 +229,7 @@ static int lp872x_get_timestep_usec(struct lp872x *lp)
 		return -EINVAL;
 	}
 
-	ret = lp872x_read_byte(lp, LP872X_GENERAL_CFG, &val);
+	ret = regmap_read(lp->regmap, LP872X_GENERAL_CFG, &val);
 	if (ret)
 		return ret;
 
@@ -272,7 +246,7 @@ static int lp872x_regulator_enable_time(struct regulator_dev *rdev)
 	enum lp872x_regulator_id rid = rdev_get_id(rdev);
 	int time_step_us = lp872x_get_timestep_usec(lp);
 	int ret;
-	u8 addr, val;
+	u32 addr, val;
 
 	if (time_step_us < 0)
 		return time_step_us;
@@ -291,7 +265,7 @@ static int lp872x_regulator_enable_time(struct regulator_dev *rdev)
 		return -EINVAL;
 	}
 
-	ret = lp872x_read_byte(lp, addr, &val);
+	ret = regmap_read(lp->regmap, addr, &val);
 	if (ret)
 		return ret;
 
@@ -313,9 +287,9 @@ static void lp872x_set_dvs(struct lp872x *lp, enum lp872x_dvs_sel dvs_sel,
 static u8 lp872x_select_buck_vout_addr(struct lp872x *lp,
 				enum lp872x_regulator_id buck)
 {
-	u8 val, addr;
+	u32 val, addr;
 
-	if (lp872x_read_byte(lp, LP872X_GENERAL_CFG, &val))
+	if (regmap_read(lp->regmap, LP872X_GENERAL_CFG, &val))
 		return 0;
 
 	switch (buck) {
@@ -324,7 +298,7 @@ static u8 lp872x_select_buck_vout_addr(struct lp872x *lp,
 			addr = (lp->dvs_pin == GPIOD_OUT_HIGH) ?
 				LP8720_BUCK_VOUT1 : LP8720_BUCK_VOUT2;
 		} else {
-			if (lp872x_read_byte(lp, LP8720_ENABLE, &val))
+			if (regmap_read(lp->regmap, LP8720_ENABLE, &val))
 				return 0;
 
 			addr = val & LP8720_DVS_SEL_M ?
@@ -369,7 +343,7 @@ static int lp872x_buck_set_voltage_sel(struct regulator_dev *rdev,
 {
 	struct lp872x *lp = rdev_get_drvdata(rdev);
 	enum lp872x_regulator_id buck = rdev_get_id(rdev);
-	u8 addr, mask = LP872X_VOUT_M;
+	u32 addr, mask = LP872X_VOUT_M;
 	struct lp872x_dvs *dvs = lp->pdata ? lp->pdata->dvs : NULL;
 
 	if (dvs && dvs->gpio)
@@ -379,21 +353,21 @@ static int lp872x_buck_set_voltage_sel(struct regulator_dev *rdev,
 	if (!lp872x_is_valid_buck_addr(addr))
 		return -EINVAL;
 
-	return lp872x_update_bits(lp, addr, mask, selector);
+	return regmap_update_bits(lp->regmap, addr, mask, selector);
 }
 
 static int lp872x_buck_get_voltage_sel(struct regulator_dev *rdev)
 {
 	struct lp872x *lp = rdev_get_drvdata(rdev);
 	enum lp872x_regulator_id buck = rdev_get_id(rdev);
-	u8 addr, val;
+	u32 addr, val;
 	int ret;
 
 	addr = lp872x_select_buck_vout_addr(lp, buck);
 	if (!lp872x_is_valid_buck_addr(addr))
 		return -EINVAL;
 
-	ret = lp872x_read_byte(lp, addr, &val);
+	ret = regmap_read(lp->regmap, addr, &val);
 	if (ret)
 		return ret;
 
@@ -404,7 +378,7 @@ static int lp872x_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
 {
 	struct lp872x *lp = rdev_get_drvdata(rdev);
 	enum lp872x_regulator_id buck = rdev_get_id(rdev);
-	u8 addr, mask, shift, val;
+	u32 addr, mask, shift, val;
 
 	switch (buck) {
 	case LP8720_ID_BUCK:
@@ -433,14 +407,14 @@ static int lp872x_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
 	else
 		return -EINVAL;
 
-	return lp872x_update_bits(lp, addr, mask, val);
+	return regmap_update_bits(lp->regmap, addr, mask, val);
 }
 
 static unsigned int lp872x_buck_get_mode(struct regulator_dev *rdev)
 {
 	struct lp872x *lp = rdev_get_drvdata(rdev);
 	enum lp872x_regulator_id buck = rdev_get_id(rdev);
-	u8 addr, mask, val;
+	u32 addr, mask, val;
 	int ret;
 
 	switch (buck) {
@@ -460,7 +434,7 @@ static unsigned int lp872x_buck_get_mode(struct regulator_dev *rdev)
 		return -EINVAL;
 	}
 
-	ret = lp872x_read_byte(lp, addr, &val);
+	ret = regmap_read(lp->regmap, addr, &val);
 	if (ret)
 		return ret;
 
@@ -728,8 +702,8 @@ static int lp872x_init_dvs(struct lp872x *lp)
 {
 	struct lp872x_dvs *dvs = lp->pdata ? lp->pdata->dvs : NULL;
 	enum gpiod_flags pinstate;
-	u8 mask[] = { LP8720_EXT_DVS_M, LP8725_DVS1_M | LP8725_DVS2_M };
-	u8 default_dvs_mode[] = { LP8720_DEFAULT_DVS, LP8725_DEFAULT_DVS };
+	u32 mask[] = { LP8720_EXT_DVS_M, LP8725_DVS1_M | LP8725_DVS2_M };
+	u32 default_dvs_mode[] = { LP8720_DEFAULT_DVS, LP8725_DEFAULT_DVS };
 
 	if (!dvs)
 		goto set_default_dvs_mode;
@@ -750,8 +724,8 @@ static int lp872x_init_dvs(struct lp872x *lp)
 	return 0;
 
 set_default_dvs_mode:
-	return lp872x_update_bits(lp, LP872X_GENERAL_CFG, mask[lp->chipid],
-				default_dvs_mode[lp->chipid]);
+	return regmap_update_bits(lp->regmap, LP872X_GENERAL_CFG, mask[lp->chipid],
+				  default_dvs_mode[lp->chipid]);
 }
 
 static int lp872x_hw_enable(struct lp872x *lp)
@@ -786,7 +760,7 @@ static int lp872x_config(struct lp872x *lp)
 	if (!pdata || !pdata->update_config)
 		goto init_dvs;
 
-	ret = lp872x_write_byte(lp, LP872X_GENERAL_CFG, pdata->general_config);
+	ret = regmap_write(lp->regmap, LP872X_GENERAL_CFG, pdata->general_config);
 	if (ret)
 		return ret;
 
-- 
2.53.0

