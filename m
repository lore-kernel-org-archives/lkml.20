Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BDA523791
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651245; cv=none; b=OCZoRHa+RnsH6CEgTShhe64xNaDOTHDWh8HcJI4eVuIVfiDESLjxOhBcOxYtZiONMnhOhb4xlHP4n5TZ9+KHHo5TbXNk6BztKLoCNnQQdyrjuPn/gs5oqhk/qYhHtunfwv6pKowtzNw5oLXKxdLaCXXXTDcqPCtNa7MuAwwKzhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651245; c=relaxed/simple;
	bh=FAPik+JG/2BrC1c9jM1E89ISqsnWXMSNC6harZAYvvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=njEU5cMU+ijgQhVZ9Q5r6XIYb4iJsSuwZdHdgHP510JXX8ujqQ0v689g67jL8k9VWbfzuE22s2ju+V11RVTc3BRGOcjhLeTWQAS087Dclg/AGSi0KajX8EnFw29Ij8FzlxRzOjFHm17LsgzRr17ERIYvRsnzTfAeVwU3Aekjj8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dQnlcyPj; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dQnlcyPj"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c2so109259066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651240; x=1790256040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjvgXHndXQf1jr/f5HxUCFqmGXaslw13OivMhA1xxKo=;
        b=dQnlcyPjzBC+r14IYBNvz8NvELDfIQGmlRyC1c3YsmvQvQ3kktT3WYcNKuBjS9whyT
         5RDAiDcFeA+fMmoO9XnfgzltmMv+6hwPXCCOHqqbFgQjiSC0e7bdPZum6I96BUpCFMdH
         ylmFvj8RT5a4ggLQUamInFc3BPMGTMruBX4+a5oSjiI4dHXlSadR15pbtNMLl7KuBxfe
         tfur5bMTdCPNmX8f/Sj742+rUhQ9GDX3VdGdBIQwCaxjBbgvcfnuGsCqtpd4PgyY3ePq
         O4C2F9kCO/ADjgDw+f+6elFD/Zj2HHSzCcfK5S/FFebxjZDlT6XWYWB6QasftHjhUWjb
         PH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651240; x=1790256040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjvgXHndXQf1jr/f5HxUCFqmGXaslw13OivMhA1xxKo=;
        b=Xf45ilqlVuhWwFhWPcudo06imR2t9QTv87gx9aTS8AkWBSUcFCfEpAzGQnrsU+zZqN
         4yw+YGBwTBs8EuYl62WX22aiB4GunNwCCP6an6TdoH8hAv4pGBvYv2v/4l+pneHnq1SR
         XVQg/efqA6YrQQUojmlPQGgO9Zq6tYAOQTS9m52EJjcFAolQNSpuzivrrQuAG7xslnw6
         XT+yj4R9ljsyK4NSKzfEVAPWDNIrrO3Lp1JT086Unb5XSVcmZ9TxKap20EwyWs+BpxI4
         QNREaEXU0bY40jgdD2+LVUZCoffPS3iXhrA10/yveZgFxIMTN/wglT2NtePJT6sh8s3j
         fbYQ==
X-Forwarded-Encrypted: i=1; AKwUvByLCPGhLh2+/VU1YAUJMDAbmEfzTLh2s+DxbJZ5dBFwpSJ15zsfvNbjHt4LPW/CLB79staTWbRuxha2Tx0=@vger.kernel.org
X-Gm-Message-State: AFuF++m+uH7ygKSN0Ota0zdVc8ID/L8mQ8PGc2EKQIpzuK9b8aOuJgKH
	1iv0TKrsIwcVJVWYaF+ld9tZSTUv8dlX2u9G5V1UEjZ7cecoW/LlZHzS/FQmx3+In0Q=
X-Gm-Gg: AYBFou2Fo8BMpn0Um8GcTYG07m3qPX2KMCSXAcG3K2+3Ox29DDt6yznbUmPqzQHYJMc
	NPWr/OoOQ0G/35i6JQ4ogxTqaVkFT0ZE3dwhssGjwV4uZBf0tZIMXKiSQYKzpT2gd0jLwRGkcZ/
	rxV84yNED4cIHeBphk5Zssovx646zfBFgAQ2+pt2E8sbv5+o4UC5dFvFNd8xVEYGRh7xg2eZQ5A
	9ROGQMW8BktyOMpbtfI4ZQZYuDrMEYwvhh/NXNTfzdZeO7u+S/2/+ozOHiXDzjyNyQgDqomwKAV
	/J8bETZC6Bi/NB7T4W/eiiUA+iQEhU+D2qxBeMych79G7slaXvi/ECpYbW4OdCh1amoKA6DInfD
	fLatI5i3keNRXKbksfvvomc/vxMXtVny+xwSbTzMEmY4qKvn0nY6r9GxOwuBSLqoCQ6qkYVka2W
	74maaIfu5H0ntmohHzPOgWHmL5j1EgofSuNEPrxdSH2rxCciecbrXqpegpa1emGxNniDc0wKGzI
	41WCZpfhw==
X-Received: by 2002:a17:907:1c29:b0:c25:fdbc:52df with SMTP id a640c23a62f3a-c29e5244c19mr573033966b.10.1789651239938;
        Thu, 17 Sep 2026 06:20:39 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:39 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 14:20:28 +0100
Subject: [PATCH v7 03/12] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-3-1a63eb35838b@linaro.org>
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
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5077;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=FAPik+JG/2BrC1c9jM1E89ISqsnWXMSNC6harZAYvvQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+kf0iiQZLnpmfMPY3l6YR9hS4QcxgF+VMLB4
 j5YwIW5SvaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpHwAKCRAicTuzoY3I
 Olv7EACw64r23BWMr8Azu5jTIt8ugZNGz/QpRjHTxNpy6XMBjiUQcajPId+Eest69CW8Gy5UZg4
 VQbF9PlhISr8kgA9Tn4E/anqWkI7h7GfYry/SPcA4hZ+6XK5bBQ647vVLr4OchgN3rIahYEZzZ5
 iJxkYSTHysWgyYxFHrrSJdfTnJouL1QEV2IqTiTKjyBkABjbqLDkFBEUutZ30eKJjivzPR4y3C/
 5/yhvM17Bhve8GqLFeRKTabIlbtNyPjwEbW6ksp1wWJf6REAgh9+0/idf0R7uPZzkrtmsDsAHBt
 frTHpQvfDB8hOInwpF1CCLqLiBPwm0C14QsALENUJGowE2wggphiki3kmr7qLaT351O0u7nOYSt
 MHnLgh+c8U56p9vysIQojL6j2EQosHCm7Mih0Oh9ItaTZnbQaIYv92qj880k8vvXjVXBYdzkcUp
 2fwMCbNPYGzzv01TDhIcLvPteA3zefAcYTwOf1MbMkyXVK0GcM7aIls+E9lOzIgJzjvFYAzvZMx
 mHJO/bX36MS/L2+oQwTVMu4TDbE/ZWCNeR4s2oTgl6F4djGYxMkphldgDuej6TTcLH3Xc6vQbwy
 MivYJ6rbS/glHqLevAUzQs6I3jgzyXHk5svkQp819jVoLNMFKZhJlyKyP+a2A1V2JWt0P6or4lz
 qEfPnGmBRFNjf7A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add in two CCI buses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 150 ++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 8a96ea1bdb9c4..8ac3392b2d747 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5510,6 +5510,84 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;
@@ -6107,6 +6185,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			edp0_hpd_default: edp0-hpd-default-state {
 				pins = "gpio119";
 				function = "edp0_hot";

-- 
2.55.0

