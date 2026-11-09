Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794199362;
	b=NkIyEG6+Z33sisM7GLMsMXxF3nVJRF9VCASUKkDPZ9FwadIA2fOTK7QGtcy5eVPnP/wf
	 SkPRi4fYtFNkz80C7YHknqJG3dYSrKSgGi/T1/6Vevc8ZXZriPFGZj1Am/s8lfbwm/8Mp
	 rl2ZtP9moXGDuQB2x/+PBsuWgjb4SWyiJUneI2diK4f7zjSjn9zB2LrAqAgOLbwmy4Wzy
	 AiQegUGiqvwV0FQ03WnM3o0z5lAUD3pvNfFf2kSziBswCei8/P8m4hr/VC7aqTrJBRsQ5
	 ncGCuqrEp9/08YzfEYPALu+dwKLSioPmXwbkMvb+ojA7qtIEriaISX9cBu6ZUtyfkpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794199362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GcfSxz5aPzlv2aH/G/YIDcSJdDCU+Fm7JWkQ7b1zh2Q=;
	b=jGOh4QwcVhYO/pu1punFwG+m4DnWMi2kO59EkfME2D89qghfRTkrU9df0KCWJ5O1Dum1
	 DCXkNGeJukaeyWmhI9qFyDf/jte09tqIuIXDXmSvuZjqpJDS2wsXQTmV5Sg9+7xsa9/ZG
	 8gfAyADqzVzuQYUAGvh+EXDPNGUtU2mQWwzvMu6Mgteqx3+maydYEApPkq8fXzvxE/qa6
	 Md3J3y1hmjgLW6t2T/C4ZKMRrgjPfqhNdvvELhcmKgLldWhxJHH1PE2g4p3vtDx0gPtyA
	 DPPNXALNmV5RRh/ghzgyJGwvBrtV1rvkWW5qnyLXSnFwD7kEftKDLUDGoAoiQj9WHOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PqESUav5;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0AC606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF0AC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PqESUav5
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so1185366eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199361; x=1794804161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcfSxz5aPzlv2aH/G/YIDcSJdDCU+Fm7JWkQ7b1zh2Q=;
        b=PqESUav5JLJfB7GFHFz4pi6OqzbIh2Lvb5yh1tDk8V+bR7Ts/QMMBHdwae7EREGtit
         JWNMDiD2JgjyyvBKcxNAKe+0Z5jYqbKUfgozwI2As473RcWJ8wGjpw/mGCrUgzllpHnQ
         f0CMCtUl/7r0kP5jQ88Mf9qyV/ay3eKbfqIQ2lerbKUVE2BFFnbpgj6TGuDrsQHXO1mt
         KGVmWw8dhlgjzrJ3GVoC+rm7OMXaNXcsZL6WDiGhvegrkDxpBQD4tbjbH+tkGPipqdJ5
         X/U8YFOeulDeDbmHBGVsNKi2sqiozYmrShupL0LnNkFu49a2kkyQaU/qCrPab0lCXZA7
         bX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199361; x=1794804161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GcfSxz5aPzlv2aH/G/YIDcSJdDCU+Fm7JWkQ7b1zh2Q=;
        b=vDvO+ZeWztUhl/gPeywq8M0vTfE3ZoGsQS46SRga7I0rq4R1gcyprEEFLs6MpTHkXB
         T8MlXi63kWb6xUcoTRvr2E8N96jWlKk7UvMVuXiGi+OUf76NW2OUqavPgNSnAPpNtGM5
         69rSbE7HVWPG7Lf+Gf3sPjNa4fKHERvP21lnGA/DNhpXUern3Qc/YiOVYayFZmWqciNr
         Gz3RKroDsCsGhdaMagY3vMejSKYNmVJ9yol4jnPOGfV+7awIvTsvWwR2KmsMfB+bMRD3
         jGX3A/TSEQULhDIqmQ54rSFmEEPkUTTRi7OvbF1kREDE4FesQz/CkVjLqzSrGsbEOQzu
         7mqw==
X-Forwarded-Encrypted: i=1; AL+hErEQSg/5sx4iStXNamSzudHDRGhS06wkmwZywTD37ijWXpoKD1ZJLzqmX6LrW5OnTzbGtR506rTI3gBZBqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eCCfCWIc2jkqBdd1xBiR90ape+Ep+aMcZfFBTNXDCEEWzaaBI
	W0bEA77JXAhe6pQPeKd4zBZf1RqUoMAKyX0QyYKWgYHP3lBgcXedKakd
X-Gm-Gg: AYBFou1cp3KHSe+pj9qamfDMHgUhVyabxmlHZx8xtwWWXnM5ThcjWcy7ZFPGWJ5yh9j
	OF7BBcYU1Zx7+Yu/+SKO+d0kDlozcTaFpTdjd6ddXU6pEc9F3cuGaw1fw7+5K+t0pI9ysCk54L2
	xiY4Y2WTylfQIDTgMwpznKE7W+pctyjZ+ydvPnK8pcRwYJVjePiuS8CJAYUxrI2R32cyi/z2Zlm
	jCDE4aEEWbhxPYQbDEL+3hEL2ffxLWp/0W4CzfXJdYlkb1JOwHNvg1OTO3C1N2waRHT25ejQbwR
	L51Yo6G6w1L7YO6EswzdtODgyeA7zU4T43b5EwgtrVwt18dg9W6YAskH4x497+r3YBKs2xeJmok
	dZqNvdqrVV2PZD02n/zMEv3AsX+PBM8P3SO2gzxMpAcaISomW7iW7MowSa021B3q9BzhqbJGx71
	t/yYzyG00fomWLNdfoG/QRsyj/mLIeQQZKeeTyhS1arQZSsALIl89ZePMfMwjELaMNf7iiQv79s
	vSnjvBDWFrPYFVWcDOcn1Z0bkdRug7K25/GdY/Ehaq8Kz51Mxg93Ag6fyb0dBsrzeP/B2jyU3mr
	zbP0fekU6NSaKVqpu/pu2e82DmHahKbU/bnRwqiSTSSRNYLQ
X-Received: by 2002:a05:7300:1c0b:b0:366:2893:7421 with SMTP id 5a478bee46e88-3725d77d5a3mr5516181eec.10.1794199361082;
        Sun, 08 Nov 2026 20:42:41 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm10154026eec.4.2026.11.08.20.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:42:40 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] power: supply: ltc2941: drain poll work before unregistering the supply
Date: Mon,  9 Nov 2026 13:42:10 +0900
Message-ID: <20261109044212.1157357-2-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109044212.1157357-1-hj351016@gmail.com>
References: <20261109044212.1157357-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

ltc294x_i2c_probe() registers the poll work for devm cancellation before
devm_power_supply_register(). devres unwinds in reverse, so on unbind the
power supply is freed first and the work cancelled last. ltc294x_work()
re-queues itself and calls power_supply_changed(info->supply), so a poll
instance running in that window dereferences the freed supply.

Register the work cancellation after the power supply so devres drains it
first. Nothing queues the work before the schedule_delayed_work() that
follows, so the move is safe.

Fixes: 6d0c5de2fd84 ("power: supply: Clean-up few drivers by using managed work init")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/power/supply/ltc2941-battery-gauge.c b/drivers/power/supply/ltc2941-battery-gauge.c
index 6ebb555..8f8a8f6 100644
--- a/drivers/power/supply/ltc2941-battery-gauge.c
+++ b/drivers/power/supply/ltc2941-battery-gauge.c
@@ -531,11 +531,6 @@ static int ltc294x_i2c_probe(struct i2c_client *client)
 
 	psy_cfg.drv_data = info;
 
-	ret = devm_delayed_work_autocancel(&client->dev, &info->work,
-					   ltc294x_work);
-	if (ret)
-		return ret;
-
 	ret = ltc294x_reset(info, prescaler_exp);
 	if (ret < 0)
 		return dev_err_probe(&client->dev, ret,
@@ -547,6 +542,11 @@ static int ltc294x_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(info->supply),
 			"failed to register ltc2941\n");
 
+	ret = devm_delayed_work_autocancel(&client->dev, &info->work,
+					   ltc294x_work);
+	if (ret)
+		return ret;
+
 	schedule_delayed_work(&info->work, LTC294X_WORK_DELAY * HZ);
 
 	return 0;
-- 
2.43.0

-- 
2.43.0

