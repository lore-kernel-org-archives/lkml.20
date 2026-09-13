Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA913EFFD2
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303985; cv=none; b=UKoHGBXbiMelR1mZdUl5t9ppxLG1iC31UQ/aNoyIF4yFfmeir7iK1YDcQYk+pNb+XAY+7FQaKUSpaGKfrzog9WUrkoom9HapUroba/BQg95QDs88QGWGwkMlTN6xldHtTU4d18v42VXRReuv5KkRYht7uA4oBQtjHsf8gzjIB0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303985; c=relaxed/simple;
	bh=2jdLhS0f6LGPinV6mDXuEBf99CtvYJn2mzTEPg7/Skk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ei71N2IsrRpJhOE35lx+qB50qbhKkXT3SP0IzRsFzzR4rWv+iNrnnyCVeIXKmA0l30tyBOg6dwryE7WwLLJXI6kFUE4DuddU2u/QY6speLAH7W7Xxi9hY4BSEIu3k2QYyST8O+7CLyjbFLX4Ja61vaooRkcckG42HLeTrmA7v3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTyL2irv; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTyL2irv"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b7aso1460248e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789303981; x=1789908781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuRUfdHSYsUBwVaQaiL7xtjOAdBqEJ7KfcBMX3K0Kbc=;
        b=OTyL2irvIUNbrNFKY8UWKInl3NNL/zVAaV2RPb0GvKG6tMoeOjbND7YQo/CXaBDFCb
         5cnNE45R5PtRX6hKPNO5s+aYd4WRCNqgaag8M7xLggaFYGAgjScoEMppzMwpwcFuEEWe
         NOQwd2l6t6yHrNTAfjLx928uduiBMc9SV6gS80a03ST7u+XI0AITqhh1YF8GPPcuJytP
         gWth0iNvlVzmvcpojDK2jzzgmde6DFyEqMH2o8XJrL+NmpMUvaRmWPTuz0ZUM9Xpy9JO
         gUhURWjWAaEhhFrPjGvXm85GktDVf4J6YlQ97H7GVmlQeNy48HF4pNwaNMJh0ECtBu+z
         M7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789303981; x=1789908781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vuRUfdHSYsUBwVaQaiL7xtjOAdBqEJ7KfcBMX3K0Kbc=;
        b=q2zlQiNAD19EZpuhKx/xqNagUT+nNCIy+6UO9eTMah9N+ZxuldtTsPUAaiqud+pkXN
         Oxc+fR+BsbVIMYAOSrq3XoqSBPxq271iFBWWp5nb6xGriebwXJweh6iXQE1sv2LQpO28
         iEWH7IikXUDeYV5JED4uuqnHBvLeTA09pbHJCZKMZpqyZTWZBAVCh6h1HqeKOWpT3Ayv
         xsvZJ7qiquuld/OINGxq230yfqgeNYcV9kmVnacXv/8c7XklZ2htyFd0Qz9Ql0mMSIj6
         FNEQOz/nxiuNup62VRWcJNaTUpcA1CWzoA/95dVoLGIQjfCyim1r68wU/vXi2h23zQzr
         Au2A==
X-Forwarded-Encrypted: i=1; AKwUvBwuQHAI/eu6eJEw99kjEpMOEGDXGOHDFO+Xth2Nr32yNSkx2wLCQqVnGUarthAhxGRaA7O2PiOGp7OtX7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nE3k3YGvaKZgw/AmCI/h1BhjdzfbbdgmLmqABCstMucTyOYfHB
	YHmWHO7IcY4I47QmvDN2LUzWQAvln8xWBKmqFxHEK9pJHEMoeDyPmmc=
X-Gm-Gg: AYBFou0FBfvO5ZjRCZng5jftAPC8yVFg/V+qWvZIhkGOb9G/Bp8ORkhxh4Hz4haKXHd
	Zkf35ybEJP5Nr/b8TcrJ3LbHYG2NC+S3n1ZoRXbnMAylnv6PSpNI1cwRE1Gb5ZxFs2fWIFVZvz1
	BM/7OTO/AsR0n8xVZxfXrNE5K4j4X5H5fYbjn0W5JAH4Iq4EX78hDQYJy1ptWxbYjlIcUR8pLcp
	AL9Yfe4LsnIaomkNfJoz7/rFRGLPLYKONtg28+YvFIIERB2q+qGJJ47TDDWSX7GuozWr9Fx7CQW
	6nkgWfxjJ8XOuWsVE3/7hedTzkzeLpf4lz+ubTUrpr3rfaOy0viWzKyB9+z7vfcxUWMZULQksq8
	xjbgdjMptKjz2SaFDa85xiwfm3XuefrBaBfv2tqAre4Z5vXirumfLG9oe/yC8W8GwhzbWorO6nb
	t372wm9nCAJDtgJMIuFTzZ5U2yT8ZJ4LQHVXARCHBquL4jtCHTAtgyo/OjPEH2KA==
X-Received: by 2002:a05:6512:1111:b0:5b0:1e16:e60c with SMTP id 2adb3069b0e04-5b8a0328740mr5196128e87.25.1789303980770;
        Sun, 13 Sep 2026 05:53:00 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0469a8esm1762844e87.50.2026.09.13.05.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:53:00 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH 4/4] thermal/drivers/airoha: Register a thermal zone per AN7583 sensor
Date: Sun, 13 Sep 2026 15:52:26 +0100
Message-ID: <20260913145226.34643-5-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145226.34643-1-sochnev.v.74@gmail.com>
References: <20260913145226.34643-1-sochnev.v.74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AN7583 has three temperature sensors and the driver has constants for
all of them, but it registers one zone and reads only the bandgap sensor.

Register a zone per sensor. With one thermal sensor cell the cell
selects the sensor. Device trees without cells describe only zone 0 and
keep reading the bandgap sensor. EN7581 still registers one zone.

Idle and with both cores loaded on a Nokia XG-040G-MF:

  bandgap  56.9 C -> 59.3 C
  GbE      58.7 C -> 61.5 C
  CPU      57.0 C -> 61.1 C

Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/thermal/airoha_thermal.c | 64 +++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 13 deletions(-)

diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
index d7e4a088b7ea..d996ef539fa1 100644
--- a/drivers/thermal/airoha_thermal.c
+++ b/drivers/thermal/airoha_thermal.c
@@ -245,6 +245,11 @@ enum airoha_thermal_chip_scu_field {
 	AIROHA_THERMAL_FIELD_MAX,
 };
 
+struct airoha_thermal_zone {
+	struct airoha_thermal_priv *priv;
+	int sensor;
+};
+
 struct airoha_thermal_priv {
 	struct regmap *map;
 	struct regmap *chip_scu;
@@ -263,6 +268,9 @@ struct airoha_thermal_priv {
 
 struct airoha_thermal_soc_data {
 	u32 pllrg_protect;
+	/* Sensor mux value per zone, NULL without a sensor mux */
+	const int *sensors;
+	int num_sensors;
 
 	const struct thermal_zone_device_ops *thdev_ops;
 	int (*probe)(struct platform_device *pdev,
@@ -348,7 +356,8 @@ static void airoha_set_thermal_mux(struct airoha_thermal_priv *priv,
 
 static int en7581_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 {
-	struct airoha_thermal_priv *priv = thermal_zone_device_priv(tz);
+	struct airoha_thermal_zone *zone = thermal_zone_device_priv(tz);
+	struct airoha_thermal_priv *priv = zone->priv;
 	int min_value, max_value, avg_value, value;
 	int i;
 
@@ -374,7 +383,8 @@ static int en7581_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 static int en7581_thermal_set_trips(struct thermal_zone_device *tz, int low,
 				    int high)
 {
-	struct airoha_thermal_priv *priv = thermal_zone_device_priv(tz);
+	struct airoha_thermal_zone *zone = thermal_zone_device_priv(tz);
+	struct airoha_thermal_priv *priv = zone->priv;
 	bool enable_monitor = false;
 
 	if (high != INT_MAX) {
@@ -640,8 +650,9 @@ static int an7583_thermal_read_diodes(struct airoha_thermal_priv *priv,
 
 static int an7583_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 {
-	struct airoha_thermal_priv *priv = thermal_zone_device_priv(tz);
-	int sensor_idx;
+	struct airoha_thermal_zone *zone = thermal_zone_device_priv(tz);
+	struct airoha_thermal_priv *priv = zone->priv;
+	int sensor_idx = zone->sensor;
 	int delta_diode, delta_gain;
 	int coeff, slope, offset;
 	int tries = AIROHA_THERMAL_MUX_TRIES;
@@ -649,9 +660,6 @@ static int an7583_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 
 	int diode_zero, diode_d0, diode_d1;
 
-	/* Always read sensor AN7583_BGP_TEMP_SENSOR */
-	sensor_idx = AN7583_BGP_TEMP_SENSOR;
-
 	coeff = an7583_thermal_coeff[sensor_idx];
 	slope = an7583_thermal_slope[sensor_idx];
 	offset = an7583_thermal_offset[sensor_idx];
@@ -715,7 +723,7 @@ static int airoha_thermal_probe(struct platform_device *pdev)
 	const struct airoha_thermal_soc_data *soc_data;
 	struct airoha_thermal_priv *priv;
 	struct device *dev = &pdev->dev;
-	int ret;
+	int ret, i;
 
 	soc_data = device_get_match_data(dev);
 
@@ -737,11 +745,31 @@ static int airoha_thermal_probe(struct platform_device *pdev)
 		return ret;
 
 	/* register of thermal sensor and get info from DT */
-	priv->tz = devm_thermal_of_zone_register(dev, 0, priv,
-						 soc_data->thdev_ops);
-	if (IS_ERR(priv->tz)) {
-		dev_err(dev, "register thermal zone sensor failed\n");
-		return PTR_ERR(priv->tz);
+	for (i = 0; i < soc_data->num_sensors; i++) {
+		struct airoha_thermal_zone *zone;
+		struct thermal_zone_device *tz;
+
+		zone = devm_kzalloc(dev, sizeof(*zone), GFP_KERNEL);
+		if (!zone)
+			return -ENOMEM;
+
+		zone->priv = priv;
+		zone->sensor = soc_data->sensors ? soc_data->sensors[i] :
+						   AIROHA_THERMAL_NO_MUX_SENSOR;
+
+		tz = devm_thermal_of_zone_register(dev, i, zone,
+						   soc_data->thdev_ops);
+		if (IS_ERR(tz)) {
+			/* A DT may describe fewer zones than sensors */
+			if (i && PTR_ERR(tz) == -ENODEV)
+				continue;
+
+			dev_err(dev, "register thermal zone %d failed\n", i);
+			return PTR_ERR(tz);
+		}
+
+		if (!i)
+			priv->tz = tz;
 	}
 
 	platform_set_drvdata(pdev, priv);
@@ -749,7 +777,15 @@ static int airoha_thermal_probe(struct platform_device *pdev)
 	return soc_data->post_probe ? soc_data->post_probe(pdev) : 0;
 }
 
+/* Zone order; the bandgap sensor stays zone 0 */
+static const int an7583_zone_sensors[AN7583_NUM_SENSOR] = {
+	AN7583_BGP_TEMP_SENSOR,
+	AN7583_GBE_TEMP_SENSOR,
+	AN7583_CPU_TEMP_SENSOR,
+};
+
 static const struct airoha_thermal_soc_data en7581_data = {
+	.num_sensors = 1,
 	.pllrg_protect = EN7581_SCU_THERMAL_PROTECT_KEY,
 	.thdev_ops = &en7581_thdev_ops,
 	.probe = &en7581_thermal_probe,
@@ -757,6 +793,8 @@ static const struct airoha_thermal_soc_data en7581_data = {
 };
 
 static const struct airoha_thermal_soc_data an7583_data = {
+	.sensors = an7583_zone_sensors,
+	.num_sensors = AN7583_NUM_SENSOR,
 	.pllrg_protect = AN7583_SCU_THERMAL_PROTECT_KEY,
 	.thdev_ops = &an7583_tz_ops,
 	.probe = &an7583_thermal_probe,
-- 
2.55.0

