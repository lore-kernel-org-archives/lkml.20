Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8FB4B1D1F;
	Mon, 28 Sep 2026 11:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595649; cv=none; b=Ng8/zpLNaGS4yNq5Xb0Lfz4WM4oV15hnHVBXTsLco/DEbhm/bj17bWxMpwn+22vuREqauWOo49iIpUC1LxI7oV+6mzVKB/0h+H/jM2IfX02cmMOnCgxIwk0iKQObLOTRbF0klBsaYaykPsXyEnxXslj5w40zR8Dnzt3WHGfgaYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595649; c=relaxed/simple;
	bh=8vB3XFFWUdcH/pqQdWO4L+HFPA1uTARGeGc4Pw2vwWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CpK66ojGQTF0fNPk6uJpVb4A8R3biIKu79XaTSiTTc0MBTDV8BzLdUGO7BnGKMn63w4I1VpgYpWsd54HDtA8lEs2LHtRd842kahUNOr2UQ9kcl7yqQXXbxqGbmbxuT1A2yFTptfH2ggULDXpn90w/Xv4xYgPVT63Amis8I4ooeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net; spf=pass smtp.mailfrom=alexanderkoch.net; dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b=Nd8adRgE; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b="Nd8adRgE"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4htfWY4wYtzMlsj;
	Mon, 28 Sep 2026 13:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alexanderkoch.net;
	s=MBO0001; t=1790595641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cIICblclrlCPHSjtCnaDmZAmTfS9kqVl/0EyFbrvagE=;
	b=Nd8adRgEGDSlZlL1YkCwUxIyxTqeS3BZhzkJrznoJ7ztv7REQSTzCta9qKObLzHM9LfkmS
	J08IOzuDU4h/tGkoUomAgPULFMm6Aaz3CoCV0+hojshBw0Lb5NVk3MLHr7qzxskvOIF1JS
	D44l4kmtMvrfN2mpWZdw0PjSSXV6VEHsYIWpfskx2Yfu/qkFkNX2X3zCCQPsmYZ252ykry
	R59uHK+ErM9dA9RKd69U2o/ABRION9GPHtfziDECYYAmnnF6PUmZTxSqnDssNWG+wOxuUT
	jLGpjZcp7D9/9r8beo35QOqFF48tlXeCwl4+r0WUE7XEqdT0VwfzdWU20FuCGg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of mail@alexanderkoch.net designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=mail@alexanderkoch.net
From: Alexander Koch <mail@alexanderkoch.net>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Khanh Le <khanh.le.xr@renesas.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Koch <mail@alexanderkoch.net>
Subject: [PATCH 1/2] ASoC: codecs: ak4619: Add optional PDN pin support
Date: Mon, 28 Sep 2026 13:40:18 +0200
Message-ID: <20260928114019.1441752-2-mail@alexanderkoch.net>
In-Reply-To: <20260928114019.1441752-1-mail@alexanderkoch.net>
References: <20260928114019.1441752-1-mail@alexanderkoch.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4htfWY4wYtzMlsj

Add optional device tree binding that enables operation of the 'PDN' pin
during initialization:

    codec@10 {
        compatible = "asahi-kasei,ak4619";
        reg = <0x10>;
        pdn-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;  // <--
        #sound-dai-cells = <0>;
    };

If defined, PDN is set high during driver probe, followed by a 10 ms
delay as required before first register access [1].

If no 'pdn-gpios' property is defined, the behaviour is unchanged.

[1] AK4619 datasheet, sec. 2 'Power-up/down Sequence', page 39

Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
---
 sound/soc/codecs/ak4619.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
index d9c9f6b20028..f3357c1ee907 100644
--- a/sound/soc/codecs/ak4619.c
+++ b/sound/soc/codecs/ak4619.c
@@ -152,6 +152,7 @@
 struct ak4619_priv {
 	struct regmap *regmap;
 	struct snd_pcm_hw_constraint_list constraint;
+	struct gpio_desc *pdn_gpio;
 	int deemph_en;
 	unsigned int playback_rate;
 	unsigned int sysclk;
@@ -875,6 +876,12 @@ static int ak4619_i2c_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, ak4619);
 
+	ak4619->pdn_gpio = devm_gpiod_get_optional(dev, "pdn", GPIOD_OUT_HIGH);
+	if (IS_ERR(ak4619->pdn_gpio))
+		return PTR_ERR(ak4619->pdn_gpio);
+	if (ak4619->pdn_gpio)
+		msleep(10);
+
 	ak4619->regmap = devm_regmap_init_i2c(i2c, &ak4619_regmap_cfg);
 	if (IS_ERR(ak4619->regmap)) {
 		ret = PTR_ERR(ak4619->regmap);
-- 
2.55.0

