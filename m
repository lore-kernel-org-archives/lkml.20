Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE0F4CA765
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629914; cv=none; b=F8x0PBqnJ78wGHgtDn/9sgwkAiGX+4WXuUKLdgwG3z0CHcFArnQoKuNQolWo7aLSAWXzkdkZN9wkMwFCjHipaYnexBXAO2iN8hr2D/NJOWk8C91GnAexAaN+t7spFOS/wO7jmegAn5zGOFYV9UvtgixuT2gYObo0s51wAV8hFDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629914; c=relaxed/simple;
	bh=uXG1OMQj519kiswZuCqqLjC69AF05EsyHpWHDLwXt4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZchl3Hbv8+RELXop0NK3o6aLB9PhSUIHJPx8QlMGPxNkp8S+WdcONu7JJp8fX7jtzivWuyfw84tRcwbNcz0Aut2loHqUdtzgjR1KQKrs6dkMGJCq/ZHJ2Vzk6hPdQaxWoWz0fNwumq0BhKZnRfJfk/5HsGcp9/D68s4sZfNpEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqrHHEu9; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqrHHEu9"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8ecca9f3fso2711657e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790629910; x=1791234710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mmc7ht89+usTxLLjV5UoU6VH2ztfPo5rbpPI6W7+RLE=;
        b=pqrHHEu911CJYZyua1ITZpWdzqtARcnp7G5Zjbi0b1RXcI3pyh9Giz/r3eFOjlVuBG
         bIcy2JvJoqEfqvH2BdppHnVTmhKNfFqLyYiKKRo4BF52ssDR2I3yBbwOK0ww6PfIachA
         Y+f8fkTr0bmZUbrh3HAPhj9vGhToAh848ZkAn9XhmXy+5FyK3KlxM1fc6yxrKHY2bS8B
         x56jUIXzubYO1DArAEymeMg8vMEiu0G1J6dh3c5IrtfxRNlwin/omxx6gI2AdNnihef5
         sd/zi2mpjr5WvsuhEPi6QtVSa7qCodw2BlqD6/yz/XyLq8fWD9ZFqVvcp7Vv/3OMR0zK
         yCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629910; x=1791234710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mmc7ht89+usTxLLjV5UoU6VH2ztfPo5rbpPI6W7+RLE=;
        b=vFSAaVNp4S7JGE5yKO7C7MIZEMcO2xsv+1q1dkQPQMxUR8cxmzD6PH3u6kUKsBSujG
         8AVDCG3IoBLGFZefMdZcCaZon0wRjKOd8bsLSKOxw9fBaX2189DaEbv7CB4YoS7ONk38
         K730Cbpml/uFTOHTA8KleOUm/KqAfLrBEemfDzBaJxMLB75fn77OiRwE9DMeOF+WECKh
         czs9pAk2iTuRMR5u4mdWC6LSAi3v/Eqr6bd+NWcJpja2WWBq0Nd4TuB55ItjeZi5T75F
         8lFcxq1y/2+ShjSuznAwHD8d1hm0D3e6P2lPGlTZ8MrhDyvFHD0RyZLMES+qCnfXK1vo
         IMTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGsDefRbyFoSo+dn0vHeccFReWrGrjNO6ZWf1Yw7LwOUU/inCmBBxeEpvnaBthOV3lCY6osb2jhGWuFR0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVXSYttH7qlabFqJVj1OH9NjOsvGjA3Kf+d6ziDOt87Ro8fW3Q
	WqRBaHxTqvIsi3Cfdvz0P3Kr/JvwLBgN1Wu5oeCfz1yuSjbv39BL3izQ
X-Gm-Gg: AYBFou18nGDSGIKKIqHHCWu1r/ZZP2dNVLDi44EH2PyibmDGxAKur/Gl1tkEylw+P7V
	AGFo1PLJYODc9H7WplVeVXAQnPXylIcfZI7wtgyzEznYVcmU8hMBFOxVB+cSghygQJI0Nps4LRi
	jLSlRCRm+cw8QaL2G810IkZ837CdMm5mMcTFbrF1v26XX4vzY0tpmSaiM+RSIwMkxIwthTYdA/5
	UFUvbMkhltCKEcGT3GI4ulXQnDnz0M/FJFPBlfJQ2HbNwDb1FYo7Ic+ipxIcQWPB5OzmtPbdwI1
	cEl+V4OGOmRsjNq9Z0kfAXb2EK3nkNffyKRndtpJKKjnhE91Wu9h+ehstH8PXZgoNk0UKEsoWri
	wGhxmpO6XlFaxHNID59qvFFsKDl68FNFg3p9vuQbEFu5Q2zXGDPT3UErtliOmOzpMoEUzMg8U+R
	ZJF9ShWvn2MqgRlo4pMPs7f7YT7TAGpI7idCtcAdxxP8xG+9nQl3dUqXUImv7ehXA68ri7w6fac
	D6qDMv/gnSXEazG2f5XyInQhVkw4/hgXlnnamNKXBfSrFLgskoCCoejiiFQIjAdwJRaRQ==
X-Received: by 2002:a05:6512:3d12:b0:5b6:425:4bf0 with SMTP id 2adb3069b0e04-5b8df09ae9amr4889560e87.33.1790629910242;
        Mon, 28 Sep 2026 14:11:50 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9d826fa06sm842860e87.8.2026.09.28.14.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:11:49 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v9 2/3] iio: pressure: dps310: derive the drain interval from the watermark
Date: Tue, 29 Sep 2026 00:11:26 +0300
Message-ID: <20260928211127.641828-3-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928211127.641828-1-zoone.rupert@gmail.com>
References: <20260928211127.641828-1-zoone.rupert@gmail.com>
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
 drivers/iio/pressure/dps310.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index c199fc734084..66f24adc8df7 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -114,6 +114,7 @@ struct dps310_data {
 	s32 *fifo_hold;
 	unsigned int fifo_hold_max;
 	unsigned int fifo_held;
+	unsigned int watermark;
 	unsigned int drain_interval_ms;
 	s32 fifo_temp_raw;
 };
@@ -981,13 +982,28 @@ static int dps310_fifo_set_enable(struct dps310_data *data, bool enable)
  * No interrupt pin is wired in tree, so drain on a timer. Both measurements
  * share the entries, so they fill it together.
  */
-static unsigned int dps310_fifo_interval(int prs_rate, int tmp_rate)
+static unsigned int dps310_fifo_interval(struct dps310_data *data, int prs_rate,
+					 int tmp_rate)
 {
-	unsigned int fill_ms;
+	unsigned int fill_ms, want_ms;
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
+	return clamp(min(want_ms, fill_ms / 2), DPS310_DRAIN_MIN_MS,
+		     DPS310_DRAIN_MAX_MS);
 }
 
 /* Returns which measurement the entry came from, or a negative error */
@@ -1170,6 +1186,15 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
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
@@ -1193,7 +1218,7 @@ static int dps310_buffer_postenable(struct iio_dev *iio)
 	if (rc)
 		goto err_unlock;
 
-	data->drain_interval_ms = dps310_fifo_interval(prs_rate, tmp_rate);
+	data->drain_interval_ms = dps310_fifo_interval(data, prs_rate, tmp_rate);
 
 	rc = dps310_fifo_hold_alloc(data, prs_rate, tmp_rate);
 	if (rc)
@@ -1301,6 +1326,7 @@ static const struct regmap_config dps310_regmap_config = {
 static const struct iio_info dps310_info = {
 	.read_raw = dps310_read_raw,
 	.write_raw = dps310_write_raw,
+	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
 };
 
 static int dps310_probe(struct i2c_client *client)
@@ -1317,6 +1343,7 @@ static int dps310_probe(struct i2c_client *client)
 	data = iio_priv(iio);
 	data->client = client;
 	data->iio = iio;
+	data->watermark = 1;
 	mutex_init(&data->lock);
 	INIT_DELAYED_WORK(&data->fifo_work, dps310_fifo_work);
 
-- 
2.43.0

