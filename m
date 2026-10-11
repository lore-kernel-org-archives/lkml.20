Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724DD1990C7
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694590; cv=none; b=R/7/XzX+lYfzj6ZRat+Fb2lX8uzPUCKGLmj8UVXz+INU86NBzEso5EEK69AEh6+UZVJnnHxKQAXsLuQTe2gz1JHz3iQQXYox3abnjrsxVNvIbJwVOdAjdMze+iKZsKr7FW3xlLei8BuxSNPJthDE+YeuXirUOUJKqwNyI3XA2m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694590; c=relaxed/simple;
	bh=O7ul0WmTP+iMseIN0P2Bp/XfuNbs/+G4cJMcENk65x8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ChzhbJpj6ktekvM0frz+616t65FbBppWjRNpHfnTLGA6o8NUDq8H0DDQ306U/zsxjYZTISYJ9WCt6vrTtgl1d7hWDD6OkgjkctAHMK9a+C2klcte7c3LX3bdxxH9helIcGBVnnGDGwxrTvuDND2PPS0hJnPiRYfgmLV8NBEKNQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qX3RYAbP; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qX3RYAbP"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3154204eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791694587; x=1792299387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NyBqrn/uBzxgl92CYCl9BYbWFbHQuF77V5STTyBOvYs=;
        b=qX3RYAbPPKhDzD6EMyorW5wbejzwJRnYsZ7eFKeptM/Gp8D4ZAuXOz5Ybbny4/h7uo
         /C08HOL5sriJh0PYZviaStHY1ZVFsLn/I7wAZj3QVPxU2Z+Ke5FxjtJAMvkpFdAs+7uo
         fmfXvUwyuYaXNGgL8wtJXB4OqDW9xplJENKQTT/QXdkKMvhxpWoBbTzZzQXEXUC3ncPC
         3s0GEUFaa980QgrV/bVf0QvBca7xw3122kV9IRQaQmZ409DtXnjWz6itM8KI5gwb9GHw
         TQshMx3xh4JQmczdTwqietwQDc4ftJug9BWLh2uOe4AiKkjbA3VrTPF3nJrGiJEtibvu
         eu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791694587; x=1792299387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NyBqrn/uBzxgl92CYCl9BYbWFbHQuF77V5STTyBOvYs=;
        b=0Ch08CKkuV//GOqHueUAJR2jSnJKZEXCUK5U8ayvvecFIBKaSh/XCwD8zsTb7u43DS
         UQHqRtQDzpwz10ySqkepjeYMHpvun0/ErBytQ7sb52Gy8AQJSiE/fJg3Fnz/5Q3pbrVn
         mo/7GVCyHd+AP2O0At4o7ofDJef6VUm6b4p4POs9j0i/TFZsjwyuwJx9OaROmsbZuBK5
         MTsRRNoTD2zg6kP1CGzoppmTI0iWXynvzEjJ3B3ghwYXUPG1sPK0zgIcg5D+llgvhHJd
         jcH43Y8oUWcGGyq99wDHDrfByqPXMGnAJY/LDXPba8a7ZF6v7oOeYn/lSP7mJyJN06a2
         IXzw==
X-Forwarded-Encrypted: i=1; AKwUvBx/iGkg/jcx/6iynW4DTEG8SYfThSMpzOmeEeVJ4qqUkEeyFWrIR2mvDZslV9bs29h/P8w0spjHHi4/Cdc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkqyqeJX/oDveI4r/xGwX+hnmCP0TccOn4igvZl2ZqNYda3p8b
	v4WdNjXOvGImfQpkIIUQIoifabQoPvadkbOVEvhXPznYXnFmFXqZiI5VUwUvfe0YFYcaRg==
X-Gm-Gg: AYBFou0+3nuGECqu9qEeBMISpX/AjLZQoRkEcMwSkTbvOO1swuOaceVYI3HaOAOln/s
	oHIcPaaXjp3HuEzlcKs0RaaLL9ngTvudDouYnpca5qvfMGKzO7njJtIz8r939D4DXC+G8wyuSKU
	GtDdNcrHqiSIwyfFeDqdugc6A0G7MP6vQOr5QGlUxZ3XNM6ilew3dWAl8/tPDvw7zwzexuaIUCb
	8hkehDEK8nqDthCsVqj0e3EuB5F0jKNXW8A0/484JF271gBb3lNu63Ie73KZDHdBc9Un5g6e05I
	cM3C3ZwFXkO0d5mTsrMrdS+Ei1dMGzsc/tfnZDbdel2pwp/BigesYFazxUSkNuxUPFvNkuQUC2G
	POFmVfbH15y0pfNUg8BqHO90+pHmw1UQ/JuHfYCsJE745IHjcVbb9E3hRaACK3wx1VSNgckhhUa
	pG0Tx3fmzFSoMqlhgw7SWz5nwD8Psr22Ygry9di7wl5fIqsDmXgyScrhKFJuoM4Xzy4uxvE6p4c
	0xc8yzzIa3OxfM5v9i8dQ+FPHTX9RsuVoP3OAkhUCSA1UE1boxb44ZQL3Z2q0NX+5rPBGPZzZlQ
	wLv7FT41+V+q8BpMwPBiVBpprrBgqw==
X-Received: by 2002:a05:701b:2309:b0:158:7ea9:4a76 with SMTP id a92af1059eb24-16a6187f08amr10122967c88.16.1791694587274;
        Sat, 10 Oct 2026 21:56:27 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567bd18sm18518278c88.21.2026.10.10.21.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 21:56:26 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] iio: imu: inv_mpu6050: fix magnetometer scale of Y and Z axes
Date: Sun, 11 Oct 2026 10:26:17 +0530
Message-ID: <20261011045619.357261-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

inv_mpu_magn_get_scale() returns st->magn_raw_to_gauss[chan->address],
where magn_raw_to_gauss[] holds one coefficient per axis, computed in
inv_magn_init() from the per-axis factory sensitivity adjustment values
(ASAX, ASAY, ASAZ) of the AK8975/AK8963 magnetometer.

However INV_MPU9X50_MAGN_CHAN() never sets .address, so it is 0 for all
three magnetometer channels. As a result the Y and Z channels report the
scale computed from the X axis adjustment value, and userspace scales
the Y and Z readings with the wrong per-axis calibration.

Set .address to the axis index (0 for X, 1 for Y, 2 for Z) in the
channel macro, matching the order used to fill magn_raw_to_gauss[].

Fixes: b1392de06184 ("iio: imu: inv_mpu6050: add MPU925x magnetometer support")
Assisted-by: LLM
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Compile-tested only (W=1); I don't have MPU9150/MPU925x hardware. I
checked the built object: before this patch the X, Y and Z magnetometer
channels all have .address == 0, after it they have 0, 1 and 2.

 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
index 38c3f3b398d4..1614f49be66c 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
@@ -1576,6 +1576,8 @@ static const unsigned long inv_mpu_scan_masks[] = {
 		.type = IIO_MAGN,					\
 		.modified = 1,						\
 		.channel2 = _chan2,					\
+		/* index of the axis in magn_raw_to_gauss[] */		\
+		.address = (_chan2) - IIO_MOD_X,			\
 		.info_mask_separate = BIT(IIO_CHAN_INFO_SCALE) |	\
 				      BIT(IIO_CHAN_INFO_RAW),		\
 		.scan_index = _index,					\
-- 
2.53.0

