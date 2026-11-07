Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038916;
	b=XXbUq/8PvtGYR+zCwg0qHJssOFD1VgrmSlI2bUzzqN9DrDWvz2VeSCt8U88UVSDKEVXV
	 OUjcgltc9FX+rmmiQ9pPGz5A5wrBuDrZ8/CPe2OFPcNMonXaWgxsbOwJ6EJB8v1pZ1lk8
	 6Wq8kH3v+AfaR3hiL9VOnECrYo8KfummXIwmtpUSdOfkgpbLnaiw0Y1qvhYypgUXOn8cp
	 U9FvOsmmUFuDRY9C+LpXpH2D3FnTDpWRVsmisPWnnZR676eXw/YXb5pdCnnjAotpdwB7V
	 8Z2qaYwTHzoBgWjkT+qFEIPUZldiyfg/Z/+jwJ0QbhntttAP7azmq5YjNIJCgrF2Dlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038916;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=EG+y83gpbL7hXWFwNvkWQQTjH9VbIPQJjGC4yYN624w=;
	b=BC+0UKErgwF6Kki7h2htwPPaQLjITeawpkVlTuekb/qraJoVO9GVP3QpVh6z92guf9aK
	 15mgo3FN7fASSVzmNOjyIjgI1NPq22va8ZSxiNrCRYRW2vyDAu5a4LprMuGfACzu/7awu
	 osYNUIsX/wc3tIVowCW3SwVaXJ0HCFXssJuILuSI6Dcrunitcv6TmLpL7GXzLsm7RZI81
	 gti/zR7mchUSk9r3bccvCvSNxrbPk0LiM3B4Is9zqX8GF8zuEhlKZcW2cu+lYM7c6duTJ
	 /3yDxMztJYZIoIII324TvYwdfxuI1Zl8ZD5Jahns787/mqpZDwIllXVS6guvRW/0SOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F369606A334;
	Sat,  7 Nov 2026 08:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F369606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jM7wH5Klvz57HS2;
	Sat, 07 Nov 2026 16:08:31 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 6A788NtQ096673;
	Sat, 7 Nov 2026 16:08:23 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:08:25 +0800 (CST)
X-Zmail-TransId: 2afa6aeedc79740-932de
X-Mailer: Zmail v1.0
Message-ID: <20261107160825704ak9coG8uWvEC-daLg4OkT@zte.com.cn>
In-Reply-To: <20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn>
References: 20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn
Date: Sat, 7 Nov 2026 16:08:25 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDQvNV0gQVNvQzogc3VuOGktY29kZWM6IGZpeCBidXMgY2xvY2sgbGVhayBpbiBydW50aW1lIHJlc3VtZSBlcnJvciBwYXRo?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A788NtQ096673
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 07 Nov 2026 16:08:31 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDC7F.000/4jM7wH5Klvz57HS2

From: Shao Mingyin <shao.mingyin@zte.com.cn>

sun8i_codec_runtime_resume() enables the bus clock and then calls
regcache_sync().  If the sync fails, it returns without disabling the
clock, so a failed resume leaves the bus clock enabled and its enable
count unbalanced.

Disable the clock before returning on the error path, as
sun4i_i2s_runtime_resume() already does for the same failure.

Fixes: 36c684936fae ("ASoC: Add sun8i digital audio codec")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 2e4a205e4e56..e7d5c81ae1ef 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -259,6 +259,7 @@ static int sun8i_codec_runtime_resume(struct device *dev)
 	ret = regcache_sync(scodec->regmap);
 	if (ret) {
 		dev_err(dev, "Failed to sync regmap cache\n");
+		clk_disable_unprepare(scodec->clk_bus);
 		return ret;
 	}
