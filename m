Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0FB49A3C8
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370213; cv=none; b=rDDUt0IW/iBl9VCVOLS6IWvZfT1M49J/tTcOTcV4DX+ZcYrcxRMJMdFN6jm01wIjLsW23p7KPjQszbPbb12Lf3873bExr0TAJanC2vn9hyUwHyngIDmstpUYp2/9frvIuS3Ec5LV7goEZM8PtRRKDo1bkghC3roDjZDu6pIyi0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370213; c=relaxed/simple;
	bh=JRP8CU54RL1e7Jil5HXwWG/cGwsBF5GNPmAGfU9OqWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HG/OSlHL2fawhAAp2+Jm++nYpgAUdB2IriModt7RvUvcqGrFuThgrFZ23haSL8NFPB0995FIhDk/4MzvB0A4POyOcLZDxSgpz/IHEN54YxVhRraKK++kx+yRYx0PDHoaeKBwSN5NWmUVWjcSvDd7ALuO9jkniVZJ2dWjjiCy7aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFf1oTOf; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFf1oTOf"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a8a63785a1so349219a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791370168; x=1791974968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Z8eRhir2+9ggHPXk1/kOSteQHGP26i6yzCMLHKZ/DQ=;
        b=LFf1oTOfRU9du5EQRbnlMvTi3/OTjCzreVil8yDUBphfHOmhYG3C82KDG85WGnvxj/
         TSWcDMt4uURN+//ap0DQKONNFgzNlFvitHjPy+gG9YHVNqM3uj3GjE83exfa4N8eCb90
         PHWB6bRlPSGkI7ausG+xHrVwW4pcOZLhEFbH914aq2Dj8rOwy/YdxLqpJ6SziHsAd27h
         A83SOfDCrx2qTpKgJ9pLG7qNiyVXMqHeIVKynkqANDSLGSEuJAsKO5irHsJ1RgSN0XFf
         0qqfKJ60RDcnVp9f1Ob/+81m7VdoINvZY/Lt748CBTDKO7PIaWUIER3m2VfmTb+V2qHB
         tbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370168; x=1791974968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Z8eRhir2+9ggHPXk1/kOSteQHGP26i6yzCMLHKZ/DQ=;
        b=Of512Pyev2MO5YR9yj8488zSMYb4CfyY8iZgO2ORAjC/o//gwJWaBqPMUPb/OjwwcC
         EB4gDh3pU3gnNnj21QaANRh8PIqq4nncyoYyYtrcb4olgb8+t//MlnPKftLABAVdGy+T
         j8sTFc5FToZpa5EQYGmzyrwIPH19TiqvKL4RBL2OIt58oWqLAAlpmU/T4yHIAxaJ1wZC
         DeLE5MJRHtEYwD06jZFso45S+pBfeYMROnYqF/spQ59UI4u8NIQtSjwWvTpijRjDCzcq
         uqIfcRGRLk4ZppCz3cnuV05QaEW0sHGiBzaYk8R1Qz4ev0pblT+5TJz6QOepc/N3EjMv
         qowQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6tfjV1YJyVzbx10tjSgdXjVYVn0s5dOgtvnsPSteZg4eDtX3BNdMdnNOBPWVJ+gNzKI6LMnK7mOFGEr8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoRTMjAy0sEOQlqhfsqs8eB6LaDm+QlKwmjVY5sM2tjHzqH3TV
	1eoVQL3JQFl6k4Zzo+2aCvx+H2pw73LZSDEH50g1yHwgw9NFBt6Q34+g
X-Gm-Gg: AYBFou2ICf2Od2bDQyYZ2eLDnkX7E3CQOG34K6I8MQRPxY7R5gpA3tpMfGzC7aQ3Ohq
	FjZpWWaYlqmv1D6Oblu0e0st3CrgsXkH02qPXfmkwZI9vJZYYY95nDaM9d8W1/5pA7JONQFeBYr
	TzOf89RPkEfEIthWLzmfHsA9jfI1otPQvmmQ4KV73LL1s75Mw79ZE53/noHZLmadjK4R3KDKx00
	gdmcFWmxO7vmPlfQHERtTnHnx/1oYSA2oyBRwEGMyaszLSpjYlAryU1sztvlXbR+m37M0nVD52+
	nH46PRZQQPD5SYtWtY5wVHiLmbSbNDLCmmEV6XMa8iQ1iTEVp0u9wodivgzQ28FnPX3ISgGqpkJ
	SaoCKF/SGia0pmygneNnCN93RUpWEeP0M1SEfSJkm/VkB8Pxf/0cXGzoiZFR73rLJaipj7Idfcm
	k8XNxcAgZLUAi3spkI7MVm6Y/46ZEvsGhFyNJRAIQlw+AfzWDU/sjJj1IvRv10V+g8WpuwW0aEh
	DEQmCSuAjzyM5OkKx6/+vlabDzjqrXvgM8jkgICDr3OV5RRevuLiDlEDnXV97FRbxA/xvRndIRe
	AfAq8+eqhQNkkQ==
X-Received: by 2002:a17:90b:390a:b0:3a4:cbaf:f152 with SMTP id 98e67ed59e1d1-3a8a0ba8708mr1338116a91.33.1791370168228;
        Wed, 07 Oct 2026 03:49:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10781337a91.2.2026.10.07.03.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:49:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] leds: lm3532: propagate enable GPIO errors
Date: Wed,  7 Oct 2026 17:49:15 +0700
Message-ID: <20261007104915.507801-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() returns NULL when the optional GPIO is not
present, but may return -EPROBE_DEFER or other errors.

lm3532_parse_node() currently treats GPIO lookup errors as if the GPIO
were not present.

Check the return value and propagate errors from the enable GPIO lookup.

Fixes: bc1b8492c764 ("leds: lm3532: Introduce the lm3532 LED driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/leds/leds-lm3532.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index b51496910b08..a3bc9680dc4c 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -560,7 +560,8 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 	priv->enable_gpio = devm_gpiod_get_optional(&priv->client->dev,
 						   "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->enable_gpio))
-		priv->enable_gpio = NULL;
+		return dev_err_probe(&priv->client->dev, PTR_ERR(priv->enable_gpio),
+				     "failed to get enable GPIO\n");
 
 	if (priv->enable_gpio) {
 		ret = devm_add_action(&priv->client->dev, gpio_set_low_action, priv);
-- 
2.43.0

