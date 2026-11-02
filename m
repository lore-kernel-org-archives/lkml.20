Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615375;
	b=qGYdwTdoA+U7hGbe3FKBGb7ePaVCKRIf5jN9yVC6QaxYWtS8g72J1Yruyp1je5Y8oMXH
	 WAaZNVEpCPt73a8m7fIhfdJWf73oj68rMK/I7+QZJZu3wb2rOZEHJbkGYREMoSMcgNk+T
	 kPIZLh6o/QWyOhmMxizofTu/8laRc979Uey+d059plKaWbF1NQHvjrOO7SJMcg6GgWNpr
	 nh/9qWrtJALMRRAf6R2wP59noSpeXd7Jus9BFO/oxWTw8k7wkwIatiG7MM+Lj4PttPBGo
	 ll9Gjvlf8uNDq2ujuWB2hBH2wIbrgCxAyRM6toYeEC1ErA71vEAiEJ4icVoGbOPm30A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=z/jnN6ErJUd5KVkBV6AvWjJdjx2enIl/Zb8acfQInAw=;
	b=WdqS2vZSZwny5nCiJv4A1/G5anh+IbIAr/nYYYKse6jfx6GlC11Yd6aDS+V/JKnoiGcp
	 RQZtA48fNRBRq84f7zzisib7HbeJ3bBAEUbjwyhOSuRehllWgQ07BGPjPGcAYK1ffK5s1
	 ZJg/9R00SafC4qKWRpp3dXWvwizLi1KmxI31KngNxNLIV4CtsUOiCSygoc8Ihg/h5w8nj
	 F7XigtM+0zqY7yEa8MLpiZthfLe8sBTkvUO/2OEm3u/oKnBdQyIq9fm25/vOajoOvoeAF
	 7OlCq/irOJ0rZbHVhv7tMownSl6IW8l4S0jF3mhRLGTY6Ppw4csQlEd+mQZiPSAiE1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=Tuvdw4+I;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA485606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA485606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=Tuvdw4+I
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1235593f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793615373; x=1794220173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/jnN6ErJUd5KVkBV6AvWjJdjx2enIl/Zb8acfQInAw=;
        b=Tuvdw4+I8vpFyBBTVPTaCzt9bkBoAd6HAomq71Qvku6kfesZuUo1eU1vGJkRd4AQcU
         P1HrFcxVVDb6C6INl/M5wAK0/rCC1cawIvZenRV6A1IbWFaTyABmGvW8FDmLaVYgmvDB
         RtiTW3QRYPgbskIcdtReBUtelu+JfuVKVCao+g5oprM8giLF5rRGzvEIOJyPOW+F5U6R
         Z3rCxFTwJd62P3LK2QdkbR8YiGP4Nm4UWELmAMehh/6hMZGcNGiA8tobqglLGuNExoIx
         UJYPRGEVBKFaQisdE+NhfOLRWxdiuaWoVScDVKgfx8++VsIscy5tUugZtHXRbX4Z7NbV
         wJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615373; x=1794220173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/jnN6ErJUd5KVkBV6AvWjJdjx2enIl/Zb8acfQInAw=;
        b=ztsqIKwExK6TNpYO+Bh/qdYQmregVCNgBmPsiTtdGd7YZiHm8gcmXOgD5VL396cSya
         c3xVFQS2MLNiqn4iufQyIuVQE2R4XNvyX/J2L78MHbdlZ1RForHdBDUO5pP7HVnyeiEz
         E7IvYA9TnDNiG+oGNmqUof9Kv0BrvkOJqAQMMLPkr7A8ccLQljNm5SoDu+uUsnA4nsnF
         WIxCK5b69ts+kt1wDExX0D3qYAI+qpARRFoE4aGGT/psgd2Az99vgt3LYJ/b8DR8RixQ
         H/9Wu81kClcDDdal2G3jo7aXAciyLqHtd/gOe3+dPD0hGlbe8AjRBJRcnQZGl+r0E+Yz
         Zivw==
X-Gm-Message-State: APuU4Z9gYJqK6m4HUXt5wDF4tfuuiA+8afdNW0rGkNjD/aYfUR065Wd+
	Q1CCjbOf0DejQSDXwgtHXqw+IqY13y0q8rMfDC0Bl1He2Fcnk2sxjQ5ap1UU16G/wJuqbuNkaBf
	9yUDH4u9cag==
X-Gm-Gg: AYBFou1e16SZyyJ5nWyq0a9jubRdR5HLjNIoDVKAGLgwBh3Te1s+WM9TsYl0QkSTY5x
	MWkYJOXahgXgQioWCmdg9Y6cjinnBypP8wNNEaj3NdgaJe6el2PyKgVnIKBspjvcuhY/dFCKGjH
	r74WwuNa7KKSvzVPPvGYWBre6nQjEhrbS3vnPrmy7Gc+8g4Um/BRoVb0cpop3sIeibKU5MizjnP
	YknuBSi8Ga4TUA/rQLnFeWH9Pa5x/u3UxnrxllAN3UmFQPDo7hFygUBTPs9wgGAOAdnjJaqvCiP
	LUfgmBr8D5EIXCSMki5zV4Zmk9o5xvHZrHZOkEetjEmGX+/1sBw+jo6TOhFpwY87pAYS/oXDPbd
	l7wFogzrzGwkmCPQDNR1sDPGxmbWl0X6VqzM/ActRVd8I9koSfn0MQIUdeeSV6AazfGJ4KOolww
	9Y0lDQjfZCdR7tryMBsw58yu8/mUdCMUUOcfIybJn9VD5WHCtePU257S3kr37XxBa1f47NeSahO
	xk243M+UzFU4t8SFfFOSlzSLW+8Dsk+ZHUft9EAkotN7CB2PqVnH/bY5L7+PGb6dLNq6tyVRdvm
	IJNiblh0LnjIDV3yt5roZxydFSxgmK4M6Iti2o71i05QEGfQWQwoIlU/3kXdWwpTk35pkgf5xxP
	ekyH97K6CsnjNCONhQHOiIYh6RJbvgPY=
X-Received: by 2002:a05:6000:41d1:b0:48d:f4ea:49c9 with SMTP id ffacd0b85a97d-48e6e5196ffmr23338684f8f.54.1793615373265;
        Mon, 02 Nov 2026 02:29:33 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8bd8esm19341891f8f.42.2026.11.02.02.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:29:33 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 02 Nov 2026 14:29:05 +0400
Subject: [PATCH v9 2/3] regulator: bq257xx: Drop the regulator_dev from the
 driver data
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
Message-Id: <20261102-bq25792-v9-2-65f223e95fbc@flipper.net>
References: <20261102-bq25792-v9-0-65f223e95fbc@flipper.net>
In-Reply-To: <20261102-bq25792-v9-0-65f223e95fbc@flipper.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Ww1F4HuExD9UEG3A9pifjtZe6Q48rnqXppU3/zwUN+w=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9SGO2+RHfV/s7WEE8aOIJO/ZGZ67oBWYNhocuyR+wj
 foskf2/YyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKm+fIOR4VXgt4pj5S7bZn0sv2Nu3rWn8uqbs9fU2J5dm3vmcofZm+MMv9mPhud
 L5rO/fdjbFaKhtP3EnqNP+FcZKyZcejknjFWHhRsA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The field was not used anywhere in the driver, so just drop it. This helps
further slim down the platform data structure.

Acked-by: Mark Brown <broonie@kernel.org>
Tested-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/regulator/bq257xx-regulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/bq257xx-regulator.c b/drivers/regulator/bq257xx-regulator.c
index cf827faf48b7..321c3a5c322a 100644
--- a/drivers/regulator/bq257xx-regulator.c
+++ b/drivers/regulator/bq257xx-regulator.c
@@ -15,7 +15,6 @@
 #include <linux/regulator/of_regulator.h>
 
 struct bq257xx_reg_data {
-	struct regulator_dev *bq257xx_reg;
 	struct gpio_desc *otg_en_gpio;
 	struct regulator_desc desc;
 };
@@ -144,6 +143,7 @@ static int bq257xx_regulator_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct bq257xx_reg_data *pdata;
 	struct regulator_config cfg = {};
+	struct regulator_dev *rdev;
 
 	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
 
@@ -162,9 +162,9 @@ static int bq257xx_regulator_probe(struct platform_device *pdev)
 	if (!cfg.regmap)
 		return -ENODEV;
 
-	pdata->bq257xx_reg = devm_regulator_register(dev, &pdata->desc, &cfg);
-	if (IS_ERR(pdata->bq257xx_reg)) {
-		return dev_err_probe(&pdev->dev, PTR_ERR(pdata->bq257xx_reg),
+	rdev = devm_regulator_register(dev, &pdata->desc, &cfg);
+	if (IS_ERR(rdev)) {
+		return dev_err_probe(&pdev->dev, PTR_ERR(rdev),
 				     "error registering bq257xx regulator");
 	}
 

-- 
2.56.0

