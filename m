Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31954377ABE
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184247; cv=none; b=mPAYWr+laH7Z6rCB1uWhpqtCsFxvNO5Ha4eS4zlwj2C21rLNSZWa8DM7mcqc9HJMLIHMXisR62I57Ii8E6SfBObZR9/UACqO1XnYkA0B/2qlfR9Y01Y1CtF0MhVWZ/UTtIDblR5JoMFdF2r/t+kCLpwhPTB2B+UxkIy+puonJbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184247; c=relaxed/simple;
	bh=DCokXdATGPIggSgFw3/QiZFiz3LeqkJtGjMK9ckNik0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOQ9y3xKo8AiL3FUh0k+DD2asROyyCFX2SBMNwFnA9hUruF5+z4jnDLs2ltgJSY310A35+WGjNC9KRv4H9w+1N+pPe4zXT6R3KDro63zY+NKyL1qt2oqLtUdzp60Ik4gbjEB543LlQy7PKQXhzu2gHlobwZWuoiI+O4DfUyARGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQWh1fjK; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQWh1fjK"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso7977585e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791184241; x=1791789041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yp/IMZwSWJ7KU6BBKiPJnaYZoJ/BB8B0UGfzVWC27XU=;
        b=VQWh1fjKwaJYFDckIA39+mDWXAkvtbvw+X/y1lS+vncphw/+CrWWxkAq4SccRuCrNH
         ebukjYyCnmxUUI/Q8/n5brX3wxarUmQ846jW0ImC9b2udbecIvoolpcvrHo2xgifJYBn
         /v4jXTnbg0Vtj1Y2+oLk0kHpEHsdqsf/CsEJ+Cd8pVPuZhpbYk62twTWvQA+6ZbFsl1e
         BykjfG1dtd8IB8J5NOH3AyVBwjjKtJJ5xVuUEiZ1Oh5oE9LR10WHPFIEnmKQcJyZ1XNL
         ucqrlT4Dlcz1yb/JUxbI63kd2lggDm1z5OOQ5n17TjCsbttI0i4tiGW8Y3oNiEvIPWIT
         kcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184241; x=1791789041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yp/IMZwSWJ7KU6BBKiPJnaYZoJ/BB8B0UGfzVWC27XU=;
        b=ZCmbj6nRPPCfITzup51a6LIWY+hTQMYhbqS407ycHOHwZ2NYKt6OBvYCxLN+WbfzNs
         rjuCdxJJ45qslVSH+OiGWrfMNIKVxQzewy7iQZIAuJiEGeT5IbmMZ+WtKeeTg9ES4+wp
         HGnJ/CDj1b0ohTwGGFLiSv1gBZeb52Nf6yVCoaWcph4hxS58JVQrhsLkh0TqOY9wMf7w
         Q7EokzSZArxedfRZOmJ6Qq+vw11pPrthePI9B5x5/M5pdl63rFWRI1x7G+QnKGf9e1Ca
         /QzlhRi4jz/AgTccsSUwG3fVp9FOTV0bv7cIaX1mdSvoM8Ldmbe48NpDy/1wpvUV6bXS
         ox+w==
X-Forwarded-Encrypted: i=1; AKwUvBzdh84i4Cmjunt3MsjBDMvzI2Rh7XUZ8Kcsxhqx0ZifSQKXyMsIu+EaPGl89eQSBiMYobI4J9OkcSMc/BA=@vger.kernel.org
X-Gm-Message-State: AFuF++l4nyodL/3kFj/FqYOPX2p6LS/AHoxM296uj1vnOx5/5CC8sy9N
	3GscztkBeyS4wsXZfSqMTEhQrnQHCxM6t4++bVOYdVvoHcXswmzke6BA
X-Gm-Gg: AYBFou2SXjipp9LNy7T/ubZYjjsceMkB4Mr8sW0Bb116xxQFwcuPmTxnO8Ben0WVdL/
	eX/P+vEIWBS8umsc19q/+g0Zo+nlFL3cxlJM2XsYvQBIVqvdEwN2UnLKc7l6E9Ij+vQT9u7G+3q
	k3V1Xnt3EdFZyLHj01WUXCpsWer01nvmSerUY06tWAME5D/HiUIpSLTXZme/M0V/rRF120BRuwx
	VOOENLinaF4PfLQoeZjrEIZ1iLMvkjIFJ3b7to5Azt+DmqtLlpjNfHNl1dFW2u3rNhyeHIgFu5z
	pGNGU0wsIME3LEHjke2kWUNoNqliLYqqdHJ9HKGJpYso2ME3p/WaEudpvoO76Si+DySOxqTvV7s
	xJZcqLUQApA4cbi3mnQwgA7M89HIUnmtc1PlCegLCmp2oGgVSqtuxvIZKMrkZb5AsTbwy/M0yvn
	3gaVKGRVkYvIPZDCP4BASPGPBnF/80hrXefY4SdhgKhPP/AIoXhsXD5thHraWlE76rN1WRG3Ftt
	OI1ORk4vKv5q2S6YXHWK8m8sP9V2rbsSN6nTchGn9n2LN6fKAsbUQhIW+ofYNluNa3lZLzajPX6
	eTyFI3v83xQhMuhg2qX7hPP5DY36QaN067gk
X-Received: by 2002:a05:600c:5391:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a02769a99cmr177202295e9.33.1791184241452;
        Mon, 05 Oct 2026 00:10:41 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm316749855e9.14.2026.10.05.00.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:10:40 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH v4 3/3] media: ipu-bridge: Add OmniVision OV32C4
Date: Mon,  5 Oct 2026 09:10:10 +0200
Message-ID: <20261005071010.7191-4-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005071010.7191-1-robertbozik@gmail.com>
References: <20261005071010.7191-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the sensor configuration for the OV32C4, matching the _HID the
sensor enumerates with. Without this entry the bridge does not build a
software node graph for the sensor, so its driver defers probing on the
missing fwnode endpoint forever and the camera never binds.

The SSDB of this sensor declares a VCM, and ipu-bridge would instantiate
a dw9714 client on the sensor's second I2C address. There is no lens
driver there: the address belongs to a register block of the sensor
itself, which the sensor driver claims and needs. A dw9714 client on it
takes the address away from the sensor driver, and dw9714 has no id
register, so it binds to anything. Do not instantiate a VCM for this
sensor, whatever the SSDB says.

Signed-off-by: Robert Bozik <robertbozik@gmail.com>
---
Changes in v4:
- Do not instantiate the VCM the SSDB declares for this sensor; the
  address it names is the sensor's own second address, which the sensor
  driver now claims.

 drivers/media/pci/intel/ipu-bridge.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..a0ba323d4 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -93,6 +93,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV32C4 */
+	IPU_SENSOR_CONFIG("OVTI32C4", 1, 400000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
@@ -217,6 +219,28 @@ static const char * const ipu_vcm_types[] = {
 	"lc898212axb",
 };
 
+/*
+ * Sensors whose second I2C resource is not a lens driver, whatever the SSDB
+ * calls it. The OV32C4 keeps a register block of its own at that address,
+ * part of the sensor and owned by its driver; a VCM client there would take
+ * the address away and leave the notifier waiting for a lens subdev that
+ * never appears.
+ */
+static const char * const ipu_no_vcm_hids[] = {
+	"OVTI32C4",
+};
+
+static bool ipu_bridge_sensor_has_no_vcm(struct acpi_device *adev)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ipu_no_vcm_hids); i++)
+		if (acpi_dev_hid_match(adev, ipu_no_vcm_hids[i]))
+			return true;
+
+	return false;
+}
+
 /*
  * Used to figure out IVSC acpi device by ipu_bridge_get_ivsc_acpi_dev()
  * instead of device and driver match to probe IVSC device.
@@ -435,7 +459,7 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 	sensor->rotation = ipu_bridge_parse_rotation(adev, &ssdb);
 	sensor->orientation = ipu_bridge_parse_orientation(adev);
 
-	if (ssdb.vcmtype)
+	if (ssdb.vcmtype && !ipu_bridge_sensor_has_no_vcm(adev))
 		sensor->vcm_type = ipu_vcm_types[ssdb.vcmtype - 1];
 
 	return 0;
-- 
2.53.0

