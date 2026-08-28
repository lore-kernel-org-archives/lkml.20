Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E17389116
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899136; cv=none; b=A3Vvg7aj96cRvUGArGkPAFA/3qYzZi27NUsV+rOmchL4RksCoHscSFhXpvgzPPfYhx8ePqy8ccZJcLEG069eY+rv0nQMlfhuOAjlZ0AHHErOCtppJ6loEIzWc1UgCEbeI/aFlqZoD3QFjkOZKmF9olxUbnIMWRjWjBE6YGwEGAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899136; c=relaxed/simple;
	bh=JuqZvTQwb5rkp+99vgWNtC19RzZ4Hw4K1sqB6JYbqnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FhBD63BZ8ZamlzgQxyXxH1+KAXqkMs6UTCQIgic+PN62RWVMK4B03P+PeOURH/rmX7Z1Y9G1pdqwm8CKoobDm0CMD0N75i4x+YuZOWNomjmSAK8AYMlreqJOkiz3pAlBwyLCeweYKeULsvcouF2mLDKFqm8144ovCC8tMutcTMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWRtayY5; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWRtayY5"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-977ba4d3b49so435491241.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787899133; x=1788503933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+O09DWKYxbpMQbMh4vwOBWFTUZ3w5vfYeuNgWL21cE=;
        b=cWRtayY5XW0FuGQv2wrde3RB2fcQsNgLzRl9qSekf9wsdbGiybTGwp2m3M7wz56gbc
         +8lxZeJvr1LmOxWdj7W72+TYWrsmkeEkXYR8Pz5qqVKsGt8qAQ0g41SIv+B5CMAREcsC
         LO2EUjcT+rmADJUjDJuDT1tQ+iuC1e4exFO4oRkGHQRCm9Agf/hs3SHkhYgSOViqbavs
         tVL56dEL+ndSbtGD+rI0s5Ubn4fduCCd1KpAKQEffsrlZgr37ViZSChqwi/TNpRWC76W
         DxMnoa8k/mK+PNv9e3nPrRVIM2KhHYgLkv2Jtv0O2icwkf9eN0AOfCbHd8KVIMuDKRYQ
         o8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787899133; x=1788503933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+O09DWKYxbpMQbMh4vwOBWFTUZ3w5vfYeuNgWL21cE=;
        b=mnRq/XDy560SM/a6DPWeVsD0stCS2UyMeYRvW7ixhbDYIqS01ejk09lRsD0i/X3qb8
         YeH84uJW/ZrQsZJEz82kSleQoZZgc2H0gDNNffb9dEDp3HtG1utF7V3V/E/z/gJkrjQA
         aNp7vMvEsmx5BaKLl8UCQRfUrVwDAwWetlHs0//t5taVa5+V5wrlbt/gwgZx63+vu9iT
         E6gADAaaS54jYsDpWTA8cdRl4TrDuTvmCH9OW9u6PtMBceFTrgWuiTQr+97thGJ4HxkJ
         MQ97PNfnNEwyZ41jzEXYVSGBGiuCbSvTWc6gEWduHDq2q7ej5rbWn8bpqNbLx9sqyI5R
         wGhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCJv1ZklVAPYy/CJhZOBxxideoY41+lly/iXsaaG8k896QOSJILtbhrDrUxAbfqyzbkHWe2VzTj5uZLqE=@vger.kernel.org
X-Gm-Message-State: AFuF++kGJDubZ5ZRa5jpoQeLgAKBlJv1BLoJIjmxj2BpcndutU0bv4TU
	FZ2ul3olxD8V+vBe36EblGpsUYG3kAvXn+K9mA1Xl+6jV/ysj7SotTbK
X-Gm-Gg: AR+sD138MztO2+fNuHS9jPew18C2k5+w0wJO6XdTzFYIG8SKw3aoFh56YRhuYHPIUBj
	kdEMLHZzET7viUj0yYJmhVGhgc8VZS1/4ZWlC5v3M840krDUqmmcKDLyWASbLlsItMswrs0PjD8
	TEv+rLTPclG4dub51j4ocqcENyw8XpLen9TmrVHdmIn2WayubfsRUSKRtPtKPK1EDjFF90gL3RF
	xPZ+QoHbLInuOJb3ME/xQl5ZPDG+IUZL/BZrj0JXsFo+4arc7ebS0JHPpqa3swwinxvbKNdlpyF
	KUwBfuXeixqzApahfZ7uGJMGGqbQ28A2bpiKVmCqMIsBAxkuu6/vUshYyhCkUP8D5jzsrZK91es
	5jPxoB7QgmC9cmcs9Fk5YIYJ7VbTgemrNON4PoyVHJKX0LfrfHEWNM5L8Mp0KnuOSmX6ZWNlspB
	Yco1T+xLVGff5yVTTekk9/7JZQtK/4z1mWfDAEUtPnybfPuEQ6Uk+QlAYH0hscAhBY
X-Received: by 2002:a05:6102:2253:b0:783:c17c:e7de with SMTP id ada2fe7eead31-7841d55ca7bmr2285358137.9.1787899132930;
        Thu, 27 Aug 2026 23:38:52 -0700 (PDT)
Received: from [192.168.100.153] ([2800:bf0:61:1127:ab87:5602:531c:8dfb])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97e849d8494sm454195241.1.2026.08.27.23.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:38:52 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 28 Aug 2026 01:38:22 -0500
Subject: [PATCH v4 07/10] iio: adc: ti-ads1262: support excitation currents
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-ads126x-v4-7-1dc27e9c0260@gmail.com>
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
In-Reply-To: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5946; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=JuqZvTQwb5rkp+99vgWNtC19RzZ4Hw4K1sqB6JYbqnM=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFkTdd4Iif9g33q1KEyX462RTdbPQ06M9q2HxEMUvRX5t
 ZN+Wlh1lLIwiHExyIopsrQnLPr2KCrvrd+B0Pswc1iZQIYwcHEKwES2BjEyPGz9nKU2+63d4UkN
 zx8pzYiLn9C8nc3FvHra1htPsnnF7BgZpgYVn1DgzuYM/mOuciBwY/e9u0HGX6ft5hKVmpBWEu3
 GBgA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Support the two IDAC excitation current sources. Each channel can route
its IDAC1/IDAC2 outputs to a pin via the "excitation-channels" property
and select a magnitude via "excitation-current-nanoamp".

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/ti-ads1262.c | 87 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
index 4d38da092001..04566d00d7cb 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -198,12 +198,15 @@
 struct ads1262_channel {
 	u8 data_rate;
 	u8 filter;
+	u8 idac_mux[2];
+	u8 idac_mag[2];
 	u8 gain;
 	u8 ref_p;
 	u8 ref_n;
 	bool ref_reversal;
 	bool is_resistance;
 	bool input_chop;
+	bool idac_chop;
 	size_t num_scales;
 	int scales[ADS1262_GAIN_COUNT][2];
 };
@@ -315,6 +318,7 @@ static const struct iio_chan_spec ads1262_monitor_chan_specs[] = {
 static const struct ads1262_channel ads1262_default_channel = {
 	.data_rate = ADS1262_DR_20_SPS,
 	.filter = ADS1262_FILTER_FIR,
+	.idac_mux = { ADS1262_IDACMUX_NO_CONN, ADS1262_IDACMUX_NO_CONN },
 };
 
 static const u32 ads1262_mod_decimator_a[] = {
@@ -373,6 +377,21 @@ static const char * const ads1262_ref_sources_neg[] = {
 	NULL
 };
 
+static const u32 ads1262_idac_mags_nA[] = {
+	0, 50000, 100000, 250000, 500000, 750000, 1000000, 1500000,	/* 0..7 */
+	2000000, 2500000, 3000000					/* 8..10 */
+};
+
+static int ads1262_find_one(const u32 *array, size_t num_elements, u32 val)
+{
+	for (unsigned int i = 0; i < num_elements; i++) {
+		if (val == array[i])
+			return i;
+	}
+
+	return -EINVAL;
+}
+
 static int ads1262_find_two(const int (*array)[2], size_t num_elements, int val,
 			    int val2)
 {
@@ -522,8 +541,10 @@ static int ads1262_channel_enable(struct ads1262 *st,
 
 	ret = regmap_update_bits(st->regmap, ADS1262_MODE0_REG,
 				 ADS1262_MODE0_INPUT_CHOP_MASK |
+				 ADS1262_MODE0_IDAC_CHOP_MASK |
 				 ADS1262_MODE0_REFREV_MASK,
 				 FIELD_PREP(ADS1262_MODE0_INPUT_CHOP_MASK, chan->input_chop) |
+				 FIELD_PREP(ADS1262_MODE0_IDAC_CHOP_MASK, chan->idac_chop) |
 				 FIELD_PREP(ADS1262_MODE0_REFREV_MASK, chan->ref_reversal));
 	if (ret)
 		return ret;
@@ -544,6 +565,22 @@ static int ads1262_channel_enable(struct ads1262 *st,
 	if (ret)
 		return ret;
 
+	ret = regmap_update_bits(st->regmap, ADS1262_IDACMUX_REG,
+				 ADS1262_IDACMUX_MUX1_MASK |
+				 ADS1262_IDACMUX_MUX2_MASK,
+				 FIELD_PREP(ADS1262_IDACMUX_MUX1_MASK, chan->idac_mux[0]) |
+				 FIELD_PREP(ADS1262_IDACMUX_MUX2_MASK, chan->idac_mux[1]));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(st->regmap, ADS1262_IDACMAG_REG,
+				 ADS1262_IDACMAG_MAG1_MASK |
+				 ADS1262_IDACMAG_MAG2_MASK,
+				 FIELD_PREP(ADS1262_IDACMAG_MAG1_MASK, chan->idac_mag[0]) |
+				 FIELD_PREP(ADS1262_IDACMAG_MAG2_MASK, chan->idac_mag[1]));
+	if (ret)
+		return ret;
+
 	return regmap_update_bits(st->regmap, ADS1262_REFMUX_REG,
 				  ADS1262_REFMUX_RMUXN_MASK |
 				  ADS1262_REFMUX_RMUXP_MASK,
@@ -578,7 +615,7 @@ static int ads1262_channel_read(struct iio_dev *indio_dev,
 	 * CONTINUOUS mode and briefly starting and stopping conversions to
 	 * achieve the same effect (Section 9.4.1.2).
 	 */
-	if (chan->input_chop)
+	if (chan->input_chop || chan->idac_chop)
 		runmode = ADS1262_RUNMODE_CONTINUOUS;
 	else
 		runmode = ADS1262_RUNMODE_PULSE;
@@ -1288,8 +1325,8 @@ static int ads1262_parse_channel_node(struct ads1262 *st,
 	struct device *dev = &st->spi->dev;
 	const char *sources[2];
 	char name[sizeof("ti,refpN-refnM-resistor-ohms")];
-	u32 pins[2];
-	int ret;
+	u32 pins[2], mags[2];
+	int count, ret;
 
 	if (fwnode_property_present(node, "single-channel")) {
 		ret = fwnode_property_read_u32(node, "single-channel", &pins[0]);
@@ -1356,7 +1393,51 @@ static int ads1262_parse_channel_node(struct ads1262 *st,
 		}
 	}
 
+	if (fwnode_property_present(node, "excitation-channels")) {
+		count = fwnode_property_count_u32(node, "excitation-channels");
+		if (count < 0)
+			return dev_err_probe(dev, count,
+					     "%pfwP: failed to count excitation-channels\n", node);
+
+		pins[0] = ADS1262_IDACMUX_NO_CONN;
+		pins[1] = ADS1262_IDACMUX_NO_CONN;
+		ret = fwnode_property_read_u32_array(node, "excitation-channels",
+						     pins, min(count, ARRAY_SIZE(pins)));
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "%pfwP: failed to read excitation-channels\n", node);
+		if (pins[0] > ADS1262_IDACMUX_NO_CONN || pins[1] > ADS1262_IDACMUX_NO_CONN)
+			return dev_err_probe(dev, -EINVAL,
+					     "%pfwP: excitation-channels not in range\n", node);
+		chan->idac_mux[0] = pins[0];
+		chan->idac_mux[1] = pins[1];
+
+		mags[0] = 0;
+		mags[1] = 0;
+		ret = fwnode_property_read_u32_array(node, "excitation-current-nanoamp",
+						     mags, min(count, ARRAY_SIZE(mags)));
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "%pfwP: failed to read excitation-current-nanoamp\n",
+					     node);
+
+		ret = ads1262_find_one(ads1262_idac_mags_nA,
+				       ARRAY_SIZE(ads1262_idac_mags_nA), mags[0]);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "%pfwP: invalid excitation-current-nanoamp\n", node);
+		chan->idac_mag[0] = ret;
+
+		ret = ads1262_find_one(ads1262_idac_mags_nA,
+				       ARRAY_SIZE(ads1262_idac_mags_nA), mags[1]);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "%pfwP: invalid excitation-current-nanoamp\n", node);
+		chan->idac_mag[1] = ret;
+	}
+
 	chan->input_chop = fwnode_property_read_bool(node, "input-chopping");
+	chan->idac_chop = fwnode_property_read_bool(node, "excitation-current-chopping");
 	chan->ref_reversal = fwnode_property_read_bool(node, "ti,reference-reversal");
 
 	return 0;

-- 
2.55.0

