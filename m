Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875737;
	b=R/5Jrn5/honlYZp/+6ZCpbk3guJSsKv5V3i2S7Urkd0JZ+V6SGgDzveZns8ACLAi5eG+
	 uC1+3LprUFCf0t8hJz6dAiBsCiuwNGV58c8i2yzPK/xsXd91qsz3ByADQT6Zrq5RdP87E
	 K8U8uCjNGouRoj5KqkILKLE4OMAf3ctP2ZaUKwid4Zr6VHMmACsQzBxnEcWtVJPnIOF1c
	 w+XCr5AxbuFhT8YgvPvr33itkrOFV4DLPQ/MftROQ7NZR3Ci4iSNpCWswflepVJiVkIsJ
	 psarSw0NwDGErxb4eru1lQuLSkcdcneT7+JKzPOpxrAHUWaaQ2kzKnRGUKfvkrD24Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iWGSJscDaLHZIUihJSVeO44X9gc9sEn/J385HtptoN0=;
	b=uSwYOttLMPPRCcg5s9CASydXCh+jfR6yiNg/jvGcSftcj+ksBeK7mSLMbwHHWV63qAUV
	 z7E5Zi/IixAeKM0ShI9BoTshKlJI7IdZOTpHUnZuQHfbuOZHS2Fg3AVPtSjUkUXwqo6K9
	 WljqVKp5RZa8dgNATWfxPB4IJdqxQvJdzwAyKrlzTnDV49PiRPYYbPGmzMuoN3g+NN/Cz
	 4fYDEQXI4lLxLHFciAPESxO4Ynf/ifyhY2Kji6L4Xg5PRWGEzRUW4+fVV2OSkErs4qxvk
	 EWONSIZ75eFN8PfaR2IUPo70gO+hcmSOL2JE3PBPgTBmvDFhScjqTdN0//ZdXQHThQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G37gUfn1;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD3F606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD3F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G37gUfn1
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1428985f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875735; x=1794480535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWGSJscDaLHZIUihJSVeO44X9gc9sEn/J385HtptoN0=;
        b=G37gUfn14GokInEa88GayZLF22PuIestJ6/9qz6mPOprNQDWasfQQt1cdhFiX5Fdo6
         QIXkzi4kQbPK9OaL9X2It1dmvfq+TBtp2r1mPE0JrhWMjpAPTrAXjT06IbD8YEu+k4qW
         1eWLTTHqiDkSXCulRUqCEvwx7Q7RqrcrIWtZKIkHF7fKFgEkuHOoRy6dKpQ4TiOwX3EP
         fp+rNKQ0jawqYy248bQ1rKlrgAE+RGyuXONtgCoJhERRfuiQ1wxy48ceP9XF6SKlSE0H
         Fvvuq731vc1/f90KiOaOcFUTRw25g4cMKWElR5WGB+v8rYrkjxvhfgwFjGSFhHhSAUL8
         jw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875735; x=1794480535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWGSJscDaLHZIUihJSVeO44X9gc9sEn/J385HtptoN0=;
        b=ICHBOLNxgzcuCY1GwYBNS0h5MlOSqZWYPLgVttpkhL+4tzsKoczH1x49SaCyI6w2Jn
         hrtdopDpm0vcIsE+AP37Rjd7RF2vZA731qa/0xnw0RlwVDS0hPbk77SC0PhrIzoJ/Q1u
         tfDYOxfut+c2Vi1hUsjxtfXmtU28dG1orOFjShYwO7WwBKoXq/10Xwp81eaqvFWO/Jkv
         Mi8Ki9OPsGZPSV5RgaH0DnJdETbXeEY7pT9oBMWEXmy7c3os1Lx+ixYcxjfX6QF6yK+B
         sR35bkgNmggY1tNOpAVTfy0wbZTPfecditnVI4jzuWXivK3mjaHnLQyn/i24WYL88X6G
         Uv4g==
X-Forwarded-Encrypted: i=1; AKwUvBw1GiWTEEYCVkCu5xQHO2hXA7vzld5LuU1ycOz6YgQi8FG/6vT/EpyY5XaJP8qPBX982JVAKdAjZMMMUeY=@vger.kernel.org
X-Gm-Message-State: APuU4Z88okoUf05UdouEcPZQT51/imtMyIiAgcmoX8L7qdFpiiHuXV6e
	z5QmpyOhH6q/ttmMcqRobwksFsiAqnivg+hv2Mu5gVXAdDaJR5pZ3iNq
X-Gm-Gg: AYBFou2xtUerJJlbqrs7Ygv+E3Ms64dqZuPSTRQm3v4C9MY8cPjjUst1JbuEf7zWZYb
	qHJNPNMr63zMgl/MQi/ZXHdeC+VMz7YDxyX32Hf0RXNxqKahROa8DKHhpc9m49NbXe+cvXb9zln
	ejonuPpY+UkignsZUWVzHR4VGekDpyK6VtNqOD+KKoNRsFsb3N7QoYHxYjYgkpNu1wVMIeAedmK
	8yET/5rMb66/Z+8H9IYKSnjutY8i+FB/aOlqMDxgpahvJFh2Skrqm22HuqDRhjM7TDew4vgyETZ
	kHDwIfphPyggAc19GXIQUUR+yDdAGTbnqw2WCO79n7Ty6bL069A1jsxZLq2zCvZmxU6kbrVTOlL
	+KAfV9IVM97wq9qixDKzzFli/P9rAuVTsP+a0WSZtfY1FWPaK5s2JzZmCQXetfEkTFQxHw9vVZZ
	9gvrWqRg6tgYb3MlpAia6xMgS3OWsp918pmfw6hh1L2891F7iLgTsVq4lB4jsE+tZabR1hCo/zP
	2Hjkw6SAk2Qjo/ycn0EmOh+kbVlF0rZm28EC16jZ/HVoKIFvpWsNIS5RxjKn5uCDUUnxzEgh3Fi
	T9xkJylQ+Buege3nRrWTq8gd
X-Received: by 2002:a5d:5d05:0:b0:48e:38e:3102 with SMTP id ffacd0b85a97d-48e6e4f692cmr41112254f8f.29.1793875734675;
        Thu, 05 Nov 2026 02:48:54 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm10384627f8f.45.2026.11.05.02.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:48:52 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mfd: mt6397: Use MFD_CELL_* to describe sub-devices
Date: Thu,  5 Nov 2026 11:31:05 +0100
Message-ID: <20261105104837.1105227-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the MFD_CELL_* macros to describe sub-devices. No functional changes.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
This patch was previously submitted as part of the mt6392 series [1], but
it can be merged independently and does not introduce any other change.
The mt6392 series will be rebased and sent out again without this change.

This patch has been rebased on v7.4-rc1 and line width has been adjusted
for 100-char limit to keep items on a single line where possible.

[1] https://lore.kernel.org/linux-mediatek/20261021105109.199886-1-l.scorcia@gmail.com/

 drivers/mfd/mt6397-core.c | 180 ++++++++------------------------------
 1 file changed, 37 insertions(+), 143 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 5d5f816492aa..6fbc2445dc3b 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -124,168 +124,62 @@ static const struct resource mt6323_pwrc_resources[] = {
 };
 
 static const struct mfd_cell mt6323_devs[] = {
-	{
-		.name = "mt6323-auxadc",
-		.of_compatible = "mediatek,mt6323-auxadc",
-	}, {
-		.name = "mt6323-efuse",
-		.of_compatible = "mediatek,mt6323-efuse",
-	}, {
-		.name = "mt6323-rtc",
-		.num_resources = ARRAY_SIZE(mt6323_rtc_resources),
-		.resources = mt6323_rtc_resources,
-		.of_compatible = "mediatek,mt6323-rtc",
-	}, {
-		.name = "mt6323-regulator",
-		.of_compatible = "mediatek,mt6323-regulator"
-	}, {
-		.name = "mt6323-led",
-		.of_compatible = "mediatek,mt6323-led"
-	}, {
-		.name = "mt6323-keys",
-		.num_resources = ARRAY_SIZE(mt6323_keys_resources),
-		.resources = mt6323_keys_resources,
-		.of_compatible = "mediatek,mt6323-keys"
-	}, {
-		.name = "mt6323-pwrc",
-		.num_resources = ARRAY_SIZE(mt6323_pwrc_resources),
-		.resources = mt6323_pwrc_resources,
-		.of_compatible = "mediatek,mt6323-pwrc"
-	},
+	MFD_CELL_OF("mt6323-auxadc", NULL, NULL, 0, 0, "mediatek,mt6323-auxadc"),
+	MFD_CELL_OF("mt6323-efuse", NULL, NULL, 0, 0, "mediatek,mt6323-efuse"),
+	MFD_CELL_OF("mt6323-rtc", mt6323_rtc_resources, NULL, 0, 0, "mediatek,mt6323-rtc"),
+	MFD_CELL_OF("mt6323-regulator", NULL, NULL, 0, 0, "mediatek,mt6323-regulator"),
+	MFD_CELL_OF("mt6323-led", NULL, NULL, 0, 0, "mediatek,mt6323-led"),
+	MFD_CELL_OF("mt6323-keys", mt6323_keys_resources, NULL, 0, 0, "mediatek,mt6323-keys"),
+	MFD_CELL_OF("mt6323-pwrc", mt6323_pwrc_resources, NULL, 0, 0, "mediatek,mt6323-pwrc"),
 };
 
 static const struct mfd_cell mt6328_devs[] = {
-	{
-		.name = "mt6328-regulator",
-		.of_compatible = "mediatek,mt6328-regulator"
-	}, {
-		.name = "mt6328-keys",
-		.num_resources = ARRAY_SIZE(mt6328_keys_resources),
-		.resources = mt6328_keys_resources,
-		.of_compatible = "mediatek,mt6328-keys"
-	},
+	MFD_CELL_OF("mt6328-regulator", NULL, NULL, 0, 0, "mediatek,mt6328-regulator"),
+	MFD_CELL_OF("mt6328-keys", mt6328_keys_resources, NULL, 0, 0, "mediatek,mt6328-keys"),
 };
 
 static const struct mfd_cell mt6357_devs[] = {
-	{
-		.name = "mt6359-auxadc",
-		.of_compatible = "mediatek,mt6357-auxadc"
-	}, {
-		.name = "mt6357-regulator",
-	}, {
-		.name = "mt6357-rtc",
-		.num_resources = ARRAY_SIZE(mt6357_rtc_resources),
-		.resources = mt6357_rtc_resources,
-		.of_compatible = "mediatek,mt6357-rtc",
-	}, {
-		.name = "mt6357-sound",
-		.of_compatible = "mediatek,mt6357-sound"
-	}, {
-		.name = "mt6357-keys",
-		.num_resources = ARRAY_SIZE(mt6357_keys_resources),
-		.resources = mt6357_keys_resources,
-		.of_compatible = "mediatek,mt6357-keys"
-	},
+	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0, "mediatek,mt6357-auxadc"),
+	MFD_CELL_NAME("mt6357-regulator"),
+	MFD_CELL_OF("mt6357-rtc", mt6357_rtc_resources, NULL, 0, 0, "mediatek,mt6357-rtc"),
+	MFD_CELL_OF("mt6357-sound", NULL, NULL, 0, 0, "mediatek,mt6357-sound"),
+	MFD_CELL_OF("mt6357-keys", mt6357_keys_resources, NULL, 0, 0, "mediatek,mt6357-keys"),
 };
 
 /* MT6331 is always used in combination with MT6332 */
 static const struct mfd_cell mt6331_mt6332_devs[] = {
-	{
-		.name = "mt6331-rtc",
-		.num_resources = ARRAY_SIZE(mt6331_rtc_resources),
-		.resources = mt6331_rtc_resources,
-		.of_compatible = "mediatek,mt6331-rtc",
-	}, {
-		.name = "mt6331-regulator",
-		.of_compatible = "mediatek,mt6331-regulator"
-	}, {
-		.name = "mt6332-regulator",
-		.of_compatible = "mediatek,mt6332-regulator"
-	}, {
-		.name = "mt6331-keys",
-		.num_resources = ARRAY_SIZE(mt6331_keys_resources),
-		.resources = mt6331_keys_resources,
-		.of_compatible = "mediatek,mt6331-keys"
-	},
+	MFD_CELL_OF("mt6331-rtc", mt6331_rtc_resources, NULL, 0, 0, "mediatek,mt6331-rtc"),
+	MFD_CELL_OF("mt6331-regulator", NULL, NULL, 0, 0, "mediatek,mt6331-regulator"),
+	MFD_CELL_OF("mt6332-regulator", NULL, NULL, 0, 0, "mediatek,mt6332-regulator"),
+	MFD_CELL_OF("mt6331-keys", mt6331_keys_resources, NULL, 0, 0, "mediatek,mt6331-keys"),
 };
 
 static const struct mfd_cell mt6358_devs[] = {
-	{
-		.name = "mt6359-auxadc",
-		.of_compatible = "mediatek,mt6358-auxadc"
-	}, {
-		.name = "mt6358-regulator",
-		.of_compatible = "mediatek,mt6358-regulator"
-	}, {
-		.name = "mt6358-rtc",
-		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
-		.resources = mt6358_rtc_resources,
-		.of_compatible = "mediatek,mt6358-rtc",
-	}, {
-		.name = "mt6358-sound",
-		.of_compatible = "mediatek,mt6358-sound"
-	}, {
-		.name = "mt6358-keys",
-		.num_resources = ARRAY_SIZE(mt6358_keys_resources),
-		.resources = mt6358_keys_resources,
-		.of_compatible = "mediatek,mt6358-keys"
-	},
+	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0, "mediatek,mt6358-auxadc"),
+	MFD_CELL_OF("mt6358-regulator", NULL, NULL, 0, 0, "mediatek,mt6358-regulator"),
+	MFD_CELL_OF("mt6358-rtc", mt6358_rtc_resources, NULL, 0, 0, "mediatek,mt6358-rtc"),
+	MFD_CELL_OF("mt6358-sound", NULL, NULL, 0, 0, "mediatek,mt6358-sound"),
+	MFD_CELL_OF("mt6358-keys", mt6358_keys_resources, NULL, 0, 0, "mediatek,mt6358-keys"),
 };
 
 static const struct mfd_cell mt6359_devs[] = {
-	{
-		.name = "mt6359-auxadc",
-		.of_compatible = "mediatek,mt6359-auxadc"
-	},
-	{ .name = "mt6359-regulator", },
-	{
-		.name = "mt6359-rtc",
-		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
-		.resources = mt6358_rtc_resources,
-		.of_compatible = "mediatek,mt6358-rtc",
-	},
-	{ .name = "mt6359-sound", },
-	{
-		.name = "mt6359-keys",
-		.num_resources = ARRAY_SIZE(mt6359_keys_resources),
-		.resources = mt6359_keys_resources,
-		.of_compatible = "mediatek,mt6359-keys"
-	},
-	{
-		.name = "mt6359-accdet",
-		.of_compatible = "mediatek,mt6359-accdet",
-		.num_resources = ARRAY_SIZE(mt6359_accdet_resources),
-		.resources = mt6359_accdet_resources,
-	},
+	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0, "mediatek,mt6359-auxadc"),
+	MFD_CELL_NAME("mt6359-regulator"),
+	MFD_CELL_OF("mt6359-rtc", mt6358_rtc_resources, NULL, 0, 0, "mediatek,mt6358-rtc"),
+	MFD_CELL_NAME("mt6359-sound"),
+	MFD_CELL_OF("mt6359-keys", mt6359_keys_resources, NULL, 0, 0, "mediatek,mt6359-keys"),
+	MFD_CELL_OF("mt6359-accdet", mt6359_accdet_resources, NULL, 0, 0,
+		    "mediatek,mt6359-accdet"),
 };
 
 static const struct mfd_cell mt6397_devs[] = {
-	{
-		.name = "mt6397-auxadc",
-		.of_compatible = "mediatek,mt6397-auxadc",
-	}, {
-		.name = "mt6397-rtc",
-		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
-		.resources = mt6397_rtc_resources,
-		.of_compatible = "mediatek,mt6397-rtc",
-	}, {
-		.name = "mt6397-regulator",
-		.of_compatible = "mediatek,mt6397-regulator",
-	}, {
-		.name = "mt6397-codec",
-		.of_compatible = "mediatek,mt6397-codec",
-	}, {
-		.name = "mt6397-clk",
-		.of_compatible = "mediatek,mt6397-clk",
-	}, {
-		.name = "mt6397-pinctrl",
-		.of_compatible = "mediatek,mt6397-pinctrl",
-	}, {
-		.name = "mt6397-keys",
-		.num_resources = ARRAY_SIZE(mt6397_keys_resources),
-		.resources = mt6397_keys_resources,
-		.of_compatible = "mediatek,mt6397-keys"
-	}
+	MFD_CELL_OF("mt6397-auxadc", NULL, NULL, 0, 0, "mediatek,mt6397-auxadc"),
+	MFD_CELL_OF("mt6397-rtc", mt6397_rtc_resources, NULL, 0, 0, "mediatek,mt6397-rtc"),
+	MFD_CELL_OF("mt6397-regulator", NULL, NULL, 0, 0, "mediatek,mt6397-regulator"),
+	MFD_CELL_OF("mt6397-codec", NULL, NULL, 0, 0, "mediatek,mt6397-codec"),
+	MFD_CELL_OF("mt6397-clk", NULL, NULL, 0, 0, "mediatek,mt6397-clk"),
+	MFD_CELL_OF("mt6397-pinctrl", NULL, NULL, 0, 0, "mediatek,mt6397-pinctrl"),
+	MFD_CELL_OF("mt6397-keys", mt6397_keys_resources, NULL, 0, 0, "mediatek,mt6397-keys"),
 };
 
 struct chip_data {
-- 
2.43.0

