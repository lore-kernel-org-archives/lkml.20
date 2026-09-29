Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AEB4C9E0B;
	Tue, 29 Sep 2026 09:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672943; cv=none; b=P8oyIsCNO0qQkRIwFF95fzsCniVz7O3K3u+TETBCTbaMQA2CYn3wwkw6a05TbO/lZsXq08ItWaatZP2HymOtcGcJLdooXt3U4zsdO8LeUBDbHllQ788EgK909ohWa1b/DXQiqMLFlEhX2xdOT/TvnPZVgBCRUo/1AyI1jK1Fks8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672943; c=relaxed/simple;
	bh=njzty+l3UmU0sGa/D9jJKAHZ4pn3KDgxVfnBWJDQKhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUCx6Cr3VSysRh0ecbTMDYU4cuk3pL1QFV/gMpQROKXrSUKGcJB6M7czQFWvkKfWOQA2NSni+CNbpkyz+k18SkTPuBV/vbgcXHdeAlhk9AimRzRZOwD+RbZwrTpnnAlzVa+NCy11d0T9R39Agw7jp+yKVVl++3MJZJHB4WnyOpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net; spf=pass smtp.mailfrom=alexanderkoch.net; dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b=K22cUSA4; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b="K22cUSA4"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hvC5b3JJJzMlnB;
	Tue, 29 Sep 2026 11:08:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alexanderkoch.net;
	s=MBO0001; t=1790672915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EwsvXtmXV4nEAS7BnUQpZBjOavIbbJi/FwbOVOmyzmM=;
	b=K22cUSA4Wbrclel3fAUcV5Itsihh/lqqVD4J/PKQQKgw8W5ek5SofL/jUQaai8BGqfOxXp
	1Y7zIl7hMT7mrRZHmHFteXcLtB1Q/5/cjSEanGYgG6ntLLG6Zy2RSAE75ox9WSvk0c4dWf
	NHoocB+EBG+tU+/fRPyZRS0rVCEVAIK0n78058+FlBo6K8l62oCVWVVbDnsojYAc+pBuqw
	DiEA8v6hFHh4CLiosD4B2Q7qQqkhHbdxjgKQiXeGzxv+skBQJYpq1H6ML2uSjH28uID2Sf
	OJegYfK1UNLdxGPHZC0JCNBHgENmNJQcVUHaJ4bwgEJJgHuigxbfeKPguJ8agA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of mail@alexanderkoch.net designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=mail@alexanderkoch.net
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
Subject: [PATCH v2 1/2] ASoC: codecs: ak4619: Add optional powerdown GPIO
Date: Tue, 29 Sep 2026 11:08:20 +0200
Message-ID: <20260929090821.1476257-2-mail@alexanderkoch.net>
In-Reply-To: <20260929090821.1476257-1-mail@alexanderkoch.net>
References: <20260929090821.1476257-1-mail@alexanderkoch.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4hvC5b3JJJzMlnB

Add optional device tree binding that enables operation of the 'PDN' pin
during initialization:

    codec@10 {
        compatible = "asahi-kasei,ak4619";
        reg = <0x10>;
        powerdown-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;  // <--
        #sound-dai-cells = <0>;
    };

If defined, PDN is set high during driver probe, followed by a 10 ms
delay as required before first register access [1].

If no 'powerdown-gpios' is defined, the behaviour is unchanged.

[1] AK4619 datasheet, sec. 2 'Power-up/down Sequence', page 39

Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
---
 sound/soc/codecs/ak4619.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
index d9c9f6b20028..c4f0db1e51c8 100644
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
@@ -875,10 +876,20 @@ static int ak4619_i2c_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, ak4619);
 
+	ak4619->pdn_gpio = devm_gpiod_get_optional(dev, "powerdown",
+		GPIOD_OUT_LOW);
+	if (IS_ERR(ak4619->pdn_gpio))
+		return dev_err_probe(dev, PTR_ERR(ak4619->pdn_gpio),
+			"powerdown GPIO request failed\n");
+	if (ak4619->pdn_gpio)
+		msleep(10);
+
 	ak4619->regmap = devm_regmap_init_i2c(i2c, &ak4619_regmap_cfg);
 	if (IS_ERR(ak4619->regmap)) {
 		ret = PTR_ERR(ak4619->regmap);
 		dev_err(dev, "regmap_init() failed: %d\n", ret);
+		if (ak4619->pdn_gpio)
+			gpiod_set_value_cansleep(ak4619->pdn_gpio, 1);
 		return ret;
 	}
 
@@ -887,6 +898,8 @@ static int ak4619_i2c_probe(struct i2c_client *i2c)
 	if (ret < 0) {
 		dev_err(dev, "Failed to register ak4619 component: %d\n",
 			ret);
+		if (ak4619->pdn_gpio)
+			gpiod_set_value_cansleep(ak4619->pdn_gpio, 1);
 		return ret;
 	}
 
-- 
2.55.0

