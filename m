Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595143;
	b=ilCkvAh73i6/9Ko5Yr2TGEvKdk4WMU0esr2oiRnQ+pDAn34j9216IwtbMxmH/qvA/awn
	 r8jSlP3mv42uijHUH0hXsGyrSjLkwHwvOxyFwHIKrSvH5g2A4KIlerZuTxQzBHbRMeSEu
	 BnbfCxxT4HjORxPCt0viNj5MhsVc/b9iPpRsljO1wVGpLE/3OUHh+U5ShnjHMcTXAEyfl
	 29adqXuluxZEt9vg2yX4CVytEoOmUDyOuWet9ADI1LGTQ3torX/hJbkQrpVlR7WFnPSAP
	 La1QgvTb/Kkt8j6bstbR30Yh666M4uWqrOKds4b3NIBJArwMKQUis4LInWrNrtQfIjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ojl/cw/dowOK0qKRCZeiKJaRwVJ1sk02/jN+oDFnW/0=;
	b=qZt5yzzGKEo0V5iFD7rtzEcjSm0w0/pKvgNY0TsSlvmOOu3cGPRatqpmUlJs4qXPx5k4
	 rpGARxtlL2jpbu+zWFrXi57QpKAIRvbrYCV1Jh1M6EkcduSxibDiTVnOs+Xu64Gu2fSyg
	 9SnO3qH1LdRBEGEYSeT5lNC70EQiYeIpzr6/frfGJuSDRcmYk5Xeq4WDfkwOwZbrpYxwL
	 3BVbzRY2T9tkXPQC27WTMFOWkU7DCGatnnmgf0IrHzt2eDZqVng6aPWjB4yn7wuYFl7Ga
	 2ByWbxzceDQi8nsE0vSzOAokwRlcmnWRafXTJfKL7IKeUx8kIYwzZXcVjWwkx6MapPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jr6uG1Gz;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C18A606A880
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C18A606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jr6uG1Gz
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e10a70540so638931f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595141; x=1795199941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojl/cw/dowOK0qKRCZeiKJaRwVJ1sk02/jN+oDFnW/0=;
        b=Jr6uG1GzcRu4KzDsGdEZkaUqHJrojddpRKzQKqqqcRDH8z8WDuwCbyjlx54CwpdO5x
         CcAbOeD6FxIss83KsHnZ4br5/qOFC3mMt0WDi545jYfygY3KFnbNf0jBhgPogS1eVSD9
         bawaTwxh7boTpxh0FqP8JjUuts1rWfHRY53LFnUNhJIPdfKkuWFQfPqeXvpSYc61hRLw
         d4lNOh8jZA41YYhXsYRgS/+0GnHZmmstDIvL63TOEisSXkZccqr6t/ZsXmg+QAwKF6Yo
         Ejqq0RxnxtdSZ+JNHuQkDLTbvhFonCb24leoknssa8gvRADCQL+EjHWg+3Usn2uN9W0J
         nAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595141; x=1795199941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojl/cw/dowOK0qKRCZeiKJaRwVJ1sk02/jN+oDFnW/0=;
        b=wzctDDVwvDR4Vihffx3WcLeSJVKdMrkdyLl4lMAwLvcSXjLaYrgdJn8artDwtjuDVk
         MLuLKIr5vPJPuOifvQGiLWKHKedk324gY18veAH9tVFBPRRaVcwmA+3k7gARVUpGDF6f
         2XltZ3va7cj+LW2vEPdvBeIKspeTf5zfH15drbx7azJiAak1+NKSQxzbOUSQusk57upE
         Bt7yarKA54eJU56iiwsJ8J2TTg3OTZuDo0VHym2dwsUfgb0OU9Q1iEGC0n2vDJc9+Y3G
         slhj0/Vc5g/AJuki06aHdBrhtkT7ThfoHD9O2IK5Sdy1q0OE0EaKFZc8CETNTcYenQMn
         Wf2g==
X-Forwarded-Encrypted: i=1; AL+hErEpff3BF2RNtRSnndE1zVmk5TO98JImwQmtulQX68SVjCLHUosdsCE06FwCFpWt0SGs/4VCx7NrftOShZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T+134/x6Eg+cVhKIGSy2eac0sHhVKM/9B61pbeBoRhbllcDb8
	AIHP7bfCWbihhAKU2Fw69jlKYqgmL9+GTyOJOhH/f1kPb9Hn2OgCwui31hXT8akfV6M=
X-Gm-Gg: AYBFou23b7p8tq7KqTG7pwVt7Psv3+WLGAwiBIOUb0obfhaOAqLtZAvQjdiEn+adwor
	1L64aTzzvyLFUkEvfJ88woR6pMQzXL4jo4VSb5J6ExANukSFlUs1O0WzPz5JETRRoo2y4vSBFVW
	zIYsEn2jOtfL1J1R2WZuqtEUvB6e96IXNi6A0NNSPkN9bFinu0zofnoceRy0PnJGVGC1pZNAq/k
	D4NG2IxjTubBKO2UlWAjXjaBiWWdLEaq2LRfVV1kVjFYn2/KI//CqHDRZeAnVJ61Pnf9VyoyURl
	lFRSbbIN8YPT0z8b/YEih/hKr4byywaJpAgWC6hQ+IKBLQ2ECRfFmqhP58OPNc2U3cbYPclfV4v
	NrWykQSkg5cG7HDEnn62/rbC2grebzGudLJy1phlb9o5OgivmMRMAlGyC0KrG8crM1zU+zasfm7
	UmQEEc3Q9dmuiu+F5kgS3a0sNhXJSTxo9RpJeBnzjYh6sx9qRYEItC9PsEY1DKceCvOqat7UkSU
	bpN7P1eEr8eQ3ig2sDtV5VrgZaHUfcxw54H8mTW/AMzmeP/VwQFlCWBZN2tINDzdpOpwtf5ULRD
	AjL3GoiSzwCJ6cBW1nk6T5IutzmJfgSvOYXkNJoqgqk=
X-Received: by 2002:a05:6000:22c2:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-49c741b1331mr8478786f8f.43.1794595140541;
        Fri, 13 Nov 2026 10:39:00 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:39:00 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:35 +0100
Subject: [PATCH RFC 21/23] arm64: dts: qcom: add SM8650 LPASS CPU dtsi
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
Message-Id: <20261113-topic-sm8650-el2-v1-21-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7934;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=3kjZaVqJSyCEesNU0H/+AmXUsTyHtkf+decNnu3GiPE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91korEVY0HK0b6kmL+fpgIqlGWV1Dj1bLChkSm1b
 u5jdI0GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZKAAKCRB33NvayMhJ0XG+D/
 46gGGSC/jvBNh4B0Ilk03vkLY2x33GvoF/4pfSnRaCXyJqomwfMdK2ORERCZ9qYR3oIfqOPACfl2EN
 /0XZpvmcDt+bQYr+uAFtGal8rZ4h1cg7Ogpu1I2r0ZJI+vRXhvT/IeObzFdQy4GJAdTk7aDpdasRqW
 EaLypIl7jVJqZBDSw5Xz1M9cLqvk05yhwdkoPAGTdqSTFqtlKE3DJqh2vA1xamutL6ebGN6tZbzrQX
 QJt/TeYBU8pmO5BxHHO6JexIFicIFdbCP3hgIFlkblo/liu+D9PgLdHi3EJcNpr165nj6D5StP5uGY
 rU/ZgmLXSm5NTcehoXXhB+0z59wobSZ4V3MOIeRLj7JUPPE+c8q0nUmbeh7AqJQkbOb9T5lujxExOU
 yfJxWNuEVmejkBtQvCQULPNlqzq2hzRwZVUWmOjn/+n3PJzKVMerD2vdc4GnbR5cSRyCgOc5U7QPPc
 kYZdifbIipBU7BQ5I3zL7IZLbWmkjHionXhhMPePFrTTaFcZ9OZdvCMGyXD7Zf+IkfKHUtkdIXFfPT
 b1NnNNpjF+9tcossNXvUVPdjXIAFJbtWVqYTvu/yI05BcEFg/Fpnl6wAWMoTVS0cdk9mdfIv+CwRGj
 9w8jMVOYfn++noWxHj4h69oq8oJ8sbjLdtdMxY3239zSiooQLnOrdEtg/3NQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Boards booting at EL2 without the ADSP audio firmware need the LPASS clock
controllers and lpass-cpu nodes to drive audio directly.

Add sm8650-lpass-cpu.dtsi with these nodes and the LPASS macros clocks,
and the I2S2 pinctrl state.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi | 222 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi           |  25 +++
 2 files changed, 247 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi b/arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi
new file mode 100644
index 000000000000..43d0d8daa4fe
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Linaro Limited
+ */
+
+#include <dt-bindings/clock/qcom,lpasscorecc-sm8650.h>
+#include <dt-bindings/clock/qcom,lpassaudiocc-sm8650.h>
+#include <dt-bindings/sound/qcom,lpass.h>
+
+&lpass_rxmacro {
+	clocks = <&lpass_audiocc LPASS_AUDIO_CC_RX_MCLK_CLK>,
+		 <&lpass_audiocc LPASS_AUDIO_CC_TX_MCLK_RX_CLK>,
+		 <&lpass_vamacro>;
+	clock-names = "mclk",
+		      "macro",
+		      "fsgen";
+
+	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+};
+
+&lpass_tlmm {
+	clocks = <&lpass_core LPASS_CORE_CC_CORE_CLK>;
+	clock-names = "core";
+
+	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "core",
+			     "audio";
+
+	status = "okay";
+};
+
+&lpass_txmacro {
+	clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
+		 <&lpass_vamacro>;
+	clock-names = "mclk",
+		      "fsgen";
+
+	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+};
+
+&lpass_vamacro {
+	clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>;
+	clock-names = "mclk";
+
+	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+};
+
+&lpass_wsa2macro {
+	clocks = <&lpass_audiocc LPASS_AUDIO_CC_WSA2_MCLK_CLK>,
+		 <&lpass_audiocc LPASS_AUDIO_CC_TX_MCLK_WSA2_CLK>,
+		 <&lpass_vamacro>;
+	clock-names = "mclk",
+		      "macro",
+		      "fsgen";
+
+	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+};
+
+&lpass_wsamacro {
+	clocks = <&lpass_audiocc LPASS_AUDIO_CC_WSA_MCLK_CLK>,
+		 <&lpass_audiocc LPASS_AUDIO_CC_TX_MCLK_WSA_CLK>,
+		 <&lpass_vamacro>;
+	clock-names = "mclk",
+		      "macro",
+		      "fsgen";
+
+	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+};
+
+&soc {
+	lpass_audiocc: clock-controller@6bc0000 {
+		reg = <0 0x06bc0000 0 0x38000>;
+		compatible = "qcom,sm8650-lpassaudiocc";
+
+		clocks = <&bi_tcxo_div2>,
+			 <&lpass_aon LPASS_AON_CC_MAIN_RCG_CLK_SRC>;
+		clock-names = "bi_tcxo",
+			      "iface";
+
+		power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+
+		#clock-cells = <1>;
+	};
+
+	lpass_aon: clock-controller@6e00000 {
+		reg = <0 0x06e00000 0 0x30000>;
+		compatible = "qcom,sm8650-lpassaoncc";
+
+		clocks = <&bi_tcxo_div2>,
+			 <&lpass_core LPASS_CORE_CC_CORE_CLK>;
+		clock-names = "bi_tcxo",
+			      "iface";
+
+		#clock-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	lpass_core: clock-controller@7b00000 {
+		compatible = "qcom,sm8650-lpasscorecc";
+		reg = <0 0x07b00000 0 0x58000>;
+
+		clocks = <&bi_tcxo_div2>;
+		clock-names = "bi_tcxo";
+
+		power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>;
+
+		#clock-cells = <1>;
+	};
+
+	lpass_hm: clock-controller@7e00000 {
+		compatible = "qcom,sm8650-lpasshm";
+		reg = <0 0x07e00000 0 0xa000>;
+
+		clocks = <&bi_tcxo_div2>;
+		clock-names = "bi_tcxo";
+
+		power-domains = <&rpmhpd RPMHPD_LCX>;
+
+		required-opps = <&rpmhpd_opp_nom>;
+
+		#clock-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	lpass_cpu: audio@7b87000 {
+		compatible = "qcom,sm8650-lpass-cpu";
+
+		reg = <0 0x07b87000 0 0x68000>,
+		      <0 0x07d00000 0 0x2b000>,
+		      <0 0x06c80000 0 0x10000>,
+		      <0 0x06b40000 0 0x2b000>,
+		      <0 0x06d00000 0 0x2b000>,
+		      <0 0x06d40000 0 0x3000>,
+		      <0 0x06b80000 0 0x2b000>,
+		      <0 0x06a40000 0 0x2b000>;
+		reg-names = "lpass-hdmiif",
+			    "lpass-lpaif",
+			    "lpass-rxtx-cdc-dma-lpm",
+			    "lpass-rxtx-lpaif",
+			    "lpass-va-lpaif",
+			    "lpass-va-cdc-dma-lpm",
+			    "lpass-wsa-lpaif",
+			    "lpass-aud-lpaif";
+
+		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "lpass-irq-lpaif",
+				  "lpass-irq-hdmi",
+				  "lpass-irq-vaif",
+				  "lpass-irq-rxtxif",
+				  "lpass-irq-wsaif",
+				  "lpass-irq-audif";
+
+		clocks = <&lpass_aon LPASS_AON_CC_AUDIO_HM_H_CLK>,
+			 <&lpass_core LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK>,
+			 <&lpass_core LPASS_CORE_CC_EXT_MCLK0_CLK>,
+			 <&lpass_core LPASS_CORE_CC_EXT_IF0_IBIT_CLK>,
+			 <&lpass_core LPASS_CORE_CC_EXT_IF1_IBIT_CLK>,
+			 <&lpass_aon LPASS_AON_CC_EXT_IF1_IBIT_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_EXT_IF1_IBIT_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_EXT_IF2_IBIT_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_EXT_IF4_IBIT_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_EXT_IF5_IBIT_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM0_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM2_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM3_CLK>,
+			 <&lpass_aon LPASS_AON_CC_VA_MEM0_CLK>;
+		clock-names = "aon_cc_audio_hm_h",
+			      "core_cc_sysnoc_mport_core",
+			      "core_cc_ext_mclk0",
+			      "core_cc_ext_if0_ibit",
+			      "core_cc_ext_if1_ibit",
+			      "aon_cc_ext_if1_ibit",
+			      "audio_cc_ext_if1_ibit",
+			      "audio_cc_ext_if2_ibit",
+			      "audio_cc_ext_if4_ibit",
+			      "audio_cc_ext_if5_ibit",
+			      "audio_cc_codec_mem",
+			      "audio_cc_codec_mem0",
+			      "audio_cc_codec_mem1",
+			      "audio_cc_codec_mem2",
+			      "audio_cc_codec_mem3",
+			      "aon_cc_va_mem0";
+
+		iommus = <&apps_smmu 0x1100 0>,
+			 <&apps_smmu 0x1101 0>,
+			 <&apps_smmu 0x1102 0>;
+
+		power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+
+		dma-coherent;
+
+		#sound-dai-cells = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+	};
+};
+
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index d88acdb8c775..298e4ca33b4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4427,6 +4427,31 @@ data-pins {
 					bias-bus-hold;
 				};
 			};
+
+			i2s2_active: i2s2-active-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio15", "gpio16";
+					function = "i2s2_data";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
 		};
 
 		lpass_lpiaon_noc: interconnect@7400000 {

-- 
2.34.1

