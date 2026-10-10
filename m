Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6834E4229D9
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615228; cv=none; b=Jei0Ju9wmSMk10mhGfKXZaZJWwawhjSMsdijuDeqc26fBnkgJZ5bT34Gi8shjU1KDQnnTu/7ooTu9PpEe/u+ArB8eqZMNFCmZ6i/R6WT4Ttt9Wl9JKAj+5OurrmIHfX+mNYOzJAA24b0nIw59pNccn5UAvGv4Pa3NcSzDu3vLtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615228; c=relaxed/simple;
	bh=dIjt8nwdTss/bhvR/VsQb/EXL6ivNKMpYRbB1ZzbmXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ych3k/5cSwA5vG3WyiJAZoUVqhQR7jv8zTuI5SDONe22VQFlfLo4WzZCWQ7dEYVb/F5oXSRIrcQzbSLZwBLVze4KS8WImX4rUpsFv3k0qhQBIi6CpazwBPRaVt+8eZI4vhVlO7oldyDq66EAm/aqJl8GB1n+A0KE1kkh8n/h3uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0IPla3L; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0IPla3L"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3115c4451c8so353988eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 23:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791615226; x=1792220026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KntCeUOH3O9JYy7Y7gr5oB4PSucBlpkuinakVxuUlIQ=;
        b=h0IPla3LhjguxLaXqe2+yzbhCpqJfxKF3nkVoCyOPdsbuqDvy9EjcMcxVBZewhbA7h
         d4zS3DUVC16JbWBx6lbMYiVLJPrwozCUx6sX9nz+ZYNccLMebIIrAZuQNm0rPhITrg9x
         bLUw6xj/FcnILfz+9YnR5kmwU4f+sVIgIdMHTxomvapkkIu6urbW+jxm9Gnx83h58LKt
         26tL53ilV0AU35+RjBLu31vdw57SS38+bj8Jk+eYvC+Dw2YVwY6XWmawrB+wbKtfDPS8
         6kEMkIlufbvUNHx7OSTeL3v+Fw6R6TGoI3jnJWtZAfIg97gf4dyhdXInouebA7Pc+r8y
         9pyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791615226; x=1792220026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KntCeUOH3O9JYy7Y7gr5oB4PSucBlpkuinakVxuUlIQ=;
        b=LAG/lw4NE53IAQmC9zxwrJ/DzSuOaCs4RIxN8sIEXVZrk4RH7n1hOp+6F0Gr7gU1bd
         GSqSqez58TwPAgXsmFFvuOyKm53C5JQCIv+l/59PT5ivO9ON8Bj+RXxR16d3yY6/XAdn
         dgj5CLdFbJD7487czb0BryzqhvAN9nHLmk4NqROlDBlrT0TqvdQw+XUH0a8mDuoHm/Dv
         qL0SMDkOzmEgTLSoMp/v6rG5O+PzjohjCM4pmdRdR5K7pGCCQlK2OBb2ovC0Xqp5bDry
         rsmv7FezGvEtfJRtjo8JEs/WHOhKM2LGuWb0s5IR6bwskvDAgWMuW7otNScsXoI1E81A
         39Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxhypyxwtIjLv/PUTijPgdyjU82sBpPZNrxUqSMCFctVBN5jSn/r87liJMOvhhH5oO04nDdVVYZAeGN7cg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7mrpQJA6kJsCl9dnQC5iwO+YP5FhBblWhsfU7PcKr82UA7z2W
	NiHfvgxM2rN6N9jG4gImZMcjW7bF3aubDTU3ynoMb+rZxGZyaBkFUzIn
X-Gm-Gg: AYBFou19dTUdZVylu+fx4YArmqiNAKkJ+5TRlrYI+m+Tp37CyWeQrex5SLZyXsY+Ry9
	jEMH8R1TDZvjuilgQ9A/nuEW84nwIoP90iGdMX9757aJCssumAPf3MJ88DNoyutx+yMRUS31gWI
	l8/l93J9fBL3dKjh1HlmpvVDp3A7zC/7ftoqdfuyHaBWoeczH1JLeiSGwAjwftZmIKPwjETZGpl
	rWoRpsd3F5Hog78K/juk3OipEha0v0/26YDWJnYaxJFKa8qy0BUvKez6VkRZYW9XS0eXG/tkbGi
	1Ryo5ym3VqoxvGphZN5C9HbX6GPD6iGVpbEt6PK+bVO/d6R2dZVSYlnLBiZ7EjucCoTae8wrkYa
	5yi6HPV1xd71JBsUf7jWDK8QEeuNHrWwGkadUiVhlK/leoZj6q02mNxr63cwRbjpl6XB0h7iFjk
	ix8gXbj/97HobaAvbVq81g/aj+1Z4ij6gyn/SKMuEQXu/Rz43WqT5pBJRxk0bcos9OKW/uVlxHO
	t+PZpr+0cE6ROlqz7eishT6RWKDDeyB0LxBewY=
X-Received: by 2002:a05:693c:8112:b0:358:6d16:44e2 with SMTP id 5a478bee46e88-3586d16487fmr1250091eec.22.1791615226276;
        Fri, 09 Oct 2026 23:53:46 -0700 (PDT)
Received: from [192.168.100.70] (host-200-61-172-117.iplanisp.com.ar. [200.61.172.117])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm13009650eec.20.2026.10.09.23.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:53:45 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 10 Oct 2026 03:52:45 -0300
Subject: [PATCH v5 06/10] iio: adc: ti-ads1262: support input chopping
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-ads126x-v5-6-49e331cb2fed@gmail.com>
References: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
In-Reply-To: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3240; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=dIjt8nwdTss/bhvR/VsQb/EXL6ivNKMpYRbB1ZzbmXo=;
 b=kA0DAAoWFmBDOPSf1GYByyZiAGrJ4Oait7mMTMA4MGTYlatrqswcZ8sCDSkSGJidd6JLjCXPO
 4h1BAAWCgAdFiEEh2Ci9uJabu1OwFXfFmBDOPSf1GYFAmrJ4OYACgkQFmBDOPSf1GbfVAEA8NJZ
 5Rd7VzJasMWFIupSIwiW4kHbh1uIQZWNeR+X96oBALDwvFEDzxYdnuQSn3OtTp4iHTzlIXHwwLc
 P9Ly1VlQC
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Enable per-channel input chopping via the "input-chopping" property.
As the device withholds the first conversion in chop mode, single reads
are taken in CONTINUOUS run mode with a brief start/stop pulse, as
recommended by the datasheet (Section 9.4.1.2).

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/ti-ads1262.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
index 98d147f120c4..938e26075302 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -205,6 +205,7 @@ struct ads1262_channel {
 	u8 ref_n;
 	bool ref_reversal;
 	bool is_resistance;
+	bool input_chop;
 	size_t num_scales;
 	int scales[ADS1262_GAIN_COUNT][2];
 };
@@ -456,7 +457,7 @@ static int ads1262_dev_stop(struct ads1262 *st)
 	return ret;
 }
 
-static int ads1262_dev_start_one(struct ads1262 *st)
+static int ads1262_dev_start_one(struct ads1262 *st, u8 runmode)
 {
 	int ret;
 
@@ -464,7 +465,7 @@ static int ads1262_dev_start_one(struct ads1262 *st)
 	if (ret)
 		return ret;
 
-	if (st->start_gpiod) {
+	if (runmode == ADS1262_RUNMODE_CONTINUOUS || st->start_gpiod) {
 		/*
 		 * The START pulse timing requirement is 4 clock cycles, at the
 		 * minimum clock rate this is 4 microseconds.
@@ -512,7 +513,9 @@ static int ads1262_channel_enable(struct ads1262 *st,
 	guard(mutex)(&st->chan_lock);
 
 	ret = regmap_update_bits(st->regmap, ADS1262_MODE0_REG,
+				 ADS1262_MODE0_INPUT_CHOP_MASK |
 				 ADS1262_MODE0_REFREV_MASK,
+				 FIELD_PREP(ADS1262_MODE0_INPUT_CHOP_MASK, chan->input_chop) |
 				 FIELD_PREP(ADS1262_MODE0_REFREV_MASK, chan->ref_reversal));
 	if (ret)
 		return ret;
@@ -553,13 +556,26 @@ static int ads1262_channel_read(struct iio_dev *indio_dev,
 				const struct iio_chan_spec *spec, __be32 *val)
 {
 	struct ads1262 *st = iio_priv(indio_dev);
+	struct ads1262_channel *chan = &st->channels[spec->scan_index];
+	u8 runmode;
 	int ret;
 
 	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
 	if (IIO_DEV_ACQUIRE_FAILED(claim))
 		return -EBUSY;
 
-	ret = ads1262_set_runmode(st, ADS1262_RUNMODE_PULSE);
+	/*
+	 * When a channel has chop mode or IDAC rotation mode, the first
+	 * conversion is always withheld so the datasheet suggests using the
+	 * CONTINUOUS mode and briefly starting and stopping conversions to
+	 * achieve the same effect (Section 9.4.1.2).
+	 */
+	if (chan->input_chop)
+		runmode = ADS1262_RUNMODE_CONTINUOUS;
+	else
+		runmode = ADS1262_RUNMODE_PULSE;
+
+	ret = ads1262_set_runmode(st, runmode);
 	if (ret)
 		return ret;
 
@@ -569,7 +585,7 @@ static int ads1262_channel_read(struct iio_dev *indio_dev,
 
 	reinit_completion(&st->drdy);
 
-	ret = ads1262_dev_start_one(st);
+	ret = ads1262_dev_start_one(st, runmode);
 	if (ret)
 		return ret;
 
@@ -1316,6 +1332,7 @@ static int ads1262_parse_channel_node(struct ads1262 *st,
 		}
 	}
 
+	chan->input_chop = fwnode_property_read_bool(node, "input-chopping");
 	chan->ref_reversal = fwnode_property_read_bool(node, "ti,reference-reversal");
 
 	return 0;

-- 
2.55.0

