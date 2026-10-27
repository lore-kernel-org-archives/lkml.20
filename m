Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136735;
	b=B2wFJ/Ip2XzQmHNQ/HRJFg6dxMdtrSc/Fi+hwpYogUuLHaA7j3H/KujC9As8Ck+Sedx9
	 20KSmujefXz3gJwWAHLShoZy3kz+B7jRe6Q5LuZzdOh5sitprjqUq6d9LXz+eiv861KZW
	 jC44A5T1bcOQBjrVIHEvF7O71VZ7msaiQHXq1Aq1oRWmmpZACTxJlYPffeays8UDmtkSr
	 VwKAPkR3nJLyIxV2YTY/xI3OTHdxPvwBZZusQOGPM1XoHqIIGdNmN857us6EVRwfbLuMS
	 EnghIUOkHdGKldRJICqhzRzPx0WVO+mNSp6UT0bZnWTKqpRU4RIYsxOcCysfgRU72BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=C1SWXxcBXvPioCj2rQi9M1Zup4Lpu4rYCSjFd6Rb8qY=;
	b=y4Azb51B1l165cINwz6ZN+SjI81IK4M7LplN2GghduhMJ/lYSJlOeRK/qbgRR+UDFXym
	 /MK+D6QpaeiMjHHVioChBDvhPV0srH2Qw27F7AVBTsJnpLfVxWO3Hr5Y0DcBeQE89V1dW
	 fETGl+EtvVy/4o94iRtzSnIATbk3fJtLe9ahhnIoCSbikyY81UMJCQKX9zd3UnD8OFpOX
	 afivRJ6vNlVxrnpNJsuWGLeTV/xxiVBwOe4GLPDLP0UsvBKEzru2j4ZHWk3MeH8CLePj3
	 9ECXUTrD7WwzE+lE5vvKsN4RD+ZK4X2h65nNO0uyEfoJauI/atIeEQdVfYNRTO6GAig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0xs9oZWv;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB712606A332
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB712606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0xs9oZWv
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-369f3e9e431so233646eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136734; x=1793741534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C1SWXxcBXvPioCj2rQi9M1Zup4Lpu4rYCSjFd6Rb8qY=;
        b=0xs9oZWv5ZI0rz1x2VxesP3smjeq18Lldl/9twWTaJ5B6VcV+N9Bqn0aqpI0AuSp+E
         UWQqVkPDWpVq2uPh803NhuSD7jkeVS3uKaoUGdnZMXistKV9t6O5EMfFZfjDmyei4nDq
         3v69m7NR3u9wdSqWbxg0Cv0Zavi22JSxBvfZ2yQIEiPADrn9CLUIvySwQ/ozLIyYPugY
         lyN+9876T2FJM8FpluIgJ32nnF9bHuuQo5Ul2BtyJZHh9YJjljNvlyq8LyIiXaBls8yL
         CB0PimSCJhVCpp/kd7JP+ZnHgFfBBAJwyuA37MWPwPobDXjSns2lTu8xj0zHrX3hsoti
         5BNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136734; x=1793741534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C1SWXxcBXvPioCj2rQi9M1Zup4Lpu4rYCSjFd6Rb8qY=;
        b=GHEKgfL2FlVWIcQFOsBqWl0lGOrNVhae+5rsf/VF72jZx+tI0GblnloR08Rhti7HOR
         tvQ7Q+tt5iv4SlUYdJjh19NIuthWYW17ekF/9tfd5aYjdNdAFLT/s/+gLKY8YOJjkrFT
         DDHJgJwmOrYqbyvBhHh2ZBno68OAFghNxKvcB9enzfZ2Y1bWEF6qsFsMadBhKP6hn5II
         re8fpzuTGqa2oTdEq7xehnxZ3sdKJm3rDdwYiA+pVZ3eFBVb24V0Ba05KB5qIwIZuXrO
         r9vUxhImCo7BMDJXcJeuEM6ZXVspBX0cBbazP1ygZ48TCk/0/vp9J9fq1FohhSsYGtwu
         TT7w==
X-Forwarded-Encrypted: i=1; AKwUvBxtJ4MCJen27LduUwV6OIJC5Vv2yZyY0+vEPbDNlNB971etOoHB/mlvvUms0uC4Y74z5VhX5EaGXa5xebg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTdAiH6l6mNVFvVpX+vrwEcK+zr889oOF1D/4aLrTrWzbEXzvx
	CPKIRy85/LfUTvxKYgxNTMUWJu4e7MF00n+l+BWjigt4RBt0Is/ZkYmJ
X-Gm-Gg: AYBFou39LKFahtcshnWjVNRNLVVUmDIAvw/PjqZfQKhce+mX0HlBHQfnfOjqXVyNnXD
	wI8uIynFGFJhMwel16EMQDO3ZPnfwoY1RxYb7dMbjWseXvffTi8QcqLlaXo+rXZvfZBxfZXQLsN
	AJEj7gYTl+RlJchgokknjDyCr5TP05TFWFj8oB1U7IaSXN3rR8+gTy6hlp7RXXUeFx0bXkQfu2o
	AQNbqxLLlT4nh2ejIuBrFzqtrB0eoY0sWITntmEI8J0p6el5UhdvjQNTpJ68Qv2RJCmcWURRAyO
	5kjcaSgV52Ndbh4IRrLAsRbX6x1bcVCVAQgUk6vzT1RE1b/DAQYHGMiWyKKzKSwumcK0zYBLOL7
	CT3llppqkAfKKxNn3iggB8ACg+N31q7/U+r0ZoINSFFP2gttf48XcGo3NcOevujiWVfFx68pVoM
	JXJcQl6Dr+U/0QWVph/aoNuIaB0wzf8wuLEVCCvw9hF5bimuQ08f51rnv4BeFy0a7LVEAjWxRpp
	ho4L2sF5igiCU3fpxs3vj77HkoyP9XVj4X97HuP5RxgoJP5K/cPtPkKM6Mu6CMTGSyugC5wkPFe
	CczGt69/QLTLYtmSXqo/GzpcHYWlqb39UIMd1ccuhBvy
X-Received: by 2002:a05:7300:8805:b0:359:27e6:b684 with SMTP id 5a478bee46e88-36a0f504168mr5319550eec.3.1793136733744;
        Tue, 27 Oct 2026 14:32:13 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm61693125eec.25.2026.10.27.14.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:32:12 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 27 Oct 2026 14:32:08 -0700
Subject: [PATCH v2 1/2] ASoC: codecs: twl4030: fix external mute GPIO
 lookup
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
Message-Id: <20261027-twl4030-extmute-v2-1-c7e0c90509a1@gmail.com>
References: <20261027-twl4030-extmute-v2-0-c7e0c90509a1@gmail.com>
In-Reply-To: <20261027-twl4030-extmute-v2-0-c7e0c90509a1@gmail.com>
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
2.56.0.307.g5fe7bd680c-goog

