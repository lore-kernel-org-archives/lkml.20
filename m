Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101613;
	b=cHJnkI9QO7QvHzcV2XldkfQ414U+2KRpmEsO+Z2duFuNMRTBpyGAbr6MaLxZWWvVTVB9
	 4m40YhXlyKWK9N0PAMxD5wctHgUhQRHwam3HfsOBgMhcKtL0KhFgpXiWf7ArjiLjPQNzg
	 VEraVFTFgeARRz4q+M8XOkP+JTqoDHWgQ6lzTYxUWQG2K0O0gnlNQ9Q11rVx0Rg4eaBm2
	 3bxSq/WLbx4g9Iw9qIXvkRLU487y3V6YI5oUr9yMNI2P2Fsfzf5zC9E9hrtJDTpc1cs/M
	 Y0NDHKmj19cxfJfUUH04wSjyIYFO5f6qWetIz3homwnWbqr4ruMABrKYbR1wO4Mu6Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QE9XGJJc4fSv5NK0pBPw7TKpZvBBJTMfX0/e+Q+5Ads=;
	b=wsT4LvHoMh6yjx1qRbfGYA0gRq6JbnJkuR10pdEBLfp+QeR6X3/2IaqyzxaDqVvbfAsZ
	 oXZg8qVkxEj5UffF4fV6uJHeSo5YNAQMvS/TQbQMPUAVHZwmH0bNzCm9HPW6hcwHwSdJH
	 /gvMXZBDiK82gVNOUVyeZ/efnjUzP/zggbYiHnqWwzHr83NiL4QK2c9Gy5ifUJGzuV8Hc
	 wTzsiJAQ7OpV1h2xl9Mr4nm4MW/qaVJg6kOVEwHn3UhjnQBHj/N7HdoynNn8RVmnGFqSQ
	 DOlDQc7eGy+ahu7OmnSnannY7+HIh9ZlH80FerghcXMkTeeOUAO9w/C0qptu5Sh5HQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=agMhBugX;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35737606A865
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35737606A865
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=agMhBugX
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c445c95d553so527640266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101612; x=1793706412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QE9XGJJc4fSv5NK0pBPw7TKpZvBBJTMfX0/e+Q+5Ads=;
        b=agMhBugXTZjxORet4N8CFbEGevudEKwglwoZ4lkgMoBV4ANsa7nwOoZUzvYmO8MkUJ
         F0sAC5O+IwxizVriKQgj4uHtkxTe/1kpEuk/XMP9edpAbRDijvKA7oj32LLlNFFGJuqi
         MWO5w7W6lTi37fw/D4uSVxecfZ8N0SkaARNFw6w3fWaYM7fz8iHtv7v6Wbi9rFZ6EBtF
         v4dmux9Vxo9FPjdml8oL1W5zkyzXpzpfrwIw+uHdIwDN0WWoh2MHYUDMVKqC3/w5Yfq3
         l/RYSJlMVL92Us8EUl4EpbJ/s7BVtH72NPYEk8AC1UjCIcuMVd8t6dpNaLhcMZJB/7BW
         SjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101612; x=1793706412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QE9XGJJc4fSv5NK0pBPw7TKpZvBBJTMfX0/e+Q+5Ads=;
        b=le2DmOPEYAJvLYXzA6OwiKlbI6F50SoRm/+0EnDvbLtHSqtKCyNYyqn4SWA+uoCAg0
         nlbsGcQ85eZbd+s3YyrEOKtj0S8EXlnFdKAQi7QvZH8YY1T1XR+LAWcR6axJkAOAAB6k
         EH9v/4cXY5UU7F2HAkruQLAnOkPtQaI8ksaRY9jv+lY5NvvrWlkBVyf36OKsx3W2WwNy
         uGVdLz8Q6S3EZibrJXjN53CRPQ91ArDMw6kzGWNkPC9EdJBk2EHo1ZxbAT1MJ4Yq3q4p
         2SbSjVPCdp0Z6uYgZHWsiBQjEBm8nCTn2+PsXkM+92Qfc2t/Zt6fShbDGrHgZ+9fL5bH
         ikgA==
X-Gm-Message-State: AFq9FYLRj6KVimGOOy7FceHHgtsFB3Dp8Y92FjB1PXgiNPcL29CcV5Mo
	Mhy4ALYqzbG3AOokgjszyCrWwQVWkFHKpa0DqW7n4EVPbiFFZ+nHlsFnRd3Jkw==
X-Gm-Gg: AYBFou1QLIaJ1bPe13IcB1il57bKXs+pbnegMXGFIBIPrwiB29lRfaThtNTQ5LXl7Nw
	d2l292avyfWQL3FAuvUBQ+Jo1SkZpItIhLsUd60oQxEEv74eN0brwbmTYgEuRvjP3EtHWaTKYBJ
	p9ieTaoctVFVH+4xaLdgwLFCThQiTpF0cgkccJlVyQ2yRLt34VGFTmPW8Bq5srrOP6j5L7Lvkfh
	TDNuJbsQVMD0MNCYCNelOPxngJeN9SM6z3CGaii0PqOrGBwCK88R8073gD2fXWiPeQX83z5ollx
	Tni0VLC4foFaoXD0AZwiIilw5ttTbB9UPJyWr8CEVQaAllh3UBq8x4d0ZO2f/tMCR2IBpyDnYK0
	xaueIjKAxg0ZET7lSRMzAvdWFZkWzROlX2gSDoNuD4pAzR93K0sB9A5WbeYsByT/biYkrCXVowS
	qzMqKoEhQpHj3WFfMBt4HKnAwGw9e3O3VJhdk5TuIUz/O/BN1i4NwfYZ+SVzHr0Q8B5buDwMPqT
	T70JFDm/zT+8BTZVBjipN8eFnrG5QpaQ4kTuJR2KPh+9ZnzQO9GA5bRkMuTwVHKDs23989lzRpS
	8vw/xVzOHKCx6x50YiVUtA==
X-Received: by 2002:a17:907:d64a:b0:c2e:4b90:3c55 with SMTP id a640c23a62f3a-c46bdaa5e52mr1109139466b.5.1793101611523;
        Tue, 27 Oct 2026 04:46:51 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm430692866b.37.2026.10.27.04.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:46:50 -0700 (PDT)
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
Subject: [PATCH v4 2/4] mfd: max8907: Remove platform_data based probing
Date: Tue, 27 Oct 2026 13:46:32 +0200
Message-ID: <20261027114634.79706-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027114634.79706-1-clamor95@gmail.com>
References: <20261027114634.79706-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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

