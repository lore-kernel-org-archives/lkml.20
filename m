Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB89855D88E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707784; cv=none; b=Ib/IGmPRKg3AXIQ1DlN07lHLxudoP3AuamcF12wrzdAnTAWqvSc7CbwOPvIzWBKYcvZHPzeMgBXDq5EuXR/K8cJmWMHvjKJ3vtcL/68ufpUMhEDlZ+bcH6uSPPKrm4SBGC01MrCrzQk2pXU6TNQOmvRQ9pfnBHz4HBO3eK/UT0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707784; c=relaxed/simple;
	bh=tK+69dkX1Ss2BOAb0xlYsxPsrmqxWOjFTt6Zyqbrb1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBXuB9uCG0qz7SMvB495pHvWB/a8SjxgN9m6XoH5gGLn1pzl08wPgt8Amlc9FyJPRMgwhrc4vnTjmfx5FS9qDEQIqsRbBhmWRr5DdC9wjxsNuxgJGjbhhbVq7umIaGn/lECo/GPpJNN5W3ux6dPhN4XgUBLIX8ZHAQrLX0SBJX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxWDo9f1; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxWDo9f1"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f635552aso3563573f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790707781; x=1791312581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tQJNzO8qjbNvG9slVuZDk5HBmwm+kLu8BfTZi71ARw=;
        b=ZxWDo9f1b5qoiq51JB/ZP5ZoGWJD13EtwOEGzHav13I6SAtVQaxwGZnHqG6GdToTN2
         vYfJjUIsmkor6nBcvtJE7Kg8ERvbrctNU5mZiXiZkmF8AHncJoRVW4vd3R9lwB1GC612
         TiuFUDYfOaUe0U2eeDRirI4Je0IlLNo8UPTogcPN+LHQ7BeIeumEK/ULf9O1zNjVKrLD
         PjrY+Cmajd4PMX0oeihZ21QBtfp8+beQGS1Cf/5t8hQ5YyskhZu9mGMl+bmyUmuc2H21
         3llDg9YS+unuhyZqMCfq+Az9X74xtiVNRAb7mtYu58rdSJ0MGTG4y4gvoH5h5MV7zupy
         XQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707781; x=1791312581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tQJNzO8qjbNvG9slVuZDk5HBmwm+kLu8BfTZi71ARw=;
        b=rpGhSb2GOHxZ3G6bMxgqfyBK7x9osHBUIwmdsGwflnXGvrhIzDBju1cNpoamJx+VBI
         6LIJQlosPHWnOGSqOLUT2HgMivXlk/9DnsNodF6YIOTP/l4fNO5aDprfew+4WXNa0JVS
         rWySGiOTfFOn5HUPpcVwxDsLnEXO23/GB0AZqCah/ex5mg/sFjA1NUhOJrVinfwBkeFo
         1UdXTFoQ2CZuttBTV37S8XB1qQ+FW57OH3gLrNrlbdfciqdgaO8v2IVR9mlVSu59GkKb
         E2S7pyJ88K4x0xHoQK5cY2L4Pdjh1TVDKOl5W0U7YcZCUc9BPExEZo22CAcvm8tCPLjp
         Xj8A==
X-Forwarded-Encrypted: i=1; AKwUvBwpZimIsFrACChbFBuHLdAp7ChNwtYvQU9LJcpmJKrpS5vu+pAoOi8/ZtDgHNEaDHQtzW5NlLfdVYPpzzQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzs+TDw+3lVXxZBOJlB8SQZ+JpnKHvwG5xG/IzzYEVX9C73JsX
	+IBsXtGZwZ8vFVw5Bi+SaHdCMW2rbRVINo1LyEt3tYwB0q4w7vqf8i7FqGuWww==
X-Gm-Gg: AYBFou3MX217wRCgraLwZ8QBrF3n8P6tMBuXrBX6reWwhRBoshKsCuKvKVng+N0b8yG
	uHb4C0YxK9JVkA4Pb2wsPNLS9RE8esoAch2a/ag9ZvnkHihBCaeqTlfzJPrEgvJ6v7CS9mdMcxP
	5EolO0ERRBnvp4R1LYGX75yphon7lKLs55ORLGIs+mInAKMKSSX5FFyIyGIUYXXR9BaRF7FxneV
	/Wr56wtIPLmrwmpQZYTFKzI04bm0kNIes5VXnwre8QPRleuW5mimLHK+M13eskM87rRIF0TceOm
	wuI+RKYsZMwEkbMWvd6YhW2FuMHoUkMOTvHBmeHdCUUosn30bvtqIzChHLm5NqRdC95uJ2vFbe5
	L9hgSUSe4Zpv1+Q6uvSIw2GcULNCJyc3LNYVtqcRcnVQijl2Z3rJrySUTnLD6f7+SnjV9LjG7lM
	hzij4NWCQJweGTIMOlBMIM/PiwGZoG+Qr6b6NV05tWM44wemhOkytessgsY/o5iPC+vFlYR1bJ2
	TqmZb9yRIZ4uaDSmRDV
X-Received: by 2002:a05:6000:381:b0:487:2805:6834 with SMTP id ffacd0b85a97d-48afe75100bmr365591f8f.42.1790707780845;
        Tue, 29 Sep 2026 11:49:40 -0700 (PDT)
Received: from fedora ([154.182.121.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48afe6b8d1esm452569f8f.30.2026.09.29.11.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:49:40 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	error27@gmail.com,
	narcisaanamaria12@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH 1/3] staging: iio: accel: adis16203: fix inclination naming and remove unsupported Y-axis
Date: Tue, 29 Sep 2026 21:48:58 +0300
Message-ID: <20260929184900.39515-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADIS16203 measures inclination around a single axis. As per the
datasheet, register 0x0C gives a 360-degree output, and 0x0E gives a
+/- 180-degree output of the exact same measurement.

The current driver incorrectly maps 0x0E as a separate Y-axis. This patch
removes the phantom Y-axis, updates the naming, and adjusts the timestamp
channel index.

Note: The ADIS_INCLI_CHAN(X, ...) modifier is intentionally kept to
preserve the existing userspace ABI (incli_x_raw). Furthermore, removing
the phantom Y-axis inherently shifts the scan indexes of subsequent
channels down by one, which is expected to correct the hardware
representation.

Fixes: 2df79e1bddc4 ("staging: iio: accel: Rename source files and update Makefile")
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/accel/adis16203.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
index 830ff38fda92..eddb786d4747 100644
--- a/drivers/staging/iio/accel/adis16203.c
+++ b/drivers/staging/iio/accel/adis16203.c
@@ -29,10 +29,7 @@
 #define ADIS16203_TEMP_OUT       0x0A
 
 /* Output, x-axis inclination */
-#define ADIS16203_XINCL_OUT      0x0C
-
-/* Output, y-axis inclination */
-#define ADIS16203_YINCL_OUT      0x0E
+#define ADIS16203_INCL_OUT       0x0C
 
 /* Incline null calibration */
 #define ADIS16203_INCL_NULL      0x18
@@ -129,7 +126,6 @@
 
 enum adis16203_scan {
 	 ADIS16203_SCAN_INCLI_X,
-	 ADIS16203_SCAN_INCLI_Y,
 	 ADIS16203_SCAN_SUPPLY,
 	 ADIS16203_SCAN_AUX_ADC,
 	 ADIS16203_SCAN_TEMP,
@@ -208,13 +204,10 @@ static int adis16203_read_raw(struct iio_dev *indio_dev,
 static const struct iio_chan_spec adis16203_channels[] = {
 	ADIS_SUPPLY_CHAN(ADIS16203_SUPPLY_OUT, ADIS16203_SCAN_SUPPLY, 0, 12),
 	ADIS_AUX_ADC_CHAN(ADIS16203_AUX_ADC, ADIS16203_SCAN_AUX_ADC, 0, 12),
-	ADIS_INCLI_CHAN(X, ADIS16203_XINCL_OUT, ADIS16203_SCAN_INCLI_X,
+	ADIS_INCLI_CHAN(X, ADIS16203_INCL_OUT, ADIS16203_SCAN_INCLI_X,
 			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
-	/* Fixme: Not what it appears to be - see data sheet */
-	ADIS_INCLI_CHAN(Y, ADIS16203_YINCL_OUT, ADIS16203_SCAN_INCLI_Y,
-			0, 0, 14),
 	ADIS_TEMP_CHAN(ADIS16203_TEMP_OUT, ADIS16203_SCAN_TEMP, 0, 12),
-	IIO_CHAN_SOFT_TIMESTAMP(5),
+	IIO_CHAN_SOFT_TIMESTAMP(4),
 };
 
 static const struct iio_info adis16203_info = {
-- 
2.54.0

