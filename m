Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038907;
	b=SmaZFiZ7Q+fd2dhAiT3c1tfAW2WveGg2fYxAVT2XckNM7um2ADQFWD/D3H9oh2CMwGo1
	 Zx0z90K9iRLuQeQWZCNAeJzDG30qzp/Pz/oUFnw8U1uu9nULpaLRnTJTuf6cG3j6AN4E1
	 UJ06aCwtKR0wdIehL2wd7mMff4l6vkVz99YDg140u/g1ugLyypQIktHuaGRbHob5XQeLB
	 xaEQ/+xqkREeRcGMii/MSHGNuA+zueJK6Ak90CJoVr2mAg5h0Hhxp5q7U5aV+d80Uqa1Z
	 73BIlpD8RHBw6dOxPNBmakVN66CoWvHEadq6BL4n8MZvSdmTR14ciLufQkMoIwOA10w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038907;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=zrJYAF9LebqD+H/242H7Pwb7Q/5emLnbPPmBS+xTCHg=;
	b=GNRb6vv+O/FJq70mssOpZdT7xXfePY7ysrYRVvaNZ+6p4fuoikORWidAIqtfQtG2jZOQ
	 aUviNdScDkmgqsDMae08co8Odc2MP0y32MJQZnh66j9S+D0aXqTOf+0lbNnzsb221b119
	 o9ZCHapp9ueZ0LawXg56UN9Jws/trGEGnBFasj9lIUAO3tRVJxHMhkPd32hy3Q92np4jS
	 hOn2xkLxpUO6u8e2J2vXdxYfARhL8UOCwVKzbWipd1Wkv3gH+rsu2upfH32RoW0bjXlSv
	 ZqI1/itaY3sZ7i8qTHwL1SbhMWgKVvv77z5avDTbtdrSGoYViyxLufWan6hFM4Od0mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35969606A332;
	Sat,  7 Nov 2026 08:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35969606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jM7w8641rz5B12h;
	Sat, 07 Nov 2026 16:08:24 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 6A788Kub096651;
	Sat, 7 Nov 2026 16:08:20 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:08:22 +0800 (CST)
X-Zmail-TransId: 2af96aeedc76952-81502
X-Mailer: Zmail v1.0
Message-ID: <20261107160822723MQsHLesOdU6-MJoFTSUkb@zte.com.cn>
In-Reply-To: <20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn>
References: 20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn
Date: Sat, 7 Nov 2026 16:08:22 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
Cc: <lgirdwood@gmail.com>, <heiko@sntech.de>,
        <linux-rockchip@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <wens@kernel.org>,
        <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
        <linux-sunxi@lists.linux.dev>, <kuninori.morimoto.gx@renesas.com>,
        <linux-renesas-soc@vger.kernel.org>, <srini@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDIvNV0gQVNvQzogd2NkOTMzNTogZml4IFNMSU0gaW50ZXJmYWNlIGRldmljZSBkb3VibGUtcHV0IG9uIGVycm9yIHBhdGhz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A788Kub096651
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 07 Nov 2026 16:08:24 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDC78.000/4jM7w8641rz5B12h

From: Shao Mingyin <shao.mingyin@zte.com.cn>

wcd9335_slim_status() takes a reference on the SLIM interface device
with of_slim_get_device() and hands it to a devm action
(wcd9335_put_device_action), which releases it when the device is torn
down.  Four error paths also call put_device() directly, so the devm
action drops the same reference a second time at teardown and underflows
the refcount.

Drop the manual puts and let the devm action own the reference on both
the success and the failure paths.

Fixes: 082723fee626 ("ASoC: codecs: wcd9335: Fix SLIM interface device leak in wcd9335_slim_status()")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index a98d1fd78925..0f8c9ccd8500 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -5136,7 +5136,6 @@ static int wcd9335_slim_status(struct slim_device *sdev,
 
 	wcd->regmap = regmap_init_slimbus(sdev, &wcd9335_regmap_config);
 	if (IS_ERR(wcd->regmap)) {
-		put_device(&wcd->slim_ifc_dev->dev);
 		return dev_err_probe(dev, PTR_ERR(wcd->regmap),
 				     "Failed to allocate slim register map\n");
 	}
@@ -5144,7 +5143,6 @@ static int wcd9335_slim_status(struct slim_device *sdev,
 	wcd->if_regmap = regmap_init_slimbus(wcd->slim_ifc_dev,
 						  &wcd9335_ifc_regmap_config);
 	if (IS_ERR(wcd->if_regmap)) {
-		put_device(&wcd->slim_ifc_dev->dev);
 		return dev_err_probe(dev, PTR_ERR(wcd->if_regmap),
 				     "Failed to allocate ifc register map\n");
 	}
@@ -5152,13 +5150,11 @@ static int wcd9335_slim_status(struct slim_device *sdev,
 	ret = wcd9335_bring_up(wcd);
 	if (ret) {
 		dev_err(dev, "Failed to bringup WCD9335\n");
-		put_device(&wcd->slim_ifc_dev->dev);
 		return ret;
 	}
 
 	ret = wcd9335_irq_init(wcd);
 	if (ret) {
-		put_device(&wcd->slim_ifc_dev->dev);
 		return ret;
 	}
