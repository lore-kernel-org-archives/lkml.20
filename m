Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A59F42E439
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925941; cv=none; b=NtQbNNVnyXYUbtrK75yec/pqK9Cnhkbn7vl5xuAZf8KLjeOM9u8ey7iztJqamOOu4umtAyf0Hk/RggG3PwgN8qrDx7l1iUMyFot6QGfYKtQjT18iHvkT+FE0nCEaxF0uqyW7pJMk2SU5QMhMRGXA10il3UDvcaqiUFuUwFTluT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925941; c=relaxed/simple;
	bh=nWsKuAdUddp0Tleqx+ekPg6QLRLSsPPMTflS6Pctl/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQlqPQA5vyEe/tTC53V34kDtBbEqM57GcgV7U0uWDrKvMFxdgz/vDfzs1Dk5DQyvn/Q4aV4Sopf/5QpdDX3unFGelAqYOLKIWHwysTnN1GJ3jRZpvT9y1N7r/IVLSdz0u156OHThiZhlGyp732xxSOoffGleCv6yrf9CRBZhfss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaVf0CyC; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaVf0CyC"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5da7416f9so62979711fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925933; x=1791530733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XI/mSKvddqfnhotYCwOocDf6jqT8wgERZ/92dl/Mty0=;
        b=JaVf0CyCMjtAzpvyW3crvDN3RyNCsjasAEWg9bf/64eHm2OiyRf3NaZseDbawV2OVK
         qhBO2i5dq32MrXf6ZH4YO9i0aDn2M8sa9uyiLaV3viSgEiNHa6hn3+k/BMnyoGEAB7Yh
         n7WHn2oOa29jxPnvZKqQ4oy7rEzESV+DaA1fwGRZWS8/fghn+tXBopXmPrl6kJhttZbZ
         D+1FPYUbCqFxv9rC27BFca4OD3Uyi2A2Hh80o2FQo+WVKVwSt06BWNmx/VeZZTa2TOwv
         khHYtKyzRmnjWegAx/ZkxRnWv6EnkPqcRyice0jooHTqm4r9Uq6wICleDAZgK84EnPGS
         GpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925933; x=1791530733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XI/mSKvddqfnhotYCwOocDf6jqT8wgERZ/92dl/Mty0=;
        b=Xlv0Y3CN6wusGusJ5cadHs+8SlpyQk4nXistAaVm82LMTFZMflNXQkPlMnVC3MI46D
         iyF4W3hPAZeL/9pG/aF1i4c4dkpn1c69WH2MjnAZPxFZNxibABuFjyCVdh6W60BPXvcl
         Cy7hhAjFEPUJf0bJ9HEzFz3gJnmv9/Wn6LufxBq6qJG8sILpflyQXKNglhigjQD7DWE1
         +lzTQwJvusmPqVehvqAjJFmOdqiOE/VeeQNjlxd3DR/odi2bnNq26iSCv+wdQAL8ohXg
         hrvFlfb0B6l1JPMkRlb32PrqRb/m5PYKLEbdxW1oeXrohlayXp+FriJufJnpkO8Ljv7R
         1Wfw==
X-Forwarded-Encrypted: i=1; AKwUvBwWdF5hpqI9rCVfUKJvE6TZ2lKPwDDWZZkPxjHB8arEsmyhr9VEr2prrbSCECHzCVOgurxd/CSST8iV7Us=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW7XwTwFj/Qt/iD2gODqYNMZT31NvgR3YvRSUlKtg2j4l3tzLO
	O4V/Fkp+h3bVRx6dkXKPXfjL4DbwyCTimwQr9d45dL4vNAPZLr+fBCiy
X-Gm-Gg: AYBFou0sG+LcmGqDo9bLzZd31WHt02iJfTHwLgOSSJteDgkdYIUhKTWw312aqyVHxQ6
	63znQSCxEJFxS8e2JNayRzqtO6YpiOPHYtqy4q4KE4APiuAF8uBBc1685/180fD93ScpNl9/KeV
	zByqSJQJ1dQ2JAcJWDUNFQruYC3g2gz+8Ox9fBnDXhSFQlKnD+hJkgvvkMbY/xRPqaMMEYvW4TT
	ZjgB1WBgAY8AGGMM+T4FLB26Q7q3v2USHGHD7TCWfU5KqV8EEjGbPh+BrpujHk7dUKXNQTbkmXO
	S4+H8kRcCRfXm1Hsj8Fs1S4rEOf34MB84194Uye9SU+Q210RHMDvuJOav+ybjIumDIYBtz+yg90
	HVnzdGHMgPp8qJe2nIy24U5dIWAg/8Jj11F/QNtpL3v4lEKg7z3irJJxQwogNijV/oxzCRdajCa
	b5kdE2YWFV7X/RbPSFwwscOwqy3oYL/DjHwlQ9cQBbzGl21qHdf7tA+cbJKeOBYBc42T7c7fm9/
	ja1wARNtjfWZYV8C5P9NP4TL60/Iz/qwWVp8yqItXrPKCJR0NRZ7MFEyxB6XFA8LvWrWw==
X-Received: by 2002:a05:651c:b11:b0:3a7:7a0e:5703 with SMTP id 38308e7fff4ca-3a87ed423a1mr4553631fa.2.1790925933023;
        Fri, 02 Oct 2026 00:25:33 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e324350sm6724731fa.36.2026.10.02.00.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:25:32 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v11 4/5] iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
Date: Fri,  2 Oct 2026 10:25:25 +0300
Message-ID: <20261002072526.250081-5-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002072526.250081-1-zoone.rupert@gmail.com>
References: <20261002072526.250081-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let userspace drain the FIFO on demand rather than only from the
periodic drain.

With a trigger attached the FIFO is not running, so there is nothing to
flush and the hook returns 0.

Hold the mode across the drain, so a concurrent buffer disable cannot
free active_scan_mask while it runs.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 36 ++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 294ddccd264b..959f4bdd3995 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1091,22 +1091,30 @@ static unsigned int dps310_fifo_push_held(struct dps310_data *data)
 
 /*
  * Read the batch out before compensating it, so a pressure entry pairs with
- * the temperature preceding it rather than the last one in the batch.
+ * the temperature preceding it rather than the last one in the batch. Stop
+ * reading at max_scans rather than after it, since entries leave the hardware
+ * as they are read and any extra would have to be thrown away. max_scans of
+ * zero drains everything.
  *
  * Returns scans pushed.
  */
-static int dps310_fifo_drain(struct dps310_data *data)
+static int dps310_fifo_drain(struct dps310_data *data, unsigned int max_scans)
 	__must_hold(&data->lock)
 {
 	bool pressure_enabled = test_bit(DPS310_SCAN_PRESSURE,
 					 data->iio->active_scan_mask);
 	u8 kind[DPS310_FIFO_DEPTH];
 	s32 raw[DPS310_FIFO_DEPTH];
+	unsigned int scans = 0;
 	unsigned int pushed = 0;
 	unsigned int cnt, i;
+	bool is_pressure;
 	int rc;
 
 	for (cnt = 0; cnt < DPS310_FIFO_DEPTH; cnt++) {
+		if (max_scans && scans >= max_scans)
+			break;
+
 		rc = dps310_fifo_read_entry(data, &raw[cnt]);
 		if (rc < 0)
 			return rc;
@@ -1114,7 +1122,12 @@ static int dps310_fifo_drain(struct dps310_data *data)
 		if (rc == DPS310_FIFO_EMPTY)
 			break;
 
+		is_pressure = rc == DPS310_FIFO_PRESSURE;
 		kind[cnt] = rc;
+
+		/* Only the measurement that drives the scans counts */
+		if (is_pressure == pressure_enabled)
+			scans++;
 	}
 
 	for (i = 0; i < cnt; i++) {
@@ -1151,7 +1164,7 @@ static void dps310_fifo_work(struct work_struct *work)
 	int rc;
 
 	mutex_lock(&data->lock);
-	rc = dps310_fifo_drain(data);
+	rc = dps310_fifo_drain(data, 0);
 	mutex_unlock(&data->lock);
 
 	if (rc < 0)
@@ -1186,6 +1199,22 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
 	return 0;
 }
 
+static int dps310_hwfifo_flush(struct iio_dev *iio, unsigned int count)
+{
+	struct dps310_data *data = iio_priv(iio);
+
+	/* Holding the mode keeps active_scan_mask alive across the drain */
+	IIO_DEV_GUARD_CURRENT_MODE(iio);
+
+	/* A trigger drives the capture instead and leaves the FIFO empty */
+	if (iio_device_get_current_mode(iio) != INDIO_BUFFER_SOFTWARE)
+		return 0;
+
+	guard(mutex)(&data->lock);
+
+	return dps310_fifo_drain(data, count);
+}
+
 static int dps310_hwfifo_set_watermark(struct iio_dev *iio, unsigned int val)
 {
 	struct dps310_data *data = iio_priv(iio);
@@ -1319,6 +1348,7 @@ static const struct iio_info dps310_info = {
 	.read_raw = dps310_read_raw,
 	.write_raw = dps310_write_raw,
 	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
+	.hwfifo_flush_to_buffer = dps310_hwfifo_flush,
 };
 
 static int dps310_probe(struct i2c_client *client)
-- 
2.43.0

