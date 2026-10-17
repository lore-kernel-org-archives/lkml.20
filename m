Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533A73C9895
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259554; cv=none; b=oNIVREuCtSBmKbuwLe+G4xPT+W3OF6eGyXQ3blI3BMk59xPgkpYEdWfJ894gf8clyqOTNE7ncuD9k54oHpwtwjxhPXknut8zynA1uttgoyY+sg2b3MpxnvWXd4ZxuuL3pohW+S8uWBHfsthnwLSNcH9iK6ES8BSRkGT5qjDhTRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259554; c=relaxed/simple;
	bh=/MXkxzMgXZS7Xg8ZQdwRCV2X8M23mZIrEcttHXF0jmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OlXT9Fye49w08vg+uuvPdhY5gjZ8aWd+P4vW/cSgjQhzdiRPvWGBWxTJDJ1mxyuDPUQiW1ELU3+bTVGh2+3S0/k3RV1jNsZoERAyidXar5MSOP6Jyu4rmHaMvdbHyoW9T1N3XFEkyU4A+p77D+idDJDZKA5OYW45+pY1ZMKxLp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJyfVYny; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJyfVYny"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so10395915e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792259551; x=1792864351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0P2zCxKCOBoWhr8KYHU/t0ggH/tWLmugYEQRfJLO4Ks=;
        b=LJyfVYnyQ4X08e//1UyyaLa7N9DhRGSljbu6OTLypUdvtMTYyYpUjGtLL2nUyDT1TD
         3zLTF9hKmIeQ5ycfm3rOmUf4Vlap6sVzh8nLOFjCzoMpAOes3q+dAX3mF7hS7qzqJDSr
         YSPkAKyakSGOCnNRlWaW8TnvykluvwQyTrvG6mL6sWO7Uc5ZGDVtXAYG2vVX6Fe8dkN3
         K5xZyGtUghQNp/7y4aDK3XtXoE7XA+wpybwbOsa5NpOYWpImnI6KxRwI0MQDCQzlmWZR
         7RuJ3ill7WrTUCDwbK3av8cl7D1uNx8NhkbiDcfKAVqhl/g8LPfDivk+lpleQ7CWw4pl
         Vexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792259551; x=1792864351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0P2zCxKCOBoWhr8KYHU/t0ggH/tWLmugYEQRfJLO4Ks=;
        b=UUOW2gtnnxmeLp91aFPPNxG9+3bsNhN3sLiVqb0KZ4CMZuc8j66gOhAOnP8pRODdv6
         264nFe3JLh8Y6p+4Rcekrb4xKNglcvQk7+PrkprYLodrqPYbMPhgEZQR6EQHvbeicXBU
         B7F1b20XdkIiBayuir2EvBy+fZ2qBfWPq0+rIupEujyIN58d4bMxJfBnSfJD3xCTYjBf
         18c3PLeNC2pofE15hp/CyBASGH8b0ZKAGY60ltQL8ckw/0K9V6h151k+Riq6ywuJ5Hbz
         2R1KFVrkQujqkQrWBiWmzVeKM053+DYvPWvUMRTZx/whpYgyfRCzGt6nkvXcFL4xe8IU
         j/xw==
X-Forwarded-Encrypted: i=1; AKwUvBwP1AarXgSLTnHqvTcD/f+caJWSb+q98bEw2T5kemKD6mifOt2tBkhxWVtdsoC1v/7vvfTtP+SApcyAuGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHMY3UktiE2t8DaVEv/26Oildo3GGowjDE01PSsEy3O+Rm0Q6n
	Bb0nhkkX2OvbBHdzx/ehFgd2XalpBn/jfQts2Wfiv+IaLSUoQMjKKLC4
X-Gm-Gg: AYBFou2ice6wyKdYAFzAD3IHnJHPYcM4GR/fz+OoqsrGDT9C2c/XNUfanau0ocuohHW
	MmYdy5UttfIV20ssPzfGycv9EddR1Z6SKb5iGf5i3LRqtsONI2z2mThJtfgOn2a0kAL2Xx6qIzl
	6IqX8hSXJEIIz1k684VURamFQVkla5tQ0ao2iv2SLXXc6ZB4mW2agBIl+oiTd0wdcA5EFMeaqGJ
	F+PYK66cUyQPnRrY1GN5zL8lkR7AkG9fAkshUymVXHnyadsarn8w7CBu3aX+a7aoluJWrIUsDIq
	wwofSE+fpGqSkagFNS5uEV42mkc0GOKkXYlCmqywZZlcOrX35CJpr5R1h2PPXbVyds2lySuNzD4
	85a7wIxDlFXdZ97T7Y3SIpYaD7yMfwmcYvXr9JSYNQHUS3qpEbNwZJcwkIgDLi1ZFUXTvdESc3Q
	v8q9gv4gdSpC4G96OdOU0uP0XvwwbiNyd0/4DIFr3e4xz9A2LHUjsE5KOnxQL6s4hWFqgLP52aH
	BJ4ZbghFktyg2KUmM3bgqzqYyOlhA==
X-Received: by 2002:a05:6000:178a:b0:48b:e50:714e with SMTP id ffacd0b85a97d-48e07f9801bmr5319052f8f.36.1792259551511;
        Sat, 17 Oct 2026 10:52:31 -0700 (PDT)
Received: from [192.168.1.3] ([148.252.146.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm18263626f8f.16.2026.10.17.10.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:52:31 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Sat, 17 Oct 2026 18:52:26 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: x1-denali: Add PWM backlight for LCD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-sp11-lcd-fixes-v1-2-0eb916c01a3d@gmail.com>
References: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
In-Reply-To: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Haipeng Lin <jimmie.lin@gmail.com>, Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792259546; l=3288;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=/MXkxzMgXZS7Xg8ZQdwRCV2X8M23mZIrEcttHXF0jmc=;
 b=kHD+q+obpKV0XEX9dCkeIxuxnTz8F0Vl3faCQTG+rPRMBE5hh8fbJ7PSwS9x+R8Bhnlm3oSRc
 r6jO7u61kbtCNSjd2+pG3vD2TikwTugE7Bn/9gXOspmOuusaDSS6F8B
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

The LCD variant's backlight is PWM from the PMK8550 LPG on gpio5, with
pmc8380_3 gpio10 enabling the supply and gpio4 the backlight, as on the
T14s LCD and Surface Laptop 7.

On OLED gpio4 is the panel enable, so move it and the panel compatible
out of the common dtsi.

Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
Signed-off-by: Dale Whinham <daleyo@gmail.com>
Tested-by: Haipeng Lin <jimmie.lin@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  5 ---
 .../dts/qcom/x1e80100-microsoft-denali-oled.dts    |  4 ++
 .../boot/dts/qcom/x1p64100-microsoft-denali.dts    | 47 ++++++++++++++++++++++
 3 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index 332189839606..4bce2f202fcc 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -901,13 +901,8 @@ &mdss_dp3 {
 
 	aux-bus {
 		panel: panel {
-			compatible = "edp-panel";
-			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
 			power-supply = <&vreg_edp_3p3>;
 
-			pinctrl-0 = <&edp_bl_en>;
-			pinctrl-names = "default";
-
 			port {
 				edp_panel_in: endpoint {
 					remote-endpoint = <&mdss_dp3_out>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dts b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dts
index 07ce43ccf394..a42298865dd3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dts
@@ -16,4 +16,8 @@ / {
 
 &panel {
 	compatible = "samsung,atna30dw01", "samsung,atna33xc20";
+	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&edp_bl_en>;
+	pinctrl-names = "default";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts b/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
index d96202e2afc6..68e68ca14ab1 100644
--- a/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
+++ b/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
@@ -12,4 +12,51 @@ / {
 	model = "Microsoft Surface Pro 11th Edition (LCD)";
 	compatible = "microsoft,denali-lcd", "microsoft,denali",
 		     "qcom,x1p64100", "qcom,x1e80100";
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8550_pwm 0 5000000>;
+		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vreg_edp_bl>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
+	vreg_edp_bl: regulator-edp-bl {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_BL";
+
+		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_bl_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+};
+
+&panel {
+	compatible = "edp-panel";
+	backlight = <&backlight>;
+};
+
+&pmc8380_3_gpios {
+	edp_bl_reg_en: edp-bl-reg-en-state {
+		pins = "gpio10";
+		function = "normal";
+	};
+};
+
+&pmk8550_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8550_pwm {
+	status = "okay";
 };

-- 
2.56.0

