Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748C74B95C5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642907; cv=none; b=AoTHmTf3URPzr1F5N6XAN4tkVVhf1nGbMlGg/H04Rb3VPp7M2jNsSDdd05NbWf6S5zPunNo9DwRzUDAfVD9cRZ9uIMkWoGIYOybCCQDHTUMMj2mOJIUS1KOz/2b+cH2qfuNaexefmCvN3ngmTO/WHj+s1GhQUedXlNX271NGKyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642907; c=relaxed/simple;
	bh=9yyK8gFu2iFYnkKJilPYF+Qy0O6mQZtjh/5coK3RdvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fsVkwVhA/ZMrhIM9xjSkAxExnxZla0bYVVqIQQAifui2iotfNYqLrCcvH1nnOkCnjyOglV+qmQMbY1shGxsiM+PGNaN26uG4IsW6dtN117dW4Lw2xUtTBZ/n0b3nPzmPMod9sBMIJf5bV6J7MpHmUvin5ZzOywPxmTepsCuf2Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/NFfeEv; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/NFfeEv"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so4894645e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789642897; x=1790247697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0tA6dVTMdNd1u4g6Gp9FhEdnm3luzFoberRSekZW39k=;
        b=m/NFfeEvqamBM+AJk4PEI7Meq/3tJuvtz1eGUcs8izgv8msHKyoEnVrDv7T23p7o8+
         nOT//1r6wsHX4u92eczzrzfnxcIqA5Qd0uJY7UvBoNuj5eDBYsOCNu3obZsJWV4NAZWz
         roLI0ZAGL77XfUL1OeHxmOwraZM8rWBhILJpFWGJkImuzTf4dDDrBbF31NQ/+lQR2UON
         gzm3BslH594PNWYAvX7CuyWNka72l92h0WO5qC8ITfmnIdQEYgwHsoZ4BhjtopGi3a1k
         7dbyM2IMw1Uqdueuz+THTnON9iztUBeXDdWF3z6PNtJ07e2HSeZMZldOQJOERz+BMIk6
         CF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642897; x=1790247697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tA6dVTMdNd1u4g6Gp9FhEdnm3luzFoberRSekZW39k=;
        b=KcYYj82/Qw+C+OptiPrcwgluyvpFYnQQPgimD0ZWlBOR38p+jHPXnw/bqyYg2oFaS5
         ET1E7RanEuo6M0SGqyx/gre3W7TNRY+YDIarZO9L5/jYG/wLPAWwZDXv29kIbInDY41a
         uo1a1oWi3+aMdbPXgQdF4o8Qeeh5EZcK5YndpN8In5XtSJfFjuAK4Csu9tXhW2F4hBgI
         7kcFTUHE7WX2EV+qymLnh/8xyqf0kQ2Ewf2nLbL6MaPScEEN3w4/f00RoW8bdO0e2qht
         uSvC/uOt0ZFVI2ypYXMfxjuh2ynOu+Gt2hBoR3dQzMFeJ5/PsB/4EDcL8Be+bZ5BT5Dj
         0Y7g==
X-Forwarded-Encrypted: i=1; AKwUvBz2XiHkCcJP6AV5ZrA0Z4kHieVPXMiSGXEa/hxHYvmi+/gpFilWZgNsPjvwZ0JAxKaWidEhXuPYvh06JRc=@vger.kernel.org
X-Gm-Message-State: AFuF++kZ/EE9CbQQlSzFdoWQMGchEFPv8jTMnzvhNnCcGQCYtP01Pugw
	bbkeeMGdW0snn+TieaZXdAM/AGEI/yT6HN3y4dE3oNjLi74CkpXVbaOV
X-Gm-Gg: AYBFou28VaFX/hQpSJkIUEESy1e90KHQl9x60BFXQbhLrqqSf0Xhd4v17+oAffmD7ZC
	8+n0v7l8dgEhXwK91tfVpqpicPUEJwzCUjsbUKaWk+lyNJD0uNHq4I4iNiaDDY9cZHxHv/NVyrF
	eY4PAv7Mfh+O/rJXl8pmp8YnCMaiXMaU8WJ3O+AjFDDpiIqDTfnAe5M6qdu9mDKXVIHfwtColAr
	PUfC7wENpXhZu6UWpTxCD7z9/izStqKNTOE1cBWyPObRcWV0YpT2m0HetyB6kA8s25YnwBAbccC
	YUXfQO17pY6aN4/e+oxlVGSrlBWd1livl26KvqhpZiM25cGRU+DCGq4iiuOlZoLfNh0QRP85QHQ
	3czcbwZ1ZC9MMOESzoDSjJjx40SX0dzChS/TACcWu9rWPVvB1fBpeLYeWvIbr8MFxKFok7HUuKs
	hF9duNwLZEsLunt0Z0YpbmYVrPverqyEYBTRkxU2cs78r0vDLnTasDov5vJPpRUFIoeGZvEgBlE
	3qJhYSWnBB3usv8UVy3Nu4=
X-Received: by 2002:a05:600d:8498:10b0:49e:6ac4:b76e with SMTP id 5b1f17b1804b1-49ec0543cf1mr54709135e9.30.1789642896333;
        Thu, 17 Sep 2026 04:01:36 -0700 (PDT)
Received: from localhost.localdomain ([196.235.229.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd32c5e1sm95898095e9.5.2026.09.17.04.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:01:34 -0700 (PDT)
From: Salah Triki <salah.triki@gmail.com>
To: Crt Mori <cmo@melexis.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Salah Triki <salah.triki@gmail.com>
Subject: [PATCH] iio: temperature: mlx90614: Fix dual channel probe condition check
Date: Thu, 17 Sep 2026 12:01:20 +0100
Message-ID: <20260917110121.631587-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mlx90614_probe_num_ir_sensors(), the check on chip_info->dual_channel
is inverted.

Currently, if dual_channel is true (MLX90614), the function returns 0
immediately without checking op_eeprom_config1. This forces all MLX90614
devices to be registered as single sensor (num_channels = 2), making the
second object temperature channel inaccessible.

Conversely, if dual_channel is false (MLX90615), the function skips the
early return and performs an unnecessary SMBus read on EEPROM CONFIG1 even
though MLX90615 does not support dual channel operation.

Fix this by negating the condition so that single-channel chips return
early with 0, while dual-channel capable chips (MLX90614) proceed to read
the EEPROM configuration register to detect whether 1 or 2 object channels
are present.

Fixes: 3d5ead238bc8 ("iio: mlx90614: Factor our register IO and constants into model specific descriptor")
Assisted-by: LLM
Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/iio/temperature/mlx90614.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/temperature/mlx90614.c b/drivers/iio/temperature/mlx90614.c
index 27d6ab5f5d7a..4f79da1f905e 100644
--- a/drivers/iio/temperature/mlx90614.c
+++ b/drivers/iio/temperature/mlx90614.c
@@ -565,7 +565,7 @@ static int mlx90614_probe_num_ir_sensors(struct i2c_client *client)
 	const struct mlx_chip_info *chip_info = data->chip_info;
 	s32 ret;
 
-	if (chip_info->dual_channel)
+	if (!chip_info->dual_channel)
 		return 0;
 
 	ret = i2c_smbus_read_word_data(client, chip_info->op_eeprom_config1);
-- 
2.43.0

