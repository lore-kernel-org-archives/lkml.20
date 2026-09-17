Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E797C52B1FD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651257; cv=none; b=qb0+AAXVkS91tEtA9+mCzFa/ODe4cYL6GcK7+bSSgtd2MRVvr05SrkTJMgOYbW0ZzNKdhh3Ey0GFAXRzGN/IhdeRyrtnptHxk3VWuZnM+b7RilsJ25hIjSHt0AdxIeH8fQoGU8tjLc3ke4dv4OdLJ0j5QaAQb5PkzweukgQYWd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651257; c=relaxed/simple;
	bh=70lCV7aTKAEmk7BYKKbjp3/KbsvVE1nYMbwzugwfd34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WVTdHYcaTLuLW/Zwn/cSlBQBFKh3d33N6qReveC2yImiw8U2u1DPsNUqztRAC5bOKPkJxRRzOnCv32GqzJH3IC3TCnxgFgqWXuui0fQX6/FusdccLzV9E57IjIrO0evt3W1FBmf1V4Tt7YkFLI4tCKr4Ls8wszZxgbqZXXbz9qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PpDwLP3m; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PpDwLP3m"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b20so140100666b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651250; x=1790256050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XssltycjfsprsPIsIQDP9H2wAVJCUeZ+wzl7YEuV+nM=;
        b=PpDwLP3mvCUXLYqhGB1hDdvhQSLbQ5yyVKnc/hiKG0kcwpsKLZfnbs3PCqFKOULo+Y
         G/4+P2Rj1b7zpLg1lHnA1CiuLQ/n8xNTevncOR9SpD/kkX+CoCz8/QTu8nu+xF8R9tQj
         olE5dU7FKnpZS6KcwxZilmESJaXh8ISq16bO+giGb7nFq5ZCm8o6B8whuniaqfUrdHMY
         l8q3YYtrbHrC4x6K614vpBiClC2YE49jXLxPA0pZsZZNu8UGKCJNdukTcwGy+AULMB1C
         4+KYm/XS93w/CDhJKQ4cPgJ6CQWpP+so7ncfuKkqU6PcDgoOljMf570EPBJ6sUEdOU2y
         EVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651250; x=1790256050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XssltycjfsprsPIsIQDP9H2wAVJCUeZ+wzl7YEuV+nM=;
        b=BkQ/B4Uvy7ox5k3VFz+j4buB+UDVaPYI8Jc7QcviL991PmxA6GFjaZ2CRPhihalyRS
         03sCoW8I2WLnToKYvEY9HJePa+qqIvQT4SOf3Eh4xh2/yyxeoFFmueaGryYszCom6FRV
         LcstyEX2RO5Nl1V/VFpxoniN6OHMmfTTXEbhn5XJbwS3dqNDMV/Iq2CTWoef5M2m7z0A
         MkIClJ/WGNf6YpO+SWBtie4SIfVwHwHBmA1MOPpNx2Ar40neE7ksJ8DUmvaqGJwwD+QG
         OI+axycQdsg+8u0bR0g25mSwDqNwYGODoowDPiU2R0H+fWqns/pAP2HcZGvZKJ5s3ZiY
         l7uA==
X-Forwarded-Encrypted: i=1; AKwUvBxFObuCKSN8RXXZ1UUE+AbYw74wWAhaa79mB4QFMxYkUn3bjBg0U5FRT1hml5WXIXfCX688IPiHB2O5DQY=@vger.kernel.org
X-Gm-Message-State: AFuF++k+bx4OCEQuYD3mCKpayfo3ihvD+EEyu6VCHKPGtYQrMaFKvdKH
	8zkqbDDmxRV/1RhUkRUw99dqyJjWTBXoysrZOvl4Rjdw3gYt4VNBylyKeNdw2oKdCW0=
X-Gm-Gg: AYBFou3J2BrjcOM1XFx6eHesmWk/2etNUsEvGbAVYPlkCAd9kvzXBDuVY2esrrQXEp4
	uHr77fj4Nilj4tP5StEr+J3wpIxsRiAhw7qW0o5gxpgPWJQ23NPtOd3weJZLIsVBcWfhn9ZDuf9
	R+wAYXaYbLs5yHm5KskiRAPdKdBHg2P1DKvhond8PwxkUmTs5tzqiZfIOpO9mtyBs/Vwn4E70zU
	8Z2HkFIkuLbVBY3E5kUdYmpjcs63x8I69+hi/LN51pYfp7Hb12GHb1Z8I4zG7TA1pOVBom29kK0
	0ae8Cs2foj/mG6+7z3PQkFAQzOzfGXC3sUZNtGWKjJTGUwqnALKNkadrmiDKel4MdQicLgv82tb
	T03U+odRq601LmEDJ34eezUbOWSbds0cbIY5OsJTgZrkRxTRqWseL9LUAchFxvHr1myS/inG8Pd
	EaDmjjTbIamNZdqnOC5NSE3BDXSZ+Kk9A9GEMnScuDKGJz1Zq93F5opVD3Ky2vAhygPtbNFoa8K
	ZkWiUsL/w==
X-Received: by 2002:a17:907:960c:b0:c29:f5d8:9c72 with SMTP id a640c23a62f3a-c29f5d89db1mr244741566b.33.1789651249934;
        Thu, 17 Sep 2026 06:20:49 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:49 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 14:20:36 +0100
Subject: [PATCH v7 11/12] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-11-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2757;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=70lCV7aTKAEmk7BYKKbjp3/KbsvVE1nYMbwzugwfd34=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+kiO6CJN3863Nlg19kRRhV/ggyKjRYPG865J
 syHn5ZAKoSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpIgAKCRAicTuzoY3I
 OgvlD/44d42FYNEIqXcqD10ArujSf7E6okPoOZ54Di5o8txEOJFMoEwf4YKnRLcp0BAKcjSxTrI
 RH9o9AIRMJ66drBpi/ECipmZUTU0mu+X8bKFWj9YmjBIwekSxicrum8Z8MN0CMEw08ivmmZfZqu
 68BuzbFdMaMViC1EUOz5TSsTIKcWToVEhFzOg4ugydt1XxpwgVLTpLa75PJxw46cQjJP1+VmwvG
 EB/qhFikrNUM526cFsqLvxnyd4+7Rs98MtbVBRRgs3e7Lhvzz6NKq+VIpfCp0bwrKXHm1PE9TPm
 pBUNGGC6gzMieDhOC7vP4lSEO9Qmmq8UFVB9ZjcwLL3PcjjwPD88Urv/1p2MPet/RcAh6KGZYnM
 562IPb2s4wx1+by4smGZiUOIpoT++WJEj/3hQNxwyRTNyG8LMOnvQWj1CRP77aDjJgSBvT0gjt2
 WoWievfheQhNv+UdZw1NJGJ96Gc0wY+bxCB1phtuwmlnilG9NrNCOB8saPado/KiOxckdcJA2vv
 ZfemYz+hSASQO1KkeLDDHr1lNLL1AhhDl55UnAZLeTrWhtUoB0gXJ+Sm/ruFrt1TiwDebPl1yo7
 DNK8ARK5k1IsbZMbKhXLAPn7zIF2G+oobkaUw6CZCTWL05HZHvaSZR4Em4ZOQQFjeHmbYby91x/
 maLIa6LX+XvIxFQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add in the RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 79e1c47bec855..1a63965a20684 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -7,6 +7,8 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa.dtsi"
@@ -863,6 +865,71 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
 };
 
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy4_in_port {
+	camss_csiphy4_inep: endpoint {
+		data-lanes = <1 2>;
+		remote-endpoint = <&csiphy4_out_ep>;
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov02c10";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <MEDIA_ORIENTATION_FRONT>;
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l1m_1p2>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p9-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+};
+
+&csiphy4_in_port {
+	csiphy4_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		data-lanes = <1 2>;
+		remote-endpoint = <&ov02c10_ep>;
+	};
+};
+
+&csiphy4_out_port {
+	csiphy4_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy4_inep>;
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1410,6 +1477,22 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.55.0

