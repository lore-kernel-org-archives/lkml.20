Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F3E1B808
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792282176; cv=none; b=aZC8Ki+ucGtv8sW92/Li+X5hbR9rs301bjzdC8QmmzulVtIQbX6+a/QJILfuL4io19n0/xZkbPdSdJCF6SAmAQxh7NtdevBJmyUN7L/EXb+uzA4fD3FUs3rT8ims7kGzoBiJrB7HHB5UUsGppM3kLH4vT0d/vl0xOjo3QtAKpu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792282176; c=relaxed/simple;
	bh=6vA38k/HSG2McBVW1/kxWpDjpBI/fFHQ4pEz6Sxq1c0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f/Rpalp46EmSwDy7qvWM1L3I30JTvs1OIe/osGeUqWmfuTxesxvj8TJf42I/HYAywc3qA0nQp1jVNa0Y09BL1e+Zbfxc+6U1tFAuhwxuJNezviRXkE7wjtk3mwpQfFOhT3OxYIEwW3kCxtfB5QK8cORApeiQyOi4cdibNhh0ZvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCQvf1pS; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCQvf1pS"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30b6dad2382so2889041eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792282174; x=1792886974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0M4NAgf3ke+VVYopgdoNuand0ccz438htrgrHijUjA=;
        b=mCQvf1pS/Z9dOATUbOIesNU0GieOU09NVIdTMu1CGS0yzvSF9L+cJo8KiQi8Yhnh8T
         4bB9ArvWINmg2xwti5YSwArRHy4zdBbJlwVgagwNR4RHmkRqPe2mK2AFEW9mInY7/GCD
         eUZJkOierxPzLBUi7p7+X7zUSJ6k2mf2iIp5YBv/y+5aoogQwNB8fWxhbJkU6KmozbrU
         /EPw1s+FZR6Co8DPJUAkzvNRAC+57A9F0r4OXQlMrdykjBj3O7vNXxa6N5F1d/Np8LC4
         kRD/RBBHibOY2/l161tuBlRsRhcsixNMdUuW2efZ5gYRaDSG7Li/B4/5/kSnuoAwG1Pf
         OVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792282174; x=1792886974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0M4NAgf3ke+VVYopgdoNuand0ccz438htrgrHijUjA=;
        b=2BP3KAhKmgFy+hSgWyO3ZJAqCf3Hq42tc99WpVjIlCuTumoLksm49VHS+y01CxAXnY
         Zw3ALDzRrxOKRsLeGDxy4xAsn36pyz28uJnFKUap2VXgN/PxaneJUCDDoQf5P0PV+/fn
         85CuxvBG4FZ+RgO/q0Dr5yqXxDXTgYQP0sbcjLSi6tBthV+Ys3WZqsdxFAwAmGz9AiEX
         3iE3U+FMJuXrGtk72ydrCPN3ju0iTisajqfhIQFJF9l3wPPM66MckpAc3CD3iX56/klb
         vwRP9u0x+3YF/pyCWMvWnSfaCiwpgT3z2fr8uJUGd60MPLmJZCCLO2MNxINBWTbMAUhg
         3m2g==
X-Forwarded-Encrypted: i=1; AKwUvBx36bMytaxqrA+gkCBdClyl1nMAdVZaLVlw2ScKKyqmJAjIgaDmnF31cfi1lr6KDaDhyWTlXY0sW4OgnkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNVynUihQhrQrHrO9j/SvUd/m71Vi4UMhWhR+oTuGgZDXEynFq
	d4VB/WuS1zeX75MDWXufsitimoHF3hFxxDVJF9QhrZOH2OI0iz82pmbt
X-Gm-Gg: AYBFou0rjKGOBN3DVbdpNvfGczR/yzWh82qebbxkCP2FUS72vKplLdp1G3prV8Ez4JM
	23/3lrnkXwO6Jp3IZBeh8+MNu0rZhu+yyteEFOyVGJVZXw2oqxtE3nmhXNujgsE5tMgeWMuplr8
	18BVAW8R/ztuJt76iIkHLmI6jfD1IrlDHiww+xvZuo1w6oJjo1wTmkJ0qJQwRpgXUOt3cROHc8h
	UWgvTpB3x2UDP8XVRz35DEnMeBiOM4Oa98O3Mghzl3sqG0ydi1hR8xWh4psSrbLTalwuBqasC/S
	FXtSS7zpABwxbvZHgymurZFrg69+yutTi9H9nqTPxS1Q0grlBGaflke7PhkqBPOF6rIWIbhSIb3
	igaoH0jHna/K7yHzL6rqtvfI77An5oBBwfC0q4dsEH2x4FEz2jkgota+eFw50J24/a2OxGDzzY0
	eenO/2IamEJECMJ6g4R3wqXN0ihz9/ej03JQILNHjD2b0AX/p8+bjxvHmap3Cwqn/g7JDoU6vCZ
	K6oLU+gDCAUUOtdUV66FjtKJq/hpLU3ccEx4rvOC4Rcglu5uvmn0YjjBXIn54QogdtoVVcHoXIv
	lvPSm8W/Hmz1fMecWTSyWMcfs720iA==
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr8514376c88.26.1792282173564;
        Sat, 17 Oct 2026 17:09:33 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314ef8ed8sm15976613c88.3.2026.10.17.17.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 17:09:33 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] iio: imu: inv_mpu6050: use named initializers for temp in hw_info[]
Date: Sun, 18 Oct 2026 05:39:13 +0530
Message-ID: <20261018000924.758186-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The temp member of struct inv_mpu6050_hw is initialized positionally
in every entry of hw_info[], as { *_TEMP_OFFSET, *_TEMP_SCALE }. The
order is correct today, but positional initializers of this kind are
how the accel and gyro startup times ended up swapped.

Use designated initializers, as already done for startup_time, so each
value is assigned to the member it is named after.

No functional change.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Follow-up suggested by Jonathan on the startup time fix:
https://lore.kernel.org/all/20261011045710.357809-1-kapoorarnav43@gmail.com/

Compile-tested (W=1). The object file is byte-identical to the one
built without this patch, apart from debug info.

 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c | 95 +++++++++++++++++-----
 1 file changed, 76 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
index 3bdcf92472e8..5deddd3c5e80 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
@@ -148,7 +148,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6050,
 		.config = &chip_config_6050,
 		.fifo_size = 1024,
-		.temp = {INV_MPU6050_TEMP_OFFSET, INV_MPU6050_TEMP_SCALE},
+		.temp = {
+			.offset = INV_MPU6050_TEMP_OFFSET,
+			.scale = INV_MPU6050_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6050_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6050_GYRO_STARTUP_TIME,
@@ -160,7 +163,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6500,
 		.config = &chip_config_6500,
 		.fifo_size = 512,
-		.temp = {INV_MPU6500_TEMP_OFFSET, INV_MPU6500_TEMP_SCALE},
+		.temp = {
+			.offset = INV_MPU6500_TEMP_OFFSET,
+			.scale = INV_MPU6500_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
@@ -172,7 +178,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6500,
 		.config = &chip_config_6500,
 		.fifo_size = 512,
-		.temp = {INV_MPU6500_TEMP_OFFSET, INV_MPU6500_TEMP_SCALE},
+		.temp = {
+			.offset = INV_MPU6500_TEMP_OFFSET,
+			.scale = INV_MPU6500_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
@@ -184,7 +193,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6500,
 		.config = &chip_config_6500,
 		.fifo_size = 4096,
-		.temp = {INV_MPU6500_TEMP_OFFSET, INV_MPU6500_TEMP_SCALE},
+		.temp = {
+			.offset = INV_MPU6500_TEMP_OFFSET,
+			.scale = INV_MPU6500_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
@@ -196,7 +208,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6050,
 		.config = &chip_config_6050,
 		.fifo_size = 1024,
-		.temp = {INV_MPU6050_TEMP_OFFSET, INV_MPU6050_TEMP_SCALE},
+		.temp = {
+			.offset = INV_MPU6050_TEMP_OFFSET,
+			.scale = INV_MPU6050_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6050_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6050_GYRO_STARTUP_TIME,
@@ -208,7 +223,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6050,
 		.config = &chip_config_6050,
 		.fifo_size = 1024,
-		.temp = {INV_MPU6050_TEMP_OFFSET, INV_MPU6050_TEMP_SCALE},
+		.temp = {
+			.offset = INV_MPU6050_TEMP_OFFSET,
+			.scale = INV_MPU6050_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6050_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6050_GYRO_STARTUP_TIME,
@@ -220,7 +238,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6500,
 		.config = &chip_config_6500,
 		.fifo_size = 512,
-		.temp = {INV_MPU6500_TEMP_OFFSET, INV_MPU6500_TEMP_SCALE},
+		.temp = {
+			.offset = INV_MPU6500_TEMP_OFFSET,
+			.scale = INV_MPU6500_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
@@ -232,7 +253,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6500,
 		.config = &chip_config_6500,
 		.fifo_size = 512,
-		.temp = {INV_MPU6500_TEMP_OFFSET, INV_MPU6500_TEMP_SCALE},
+		.temp = {
+			.offset = INV_MPU6500_TEMP_OFFSET,
+			.scale = INV_MPU6500_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
@@ -244,7 +268,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6500,
 		.config = &chip_config_6500,
 		.fifo_size = 512,
-		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
+		.temp = {
+			.offset = INV_ICM20608_TEMP_OFFSET,
+			.scale = INV_ICM20608_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
@@ -256,7 +283,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6500,
 		.config = &chip_config_6500,
 		.fifo_size = 512,
-		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
+		.temp = {
+			.offset = INV_ICM20608_TEMP_OFFSET,
+			.scale = INV_ICM20608_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
@@ -268,7 +298,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6500,
 		.config = &chip_config_6500,
 		.fifo_size = 4 * 1024,
-		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
+		.temp = {
+			.offset = INV_ICM20608_TEMP_OFFSET,
+			.scale = INV_ICM20608_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
@@ -280,7 +313,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6500,
 		.config = &chip_config_6500,
 		.fifo_size = 4 * 1024,
-		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
+		.temp = {
+			.offset = INV_ICM20608_TEMP_OFFSET,
+			.scale = INV_ICM20608_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
@@ -292,7 +328,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_icm20602,
 		.config = &chip_config_6500,
 		.fifo_size = 1008,
-		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
+		.temp = {
+			.offset = INV_ICM20608_TEMP_OFFSET,
+			.scale = INV_ICM20608_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_ICM20602_ACCEL_STARTUP_TIME,
 			.gyro = INV_ICM20602_GYRO_STARTUP_TIME,
@@ -304,7 +343,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_icm20602,
 		.config = &chip_config_6500,
 		.fifo_size = 1008,
-		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
+		.temp = {
+			.offset = INV_ICM20608_TEMP_OFFSET,
+			.scale = INV_ICM20608_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_ICM20602_ACCEL_STARTUP_TIME,
 			.gyro = INV_ICM20602_GYRO_STARTUP_TIME,
@@ -316,7 +358,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6500,
 		.config = &chip_config_6500,
 		.fifo_size = 1024,
-		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
+		.temp = {
+			.offset = INV_ICM20608_TEMP_OFFSET,
+			.scale = INV_ICM20608_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_ICM20690_ACCEL_STARTUP_TIME,
 			.gyro = INV_ICM20690_GYRO_STARTUP_TIME,
@@ -327,7 +372,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6500,
 		.config = &chip_config_6500,
 		.fifo_size = 512,
-		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
+		.temp = {
+			.offset = INV_ICM20608_TEMP_OFFSET,
+			.scale = INV_ICM20608_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
@@ -339,7 +387,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6500,
 		.config = &chip_config_6500,
 		.fifo_size = 512,
-		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
+		.temp = {
+			.offset = INV_ICM20608_TEMP_OFFSET,
+			.scale = INV_ICM20608_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
@@ -351,7 +402,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6500,
 		.config = &chip_config_6500,
 		.fifo_size = 4 * 1024,
-		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
+		.temp = {
+			.offset = INV_ICM20608_TEMP_OFFSET,
+			.scale = INV_ICM20608_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
@@ -363,7 +417,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.reg = &reg_set_6500,
 		.config = &chip_config_6500,
 		.fifo_size = 4 * 1024,
-		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
+		.temp = {
+			.offset = INV_ICM20608_TEMP_OFFSET,
+			.scale = INV_ICM20608_TEMP_SCALE,
+		},
 		.startup_time = {
 			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
 			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
-- 
2.53.0

