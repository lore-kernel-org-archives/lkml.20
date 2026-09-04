Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69F1481643
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524197; cv=none; b=QUdoZT99QFS4ytvuX/uwD4WINXWL2cJC2nlrgeKaHY5glUGtdRrQt4UCBLAezYMmJphhih1sFJW6dZJOMaQpav8sSaRY7VtEoN0haOnsNH5ftFy9Wiiu6oJY3HLymWuN3yQR0KYnB8xFoPoKEvMsGnFWexcwRvOU04zmduuqv+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524197; c=relaxed/simple;
	bh=TsNOvbA0ErkQYr4k4Y2OT+QWzLIYwGJJUAjwZfFFrNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b4V19BuynOi8Lfd9UU07SrrUbc1jcwoLw4CY2eSiD86fwB1ZgQDcWosW0ifz0OX1u9V9TJ+8VQCpeH53/IM3zWD4xPazr2K3aaWcxXRmTLFGsFFUMQiDuIrWh+9bWxTRIyWXiQoTrFRGxRtP8EU5LFs3AoaZTcea63XTVcFlrRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1en6Il1; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1en6Il1"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4b39befc6a8so530988b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524195; x=1789128995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n9lG93bvWAdHFThZPOqn3PZGlfcTpmPFX52MaXkuUFA=;
        b=E1en6Il12LhZM0LQkO8omJ+07+1fv63o6tAjm7OCyizMhnweaQ+MtDun9gz6f8jRwj
         r6/uxu/KCHcviNs5CndQqakt/3HhQc5unlhB6YaJ8XLBuwdKwQXKId4Q260TrbjsK068
         DE9SFCPpx42creI8g9iSaoxRxpGqv4Mi9pG5Zfl+8smBprLWN0+EQhabSwHziqxLlJbB
         guMdtgTVyKltS5BCvw+vBnqqzyixhpzL+5ONHQMsPjgMYBqrHjlEwJ+AiB6fABqrvvMH
         KgyGRp5bIJgoiRoG7mSIzkaZg+8hktxuwlCnyXEaARVlZMYTW5bt13c7IbUcyZzWehvP
         X9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524195; x=1789128995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9lG93bvWAdHFThZPOqn3PZGlfcTpmPFX52MaXkuUFA=;
        b=M7kl5t8B1PtYMbxEBEfn97FMr61u6XFpRli8DPylwQeqMTIZNPLV047+nJdp3y8OIQ
         HgDFZihooHjrXDXXVpuabI38F9ZPQA4RdUdtA1rQpTSNO7739PUbucZ3rN2JmTwhA+0s
         88ruBAFpeZSG1oIxbNBv5AIM5MPtzRAhty9wXJoPllSDIZTuvTBcSQn7Ho8sinQtfdK+
         plrmJ/1M7CH16Z1Tv1u/IP6WQHIsxR9bt49DuL+ctb4VT936l/NTorrbzgNkQPvXhPkK
         P6U5Jp9AJdNDaRd3LsGvfvANEvu9+ZNAr+cAyNDjMqH3Ggno5zhgGm9O0z5KZtNNso95
         Ztzw==
X-Gm-Message-State: AFuF++mSqSFeIvRKMmy8HGulsM9265B7AFQT/4AkvhNTpuHTAUJulk4i
	sSSUSwICMPwsr7D1XTYY1XZ61YiTSz7ZDUig3HgVFQY1e4qPUt2+cimd
X-Gm-Gg: AYBFou0mhI//ddYz8qtzifjuJjoeMFvg0YgpTt297HNLSoinDr6Zv0gK4ToI22XAq8J
	ogimXS6w1CT5yDoWB0xuDI+b7ZAk/qBYfA0yLK/Ytok+aD/uvmbtYiSBwn66V33+0XJNFOJE0lj
	31eOKCdEwBpr8h/z1ytVHhZUnjUhejMnA1wSDOcy6jfbToR/9B1ZE+BLSOZWsZyPQcNMRvz8dl5
	G1w9wFDROB/EIVEhmmYvxu4dM7sr3Vk6TFmpF3sBTaGCrCrlSpOH2QPjIzaiDfX1sGukMkjhEAo
	t1D3lKcfwzAUJpKMc98eqi1JComhJ66BEFLRTXXP6hFTSvAa5fN5tmuUtCkB6/JohiuvBynNMuF
	Vhruv0+J7OrnsvW6RzHGxkw/qqsl2Kz5mSNkNvCN+u8rM5f1BmNSzRmr4EGu3m16MXchuYZcsAK
	R4+zxBN6edtIUVHOS4OFOv/23OYAw3HoHprWsH5ZYNMEYE4fkY7BidlcPhsE4dIFr8RN6c8Og0C
	2nFsK++jqFm4I3c6/yd6C7IMw==
X-Received: by 2002:a05:6820:1997:b0:6b7:46fc:1d1 with SMTP id 006d021491bc7-6b746fc022bmr2190770eaf.48.1788524194569;
        Fri, 04 Sep 2026 05:16:34 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm6557284eec.26.2026.09.04.05.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:16:34 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org
Subject: [PATCH] iio: fix typos in comments
Date: Fri,  4 Sep 2026 17:46:25 +0530
Message-ID: <20260904121628.25537-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/iio/dac/ad8460.c             | 2 +-
 drivers/iio/dummy/iio_simple_dummy.c | 2 +-
 drivers/iio/light/ltr501.c           | 4 ++--
 drivers/iio/pressure/rohm-bm1390.c   | 2 +-
 drivers/iio/test/iio-test-rescale.c  | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/dac/ad8460.c b/drivers/iio/dac/ad8460.c
index a2292810e4cf..469294fd1783 100644
--- a/drivers/iio/dac/ad8460.c
+++ b/drivers/iio/dac/ad8460.c
@@ -304,7 +304,7 @@ static ssize_t ad8460_write_powerdown(struct iio_dev *indio_dev, uintptr_t priva
 	 * If powerdown is set, HVDAC is enabled and the HV driver is
 	 * enabled via HV_RESET in case it is in shutdown mode,
 	 * If powerdown is cleared, HVDAC is set to shutdown state
-	 * as well as the HV driver. Quiescent current decreases and ouput is
+	 * as well as the HV driver. Quiescent current decreases and output is
 	 * floating (high impedance).
 	 */
 
diff --git a/drivers/iio/dummy/iio_simple_dummy.c b/drivers/iio/dummy/iio_simple_dummy.c
index 19fcdbbc11c6..28ae1e7b593d 100644
--- a/drivers/iio/dummy/iio_simple_dummy.c
+++ b/drivers/iio/dummy/iio_simple_dummy.c
@@ -116,7 +116,7 @@ static const struct iio_chan_spec iio_dummy_channels[] = {
 		BIT(IIO_CHAN_INFO_OFFSET) |
 		/*
 		 * in_voltage0_scale
-		 * Multipler for userspace to apply post offset
+		 * Multiplier for userspace to apply post offset
 		 * when converting to standard units (microvolts)
 		 */
 		BIT(IIO_CHAN_INFO_SCALE),
diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index fa0d16890c8b..52125fd52f75 100644
--- a/drivers/iio/light/ltr501.c
+++ b/drivers/iio/light/ltr501.c
@@ -478,7 +478,7 @@ static int ltr501_write_intr_prst(struct ltr501_data *data,
 		if (ret < 0)
 			return ret;
 
-		/* period should be atleast equal to sampling period */
+		/* period should be at least equal to sampling period */
 		if (period < samp_period)
 			return -EINVAL;
 
@@ -498,7 +498,7 @@ static int ltr501_write_intr_prst(struct ltr501_data *data,
 		if (ret < 0)
 			return ret;
 
-		/* period should be atleast equal to rate */
+		/* period should be at least equal to rate */
 		if (period < samp_period)
 			return -EINVAL;
 
diff --git a/drivers/iio/pressure/rohm-bm1390.c b/drivers/iio/pressure/rohm-bm1390.c
index 57941fb4a535..db6b995afe86 100644
--- a/drivers/iio/pressure/rohm-bm1390.c
+++ b/drivers/iio/pressure/rohm-bm1390.c
@@ -267,7 +267,7 @@ static int bm1390_read_data(struct bm1390_data *data,
 	guard(mutex)(&data->mutex);
 	/*
 	 * We use 'continuous mode' even for raw read because according to the
-	 * data-sheet an one-shot mode can't be used with IIR filter.
+	 * data-sheet a one-shot mode can't be used with IIR filter.
 	 */
 	ret = bm1390_meas_set(data, BM1390_MEAS_MODE_CONTINUOUS);
 	if (ret)
diff --git a/drivers/iio/test/iio-test-rescale.c b/drivers/iio/test/iio-test-rescale.c
index bcd4a607be19..de4a09f432c0 100644
--- a/drivers/iio/test/iio-test-rescale.c
+++ b/drivers/iio/test/iio-test-rescale.c
@@ -587,7 +587,7 @@ KUNIT_ARRAY_PARAM(iio_rescale_offset, offset_cases, case_to_desc);
  * @str: The string to parse
  * @nano: The number as an integer
  *
- * Returns 0 on success, or a negative error code if the string cound not be
+ * Returns 0 on success, or a negative error code if the string could not be
  * parsed.
  */
 static int iio_str_to_nano(const char *str, s64 *nano)
@@ -617,7 +617,7 @@ static int iio_str_to_nano(const char *str, s64 *nano)
  * @real_str: The real value as a string
  * @exp_str: The expected value as a string
  *
- * Returns a negative error code if the strings cound not be parsed, or the
+ * Returns a negative error code if the strings could not be parsed, or the
  * relative error in parts-per-million.
  */
 static int iio_test_relative_error_ppm(const char *real_str, const char *exp_str)
-- 
2.48.1

