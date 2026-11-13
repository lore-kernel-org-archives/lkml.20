Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595126;
	b=OXeO0bqkZ5t0ECjLL+aVXvekAE8qTFI8Yc+EGiKyHGIfWyW47L8PuaIAf7qzXFB0JU02
	 GJkFyGvkU3VzDMx715EaA2syfp5fkaq3o1+EP8EQn85GfhWV7hg3mvK/mA5Oaw+01RG8I
	 187FM9lUN8oFDN4wZDb/TpbNfyWiqvdjvTPp0gPWbCSvXcjNtDeY4rtqKlAJ/Y3+TwZ8y
	 vdCNhBXBzkZDs/Ypg+Ml73nrQWYFzPvqC+MuR+7YGi6gdYdGzZGuLJb34/p0ATbzAFeIE
	 xIcc3mrI0Gox2czfDpvw8t2gGiLwGWKPYFJzGsiTtdMpwPqBYkDBrrkCyiEGyRhp5eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6Yb4xm/71FbPbrX8bul+Nh9djbt0T9PDaJg9F6V3s1Q=;
	b=P3nT5WuwWkKp8ybBb75xoB1r93+xmqVQf8aK7Hfvnbq3nASMnotN/9+YfEyb7BWRzmkN
	 3DcEuYW1JmYBIaqkd/wHfEvjRh2xMp4CNEU5C//M7mZ6+Ttk0SRl1lUBANlxENlPDWHmC
	 U0ySLwNwEnjr5/38QfJevPbREtd8yo1ErPEmIswnkL4PaDI9ia98qloa8/4gBrGS6kROP
	 fduvksV5IjRlfAL0DS+X2NOeTkrzMgyYI6pgjxITqvSXWoS+obuJSQFjSK04Kh2fKzM3s
	 6E+5xkJNQHHpoUEpWxiFz5xr0UPND04XP1g9TZvSOur+NDYkgW7xptDbYn/m3o/0l8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EMnFR12B;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C93606CCBF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C93606CCBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EMnFR12B
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so6650305e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595124; x=1795199924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Yb4xm/71FbPbrX8bul+Nh9djbt0T9PDaJg9F6V3s1Q=;
        b=EMnFR12BFy/Zd/JfaqoThARSiDLJF50Y55g/A5oqz/RdNk/+AyHud5tlPSeLcaJY7E
         w7kfG9fjnI+eT86YE6YxbUMWWML14o5beIvMc/Ro6ndCwjooH0cV+KD7EloGy/wRJD9V
         Jif90NVzZVcQ6+YoLmHHZt4iAeZLaEA7ly68CU49G7X3pzaWIZR8lMzP2+vY891L1jTl
         h8RmgqDHq6vxU266MaErJnLthW6M6kNZv5ZuJ3s2+KVNORgMp4D4JrCArmECEFJMES0C
         4OFjKe4uqE0XjwMT4xmKxa49UaDBJ5eRE3nw5DHCUehtiWFP+2bUX4YlOMp59d2pT66y
         2umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595124; x=1795199924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Yb4xm/71FbPbrX8bul+Nh9djbt0T9PDaJg9F6V3s1Q=;
        b=putS2oEH4juBB8jpoxMiT+mh310kEKZLkSrw1LCNTWpfxoBjn+VG/nCy9wsQbbKcZf
         Gt3OVeW20y69rOFqM6g1UT/hjZpzerwjm/xuoGk3BA4+R3eHehruHn3M90oKfLbfLBcW
         AI/G7yHj/DPOpAjqh50C5wvB8j7zMdl6mBI5ul6lDZTmRhmZNFRc7GanAntvitwiQNCP
         zz80OX84+7j2FN+AV/A3+Rr/XApIQFWJAzQQbT1RAbzRnc6jy+qMvs0pPhN/uAGWKKig
         fTFI8Z4u1tM6eUiu2P2QjIPc9CLi1pHB0AuyeHn4+6m45WYrE8fphbpc/YNdGgr9IkpS
         rGBA==
X-Forwarded-Encrypted: i=1; AL+hErGSo9TCEe+MAGS2/T/6Aha6V/cYtbYNMQEcMM1da8UV1fDnLXEu9qYsjEgcWYOkSM+h32AvqkEep13vVzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hm7AS3in7DMNmMn4N2XAu7ai/sBgz3CSo/PhCRH35CxMHx8WU
	oHUnHeqwbTTyCVfDLx1SXicyxR7KJx3dpUK/7owoNVJVZWGke3/Ucn0rL4+Eilvh7jQ=
X-Gm-Gg: AYBFou2FuAbY/XUo9BWkzth2xcveIB/ZLXXW16gODMvg6WKLGNR0pV32QN8jdEai4v9
	VhLybuprDTcGz+aEKXxMDdNHd9cFqiNnEHuYa6ZB2f5eOms0d5tKrbOlGL2JrXYxbQU+1POuRUo
	CjouSNLqax8LHtxysQvmrYcp2NiWvmUZnd+gXnbIU4uFRYbX4KLsDITelFoSXsKCy1yBHonowkR
	wy8an02iSoO18+eR/PYjApurdPVmsrHdUC6YslJmfgBfGP+dMe5tDU9epVlnNLGaCtgmgn9XKhT
	0BNPGO2rkXvQwOc/j5DCgpKTdsSIO6DyG/PkdfVVbj5KsHkPqy8BUpJlsPMvvFKVM1jqRJTGczY
	oiiB7sg3N08ztWcAifI5NFVP8rg94NfbmIaqKuOXtwe9A2Hj5z0iTsOZkwXThwEy0/In4eY0Dcm
	W59fhBq91xa5nZ6ZfwnL5PAnQgD2uVgwN1BWNTtVz0dDwoqzYc3mJcFWCAk0EUUKqoTkH2n94ch
	7vQX8jh94H3r/ZuhRpcBYq/cYyGnOxagOO0CNhwdj/IyKWeG4r/zrsvnEG0fwIW1JMWev7gaqTK
	BeJYcCpIxfqcU7AXNdvU2eyaXjdcUH5PEl2VErjxByk=
X-Received: by 2002:a05:600c:46cb:b0:4bb:52d8:73ef with SMTP id 5b1f17b1804b1-4bb55af12e1mr70215745e9.34.1794595124200;
        Fri, 13 Nov 2026 10:38:44 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:22 +0100
Subject: [PATCH RFC 08/23] ASoC: qcom: lpass-cpu: get the optional
 codec_mem3 clock
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
Message-Id: <20261113-topic-sm8650-el2-v1-8-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Z8GunUt92Y/75liBMYWXLbRwhUaetuFUQPX3BHF04L4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91khB1slVEF7d6pDan68qfrqHRNn8kCup/oD7Ah9
 hZllBjaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZIQAKCRB33NvayMhJ0ezgD/
 45ZUV+oN3bZPvX/nBQqaRAOlnpXXntUnO4puAR6WYjREGQL+qQR3swBxSOfZuApkJ1uP+MRJNBBNWH
 lQUfzGyz359aiHXu2wQg8ejOYBhu/RCprmvNTWoOo6iEDUMhAJmcNC4vwAEeRd7hGRetUUBwaGGqBA
 2MX2bvLNk3hnBttn2U2wB73UDvIPTZMix5+hOCKn77M0TkzxygA+QtythciBB1bz1ZjHEH41fvW+Rf
 v4MG5fa7fkHO1dHDssw545R581/ncL7jEv6i5LOxYu62gpgGRI1fWZgmuiEnwKy+pog0m5sZjoRbQN
 o8tMtxZkvHdS3h5KUsa/p7DzS23yZ6FPyU4u0ya+hkxanDIaN6wQFjUGrB5ogFsGkRZwjMcWK9rVVL
 4c2U/VMSdxVz6s1vTO1waKQ+tG3fi/VRMkvszXcMofbGuOvkBtr3ffl9t9zVFZkhjaknEnYsWCY+vU
 lbgz1EwV50TtXULVzqxt3dixNV8Erf4Vgpc6PpQAjSw3HPR9dCLnxPiY79MrST0s2x9lHkxxNp/FpJ
 rzpuEfpz5ApeS3oHmoslrpuTh3ZLh05TE+uXj9hmI0pBtWAgkwhegWpjmHGHPtocAGh+XpHkYwZRaC
 9UZyDMFeqzoYTidcj7aC+O+w2zdxRw0yEtyrOah3BGzW3mwqecX3Py6Mn1Ag==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Some SoCs like SM8650 have a 4th codec LPM block, gated by its own
codec_mem3 clock, which the driver doesn't get.

Get the optional audio_cc_codec_mem3 clock with the other codec DMA clocks.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c | 4 ++++
 sound/soc/qcom/lpass.h     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index ee187eeb7392..ea8b6083529c 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1071,6 +1071,10 @@ static int of_lpass_cdc_dma_clks_parse(struct device *dev,
 	if (IS_ERR(data->codec_mem2))
 		return PTR_ERR(data->codec_mem2);
 
+	data->codec_mem3 = devm_clk_get_optional(dev, "audio_cc_codec_mem3");
+	if (IS_ERR(data->codec_mem3))
+		return PTR_ERR(data->codec_mem3);
+
 	data->va_mem0 = devm_clk_get(dev, "aon_cc_va_mem0");
 	if (IS_ERR(data->va_mem0))
 		return PTR_ERR(data->va_mem0);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 68b71039b981..4231466928d4 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -107,6 +107,7 @@ struct lpass_data {
 	struct clk *codec_mem0;
 	struct clk *codec_mem1;
 	struct clk *codec_mem2;
+	struct clk *codec_mem3;
 	struct clk *va_mem0;
 
 	/* MI2S SD lines to use for playback/capture */

-- 
2.34.1

