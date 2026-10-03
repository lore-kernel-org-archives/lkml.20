Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0346490BE8
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 19:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057028; cv=none; b=cBIQ+/z1/sA8Y9B3Dn39YlzMW/9ISuhK3W6CVIVicarG35WXlTVLi2hG4kEi9yrv7AMIUWHV/+IWgST48VxAHJCWOxv9rEIvKdXkbAVxfEaJUA5z3fV5mlTxMy2ieGYRsEqAOhcnj0wkyg+KhbMzey1uP81y8SXELLyU9VUCE6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057028; c=relaxed/simple;
	bh=e4QC/6+aGN9kOyKq0Nyqm+TJNMC7eFKd/DvPyCHBUEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvvUeIcZg7IGep+GB4KJ0T8IZ5vlOeVclZCCg5pE81S8NVTgK1/31lUDABmU4lbVbIZFEoCVY/70ZVDVjhxGotWgfqhpiQLiXwKdXuY5BZojwCsFXf/1l3YKNQcLX/sIGoRMHN1scMHTdZxM+ltX9cCgvHEaG7J1pB/RmEbzfz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mizZK1p9; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mizZK1p9"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5bb54bd5076so303525e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 12:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791057023; x=1791661823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIPGiD1mGnpbdDtOLO/e1mH349pW3rywVssdfvgQfUc=;
        b=mizZK1p91FlvyiqkeQQuCmhFM4TLC6z/YyMtfFCsHKqLhaWUITs4tuNUflBoC9lnZV
         tFOhdQwjkRy3u05lBs123YGC/ZKTXMJAZHPYQLye2NYNOM7nMnN6TyRHK1d0jtvXfuI5
         AnFxUCq55CWxkHtCnXm6L/OxJFGJQA/14mYu6cn+1GtRbQIhQG656oghPz3QCbRkRi6Q
         OpXqfyOKhi4P0RfHxpYa1BIxhEhck8g3EvoWuC4VGLdIJCGwkA5a6r8wtJEwPknhZEWM
         nu4ZbNun/kqhmk70NhrOpqSW6QHX4Q17PjnyBH479pokwgmMuON+sW7PRSEqAvhI3VOt
         OJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791057023; x=1791661823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIPGiD1mGnpbdDtOLO/e1mH349pW3rywVssdfvgQfUc=;
        b=vQaPXOViwsRV6wU70X9IUit9WRC43prYG5VCLFmqGsxnP+caTx7nZ0uZQFAzORsbOn
         CcXuSAALPCEBWh93mUZjRM4fLr3SJie0chz6CEuZSwI58wXekj40j1cFOyyqoOi8NzGd
         Az8+Ow34HM49nvECdJrYcq/X1rNxsho8IxxDZGxsyTXgRYRkDaNqzlvKSzsS368zddRj
         UZltLYbHMIvGta43RxXQjNr5jREmDyl7v80BtRyo3cdD4Ak2gOO6Ym8LVTbNKl10ZSgS
         Y6uwztjgUEnxQYoco3EzrLZeO7ABD7s1q1idKfVaI0YkSW5EtjNEGHt5KzGhEDrGlPl3
         +VUg==
X-Forwarded-Encrypted: i=1; AKwUvBwypl88sfA0HmW2CHu6M+L01ZfRpGJiDQGAJDFgJOi/sIaecJfDEBytv2HcOGycumgHyA4yHEQdR2+iwBI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9gr5FU0/4C3DJnoJjWoCfmwdfknqZlVjEqetEn59aSjLINYHC
	l5buEnH0EA0v3vhsO/N6+NCF6aEsk3N0iW+1lmE9tZqJS3/TNYUh6WAl
X-Gm-Gg: AYBFou15do/qsHMIPD2Q2ldVtENV14AS13/lOYskto9GIh2Pe8viCmi+5XpMX/Twl5+
	4arw52qNKjQdyJh2cHIFwRB3zqGMnH5FrvGIjWyIH3d41L3KgQgSO2u3hxlmYLWzLrcXRB5JYxZ
	SLzkM+QZmTDbXOHXb0iUXqOs8p63oUmoHLoBmKfRnxSXW/sX+zS2xolrJZCnikbvmKSbK7gKYms
	YdLsHfZDsh1UTbuXQbQ/dEOmvd23hPgShMe+x0Jq3OymbZCA7cXNJlFLtP4gAns5x5oh6CyEW1W
	9l9EIJq1onWea2z0uajhfXrUA4VsrdTIsDiRsvx/07B8OmEeY5mjAzmPPOdi2rV4pHk6eEjBzvx
	XdV3DfDd3tUothTj+rDgWVnLofbD5cU5YVNSa9WbVtuFB1VXwXslGAcoFEHQsnLLWnGPebV8Txa
	vXXWMtAtzMZP5INxNHSjG8ljU9d8GM1+s8eimSo0rH9QM9XGmnbUW26TEGjVpJsHoQHty8DC7Y9
	dfkNjaiE2rtYevBNAeMpA9bHNLpZnN9iW9MsLsa4TGeXjYnegR9Di0IV9/IPZVg717GOg==
X-Received: by 2002:a05:6512:2528:b0:5bc:b091:e98e with SMTP id 2adb3069b0e04-5bcb091ea2fmr2148344e87.46.1791057023212;
        Sat, 03 Oct 2026 12:50:23 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7abdbfsm1762608e87.65.2026.10.03.12.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:50:22 -0700 (PDT)
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
Subject: [PATCH v12 3/5] iio: pressure: dps310: derive the drain interval from the watermark
Date: Sat,  3 Oct 2026 22:50:09 +0300
Message-ID: <20261003195012.92948-4-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003195012.92948-1-zoone.rupert@gmail.com>
References: <20261003195012.92948-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drain interval only tracked how fast the FIFO fills, so a small
watermark still waited half a FIFO for its samples. Take the watermark
as the number of scans to wait for, but never drain slower than half a
fill.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 36 +++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index b782b187ccce..528dc9283738 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -116,6 +116,7 @@ struct dps310_data {
 	s32 *fifo_hold;
 	unsigned int fifo_hold_max;
 	unsigned int fifo_held;
+	unsigned int watermark;
 	unsigned int drain_interval_ms;
 	s32 fifo_temp_raw;
 };
@@ -980,13 +981,29 @@ static int dps310_fifo_set_enable(struct dps310_data *data, bool enable)
 }
 
 /* No interrupt pin is wired in tree, so drain on a timer */
-static unsigned int dps310_fifo_interval(int prs_rate, int tmp_rate)
+static unsigned int dps310_fifo_interval(struct dps310_data *data,
+					 int prs_rate, int tmp_rate)
 {
-	unsigned int fill_ms;
+	unsigned int drain_interval_ms, fill_ms, want_ms;
+	int scan_rate;
 
 	fill_ms = MSEC_PER_SEC * DPS310_FIFO_DEPTH / (prs_rate + tmp_rate);
 
-	return clamp(fill_ms / 2, DPS310_DRAIN_MIN_MS, DPS310_DRAIN_MAX_MS);
+	/*
+	 * There is no hardware watermark, so take it as the number of scans
+	 * the user will wait for and drain at that rate. Scans come from
+	 * whichever measurement drives them.
+	 */
+	if (test_bit(DPS310_SCAN_PRESSURE, data->iio->active_scan_mask))
+		scan_rate = prs_rate;
+	else
+		scan_rate = tmp_rate;
+
+	want_ms = data->watermark * MSEC_PER_SEC / scan_rate;
+
+	drain_interval_ms = min(want_ms, fill_ms / 2);
+
+	return clamp(drain_interval_ms, DPS310_DRAIN_MIN_MS, DPS310_DRAIN_MAX_MS);
 }
 
 /* Returns which measurement the entry came from, or a negative error */
@@ -1163,6 +1180,15 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
 	return 0;
 }
 
+static int dps310_hwfifo_set_watermark(struct iio_dev *iio, unsigned int val)
+{
+	struct dps310_data *data = iio_priv(iio);
+
+	data->watermark = clamp(val, 1, DPS310_FIFO_DEPTH);
+
+	return 0;
+}
+
 static int dps310_fifo_start(struct dps310_data *data)
 	__must_hold(&data->lock)
 {
@@ -1176,7 +1202,7 @@ static int dps310_fifo_start(struct dps310_data *data)
 	if (rc)
 		return rc;
 
-	data->drain_interval_ms = dps310_fifo_interval(prs_rate, tmp_rate);
+	data->drain_interval_ms = dps310_fifo_interval(data, prs_rate, tmp_rate);
 
 	rc = dps310_fifo_hold_alloc(data, prs_rate, tmp_rate);
 	if (rc)
@@ -1288,6 +1314,7 @@ static const struct regmap_config dps310_regmap_config = {
 static const struct iio_info dps310_info = {
 	.read_raw = dps310_read_raw,
 	.write_raw = dps310_write_raw,
+	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
 };
 
 static int dps310_probe(struct i2c_client *client)
@@ -1304,6 +1331,7 @@ static int dps310_probe(struct i2c_client *client)
 	data = iio_priv(iio);
 	data->client = client;
 	data->iio = iio;
+	data->watermark = 1;
 
 	rc = devm_mutex_init(dev, &data->lock);
 	if (rc)
-- 
2.43.0

