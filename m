Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3542F4A05
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792284726; cv=none; b=b45shugDsJbMmEohmXNmBOveQfYUlVRgPa+tKfiGWe13rMjiov6ij44YEtTfS0jq79/X17dQlc6PCEEbwAYYuD74wjex1ofOV3CIXwHBCF7nBR5lzIYXXfuarA7cNOs45cFaYOntBgVzYchmBV6Nv1Kg4zdREV1cHJqES9YFtIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792284726; c=relaxed/simple;
	bh=9P2kJrH32E/0aMBpWiFKAQBykiiZmw+RoQPaDEQP8wk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ujszoMaO9xluVx4uuBP94cyKnwrNIcpn+ULVqGOIBHTHZ2vX7cnoFAY+dX48tClmcS0KcHhoA5P4LhugftNp0DwgO2xeELaAzlxisxffgJRu0++gfUklpAHw8Aklla08s+/OADXtDWwxgxcK+Xjb8mOFlaH+rNQrZCjpwFy8pwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iz+680uy; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iz+680uy"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so1004992e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792284723; x=1792889523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/k0lf3dLSgyxQ3nOKgfHKUHtr7YkYo3+89aeHilBjk=;
        b=Iz+680uy9/w0bBdEV2aedir9cP1+7U5maOTcejQcVJuzCyU3/1sl9UIP9ZIwSd8EL+
         jdHrRBgu1FMvk2lKo01z9JQYMSFZs2BB7F4WBTCuMM05N0Vbd2jqidZbaBmAWPgl3zo5
         V2Vzq8rFPNDQgQvB/Znu9x3A7sl3O/EEFxF5kP+ByBy5GOdoPIGB3hMx3J75B0N6zUAS
         g6JugUIFxrtyKX7gTwC94dBUvJZLHA9+a6k8CzQFl1BOcTLBFo2M+GHN6FmUAKG7f8kJ
         ry47i5G9ZmVRbdaOqGjRshtIjlptcLPgIM9XFfRu4H8C45v8fFth0BkTqbR+2jG3rdwN
         Lk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792284723; x=1792889523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7/k0lf3dLSgyxQ3nOKgfHKUHtr7YkYo3+89aeHilBjk=;
        b=DKpKXFqRHIXyAankshuShmz9CN5iJJlqNKg6MJtYIQa42nqXEG93BwDvVphpAgWJwg
         IEvw7IQGjRx4yIciiK0VQU0se6q9zwWo2vyBHzSjmGXrxU7zLMGd3H1eOtpLBLYZ0W3D
         q4lRKddMDHuuB6UeHhXS3/c9BEfptOiA0cmEpbnw0Nv0YneC2zjq8k9+TtEqkiolrwhU
         LM2SsTXRWUFEyOq6M8gQgpukX6Eb+NdiHW3/2leF2KVxqot2baLdMXK6TB+6EjSc7fSN
         NgwF4uppoTmmQgVmF5qRvRF9DopVxHl35ElgGkK3nBmsFnYg5Ue6VTWcIEzY5SljCYup
         cx0g==
X-Forwarded-Encrypted: i=1; AKwUvByrso3tVYHHSmo5AItribS6Uca4K7SBe5Tud78SYK9H+iMxGNfTxmJR/JPlRv8buc25e1k2AXwQHFGtaFA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeW42leIObLLVqkfW66m9OJO7YvCW+0eitx2bO2qvzfA/S7GoS
	+gv/MBOMv1eq9GzQzEE1CUev4WNieKt6ylQK4DjD4MAwWfyvAENOxVBK
X-Gm-Gg: AYBFou2Q8r6dNlQMI73RkfQmUcWOutHBcI9MBKpOVixKv0uJSfFXwo4k6j+FTPD68aL
	BIsilVe2KG24gx5EgdDGvmG3oOASL8mdPtpiw0v0BDyUi64lwXe+wupkdtNetfLi524btM1ASjg
	uchZTbUOsZGcmxOP61XLUcrXfMAVaxmoLkbnO4Hn84BkOGFAS1aEH8sRW/apGAlLYencfeCkOzl
	28op84wg9NMn40T7BAe9yscpVhk16vydQoQM01t6+veXtkYu5tRlBz8HqaFrldojO8BB8IGOxe+
	lToqdLn1VfbL4YQPTvMqENqsWJUuMgdHMTHzfCI8NEi3GMQpR2CDJmMv/oVtayrzWp7QwvlOgqV
	jjmPLwzkqv+rsVB7H3NhNAajuykqRiIhx5fFfCeKdA7kgzycULott2kOHYbUDPNuhDy4dH1qyaq
	X5d3PimKaXRlZTMFlaQGZtxBEIr2NXgdC1jetKT8aAZxxKq58IWqNGmjk8/2u2pHEfGGLa+PAGc
	hGaHu8p7AzGP/u2D5+vyrd7Tw8IASvhRxKC59yZ3AM=
X-Received: by 2002:a05:6512:33c7:b0:5b2:9f7a:29aa with SMTP id 2adb3069b0e04-5be509963b6mr1294821e87.0.1792284722645;
        Sat, 17 Oct 2026 17:52:02 -0700 (PDT)
Received: from [127.0.1.1] ([93.189.202.99])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a6335fesm1158148e87.57.2026.10.17.17.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 17:52:01 -0700 (PDT)
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Date: Sun, 18 Oct 2026 03:51:23 +0300
Subject: [PATCH v5] power: supply: bq27xxx: detect bq27541 behind bq27411
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-master-v5-1-0be16441cdd1@gmail.com>
References: <20261018-master-v5-0-0be16441cdd1@gmail.com>
In-Reply-To: <20261018-master-v5-0-0be16441cdd1@gmail.com>
To: linux-pm@vger.kernel.org
Cc: pali@kernel.org, sre@kernel.org, afd@ti.com, 
 konrad.dybcio@oss.qualcomm.com, david@ixit.cz, krzk@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792284715; l=2840;
 i=rinat.muhamedgaliev@gmail.com; s=default; h=from:subject:message-id;
 bh=9P2kJrH32E/0aMBpWiFKAQBykiiZmw+RoQPaDEQP8wk=;
 b=F4raFhCVPPI1rBsv56dgfFG1WDjGDk/EsUXDWvzAvHLQgJ6Zyg4iqv0tn8NgpW81ldduro3Ut
 Qd03prT8YehCQEltV3TgrkE8BbJeJcmhJh+y1OKbhG/iJJO7Ino+U3z
X-Developer-Key: i=rinat.muhamedgaliev@gmail.com; a=ed25519;
 pk=qkYQO8LRlRErWiLzlpK8jHbRIxv8+7v06+ytcxX8mec=

OnePlus 6 and 6T replacement battery packs may contain either a bq27411
or a bq27541 fuel gauge at I2C address 0x55. The device tree currently
identifies the gauge as bq27411, but a bq27541 uses a different register
map and then reports invalid battery values.

Read the DeviceType control subcommand when probing a bq27411. Keep the
existing profile for DeviceType 0x0421, but select the bq27541 profile
for DeviceType 0x0541. This retains the established DT ABI and supports
replacement packs without introducing a generic compatible.

Tested on OnePlus 6T (fajita) with DeviceType 0x0541: voltage, state of
charge, and temperature were reported correctly. Testing on hardware with
DeviceType 0x0421 would be appreciated.

Signed-off-by: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
---
 drivers/power/supply/bq27xxx_battery_i2c.c | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/power/supply/bq27xxx_battery_i2c.c b/drivers/power/supply/bq27xxx_battery_i2c.c
index 94b00bb89c17..8c05740f1173 100644
--- a/drivers/power/supply/bq27xxx_battery_i2c.c
+++ b/drivers/power/supply/bq27xxx_battery_i2c.c
@@ -16,6 +16,11 @@
 static DEFINE_IDR(battery_id);
 static DEFINE_MUTEX(battery_mutex);
 
+#define BQ27XXX_REG_CTRL		0x00
+#define BQ27XXX_DEVICE_TYPE		0x0001
+#define BQ27411_DEVICE_TYPE		0x0421
+#define BQ27541_DEVICE_TYPE		0x0541
+
 static irqreturn_t bq27xxx_battery_irq_handler_thread(int irq, void *data)
 {
 	struct bq27xxx_device_info *di = data;
@@ -136,6 +141,34 @@ static int bq27xxx_battery_i2c_bulk_write(struct bq27xxx_device_info *di,
 	return 0;
 }
 
+static int bq27xxx_battery_i2c_check_device_type(struct bq27xxx_device_info *di)
+{
+	int ret;
+
+	ret = di->bus.write(di, BQ27XXX_REG_CTRL, BQ27XXX_DEVICE_TYPE,
+			    false);
+	if (ret < 0)
+		return ret;
+
+	ret = di->bus.read(di, BQ27XXX_REG_CTRL, false);
+	if (ret < 0)
+		return ret;
+
+	switch (ret) {
+	case BQ27411_DEVICE_TYPE:
+		return 0;
+	case BQ27541_DEVICE_TYPE:
+		dev_warn(di->dev,
+			 "detected DeviceType 0x%04x instead of expected 0x%04x\n",
+			 ret, BQ27411_DEVICE_TYPE);
+		di->chip = BQ27541;
+		return 0;
+	default:
+		dev_err(di->dev, "unrecognized DeviceType 0x%04x\n", ret);
+		return -ENODEV;
+	}
+}
+
 static int bq27xxx_battery_i2c_probe(struct i2c_client *client,
 				     const struct i2c_device_id *id)
 {
@@ -169,6 +202,12 @@ static int bq27xxx_battery_i2c_probe(struct i2c_client *client,
 	di->bus.read_bulk = bq27xxx_battery_i2c_bulk_read;
 	di->bus.write_bulk = bq27xxx_battery_i2c_bulk_write;
 
+	if (di->chip == BQ27411) {
+		ret = bq27xxx_battery_i2c_check_device_type(di);
+		if (ret)
+			goto err_failed;
+	}
+
 	ret = bq27xxx_battery_setup(di);
 	if (ret)
 		goto err_failed;

-- 
2.56.0

