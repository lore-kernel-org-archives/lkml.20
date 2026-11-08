Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794141156;
	b=cIEVL0Xtxt8M9FI27KkJAyOyPgJDxmcXc5aNNVlFEzYcC2YA9THbYL10CldLNKleiFMP
	 4j4qjnDWvnbWs+bu+5blQ3ya2stVYbr8WOk9punVLN2E2+OQ8gnkt177Sk+rBM+LT2WpU
	 Und3CdZjwNaRvviOJy4wHGREpd+yEUV+mqjktbgz0m0cV1nNQur7G1Bq84LlE5Ozigs+Y
	 MQuZEQDYjaJJeH1B2WRZoZy0XJNjXCw2iMm/OUmBkaxlYsQwV9/5JgQ4zSG570l3IitqG
	 DMn32D/PoL8E+SrVoo6RP2T8PdOB6fmwtUUPlWNHhY98AydyLo53WgEU5AnE+ZW/5WA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141156;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Dsp45tZtZaqYSc++F4CsJdx9ni/qUkKDRyAOPigWEPA=;
	b=2QFdE0oxiCwWTBN9wIbcRyRF+zKsCqK+i1fT6LgCJTEx19qkvjCQJOpw9rhRSb1RaoAU
	 1VT1AOh/cALJlnPg+OypfmHhJoYJPfD4WxYrHSBCLp/6diR9OAeP2xTjOXtZPg5abV4WY
	 LY0FWNLonUusCA9XdZnR3Qqr59Blvmga/eFoodybZY9kcpoDqwfrGaHSrbbLJu8qviDRr
	 h1Paly3uCk0EQS0dGOHn32+EQzoe0MFPNvr8z2mI1NQuVJthvnLK+CSvq9zeHDA2ozqdn
	 PzFjk3ZPg+Ilxo0PNMK/okxzZmWF+eqrH8mk3y3I0bo1uZvV8XSeXKh4xHL82U9mz2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CQNtPXSn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B38606D812;
	Sun,  8 Nov 2026 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CQNtPXSn
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794141156;
	b=TWjL02lEqWRaZkKDmA4Hm/B0msDc7ilb6XxGfFA3a4HbeKvlp0nYl55uPky6gCF02UF5
	 66Pr5j4a6F0MtWy9sQkQRlB6kfq5PfdHdSXfvFSiBn4wWMrhOTALPOrtZzFw5Hqlr9OUs
	 Nl5J/AlhkVovE4MuaOGhPoZVMEcDogEraR7Ym2QOQFix1lEL+y5FmhpfLvJyA2En9uv42
	 V7KaM2TSmlNiV8ffV8vIxPDdbCIwPGiQhAiaG5GyTAz/U7RGrOxY16u+wTMnWGVLnjbIx
	 vE7lwTbDZIJD/Yq6fUMtI8W12ZiYB+JUNcNw+SJl7flKRTbWArqDdhXUnrLFCTWweRw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794141156;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Dsp45tZtZaqYSc++F4CsJdx9ni/qUkKDRyAOPigWEPA=;
	b=cqS0uTcS2fiHaRE/JnUu1Z1/QIbKBaVMEWJnljXGBIFWxDlk08spdxcJigpgmbffRl8E
	 1n52x5brtCEe6U+1GCqgmCy0MnG6a4zVV0gmkFm8pPBYEqn07g1p1FUct1l+Ry5EsO1P2
	 8iMhuoY2eFMA/CEiaRrrM25eTPJKMkeAIdsA1zegkO2aK9HgepfRzmMrlBLWstdZ/T1M9
	 nIkgOWHx7jCJ3pnOZadgBR551+GxdAzeVrJz5WbGYYFcmi8dk1pcW+kZFHNTdfAI8q3yO
	 jX5pDkA1wgDdC93bZUwb3LqInNW1ciTEhCBS7fcdea/XXa09ygwQ8IOWWztx08mOpOQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4BF31F00906;
	Sun,  8 Nov 2026 12:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794141156;
	bh=Dsp45tZtZaqYSc++F4CsJdx9ni/qUkKDRyAOPigWEPA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CQNtPXSnME3/mOrCBgRfnd/fRzdiC6KceZVakwaLYTNkuQqdcoZ1g3DA4cx6rTltj
	 iWuy3Rlt5In/dJ61CfpiVkw1YW6kGdMNyZKFL60B79pSSTik1i0H3+tgMmREhAt/Nq
	 Hk6GW4z/K/gyl47/oe7UyJ/xDNt8ZcpxowpSZjhiWbzuJVD/tB0MTQTe81IKjCWq8G
	 MGeGZ10vO4iFtdFtRJlvKgiEqbwGx0wdRFsN7Ow6MtWXySpE4Kd/1u4gF2iC4hh4m5
	 Av/JnEw2jvmVN98lOP0FZunBM0bJc61nzX2liqII99TD75QND+TkCaJftEbLOKV+G1
	 iPJ4yyb2NEwRQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C02CB47F89;
	Sun,  8 Nov 2026 12:32:32 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 08 Nov 2026 12:32:31 +0000
Subject: [PATCH v3 10/10] arm64: dts: qcom: sdm845-google-crosshatch: Add
 display panel
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
Message-Id: <20261108-crosshatch-panel-v3-10-87dd4ec4f7cc@ixit.cz>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
In-Reply-To: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
To: Dzmitry Sankouski <dsankouski@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2243; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=QFnr4Iy2wJCXJX07eMOq9LU+21ab3o9NMfZAs83u37o=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq8GvfzCKzQDlWDUrFr9huD1SqWucMmluVS6GAz
 a2Dsr/3ew+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCavBr3wAKCRBgAj/E00kg
 ch4eD/4ytefeCYqNZf8oeoLbcDiX7Zgzf6Y1sezaokg1spJHnY1ZPj2xnCFHYvqnWzMgYbOhYeP
 z5AItIq8dZUYOy/OoGjwtQoAchWCkslWuzob91KOCEHJMd+yhDVDuS4iq4nUxikZ/J1r6R9Pqhb
 lYDmaKvmuofYstmkNeqjPvMUze507RgNTxXhll+RZM7UO/KNlIq2yfVYOD+oMXqX5fiNnP31q/m
 Ay59dOqVLmv8jGjLsj5ZaEhKD4URmdf4+6/mMU7+PtxJyttjs+XXx0h9NcPxciUAgLDlD0DiER6
 Yktm/bVlbCiFMozz76HorYBHNqsCK6E+VoRZhsZYgpGAsiaAZOJKFMymfbaFREXuKpKcMfMwtSc
 dWZgKWX6DU+EPI8Momk6cSShd5pOMnCEjy2u4xFM+IEHGvbGExQC/Fg76UTPkVqJXszYX8TTt5N
 4A5JgYv6t5PiU8YCuN5L8tQBGHKW298eEumEbVXd0yCGc3s/rZ++D8W5apm+B9/R/9+0Xhm1p3b
 mIkLkGLyepA5Zbv+XvTD9B5AlxCZwrlKv/3GCv0+3UbsDREkhrCr/mHakly6Qu4ytP8S16L2opX
 XgoPkINdRbS7P1sZ/7YpopjtptO/wGLZlaCgN3Zk34PfpvXoL0vWHcjUup607G2Km6MoYFPFWJ+
 AAzjnsjRj3QO7wg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

Wire up the Samsung AMB630QY01 AMOLED panel on the Pixel 3 XL and drop
the MDSS/DISPCC disables that kept simple-framebuffer alive.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../boot/dts/qcom/sdm845-google-crosshatch.dts     | 60 +++++++++++++++++++---
 1 file changed, 52 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts b/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
index 2a81ca1d00b1b..3b788757b7303 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
@@ -10,27 +10,71 @@ / {
 };
 
 &battery {
 	charge-full-design-microamp-hours = <3480000>;
 	voltage-min-design-microvolt = <3600000>;
 	voltage-max-design-microvolt = <4400000>;
 };
 
-&dispcc {
-	/* Disable for now so simple-framebuffer continues working */
-	status = "disabled";
-};
-
 &framebuffer0 {
 	width = <1440>;
 	height = <2960>;
 	stride = <(1440 * 4)>;
 };
 
-&mdss {
-	/* Disable for now so simple-framebuffer continues working */
-	status = "disabled";
+&ibb {
+	regulator-min-microvolt = <4600000>;
+	regulator-max-microvolt = <6000000>;
+	regulator-over-current-protection;
+	regulator-pull-down;
+	regulator-soft-start;
+};
+
+&lab {
+	regulator-min-microvolt = <4600000>;
+	regulator-max-microvolt = <6000000>;
+	regulator-soft-start;
+	regulator-pull-down;
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vdda_mipi_dsi0_1p2>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e3ha8-amb630qy01";
+		reg = <0>;
+
+		vdd3-supply = <&vreg_l14a_1p8>;
+		vci-supply = <&vreg_l28a_3p0>;
+		vddpos-supply = <&lab>;
+		vddneg-supply = <&ibb>;
+
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&panel_default>;
+		pinctrl-names = "default";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+	qcom,te-source = "mdp_vsync_e";
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+
+	status = "okay";
 };
 
 &wifi {
 	qcom,calibration-variant = "Google_crosshatch";
 };

-- 
2.55.0


