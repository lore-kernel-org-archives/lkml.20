Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C944049DB86
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438466; cv=none; b=db9nKRA/UiEKK6gvDYbIICa0rB5ZMmLAWUqN3m68aIUTgf2+ygNU6+nFhe13c5cneZ+MFFuHj5DCI2a/aQ/YKK9PxJ8yE3QShNro/ydpS1G/UD1oFbvZh/Cxn7joRtwNvbsIzMYHQSf6HuZF51JXEky0VrarLFW6aWIVVJG8MaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438466; c=relaxed/simple;
	bh=3YE1yer+0NRbMtvurGpjSkBGtnurRnJc863L+qyXIco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eXMzg9uXWg0bM6V5J4O6IrX7xUZEw2ak8cMgzeDI0lrNNhgf2Coc3ccjVOytnn13dI6Dua60H/vvcbUbBWs9GkfTV5UWLxiAacFnygpuI/qD8wUryyMhSjnHQnhQ8Stf22jxh0GctpLsOKvzRhshTfKUWqgjzPW/yOqJrAHUxbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjQ0id2E; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjQ0id2E"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482ea739de2so1276135f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788438463; x=1789043263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7Bscj5M4bebt0mHty0y1jQwalSa0CrSkjx1JIVvKm0=;
        b=TjQ0id2EFiHwqw3KsmWvGYPbWFtrvsAORrADOQo6lCrIX9ZrvOWAUKhLvZc1tvV+8G
         ble3RROwfqrnDMa3uKFdpnF/8aloJX8FnFLFrnX0b7PIHzAH0A0xRoigH5YAg32xIzEd
         w8PkVbdwZpiiuAFzKfrFFzXeXHsBASQdCLm2VpiqJL8si3LZ8kZ4EyJV+nuSM2OCK49g
         f0OPeBxvimTfGv9P9wNhn3+yPHIxHux7iivSRAlF0UQ0NKKlx29IqSIKpJRkh7M6XomZ
         /YvOGCnYx11uUC/oWeRIHGmuYYpiBA/uXW2fiJ/7VWtEdADm5iu0hRfK658Yg/6U90HG
         yVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788438463; x=1789043263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7Bscj5M4bebt0mHty0y1jQwalSa0CrSkjx1JIVvKm0=;
        b=pmJ8Xvm4eacwjcfEzPqOqVCAYWt8FjRJ66QnppaT1KEbsYOhRy8oIpOv6r1RH3/IJ8
         hynP6rh0ML8whWQTbc1n6jYyVmS27UGmciP5e3MlEBDgJBm35dXExXDCc2gK+OFjzVQU
         OfpdZwOEiSHA0pa9CTmZAB8Zw1H93IJ8jqQuLTj//h1xqDPytKGgIvEdNO9RfieSOo+w
         E3143EB1tRUUfLAW32LwO2DN19W8PplbZDhLUxmGzCTdOR5VPz1VyEuSKbOEAAelXCOS
         9/n6lvxS0RYkVGzqbZCzU9B1NJ27ywRpeNAi709g/4KyFBNSGCsMXNbujrCmJSztqsEN
         BBDA==
X-Forwarded-Encrypted: i=1; AKwUvBxBsy++2D8+9bUw9rImIVHyTJDBoDWqNhlyNLdCL5e6eO4D19Bzx+KBaXeuW9+PoGYT9+MxOrXNmbQxOho=@vger.kernel.org
X-Gm-Message-State: AFuF++mAmx8UHq7NpBDRUdEOk6I685onpDMouHwYxXXQJNNXl9xu3uJL
	SQgp9sXiUY3QGR3Sy1qXy0LsJGkGnOO9cAgV2nGvrchTSC/p5bXy5gWjCCPSLQ==
X-Gm-Gg: AYBFou1kOeeFwu8jf+nrxTSKFQfGdISf89NzX2G/QmRxL+EKZQVWvKxgLQkvE5a2UV5
	CFPvvsjwlYrkrtqZjGnMAPIu0X79rljsCtiDU76DyfoV4AMhRFNXjLnqOLIo4YWxqbiKu7kc9r6
	eXUjrB7ul3d5EN4jACJ7NQX1V6BN6t8kB2A+TKTVXq5tE5CPKV+TE8XQaT+yN4lNqYyJ3fMwhLH
	r2O6/hhICDjWkn12BUnH5xIxmelRLR0fujVCsJn7zoWTN/hgw2EvxHrHGyDtuD1UnQxL7udmrpX
	mvsokxIdwD8OI/fOxADX9cR5jMPbmg6MORgy791F4gt9ahWNwq/+UuHqpxkVw0EWGFeGWV/0s4p
	OcOzoH1/uogcmRBcVdSaifBp+K07rPUGIuJ8HyxeOLNEhFQMybbvQPKpHCnFF/l05d+7ySnDkRp
	Ni8k6njUQJbvB2f+Ys4KheWLPSmqySWZyqZ6Ks3V/U/fTZJ7KnqBu67J63oXw4q3s5SZeMIB+lM
	3OCwMrGRR+6qMPA
X-Received: by 2002:a05:600c:c16d:b0:499:db6d:bc97 with SMTP id 5b1f17b1804b1-49ce55cb47cmr256137575e9.0.1788438462117;
        Thu, 03 Sep 2026 05:27:42 -0700 (PDT)
Received: from localhost.localdomain ([196.235.147.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6024a8sm67277055e9.6.2026.09.03.05.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:27:41 -0700 (PDT)
From: Salah Triki <salah.triki@gmail.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Salah Triki <salah.triki@gmail.com>
Subject: [PATCH] iio: imu: adis16400: Check return value of spi_setup()
Date: Thu,  3 Sep 2026 13:27:33 +0100
Message-ID: <20260903122733.67109-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In adis16400_initial_setup(), the return value of spi_setup() was ignored.
If SPI configuration fails, the driver would proceed with the
initialization anyway, leading to undefined behavior or silent failures
during device setup.

Check the return value of spi_setup() and return the error code immediately
if it fails.

Fixes: cd888a17f95f ("staging:iio:adis16400: Use adis library")
Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/iio/imu/adis16400.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/imu/adis16400.c b/drivers/iio/imu/adis16400.c
index 4842346f9f0c..f51878066b2f 100644
--- a/drivers/iio/imu/adis16400.c
+++ b/drivers/iio/imu/adis16400.c
@@ -420,7 +420,10 @@ static int adis16400_initial_setup(struct iio_dev *indio_dev)
 	else
 		st->adis.spi->max_speed_hz = ADIS16400_SPI_FAST;
 	st->adis.spi->mode = SPI_MODE_3;
-	spi_setup(st->adis.spi);
+
+	ret = spi_setup(st->adis.spi);
+	if (ret)
+		return ret;
 
 	ret = __adis_initial_startup(&st->adis);
 	if (ret)
-- 
2.43.0

