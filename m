Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793528742;
	b=TokNnktGQH3Y57NS6F1tJJ1BvNCTs1oVycmg0qUwh7qExZVvsHwXYqE/qEkX/4BEOLWJ
	 rlqekHb6gui6SjA6T889Uk5hq/Cr/9hDmhFVUTcTh0NJ77lpUWmEOwmeA2BNcjMBOE/YI
	 2kYe8JA368JyNbbtVcquf3iogffpQlYJFFohr02yz0kVjIiCjIMzk5cLRQdIVH0e0W0IM
	 ECBm0jCJ2VU5M2I1fOFsPHu4tf613syljd9YlHXlInYJ4DoVMr+Qb+Q2eeAVsZU9XbYl3
	 QnrX7yWJv4z0g0S+OHKgVNslJeyBIyunWZ9b/QdU2ezKwj/A8FEkTs3YH+200Du2iAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793528742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ScDmKIg4acvR723VJmmxd0Toi7h9g82TlLCDxj6T2go=;
	b=gnL/Vp+ubKoqG5/WANFrJKu4XgXKqniZHVaJ+Od8ol7N17n27j0ElnRb6/ZNyElqQrR/
	 zRPYU16h6m0szvW/ByG5fMmXKlyKZvykwtyAEeAz0FEVzbVPbKgfj7Ecg3SLiVozaErCs
	 gfPJMWnR3sg4Slnc0/CJCF2e4TILqI3pklyk0GDtSpbOcZaM32aZP5bTkwew+wP+/H8kt
	 lXouq0nECocJWG63xETECbmmDVfGgyEWXI4IypeTye3gVOwzeLtVhF8CIsZTxxEL0e9Aa
	 dRvUv2qcpcc/1RIkb+0+8DbW2gbifP3A8KcUCogZHCPPiE2xEGpidGPQ964YPtRmggg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1EERYeq;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D5A606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D5A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1EERYeq
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso671896eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793528741; x=1794133541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScDmKIg4acvR723VJmmxd0Toi7h9g82TlLCDxj6T2go=;
        b=Z1EERYeqilyU8QknxfEMmyHwDcF6fm4byHkFPlQQobVw/FOEaNVTFXmU7C2l80ZFat
         1h0ZuPWY3X/gOUb6xtzVrzrmChFGdFE53UBQFCE/rXG7EonG95ph9sgqiYjTOSO8dq4C
         F0dzXiyU/aFoUar7O1KCfH+edLj0wyx6K9GOl+dBe5QaUoAVZZlc/Y6EPEoxR1jMGa6h
         SkdGKaybrGp+HAMYFvWlxziTp2I/xd/3ihMUnZrbeQiBpjNo36f7E3pz3Q9TKrT9CSI3
         vIgqdRlMjYesM9lkZmt5IJdvbewCUaUxQ6A0pBAnHikQfpyUD832tsUA3E1XNVVbEZMm
         vodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793528741; x=1794133541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ScDmKIg4acvR723VJmmxd0Toi7h9g82TlLCDxj6T2go=;
        b=HdNk6inr0gJneqKT54oP1t4hV2dVqPysh2Cu4SzAR+6bp2JElbojW9IHC6W1YYiATA
         ZCQLElZkzr6SAb2KJRwO2IkwE3AGUDHLsk+ms1nk6aCpwwd2Ios+BVVNryPk6qOEKNuz
         kJYAdjyWE+OB63ITXjIgoGmysQb2AgsL2hA5oXUSTwkCTu80fVGcMDiXme0ifESzIQJe
         HdLTmAIy/URsiJLlCYNzFnC2H7SzUo5Xqal36T2BkhFKOryVb6up5Ou/l790ETxuGZPM
         v2W9tMaM0fVLfd/wdZEq6Iq50BLgzXCbXHwFU5sqh+UbeaPXiP5yjCAf12Ubas8FWk/L
         hEOw==
X-Forwarded-Encrypted: i=1; AKwUvByTy+om/KDkvBwv3PpU6By4C5t7RAtNH9mXaVjun1QDyKsD3PoVru0bI3hB1JtOk4TG4XJzUgeM328KEXw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbfgFMTXas+AYY0/IlW5aMT9gQbVHp1VgLUU1kNonrWGOYlz3k
	LpyGIS4syBghGSkOW2OVniHxTuXqRY4U4tcqbCNnos4SUDzkjAVqxRvr
X-Gm-Gg: AYBFou37Tayjmbbf4teF6s20gHLR0DQpkMoGc+c9wkdzVlrI3ee+fqaFc4Nu/BSS3pt
	514cxkhfXw3w9QNEYMmuC8sHsPM75jxgg7qObJLrBrfYmvkWDtDA8KtGwb0rLSrLYrT30aE0IuP
	H1NT9xSebqKGpNRbuqlZlf7Pq+KESRp0PIXQUAOX7XZnry8RiPAf47FnDAMGsXJfhZoaqoYdIIM
	C0y5Qys/TaiXB0RyInDO28ESgB8ozbo9t+cM+BJJgthMiqky+2Di4FWmk8h4zsrNjT0izMbkv+2
	fQZkNVwDWYR7YObENT33J0uYvvUsPsqUP/aqVmH8ibBCCy2kTxjymbkrv+k3QgEz8UehBnEOxm5
	t9D9+OX/u7/e2bqC7J/yYH/Z8BUoqniQ5iw40EOac3aIRNFeUTSeklttdbElBcuiy4qIg04YiMp
	kEivLfeZPU/4egReUKCwfpwgJLo6cKp7g7sD5MMw1EPLIbw9cbMA5sCfrVAsS0HLoliL4lUWAxl
	ontISr6oINathHFtmjr//Pl1zChPZgphZJSCt1C4kYOPx6T0vm10SL+K3Ms+KDSXdsLQR9lA8gG
	jB3Y4vH4tia/5msZPp0TT7ZBSPzTTYvFyutZFhWu+/4LB1GuxQy/iOiTDrtjlfsqUMdohZ4r3Ut
	vBTaTrZcnOsNRYdnCtVwhW6NNir/zmGYi2vXHUFfoS5RcwLFvtjkirN5A8RobMrPygjCMVGGEbb
	D5XEYojka153H6kBUpxarwqfh6D2gYx0hH224BzE5UTw==
X-Received: by 2002:a05:701b:4589:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1ac5bbb487bmr10547378c88.10.1793528739980;
        Sun, 01 Nov 2026 02:25:39 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm6767163c88.9.2026.11.01.02.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:25:39 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v4 2/3] iio: proximity: sx9324: keep the IRQ balanced across suspend and resume
Date: Sun,  1 Nov 2026 15:55:03 +0530
Message-ID: <20261101102518.22757-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101102518.22757-1-kapoorarnav43@gmail.com>
References: <20261101102518.22757-1-kapoorarnav43@gmail.com>
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

sx9324_suspend() disables the interrupt first and returns with it still
disabled if a register access fails. Resume isn't called after a failed
suspend, so the interrupt is never enabled again. sx9324_resume() also
returns without enabling it on error.

Make the two mirror images: disable the interrupt as the last step of
suspend and enable it as the first step of resume, before anything can
fail. The driver works without an interrupt line, so skip both calls
when client->irq is 0, as sx_common already does.

Fixes: 4c18a890dff8 ("iio:proximity:sx9324: Add SX9324 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9324.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/proximity/sx9324.c b/drivers/iio/proximity/sx9324.c
index 255a36976ac4..a76c49dda354 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -1088,8 +1088,6 @@ static int sx9324_suspend(struct device *dev)
 	unsigned int regval;
 	int ret;
 
-	disable_irq_nosync(data->client->irq);
-
 	guard(mutex)(&data->mutex);
 	ret = regmap_read(data->regmap, SX9324_REG_GNRL_CTRL1, &regval);
 	if (ret < 0)
@@ -1100,23 +1098,29 @@ static int sx9324_suspend(struct device *dev)
 
 
 	/* Disable all phases, send the device to sleep. */
-	return regmap_write(data->regmap, SX9324_REG_GNRL_CTRL1, 0);
+	ret = regmap_write(data->regmap, SX9324_REG_GNRL_CTRL1, 0);
+	if (ret)
+		return ret;
+
+	/* Last, as resume isn't called if suspend fails. */
+	if (data->client->irq)
+		disable_irq_nosync(data->client->irq);
+
+	return 0;
 }
 
 static int sx9324_resume(struct device *dev)
 {
 	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
 
-	scoped_guard(mutex, &data->mutex) {
-		int ret = regmap_write(data->regmap, SX9324_REG_GNRL_CTRL1,
-				       data->suspend_ctrl |
-				       SX9324_REG_GNRL_CTRL1_PAUSECTRL);
-		if (ret)
-			return ret;
-	}
+	if (data->client->irq)
+		enable_irq(data->client->irq);
 
-	enable_irq(data->client->irq);
-	return 0;
+	guard(mutex)(&data->mutex);
+
+	return regmap_write(data->regmap, SX9324_REG_GNRL_CTRL1,
+			    data->suspend_ctrl |
+			    SX9324_REG_GNRL_CTRL1_PAUSECTRL);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(sx9324_pm_ops, sx9324_suspend, sx9324_resume);
-- 
2.53.0

