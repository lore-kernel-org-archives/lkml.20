Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595140;
	b=vHiO1LtCc9ZMGJXdlC041zfkgUsCTY4tnVWcl9ZfLS0xwvDXabD5uCa0O+GKer6vKk11
	 REIEoOeySmVhDl43zzCmL7TN7UxdX7kUXg5PjpFSPsoOJJK9QdLt3PRGrTlyPJGHSGLI1
	 v34PmdgVoBwaAHNh+PxBh64aWb6fEDNAjXQuv+dz5sUIhH6GzgYqRiqaHd6gcORk/CDjl
	 ODeazKTE1g+mIf8i6UdUVs4N0FE+P7z0ebwVbP/6qc3ckACbsquN120slgFuWQrMtfKtT
	 z2CRDtcYM7tJdZRI+6Q2Vf1fbKNI+9vhyFkwQsPng8cUO4fKsV/SsjwpHTmPguY+bSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LN2CwNYUJaMtWgl0Sqx3frS6U2bN/cs5NZC153i6MKo=;
	b=sPa5r5kJuLlqwaFRwlsoEo7Zth1VGcOebO+n3u1BbVa493a2NuYSOJWLYqkL2504zqvd
	 ohbOzI5YtxVG25kFogPZtINCnU8S87uPlyUkq38iykl5UEZYGSBPeAYfgvmrSbR0TeDl0
	 cN7XhDiUNqEeAGjEwoss4O0inRkYQKU5XjmL5uP0x6VE7d0CKrhQbVQWxlFWldAgieSdG
	 m9/UU6+ZarLIt4zEei69mhIRhUg1gpLxhGLbW4cdM0BsiXJQJqbIN1P9KuoHgCgunfNpw
	 loHFkPktynNuBvu9X4mvuFVtN9LZhszWQhScVM5/VIPrKductmM0Dn0kVLsQgcMJAyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Oq9rxrRN;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C365A607685B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C365A607685B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Oq9rxrRN
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-498f5fa5103so571670f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595138; x=1795199938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LN2CwNYUJaMtWgl0Sqx3frS6U2bN/cs5NZC153i6MKo=;
        b=Oq9rxrRNtCpwEjzZV+PW/Z7c5ZcUObfgr+74vDTIw50P/7rpHrgJZtpMHz7WiI02mX
         Qxj/I8xX0QyYicEVmO8Tk0qoc7vUnrqM/O4szbYTMAmSJiS12UgY+Hzz++4WcbJooXBE
         VJM4gUWKim/tO3k2/NNMBeLqcbk+BlTzm6JF8k6w/E1297gV14Pm+Lqe9QoehcT0cLE9
         WQG3DpX/4pwLIvgWMlISBC6R2xi8RKm1lt6nxVihKmDhndylVMiJX8BoPj260uszcvbl
         NAwhKVTf9ZO4H0bhnW1f/5/o8UkjFmTHzVSIzieknCk1oW1+35B+UwRlABePZk9VXDHp
         mNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595138; x=1795199938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LN2CwNYUJaMtWgl0Sqx3frS6U2bN/cs5NZC153i6MKo=;
        b=0Z9sWkpHNyO4B01F7bLTQmCFbyBt2Gh3seeEwwqd8Ft0mptHxOkMDpGswqTV3w1Ej1
         r6DDK2vEuBZjZonkK7Aj1rLoPRj42b1TE8rlWlO8gh+bbqvz1NoA24dhfYzYiYBrWNy2
         +mxc7qmq5Jm2JYbMp4Q5zlz6to0bWVb4xQQb8vd8OVrnxGt79OnL+2CAmMzKYTYW+x3F
         xGYFWcCjhBpqNMbqBY9RZ0eU7PFPjdP/dqAvxEEX74SKlbc88bcKP6zrYIFYQLQqIgvH
         km4ocIkvyRlxo1oJLkMbdYilVWn5cW6F90YopQtbVINPcjzcX9mU6bzLvJyYicZTOb8B
         xdpg==
X-Forwarded-Encrypted: i=1; AL+hErGfNKekeyLNe7JrUoxU5flOD8ZN+pkbThFnynbwcvlhtwOAHb7GYXAeCKuuK0pTeKoYaUlVW//p9A5llS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+X+MtFZ73kYDc4FeOkPceL8INAhuxisl50WgvGVU67Bpzu2noo
	lhckXKt/IRJN5SdAzQKHly/2+eG2AA/Qvf08Rx3aB4lyfAzW3hjA3GjHazC9/4QqjsM=
X-Gm-Gg: AYBFou378FlFDITgHGRwAKFK7kCB7xdpV9R7Obx4TN/LFuc5EBeug9EDFjK/ycwlQGw
	H7ltKAz11liGZUM7zLd7zIoUdxF5B+ytL14VkfnZeaOxRUUfLhsaJtOt76xoD3C3+mjjxUA1Y7U
	WdQAlqizYY02jKi1q7zzxoEHXrL0b/zGFIOulmV/1Xot4gzDNtgFJijAy+Kbdqi1nfafJX1plLx
	bv9ACfKaMq+lwI1yeYhAlwVrFUOkfjvEgD7xNdOgNxNTXu4ouDGlMwhibCroKa6TduFOC0InXoi
	UAFVun6xUysi9/QWXehZvUzUTGnNF3qA0DfsO75sl+VAojhzSWjkMl7GZLI/prgoGSS1rq+3mBO
	DyH7Aa36d/l3Jc3GZEnKSJbr6NT8rJeFFvHQ19wm3vQVG9s8v5oVvt13EsUE/lhm0jdjfAG3+Lc
	2dYT4sCzcmCuhqZGurSoS++MV6CZiqrKAVYtFrT8lz4iltIERNmewD6sbtMEYQ3QYS2aMOoUOjR
	i+o2oKnb04TDRHPrIzqE1TZalTU09ymh/PPCCO9yZChrjlifn/ZFpVG3NtMLCrXgAie/nyHgEA+
	IK39SSdb/vRnKsn9DporiTOK4gLogErgINcU/aixpHA=
X-Received: by 2002:a05:6000:4812:b0:49b:f45e:655f with SMTP id ffacd0b85a97d-49c72ba71e7mr7362555f8f.45.1794595137969;
        Fri, 13 Nov 2026 10:38:57 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:57 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:33 +0100
Subject: [PATCH RFC 19/23] ASoC: qcom: sc8280xp: allow using the sc8280xp
 card with lpass-cpu
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
Message-Id: <20261113-topic-sm8650-el2-v1-19-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/itIH/7shGZ0Ki2IQXVMnH+bawPLhj1P9/ZnwRGjSAo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91knGxg7vJ8bMwEILIHl36TWXjmHPkrpjfz0vxlq
 croOxUSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZJwAKCRB33NvayMhJ0fn0EA
 CLzDXh+zD21Nx+TrEXAZ8kSvyhtZ7IB5zf7J1Wp67yAH5yZL6Xd54qEdPFBhz4OfwnvlsBtyVlKX4V
 UA5twNltus1V9MH3lD3zOgO5rboWdWV7q5YjlO3+scHWyjAwBSia1epOadQWZ548yUOcEV9BK/Wjia
 gFkhOUewgk4A47CjsDgi8sc9epT1Kxd+acR06grY7Ehz3YkCv2t8NX3KhyQsdvLz/elkEpp11kwqEC
 OXyQesZi6L5PDVDb/7EhEMSpvHAVde1Q+2Yw9ld/v0g0X9H+3M8HWaYIZO2bpv4KEzXx/oLwN3XCYt
 1Fm0rEi3YBWwzAuNXNvBRU0PH9TRtKDJtJWYvshxyoxHeVXQ+TYBqECpb5lO09lMdeG38C3V98EbUy
 2gcSUEaN1+guqBrB8UcTcPCEl/bR1VR2oZPNxriFq2DRBQxCpcPkaU+XgGJYRHmCmHL1lDHOfaEy94
 /dc/KC74tEx053sx+x8BEdzoGpTf/BM4p7PhbkJTlV9vZfqHaKKyDA+XdMmFEsSNXRltRy5xlugERV
 EwI1mTsbuyZ6JMi1Z+c+LKEDTmPx884n1SaDD7U32cpU8MVUrS8RbV33jfJC6zrr/lMCM0QyhrThMA
 0JlivDYLaaSmj+xzYs3pj6O3/nA0fNNQSlP+bIrBO5npkPiYzfQQHd2/tEng==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the missing DAI ids and set the ops to allow using
the sc8280xp card with lpass-cpu and keep the sm8650 sound
card bindings working with either Audioreach or lpass-cpu
interfaces.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 8cc75a7ad866..ff57fb9051a2 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2022, Linaro Limited
 
+#include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -242,6 +243,8 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
+	case LPASS_CDC_DMA_WSA_RX0:
+	case LPASS_CDC_DMA_WSA_RX1:
 		/*
 		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
 		 * to reduce the risk of speaker damage until we have active
@@ -323,6 +326,10 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 		}
 		break;
 	}
+	case LPASS_CDC_DMA_TX0:
+	case LPASS_CDC_DMA_TX1:
+	case LPASS_CDC_DMA_TX2:
+	case LPASS_CDC_DMA_TX3:
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
@@ -533,12 +540,11 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 	int i;
 
 	for_each_card_prelinks(card, i, link) {
-		if (link->no_pcm == 1) {
-			link->init = sc8280xp_snd_init;
-			link->exit = sc8280xp_snd_exit;
+		link->init = sc8280xp_snd_init;
+		link->exit = sc8280xp_snd_exit;
+		link->ops = &sc8280xp_be_ops;
+		if (link->no_pcm == 1)
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
-			link->ops = &sc8280xp_be_ops;
-		}
 	}
 }
 

-- 
2.34.1

