Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733321;
	b=33a3pDAQnHZNejocs5t+ESIAYBg/7bzHTKR6jVabtxR5JVc4Ihjg9ytpUKc/tCppXW+G
	 vDPS0FAh1I9LvDW9qGZKymZcMfghHogsqNEjk/RZ2OPXEt8uWsMWNvvr1utJeS1mKtU6B
	 nPzZyu2+oDeNtx4aOYvg8NHBs2+6f66JSvvnQzQPja/rHmRVgAQ96uLYUCqsaOhlnfYbV
	 PPZksHGfOulzwr4BsOPNnwWaHM6PlbV3dS7cWq2oKPvXVVaGNDPMFOkRf7ZYAByE+vBTz
	 5TTQveVWHsxQPoddD2EQ4ndCKCDyQNv4JC0mlyD8BkjUewIbgTnTKVmO4YjfXdd1RCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZUURgUr8dXxqKz+c2MEq98G6BmE0uIQKXrceD/LihTE=;
	b=T8DFsjOy6SFvbdH4lHP3XP8p6yh3865bzNYtHsM2B8ClkqPvvHoJQl++V9UCwoMeDvtd
	 rVgldwZ8Ghkq3pdndcMh+9v1k0ibZdB9g/92sKwOTTl2+yGj57+RqFeGk7lCOEej1uP1q
	 w8Ju+lkohs7SHpqXNBpfbruQntwYB4n5tVMeF8XnOH6KWVPaUfiG3faTcSHblT/rlTXJ+
	 LRFp9N23GfBIwGmi6YEzDWsGWYF84m0TdWs/Wf3soNgNS48U1OMTKi8YQswihL8xKrocA
	 GcKrg0cjUlOJ8kaGRAmPKzRwawu+nwsVDeBa7YC3pvQxRY6eJLZD5Bq1f48LkJ3nv5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNNHiGKv;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22A9606A88A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B22A9606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNNHiGKv
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so3357945a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733319; x=1795338119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZUURgUr8dXxqKz+c2MEq98G6BmE0uIQKXrceD/LihTE=;
        b=gNNHiGKvUgdaKK2FtN5sAB7gAUaSGuUc9+154Kg0i5W9IotmqgxUqVCNuAzu4azr2l
         wluagkfyYAHKAKcLegZKf9F9jBNE/TrzzXL/7g8MpmgiSoEALUZ2WtrAR+HABsjopD+8
         khbqQhpisvs726Mk/rFdPfM2GGvPL1ZE5fthneDILqnlQrJ8LnaIyfXryrbqf3WTprAT
         3Z8ckUJd5eiUDngR/kojstglXGvd0jtweFINC8hyavD0NmRlzrXWHJSaTvBNlZsrm7Z8
         jjIZ73C+eUP/yBr71karcUX48Nl1VlNKkKCC1cxtUeybnM0hayeyIZFQMcDQYmdpxqCJ
         Wi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733319; x=1795338119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZUURgUr8dXxqKz+c2MEq98G6BmE0uIQKXrceD/LihTE=;
        b=IvE++7A4o50cr+2lHAq73F7vQDILRw55ROUu5IUhW/ovjusHIT9K250SltJeac8OMA
         +BE9ITIKFtRA88ZlP0YPhavCh28MZ0FcF4xTauPjR5F2layFw9MxfRrDlESK00+eIeXz
         WozpV7saSU4MtjFa9DWirjPX/Je6DTkoncp2p6RzW3LYJP9LrDJkvPf+qkcZhmG6YjFD
         xvH5ss59aYAHSLpS+EPMnvhldY5tZA2ddjVDOG3AxIhlsL4VAQ/yHPy/PW/rkGiFgOQI
         zn6Ncu+Np6rkKI56OwmR+nUu8ErdDUGDUQWkwKiru+Q9gkOsAIqaxfsX15YYhtndnFEA
         yuLA==
X-Gm-Message-State: APuU4Z8YqVLHMBe2f37TDSv2ci8rRHHBbtEVLg1Nde/CT5squuvYfWdy
	tgX0+xHKxBlWNRIpxJyTHCGR8xgoIuzO8DI26rYtiVqUmGop4Pgc1Ji2
X-Gm-Gg: AYBFou38iUAjhgpWgM/jN86PBWZfdNKaSa/Af5lUQPT+KEk0H3V+DAqBK91gxy9FXvH
	RBvt4E0xMssAxEvcFUw5ftpz3WxEFu8Q+67toYeZpsRwSb5VF9S4iZ3MOl4skB7WRM39STHsfe+
	2gOXCaEkROjIP5P0hs97oZb8NRsJFdB/cny7wRxcz3Jz3bUOANqsjjFoIp9JTQ15bPVkqymPk/7
	w5ASCsleOS9xK46GEinZ30iJYr15+nPqcvmMXL5p9aOhWVT268KpwOMzIpydCcEfeSAH08gjaki
	v6AfEe+0lsAlVZWDQt2DyB6k6xNybHJyw2SLDRuIdgU05hccvHGt/eJXjIt4DAm9g8+uaGm30K2
	nQvTVj5RgHxOSZWqWUQAPqBeI4Oe+NEsE8Z2BOnvAZn0DtPoDkuhPz8AzkuVqMGjsvY8rURXv0a
	lRafN0Yrz02o7/7G+d4UWDuizsNVYoGDhJ8pARcoJgb3aMKlgFwsWZd2ZVvbWYJKcRsYC9lmYnh
	n+pDqLWSjp/6ghuUMuQyh7FKhVxjhlDekbe2l003yCS+xhU4h1RN+lOD7mv2c0fiPP0MTpKZYQN
	8ifj7HLiB8W1ACtvGP4gDI8v1+S9ruCvg6Gur2j8zcJuw1sQCl9lwWAxz8LEylr9zGMaZikF4Ji
	kG4BSTqLIfQ==
X-Received: by 2002:a17:907:3d4b:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c50963b2f7bmr651176666b.39.1794733319040;
        Sun, 15 Nov 2026 01:01:59 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:01:57 -0800 (PST)
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
Subject: [PATCH v5 2/5] mfd: max8907: Remove platform_data based probing
Date: Sun, 15 Nov 2026 11:01:44 +0200
Message-ID: <20261115090147.95337-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090147.95337-1-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
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
index ba06a49c9c60c..d5d40d2c7c425 100644
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
 
 	max8907 = devm_kzalloc_obj(&i2c->dev, struct max8907);
diff --git a/drivers/regulator/max8907-regulator.c b/drivers/regulator/max8907-regulator.c
index a9f014eae4d61..5677c59ef5b8e 100644
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

