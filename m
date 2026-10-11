Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B316439EF1C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694640; cv=none; b=dFOMFxCnh4voQO23lz5mORzpnvTs+lFW9qMDx83QxxDCPea5tNTuYRBuZo+IZ2dYUxpdfd2CQ7vRPs4pu+EASD1ivseVnyOrwUH7w2vZ9/yZKfD7O3MXH4bVRGcYix2D9IqC+Dw6JrTHr34BNmDf0tHExIWIkzLXMepHSJMeNuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694640; c=relaxed/simple;
	bh=glwqAKwZKxWjoTvIZf3+4KJO09ktgARsPglmB8RAVqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VskIoWpeWtddx+M4BBMz4Up7XYz01aB0rtQ6kUkYnzg4EYRmpSTrDD/f58KqK1UsvBUKcvQ09NaO/7aUST4Cr2g71gsHIgL5voUf6IiVqTKXy4tEtn/T/tyfHGGFACK7Qw+tMoeltY8V4MwWb3Nl6RORzGifUVD52M+7QYdvJ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vm9Xqk6G; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vm9Xqk6G"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso2267234eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791694638; x=1792299438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSxIibBkVtF9VVSNXDoBpz/Pz8ZNbmWLpPtm9jtJfmY=;
        b=Vm9Xqk6GkPQ57LWOxTzD9CbNYXOzh3ImLPqSU2lPB+GLXeHyC7ygXoCBMeH+rmXf+z
         K5uSVhWW5usz2p6qdM2B9huPJu9iVRxidPqlYRNed9/xjBzzC0jfStA+2ZNjYoqwe8Su
         6h0+qRz/BVJySDIgnUGI130khPFADi7lNgR37FKzXHTWCVOa2PyoUAmxC94F/rR1TqZn
         FFCLyfgoNLOJ/18sFDQqsZpdYz7kQCjT+nGMdaDlo2nVj87br878l+i85xziS5VVoHIw
         I9/WVB/R/tZSBwtXX1vLO7XbtUtAqln2uzUPleyP6TL541KzpD0jOjgstFQ/XftLyhhT
         sndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791694638; x=1792299438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSxIibBkVtF9VVSNXDoBpz/Pz8ZNbmWLpPtm9jtJfmY=;
        b=Ft6ZbwCll5EAI1ni1y7UUMgtumas04RZxounpYNKFniIMV2QHClis/+yMG4+5MCchh
         1S/RvZP6yori0dEpY+mdgv850XP4ntewGAFiDgBzy12c8XPH6jfwicRzcvUmKAw8JuYO
         U/oYiqvusYcCgf16bVDe026YbPhIk4d4il8liF5hoiI++4sHgp4FNSaB077Mkiq0RTzS
         EmkIe3H0UwoTrQX1/9BfgFgEPNk4pPte7K2kP44MWSn54yp0Bdcpj0oc5GRgab03DC2D
         lEiPbhYtq8ssuvQvVIWWq7NtPbvNoiLvo606uNkjk5Pxjqg1BZ4cyHy2IY7gS0GXAmsq
         CodQ==
X-Forwarded-Encrypted: i=1; AKwUvByVZfIbgMypBDEksagpsstwaUUMG/Sh9B9TWYuVkZJQhJQ8EB1SbXLEj7w53vBTRI8el1ivYvKZY68LbsY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHihn81OjmdFgkPg95NdP+e4p7+b319kaOWfuBStSkelXY04M3
	7WWfb8w4y29lqAN4ivpMS90GWTMNqKvN865HD6obHP2VpvRtP3o89c2G
X-Gm-Gg: AYBFou20W5r/K+oEnER3hFwmDNIPg34BJcU53rAPf9qoK26jw8u1UDs7k/E3kCw+v4y
	OB96C6Sd33Dy+ZEo/s1wQsEQaV3ZgWXC0yz4suYH26RjL0Z0WD91FWSWVGueu32fC/8sfRBxiFS
	UsNvoKyzDLPVu2LkTaE3XTS33JLkg863rwaVhZUMPtdC2P/ev9xzKHxD2MwqYH0kwANWQj9Bwaa
	BOtUGheN8I166u4qcQep5we7yY4Wt8cuSYKJm+U4xis0SG8lUsDzBsWQDwg23Sg0wBo71PHOuo8
	vSS5RVQCcTh8SBR+tXNCFIRoJYhS5JQWLx1IJqSIAHwsDkSiO0vbcpp5LiczeF68ng18ttmzXNZ
	f4OJv1IYu95CwomaCJpbuQ/2L/lcDB/WsM+l9H7pqe+0FG6tJmXtbaToeqWTTDlhO6NpTCXiQxw
	3T0rVCFVxiBqGmWzjktQFuFRHzrPUf1dOQaxu3B0S/Sh/RcrpnjEb/CvD0lvDkfy6h9szx73svj
	vFIOOtHHGF+QfWUVtgyrB6vag0xJGGYtGT+2TZBEjpL/rFd6MWTC0lMh01voyLvzltQfuFKdt2t
	Sqt7xR9XqRx6wlJ+fBRE8twEKEUAgg==
X-Received: by 2002:a05:7301:7d06:b0:351:4d03:c6a with SMTP id 5a478bee46e88-3537df51463mr7508411eec.12.1791694637291;
        Sat, 10 Oct 2026 21:57:17 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm20051584eec.30.2026.10.10.21.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 21:57:16 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] iio: imu: inv_mpu6050: fix swapped accel and gyro startup times
Date: Sun, 11 Oct 2026 10:27:04 +0530
Message-ID: <20261011045710.357809-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct inv_mpu6050_hw declares startup_time as { accel, gyro }, but
every entry of hw_info[] initializes it positionally as
{ *_GYRO_STARTUP_TIME, *_ACCEL_STARTUP_TIME }, so the two values are
swapped for all chips.

inv_mpu6050_switch_engine() waits for startup_time.gyro after enabling
the gyroscope, so it waits for the accelerometer startup time instead,
e.g. 20 ms instead of 60 ms on MPU6050 and 20 ms instead of 100 ms on
ICM20602, and the first gyroscope samples can be read before the sensor
has settled. Enabling only the accelerometer waits longer than needed.

Use designated initializers, so each value is assigned to the member it
is named after.

Fixes: e46a36d92da0 ("Add startup time for each chip using inv_mpu6050 driver")
Assisted-by: LLM
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Compile-tested only (W=1); I don't have the hardware. I checked the
built object: before this patch hw_info[] has e.g. accel=60, gyro=20 for
MPU6050 and accel=100, gyro=20 for ICM20602; after it accel=20, gyro=60
and accel=20, gyro=100, matching the *_STARTUP_TIME defines.

 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c | 95 +++++++++++++++++-----
 1 file changed, 76 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
index 38c3f3b398d4..b26d1d401aaf 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
@@ -150,7 +150,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6050,
 		.fifo_size = 1024,
 		.temp = {INV_MPU6050_TEMP_OFFSET, INV_MPU6050_TEMP_SCALE},
-		.startup_time = {INV_MPU6050_GYRO_STARTUP_TIME, INV_MPU6050_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6050_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6050_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_MPU6500_WHOAMI_VALUE,
@@ -159,7 +162,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 512,
 		.temp = {INV_MPU6500_TEMP_OFFSET, INV_MPU6500_TEMP_SCALE},
-		.startup_time = {INV_MPU6500_GYRO_STARTUP_TIME, INV_MPU6500_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_MPU6515_WHOAMI_VALUE,
@@ -168,7 +174,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 512,
 		.temp = {INV_MPU6500_TEMP_OFFSET, INV_MPU6500_TEMP_SCALE},
-		.startup_time = {INV_MPU6500_GYRO_STARTUP_TIME, INV_MPU6500_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_MPU6880_WHOAMI_VALUE,
@@ -177,7 +186,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 4096,
 		.temp = {INV_MPU6500_TEMP_OFFSET, INV_MPU6500_TEMP_SCALE},
-		.startup_time = {INV_MPU6500_GYRO_STARTUP_TIME, INV_MPU6500_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_MPU6000_WHOAMI_VALUE,
@@ -186,7 +198,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6050,
 		.fifo_size = 1024,
 		.temp = {INV_MPU6050_TEMP_OFFSET, INV_MPU6050_TEMP_SCALE},
-		.startup_time = {INV_MPU6050_GYRO_STARTUP_TIME, INV_MPU6050_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6050_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6050_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_MPU9150_WHOAMI_VALUE,
@@ -195,7 +210,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6050,
 		.fifo_size = 1024,
 		.temp = {INV_MPU6050_TEMP_OFFSET, INV_MPU6050_TEMP_SCALE},
-		.startup_time = {INV_MPU6050_GYRO_STARTUP_TIME, INV_MPU6050_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6050_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6050_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_MPU9250_WHOAMI_VALUE,
@@ -204,7 +222,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 512,
 		.temp = {INV_MPU6500_TEMP_OFFSET, INV_MPU6500_TEMP_SCALE},
-		.startup_time = {INV_MPU6500_GYRO_STARTUP_TIME, INV_MPU6500_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_MPU9255_WHOAMI_VALUE,
@@ -213,7 +234,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 512,
 		.temp = {INV_MPU6500_TEMP_OFFSET, INV_MPU6500_TEMP_SCALE},
-		.startup_time = {INV_MPU6500_GYRO_STARTUP_TIME, INV_MPU6500_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_ICM20608_WHOAMI_VALUE,
@@ -222,7 +246,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 512,
 		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
-		.startup_time = {INV_MPU6500_GYRO_STARTUP_TIME, INV_MPU6500_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_ICM20608D_WHOAMI_VALUE,
@@ -231,7 +258,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 512,
 		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
-		.startup_time = {INV_MPU6500_GYRO_STARTUP_TIME, INV_MPU6500_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_ICM20609_WHOAMI_VALUE,
@@ -240,7 +270,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 4 * 1024,
 		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
-		.startup_time = {INV_MPU6500_GYRO_STARTUP_TIME, INV_MPU6500_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_ICM20689_WHOAMI_VALUE,
@@ -249,7 +282,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 4 * 1024,
 		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
-		.startup_time = {INV_MPU6500_GYRO_STARTUP_TIME, INV_MPU6500_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_ICM20600_WHOAMI_VALUE,
@@ -258,7 +294,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 1008,
 		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
-		.startup_time = {INV_ICM20602_GYRO_STARTUP_TIME, INV_ICM20602_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_ICM20602_ACCEL_STARTUP_TIME,
+			.gyro = INV_ICM20602_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_ICM20602_WHOAMI_VALUE,
@@ -267,7 +306,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 1008,
 		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
-		.startup_time = {INV_ICM20602_GYRO_STARTUP_TIME, INV_ICM20602_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_ICM20602_ACCEL_STARTUP_TIME,
+			.gyro = INV_ICM20602_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_ICM20690_WHOAMI_VALUE,
@@ -276,7 +318,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 1024,
 		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
-		.startup_time = {INV_ICM20690_GYRO_STARTUP_TIME, INV_ICM20690_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_ICM20690_ACCEL_STARTUP_TIME,
+			.gyro = INV_ICM20690_GYRO_STARTUP_TIME,
+		},
 	},
 	{	.whoami = INV_IAM20380_WHOAMI_VALUE,
 		.name = "IAM20380",
@@ -284,7 +329,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 512,
 		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
-		.startup_time = {INV_MPU6500_GYRO_STARTUP_TIME, INV_MPU6500_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_IAM20680_WHOAMI_VALUE,
@@ -293,7 +341,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 512,
 		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
-		.startup_time = {INV_MPU6500_GYRO_STARTUP_TIME, INV_MPU6500_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_IAM20680HP_WHOAMI_VALUE,
@@ -302,7 +353,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 4 * 1024,
 		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
-		.startup_time = {INV_MPU6500_GYRO_STARTUP_TIME, INV_MPU6500_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
+		},
 	},
 	{
 		.whoami = INV_IAM20680HT_WHOAMI_VALUE,
@@ -311,7 +365,10 @@ static const struct inv_mpu6050_hw hw_info[] = {
 		.config = &chip_config_6500,
 		.fifo_size = 4 * 1024,
 		.temp = {INV_ICM20608_TEMP_OFFSET, INV_ICM20608_TEMP_SCALE},
-		.startup_time = {INV_MPU6500_GYRO_STARTUP_TIME, INV_MPU6500_ACCEL_STARTUP_TIME},
+		.startup_time = {
+			.accel = INV_MPU6500_ACCEL_STARTUP_TIME,
+			.gyro = INV_MPU6500_GYRO_STARTUP_TIME,
+		},
 	},
 };
 
-- 
2.53.0

