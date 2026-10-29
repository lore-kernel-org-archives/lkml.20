Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268413;
	b=WMapcYnGgjBRXuXLLN/x6hWS6MLR9mNqMvsZ9cru9R+goGw21P4BeDPnZL8vF4CeBAEt
	 W5Dls/mMqSRQeDWJe/tI861TE+nxRAkEOCPH55w3SScEso5zfpvue7KXMcAcF6nItHMPP
	 evQBfyW87my09x7I8GroJY+5dLZSQk/WpnmVEi1YHPkJa/JrXYD+oUVtVJLxAxIedKwso
	 pAJMNJImFTF0LdOz5Uao0BJ4tb7Q7NEBf+anBMLteaHm9eTkgBIPA+MDA+EOmXCZyqEMB
	 NmId4mK8sv1XvueHH5tYRW/By3ol+Ox6FGtsWr3P+7K6VvOfREFI9JCMkaolVeHCsjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2m6sqEdIShmvg7ASfXjbhI99Pw56OM60znpq44ByAfs=;
	b=zaiFPrvfwnaHWEDmRkRMED+CpjuvJ9feoUGaA+qq0iv90wPgWMFoXtpj91DVCh7PqZRN
	 sIZckXPbGpiS+bC9yOO1YDLJxJ7fzvUl4nUyDI3R8k92l3FyD4o7dnABUzIqaSRfDseFW
	 10Si1se7VoqAxM/wJ6hu+z5N7McS62iWbZ7cfN4Z2nJ9K+kjkV6fmv26WRai39kPQtRxp
	 npCzsr6hBCtoGtxGeWDi1VXFnCatyd9qKNggaBNI3VrmDknvYZbI9KnhO/RFYiAHiuX2Q
	 j7wBHkchhnXK5FwA81qnreWjdfH4/YB2oMfDqV3WAYRGrKxK+PHfbCr/9PADOF1iW0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=arRjd7Ze;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFEE606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDFEE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=arRjd7Ze
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso15816075e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268411; x=1793873211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2m6sqEdIShmvg7ASfXjbhI99Pw56OM60znpq44ByAfs=;
        b=arRjd7ZeWsN1N43/M96yX5+7JUH53ssnab2jxNWq/+s1OFLYscIydei1Zwk6juHpqX
         2zYvFNLRKx9Cy+MUlvHmkcvcNHGKaUnA5mvv3HTnaMGfM7MwUIqSZlOlCrg6Mq2fKgUc
         XXuooIsFnTout7TtccNTVc5ysbDNdoaKGQgWF1oRrIKAJkSECyqyZ/xjT/13HbNr+u5A
         /FHbh30T8eBDD1negpLr41PavDGGOkR7D/63kM96Y3+QcPypGgBE1nsVEL1b4S7/uE51
         hMZWiAzXsPBZIZ/ZUdCmqpY0ibofSmLXC8u3qy6vCHH1f7lTzFfenVOIM3B70XvmcF0V
         6Rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268411; x=1793873211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2m6sqEdIShmvg7ASfXjbhI99Pw56OM60znpq44ByAfs=;
        b=vaHgRIt/12NmotuJguq1EhOu30nBlhh6AMb7wxWyo9X1+r6eSglFr3I9UFcw2VtS4N
         CJddKwFazP1Fo/gIQzBFBy4Y81fs5hV9LwOT+unQj3TH2gT9r14rBDd5BZL2DYO8WrL2
         CEsfgFScH+ad8SIYyT1BrzhhhPuS0eElTWyXyoWi7feQFxy7loboiSOfZJ+cFrFevolB
         bgeIAYhoYXu9nE2FyE958dfyeZYdcsms6BFFLOkIkSj6+lBAoj3oWswKV+U7ipc1qu7D
         Ck22ZUnx5WHbuGYx1QZLbBElyDjFwyWUF5mZT1Nb9Au9ifnmzxEkIu5yu2fCpwVc7ASi
         aqRg==
X-Forwarded-Encrypted: i=1; AKwUvByfSlEXZu9iufUBpcUBrMbfOBJvB2D01lIahBYApiAMAj5KNqFTnd8y2I3L6OEErDg6Y8m9VNlE4Ccj4jQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt1pPbt6+31ApP/YaYpu73EbrR5X8bNqddYOED8o5Q/Hlzt180
	BzlHsxVPgtysE8lDCEfqbSpF1D7M2VxxuWh4snJoQjdA6Y489QsflMOA
X-Gm-Gg: AYBFou2UDwUZvsq+8C7Hn1dAKZ7WOEbvdM/Q7GGdhLKXHIBl5mk6V0FNImleHMNqOya
	At3IFZdlDgxsDMl9cmkCLwR47ajC92+/2cZ1o5nB+lza5WH4Yf0rIJMTULC+k+DTnRsIWE7rY2n
	xEmb+2eqH6ODNvpaXmTJHfR2DaCw9dqPrnkH1ghLTVykCHdd+XtKu33viBPTTwKQUCHjVAFbRYE
	kprZxNoJBqSpeBUFYP5ShJA/hVWsmJ7RuW2hxO9dTwUn/L3aB/XNPKRgcM73DeYUGOD1DATvDN/
	rHU8zTPbz3r2SWqfnOj2SKH3gtXCg++nlIChsp9XORAfCMssp0vdSqoaXSvTGR4dWfBC4DBvNhi
	PrkwMJRbDus6jBO4kf4ZTUrOH54h71zhiVynZuz/CbF3sAkmQPqxU+WeiFbeSkqfiS9/tJcaita
	2N0lIlZRaq6pVlMXdPJgy3tokcwITIlTnClaMP5LCABR6ixgZ5IX3ie/QJUrNUHBKP2z+NQS44T
	2W+ZrfVyLzZpqtz40w+kQtXiI5dAnDhQCcBKyhcGZwpxiwTs58tDQON8faDLuT6MDQkyF/9lmh9
	6oSdfULcQttEVablIflUOT7OUGpImnG26wGQHVDnXb6e33V5Oh67aDw/uTzgzqUF7s1pNuGaWhR
	oldPQUN51QQ==
X-Received: by 2002:a05:600c:848c:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a966490754mr125374865e9.8.1793268411167;
        Thu, 29 Oct 2026 03:06:51 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:50 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 29 Oct 2026 11:06:25 +0100
Subject: [PATCH 3/4] mfd: rk8xx-spi: add system sleep PM ops
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
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-3-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=1163;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=1zvikwnDADGbJGUr+2C96ExmTpaaJdX4ozWbby5F6T0=;
 b=TCcmm2uv0Oq0jbsQFif9J3wiQ6uFZZOT6azcU9/u4jfR7utKpgVScfiFRlrkXexfBrw4RHf/7
 9Bb1HPxhFwfA2EYYzIpbfsEiuGXaDUD7LUMrp23QF3huhIpCcXvZ3KQ
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

Unlike rk8xx-i2c, the SPI driver does not hook up rk8xx_suspend() and
rk8xx_resume(), so the RK806 never gets its system sleep handling, e.g.
keeping its interrupt disabled while the SPI controller is suspended.

Add the same PM ops as rk8xx-i2c.

Fixes: 210f418f8ace ("mfd: rk8xx: Add rk806 support")
---
 drivers/mfd/rk8xx-spi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/rk8xx-spi.c b/drivers/mfd/rk8xx-spi.c
index bb85fe60518f6..a0b7d7a058108 100644
--- a/drivers/mfd/rk8xx-spi.c
+++ b/drivers/mfd/rk8xx-spi.c
@@ -97,6 +97,8 @@ static int rk8xx_spi_probe(struct spi_device *spi)
 	return rk8xx_probe(&spi->dev, RK806_ID, spi->irq, regmap);
 }
 
+static DEFINE_SIMPLE_DEV_PM_OPS(rk8xx_spi_pm_ops, rk8xx_suspend, rk8xx_resume);
+
 static const struct of_device_id rk8xx_spi_of_match[] = {
 	{ .compatible = "rockchip,rk806", },
 	{ }
@@ -113,6 +115,7 @@ static struct spi_driver rk8xx_spi_driver = {
 	.driver		= {
 		.name	= "rk8xx-spi",
 		.of_match_table = rk8xx_spi_of_match,
+		.pm = pm_sleep_ptr(&rk8xx_spi_pm_ops),
 	},
 	.probe		= rk8xx_spi_probe,
 	.id_table	= rk8xx_spi_id_table,

-- 
2.47.3

