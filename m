Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038910;
	b=0Aw66wD1/MhBCcDbbpGT4mbGvEcydCiCWG9u1RJyITxj7lAQXvOkLOBnPOO8lvQnq372
	 +e7uBHGgWfn59ybXBXajJr1mBU3kWseE9oKnGTJaOIElO+qynSRKAVsN6odFs/vwB9VN1
	 LkvR3ZMSSx/PEFWn2qFwYpGsu8HFkLQlWpjRID0PLotAJGgbImyoauaHeC4n4kZ0UvBd1
	 gezjf7PWozP8x2Sn4B99Kqg2Od+uvKO0i7lm0lWFTmRjuxwMqStfWgyVPf75kBTZrvNJQ
	 weSVow+g/jqtNY++dBaPBCILT2qM10/dhVSj2us1yMUDyKh/ctrKxpLppjbQ2icZ9tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038910;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=W+DSbRgt6RPmWeWxjcN3w52/cEPdyy0qis5H5mohIiA=;
	b=U0TsOhskN+7VAWgRAv8TPWQyJb9o9XxVQ0xpeQxc4ZFb+MImmKp/ejSJswmqZf5nGMRf
	 1O4OoN7nMOm5wvGVbSty5Cv+vVXCBV8VLPKNatP/YoI7HTnof8h8weWOxbzN7A0hKVtOo
	 G3k6T7avl0fPknHHIY0TUurHxRsv4HntGiKQAKVTvv051+S7+90XPPK2K+Q16U0PL7D0W
	 xnp72JQyqBvAAkh7oYmVWeh1dudEMFHYXN4Y+gHb7Qo8v4MFKq+JR0Eq1KCV51hOhw7c3
	 um6C19huB7y/byVf+UWlnzQUKoLESZzO9v9lNekx/677mk4aPi78avC1TKyLdXtio7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FB1606A32C;
	Sat,  7 Nov 2026 08:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25FB1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jM7wD5qKdz8Xrnt;
	Sat, 07 Nov 2026 16:08:28 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 6A788Lsp022865;
	Sat, 7 Nov 2026 16:08:22 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:08:24 +0800 (CST)
X-Zmail-TransId: 2afc6aeedc78151-80d01
X-Mailer: Zmail v1.0
Message-ID: <20261107160824242Q5IY9bIPRFmXX_lzrU7ee@zte.com.cn>
In-Reply-To: <20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn>
References: 20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn
Date: Sat, 7 Nov 2026 16:08:24 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDMvNV0gQVNvQzogcm9ja2NoaXA6IHJrMzM5OV9ncnVfc291bmQ6IGZpeCBjb2RlYyBub2RlIHJlZmVyZW5jZSBsZWFr?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A788Lsp022865
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 07 Nov 2026 16:08:28 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDC7C.000/4jM7wD5qKdz8Xrnt

From: Shao Mingyin <shao.mingyin@zte.com.cn>

rockchip_sound_of_parse_dais() takes a reference on np_codec with
of_parse_phandle() on every iteration.  When the codec is disabled or
does not match a known codec, the loop continues without dropping that
reference, so the node is never released.

Put the node on both skip paths.  When the codec matches, the reference
is still transferred to the DAI link, so that path is unchanged.

Fixes: 0d52954ffe80 ("ASoC: rockchip: Parse dai links from dts")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
Tested on 7.3.0-next-20261030 (QEMU/TCG arm64 guest) with a synthetic
device tree on the QEMU "virt" machine; no RK3399 board or audio
controller is needed to reach the parse loop.  A test-only hook, applied
to both kernels, compares the reference count of a disabled codec node
referenced by rockchip,codec with an identical unreferenced control
node:

  unpatched                            patched
  codec refs 4, control 3 (delta 1)     codec refs 3, control 3 (delta 0)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index d4a0daabfb42..d18688b74ae9 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -540,12 +540,16 @@ static int rockchip_sound_of_parse_dais(struct device *dev,
 		if (!np_codec)
 			break;
 
-		if (!of_device_is_available(np_codec))
+		if (!of_device_is_available(np_codec)) {
+			of_node_put(np_codec);
 			continue;
+		}
 
 		index = rockchip_sound_codec_node_match(np_codec);
-		if (index < 0)
+		if (index < 0) {
+			of_node_put(np_codec);
 			continue;
+		}
 
 		switch (index) {
 		case DAILINK_CDNDP:
