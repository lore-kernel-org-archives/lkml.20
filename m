Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B54CE69C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405086; cv=none; b=SXNTyoOrbWx15ag1B1N7rtt+aLpPrsbKcJBV5ILb/voidPIqiqNLJgJ9pMdZdQiFyNeIYH48ldK034GmE1xP1DqRi/Lf8EQGC0QPee1mmafrNhOnUXaYtTlAL3A+5aZfTnZmzgHj+wp1DT9P509qSKuQvQk+bqVT4nb/zU3KNHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405086; c=relaxed/simple;
	bh=G8WQk7o1DoIkcj/cwqNdwxo9i1kF78La7EvD0bsoIxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J91XQ4h4DRkvSU36PSoekTa5g0hpeUPp3VTsvCiC2Ktnq1ROf/sspbHXBJl/0Tv+/6rnFQoiNALIZ5l961mTtOzK4u45NdOkUEKxT7dL0ts2RMhX8Oo+PHLpbb/C3kzdf3TqKfqEPDtPqCbJxBBIabtEDjJZdnccXL5uMwF/oYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWZoCegb; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWZoCegb"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c45111bebso1152319f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405083; x=1793009883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QE9XGJJc4fSv5NK0pBPw7TKpZvBBJTMfX0/e+Q+5Ads=;
        b=nWZoCegb48xBQ1CxFQ5TT4yHFSU6obk6FBh+dijfqRigmRm5vzqB3DIrgN4quBc0Sd
         Qu3Mzb3EC8FSCP7x/srw6b5SJCi6473VMqba6MAOnnUg2cHceUtD+UxmOdJLeVJFUYfM
         YXcDZDccj9sENwJENBvQd5Ix5N6IpUioAMsYgSostL5Y85wDFWl9y+CtHhmcdxsBgza5
         wpkHp9rKFgzaMHWVJSPNX1TA32dWuSO7wr7vxPLNVfjBvax8GUKvVdRI01yZD/tVn918
         NSX7hluAHKZBN94aqnvDx5XDqObn2YYBlUYM8bRX347CRqwWEdEogd9XO8Xm6sWA12Zc
         aP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405083; x=1793009883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QE9XGJJc4fSv5NK0pBPw7TKpZvBBJTMfX0/e+Q+5Ads=;
        b=M5vctjaBaW5S/dmR0b1zmnfs65wCzC+wvqpO/H6Q+8ie4JJPaXDsAHk9uxIPJbM9KW
         GMFBEajjezDwBgeVX4avCgMRjLKT6yDOEIgDJW1u/vkRJ5TpDOqqCLcNosAsvfNRCoBD
         Ap4laKd08scd9eH1KK8/yJbTo4sqJGX9OGNuO3uyTll0+AXrNikbb/ASG0fEojLtef9n
         VSKMhdf6B2+F8V56loqBwfwb8pykWsqxYLHykoxtUjqN5SOaZtbkdnF36vI2WX6PnZzx
         w784vl++frHRfhmyadPtQxsXMHGIuDqyBL2EybImaaaVb6h2I+Yzw+SCNw4vClYufevy
         X/Vg==
X-Gm-Message-State: AFq9FYJFusGmXhB38bUOWE1vm4RTXJTYQM1ounqxomHF9nf3eB6heqxf
	FIod2J9HgRxFfDbTP8x6u/0qnO0lmQ3yoiz38H9mv6LgAqXwV4H1xnEp
X-Gm-Gg: AYBFou3T0lc+hZ6+d1GArh2Eiv50lTP98hdLMZdk/LSZ4gHrDn+sARjkrXL/nLF3mxS
	uRVVerClh06MRd96upZLV+AYdPJM6y08vHvqntg8I8WYSKDGJ6LZe0ZZ9cd8Rkr4Bm5qQYa7s8K
	sTkkLfvtqbaQ86YVhYKOwG1UZHd/uTM5YhKVfNlTohiJccAo123zRMgDrgtrbtjJotRmao7IZ4a
	b0n5Qp1yG+TG2nT0PxDKzPgEyP6MGYn1NNJQycIrK55GPmoQtQjL7ml/1d8PjrBOQw3U3QSl1Nv
	Mou/uJO1GbaB7AitlGrGdx9LCKSJzplPSbZs6gjx7oNDmp699vk1Zg0xXsbwvkwwVeDyyVsfdCF
	Iz0nPWA9RuCfDEbA+Di6x517DxpCX2ayLzB69oPzSoVYlluSeHr+v4PSp0Wk+6QFrLh4qhP2fXr
	Fnljw/X11/Q//E1RyoJidamNEL8Y5M8xxXHOTZnOTkUTW/ECDNhH3vlwjSGwt8Foo3bMEPWMgqc
	2z+KENAXeEz6wBmXJ8=
X-Received: by 2002:adf:f606:0:b0:48d:f4ea:49c9 with SMTP id ffacd0b85a97d-48e07fe70aemr11254977f8f.54.1792405083227;
        Mon, 19 Oct 2026 03:18:03 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm23913237f8f.32.2026.10.19.03.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:18:02 -0700 (PDT)
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
Subject: [PATCH v3 2/4] mfd: max8907: Remove platform_data based probing
Date: Mon, 19 Oct 2026 13:17:48 +0300
Message-ID: <20261019101750.125439-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019101750.125439-1-clamor95@gmail.com>
References: <20261019101750.125439-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no in-tree users of this driver, but it supports devicetree
based probing, which means external dtb files may exist that work with
this.

Remove the unused legacy code and make this a DT-only driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c                 |  8 +-------
 drivers/regulator/max8907-regulator.c | 11 +++++------
 include/linux/mfd/max8907.h           |  5 -----
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 7bac1d6517717..363ac80c0593b 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -184,13 +184,7 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct max8907 *max8907;
 	int ret;
-	struct max8907_platform_data *pdata = dev_get_platdata(&i2c->dev);
-	bool pm_off = false;
-
-	if (pdata)
-		pm_off = pdata->pm_off;
-	else if (i2c->dev.of_node)
-		pm_off = of_property_read_bool(i2c->dev.of_node,
+	bool pm_off = of_property_read_bool(i2c->dev.of_node,
 					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc(&i2c->dev, sizeof(struct max8907), GFP_KERNEL);
diff --git a/drivers/regulator/max8907-regulator.c b/drivers/regulator/max8907-regulator.c
index e59aa7a3ee546..521825c0adc07 100644
--- a/drivers/regulator/max8907-regulator.c
+++ b/drivers/regulator/max8907-regulator.c
@@ -274,7 +274,6 @@ static inline struct device_node *match_of_node(int index)
 static int max8907_regulator_probe(struct platform_device *pdev)
 {
 	struct max8907 *max8907 = dev_get_drvdata(pdev->dev.parent);
-	struct max8907_platform_data *pdata = dev_get_platdata(max8907->dev);
 	int ret;
 	struct max8907_regulator *pmic;
 	unsigned int val;
@@ -312,10 +311,9 @@ static int max8907_regulator_probe(struct platform_device *pdev)
 		struct regulator_dev *rdev;
 
 		config.dev = pdev->dev.parent;
-		if (pdata)
-			idata = pdata->init_data[i];
-		else
-			idata = match_init_data(i);
+
+		idata = match_init_data(i);
+
 		config.init_data = idata;
 		config.driver_data = pmic;
 		config.regmap = max8907->regmap_gen;
@@ -331,7 +329,8 @@ static int max8907_regulator_probe(struct platform_device *pdev)
 		case MAX8907_BBAT:
 		case MAX8907_SDBY:
 		case MAX8907_VRTC:
-			idata->supply_regulator = mbatt_rail_name;
+			if (idata)
+				idata->supply_regulator = mbatt_rail_name;
 			break;
 		}
 
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index 4be3c2370e2a4..e222250f0cc1e 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -227,11 +227,6 @@ enum {
 	MAX8907_IRQ_RTC_ALARM0,
 };
 
-struct max8907_platform_data {
-	struct regulator_init_data *init_data[MAX8907_NUM_REGULATORS];
-	bool pm_off;
-};
-
 struct regmap_irq_chips_data;
 
 struct max8907 {
-- 
2.53.0

