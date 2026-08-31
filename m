Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2B324293C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167613; cv=none; b=MjiIfNrm6RzlEZSqDemz8zMi79ly2RHJMhuLWbO+JPzfxDYyOJ/MFtwlvW1NN5Fqt7JXrMdq/y/NnuCtsDUv1LrcJtAAdjm6NWSNzSdcda2jLTLhrvQg9KzZOqMs3K0ckfmGml1nBcUaRmOG90bUSC0qelX9k6AEoFLYuy6mINc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167613; c=relaxed/simple;
	bh=OOFqx41LFykjkz9aRH9vMHMhx2n6MP96nNu+O65Rj1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MazZQVigiU+Wb7xl5cPonKYSFQGdd8KD7llAdtzj5VsvFhlgQARE+mCYMddPzM+IBGz40PRcZnfqlT7hwBcwysy9ij+oItqKCer7Kk6OTQOmvo16Uqv2/DpEI4eRAdBmbNrvcs5s9zFVjpQVUSNbv2o7GnTck6eq+a14sYzdkx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2PMA9MT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2PMA9MT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49954b88fffso21884205e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788167609; x=1788772409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQlgalu3K21qahFCjl25bBlnBHFG5PlKPdFKLnjYA+o=;
        b=C2PMA9MTMgn6bf1eTfPtuwlYDnCOYydQnO9Lk3jmx62n8pRam7cwLQijwCvHIbSC8z
         zcHfWnrBsUvN2lKQb21aFZgPJUWFLxH9U7E/Gw1zXzbg2keeRmVxVp3Oc+SSP6o9tofj
         IiK/X0BayxaS8U2bA/EDsw7MJtX1NX3EyEv4e8hJuXLvWAtQ3ketWt5lbeCntmkwA7L5
         EXgOH4pNf+rXoxmqS6DVIJM+nl0ZoQSzQ+G/4U/StqVmJqzAcFfieGEdg6ftA80mtOW2
         co3BQVAYc99TRmgwMxkrrz17n/c7Cc1nLJWjKoQLXLrZfOF/aOUqRFniY+rFJY5njMnQ
         LW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167609; x=1788772409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQlgalu3K21qahFCjl25bBlnBHFG5PlKPdFKLnjYA+o=;
        b=MxEmatnIZtoyCVXMnEF2sPbQP24LCMBW7oHIRt0C28+3kGnuMggdEosNTV6b+0AeoF
         kulbTzcoNcR07xihQiaF6N4RMp1hP2LWObYxwmDNmQvcvflraDpw0QgOWG/vbcey9mbZ
         EQ0AXULG5t5+jSRRTSdaxiRgRK0xrJHm7g1rRKWOyVOOkyWVWlyNxTpmJDKVrZeg6WEh
         DBNeKbL83nxUZwmbsc3RYx5LTMSrKKPwLB+FsyUzkj2qJA2qgUy8rRjbe1DVr5pH5wzv
         lA78yLrgDFlkBGJnaC/yU+osD8IMILGLrYBYD1/xhqAuUCZhjNuzZdclTYAKn+VBvJqx
         RqEA==
X-Forwarded-Encrypted: i=1; AHgh+Rpc7nHoYAepL5y6u4iTC68M6eqvHrYmPopV4UGIlr1jkRBqnoABF6Nl3o66zm2NVvx1vvzuyZj7fr1WL+c=@vger.kernel.org
X-Gm-Message-State: AFuF++kjS5wwxV960h1+ouzFhdozDIXL3D2OjgaIRqm/nEBfUBvA8/68
	V+KI98SUTZ7So7uUyoWoIRFvcVMrlqFkjyE4gRBFqNN3pefXsSCRL52nx8kX8WD7ur4=
X-Gm-Gg: AR+sD107VhHNwtBeSQmoxa6Qs0q0ZnUs5WOubw+cNWA1SX+Wyyf9zJQkznqdxEQ2TPM
	qsKtChEvqRRQtvqZrzSBgalALluD1QyiRJ3XkjNerYjzyyI2x+JOFRyTF7I5nzo+GNS5Qgp7Fg8
	SXlVBOytOMmshU2OhKawTS6Oyve+akY8HuVgVhozyGug36Si7iKte2AZQ8+vbo9bCptIHoH83+9
	cK/htwwk3GN6ipTR10GSb8qKsvGBvWv0VK3KjUkP2pA8xGp9yjLH+vy+fpsJws5zcEz3JF099JN
	PHkLUPEO+qDP0kiJEDx3nDd4FTG/YlXPhegn9eFMXAPMN+yKqRo25RK4dmlmxrkamZd4tTmnTUv
	e8bWB0BpaQ30R0JRLktyykos9EyOXRHAHtgffWC1iI4ijX512+vsFR2p9fepTrrvzXDKM0PYw9l
	M3pGQBfGrVjKQVqgag4qDyHSSZmQVrRAQd5YQTVULVJlNw3rY256AuZO5517qwrcsffrpxG9qnq
	4QR2NsD2w==
X-Received: by 2002:a05:600c:4443:b0:499:d63b:a6da with SMTP id 5b1f17b1804b1-49b91c17149mr352899225e9.2.1788167609082;
        Mon, 31 Aug 2026 02:13:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1007:7be3:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4dfdf00csm320935205e9.14.2026.08.31.02.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:13:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 31 Aug 2026 11:13:21 +0200
Subject: [PATCH v4 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-topic-sm8x50-next-hdk-i2s-v4-3-a224aa073f9d@linaro.org>
References: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
In-Reply-To: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3230;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OOFqx41LFykjkz9aRH9vMHMhx2n6MP96nNu+O65Rj1c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqlUWy6m9k7bxgLBxjY7qURybSWkjLhwaevj/2ifCD
 2mT7zYWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCapVFsgAKCRB33NvayMhJ0XXOD/
 4zIdmCa+Mmb6Sz5GpUCtRZBmGMgfJblC+STDAMk2ecMvWg3Ttpu/Rc8uGPG0QbZSatLkmVKKWWPyF9
 MlV4XQNeBhhCu4FbDUI8px8NL2rdhVFXEqIwWhaTLorG3SMLOzo9t/Gg8B1vZxdxZEzCWtgWlFX3Xl
 YhIITP5ihAYEYXcpi9/4qImByx1Kwg1BCYQ11BnwWykcgifnj1JjkgwCRSTXpO4vYlLlpsYOj+C0qs
 2Xt6MMQ3XPTIYlKLw0eMH9JooDbIMNA4uQ8LF206y5B3M1bW8hVxmX+mURjwXMq0mAZY54VYdWm60+
 +t/52S46ubVtZ6CqHRA2fjDDRzQuVSKNnPGcgD7HSV7QMZm+Hsdr4HrVwK42dUEMYOlHpPRUOx8NXS
 Sz6LZ6qn9avDOEnLPqzlxuWs413YQz8M9wEIdpj0c64J/G4dqyxBpI9DDcj5xq+tZf/GkFHDh/Ox/j
 DC3JmA1OUwEirRXcFWg3wsYGwO1IvtF/8v58q4g1/E/pvFvmpWCjYKv8AByEOe1ZbREcloxlGFWXdM
 AJcKLjqspnMwBTd+qwHaRztfHKtskOgCgsBqxvp8BQIhHN5vRO01KsaSLf59BGlyvEJk7TBzC1+50N
 OZsUFdMVXZcU9fzacx+8TE4r07hveCby4JdLxYqadhL4+BcSWmnL5jjijEbQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 35 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 41d0c7edc433..eb47a75a94bd 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -218,6 +218,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		pri-mi2s-dai-link {
+			link-name = "HDMI Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			codec {
+				sound-dai = <&lt9611_codec 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	thermal-zones {
@@ -939,6 +955,7 @@ &i2c6 {
 	lt9611_codec: hdmi-bridge@2b {
 		compatible = "lontium,lt9611uxc";
 		reg = <0x2b>;
+		#sound-dai-cells = <1>;
 
 		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
 
@@ -947,7 +964,10 @@ lt9611_codec: hdmi-bridge@2b {
 		vdd-supply = <&lt9611_1v2>;
 		vcc-supply = <&lt9611_3v3>;
 
-		pinctrl-0 = <&lt9611_irq_pin>, <&lt9611_rst_pin>;
+		pinctrl-0 = <&lt9611_irq_pin>,
+			    <&lt9611_rst_pin>,
+			    <&i2s0_default_state>,
+			    <&audio_mclk0_default_state>;
 		pinctrl-names = "default";
 
 		ports {
@@ -1348,6 +1368,19 @@ &pon_resin {
 	status = "okay";
 };
 
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@10 {
+		reg = <PRIMARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk",
+			      "mclk";
+	};
+};
+
 &qup_i2c3_data_clk {
 	/* Use internal I2C pull-up */
 	bias-pull-up = <2200>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..4a7b934e15ff 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6609,6 +6609,46 @@ wake-pins {
 				};
 			};
 
+			audio_mclk0_default_state: audio-mclk0-default-state {
+				pins = "gpio125";
+				function = "audio_ext_mclk0";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s0_default_state: i2s0-default-state {
+				sck-pins {
+					pins = "gpio126";
+					function = "i2s0_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio127";
+					function = "i2s0_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data1-pins {
+					pins = "gpio128";
+					function = "i2s0_data1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio129";
+					function = "i2s0_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1

