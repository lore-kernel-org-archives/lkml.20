Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF2F3DDDCB
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790524693; cv=none; b=QwbciBrVqUhb1iKLIxK3vjMCIs+Rn7x4s2w7HP0HB6/lSoASJ9l+H9wxluQMfBRNN/BR55571vLR/dt/QRyb6t/dFwvFOHHAud9xXls4yCUPUgBXfP/bhuC7pAvoY4vWcm+mOqdIUHStt2CcIttvcrp7Kz4rDrveQFBesxyRV9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790524693; c=relaxed/simple;
	bh=LUJoAfm8d9DBAnqMkyJ1+9asGnatYQIAciuxSlDdENQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Orr1C6SbqyInb6rqB7TbKbG9C9McMArgXRaJDn9Qv/DQ6HjXniHpwfJCSV4r44a6vHVzWak7nqNsiDcBTR/BNMuLDe1/KYxiJzVYQ6S6lEK6NCXOQjNeCGRV9RvO6Iv3+uldN6Ek6aHIjW6W8WXNmY5yDjN3HzFFy4svL1FgY7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUpn+HJr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUpn+HJr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so18362965e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790524690; x=1791129490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBC/FZXgBVy2qPIQx5Do4tZv6p6o386K0itsEb4weH0=;
        b=MUpn+HJrxTjTXUVdQKrVmzq48LhOctOH5L3XBsD7EiyMGeuuKl4T7O71qGohF7j7AY
         iGt3GT/6bFpn2vrnzT/tUND2/Xd1bKrc67816jARX9kiVvEnxcQ0Sem0KLUgQuGizYy8
         VgP+5oOTC5l0KISM1foA5P6B/1xaP81MvRyURAf3saKQcuF3vDj0hRws6nq3L1pvqyWR
         PPHKWVD4E3j2wKc3VvEj3w0oP25h170s9nS1SV820Dm2CmSx5/6SUme9Lu5wKseOep6Y
         3XRr+flqX4ZiDQb4SVUBwNSgZvIqVPX1c19c1T5rgJPXQs5h3T+ywdURv3k0YorSagc9
         eIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790524690; x=1791129490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBC/FZXgBVy2qPIQx5Do4tZv6p6o386K0itsEb4weH0=;
        b=vztEQgMjir6N6jMtdFnNwz+5J8Nr3fh3/0y95BNVuMLqCdmtFxUM9iTRAWtubgOM4M
         kTSjARON6ACTTkHKD/mF90vduXCoFTYzW4Q15ACGjLQijHIDb7dunXzflL+zmlaNJS92
         L4StEcTl0+RNhZh/ErUA7afav3X/zOe7ffzrBrEO8wDGTyiPNjVyonERo5YGhmC6AvTF
         hFqPdmULNCgKTgZgqnwThr9ZNYl5Y1ss1TZZwDfKeyrvrV6XKfEiSce2/2PyK+vFQxRk
         giBdQcyB0yO3YIjUh5nkyTYZipInYz+cMuhgshPqGVArR7/p6V+vRgZkMRCCvz00IaZl
         3ywg==
X-Gm-Message-State: AFuF++lz/CGj09ckJOQrCQZ0WaCJhjJ5Yqi9Z8gpins24cTUA2Hr8RfS
	ACmrZF9BQHtTyBMgerg7nkD+Yn/idXKe3kSovbvv+/bEsLb3cACQV4+x
X-Gm-Gg: AYBFou1oLFqsB30NngbgTNSgWwsGbX0L41J7JLYFlUqFYCcy1XSvRTwaK77t4/ZS/EL
	jQqbZ5hawxGET6shku5yhzEcw+Ao61lH6PdyJzTP6IN+3WSP4loERuXc/gEd1O7/zgjqIsPap54
	M/0/PDJuXxMO6a4zqUa0WDSXd0IfGOo1SLW8mAw8y9Zykmdbz+vRoCGh3O0K1E2n+Oa02k5sLMX
	pcmx7bq/R7hwL+34YFNwSV6WnRMiLuPu6EPSiRzl4hHkt32z8zLdpDnBiuwt7XSYypqvfyS5KEm
	7zZ+fzs8wVMDt+i89VqRcqtFg7mhdv6MxbwYNQLimVNC0Uclz+da7hY2XOqAj886DnN3fx9E2jG
	sQ/wryrwR7rooZtRTzqEwd+zAp1or7nuKiYONaTJXs3VC0xNnmAlhPMuf1nCTgyrX0xB3DHTRKf
	W77cbz9ChqpdIJf1PUw/VpQCjCJoorYYaPJDbszbTr7atueIBE9shLuo9B2By2WwedBfkQ2MNJg
	mxC0kCkQchu8NwHbIKsyxmORSNv9w==
X-Received: by 2002:a05:600c:4e52:b0:49f:e238:e7cb with SMTP id 5b1f17b1804b1-49fe7bc4a41mr172233425e9.29.1790524689940;
        Sun, 27 Sep 2026 08:58:09 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018dd5easm66708625e9.3.2026.09.27.08.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:58:09 -0700 (PDT)
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
Subject: [PATCH v1 2/3] mfd: max8907: Remove platform_data based probing
Date: Sun, 27 Sep 2026 18:57:43 +0300
Message-ID: <20260927155745.187758-3-clamor95@gmail.com>
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

There are no in-tree users of this driver, but it supports devicetree
based probing, which means external dtb files may exist that work with
this.

Remove the unused legacy code and make this a DT-only driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c                 | 8 +-------
 drivers/regulator/max8907-regulator.c | 8 +++-----
 include/linux/mfd/max8907.h           | 5 -----
 3 files changed, 4 insertions(+), 17 deletions(-)

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
index e59aa7a3ee546..907ed3fca5e97 100644
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

