Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756623;
	b=hwcYlcw2BVuciDZ+kvPn6S9QlIpRUARL9aOxA9BkQ+JLovNXeCx2b8dC3U4SaxaWjTnj
	 TFirhve2lI/33bYOK7f3MV9ioFva9GxPinrYJF0iRW5f/GaSVhUeJhVU0S8oetDzDFvBN
	 udXY9/rXpmEFlnvag9yF0zmbWJHLsu1BEcFN7AZ7/h3SmpCBJrAaGRQZnzcxuEcXGeGkS
	 nAPkt0Q0JveDzuppUhrpZGmWPxca42bGV6t5D91mk3xTtIh0S6GGLBgqSRQr2lhZVCj1J
	 0Myqt0xM+d6EVrOTVICQkdXEhEkE1ChJCsLXJ8+IeRE3+HfUNAuR2G+xlY5iy0d8wGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=beziaboxHddHsV7QGLlhu7YZ0ZbytuRbl01hFg+RyZA=;
	b=E2Y9oa7MnF+S3gKE7HGBjyRLyYnvqmwwQIhzEho6sHT2IkVSafTzJyN7HnxTRX5LPL1m
	 TdTYdtJCjl/MELzbri89NAw5yNzQLdL+n7nizx1YgaiV+c/eWVc35KHqkXR719HeGbTHr
	 TvXW1QVwJY9+XhCK3k2y4mAUt6NoAfoF7K0vRr7ogTKgFqxBIJ+qfU0HeF9pBZxXRnFU8
	 SRNFaClbDTlbrqqH6vaP8V9eW+eQmu8FNUclL5yN08Ousn3UCxs/JX8CC45skPbw1cUQO
	 nT9wolLN4S0vR+7ukEnJs/S20z2GmavxJ3sq0FuH2plmMN53E3IbHJlvwLcK4UX7BqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R08cRgVu;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B57606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2B57606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R08cRgVu
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so652376f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792756621; x=1793361421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=beziaboxHddHsV7QGLlhu7YZ0ZbytuRbl01hFg+RyZA=;
        b=R08cRgVujMYCNwwaSpezrXyElYrFbSSh50mjerNTeIqtEsPGDXCDoiaVW81rm/V5XQ
         Ypp/BF3NA/Ojg2QyCKijfD5JyVoXUKoWv3QzL4sENFXAx/8eYCiMNheesolwV90I71Na
         cXDj0Sv3uTq1LuNdI1iaSvWXkhsHgagppPTDfPnCVwIsiO9Ie54b3NBVvN1B21WNJw2s
         y3Y0YghLi69kp7XahCtWjLGBEZjRALyWT/AJCpHOPfNPYsdM78VF2mt+7rcNH0OLGfAb
         AKKIMgVYBrGNlrCMe6RjJ5EUIPxctV4eA06ITYqa+ueCX/qwhnpCS5iVgeDmucvM1Fnu
         YX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756621; x=1793361421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=beziaboxHddHsV7QGLlhu7YZ0ZbytuRbl01hFg+RyZA=;
        b=yP4lsij7aQ2jje0cVZJXWS4qrRsgvT5FMgq1ArN9oRGxEPeIjkknLqgKxBH4qGpnG3
         bVKMe8pNcek2VUoA2s19UW05UoKRwIiyY3inBSwY4WpoCA7htY1xapbLEbabYJE87zoG
         PvNma1TZoBECz098BUExs9jPQYmDy4T8FAdkqVxcOsaogXr5nX4O7d9f/UZVWFvBAse2
         knva6qyHsCWhYKURnb3gQjjA31ZmiB0m+L0pbBLV25ORFVjHaxhMk8/Ah+wTfLSgmCRk
         QZOOZrNJqRk4ZhgieMDyAyNnXLeP7T08sOmPUR7rXobiLEoktEBj7iub+x+AO3+mQFqe
         2ZbQ==
X-Forwarded-Encrypted: i=1; AKwUvByjyZszOTtREDsFykimHNs1c6TCU3izsPKpE1gbzgsu8fRZYDTlkIEBgf8aoCh1jtu7UHSGkpXtPnV1igQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa8nrSpylEuFBGrheD1/WD1A2CoRvipDCQ2rluy8mnPCfcInzY
	uCbkHlLj4AvTt5QXE2ox0/JhsOe55VKEuztvdwT2m0vXRtuf6qSn6Y6q
X-Gm-Gg: AYBFou3CfnbXhGA0NayFCN5Hdh1qDCoqPdaTbKz6JajCHVoAzqmcAqyacDy6YFKTcEE
	5Wqti2aH1hTM/OtZuuTPrBNBEqN0eyF23kJA6N5TyETr/Wt6ssjsYVeVtGznRSAwc/VCfVqt6C6
	bRiMbPXNXeiqn4BsceRvtwUZ9/NHvExfRobJNZNPj7YEUEvrCJsNzLWaJTt/iYXxS4IelfynOgB
	laWrDkAE1IYlxMQP5MHB0H/xjkLt3D+rdbR52+YP/USBMsxUbxKf3s/B7ti//wdvXlhuk+OURal
	LPbjuGmqf2izgZ+LHOuLt9y9y3Oa/vfESJLGb1Io8PF87aMVbwl93o5SK6/gtnNZqUD7ZimY/T8
	go7YysBI488Lw6i0Ikhh76GAaWh8WKwyHvr9orcUcE1fCTZVYH/FT2D8L7p82N6BNIBxy4Sz35K
	rQR3E24gBjLBvSAfqOg6eztrqgxZs1Lzgxu1MPWa/Alr7NLRc1gz8Lu1jJLjfmQOXu4WckNdBO7
	VDRp19NchroH6w9vTwHaQ3vi+izYUpA1gMAD7zlVjX2TOcAeJDikIAzM27uiemLDxCBNL1vMIYl
	iFpPIsa+Kao2WZ9Z2plJFo0AM0XL4y4jYEijlhWRNqA0IB0c9KWJN2HkYHbU
X-Received: by 2002:a5d:5f4c:0:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-48e3859f31dmr3069710f8f.18.1792756621040;
        Fri, 23 Oct 2026 04:57:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e380310b3sm5076321f8f.22.2026.10.23.04.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:57:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] gpio: 74x164: add support for 74lv164 shift register variant
Date: Fri, 23 Oct 2026 13:56:49 +0200
Message-ID: <20261023115652.700765-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023115652.700765-1-ansuelsmth@gmail.com>
References: <20261023115652.700765-1-ansuelsmth@gmail.com>
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

Add compatible and spi define to support 74lv164 shift register variant.
These work the same way as the 59x chip family with the only difference of
not having a "storage" feature by directly changing the outputs as bits are
shifted in without having to toggle extra pins.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/gpio/gpio-74x164.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 5ca61cf5206a..46562c348c9c 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -181,6 +181,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 
 static const struct spi_device_id gen_74x164_spi_ids[] = {
 	{ .name = "74hc595" },
+	{ .name = "74lv164" },
 	{ .name = "74lvc594" },
 	{},
 };
@@ -188,6 +189,7 @@ MODULE_DEVICE_TABLE(spi, gen_74x164_spi_ids);
 
 static const struct of_device_id gen_74x164_dt_ids[] = {
 	{ .compatible = "fairchild,74hc595" },
+	{ .compatible = "nxp,74lv164" },
 	{ .compatible = "nxp,74lvc594" },
 	{},
 };
-- 
2.55.0

