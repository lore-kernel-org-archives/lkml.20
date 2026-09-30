Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBA65226B6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804627; cv=none; b=pvoB6qv+9V0nGdJ4GxcADbRj8eKL+eF3Yz0av+ywzExyl0DHHG2vIP6rbud8YkLLr8X/gEzZZKD/b5V3ksmpYLuNdHLYBNKX7EZ4OVLIAq5tAyjN8uJyHQtJ3+ZC+uDA32V9o56EVpkCOEP7W293LbvhuNUv4liygejzzZP72RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804627; c=relaxed/simple;
	bh=TpggfEsOSM87ssg324Bg9QqL8idBLTkX/Dwp4MAsSaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gm6bkhAjTYb5h+O1unM2fjSqtBZWOl++YvBqHrRXOqPEeoPyZSRlQOUJS0a27Rpb1337Gxn+qmoFvhebF8Ml7YY8k0eOyrI11QviAwvMTc/iWYV8qrCwW9DiPpQCuqfKEqi2Hi7wBomq6IOHO2lwwMTdqN6yJRUWpp7Fh0aFspA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ch0KN6Ze; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ch0KN6Ze"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc4c3304833so2306019a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804625; x=1791409425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWpAOoNXU5mrPZ0VP2BejHIuA0ZjYbHouz5m88LkEDs=;
        b=ch0KN6Ze6Qv2c9whmyxoeFS13FA8okxsNaOxVIBszyGS+hRiLnrgk9Gycl5DRma1s6
         lA5AaorUVDmWyMUetMYCoVZXRo+P377+xy0XLdEbNnNg91jndQBh4EySW3VTO8qbHFCL
         i4wrp132/A4CXE2MJxlEiBaJb3G3adg+wuTGdVKi5xqmptkWbf/ec1Gi+smKf+b5vzsq
         kR/hwzSq3QeXDHib3GtXme57dVGW/kkDoskrGMWO06qGCTu/GapcADNnzoHxm2A6yxHX
         J+LJcpzNmnEN8X+YDdAZIgLO6pytvMlIrLYjb+Imr0nZofE6YDxKxt9YNHwBYE/4Xldg
         269Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804625; x=1791409425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WWpAOoNXU5mrPZ0VP2BejHIuA0ZjYbHouz5m88LkEDs=;
        b=Cr55ZjSh79TDg83XUkZA4UJl9IFwkdUY8OIkDR4m18rpS90aHV+KbPh7puN/o+zGZu
         e288wSzboTJ0VaZrEvEUEMW5wTYCLiD3WTrrcCSki8+RVRhkCzehpP9irCZdorfyfPrX
         OW0a+XL6+o6OTjl/9HTxO6PhM/eZO/J98pk5iFgEpZNiExoEMfiM7U6Qh6znI0iBAkMq
         jhC6jGhiDZSsKq1TlWhLDo/V8CbV3TuLE56msGvqzpeQ8uyCmiKJRPzi8glEC/GifxxT
         50T2st+lig7mZ5R3XFvttQaAFewZrnoTsrBKi1N3AyCeJUU9BpAEnE5ifUCtJL/IrwG9
         Kyfw==
X-Gm-Message-State: AFq9FYKx+Cqwen4Vx38zv6XF6r5TEpkkZIkGbBV2nfZOEB/3J5D1PF6z
	dfiB6yODV0/3bxWMx1h0/yEJTCmkrUhMaOm0lWiai7+ZalZDDXF9yXgJ+mIV8DY8
X-Gm-Gg: AYBFou1CoRQAqmTrFttST8wgStuePFdRPlsu12jwyL/DaYP99zdBg9hkhaB3gofeRnS
	O+6SdvTjPuFoMqndrDJYcP8oVliX4kkqBkA7B9j5PxwYREshNx2p2131FAWlyg3w/gSTs748//P
	oHauvXo6k8/+IfnX7j1kMhiCImUx09wQ7MJvSwFbhHHpBzShBB9MPQAeLFWDQcFFZ7AAqbxYgR2
	N696PVPmMhJ+k+GhJe5p7E2SBTvdderjdJypGzOpPqB64StS3JvNJXwNp4MHInn61c0OPQbNCT0
	JUqpmr1g4WrxuZJyqwjyzg2EjAyoRNCH9uYD+F1C+UjsoA2HlTdKnlrCcMNF1ZYpKLtArKNk/jJ
	WYzSKWPDv1Mdfpkx2OhPhrK7b9O2KxAXKNLALnZiSl/cK3Gvxh1JL8siVlm2eQWX8ofpQ0KYLHE
	MPl8iuqiXG1Mm4GYwSE3ASyle/O/iSPxePlA4pLybgIj/4wore8a390vsXUO3jn5nVP9qu4R5ZM
	lwC1Q==
X-Received: by 2002:a17:90b:5825:b0:3a0:aed7:7b39 with SMTP id 98e67ed59e1d1-3a4d19c9159mr2296004a91.24.1790804625199;
        Wed, 30 Sep 2026 14:43:45 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm1060539a91.16.2026.09.30.14.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:43:44 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v11 4/9] platform/x86: int3472: tps68470: move Windows MFD setup below the device-type switch
Date: Wed, 30 Sep 2026 14:43:16 -0700
Message-ID: <20260930214321.600863-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930214321.600863-1-tchatard@gmail.com>
References: <20260930214321.600863-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Windows path looks up the board data, builds the tps68470-clk
platform data and registers the MFD cells; none of this is needed for the
ChromeOS path, which registers its own cells. Move that handling out of
the switch and let the ChromeOS case return directly, so the Windows-only
work is no longer done for ChromeOS and the function reads top to bottom.

While moving the code, use a local struct device *dev to shorten the many
&client->dev references, and return -ENODATA (rather than -ENODEV) when no
board data matches this machine, to distinguish it from a missing device.

No functional change for either path.

Assisted-by: Claude Code:claude-opus-4-8
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 99 ++++++++++---------
 1 file changed, 51 insertions(+), 48 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 35909a683..35fa77eb3 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -142,85 +142,88 @@ skl_int3472_fill_clk_pdata(struct device *dev, struct tps68470_clk_platform_data
 
 static int skl_int3472_tps68470_probe(struct i2c_client *client)
 {
-	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
 	const struct int3472_tps68470_board_data *board_data;
 	struct tps68470_clk_platform_data *clk_pdata;
+	struct acpi_device *adev;
 	struct mfd_cell *cells;
 	struct regmap *regmap;
+	struct device *dev;
 	int n_consumers;
 	int device_type;
 	unsigned int i;
 	int ret;
 
+	dev = &client->dev;
+	adev = ACPI_COMPANION(dev);
 	if (!adev)
 		return -ENODEV;
 
-	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
-	if (n_consumers < 0)
-		return n_consumers;
-
 	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
 	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
+		dev_err(dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
 		return PTR_ERR(regmap);
 	}
 
 	i2c_set_clientdata(client, regmap);
 
-	ret = tps68470_chip_init(&client->dev, regmap);
+	ret = tps68470_chip_init(dev, regmap);
 	if (ret < 0) {
-		dev_err(&client->dev, "TPS68470 init error %d\n", ret);
+		dev_err(dev, "TPS68470 init error %d\n", ret);
 		return ret;
 	}
 
 	device_type = skl_int3472_tps68470_calc_type(adev);
 	switch (device_type) {
 	case DESIGNED_FOR_WINDOWS:
-		board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
-		if (!board_data)
-			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
-
-		cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
-		if (!cells)
-			return -ENOMEM;
+		break;
+	case DESIGNED_FOR_CHROMEOS:
+		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+					    tps68470_cros, ARRAY_SIZE(tps68470_cros),
+					    NULL, 0, NULL);
+	default:
+		dev_err(dev, "Failed to add MFD devices\n");
+		return device_type;
+	}
 
-		/*
-		 * The order of the cells matters here! The clk must be first
-		 * because the regulator depends on it. The gpios must be last,
-		 * acpi_gpiochip_add() calls acpi_dev_clear_dependencies() and
-		 * the clk + regulators must be ready when this happens.
-		 */
-		cells[0].name = "tps68470-clk";
-		cells[0].platform_data = clk_pdata;
-		cells[0].pdata_size = struct_size(clk_pdata, consumers, n_consumers);
-		cells[1].name = "tps68470-regulator";
-		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
-		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
-		cells[2].name = "tps68470-gpio";
-		cells[2].swnode = board_data->tps68470_gpio_swnode;
+	board_data = int3472_tps68470_get_board_data(dev_name(dev));
+	if (!board_data)
+		return dev_err_probe(dev, -ENODATA,
+				     "No board-data found for this model\n");
 
-		for (i = 0; i < board_data->n_gpiod_lookups; i++)
-			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
+	n_consumers = skl_int3472_fill_clk_pdata(dev, &clk_pdata);
+	if (n_consumers < 0)
+		return n_consumers;
 
-		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
-					   cells, TPS68470_WIN_MFD_CELL_COUNT,
-					   NULL, 0, NULL);
-		kfree(cells);
+	cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
+	if (!cells)
+		return -ENOMEM;
 
-		if (ret) {
-			for (i = 0; i < board_data->n_gpiod_lookups; i++)
-				gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
-		}
+	/*
+	 * The order of the cells matters here! The clk must be first
+	 * because the regulator depends on it. The gpios must be last,
+	 * acpi_gpiochip_add() calls acpi_dev_clear_dependencies() and
+	 * the clk + regulators must be ready when this happens.
+	 */
+	cells[0].name = "tps68470-clk";
+	cells[0].platform_data = clk_pdata;
+	cells[0].pdata_size = struct_size(clk_pdata, consumers, n_consumers);
+	cells[1].name = "tps68470-regulator";
+	cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
+	cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
+	cells[2].name = "tps68470-gpio";
+	cells[2].swnode = board_data->tps68470_gpio_swnode;
+
+	for (i = 0; i < board_data->n_gpiod_lookups; i++)
+		gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+				   cells, TPS68470_WIN_MFD_CELL_COUNT,
+				   NULL, 0, NULL);
+	kfree(cells);
 
-		break;
-	case DESIGNED_FOR_CHROMEOS:
-		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
-					   tps68470_cros, ARRAY_SIZE(tps68470_cros),
-					   NULL, 0, NULL);
-		break;
-	default:
-		dev_err(&client->dev, "Failed to add MFD devices\n");
-		return device_type;
+	if (ret) {
+		for (i = 0; i < board_data->n_gpiod_lookups; i++)
+			gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
 	}
 
 	/*
-- 
2.53.0

