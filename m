Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701002;
	b=FDnFA5oM+yXislxTY4eraX6twPGYvb4gCzi2F8/VPD7SnfgnGbjD+uNoOi/HUmi/T3sV
	 Vuf/sUZD3laa34H6RfZyNsKhMOhX++8uGbwXFbnFoD1kVWcIyO+L8isDptVDM8Jw2arwM
	 Wp/WgEiyMbL495dqCq/Z9gwrrss1MjlOK6PiWGjrTxwdKyK532UEsGniLq+DfTzIpJAUD
	 vUEYphP4aaIzfGh/0eKZ02Uu4aeNDW/zuP+o1/ZLDRoOiC3utXLI5un+imEkA8hk1X989
	 3VkgcI64skeVrwt++L62grqObhwyvkwu8NDOmbqGNa7/7LXDFjWX/j8Fucgl6sUBUsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9m6U6FCewpEgkrUQUvdl0y638q9yNRaNYDW2cwWh+ao=;
	b=0ZB6uRGTTH72G+/Ez5T+F7sOS1dqo4DcTvM1JjtzQnoktjFmWyKujQaeLIwYZdXf4Lr2
	 594CtXO2QFO+Ah5l48YkGhJFWEQRXLzYMGNEMNdWm6PsuH7oTdhPWblpZw/0wjzfuY4I5
	 2BuTb0mw+4EkOlW2gDLLxS0amedKbUnistdiVKy9AYf76eWGBWaKtb5rLqzhQKq9Tfpxd
	 mda5kr0oZV8/8nNjRbKHCeZJ1N32XbYfZ8HcsaKbz/Z2m9ET+tifofXZpjMdmJvb26rps
	 lvQE+fGJy1QmrdsCrQkFY49eTQueqX7U4TqTu78jXY+nyzGf/pUm1lyowe2o35q32Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l86GyNWW;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C423D606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C423D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l86GyNWW
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-14394530ec6so226722c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792701001; x=1793305801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9m6U6FCewpEgkrUQUvdl0y638q9yNRaNYDW2cwWh+ao=;
        b=l86GyNWWvAb76G1KEwz7zh6uMiBzKJT8wVpGUcsqOsQV7DPQFjjA0gfit1z90ztBIP
         tm/v5XCz7dpx+8AFwUJwdOmI6NSVLahYVihbgKcJwGK/OLKq+6uOVILOBW8Nyyv9EQJ/
         IxqvBVIWCWh6fGZKQmAj7BQ8Uqk4HrNQPSz3z54Gjuh64dDVk4+vlrO0V9u6IkVf1i+x
         Rbji7E/+0WKSqu+xhfPiGNjMxjI8uUq2fV3msU9eUlHiOVz4oD80DhCPm+vYRziGLgX5
         37QmJmeAq/m/5wPqukx2R34Vpxr0cV5G7i39gD8KGnIU7FAJL4KfpuY/1IYlockp7rly
         nPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792701001; x=1793305801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9m6U6FCewpEgkrUQUvdl0y638q9yNRaNYDW2cwWh+ao=;
        b=EQw6RF9Tdi5tKAmrK0YC4PSKnB6n9IPnsbzOhPJ+CyE27tLSYlAsxsL0P4ISAj2whW
         T7tHmQKKPOzBcUzNXkFnsj8IBsc4TaHOVPQ0YYTYyziAm0kLVYmKqNT7eLMrmPR33/q8
         YuDlA5WheQVQpliBqQQm2KmTNaI7aZPBzZcY/jGYvQobOxsOEsMi28rDgb9hYXwtUso8
         94UNknHczy+eF7LB+lmkdkb92kEt+RbfvKQ1CaCu6tXoGWEOs/KjKhViQ4p6YRP8QErm
         fIQLTKrKpek7+8hGAfgdBKMBxVXvhMJejZqnC6wnFOmxMK36CdLA09tCXNyt8O+lWFiK
         he2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzqAgaYwD875hyOMmK9c+d2RTP2CfVo9wc7sOxiITOqcbUXWTV3ClvpD71ZVOAi01OvBRbA78trVQBFMz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJVmW/pJ0GNJn6xtgkx16eKRr1hwmzyCKEZvoWmgdX9unqsSE0
	BtOFH2BoJqH2s8okYytDEsTOdx9713AISFVqcqi0gRoDhTQZ5yBKcafb
X-Gm-Gg: AYBFou0U7WITKGFZBv1stwNPomQpELvkEUGQHFe2GZFpjRjOrAc8DLDP4atv1rlgMxx
	a2wWgsHdxRQF2UItYW18XFp9Ae7n7ivd5QFewThc2QymR5sesxBjCcQW/UNW+Niu3FyIocMAdw1
	da99C/CO0AvBHQbjhR5VgDi/Oye3FEEF6E8FwtMF79p+/yWSgUfey5fttDTtNpLxjzxAGibLU+9
	BOKYzqTrkZr+3frWMcAgM36MbRGNltCJlPuZFFdu2YJxhzOrUO97P6jOBS+wFdFhSCLL9VSNMQo
	ja1USn17zy9p8mRK3btAqEAlXz9qI/uolfx9uoWAGiOsJOSDJrMN3RWlAJjaSmp/MpUgJyE2xCL
	fqzrqjw8QyxOfrPSIjnJXr+Bvzr2OsCjiiQwDoj6+qdf9q9hmX5LArG0Qj0TtgShaeC/Hom213N
	Jwz/LiE7W0hQmuVKTZC3AvSt9yLaqlNQq2xNK3UgtDJZh7EbhvsV9WPs8E5LapCSWSbAg9iTzCs
	143kynpn3WkCiMub6oa35v+2iYBf2G1IIC53XNmQIyDb9vXNqEZEuSrP2mlvkYMa3IF/Ln+WYQz
	60bohLiXbN3ytiWCPAJbAQ2OGmb42PltJ0U6oYVEQ8O5
X-Received: by 2002:a05:7022:f118:b0:15d:fb47:4268 with SMTP id a92af1059eb24-19598c74894mr521726c88.21.1792701000725;
        Thu, 22 Oct 2026 13:30:00 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9db6865sm283894eec.17.2026.10.22.13.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:30:00 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 22 Oct 2026 13:29:46 -0700
Subject: [PATCH 1/2] ASoC: codecs: twl4030: fix external mute GPIO lookup
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-twl4030-extmute-v1-1-3d2dbe260df9@gmail.com>
References: <20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com>
In-Reply-To: <20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Peng Fan <peng.fan@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

The twl4030-codec platform device instantiated by the twl4030-audio MFD
core does not have its own of_node or fwnode assigned; its device tree
properties reside in the "codec" child node of the parent MFD device
node.

Because of this, devm_gpiod_get_optional() called on the codec device
never locates the external mute GPIO. Furthermore, previous board param
handling only marked external mute active when the legacy
"ti,hs_extmute_gpio" property was present, ignoring the standard
"ti,hs_extmute-gpios" property when "ti,hs_extmute" was absent, and set
hs_extmute even if GPIO acquisition subsequently failed.

Switch to fwnode APIs to parse board properties directly inside
twl4030_get_board_params(), fold the helper function into it, and
acquire the GPIO descriptor directly from the "codec" child firmware
node using devm_fwnode_gpiod_get_optional() with the "ti,hs_extmute"
connection ID, removing the redundant legacy property check.

Fixes: 178c169a30b0 ("ASoC: codec: twl4030: Convert to GPIO descriptors")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/twl4030.c | 108 +++++++++++++++++++++++----------------------
 1 file changed, 55 insertions(+), 53 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index 7117af5a1a56..9541c8a5a24e 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
@@ -13,9 +14,9 @@
 #include <linux/mfd/twl4030-audio.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/initval.h>
@@ -198,41 +199,53 @@ static void twl4030_codec_enable(struct snd_soc_component *component, int enable
 	udelay(10);
 }
 
-static void
-twl4030_get_board_param_values(struct twl4030_board_params *board_params,
-			       struct device_node *node)
+static struct twl4030_board_params *twl4030_get_board_params(struct device *dev)
 {
-	of_property_read_u32(node, "ti,digimic_delay", &board_params->digimic_delay);
-	of_property_read_u32(node, "ti,ramp_delay_value", &board_params->ramp_delay_value);
-	of_property_read_u32(node, "ti,offset_cncl_path", &board_params->offset_cncl_path);
-	board_params->hs_extmute = of_property_read_bool(node, "ti,hs_extmute");
+	struct twl4030_board_params *params;
+	int error;
 
-	if (of_property_present(node, "ti,hs_extmute_gpio"))
-		board_params->hs_extmute = 1;
-}
+	struct fwnode_handle *codec_node __free(fwnode_handle) =
+		device_get_named_child_node(dev->parent, "codec");
+	if (!codec_node)
+		return NULL;
 
-static struct twl4030_board_params*
-twl4030_get_board_params(struct device *dev)
-{
-	struct twl4030_board_params *board_params = NULL;
-	struct device_node *twl4030_codec_node = NULL;
-
-	twl4030_codec_node = of_get_child_by_name(dev->parent->of_node,
-						  "codec");
-
-	if (twl4030_codec_node) {
-		board_params = devm_kzalloc(dev,
-					    sizeof(struct twl4030_board_params),
-					    GFP_KERNEL);
-		if (!board_params) {
-			of_node_put(twl4030_codec_node);
-			return ERR_PTR(-ENOMEM);
-		}
-		twl4030_get_board_param_values(board_params, twl4030_codec_node);
-		of_node_put(twl4030_codec_node);
+	params = devm_kzalloc(dev, sizeof(*params), GFP_KERNEL);
+	if (!params)
+		return ERR_PTR(-ENOMEM);
+
+	fwnode_property_read_u32(codec_node, "ti,digimic_delay",
+				 &params->digimic_delay);
+	fwnode_property_read_u32(codec_node, "ti,ramp_delay_value",
+				 &params->ramp_delay_value);
+	fwnode_property_read_u32(codec_node, "ti,offset_cncl_path",
+				 &params->offset_cncl_path);
+
+	/*
+	 * Headset external mute can be controlled either via TWL4030's
+	 * dedicated GPIO6/EXTMUTE pin (enabled by the boolean "ti,hs_extmute"
+	 * property) or via a separate GPIO line ("ti,hs_extmute-gpios" or
+	 * legacy "ti,hs_extmute_gpio"), which implies external mute is active.
+	 */
+	params->hs_extmute = fwnode_property_read_bool(codec_node, "ti,hs_extmute");
+
+	/*
+	 * This will attempt to parse "ti,hs_extmute-gpios" or
+	 * "ti,hs_extmute_gpio".
+	 */
+	params->hs_extmute_gpio = devm_fwnode_gpiod_get_optional(dev, codec_node,
+								 "ti,hs_extmute",
+								 GPIOD_OUT_LOW,
+								 "hs_extmute");
+	error = PTR_ERR_OR_ZERO(params->hs_extmute_gpio);
+	if (error) {
+		dev_err_probe(dev, error, "Failed to get hs_extmute GPIO\n");
+		return ERR_PTR(error);
 	}
 
-	return board_params;
+	if (params->hs_extmute_gpio)
+		params->hs_extmute = 1;
+
+	return params;
 }
 
 static int twl4030_get_hw_params(struct device *dev,
@@ -244,30 +257,19 @@ static int twl4030_get_hw_params(struct device *dev,
 	if (IS_ERR(board_params))
 		return PTR_ERR(board_params);
 
-	if (board_params && board_params->hs_extmute) {
-		board_params->hs_extmute_gpio = devm_gpiod_get_optional(dev,
-									"ti,hs_extmute",
-									GPIOD_OUT_LOW);
-		if (IS_ERR(board_params->hs_extmute_gpio))
-			return dev_err_probe(dev,
-					     PTR_ERR(board_params->hs_extmute_gpio),
-					     "Failed to get hs_extmute GPIO\n");
-
-		if (board_params->hs_extmute_gpio) {
-			gpiod_set_consumer_name(board_params->hs_extmute_gpio, "hs_extmute");
-		} else {
-			u8 pin_mux;
+	if (board_params && board_params->hs_extmute &&
+	    !board_params->hs_extmute_gpio) {
+		u8 pin_mux;
 
-			dev_info(dev, "use TWL4030 GPIO6\n");
+		dev_info(dev, "use TWL4030 GPIO6\n");
 
-			/* Set TWL4030 GPIO6 as EXTMUTE signal */
-			twl_i2c_read_u8(TWL4030_MODULE_INTBR, &pin_mux,
-					TWL4030_PMBR1_REG);
-			pin_mux &= ~TWL4030_GPIO6_PWM0_MUTE(0x03);
-			pin_mux |= TWL4030_GPIO6_PWM0_MUTE(0x02);
-			twl_i2c_write_u8(TWL4030_MODULE_INTBR, pin_mux,
-					 TWL4030_PMBR1_REG);
-		}
+		/* Set TWL4030 GPIO6 as EXTMUTE signal */
+		twl_i2c_read_u8(TWL4030_MODULE_INTBR, &pin_mux,
+				TWL4030_PMBR1_REG);
+		pin_mux &= ~TWL4030_GPIO6_PWM0_MUTE(0x03);
+		pin_mux |= TWL4030_GPIO6_PWM0_MUTE(0x02);
+		twl_i2c_write_u8(TWL4030_MODULE_INTBR, pin_mux,
+				 TWL4030_PMBR1_REG);
 	}
 
 	twl4030->board_params = board_params;

-- 
2.56.0.257.gf7497c7d27-goog

