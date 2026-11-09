Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794199371;
	b=KohK+JsZvbbyq7S6txTGgCLue6EsjEeNUPGQGrPSWVPH2xFzBcrXuuTQReG7IKIXCOXx
	 puvZGXCDSWmNXmUQbd5rpJsXJ/7I1r9xGjHYvLXO2QAf6E3lEsVzuO/KpofRYtOG9Ee9b
	 k/Xt19R1EPsNzLuc0cfe8AKD9F7VGj94mhB8gB6O/0kAFlTPmLb1qxOoo3QmsFiF6b5BK
	 kJbZVUB+88zPPi5PMJHfxYa6j22PDhTgHvaV5+OYvXdA5u8sRKf6iLqj78ditLkBESERO
	 3uejgLwnK0xUd6haWvYkYP5iLwm1AEEoRSWBBdBF+rkEQmyfyK7YabPvQNB5egHTmCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794199371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yZy6juQ/C2+U+L3WTVvMgyAkJHBU1cX+JxwPunI95Oc=;
	b=S/RL6ZRK6QbhL4qHZQ/uzKGHSkLqawA6fsKYEdEsfEcg4Wrjbn0D0Wei3JI4Cs2WfvDi
	 rPTPj/mQ8J+cAyzcDvVF2RTFtcbMGrVpaEGlFtkE4r7VKLTIoESfWsHvo1NIq/rekprxt
	 V4jZ67ksE+TsL2c7qryGGWGZbAdiaJx6kALsl92O63rCnxJrmrTLBI+6H+umPQQyMTD7H
	 5VWZap4dzK9tGAAk6JqquRxJN0/zROyKp4sai3Bvf5kS7pPFv55B0PKJRdWQmJChEqn3F
	 V2+RMaElhRY2gwH0PVScAG/Dmer9CqsjhN4niIA6p2D9r+C5vSBT078E8Txunc00iEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XkWijxTT;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BD5606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44BD5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XkWijxTT
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so1185592eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199370; x=1794804170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZy6juQ/C2+U+L3WTVvMgyAkJHBU1cX+JxwPunI95Oc=;
        b=XkWijxTTWAqwBLhYURWexse90j8lVvME6HjHujR/avU4s8oe2xbjRMSMCFK97tMZ0b
         O6vtS6ERCGtHtCCyAdVbQd6/PpIn38zebhx6WxFlGf0NJIRfX1XkoCxqRZKqmxmCCpgO
         9mynUDx4Jgh5HXko5DbENTlBkZFuAx48zd6c97EQG27tC55FN9ikxX3vl/5iR4pvYO/C
         PsF+hP6z6mbVbb04Rpe2Qy9lmsAoRXK5P5F+z0UKtMr4AyTxrzev5IWcY+WvuALVBfnZ
         Xrk3aVHeo/wYy7IZ0+8e9aAQY2Wo9+KtMHSbYRouYdVZZ7WxPh9Eh+qm/yNIeOxqhut6
         SuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199370; x=1794804170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZy6juQ/C2+U+L3WTVvMgyAkJHBU1cX+JxwPunI95Oc=;
        b=eZ+oS6mzMIrzwCCmqZnEyXaR311Gs6w602tA8Ox29rqI57SMWH6ax8x+24XBLlDzN7
         f9CX4AN1IOIwoow0fGEn8PT+IlyMzaX7Mpx0w1Qzgq4MqpCBINveC9s77oO86XhL6Dfq
         M99gN9UpsBjQXIvHYNo0sgQ7l0rZY09lrchCi/X6iaV0VZcUCvfc4LghSxq6guBiFVoi
         4fQkbBXdw1xWJDEk8R7wA1obsICShEAaTbMd7EaHZ23vHZpYDnQRcFPzhDf2oyduVcpa
         /OMeu6U6xWDbEVGIejvuTdjA5hOq2ByleSa4EU+FpIf61Slxp5wScdrB7CeGGNbg+wGY
         6bwA==
X-Forwarded-Encrypted: i=1; AL+hErEWH3Cp23bCw04C7mOVF4M5uhA0kuFJGuli10NXnpcqJHIoxl+LaixEub4AdvOky8oi4RkFEqQLh2kdjNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5LaAkGK7ihI6pF0LMsgBf0i+V4BuCx4qFJZYYSZdFUzZhNafP
	uH8gUr3qu5S9UZV+Qh3Fn6Jp+thP7+5sqzNURhhw4VLAuYwaG4brsMQr
X-Gm-Gg: AYBFou3S9fpGFpCJ3VsauM9ZkTMr9IVUCQlryU8s4fuaBVInN2jWG/iktg13NUiY9Dq
	oO+jqjydloN8yQDLIXtqU33JzysAR/7TgYaGYHvPNhKD6uUWFguAhtDiRdgfWn3QwwES+E2BF9d
	kKF0sp0BqoHfHn1CeNiYKk6VBAsUHApjYRgIsVa9OrKLZrxycJT6D+tSk5t8ZuBUpwYYlyNTfvu
	vyN2YlAzoYXmBoLREot/b4w2/JIQqF6y4IJgAqR0o0L4GnosB/lRXy37Pg6gbeX0xu3DeFUovC7
	RhOYW0JxsxWINEDKRU+px55igJMyd9IsMFg5M3hdZHv6QTLke/G/TjAoH3Sc/YwG3hnYnzWPsT5
	S5Uv68a2nEC6WU8Hk3ZnRt8ZDfcA/XpDXtFNABT7PXRAfboB3yDA8XeWhFy9gFLWpPhXBiowN22
	htbaCfN/rE0KbRkb9cLrozq7OsYDVdvV0S/I0CP7CbUhpV+rfv4Ueony/OJgnK2Ow8UJEKQWXxx
	5K7Hv8f02QzsszYtWIieRA7E7tEdDv+O7J5QmWA4GWnhE5kArlHEbAS8KHZUUZOOferJdYLnCJw
	X49xekXKGjBU11vvH8G43ivCJ1bvDfmgxnFnBc4Rm5cuSCsP
X-Received: by 2002:a05:7300:da10:b0:36e:8e6d:a0c0 with SMTP id 5a478bee46e88-3725dd59dd2mr5386387eec.19.1794199370484;
        Sun, 08 Nov 2026 20:42:50 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm10154026eec.4.2026.11.08.20.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:42:50 -0800 (PST)
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
Subject: [PATCH v2 3/3] power: supply: mt6360_charger: drain chrdet_work before unregistering the supply
Date: Mon,  9 Nov 2026 13:42:12 +0900
Message-ID: <20261109044212.1157357-4-hj351016@gmail.com>
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

mt6360_charger_probe() registers chrdet_work for devm cancellation before
devm_power_supply_register(). devres unwinds in reverse, so on unbind the
power supply is freed first and the work cancelled last.
mt6360_chrdet_work() calls power_supply_changed(mci->psy), so the work
running in that window dereferences the freed supply.

Register the work cancellation after the power supply so devres drains it
first. chrdet_work is only scheduled later in probe, so the move is safe.

Fixes: 0402e8ebb8b8 ("power: supply: mt6360_charger: add MT6360 charger support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/power/supply/mt6360_charger.c b/drivers/power/supply/mt6360_charger.c
index b4d462343151..71c60ba012df 100644
--- a/drivers/power/supply/mt6360_charger.c
+++ b/drivers/power/supply/mt6360_charger.c
@@ -790,9 +790,6 @@ static int mt6360_charger_probe(struct platform_device *pdev)
 	mci->vinovp = 6500000;
 	mutex_init(&mci->chgdet_lock);
 	platform_set_drvdata(pdev, mci);
-	ret = devm_work_autocancel(&pdev->dev, &mci->chrdet_work, mt6360_chrdet_work);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to set delayed work\n");
 
 	ret = device_property_read_u32(&pdev->dev, "richtek,vinovp-microvolt", &mci->vinovp);
 	if (ret)
@@ -828,6 +825,10 @@ static int mt6360_charger_probe(struct platform_device *pdev)
 	if (IS_ERR(mci->otg_rdev))
 		return PTR_ERR(mci->otg_rdev);
 
+	ret = devm_work_autocancel(&pdev->dev, &mci->chrdet_work, mt6360_chrdet_work);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to set delayed work\n");
+
 	schedule_work(&mci->chrdet_work);
 
 	return 0;
-- 
2.43.0

