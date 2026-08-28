Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E1E17B425
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899134; cv=none; b=O/ofiO52hOJI/MG0LB07E7me5HA6Ids7loOgML4QdKovdUiF7GF+Trs4GXPXbLfXQLNhlXUsSvkLBrTbrQAIsvtK4nUpwtJ2v4mjZSUSFCKsb9VfW1bsFo61SFqDUsJTLS93BYdnXoT9rt1WgwUx0Taz5aTg3kOVjFKoZr0VDCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899134; c=relaxed/simple;
	bh=jBnuNfFaNy+lYevkOT79mOgADpfoXMW0c9FuXIA5WWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fio9YsdLzzV+Kj+k24ZLikDvDZ6Cq184uIwZAkrAJAzPVoPEya0J1hMxLS+oEt1vmDtW/W5dkvDahP8IYyMnzpcnW473swkNQZy6qILdSY375DTwoUjOKWxSw1LZij6sEuqxIIZg6GdDU9CdFuhOvVYTZhgsmqXbS+Ki7jAlCIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5miVteJ; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5miVteJ"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-77bf3334d14so368813137.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787899131; x=1788503931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcOlTatZtiMtegG+sIDHWIx8wVSL0Q7Xb7hEFQvq7zQ=;
        b=G5miVteJq064cTyZyjT0ACmOINFtxxWOrOPD8enRbI/Oly1Id0MZSKc9YHys0OR1Dg
         QQe95gpoTfCtfdOdSRsFY/xzO3Msk9S5ATNbs08ZN24lTVz9xPcjHFoZLhWfRSZsSVC7
         xX+QR1TlrQIPXAbS/9nXaVpkqX2y0OuOrSCovOLGTri6SLpT3zPpqs52+SPuQn80YMF0
         OX4OAEcaH8xKAolyll+jIoK/iNcglL5MFhWezkrneoJlYQe4JLQV3+XyNnHGjHeJ1gYt
         dEzQ32i9In3GTU91f6tHRTA7HdAHQHHJTwrMYUMcheWACshlF+2QLQOLBxbu5yUyg3zu
         FX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787899131; x=1788503931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcOlTatZtiMtegG+sIDHWIx8wVSL0Q7Xb7hEFQvq7zQ=;
        b=K1q7DUD1mib25zg3ivAzSqO9atSxorlOcyZ9Ijyrp1my3yVKE3wNUqktdBymer7I+N
         nfIGzsaH7V7iNFwY0Ehhr4PcR7tiCFeYJywq7X9UN1oA5jJlJPt/1If+DqPF2BHH/nEz
         EI17UD2HYCnHqnNZXUrAua+XCifzE6PYphUa1+rPCo/W6X+9m2CTK0uZbDmn0reVbBm9
         UCZg01IWatMnd+LrMFTRG2nEUo0piIbf/773VmxCiLMS2TMJgwMw2Fvw/IEjtaZdxYLL
         urC1LwHIcfZVWacB2Y3TsMEBlLldq/beEr99SnfBRwUgooB4rxtXoZnZzuvaSntKUwyp
         9zSg==
X-Forwarded-Encrypted: i=1; AHgh+RoJxGyx7zWtn9ENQrJEdvFKP8Oo0SaHSrrYcya/d1gfTtJym/e5+LQ8Qn8zKZo5iTbVZM8O13+apl6YQWE=@vger.kernel.org
X-Gm-Message-State: AFuF++kXs8/Hfh2SOBqz4mr2ZwQRvuVpZgpnjai3XnC1Nc10XruIXdCt
	G7B8imNf0q6pioK68hW8j2qSmmx0gDsH+KnAT/IY10fIMBX7Wmk5eyV3
X-Gm-Gg: AR+sD12+suN/NuK2ah70zKe43GCZjUX0H/GI9bXSNjHRtiPGUSC4dh9Chj7QcBLe0vU
	knreDYnCqQ8QzODHMm0XjvXH/AFz69LvsKlH4sXEuyXdY7c6PTndtRvaKCnM8yjIxJVLA0/BFtN
	FbH4tvTxb8ADJGPg8ch9jIYm+6u4laVlqBbeDSYbHBuIQpatSDKSwwIj/Aah+7WsYb8OSLoSHRP
	KGihbHbueoIWYjxa4nI3hqkyi1fJT9i/Y9/72Ei4owpcE1rPPgjMwye4tl6oNYA+/s2iNmDGmch
	+B1lb95t2CoIiOwm05hdARhmkrE+gL81j3Taa+8InL5tY8CRWZ7crkg979rl+oos1j+VF8DLscM
	uuJQLKlb1vEzsoWsMMSjJmzGigbP2g5roa4bPZLsrc6JwFIj41dLmqPgStCONlor3PWxHk0Dvt6
	gZDSxDlge6J9u8tpncd7/MLePgm8cfaRQlEVHCSabC85ZkHvyjWcMOotjYm8ffuALM
X-Received: by 2002:a05:6102:3e83:b0:779:c38e:de53 with SMTP id ada2fe7eead31-7859956a1cdmr1778891137.10.1787899131018;
        Thu, 27 Aug 2026 23:38:51 -0700 (PDT)
Received: from [192.168.100.153] ([2800:bf0:61:1127:ab87:5602:531c:8dfb])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97e849d8494sm454195241.1.2026.08.27.23.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:38:50 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 28 Aug 2026 01:38:21 -0500
Subject: [PATCH v4 06/10] iio: adc: ti-ads1262: support input chopping
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-ads126x-v4-6-1dc27e9c0260@gmail.com>
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
In-Reply-To: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3240; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=jBnuNfFaNy+lYevkOT79mOgADpfoXMW0c9FuXIA5WWY=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFkTdd6031zRuqLFyVz66v4vesfMzvmHhlYFRc2PkQ7Ly
 pryj/l4RykLgxgXg6yYIkt7wqJvj6Ly3vodCL0PM4eVCWQIAxenAExk5SuGf7YGAqskZljs+Kzg
 ZNu/78XZ7yuez/ivru6knPoiZ8Nv7xRGhi4NvWU2zmWppzu/WkibqggtfcjgG7Ca90oxe9FJQ6N
 8LgA=
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
index c87c0a66119a..4d38da092001 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -203,6 +203,7 @@ struct ads1262_channel {
 	u8 ref_n;
 	bool ref_reversal;
 	bool is_resistance;
+	bool input_chop;
 	size_t num_scales;
 	int scales[ADS1262_GAIN_COUNT][2];
 };
@@ -464,7 +465,7 @@ static int ads1262_dev_stop(struct ads1262 *st)
 	return ret;
 }
 
-static int ads1262_dev_start_one(struct ads1262 *st)
+static int ads1262_dev_start_one(struct ads1262 *st, u8 runmode)
 {
 	int ret;
 
@@ -472,7 +473,7 @@ static int ads1262_dev_start_one(struct ads1262 *st)
 	if (ret)
 		return ret;
 
-	if (st->start_gpiod) {
+	if (runmode == ADS1262_RUNMODE_CONTINUOUS || st->start_gpiod) {
 		/*
 		 * The START pulse timing requirement is 4 clock cycles, at the
 		 * minimum clock rate this is 4 microseconds.
@@ -520,7 +521,9 @@ static int ads1262_channel_enable(struct ads1262 *st,
 	guard(mutex)(&st->chan_lock);
 
 	ret = regmap_update_bits(st->regmap, ADS1262_MODE0_REG,
+				 ADS1262_MODE0_INPUT_CHOP_MASK |
 				 ADS1262_MODE0_REFREV_MASK,
+				 FIELD_PREP(ADS1262_MODE0_INPUT_CHOP_MASK, chan->input_chop) |
 				 FIELD_PREP(ADS1262_MODE0_REFREV_MASK, chan->ref_reversal));
 	if (ret)
 		return ret;
@@ -561,13 +564,26 @@ static int ads1262_channel_read(struct iio_dev *indio_dev,
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
 
@@ -577,7 +593,7 @@ static int ads1262_channel_read(struct iio_dev *indio_dev,
 
 	reinit_completion(&st->drdy);
 
-	ret = ads1262_dev_start_one(st);
+	ret = ads1262_dev_start_one(st, runmode);
 	if (ret)
 		return ret;
 
@@ -1340,6 +1356,7 @@ static int ads1262_parse_channel_node(struct ads1262 *st,
 		}
 	}
 
+	chan->input_chop = fwnode_property_read_bool(node, "input-chopping");
 	chan->ref_reversal = fwnode_property_read_bool(node, "ti,reference-reversal");
 
 	return 0;

-- 
2.55.0

