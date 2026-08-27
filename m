Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEA34B04A2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851334; cv=none; b=Jr2AYFhvsemSDh5IGyq8OGKoW3rYRn0z81kL/28B7i6peOB2JV4StY52+6P4Q3Kn5ruM2TQGx3kfwiCSU77xPbKMn0CWvdYbbOt2RP4Vg8L9njkwRqg+1l4LiKPcyKulWucihVWszFnFX3xXLQE1DSoox+PMtm/oGpm6S4A5Lwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851334; c=relaxed/simple;
	bh=J2EcOeMd2OmrNccebRyTDB0Wq+MHEvb9vc6I0fgxqgY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j9pVlau9K/uhaeJR70fVf637ytKhll2Nx0Hh7qIlMGYaQHzAC+4W5jObcpbpMTbJawkYk7U/668p4jBiRLTB51XHtrsFFC4w5PaRs5oS6Pu+pEUffqjLRVn8bXMSAWH3ykdfHMXOR6vs+OYJF7Bv0FrE5lntZ0Ge2k97JxtItKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYq0Knpx; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYq0Knpx"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so146177a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851332; x=1788456132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OInfa0FfwgSOfH71N8TEeQkXznl+VqaYA4i5iO+q5S8=;
        b=OYq0KnpxTD4MdyfKvx4fW1vce6pyVHP+ALIslgja6PVahRp3aFXdqL0T/NVWzlNTaj
         kaBkQ1nAM4/TT02Aq/R8MNHfyjqQcgSxhdPkb/UiVaqT/6vAqdyhKTrxdDPGxjXNEsZA
         9I1QB9Gk+IjuM082wsFfuBsggSxXEKND5LZ0vemCzM6W2EEdmIXh40I3WyGAgE014dAE
         yrrFqTBMQtkr0/UrplCAVAvHWmaBB7u9R3Qb+nRcocJNcwf3JI5TeVUdljI+zXmVnfRs
         kSN3dxkyGPm3EqlinmAssXEKG2liPNYEpiy9Eja0y9iDM8yjhp0G4cPvXDWTCwdqCHMy
         Wo2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851332; x=1788456132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OInfa0FfwgSOfH71N8TEeQkXznl+VqaYA4i5iO+q5S8=;
        b=AsnXI/d+GQzEvDKZYvl+CFmsAf8VPXTFjN5/my++iT0/gk3cx2+kRU9+Qvqpm1aeBm
         EmwtMS2vQXRPpUakT0J9p4oTEXuLkr/OrlrqjWt6OIBKark+8JFCpxW/SIHvrbK14/SX
         diAH/ZXAba9herO8Q9lw6m+rKlPhR9+b29a1Up4mHlQJ/GlGrov2ub9A0ryHfEjazAF/
         EYhPtyKLKOlGicxTGCDzEWTGqZ4TbQ30vUHthtPcI2BXlEmo2ocSiyrsGDFJ7GtzRwNb
         RuPBArH4x93BE2eM64D19jyy8DGp2wNxUBYXzDpOVgSfcNVz3L+JHCtA035djlvgdGZ2
         4Pmw==
X-Forwarded-Encrypted: i=1; AHgh+RpzRFVOCojczHOHNlgPyrdW+ZOh8ji6YYfu0M2kLSCWkedp7o7/Wj3ZBcjCje+OvrAASPRKlRY8f54J070=@vger.kernel.org
X-Gm-Message-State: AFuF++nBXAYQQ9W8bhnusif7qEbvy/YVlIdgtf5mrNHJ9v1ORBwtJK53
	RoMiRzfAw5ihjbWqFidSrL0O/OHOHtnJ2EB4NLE1PRIm/vvGHvhTgX5y
X-Gm-Gg: AR+sD12NAjLsWmtTBHolkMy4hgGeUB0IMw0xlNPOBRt9rU9Po6J47zlFuEql4qqO2/W
	Mu1VuILTYpmync3s+D2WigiTWBPxRfRFf9f15bvSWEEu78JKxK4iFoZKvQhSqxj5g7yyffteKf/
	5YTzlgTo62n6do3eJkCkcLnJ2Yots3a4W2oOyt5hkB3YyHM891Nv/hFq8gYzpL5uRVbVQxbO3wF
	3hHGsaEbZNDQUGJa6kg0prI4MLsI8GW+zethRqzkjSp/H4avUfPk2k8M9KMhRr2T4diArnKB47L
	2iWFZoeaYUXFjbkkioB/9YgST08H6sqBs7KzDAa03LlnyXr5X2rWouiKaMSjrw34dy2wdY456NA
	Ysh5dNYrMIAmpy6uJP5n5GCPM9PPwYNryaqkovNvd5Apu5zhucUVeV0HujQyFGZwL6ShTOqPnWV
	0oKtdFRBDhPFEIOTVTZisGYLUINllwA7kVVrFKHTCsa/TwNacWvReozh7/EPv50xlwcHMYDWPYt
	m4gIUSCMx/592WuD2q0xXAKH7W2srtyN23u
X-Received: by 2002:a17:90b:1d04:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-396d0f75f2fmr1416549a91.11.1787851331929;
        Thu, 27 Aug 2026 10:22:11 -0700 (PDT)
Received: from debian.ari ([47.30.51.191])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eedd13sm17797165c88.1.2026.08.27.10.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:22:11 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v4 8/8] iio: adc: ti-ads1015: inline ads1015_set_conv_mode()
Date: Thu, 27 Aug 2026 22:51:00 +0530
Message-Id: <20260827172100.39176-9-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260827172100.39176-1-architanant5@gmail.com>
References: <20260827172100.39176-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ads1015_set_conv_mode() helper function is a single-line wrapper
around regmap_update_bits().

With the transition to the FIELD_PREP() macro, the raw register updates
are now self-documenting and easy to read. Remove the wrapper function
and inline the regmap calls directly at the call sites.

This also allows for the removal of the final custom shift macro,
ADS1015_CFG_MOD_SHIFT.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index d675f82c0bd5..2072b9dd43e8 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -40,8 +40,6 @@
 #define ADS1015_LO_THRESH_REG	0x02
 #define ADS1015_HI_THRESH_REG	0x03
 
-#define ADS1015_CFG_MOD_SHIFT	8
-
 #define ADS1015_CFG_COMP_QUE_MASK	GENMASK(1, 0)
 #define ADS1015_CFG_COMP_LAT_MASK	BIT(2)
 #define ADS1015_CFG_COMP_POL_MASK	BIT(3)
@@ -739,6 +737,7 @@ static int ads1015_disable_event_config(struct ads1015_data *data,
 	const struct iio_chan_spec *chan, int comp_mode)
 {
 	unsigned int val = FIELD_PREP(ADS1015_CFG_COMP_QUE_MASK, ADS1015_CFG_COMP_DISABLE);
+	struct regmap *map = data->regmap;
 	int ret;
 
 	if (!ads1015_event_channel_enabled(data))
@@ -751,7 +750,7 @@ static int ads1015_disable_event_config(struct ads1015_data *data,
 			comp_mode == ADS1015_CFG_COMP_MODE_WINDOW)
 		return 0;
 
-	ret = regmap_update_bits(data->regmap, ADS1015_CFG_REG, ADS1015_CFG_COMP_QUE_MASK, val);
+	ret = regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_COMP_QUE_MASK, val);
 	if (ret)
 		return ret;
 
@@ -913,19 +912,14 @@ static void ads1015_get_channels_config(struct i2c_client *client)
 	}
 }
 
-static int ads1015_set_conv_mode(struct ads1015_data *data, int mode)
-{
-	return regmap_update_bits(data->regmap, ADS1015_CFG_REG,
-				  ADS1015_CFG_MOD_MASK,
-				  mode << ADS1015_CFG_MOD_SHIFT);
-}
-
 static void ads1015_power_down(void *p)
 {
+	unsigned int val = FIELD_PREP(ADS1015_CFG_MOD_MASK, ADS1015_SINGLESHOT);
 	struct ads1015_data *data = p;
+	struct regmap *map = data->regmap;
 	int ret;
 
-	ret = ads1015_set_conv_mode(data, ADS1015_SINGLESHOT);
+	ret = regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK, val);
 	if (ret)
 		dev_warn(regmap_get_device(data->regmap),
 			 "Failed to power down (%pe)\n", ERR_PTR(ret));
@@ -933,6 +927,7 @@ static void ads1015_power_down(void *p)
 
 static int ads1015_probe(struct i2c_client *client)
 {
+	unsigned int cfg_mode = FIELD_PREP(ADS1015_CFG_MOD_MASK, ADS1015_CONTINUOUS);
 	const struct ads1015_chip_data *chip;
 	struct device *dev = &client->dev;
 	struct iio_dev *indio_dev;
@@ -1028,7 +1023,7 @@ static int ads1015_probe(struct i2c_client *client)
 			return ret;
 	}
 
-	ret = ads1015_set_conv_mode(data, ADS1015_CONTINUOUS);
+	ret = regmap_update_bits(data->regmap, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK, cfg_mode);
 	if (ret)
 		return ret;
 
@@ -1049,19 +1044,23 @@ static int ads1015_probe(struct i2c_client *client)
 
 static int ads1015_runtime_suspend(struct device *dev)
 {
+	unsigned int val = FIELD_PREP(ADS1015_CFG_MOD_MASK, ADS1015_SINGLESHOT);
 	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
 	struct ads1015_data *data = iio_priv(indio_dev);
+	struct regmap *map = data->regmap;
 
-	return ads1015_set_conv_mode(data, ADS1015_SINGLESHOT);
+	return regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK, val);
 }
 
 static int ads1015_runtime_resume(struct device *dev)
 {
+	unsigned int val = FIELD_PREP(ADS1015_CFG_MOD_MASK, ADS1015_CONTINUOUS);
 	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
 	struct ads1015_data *data = iio_priv(indio_dev);
+	struct regmap *map = data->regmap;
 	int ret;
 
-	ret = ads1015_set_conv_mode(data, ADS1015_CONTINUOUS);
+	ret = regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK, val);
 	if (!ret)
 		data->conv_invalid = true;
 
-- 
2.39.5

