Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900292;
	b=ksPZHEdD2jmR8Vm92AzAxhcUB7q3jZviduqSawiyPJL/p2YJl9nOUY1Of2OopDpNcTmx
	 iDhUqIqtew4sadKs890mkT638CIAc5aue7+EoGiLR/pNOKS9pK0QjiCt4ou0zy8l40Afj
	 1/lMvSYpz5U7lgJ8DOlGgi4Yvp/w5jtf+x7DxxlAMwwUSrutj3O7paXJb4Gf5zsUuqSce
	 xlBQm4kJIDPOmDwL7iH36QPqsr+ZJRP8bc8Y7z1TAndh8DTXxeqs7Bn2Pm4tbRcfXjna/
	 qqa7VirkB23sZ3NFSa/wIkULe+mGNMvJ7vr1RCsGAjFqII8AqH8MOsnQSHLAd9jz9jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900292;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Nr9ryGWb9itbMiGyffDdzZxicnVpC5tnEL/5L74dtj4=;
	b=HuD96UGBSOg0EvTYv412sQW/BZ+3oWsT5NgZYtLV/niPjXMtRs5eRew+SclalrqL2k0d
	 Fal1dtTKqGPTAuT7XkiexM6aMB19v7TBXVSngWgE6ebSSSIu9jR606uNHjx8+9WJw1YWQ
	 BmJnKfc/E1YwkwYsukG8t6UUCq1tBoFWk8GtAiLjyp5WocKqGHzt+QhT9iysmNS9h4Bf9
	 6CwTxQRSpiMPvBouHefLSVnQtNvFG0tmhiyOB5c4bL1pVOVpLdVfLXQXh5WDQxekQXMj+
	 lxIwgDemu3g44d6tzl1/h34Rldfy7uEFVRs3EzYZcUjIFXZ7YJGskct9BgMRsmFZdRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=fq43dEyn;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B439606A323;
	Tue, 17 Nov 2026 07:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B439606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=fq43dEyn
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Nr9ryGWb9itbMiGyffDdzZxicnVpC5tnEL/5L74dtj4=;
	b=fq43dEynQBArCjGVO8DaXJ4MFNejwuZhKy7sErr+RrYKhULDUMGefgJwJb3C6Ao04tGdyWNL6
	vdVyDj1g8TEfIyO3U+vfOhQnm/bZGF0qUi2X9iamXMQ1PXSAzhI08d3CCjQMmXmG2c+GuXk4wJB
	ynH3ZdO4LE+d2Lcz0QiiM0Q=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jTGSj66J6z1cyQN;
	Tue, 17 Nov 2026 15:24:21 +0800 (CST)
Received: from kwepemo200015.china.huawei.com (unknown [7.202.195.27])
	by mail.maildlp.com (Postfix) with ESMTPS id 0C5704055B;
	Tue, 17 Nov 2026 15:24:41 +0800 (CST)
Received: from huawei.com (10.67.174.69) by kwepemo200015.china.huawei.com
 (7.202.195.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 15:24:29 +0800
From: Chen Yuxi <chenyuxi19@huawei.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <ckeepax@opensource.cirrus.com>, <patches@opensource.cirrus.com>,
	<sebastian.krzyszkowiak@puri.sm>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <chenyuxi19@huawei.com>,
	<yeweihua4@huawei.com>, <pulehui@huawei.com>
Subject: [PATCH] ASoC: wm8962: Fix broken headset button caused by wrong guard constant
Date: Tue, 17 Nov 2026 07:05:16 +0000
Message-ID: <20261117070516.3861828-1-chenyuxi19@huawei.com>
X-Mailer: git-send-email 2.34.1
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemo200015.china.huawei.com (7.202.195.27)

Commit e59075211902 ("ASoC: wm8962: Don't report a microphone if
it's shorted to ground on plug") guards the mic short report by
testing wm8962->mic_status against WM8962_MICDET_STS.  But mic_status
stores the reported jack status, composed of SND_JACK_MICROPHONE and
SND_JACK_BTN_0, which never has WM8962_MICDET_STS set.  The guard is
therefore always true, so every mic short event reports nothing.

Pressing the button on a TRRS headset shorts the mic pin to ground,
which used to be reported as SND_JACK_BTN_0.  After that commit the
button press is silently dropped, breaking the headset button on all
wm8962 boards using the mic detect path.

Test mic_status against SND_JACK_MICROPHONE instead, restoring the
intended behaviour: suppress the report only when no microphone was
previously detected, i.e. a TRS plug in a TRRS socket.

Fixes: e59075211902 ("ASoC: wm8962: Don't report a microphone if it's shorted to ground on plug")
Cc: stable@vger.kernel.org
Signed-off-by: Chen Yuxi <chenyuxi19@huawei.com>
---
 sound/soc/codecs/wm8962.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 148480e4124f..a4868685218b 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3127,7 +3127,7 @@ static void wm8962_mic_work(struct work_struct *work)
 		/* Don't report a microphone if it's shorted right after
 		 * plugging in, as this may be a TRS plug in a TRRS socket.
 		 */
-		if (!(wm8962->mic_status & WM8962_MICDET_STS))
+		if (!(wm8962->mic_status & SND_JACK_MICROPHONE))
 			status = 0;
 	}
 
-- 
2.34.1

