Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792914696;
	b=Wr93faANzXpPZhnWl1mBGZTKHT3LfP59ncZP2DGwHj85UP+ninClWPtdjLR6s9g/xUu/
	 hR1LrnCkYAM2G3J/x7pxOTnsfZkdnvYpRLAgIsVbcTlF946qEnbeMComBRXUc2rsk5b1p
	 iIVwWC9BdFasAUjHmUUXI0lgf4sHo6QxfkIftK1nfpQH1a33OOHwbbKmD26LmoclD1Yai
	 0Hk+OoyFZpkcmSJ98tejcbqpe6k2NYpDIKGEkECo1MDoTH31uoRpZE0RBBhaOSWbnhvdG
	 emGulPT1Hp2pSqt9a7giZeEx0MhTOKRZe1lfvY2NzigZg7kNkiEzN4dD2IHGnHT+8fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792914696;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6zEdLvEIF4fXa7YeJ2OMBVF4Mp7t/kKVnvowoQ6qcac=;
	b=zaG3UuE0uHoQIALkTi711pA2e6CvGSw+jzMpZt9fbLXI+hQukQBLKsCFOfpl86y84N70
	 5jVuDOFMn1qM3x4tXVBkvMms5YnZx2dejWbcdxm70O8Zq7LuC08P3awIE7BarH3giUuUA
	 0x1VKqoEYmGXBwL2FXcX1dN4SQqIDEuciicONS9Zbxw8BLsAmqOKO4PJMTKIIWu4XnDF3
	 aWU8kjYhjBIAtZgPalyggukLDZH5IviULftIAvtaU+lefDS5rTo5cfNT0pqP/RkRmEKhG
	 y15qXFPYu647u/GJKEY3wSs44gmT5/R4iFR7mjvRWblK/OK3wYhnqVAd9yYbObHxJjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPpjFG6A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06432606A31A;
	Sun, 25 Oct 2026 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPpjFG6A
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792914695;
	b=0Sn7PRx25pnBOhsJKtBtXQYMo8BMnEUUM15eyHFQETuoZoxuUa1ExHTeXZsqKqaY6Sd2
	 03kCW6PiNyLvYozIPqe27roEu41dR8x9RR7D77YLRcjjvWp/+/QFgtDA6GATRYZ1nPOyY
	 bTpCYecR6iC9AhZDcVRBmiUaTkWtSah96RR3jirXHhMNTtNMkOM++jenrlk5K+uj145wW
	 5aMlkyb72u7nuh5eajkElM8wbDaGUuWLcY1/CsrOaTFXYvZRWS/9Y2mT/uIG18G1yzDxg
	 DyjX1Y52j+ZP9e5M13wDfbK/CbgbYKuUzOPBd1L1mc/eG1n0KE6KG82IEuPPo94yh1A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792914695;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6zEdLvEIF4fXa7YeJ2OMBVF4Mp7t/kKVnvowoQ6qcac=;
	b=1tba2+Pd13qWaNMOwlHdXkZ6CryG+U0q6WVaCM8seNICjNLT+1RhEBWfNl/ti9VwHj2S
	 Squ2zKQLlCpMS2c26VIrx1ONX07fnpydgPfE1M/8oWNGBSou7CNkG93dxlzN8g+Zphlby
	 X5hpmM8pUqLmJuJaNPeGRs9Gp/6jf96nOHY3LZ4IXmsmfjZujaL2BDrEnqDSNCVtXIVCn
	 iOl91UQ9yHqlNTca17R0VOjZB0/ZaOXNuwiPqfZ3t5tbC/a7psy0RYi7bG6V5abBanbTG
	 B+Vk11f4HWUI1doFsG8sXFynNEn3kaW1ZYteGoWozMSDG+7BZhWtnPh4enYUuDH81eA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E13611F01825;
	Sun, 25 Oct 2026 07:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792914695;
	bh=6zEdLvEIF4fXa7YeJ2OMBVF4Mp7t/kKVnvowoQ6qcac=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=mPpjFG6A3XeCifWZSg1OhF88h5RyvMJg1BaoMqbdotNyUBowTc+FrEF3F3je2AlPG
	 M118M3aIkDBX4BPmyMxslQNMPaIWoM0ENqLYo3s2Ra7PrUf/INM3L9xR1PzPlWi0gf
	 TXJZAgNJN3Jjac1LUaYHMkp4I+KN0dmSTM2OOugCQlr6WaR7EL5k6pck1nUQiGMkIk
	 J0q4D6YLboeY6S/LycnyTE7M3RY4u29X1fPPJMZJ90ruEUVW5sVnXH3AQ4OnM5Ty0/
	 QIB1ZIWkOCAUSLTCfE6n7pz8LMMwanzq+XiTFELgKHFyKpx6C8/rODYtZRe+r6MSCv
	 LeE+k4Q4x595A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 41594449AC;
	Sun, 25 Oct 2026 07:51:34 +0000 (UTC)
From: =?utf-8?q?S=C3=A9rgio_Ferreira_via_B4_Relay?= <devnull+ferreira.se-rg.io@kernel.org>
Date: Sun, 25 Oct 2026 08:51:26 +0100
Subject: [PATCH v2] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: Add
 PWM backlight
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
Message-Id: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43NQQ6CMBBA0as0s2YMrRUJK+9hWJR2aCcqJVNCN
 IS7GzmB2794f4NCwlSgUxsIrVw4T9ApUynwyU2RkAN0CkxtGl3XZ3xR4DxhmcUniQG1xcH5x5N
 jWtC22rnBWBvaAJWCWWjk98Hf+0pB4rJk+Ry3Vf/qn/CqUSPZa3CXxvnRmVshlHjiDP2+7182p
 QKPxwAAAA==
X-Change-ID: 20261003-medion-sprchrgd-14-backlight-481aab244d8d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Georg Gottleuber <ggo@tuxedocomputers.com>, 
 Ettore Chimenti <ek5.chimenti@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 =?utf-8?q?S=C3=A9rgio_Ferreira?= <ferreira@se-rg.io>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792914693; l=3851;
 i=ferreira@se-rg.io; s=20261003; h=from:subject:message-id;
 bh=DK0Ae6thTg7OA7ngmgwpvEPvq3pFKJcSxant/1Rrllo=;
 b=kfINOVFCEoQBZnsvo6QOfUpz1XoP9OIqpbfGpce/kaExTNwOQHO3kDz6IqLxY5NH76pujSCSF
 tDTEWSsXVRzAPbMYZhSmScUC1paLOCM2DGleZyShm682zzRLMv9WJh+
X-Developer-Key: i=ferreira@se-rg.io; a=ed25519;
 pk=Jsl0SyJyW91ZKPhUIURdD/k1q+0LKkiRvua+L5lAI4M=
X-Endpoint-Received: by B4 Relay for ferreira@se-rg.io/20261003 with
 auth_id=1104
X-Original-From: =?utf-8?q?S=C3=A9rgio_Ferreira?= <ferreira@se-rg.io>
Reply-To: ferreira@se-rg.io
Content-Transfer-Encoding: 8bit

From: Sérgio Ferreira <ferreira@se-rg.io>

The eDP panel (CSOT MNE007ZA3-2, IPS LCD) cannot have its brightness
set over eDP AUX. With no backlight phandle on the panel, panel-edp
falls back to the DP AUX backlight, which registers dp_aux_backlight
with a maximum brightness of 0, so brightness control has no effect.

Brightness is driven by PWM instead. UEFI leaves PM8550 LPG channel 3
running and the PWM output configured on PM8550 GPIO 8, and drives
PMC8380_3 GPIO 4 high as the backlight enable:

  pm8550 gpio8 : out low func1 vin-0 no pull push-pull medium
  pmc8380_3 gpio4 : out  high normal  vin-1 pull-down push-pull medium

The panel configuration in the Windows ACPI tables confirmed this.
(PMIC-controlled PWM, PMIC 1, bank 3, 9-bit, 2 kHz).

Describe this with a pwm-backlight node: enable pm8550_pwm, add pinctrl
states for the enable GPIO and for gpio8 func1, and attach the
backlight to the panel.

Tested on a Medion SPRCHRGD 14 S1 (X1E78100): brightness control over
the full range, brightness keys, suspend/resume and restore after
reboot.

Assisted-by: LLM
Signed-off-by: Sérgio Ferreira <ferreira@se-rg.io>
---
The PWM output pin was identified from the firmware-configured PMIC
state (both PM8550 GPIO 7 and 8 run func1; GPIO 8 matches a
non-inverted, full-duty backlight PWM) and verified by booting with
this pinctrl state. It was not taken from schematics, so a
confirmation from someone with board documentation would be welcome.

Changes in v2:
- Add a pinctrl state for the backlight enable GPIO (thanks Konrad Dybico)
- Link to v1: https://lore.kernel.org/r/20261003-medion-sprchrgd-14-backlight-v1-1-e47da56acfa2@se-rg.io
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20261003-medion-sprchrgd-14-backlight-v1-1-e47da56acfa2@se-rg.io
---
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index 9b599917c..91b82ef27 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -52,6 +52,15 @@ wcd938x: audio-codec {
 		#sound-dai-cells = <1>;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pm8550_pwm 3 500000>;
+		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -997,6 +1006,7 @@ &mdss_dp3 {
 	aux-bus {
 		panel {
 			compatible = "edp-panel";
+			backlight = <&backlight>;
 			power-supply = <&vreg_edp_3p3>;
 
 			port {
@@ -1084,6 +1094,11 @@ &pcie6a_port0 {
 };
 
 &pm8550_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio8";
+		function = "func1";
+	};
+
 	rtmr0_default: rtmr0-reset-n-active-state {
 		pins = "gpio10";
 		function = "normal";
@@ -1103,6 +1118,10 @@ usb0_3p3_reg_en: usb0-3p3-reg-en-state {
 	};
 };
 
+&pm8550_pwm {
+	status = "okay";
+};
+
 &pm8550ve_9_gpios {
 	usb0_1p8_reg_en: usb0-1p8-reg-en-state {
 		pins = "gpio8";
@@ -1114,6 +1133,16 @@ usb0_1p8_reg_en: usb0-1p8-reg-en-state {
 	};
 };
 
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>;
+		input-disable;
+		output-enable;
+	};
+};
+
 &pmc8380_5_gpios {
 	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 		pins = "gpio8";

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261003-medion-sprchrgd-14-backlight-481aab244d8d

Best regards,
-- 
Sérgio Ferreira <ferreira@se-rg.io>


