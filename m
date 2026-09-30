Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B22E342CB0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762532; cv=none; b=CbzMMKzu5arRbBkNHAvycCYICw/W7Ewpk+CghRMyLFoEY7ITNMK4Xbiu+uVBPx4LJlveujhkonNE6nuljcRQd0lEsQQpFFy8DHpy4OApi/6lJllZc2LgAFz0lNthceSCpWrYpZjVX81if7DgSq8bAJL/CDKIHqApUZg49+6SUAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762532; c=relaxed/simple;
	bh=ubuKNtUx9xDXbA+Gr/tfa3090iC2fra3WmGf2vl5c9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+2CJ3pJ5cH6YXOFWb0o7nLNYTz51QX9IPWVsBlBXJEYAV8VDve90rI39pljnHheiaKwRgdZ7Cd8VQhaefJifhxw+fT5kYpFA0Sw8fmPxnQMNRgZeGMksXqxIIG4FCurZufMIrfRFZU0jup9Lzy42CNnhu3B6ELgaOY1TE1x5iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMoCNlai; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMoCNlai"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e986b8b1so5221571e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790762527; x=1791367327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Df2+CieyG0JeULhWDBnbT1AhVc5GKthoxiOXPRTKR10=;
        b=cMoCNlaigKa5GkOLPKaepW28DNv+yRi45a9Ulcc3s1ovIE/GsZ12ftYaQcjNrjGQXF
         Y/owfyvIQy8e9fsuBVHZkIdLUXZ9GUiJqvQQZ+QyiqhhP0hzkBAslZ90tOTRFv8YpOi6
         K3XWky370neI8mO8lLavEoss64jVVgSUCo02HHgSmLFoVp7UJ5gYXknzokmPrz/Lgqj5
         HPKPOHBfFYajR003f2+viCUKkBCqhP/YAgWR8ZQnb2ogQqTQL71kzpLDKLUzks5vNjLk
         0EoLmS+Dfo8M4Us6RvEoEqP8kI/xaAGOcxAlsfCQRNN6DFGHsnGkKyBkORCd8aILtj1J
         MwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762527; x=1791367327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Df2+CieyG0JeULhWDBnbT1AhVc5GKthoxiOXPRTKR10=;
        b=Em2Whef6z7vu29DWbjI4wYXff3Rubd4KkaAmkDc5AhBIKZQAEaXe2QYAkh9mslHPTh
         nRdc0KtCwKg1p3VSqqCV3EkcUZlTGwz79iUKIJuOMnwD6PZbv1WgPdc41xiKrNbEHtFB
         zUUSustsozfbEbR/SWUcaoak+iTXmxaUZgW4bRP6hTVMfF41m3+eSUHWdpU1BmBJbmH4
         r2QB/bB5BSZGPA1XwuO770pDYpjlycASfflpGsPRCVOhOSvDr16ac88sgGKEY0y90KIa
         505k8jO7t1Q8JW1LW6StocZtdmx04TAqH9sHZBUw2hgPBLJHvAlDiL7aZVEpBdJqHImJ
         chWA==
X-Forwarded-Encrypted: i=1; AKwUvBzXS5pwjhDg+CReZJwn66wxVLyu1FjMI7sUCM8YK90PCz4Lcx5AmLA4NRrxLKw7x+eQTtwrjnr4REgJB+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+MofPVd3zwluwHQpJIs1nUyND04d5zvkmN7T50QX6vSb4Ed7B
	CY51gb5J3clJ3fY7Vufx64TmOSguzuZUt2krwpDdjDj3rqvB0HNH67y0
X-Gm-Gg: AYBFou0TnpLxMXvbnAsoNUasSWeWGx/vj+ubvQSY53ZpWb2tUD+XphJq9JEDqwzqX0r
	KaaKHuq4u4cr+oESLgSSmMTDjKFHIG2MikKpURnAwK5lEVnI+HWzJdzi6oHEJvpUi34wU3yboMk
	8R92zuyw44Ibwm+1pqJgkDvzO+y8/EYhX5CQHIIJHt+UTJVQc0Lmgz6u3IccQ8pNnZyeO646gIn
	l8tJxRJRtzsJ41G5wmIk0EeVeQSVO/QWpkNbNVRnC16p19P9v76us4tdWNz/TxFVnMfZNBDvqvW
	ZMQ+XRFOUgxHPsd6rjLliWVsd4I/ZcLxA9s7Wp7sqGZAimlnpNvhcPaRV19QG44TtuDADEUTXsg
	WMTB9zIEQUOrpaDsflWMWAluqULUSsMdZXNATE2rYM7WX35QXu1stJsyq6oINnSjXqRBdL0T1ne
	0iyF40B9vYtNiERsS9NDmzHFLETztVICYOaDYR00XZWFe4ubaHLbHT5RMceOKN4QNX/6RaF0T31
	G8iGoe4GhcPcEuHlfBm+T84XKwo3Nu5y1vLyHG/9080LWnhDpTOqRox0JG7U1l1sDS8Hw==
X-Received: by 2002:a05:6512:15a7:b0:5b8:f010:89ab with SMTP id 2adb3069b0e04-5ba40609082mr379351e87.44.1790762527181;
        Wed, 30 Sep 2026 03:02:07 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbe6c06sm240422e87.22.2026.09.30.03.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:02:06 -0700 (PDT)
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
Subject: [PATCH v10 3/4] iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
Date: Wed, 30 Sep 2026 13:01:57 +0300
Message-ID: <20260930100158.957977-4-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930100158.957977-1-zoone.rupert@gmail.com>
References: <20260930100158.957977-1-zoone.rupert@gmail.com>
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
index 82bbfd097cd7..01fca139433a 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1089,22 +1089,30 @@ static unsigned int dps310_fifo_push_held(struct dps310_data *data)
 
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
@@ -1112,7 +1120,12 @@ static int dps310_fifo_drain(struct dps310_data *data)
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
@@ -1149,7 +1162,7 @@ static void dps310_fifo_work(struct work_struct *work)
 	int rc;
 
 	mutex_lock(&data->lock);
-	rc = dps310_fifo_drain(data);
+	rc = dps310_fifo_drain(data, 0);
 	mutex_unlock(&data->lock);
 
 	if (rc < 0)
@@ -1184,6 +1197,22 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
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
@@ -1325,6 +1354,7 @@ static const struct iio_info dps310_info = {
 	.read_raw = dps310_read_raw,
 	.write_raw = dps310_write_raw,
 	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
+	.hwfifo_flush_to_buffer = dps310_hwfifo_flush,
 };
 
 static int dps310_probe(struct i2c_client *client)
-- 
2.43.0

