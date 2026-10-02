Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BD942E43F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925939; cv=none; b=bxVlkDCVEDDcImwMgrw2sqDRy0yTbMz93HIxx+8Os2L834lFa+/d++jliQ8EUIs0D5iRFnht00mdw7WZt5v0GtcmkBWaYJ9F0p3/atSsJwhc8t4U3dCHbLQIUxYJvwqNdptcJlPIEceSFvxxToESNn5R8Z4tJlhBTN+YsLJFEMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925939; c=relaxed/simple;
	bh=YmhABwc6STe6QPPow3vkOTA+h+0bIAD6lAbDoHLSJQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gLpoOYkBx7Py+3umKGaOIn1mIEnzvTZXUj6Gfc/GkAFncDaIU4SR8PxWmdnQ238S1iiZ4DY6Dag2DfQvXoX9OGPylN5E73zgbTsEofwi5vLhKtp386judgG30I7Y25JFESEWZttoeuTM4S+cOnEJ2qXmIdaqAVVpVfRUBwYr1tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxJsjAYI; arc=none smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxJsjAYI"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a9270161easo1166041fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925932; x=1791530732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4Jy4jiSSwxzFuCoHTUqY2xeCWLbq9aU+0aTOn2pXpM=;
        b=fxJsjAYIiXBd1ZrGTMOzp5y8RKybLMVbvdofFWbO3oWmBrTC3bykcsvfCnVX6jr62a
         4aYVOHwNxJcnVTYSb/40FXswdDNSFXZovHEPaEikhuOJAmNjW88b+bfx089QJmqsmbfI
         cXYnfXy05vZwZxIY65CLMwDp0SXr666VPAc0byzKrs0w2Lq1Od8ei2YLx3eHgupFzFky
         +sCq+Cspqc8TRT8DzAgTeTBOcC4AT03rWo5zSu6DQGFHQNcQMXa1CxjoTYdcbDMu0vXq
         n+w9hl6wgWb+kdAzxAeOOp2DRNrU6zffOoMDL2Quh8nb029xV+gPnzLyCmwlXrWKmgX/
         myBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925932; x=1791530732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4Jy4jiSSwxzFuCoHTUqY2xeCWLbq9aU+0aTOn2pXpM=;
        b=nCauYYijoDDJm9br91b0p4hLbmWznXE3la+yRNB7i3k4mILo0qCK68rbl4aOCn75/5
         sGl+h46VsmNp5edZb6nnmo0zQLtXCZOkC9VK98I2kGOgGWRjGZzsPYoYukby9Sk/+kvM
         Qg8GycEDVX5QrWfAAV605nghUqJTSgy8W3vds16M+63CXPvonWRVd8NffCDhEUFOYRUG
         ALHFcJOE/uOnhwgjza+O1ZLA2SavA+rlV8ljy88idQ80LoewbxTsz+UrXvCHjZcLzzPg
         2ZklQYP07uiiTpodu1C4j/vWa6vsyQeQDPTzRF7F7Kds776xrd0p23S4C9rcL7yGPVTp
         imug==
X-Forwarded-Encrypted: i=1; AKwUvBwdW7pqUQgzaZQuLn2WYAbh7JkJGsqr6HlBm8c6IDEcxlM3vvJ9/gHH1V7zNd73fwXP84d5WwK9CjEpKNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeh5jd46bc+TOQL0a/kz/yU/Or1K0BVDMwVYr8MhokeNq8+jw+
	PybtHVaEEE2UUg4+9cQfXgYMvXnfo61L0El8bnHSMHU6N2EHdpuK1PXx
X-Gm-Gg: AYBFou2S43IrElho6G00A+UxBmZ45aaxcFdq/fY7BZ2MmVixvhidbRedBjOF3Iek64L
	S0uWE44rEOPbPNraA9trSMC/iuJHtn6dmCrHOvRbh3LPudHKryngiLyAIbZ018+NdVAIaKtqKlF
	tc01W+0yRM8O4BNPtprY5IjPSqFXFlmexEJJzBC5y+cfEQqaBogmvNgMWNJz4PKYF4P+YrBW8W4
	21gKTiVymtNbOfqxB9lfD2FAWs8aYD9VBOBH/oqwINr2GaG3p4WpqiW4GvZIg57fA7DDrR2+XKm
	sDJN+SZqAnZ9kK4A4Dvpn5tNVS4h2Se6F4NSCbhA7ks/fb5Y+9wD7OP0XvHpY4Vm+kmvXrNr61y
	UKn0a6ChOLKLlRQ3ZdTxHbFet4KFYtUjXMZdtu6LaQX1GSMP4eYflH0IsZO9Xe2hxTcfXmvXHJg
	P5/hnxGQ3ZQDoZs6Betv6sbm1vfp5M3jYlNRxemJUT6IzOeRFr7MKNOrBmRvs7XjdTgApiK6FYe
	b+FxLa0JLPUMX+1p8Wkom367dOTFXxnmVq1smOudnxd6DZ/+TJ0cSnDKsLVDlss/kc0WQ==
X-Received: by 2002:a2e:be9c:0:b0:3a7:64cc:1a25 with SMTP id 38308e7fff4ca-3a87ed1639amr3679651fa.2.1790925931570;
        Fri, 02 Oct 2026 00:25:31 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e324350sm6724731fa.36.2026.10.02.00.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:25:30 -0700 (PDT)
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
Subject: [PATCH v11 3/5] iio: pressure: dps310: derive the drain interval from the watermark
Date: Fri,  2 Oct 2026 10:25:24 +0300
Message-ID: <20261002072526.250081-4-zoone.rupert@gmail.com>
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
index e093cf7034e8..294ddccd264b 100644
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
@@ -983,13 +984,29 @@ static int dps310_fifo_set_enable(struct dps310_data *data, bool enable)
  * No interrupt pin is wired in tree, so drain on a timer. Both measurements
  * share the entries, so they fill it together.
  */
-static unsigned int dps310_fifo_interval(int prs_rate, int tmp_rate)
+static unsigned int dps310_fifo_interval(struct dps310_data *data, int prs_rate,
+					 int tmp_rate)
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
@@ -1169,6 +1186,15 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
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
 static int dps310_buffer_postenable(struct iio_dev *iio)
 {
 	struct dps310_data *data = iio_priv(iio);
@@ -1192,7 +1218,7 @@ static int dps310_buffer_postenable(struct iio_dev *iio)
 	if (rc)
 		goto err_unlock;
 
-	data->drain_interval_ms = dps310_fifo_interval(prs_rate, tmp_rate);
+	data->drain_interval_ms = dps310_fifo_interval(data, prs_rate, tmp_rate);
 
 	rc = dps310_fifo_hold_alloc(data, prs_rate, tmp_rate);
 	if (rc)
@@ -1292,6 +1318,7 @@ static const struct regmap_config dps310_regmap_config = {
 static const struct iio_info dps310_info = {
 	.read_raw = dps310_read_raw,
 	.write_raw = dps310_write_raw,
+	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
 };
 
 static int dps310_probe(struct i2c_client *client)
@@ -1308,6 +1335,7 @@ static int dps310_probe(struct i2c_client *client)
 	data = iio_priv(iio);
 	data->client = client;
 	data->iio = iio;
+	data->watermark = 1;
 	rc = devm_mutex_init(dev, &data->lock);
 	if (rc)
 		return rc;
-- 
2.43.0

