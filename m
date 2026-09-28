Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2702AE78
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605510; cv=none; b=JL+XUuQ8kO46JH9GGdvYnQidkiTfzKmZWjURXrLj+Zn5nEujDcWq3UoB+EsSwNCz9vMnOFV1IWuNaEzzYVwDc/yripoubsrbCR7W+GZhATN9fB2IXCDDnT+2GN/ngqcB20eQHdZGGpGl4gSGRVdjd3E3z/4NcehduXgt+BgfOPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605510; c=relaxed/simple;
	bh=mf3hvugbE3AhK+xoz4r5nVLwHXOKy2f0yQoZNu6pYaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WidtI0o+D1PY0TDci7UjGH81zH63FDnbXpZx3LwIPf3531xe8YjgZemaZeM7zqp3MzY4PP2t2C8zM3khxdnxvkbdE+Hbtq2pJ3GTm8NLhSMJ8BQlx+e3iSZAyFWvmL7snyQzjqOFS7pQuCl1iN24E8wb39j9nbR+ibhRDoy0dPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ogZybVCJ; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ogZybVCJ"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3115c4451c8so2483005eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790605507; x=1791210307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZgUQuTykGxBSJt5x1FfopNzOuVlXIKdkSB27V8r4Cs=;
        b=ogZybVCJHdlAIaE6MiPjS/tgK28jHFZ/gD/gJ8Hnts382Wo8PSMCixVTyw24y7mIvu
         FrFQ9Vd93vE40qoJaNGQY9IYwfbv9YV+NHVi5+fXKwDLXWFiXmDrL/W3gtiqNpThXEIO
         /euxpDvAOMy79Y6b6ectskfrDdcx96KVygO9fo2WscV1stHfJRiachs3Wi+EgLAc8B61
         Z5Co29R3E6QDcYweTc65IbKHWP1X0+CW62G4MSEuoZY/icFw3F1LDbz16Yd4xdRY0R2V
         WP8Rt2lIozQv+IQ+maApMam8nBKsJXeo4fcA2PSSFQTQiZtMrSZCM6Q7YAlCdLKdA66D
         J6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605507; x=1791210307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZgUQuTykGxBSJt5x1FfopNzOuVlXIKdkSB27V8r4Cs=;
        b=e24ZgvLZ0LUm91wNiSpgEi9ZcIXFirR1TmaqhnNU3vuprqjvELVHsYhtSAlwMF8wrt
         Uy6/SF49ZhbA7XGWIzga0TLH18N24wO4y9IOLptapwskd/3b4BkCaIeRWprqvbbXb5TL
         W4x/l85ATOPkIkI2csOq7uaKlrwzPFqxfDghz8PaaomnA+d8DogWQhzrRRNBnDFH34Rg
         VeXpmvq6LeLOR6BrbZDtxF3nU+tZSD2iDJqGMvINHZHQuNs4L8v6i3DrtKx5WB3JfJS2
         SYNTOyAAam6XChVDrTaTfcMH6pe3TLey9FA9S2irtOIzMIKowhrmlhe5WgHYPKAhID7a
         IjQQ==
X-Forwarded-Encrypted: i=1; AKwUvByxs23EprYAf2GaNxIzkVMhQjgXpqzzZyMI6IROSvzNyYh7heDSGMqnx4q/AaUG40soKBETjtcDFo/X9hA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdiEcHJZREP8Id15OrXbax2IEIgh3iypFzzoHS9O0X6nWrU0tX
	4Ve6oZZoM/jqnfYTp2RYrNat15tCSoDU7fdXspOqXLJvT+/3jZ01/+SL
X-Gm-Gg: AYBFou0iHh0X8EUXn/smBULqqt5x8LDnhFTpirWSI6qhrACc/tp8t7AR33PlWkzqQIy
	liuqAprFP/4pUbs28TVnqr0DYz2Npa99e/2Ds5frUw3tMItD6S3Kz2mVCga2s2nwZeVbZhKxMyr
	qOtfis0SLp2+j0dWKr42vmh59doQkdXmEM7FJesaFOwjwOJT3CGPB9AMF7JU20jvM7XpBmIiz3A
	NE1CMOAaMQeleumXwh+6+tKe/JGWf45jls9vKMRhBeSbUC25QToqm9wGM/DY69IsdUompneLEWs
	BIq+/jp67Bzj98VLXGwqVEjcBWgFffmiI0QR/uAymmGm2tDRhFI/AECwrM/8GB/ix5udnldBYHD
	Fdx3H7WRQY63zNxRoWTdhR0jUKOfe04CARe1RpfiH29Plk/kBuL3oIuNAb1cIwMlfGwdiGEf3aC
	+jGSz+zMpnWQIf6qjbbW85vLx8810tOf7ipt0+FA7zXGmxfQ2BrVK38rUvsqFzzctZak0N9ydwe
	lkWDGeWHQodhh9R0+S1nxDNT4D50TIb72jHD20=
X-Received: by 2002:a05:7300:c3a8:b0:348:201a:6c88 with SMTP id 5a478bee46e88-348201a6eb5mr2740212eec.13.1790605506418;
        Mon, 28 Sep 2026 07:25:06 -0700 (PDT)
Received: from primary ([117.203.246.44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3444fd04d93sm10670483eec.12.2026.09.28.07.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:25:06 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Siratul Islam <email@sirat.me>,
	Tiberiu Breana <tiberiu.a.breana@intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Vidhu Sarwal <vidhu.linux@gmail.com>
Subject: [PATCH] iio: humidity: am2315: fix negative temperature decoding
Date: Mon, 28 Sep 2026 19:54:50 +0530
Message-ID: <20260928142450.103799-1-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AM2315/AM2320 report temperature as a sign-magnitude value,
with bit 15 as the sign and bits 14-0 as the magnitude.
am2315_read_data() stores the raw value directly in an s16, causing
negative temperatures to be interpreted as two's complement. Both the
read_raw and the triggered buffer paths are affected.

Decode the sign bit before storing the temperature value. Positive
readings are unaffected.

Fixes: 366a3270c1c5 ("iio: humidity: Add support for AM2315")
Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
---
Other implementations [1] [2] for the same sensor have hit this bug when the
sensor was placed in a freezer, although neither is kernel code.
 [1] https://github.com/adafruit/Adafruit_CircuitPython_AM2320/issues/1
 [2] https://github.com/letscontrolit/ESPEasy/issues/307

 drivers/iio/humidity/am2315.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/humidity/am2315.c b/drivers/iio/humidity/am2315.c
index f29baa251f9f..31c4f52a0108 100644
--- a/drivers/iio/humidity/am2315.c
+++ b/drivers/iio/humidity/am2315.c
@@ -113,6 +113,7 @@ static int am2315_read_data(struct am2315_data *data,
 	 */
 	u8 rx_buf[8];
 	u16 crc;
+	u16 temp_raw;
 
 	/* First wake up the device. */
 	am2315_ping(data->client);
@@ -144,8 +145,15 @@ static int am2315_read_data(struct am2315_data *data,
 
 	sensor_data->hum_data = (rx_buf[AM2315_HUM_OFFSET] << 8) |
 				 rx_buf[AM2315_HUM_OFFSET + 1];
-	sensor_data->temp_data = (rx_buf[AM2315_TEMP_OFFSET] << 8) |
-				  rx_buf[AM2315_TEMP_OFFSET + 1];
+
+	/*
+	 * Temperature is sign-magnitude, not two's complement:
+	 * bit 15 is the sign, bits 14-0 are the magnitude (x0.1 degC).
+	 */
+	temp_raw = (rx_buf[AM2315_TEMP_OFFSET] << 8) |
+		   rx_buf[AM2315_TEMP_OFFSET + 1];
+	sensor_data->temp_data = (temp_raw & 0x8000) ?
+				  -(temp_raw & 0x7fff) : temp_raw;
 
 	return ret;
 
-- 
2.53.0

